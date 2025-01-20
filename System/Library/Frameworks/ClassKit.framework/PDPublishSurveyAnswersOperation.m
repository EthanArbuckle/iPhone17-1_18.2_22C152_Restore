@interface PDPublishSurveyAnswersOperation
- (BOOL)_deleteDeletedEntityWithIDs:(id)a3;
- (BOOL)acceptsPayloadType:(int)a3;
- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4;
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (BOOL)stopProcessingIfResponseStatusPayloadFailed;
- (Class)expectedResponseClass;
- (NSMutableSet)deletedAnswerAssetIDs;
- (NSMutableSet)deletedAnswerItemIDs;
- (id)acceptContentType;
- (id)endpointIdentifier;
- (id)logSubsystem;
- (id)requestContentType;
- (id)requestData;
- (int)_assetCreateOrUpdatePayloadAction:(id)a3;
- (int)_convertActionToPayloadAction:(int64_t)a3;
- (void)setAnswersByError:(id)a3;
- (void)setAnswersFromServer:(id)a3;
- (void)setDeletedAnswerAssetIDs:(id)a3;
- (void)setDeletedAnswerItemIDs:(id)a3;
@end

@implementation PDPublishSurveyAnswersOperation

- (id)logSubsystem
{
  return CLSLogUpload;
}

- (BOOL)acceptsPayloadType:(int)a3
{
  return (a3 < 0x1C) & (0xE008002u >> a3);
}

- (id)endpointIdentifier
{
  return @"publishSurveyAnswers";
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

- (BOOL)stopProcessingIfResponseStatusPayloadFailed
{
  return 0;
}

- (id)requestData
{
  if ([(PDOperation *)self isFinished])
  {
    v3 = 0;
    goto LABEL_76;
  }
  v4 = [(PDOperation *)self database];
  v5 = [*(id *)((char *)&self->super.super._responseStatusError + 3) objectID];
  v101 = v4;
  v6 = sub_1000BB1D8(v4, v5);

  v104 = v6;
  if ([v6 count])
  {
    id v108 = objc_alloc_init((Class)PBDataWriter);
    v109 = objc_alloc_init(PDDPPublishSurveyAnswersRequest);
    v107 = [(PDURLRequestOperation *)self operationID];
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v7 = *(id *)(&self->super._responseStatusPayloadFailed + 3);
    id v8 = [v7 countByEnumeratingWithState:&v128 objects:v144 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v105 = *(void *)v129;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v129 != v105) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v128 + 1) + 8 * (void)v10);
          v13 = objc_alloc_init(PDDPPayload);
          [(PDDPPayload *)v13 setType:27];
          -[PDDPPayload setAction:](v13, "setAction:", -[PDPublishSurveyAnswersOperation _convertActionToPayloadAction:](self, "_convertActionToPayloadAction:", [v11 action]));
          v14 = sub_100021E90(v11);
          [(PDDPPayload *)v13 setSurveyStepAnswer:v14];

          id v15 = [v104 mutableCopy];
          v16 = [(PDDPPayload *)v13 surveyStepAnswer];
          [v16 setClassIds:v15];

          [(PDDPPublishSurveyAnswersRequest *)v109 addPayload:v13];
          [(PDDPPublishSurveyAnswersRequest *)v109 writeTo:v108];
          [(PDDPPublishSurveyAnswersRequest *)v109 clearPayloads];
          v17 = [v108 data];
          id v18 = [v17 length];
          v19 = [(PDURLRequestOperation *)self stats];
          if (v19) {
            v19[10] = v18;
          }

          v20 = [(PDURLRequestOperation *)self stats];
          if (v20) {
            ++v20[14];
          }

          CLSInitLog();
          v21 = [(PDPublishSurveyAnswersOperation *)self logSubsystem];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            v22 = objc_opt_class();
            id v23 = v22;
            [(PDDPPayload *)v13 dictionaryRepresentation];
            v25 = id v24 = v7;
            *(_DWORD *)buf = 138543874;
            v139 = v22;
            __int16 v140 = 2114;
            v141 = v107;
            __int16 v142 = 2112;
            v143 = v25;
            _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ added payload item %@ ", buf, 0x20u);

            id v7 = v24;
          }

          v10 = (char *)v10 + 1;
        }
        while (v9 != v10);
        id v9 = [v7 countByEnumeratingWithState:&v128 objects:v144 count:16];
      }
      while (v9);
    }

    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id obj = *(id *)((char *)&self->_survey + 3);
    v26 = v108;
    id v102 = [obj countByEnumeratingWithState:&v124 objects:v137 count:16];
    if (v102)
    {
      uint64_t v100 = *(void *)v125;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v125 != v100) {
            objc_enumerationMutation(obj);
          }
          uint64_t v103 = v27;
          v28 = *(void **)(*((void *)&v124 + 1) + 8 * v27);
          v29 = [v28 payloadsWithClassIDs:v104 dependencies:0];
          long long v120 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          id v30 = [v29 countByEnumeratingWithState:&v120 objects:v136 count:16];
          if (v30)
          {
            id v31 = v30;
            uint64_t v32 = *(void *)v121;
            do
            {
              v33 = 0;
              do
              {
                if (*(void *)v121 != v32) {
                  objc_enumerationMutation(v29);
                }
                v34 = *(void **)(*((void *)&v120 + 1) + 8 * (void)v33);
                objc_msgSend(v34, "setAction:", -[PDPublishSurveyAnswersOperation _assetCreateOrUpdatePayloadAction:](self, "_assetCreateOrUpdatePayloadAction:", v28));
                [(PDDPPublishSurveyAnswersRequest *)v109 addPayload:v34];
                [(PDDPPublishSurveyAnswersRequest *)v109 writeTo:v26];
                [(PDDPPublishSurveyAnswersRequest *)v109 clearPayloads];
                v35 = [v26 data];
                id v36 = [v35 length];
                v37 = [(PDURLRequestOperation *)self stats];
                if (v37) {
                  v37[10] = v36;
                }

                v38 = [(PDURLRequestOperation *)self stats];
                if (v38) {
                  ++v38[14];
                }

                CLSInitLog();
                v39 = [(PDPublishSurveyAnswersOperation *)self logSubsystem];
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                {
                  v40 = objc_opt_class();
                  id v41 = v40;
                  v42 = [v34 dictionaryRepresentation];
                  *(_DWORD *)buf = 138543874;
                  v139 = v40;
                  __int16 v140 = 2114;
                  v141 = v107;
                  __int16 v142 = 2112;
                  v143 = v42;
                  _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ added payload item %@ ", buf, 0x20u);

                  v26 = v108;
                }

                v33 = (char *)v33 + 1;
              }
              while (v31 != v33);
              id v31 = [v29 countByEnumeratingWithState:&v120 objects:v136 count:16];
            }
            while (v31);
          }

          uint64_t v27 = v103 + 1;
        }
        while ((id)(v103 + 1) != v102);
        id v102 = [obj countByEnumeratingWithState:&v124 objects:v137 count:16];
      }
      while (v102);
    }

    uint64_t v43 = objc_opt_class();
    v135[0] = @"CLSSurveyAnswerItem";
    v44 = [*(id *)((char *)&self->super.super._responseStatusError + 3) objectID];
    v135[1] = v44;
    v45 = +[NSArray arrayWithObjects:v135 count:2];
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_10007885C;
    v119[3] = &unk_1001F2758;
    v119[4] = self;
    [v101 selectAll:v43 where:@"entityName = ? and parentObjectID = ?" bindings:v45 block:v119];

    uint64_t v46 = objc_opt_class();
    v134[0] = @"CLSAsset";
    v47 = [*(id *)((char *)&self->super.super._responseStatusError + 3) objectID];
    v134[1] = v47;
    v48 = +[NSArray arrayWithObjects:v134 count:2];
    v118[0] = _NSConcreteStackBlock;
    v118[1] = 3221225472;
    v118[2] = sub_1000788C8;
    v118[3] = &unk_1001F2758;
    v118[4] = self;
    [v101 selectAll:v46 where:@"entityName = ? and parentObjectID = ?" bindings:v48 block:v118];

    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v49 = *(id *)((char *)&self->_answersFromServer + 3);
    id v50 = [v49 countByEnumeratingWithState:&v114 objects:v133 count:16];
    if (v50)
    {
      id v51 = v50;
      uint64_t v106 = *(void *)v115;
      do
      {
        for (i = 0; i != v51; i = (char *)i + 1)
        {
          if (*(void *)v115 != v106) {
            objc_enumerationMutation(v49);
          }
          uint64_t v53 = *(void *)(*((void *)&v114 + 1) + 8 * i);
          v55 = objc_alloc_init(PDDPPayload);
          [(PDDPPayload *)v55 setType:27];
          [(PDDPPayload *)v55 setAction:3];
          v56 = objc_opt_new();
          [(PDDPPayload *)v55 setSurveyStepAnswer:v56];

          v57 = [(PDDPPayload *)v55 surveyStepAnswer];
          [v57 setObjectId:v53];

          v58 = sub_100003E58(v101);
          v59 = [v58 objectID];
          v60 = [(PDDPPayload *)v55 surveyStepAnswer];
          [v60 setCreatedBy:v59];

          id v61 = [v104 copy];
          v62 = [(PDDPPayload *)v55 surveyStepAnswer];
          [v62 setClassIds:v61];

          [(PDDPPublishSurveyAnswersRequest *)v109 addPayload:v55];
          [(PDDPPublishSurveyAnswersRequest *)v109 writeTo:v108];
          [(PDDPPublishSurveyAnswersRequest *)v109 clearPayloads];
          v63 = [v108 data];
          id v64 = [v63 length];
          v65 = [(PDURLRequestOperation *)self stats];
          if (v65) {
            v65[10] = v64;
          }

          v66 = [(PDURLRequestOperation *)self stats];
          if (v66) {
            ++v66[14];
          }
        }
        id v51 = [v49 countByEnumeratingWithState:&v114 objects:v133 count:16];
      }
      while (v51);
    }

    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v67 = *(id *)((char *)&self->_answersByError + 3);
    id v68 = [v67 countByEnumeratingWithState:&v110 objects:v132 count:16];
    if (v68)
    {
      id v69 = v68;
      uint64_t v70 = *(void *)v111;
      do
      {
        for (j = 0; j != v69; j = (char *)j + 1)
        {
          if (*(void *)v111 != v70) {
            objc_enumerationMutation(v67);
          }
          uint64_t v72 = *(void *)(*((void *)&v110 + 1) + 8 * (void)j);
          v74 = objc_alloc_init(PDDPPayload);
          [(PDDPPayload *)v74 setType:15];
          [(PDDPPayload *)v74 setAction:3];
          v75 = objc_opt_new();
          [(PDDPPayload *)v74 setAsset:v75];

          v76 = [(PDDPPayload *)v74 asset];
          [v76 setObjectId:v72];

          id v77 = [v104 copy];
          v78 = [(PDDPPayload *)v74 asset];
          [v78 setClassIds:v77];

          [(PDDPPublishSurveyAnswersRequest *)v109 addPayload:v74];
          [(PDDPPublishSurveyAnswersRequest *)v109 writeTo:v108];
          [(PDDPPublishSurveyAnswersRequest *)v109 clearPayloads];
          v79 = [v108 data];
          id v80 = [v79 length];
          v81 = [(PDURLRequestOperation *)self stats];
          if (v81) {
            v81[10] = v80;
          }

          v82 = [(PDURLRequestOperation *)self stats];
          if (v82) {
            ++v82[14];
          }
        }
        id v69 = [v67 countByEnumeratingWithState:&v110 objects:v132 count:16];
      }
      while (v69);
    }

    v83 = [(PDURLRequestOperation *)self stats];
    if (v83)
    {
      uint64_t v84 = v83[14];

      v85 = v108;
      if (v84)
      {
        v86 = *(NSError **)((char *)&self->super.super._responseStatusError + 3);
        if (v86)
        {
          v87 = [v86 studentFirstSubmissionDate];

          if (!v87)
          {
            v88 = +[CLSSurvey payloadForObject:*(NSError **)((char *)&self->super.super._responseStatusError + 3) action:2 database:v101];
            [(PDDPPublishSurveyAnswersRequest *)v109 addPayload:v88];
            [(PDDPPublishSurveyAnswersRequest *)v109 writeTo:v108];
            [(PDDPPublishSurveyAnswersRequest *)v109 clearPayloads];
            v89 = [v108 data];
            id v90 = [v89 length];
            v91 = [(PDURLRequestOperation *)self stats];
            if (v91) {
              v91[10] = v90;
            }

            v92 = [(PDURLRequestOperation *)self stats];
            if (v92) {
              ++v92[14];
            }

            CLSInitLog();
            v93 = [(PDPublishSurveyAnswersOperation *)self logSubsystem];
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
            {
              v95 = objc_opt_class();
              id v96 = v95;
              v97 = [v88 dictionaryRepresentation];
              *(_DWORD *)buf = 138543874;
              v139 = v95;
              __int16 v140 = 2114;
              v141 = v107;
              __int16 v142 = 2112;
              v143 = v97;
              _os_log_debug_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ added payload item %@ ", buf, 0x20u);
            }
          }
        }
        v3 = [v108 immutableData];
        goto LABEL_74;
      }
    }
    else
    {
      v85 = v108;
    }
    [(PDEndpointRequestOperation *)self markAsFinished];
    v3 = 0;
LABEL_74:

    goto LABEL_75;
  }
  v94 = +[NSError cls_createErrorWithCode:2 description:@"missing classID."];
  [(PDOperation *)self finishWithError:v94];

  v3 = 0;
LABEL_75:

LABEL_76:

  return v3;
}

- (BOOL)processResponseObject:(id)a3 error:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PDPublishSurveyAnswersOperation;
  BOOL v5 = [(PDAbstractClassZoneOperation *)&v12 processResponseObject:a3 error:a4];
  if (v5)
  {
    v6 = [*(id *)((char *)&self->_answersFromServer + 3) setByAddingObjectsFromSet:*(NSMutableDictionary **)((char *)&self->_answersByError + 3)];
    if ([v6 count])
    {
      id v7 = [v6 allObjects];
      unsigned __int8 v8 = [(PDPublishSurveyAnswersOperation *)self _deleteDeletedEntityWithIDs:v7];

      if ((v8 & 1) == 0)
      {
        CLSInitLog();
        id v9 = [(PDPublishSurveyAnswersOperation *)self logSubsystem];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v11 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to remove deleted survey answer from PDDeletedEntityID table", v11, 2u);
        }
      }
    }
  }
  return v5;
}

- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PDPublishSurveyAnswersOperation;
  BOOL v7 = [(PDAbstractClassZoneOperation *)&v37 processPayloadFromResponse:v6 error:a4];
  if ([v6 type] == 27)
  {
    unsigned __int8 v8 = [v6 surveyStepAnswer];
    id v9 = sub_1000220E4(v8);

    if (!v9)
    {
      CLSInitLog();
      id v9 = [(PDPublishSurveyAnswersOperation *)self logSubsystem];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = objc_opt_class();
        id v28 = v27;
        v29 = [(PDURLRequestOperation *)self operationID];
        id v30 = [v6 dictionaryRepresentation];
        *(_DWORD *)buf = 138543874;
        v39 = v27;
        __int16 v40 = 2114;
        id v41 = v29;
        __int16 v42 = 2112;
        uint64_t v43 = v30;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ ignoring response payload item %@ due to invalid converted object", buf, 0x20u);
      }
      LOBYTE(v7) = 0;
      goto LABEL_24;
    }
    if ([v6 hasStatus])
    {
      v10 = [v6 status];
      BOOL v11 = [v10 code] != 1;

      if (!v7) {
        goto LABEL_12;
      }
    }
    else
    {
      BOOL v11 = 0;
      if (!v7) {
        goto LABEL_12;
      }
    }
    if (!v11)
    {
      [*(id *)((char *)&self->_answers + 3) addObject:v9];
LABEL_24:

      goto LABEL_25;
    }
LABEL_12:
    objc_super v12 = [v6 status];

    if (v12)
    {
      if (!*(NSArray **)((char *)&self->_assets + 3))
      {
        v13 = (NSArray *)objc_opt_new();
        v14 = *(NSArray **)((char *)&self->_assets + 3);
        *(NSArray **)((char *)&self->_assets + 3) = v13;
      }
      id v15 = [v6 status];
      v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", sub_1000F4EF8((int)[v15 code]));
      v17 = [v16 stringValue];

      CLSInitLog();
      id v18 = [(PDPublishSurveyAnswersOperation *)self logSubsystem];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v31 = objc_opt_class();
        id v36 = v31;
        uint64_t v32 = [(PDURLRequestOperation *)self operationID];
        uint64_t v33 = [v6 dictionaryRepresentation];
        id v34 = *a4;
        *(_DWORD *)buf = 138544386;
        v39 = v31;
        __int16 v40 = 2114;
        id v41 = v32;
        __int16 v42 = 2112;
        uint64_t v43 = v17;
        __int16 v44 = 2112;
        uint64_t v45 = v33;
        v35 = (void *)v33;
        __int16 v46 = 2112;
        id v47 = v34;
        _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ errorKey %@ for payload item %@ with error %@", buf, 0x34u);
      }
      v19 = [*(id *)((char *)&self->_assets + 3) objectForKey:v17];

      if (v19)
      {
        id v20 = [*(id *)((char *)&self->_assets + 3) valueForKey:v17];
        [v20 addObject:v9];
      }
      else
      {
        id v20 = objc_alloc_init((Class)NSMutableArray);
        [v20 addObject:v9];
        [*(id *)((char *)&self->_assets + 3) setObject:v20 forKey:v17];
      }
    }
    else
    {
      CLSInitLog();
      v17 = [(PDPublishSurveyAnswersOperation *)self logSubsystem];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v21 = objc_opt_class();
        id v22 = v21;
        id v23 = [(PDURLRequestOperation *)self operationID];
        id v24 = [v6 dictionaryRepresentation];
        id v25 = *a4;
        *(_DWORD *)buf = 138544130;
        v39 = v21;
        __int16 v40 = 2114;
        id v41 = v23;
        __int16 v42 = 2112;
        uint64_t v43 = v24;
        __int16 v44 = 2112;
        uint64_t v45 = (uint64_t)v25;
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ ignoring response payload item %@ with error %@", buf, 0x2Au);
      }
    }

    goto LABEL_24;
  }
LABEL_25:

  return v7;
}

- (BOOL)_deleteDeletedEntityWithIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = +[PDDeletedEntityID identityColumnName];
    id v6 = [v5 stringByAppendingString:@" in "];

    BOOL v7 = +[PDDatabase whereSQLForArray:v4 prefix:v6];

    unsigned __int8 v8 = [(PDOperation *)self database];
    unsigned __int8 v9 = [v8 deleteAll:objc_opt_class() where:v7 bindings:v4];
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (int)_convertActionToPayloadAction:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    return 1;
  }
  else {
    return a3;
  }
}

- (int)_assetCreateOrUpdatePayloadAction:(id)a3
{
  if ([a3 hasNotBeenRereferencedByServer]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)setAnswersFromServer:(id)a3
{
}

- (void)setAnswersByError:(id)a3
{
}

- (NSMutableSet)deletedAnswerItemIDs
{
  return *(NSMutableSet **)((char *)&self->_answersFromServer + 3);
}

- (void)setDeletedAnswerItemIDs:(id)a3
{
}

- (NSMutableSet)deletedAnswerAssetIDs
{
  return *(NSMutableSet **)((char *)&self->_answersByError + 3);
}

- (void)setDeletedAnswerAssetIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_answersByError + 3), 0);
  objc_storeStrong((id *)((char *)&self->_answersFromServer + 3), 0);
  objc_storeStrong((id *)((char *)&self->_assets + 3), 0);
  objc_storeStrong((id *)((char *)&self->_answers + 3), 0);
  objc_storeStrong((id *)((char *)&self->_survey + 3), 0);
  objc_storeStrong((id *)(&self->super._responseStatusPayloadFailed + 3), 0);

  objc_storeStrong((id *)((char *)&self->super.super._responseStatusError + 3), 0);
}

@end