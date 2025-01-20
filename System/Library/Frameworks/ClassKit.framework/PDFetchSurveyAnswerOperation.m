@interface PDFetchSurveyAnswerOperation
- (BOOL)_deleteAnswersWithSurveyIDs:(id)a3;
- (BOOL)acceptsPayloadType:(int)a3;
- (BOOL)allowMixedResponseStatusCode;
- (BOOL)processPayloadStatus:(id)a3 allowMixedResponse:(BOOL)a4 error:(id *)a5;
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (BOOL)stopProcessingIfResponseStatusPayloadFailed;
- (Class)expectedResponseClass;
- (id)acceptContentType;
- (id)endpointIdentifier;
- (id)logSubsystem;
- (id)requestContentType;
- (id)requestData;
@end

@implementation PDFetchSurveyAnswerOperation

- (id)logSubsystem
{
  return CLSLogHandout;
}

- (BOOL)acceptsPayloadType:(int)a3
{
  return (a3 < 0x1C) & (0x8008002u >> a3);
}

- (id)endpointIdentifier
{
  return @"queryEntities";
}

- (id)requestContentType
{
  return @"application/x-protobuf";
}

- (id)acceptContentType
{
  return @"application/x-protobuf";
}

- (Class)expectedResponseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)allowMixedResponseStatusCode
{
  return 1;
}

- (BOOL)stopProcessingIfResponseStatusPayloadFailed
{
  return 0;
}

- (id)requestData
{
  v3 = *(void **)(&self->super._responseStatusPayloadFailed + 3);
  if (v3 && [v3 count]
    || (v4 = *(NSError **)((char *)&self->super.super._responseStatusError + 3)) != 0 && [v4 count])
  {
    v30 = objc_alloc_init(PDDPQueryRequest);
    v5 = [*(id *)(&self->super._responseStatusPayloadFailed + 3) firstObject];
    v6 = [(PDOperation *)self database];
    v29 = v5;
    v7 = sub_1000BB1D8(v6, v5);

    if ([v7 count])
    {
      v8 = objc_alloc_init(PDDPSchoolworkQueryZone);
      uint64_t v9 = [(PDEndpointRequestOperation *)self endpointInfo];
      v10 = (void *)v9;
      if (v9) {
        uint64_t v11 = *(unsigned int *)(v9 + 64);
      }
      else {
        uint64_t v11 = 0;
      }
      [(PDDPSchoolworkQueryZone *)v8 setLimit:v11];

      v12 = [v7 firstObject];
      uint64_t v13 = +[NSString stringWithFormat:@"%@-%@", @"Class-Answer", v12];

      v28 = (void *)v13;
      [(PDDPSchoolworkQueryZone *)v8 setZoneName:v13];
      [(PDDPQueryRequest *)v30 setQueryZone:v8];
      v14 = objc_alloc_init(PDDPSchoolworkSearchQuery);
      [(PDDPSchoolworkSearchQuery *)v14 setType:1];
      if (*(void *)(&self->super._responseStatusPayloadFailed + 3))
      {
        v15 = objc_alloc_init(PDDPSchoolworkSearchQuery);
        [(PDDPSchoolworkSearchQuery *)v15 setType:3];
        v16 = objc_alloc_init(PDDPSchoolworkSearchCriteria);
        [(PDDPSchoolworkSearchCriteria *)v16 setFieldName:@"survey_id"];
        [(PDDPSchoolworkSearchCriteria *)v16 setSearchOperator:7];
        v17 = objc_alloc_init(PDDPTypedValue);
        id v18 = [*(id *)(&self->super._responseStatusPayloadFailed + 3) mutableCopy];
        [(PDDPTypedValue *)v17 setStringListValues:v18];

        [(PDDPTypedValue *)v17 setType:2];
        [(PDDPSchoolworkSearchCriteria *)v16 setValue:v17];
        [(PDDPSchoolworkSearchQuery *)v15 setCriteria:v16];
        [(PDDPSchoolworkSearchQuery *)v14 addContents:v15];
      }
      if (*(NSError **)((char *)&self->super.super._responseStatusError + 3))
      {
        v19 = objc_alloc_init(PDDPSchoolworkSearchQuery);
        [(PDDPSchoolworkSearchQuery *)v19 setType:3];
        v20 = objc_alloc_init(PDDPSchoolworkSearchCriteria);
        [(PDDPSchoolworkSearchCriteria *)v20 setFieldName:@"created_by"];
        [(PDDPSchoolworkSearchCriteria *)v20 setSearchOperator:7];
        v21 = objc_alloc_init(PDDPTypedValue);
        id v22 = [*(id *)((char *)&self->super.super._responseStatusError + 3) mutableCopy];
        [(PDDPTypedValue *)v21 setStringListValues:v22];

        [(PDDPTypedValue *)v21 setType:2];
        [(PDDPSchoolworkSearchCriteria *)v20 setValue:v21];
        [(PDDPSchoolworkSearchQuery *)v19 setCriteria:v20];
        [(PDDPSchoolworkSearchQuery *)v14 addContents:v19];
      }
      v23 = objc_alloc_init(PDDPSchoolworkSearchQuery);
      [(PDDPSchoolworkSearchQuery *)v23 setType:3];
      v24 = objc_alloc_init(PDDPSchoolworkSearchCriteria);
      [(PDDPSchoolworkSearchCriteria *)v24 setFieldName:@"record_type"];
      [(PDDPSchoolworkSearchCriteria *)v24 setSearchOperator:2];
      v25 = objc_alloc_init(PDDPTypedValue);
      [(PDDPTypedValue *)v25 setStringValue:@"surveystepanswer"];
      [(PDDPTypedValue *)v25 setType:1];
      [(PDDPSchoolworkSearchCriteria *)v24 setValue:v25];
      [(PDDPSchoolworkSearchQuery *)v23 setCriteria:v24];
      [(PDDPSchoolworkSearchQuery *)v14 addContents:v23];
      [(PDDPQueryRequest *)v30 setFilterQuery:v14];
      v26 = [(PDDPQueryRequest *)v30 data];
    }
    else
    {
      v8 = +[NSError cls_createErrorWithCode:2 description:@"survey missing class ID."];
      [(PDOperation *)self finishWithError:v8];
      v26 = 0;
    }
  }
  else
  {
    [(PDEndpointRequestOperation *)self markAsFinished];
    v26 = 0;
  }

  return v26;
}

- (BOOL)processResponseObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PDOperation *)self isAborted])
  {
    BOOL v7 = 0;
  }
  else
  {
    CLSInitLog();
    v8 = [(PDFetchSurveyAnswerOperation *)self logSubsystem];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = v9;
      uint64_t v11 = [(PDURLRequestOperation *)self operationID];
      int v16 = 138543618;
      v17 = v9;
      __int16 v18 = 2114;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ processing response;",
        (uint8_t *)&v16,
        0x16u);
    }
    [(PDFetchSurveyAnswerOperation *)self _deleteAnswersWithSurveyIDs:*(void *)(&self->super._responseStatusPayloadFailed + 3)];
    v12 = [v6 queryPayloads];
    id v13 = [v12 count];
    v14 = [(PDURLRequestOperation *)self stats];
    if (v14) {
      v14[15] = v13;
    }

    BOOL v7 = [(PDAbstractClassZoneOperation *)self processPayloadsFromResponse:v12 error:a4];
  }

  return v7;
}

- (BOOL)processPayloadStatus:(id)a3 allowMixedResponse:(BOOL)a4 error:(id *)a5
{
  v8 = [a3 status];
  if ([v8 hasInternalMessage])
  {
    CLSInitLog();
    uint64_t v9 = [(PDFetchSurveyAnswerOperation *)self logSubsystem];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v15 = objc_opt_class();
      id v23 = v15;
      int v16 = [(PDURLRequestOperation *)self operationID];
      unsigned int v17 = [v8 code];
      __int16 v18 = [v8 message];
      v19 = [v8 internalMessage];
      *(_DWORD *)buf = 138544386;
      v25 = v15;
      __int16 v26 = 2114;
      v27 = v16;
      __int16 v28 = 1024;
      *(_DWORD *)v29 = v17;
      *(_WORD *)&v29[4] = 2112;
      *(void *)&v29[6] = v18;
      __int16 v30 = 2112;
      v31 = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ status code: %d message: %@ internal message:%@", buf, 0x30u);
    }
  }
  if (-[PDAbstractClassZoneOperation shouldProcessPayloadWithStatusCode:](self, "shouldProcessPayloadWithStatusCode:", [v8 code]))
  {
    goto LABEL_6;
  }
  if ([v8 code] == 801)
  {
LABEL_14:
    BOOL v10 = 0;
    goto LABEL_15;
  }
  uint64_t v11 = sub_1000F51A0(v8, a4);
  if (v11)
  {
    v12 = (void *)v11;
    [(PDEndpointRequestOperation *)self setResponseStatusError:v11];
    if (a5) {
      *a5 = v12;
    }
    CLSInitLog();
    id v13 = [(PDFetchSurveyAnswerOperation *)self logSubsystem];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      id v21 = v20;
      id v22 = [(PDURLRequestOperation *)self operationID];
      *(_DWORD *)buf = 138543874;
      v25 = v20;
      __int16 v26 = 2114;
      v27 = v22;
      __int16 v28 = 2114;
      *(void *)v29 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ assignment request errored: %{public}@;",
        buf,
        0x20u);
    }
    goto LABEL_14;
  }
LABEL_6:
  BOOL v10 = 1;
LABEL_15:

  return v10;
}

- (BOOL)_deleteAnswersWithSurveyIDs:(id)a3
{
  id v4 = a3;
  v5 = +[PDDatabase whereSQLForArray:v4 prefix:@"state = 2 and surveyID in "];
  id v6 = [(PDOperation *)self database];
  unsigned __int8 v7 = [v6 deleteAll:objc_opt_class() where:v5 bindings:v4];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->super._responseStatusPayloadFailed + 3), 0);

  objc_storeStrong((id *)((char *)&self->super.super._responseStatusError + 3), 0);
}

@end