@interface PDAbstractClassZoneOperation
+ (id)serviceID;
- (BOOL)_deleteDraftAnswer:(id)a3;
- (BOOL)_deleteEntity:(Class)a3 identity:(id)a4;
- (BOOL)_deleteStateChanges:(id)a3;
- (BOOL)_deleteSurvey:(id)a3;
- (BOOL)_deleteSurveyStep:(id)a3;
- (BOOL)_deleteWithPayload:(id)a3 error:(id *)a4;
- (BOOL)_insertOrUpdateArchivedHandout:(id)a3;
- (BOOL)_insertOrUpdateArchivedSurveyStep:(id)a3;
- (BOOL)_insertOrUpdateCollectionItem:(id)a3;
- (BOOL)_insertOrUpdateEntity:(id)a3;
- (BOOL)_insertOrUpdateSurveyAnswer:(id)a3;
- (BOOL)_insertOrUpdateSurveyStep:(id)a3;
- (BOOL)acceptsPayloadType:(int)a3;
- (BOOL)allowMixedResponseStatusCode;
- (BOOL)deleteClassWithObjectID:(id)a3 deletePersons:(BOOL)a4;
- (BOOL)deleteCollectionItemsWithReferenceObjectID:(id)a3;
- (BOOL)deleteHandoutWithObjectID:(id)a3 shouldDeleteDrafts:(BOOL)a4;
- (BOOL)hasBigResponses;
- (BOOL)parseStreamedResponse:(id)a3;
- (BOOL)processAttachment:(id)a3;
- (BOOL)processAuthorizationStatus:(id)a3;
- (BOOL)processCompletionStatus:(id)a3;
- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4;
- (BOOL)processPayloadStatus:(id)a3 allowMixedResponse:(BOOL)a4 error:(id *)a5;
- (BOOL)processPayloadWithinWriteTransaction:(id)a3 error:(id *)a4 stop:(BOOL *)a5;
- (BOOL)processPayloadsFromResponse:(id)a3 error:(id *)a4;
- (BOOL)processResponse:(id *)a3;
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (BOOL)processStateChange:(id)a3 error:(id *)a4;
- (BOOL)readStreamablePayload:(id)a3 reader:(id)a4 error:(id *)a5;
- (BOOL)resolveMissingEntityWithObjectID:(id)a3;
- (BOOL)setCompletionStatus:(int)a3 forAttachment:(id)a4 locked:(BOOL)a5 dateCompleted:(id)a6 dateModified:(id)a7;
- (BOOL)shouldProcessPayloadWithStatusCode:(int)a3;
- (BOOL)stopProcessingIfResponseStatusPayloadFailed;
- (BOOL)updateCollectionItemsReferenceObjectID:(id)a3 toType:(int64_t)a4 andObjectID:(id)a5;
- (BOOL)validateStateChangePayload:(id)a3 error:(id *)a4;
- (Class)streamablePayloadClass;
- (id)_applyStateChangesToParentHandoutEntity:(id)a3;
- (int64_t)streamablePayloadClassTagValue;
- (void)_setAuthorizationForAttachmentWithObjectID:(id)a3 shouldAuthorize:(BOOL)a4;
- (void)logPayloadBeforeProcessing:(id)a3;
- (void)setCompletionAndLockedStatusForStateChange:(id)a3 andStateChangePayload:(id)a4 forAttachment:(id)a5;
- (void)setHandoutClosedStatusForStateChange:(id)a3 andStateChangePayload:(id)a4 forHandout:(id)a5;
@end

@implementation PDAbstractClassZoneOperation

+ (id)serviceID
{
  return @"orion";
}

- (BOOL)allowMixedResponseStatusCode
{
  return 0;
}

- (BOOL)shouldProcessPayloadWithStatusCode:(int)a3
{
  return a3 == 1;
}

- (BOOL)acceptsPayloadType:(int)a3
{
  return 1;
}

- (Class)streamablePayloadClass
{
  return (Class)objc_opt_class();
}

- (int64_t)streamablePayloadClassTagValue
{
  return 1;
}

- (BOOL)readStreamablePayload:(id)a3 reader:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(PDAbstractClassZoneOperation *)self streamablePayloadClass];
  if (objc_opt_isKindOfClass())
  {
    char v10 = sub_1001292AC((uint64_t)v8, (uint64_t)v9);
  }
  else
  {
    CLSInitLog();
    v11 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_ERROR))
    {
      v13 = v11;
      *(_DWORD *)buf = 138412290;
      id v16 = (id)objc_opt_class();
      id v14 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Parse Error! Cannot read streamed response payloads of type '%@'!", buf, 0xCu);
    }
    +[NSError cls_assignError:a5, 300, @"Cannot read streamed responses containing payloads of type '%@'!", objc_opt_class() code format];
    char v10 = 0;
  }

  return v10;
}

- (BOOL)hasBigResponses
{
  return 1;
}

- (BOOL)parseStreamedResponse:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDAbstractClassZoneOperation;
  unsigned int v4 = [(PDEndpointRequestOperation *)&v6 parseStreamedResponse:a3];
  if (BYTE2(self->super._responseStatusError)) {
    v4 &= ~[(PDAbstractClassZoneOperation *)self stopProcessingIfResponseStatusPayloadFailed];
  }
  return v4;
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
    id v8 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = objc_opt_class();
      id v10 = v9;
      v11 = [(PDURLRequestOperation *)self operationID];
      int v16 = 138543618;
      v17 = v9;
      __int16 v18 = 2114;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ processing response;",
        (uint8_t *)&v16,
        0x16u);
    }
    v12 = [v6 payloads];
    id v13 = [v12 count];
    id v14 = [(PDURLRequestOperation *)self stats];
    if (v14) {
      v14[15] = v13;
    }

    BOOL v7 = [(PDAbstractClassZoneOperation *)self processPayloadsFromResponse:v12 error:a4];
  }

  return v7;
}

- (BOOL)processPayloadWithinWriteTransaction:(id)a3 error:(id *)a4 stop:(BOOL *)a5
{
  id v8 = a3;
  if ([(PDOperation *)self isAborted])
  {
    LOBYTE(v9) = 0;
    *a5 = 1;
  }
  else
  {
    id v10 = v8;
    unsigned int v9 = [(PDAbstractClassZoneOperation *)self processPayloadFromResponse:v10 error:a4];
    v11 = [(PDURLRequestOperation *)self stats];
    sub_100092C1C((uint64_t)v11, (uint64_t)[v10 type], v9);

    if ((v9 & 1) == 0)
    {
      CLSInitLog();
      v12 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v14 = objc_opt_class();
        id v15 = v14;
        int v16 = [(PDURLRequestOperation *)self operationID];
        id v17 = *a4;
        int v18 = 138543874;
        v19 = v14;
        __int16 v20 = 2114;
        v21 = v16;
        __int16 v22 = 2114;
        id v23 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ failed to process payload: %{public}@", (uint8_t *)&v18, 0x20u);
      }
    }
    if (BYTE2(self->super._responseStatusError)
      && [(PDAbstractClassZoneOperation *)self stopProcessingIfResponseStatusPayloadFailed])
    {
      *a5 = 1;
      if (a4) {
        [(PDEndpointRequestOperation *)self setResponseStatusError:*a4];
      }
      LOBYTE(v9) = 0;
    }
    else if (a4)
    {
      *a4 = 0;
    }
  }
  return v9;
}

- (BOOL)stopProcessingIfResponseStatusPayloadFailed
{
  return 1;
}

- (BOOL)processResponse:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PDAbstractClassZoneOperation;
  BOOL v5 = -[PDEndpointRequestOperation processResponse:](&v11, "processResponse:");
  if (BYTE2(self->super._responseStatusError)
    && [(PDAbstractClassZoneOperation *)self stopProcessingIfResponseStatusPayloadFailed])
  {
    if (a3)
    {
      *a3 = [(PDEndpointRequestOperation *)self responseStatusError];
    }
    CLSInitLog();
    id v6 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = objc_opt_class();
      id v8 = v7;
      unsigned int v9 = [(PDURLRequestOperation *)self operationID];
      *(_DWORD *)buf = 138543618;
      id v13 = v7;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ response processing terminated by failed status.", buf, 0x16u);
    }
    return 0;
  }
  return v5;
}

- (BOOL)processPayloadsFromResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PDOperation *)self isAborted])
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = sub_10000B664;
    int v18 = sub_10000B54C;
    id v19 = 0;
    id v8 = [(PDOperation *)self database];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000561D4;
    v11[3] = &unk_1001F2E38;
    v11[4] = self;
    id v12 = v6;
    id v13 = &v14;
    if (v8) {
      unsigned __int8 v7 = [v8 performTransaction:v11 forWriting:1];
    }
    else {
      unsigned __int8 v7 = 0;
    }

    unsigned int v9 = (void *)v15[5];
    if (v9)
    {
      unsigned __int8 v7 = 0;
      if (a4) {
        *a4 = v9;
      }
    }

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

- (void)logPayloadBeforeProcessing:(id)a3
{
  id v4 = a3;
  CLSInitLog();
  BOOL v5 = [(PDOperation *)self logSubsystem];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (id)objc_opt_class();
    id v7 = [(PDURLRequestOperation *)self operationID];
    id v8 = [v4 type];
    if v8 < 0x27 && ((0x7FFFFE91DFuLL >> (char)v8))
    {
      unsigned int v9 = *(&off_1001F3080 + (int)v8);
    }
    else
    {
      unsigned int v9 = +[NSString stringWithFormat:@"(unknown: %i)", v8];
    }
    id v10 = [v4 dictionaryRepresentation];
    *(_DWORD *)buf = 138544130;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    int v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ Processing payload type: %{public}@\n    payload: %@", buf, 0x2Au);
  }
}

- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PDOperation *)self isAborted])
  {
LABEL_2:
    LOBYTE(v7) = 0;
    goto LABEL_25;
  }
  if (!-[PDAbstractClassZoneOperation acceptsPayloadType:](self, "acceptsPayloadType:", [v6 type]))
  {
    CLSInitLog();
    id v8 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = (id)objc_opt_class();
      id v10 = [(PDURLRequestOperation *)self operationID];
      id v11 = [v6 type];
      if v11 < 0x27 && ((0x7FFFFE91DFuLL >> (char)v11))
      {
        id v12 = *(&off_1001F3080 + (int)v11);
      }
      else
      {
        id v12 = +[NSString stringWithFormat:@"(unknown: %i)", v11];
      }
      *(_DWORD *)buf = 138543874;
      id v77 = v9;
      __int16 v78 = 2114;
      id v79 = v10;
      __int16 v80 = 2114;
      id v81 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ Ignoring payload type: %{public}@", buf, 0x20u);

      goto LABEL_23;
    }
LABEL_24:

    LOBYTE(v7) = 1;
    goto LABEL_25;
  }
  [(PDAbstractClassZoneOperation *)self logPayloadBeforeProcessing:v6];
  if ([v6 type] == 1)
  {
    LOBYTE(v7) = 1;
    if ([(PDAbstractClassZoneOperation *)self processPayloadStatus:v6 allowMixedResponse:[(PDAbstractClassZoneOperation *)self allowMixedResponseStatusCode] error:a4])
    {
      goto LABEL_25;
    }
    BYTE2(self->super._responseStatusError) = 1;
    goto LABEL_2;
  }
  if (![v6 action])
  {
    CLSInitLog();
    id v8 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __int16 v13 = objc_opt_class();
      id v9 = v13;
      id v10 = [(PDURLRequestOperation *)self operationID];
      id v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 action]);
      __int16 v15 = [v6 dictionaryRepresentation];
      *(_DWORD *)buf = 138544130;
      id v77 = v13;
      __int16 v78 = 2114;
      id v79 = v10;
      __int16 v80 = 2114;
      id v81 = v14;
      __int16 v82 = 2112;
      v83 = v15;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ unknown action: %{public}@; payload: %@",
        buf,
        0x2Au);

LABEL_23:
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if ([v6 action] == 3)
  {
    LOBYTE(v7) = [(PDAbstractClassZoneOperation *)self _deleteWithPayload:v6 error:a4];
  }
  else if (![(PDAbstractClassZoneOperation *)self allowMixedResponseStatusCode] {
         || ![v6 hasStatus]
  }
         || (LOBYTE(v7) = 0,
             [(PDAbstractClassZoneOperation *)self processPayloadStatus:v6 allowMixedResponse:0 error:a4]))
  {
    uint64_t v16 = [(PDOperation *)self database];
    id v17 = *a4;
    switch([v6 type])
    {
      case 2u:
        id v7 = [v6 handout];
        id v19 = sub_10001FC3C(v7);

        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472;
        v73[2] = sub_100057488;
        v73[3] = &unk_1001F1ED8;
        v73[4] = self;
        id v74 = v19;
        id v20 = v19;
        [v16 withSyncEnabled:v73];
        LOBYTE(v7) = [(PDAbstractClassZoneOperation *)self _insertOrUpdateEntity:v20];

        goto LABEL_74;
      case 3u:
        id v20 = [v6 attachment];
        unsigned __int8 v22 = [(PDAbstractClassZoneOperation *)self processAttachment:v20];
        goto LABEL_73;
      case 4u:
        id v7 = [v6 recipient];
        sub_1000207D4(v7);
        id v20 = (id)objc_claimAutoreleasedReturnValue();

        LODWORD(v7) = [(PDAbstractClassZoneOperation *)self _insertOrUpdateEntity:v20];
        if (!v7) {
          goto LABEL_74;
        }
        id v23 = [v20 personID];
        uint64_t v24 = objc_opt_class();
        v25 = [v20 objectID];
        [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v23 forClass:v24 fromEntityWithID:v25 withClass:objc_opt_class()];

        v26 = [v20 classID];
        uint64_t v27 = objc_opt_class();
        v28 = [v20 objectID];
        [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v26 forClass:v27 fromEntityWithID:v28 withClass:objc_opt_class()];

        goto LABEL_82;
      case 6u:
        v33 = [v6 classInfo];
        uint64_t v34 = sub_10007A010(v33);
        goto LABEL_72;
      case 7u:
        v33 = [v6 person];
        uint64_t v34 = sub_100079604(v33);
        goto LABEL_72;
      case 8u:
        v33 = [v6 classMember];
        uint64_t v34 = sub_10007A384(v33);
        goto LABEL_72;
      case 0xFu:
        id v7 = [v6 asset];
        v35 = sub_1000253D4(v7, v16);

        LODWORD(v7) = [(PDAbstractClassZoneOperation *)self _insertOrUpdateEntity:v35];
        if (!v7) {
          goto LABEL_90;
        }
        id v36 = [v35 parentEntityClass];
        if (v36)
        {
          id v37 = v36;
          v38 = [v35 parentObjectID];
          [v35 objectID];
          v39 = v65 = v35;
          [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v38 forClass:v37 fromEntityWithID:v39 withClass:objc_opt_class()];

          v35 = v65;
        }
        if ([v35 type] != (id)3) {
          goto LABEL_90;
        }
        if (sub_100153B04((BOOL)v16, v35))
        {
          CLSInitLog();
          v40 = [(PDOperation *)self logSubsystem];
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
            goto LABEL_89;
          }
          v41 = objc_opt_class();
          id v66 = v41;
          [v35 objectID];
          v43 = v42 = v35;
          *(_DWORD *)buf = 138543618;
          id v77 = v41;
          __int16 v78 = 2114;
          id v79 = v43;
          v44 = "%{public}@: Not prefetching asset from completed handout: assetID %{public}@;";
        }
        else
        {
          sub_100125850((uint64_t)PDFileSyncManager, v35, v16);
          CLSInitLog();
          v40 = [(PDOperation *)self logSubsystem];
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
            goto LABEL_89;
          }
          v64 = objc_opt_class();
          id v66 = v64;
          [v35 objectID];
          v43 = v42 = v35;
          *(_DWORD *)buf = 138543618;
          id v77 = v64;
          __int16 v78 = 2114;
          id v79 = v43;
          v44 = "%{public}@: Prefetching asset: assetID %{public}@;";
        }
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, v44, buf, 0x16u);

        v35 = v42;
LABEL_89:

LABEL_90:
        goto LABEL_75;
      case 0x11u:
        id v20 = [v6 authStatus];
        unsigned __int8 v22 = [(PDAbstractClassZoneOperation *)self processAuthorizationStatus:v20];
        goto LABEL_73;
      case 0x12u:
        id v20 = [v6 completionStatus];
        unsigned __int8 v22 = [(PDAbstractClassZoneOperation *)self processCompletionStatus:v20];
        goto LABEL_73;
      case 0x13u:
        v45 = [v6 stateChange];
        id v72 = v17;
        LOBYTE(v7) = [(PDAbstractClassZoneOperation *)self processStateChange:v45 error:&v72];
        id v46 = v72;

        id v17 = v46;
        goto LABEL_75;
      case 0x14u:
        v47 = [v6 collection];
        sub_100023BCC(v47);
        id v20 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v48 = objc_opt_class();
        v49 = [v20 objectID];
        v26 = [v16 select:v48 identity:v49];

        if (v26 && ([v20 isEqual:v26] & 1) != 0) {
          LOBYTE(v7) = 1;
        }
        else {
          LOBYTE(v7) = [(PDAbstractClassZoneOperation *)self _insertOrUpdateEntity:v20];
        }
        goto LABEL_82;
      case 0x15u:
        id v20 = [v6 collectionItem];
        sub_100024274(v20);
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        v26 = (id)objc_claimAutoreleasedReturnValue();
        id v50 = [v26 countByEnumeratingWithState:&v68 objects:v75 count:16];
        if (!v50) {
          goto LABEL_57;
        }
        id v51 = v50;
        uint64_t v52 = *(void *)v69;
        break;
      case 0x16u:
        v54 = [v6 handout];
        sub_1000244B8(v54);
        id v20 = (id)objc_claimAutoreleasedReturnValue();

        unsigned __int8 v22 = [(PDAbstractClassZoneOperation *)self _insertOrUpdateArchivedHandout:v20];
        goto LABEL_73;
      case 0x17u:
        v33 = [v6 attachment];
        uint64_t v34 = sub_100024694(v33);
        goto LABEL_72;
      case 0x18u:
        v55 = [v6 asset];
        sub_100024A50(v55, v16);
        id v20 = (id)objc_claimAutoreleasedReturnValue();

        id v7 = objc_opt_class();
        v56 = [v20 objectID];
        unsigned __int8 v57 = [v16 entityExistsByClass:v7 identity:v56];

        LODWORD(v7) = [(PDAbstractClassZoneOperation *)self _insertOrUpdateEntity:v20];
        if (v7 && (v57 & 1) == 0 && [v20 type] == (id)3) {
          sub_100125850((uint64_t)PDFileSyncManager, v20, v16);
        }
        goto LABEL_74;
      case 0x19u:
        if ([v6 action] == 4)
        {
          v58 = [v6 survey];
          [(PDAbstractClassZoneOperation *)self _deleteSurvey:v58];
        }
        v33 = [v6 survey];
        uint64_t v34 = sub_100022490(v33);
        goto LABEL_72;
      case 0x1Au:
        v59 = [v6 surveyStep];
        sub_100022DD0(v59);
        id v20 = (id)objc_claimAutoreleasedReturnValue();

        unsigned __int8 v22 = [(PDAbstractClassZoneOperation *)self _insertOrUpdateSurveyStep:v20];
        goto LABEL_73;
      case 0x1Bu:
        v60 = [v6 surveyStepAnswer];
        sub_1000220E4(v60);
        id v20 = (id)objc_claimAutoreleasedReturnValue();

        unsigned __int8 v22 = [(PDAbstractClassZoneOperation *)self _insertOrUpdateSurveyAnswer:v20];
        goto LABEL_73;
      case 0x1Cu:
        v33 = [v6 survey];
        uint64_t v34 = sub_100022688(v33);
        goto LABEL_72;
      case 0x1Du:
        v61 = [v6 surveyStep];
        sub_100023340(v61);
        id v20 = (id)objc_claimAutoreleasedReturnValue();

        unsigned __int8 v22 = [(PDAbstractClassZoneOperation *)self _insertOrUpdateArchivedSurveyStep:v20];
        goto LABEL_73;
      case 0x1Eu:
        v33 = [v6 schedule];
        uint64_t v34 = sub_100026BE8(v33);
LABEL_72:
        id v20 = (id)v34;

        unsigned __int8 v22 = [(PDAbstractClassZoneOperation *)self _insertOrUpdateEntity:v20];
LABEL_73:
        LOBYTE(v7) = v22;
        goto LABEL_74;
      case 0x1Fu:
        id v7 = [v6 scheduledEvent];
        sub_100026ECC(v7);
        id v20 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(v7) = [v16 insertOrUpdateObject:v20];
        if (v7) {
          goto LABEL_74;
        }
        CLSInitLog();
        v26 = [(PDOperation *)self logSubsystem];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v62 = objc_opt_class();
          id v67 = v62;
          v63 = [(PDURLRequestOperation *)self operationID];
          *(_DWORD *)buf = 138543874;
          id v77 = v62;
          __int16 v78 = 2114;
          id v79 = v63;
          __int16 v80 = 2114;
          id v81 = v20;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Failed to insert %{public}@.", buf, 0x20u);
        }
        goto LABEL_82;
      default:
        CLSInitLog();
        id v7 = [(PDOperation *)self logSubsystem];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          id v29 = (id)objc_opt_class();
          id v30 = [(PDURLRequestOperation *)self operationID];
          id v31 = [v6 type];
          if v31 < 0x27 && ((0x7FFFFE91DFuLL >> (char)v31))
          {
            v32 = *(&off_1001F3080 + (int)v31);
          }
          else
          {
            v32 = +[NSString stringWithFormat:@"(unknown: %i)", v31];
          }
          *(_DWORD *)buf = 138543874;
          id v77 = v29;
          __int16 v78 = 2114;
          id v79 = v30;
          __int16 v80 = 2114;
          id v81 = v32;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ Unexpected payload type: %{public}@;",
            buf,
            0x20u);
        }
        LOBYTE(v7) = 1;
        goto LABEL_75;
    }
    while (2)
    {
      for (i = 0; i != v51; i = (char *)i + 1)
      {
        if (*(void *)v69 != v52) {
          objc_enumerationMutation(v26);
        }
        if (![(PDAbstractClassZoneOperation *)self _insertOrUpdateCollectionItem:*(void *)(*((void *)&v68 + 1) + 8 * i)])
        {
          LOBYTE(v7) = 0;
          goto LABEL_81;
        }
      }
      id v51 = [v26 countByEnumeratingWithState:&v68 objects:v75 count:16];
      if (v51) {
        continue;
      }
      break;
    }
LABEL_57:
    LOBYTE(v7) = 1;
LABEL_81:

LABEL_82:
LABEL_74:

LABEL_75:
  }
LABEL_25:

  return (char)v7;
}

- (BOOL)_insertOrUpdateSurveyAnswer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDOperation *)self database];
  uint64_t v6 = objc_opt_class();
  id v7 = [v4 objectID];
  id v8 = [v5 select:v6 identity:v7];

  if (!v8 || [v8 state] != (id)1) {
    goto LABEL_6;
  }
  id v9 = [v8 dateLastModified];
  id v10 = [v4 dateLastModified];
  id v11 = sub_1000E174C(v9, v10, 5.0);

  if (v11 != (void *)1)
  {
    __int16 v13 = [v8 objectID];
    [(PDAbstractClassZoneOperation *)self _deleteDraftAnswer:v13];

LABEL_6:
    BOOL v12 = [(PDAbstractClassZoneOperation *)self _insertOrUpdateEntity:v4];
    goto LABEL_7;
  }
  BOOL v12 = 1;
LABEL_7:

  return v12;
}

- (BOOL)_insertOrUpdateArchivedHandout:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectID];
  uint64_t v6 = sub_100023FC4(v5);
  id v7 = [v4 objectID];
  [(PDAbstractClassZoneOperation *)self updateCollectionItemsReferenceObjectID:v6 toType:2 andObjectID:v7];

  LOBYTE(self) = [(PDAbstractClassZoneOperation *)self _insertOrUpdateEntity:v4];
  return (char)self;
}

- (BOOL)updateCollectionItemsReferenceObjectID:(id)a3 toType:(int64_t)a4 andObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(PDOperation *)self database];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005783C;
  v17[3] = &unk_1001F2F98;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v8;
  id v20 = v9;
  int64_t v21 = a4;
  id v10 = v9;
  id v11 = v8;
  id v12 = v18;
  __int16 v13 = v12;
  if (v12)
  {
    unsigned __int8 v14 = [v12 performTransaction:v17 forWriting:1];
    __int16 v15 = v20;
  }
  else
  {
    unsigned __int8 v14 = 0;
    __int16 v15 = v10;
  }

  return v14;
}

- (BOOL)deleteCollectionItemsWithReferenceObjectID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDOperation *)self database];
  uint64_t v6 = objc_opt_class();
  id v9 = v4;
  id v7 = +[NSArray arrayWithObjects:&v9 count:1];

  LOBYTE(v6) = [v5 deleteAll:v6 where:@"referenceObjectID = ?" bindings:v7];
  return v6;
}

- (BOOL)processPayloadStatus:(id)a3 allowMixedResponse:(BOOL)a4 error:(id *)a5
{
  id v8 = [a3 status];
  if ([v8 hasInternalMessage])
  {
    CLSInitLog();
    id v9 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = objc_opt_class();
      id v24 = v16;
      id v17 = [(PDURLRequestOperation *)self operationID];
      unsigned int v18 = [v8 code];
      id v19 = [v8 message];
      id v20 = [v8 internalMessage];
      *(_DWORD *)buf = 138544386;
      v26 = v16;
      __int16 v27 = 2114;
      v28 = v17;
      __int16 v29 = 1024;
      *(_DWORD *)id v30 = v18;
      *(_WORD *)&v30[4] = 2112;
      *(void *)&v30[6] = v19;
      __int16 v31 = 2112;
      v32 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ status code: %d message: %@ internal message:%@", buf, 0x30u);
    }
  }
  id v10 = sub_1000F5844(v8);
  [(PDEndpointRequestOperation *)self handleServerAlerts:v10];

  if (-[PDAbstractClassZoneOperation shouldProcessPayloadWithStatusCode:](self, "shouldProcessPayloadWithStatusCode:", [v8 code])|| (sub_1000F51A0(v8, a4), (uint64_t v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v14 = 1;
  }
  else
  {
    id v12 = (void *)v11;
    [(PDEndpointRequestOperation *)self setResponseStatusError:v11];
    if (a5) {
      *a5 = v12;
    }
    CLSInitLog();
    __int16 v13 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int64_t v21 = objc_opt_class();
      id v22 = v21;
      id v23 = [(PDURLRequestOperation *)self operationID];
      *(_DWORD *)buf = 138543874;
      v26 = v21;
      __int16 v27 = 2114;
      v28 = v23;
      __int16 v29 = 2114;
      *(void *)id v30 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ assignment request errored: %{public}@;",
        buf,
        0x20u);
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)processAttachment:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000200A0(v4);
  if (v5)
  {
    uint64_t v6 = [(PDOperation *)self database];
    uint64_t v7 = objc_opt_class();
    id v8 = [v4 objectId];
    id v9 = [v6 select:v7 identity:v8];

    if (v9) {
      objc_msgSend(v5, "setCompletionStatus:", objc_msgSend(v9, "completionStatus"));
    }
  }
  BOOL v10 = [(PDAbstractClassZoneOperation *)self _insertOrUpdateEntity:v5];

  return v10;
}

- (BOOL)processAuthorizationStatus:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 parentObjectId];
  if (v5)
  {
    -[PDAbstractClassZoneOperation _setAuthorizationForAttachmentWithObjectID:shouldAuthorize:](self, "_setAuthorizationForAttachmentWithObjectID:shouldAuthorize:", v5, [v4 isAuthorizable]);
  }
  else
  {
    CLSInitLog();
    uint64_t v6 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      BOOL v10 = [(PDURLRequestOperation *)self operationID];
      int v11 = 138543874;
      id v12 = v8;
      __int16 v13 = 2114;
      BOOL v14 = v10;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ Invalid authorization status payload! Payload: %@ - missing parentObjectId.", (uint8_t *)&v11, 0x20u);
    }
  }

  return 1;
}

- (BOOL)processCompletionStatus:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 parentObjectId];
  if (v5)
  {
    uint64_t v6 = [(PDOperation *)self database];
    uint64_t v7 = [v6 select:objc_opt_class() identity:v5];
    if (v7)
    {
      if (![v4 hasStatus])
      {
LABEL_15:
        BOOL v13 = 0;
        goto LABEL_16;
      }
      unsigned int v25 = sub_100024F00((int)[v4 status]);
      id v8 = [v7 isLocked];
      id v9 = [v4 dateLastCompleted];
      BOOL v10 = sub_1000F3F70(v9);
      int v11 = [v4 dateLastModified];
      id v12 = sub_1000F3F70(v11);
      LOBYTE(v8) = [(PDAbstractClassZoneOperation *)self setCompletionStatus:v25 forAttachment:v7 locked:v8 dateCompleted:v10 dateModified:v12];

      if (v8)
      {
        BOOL v13 = 1;
LABEL_16:

        goto LABEL_17;
      }
      CLSInitLog();
      BOOL v14 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v22 = objc_opt_class();
        id v23 = v22;
        id v24 = [(PDURLRequestOperation *)self operationID];
        *(_DWORD *)buf = 138543874;
        __int16 v27 = v22;
        __int16 v28 = 2114;
        __int16 v29 = v24;
        __int16 v30 = 2114;
        id v31 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ Failed to update completion status of handout attachment with objectID = %{public}@;.",
          buf,
          0x20u);
      }
    }
    else
    {
      CLSInitLog();
      BOOL v14 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v19 = objc_opt_class();
        id v20 = v19;
        int64_t v21 = [(PDURLRequestOperation *)self operationID];
        *(_DWORD *)buf = 138543874;
        __int16 v27 = v19;
        __int16 v28 = 2114;
        __int16 v29 = v21;
        __int16 v30 = 2114;
        id v31 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ Failed to find handout attachment with objectID = %{public}@;.",
          buf,
          0x20u);
      }
    }

    goto LABEL_15;
  }
  CLSInitLog();
  uint64_t v6 = [(PDOperation *)self logSubsystem];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v16 = objc_opt_class();
    id v17 = v16;
    unsigned int v18 = [(PDURLRequestOperation *)self operationID];
    *(_DWORD *)buf = 138543874;
    __int16 v27 = v16;
    __int16 v28 = 2114;
    __int16 v29 = v18;
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ Invalid completion status payload! Payload: %@ - missing parentObjectId.", buf, 0x20u);
  }
  BOOL v13 = 0;
LABEL_17:

  return v13;
}

- (BOOL)processStateChange:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PDAbstractClassZoneOperation *)self validateStateChangePayload:v6 error:a4])
  {
    v45 = a4;
    uint64_t v7 = [(PDOperation *)self database];
    id v8 = sub_10002108C(v6);
    id v9 = +[NSMutableArray arrayWithArray:v8];
    BOOL v10 = +[PDUserDefaults sharedDefaults];
    unsigned int v11 = [v10 enableVerboseLogging];

    id v46 = v9;
    if (v11)
    {
      v43 = v8;
      id v44 = v6;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v12 = v8;
      id v13 = [v12 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v51;
        id v48 = v12;
        v49 = v7;
        do
        {
          id v16 = 0;
          do
          {
            if (*(void *)v51 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v16);
            uint64_t v18 = objc_opt_class();
            id v19 = [v17 objectID];
            id v20 = [v7 select:v18 identity:v19];

            CLSInitLog();
            int64_t v21 = [(PDOperation *)self logSubsystem];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              id v23 = objc_opt_class();
              id v47 = v23;
              id v24 = [(PDURLRequestOperation *)self operationID];
              unsigned int v25 = [v20 dictionaryRepresentation];
              *(_DWORD *)buf = 138543874;
              v56 = v23;
              __int16 v57 = 2114;
              v58 = v24;
              __int16 v59 = 2112;
              id v60 = v25;
              _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ Updating state old: %@", buf, 0x20u);

              id v12 = v48;
              uint64_t v7 = v49;
            }
            CLSInitLog();
            id v22 = [(PDOperation *)self logSubsystem];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v26 = objc_opt_class();
              id v27 = v26;
              __int16 v28 = [(PDURLRequestOperation *)self operationID];
              __int16 v29 = [v17 dictionaryRepresentation];
              *(_DWORD *)buf = 138543874;
              v56 = v26;
              id v12 = v48;
              __int16 v57 = 2114;
              v58 = v28;
              __int16 v59 = 2112;
              id v60 = v29;
              _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ Updating state new: %@", buf, 0x20u);

              uint64_t v7 = v49;
            }

            id v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v50 objects:v54 count:16];
        }
        while (v14);
      }

      id v8 = v43;
      id v6 = v44;
      id v9 = v46;
    }
    __int16 v30 = [(PDAbstractClassZoneOperation *)self _applyStateChangesToParentHandoutEntity:v6];
    if (v30) {
      [v9 addObject:v30];
    }
    unsigned __int8 v31 = [v7 insertOrUpdateObjects:v9];
    if ((v31 & 1) == 0)
    {
      CLSInitLog();
      v32 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_opt_class();
        id v34 = v33;
        [(PDURLRequestOperation *)self operationID];
        id v36 = v35 = v8;
        *(_DWORD *)buf = 138543874;
        v56 = v33;
        __int16 v57 = 2114;
        v58 = v36;
        __int16 v59 = 2112;
        id v60 = v6;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Failed to save state changes for payload: %@", buf, 0x20u);

        id v8 = v35;
      }

      uint64_t v37 = objc_opt_class();
      v38 = [(PDURLRequestOperation *)self operationID];
      +[NSError cls_assignError:v45, 308, @"%@: %@ Failed to save state changes for payload: %@", v37, v38, v6 code format];

      id v9 = v46;
    }
  }
  else
  {
    CLSInitLog();
    uint64_t v7 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_opt_class();
      id v40 = v39;
      v41 = [(PDURLRequestOperation *)self operationID];
      *(_DWORD *)buf = 138543874;
      v56 = v39;
      __int16 v57 = 2114;
      v58 = v41;
      __int16 v59 = 2112;
      id v60 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Skipping invalid payload: %@", buf, 0x20u);
    }
    unsigned __int8 v31 = 0;
  }

  return v31;
}

- (BOOL)validateStateChangePayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (([v6 hasTargetObjectId] & 1) == 0)
  {
    CLSInitLog();
    v58 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v59 = objc_opt_class();
      id v60 = v59;
      [(PDURLRequestOperation *)self operationID];
      v62 = id v61 = v6;
      *(_DWORD *)buf = 138543618;
      v105 = v59;
      __int16 v106 = 2114;
      v107 = v62;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Invalid state change (missing targetObjectID).", buf, 0x16u);

      id v6 = v61;
    }

    uint64_t v63 = objc_opt_class();
    id v14 = [(PDURLRequestOperation *)self operationID];
    +[NSError cls_assignError:a4, 308, @"%@: %@ Invalid state change (missing targetObjectID).", v63, v14 code format];
    goto LABEL_50;
  }
  if (([v6 hasTargetEntityName] & 1) == 0)
  {
    CLSInitLog();
    v64 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = objc_opt_class();
      id v66 = v65;
      [(PDURLRequestOperation *)self operationID];
      v68 = id v67 = v6;
      long long v69 = [v67 targetObjectId];
      *(_DWORD *)buf = 138543874;
      v105 = v65;
      __int16 v106 = 2114;
      v107 = v68;
      __int16 v108 = 2112;
      v109 = v69;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Invalid state change (missing targetEntityName for targetObjectID %@).", buf, 0x20u);

      id v6 = v67;
    }

    uint64_t v70 = objc_opt_class();
    id v14 = [(PDURLRequestOperation *)self operationID];
    long long v71 = [v6 targetObjectId];
    +[NSError cls_assignError:a4, 308, @"%@: %@ Invalid state change (missing targetEntityName for targetObjectID %@).", v70, v14, v71 code format];
    goto LABEL_49;
  }
  if (([v6 hasTargetOwnerPersonId] & 1) == 0)
  {
    CLSInitLog();
    id v72 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      v73 = objc_opt_class();
      id v74 = v73;
      [(PDURLRequestOperation *)self operationID];
      v76 = v75 = v6;
      id v77 = [v75 targetObjectId];
      *(_DWORD *)buf = 138543874;
      v105 = v73;
      __int16 v106 = 2114;
      v107 = v76;
      __int16 v108 = 2112;
      v109 = v77;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Invalid state change (missing targetOwnerPersonID for targetObjectID %@).", buf, 0x20u);

      id v6 = v75;
    }

    uint64_t v78 = objc_opt_class();
    id v14 = [(PDURLRequestOperation *)self operationID];
    long long v71 = [v6 targetObjectId];
    +[NSError cls_assignError:a4, 308, @"%@: %@ Invalid state change (missing targetOwnerPersonID for targetObjectID %@).", v78, v14, v71 code format];
    goto LABEL_49;
  }
  uint64_t v7 = [v6 stateChangePayloads];
  id v8 = [v7 count];

  if (!v8)
  {
    CLSInitLog();
    v85 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      v86 = objc_opt_class();
      id v87 = v86;
      [(PDURLRequestOperation *)self operationID];
      v89 = v88 = v6;
      v90 = [v88 targetObjectId];
      *(_DWORD *)buf = 138543874;
      v105 = v86;
      __int16 v106 = 2114;
      v107 = v89;
      __int16 v108 = 2112;
      v109 = v90;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Invalid state change (empty stateChangePayloads for targetObjectID %@).", buf, 0x20u);

      id v6 = v88;
    }

    uint64_t v91 = objc_opt_class();
    id v14 = [(PDURLRequestOperation *)self operationID];
    long long v71 = [v6 targetObjectId];
    +[NSError cls_assignError:a4, 308, @"%@: %@ Invalid state change (empty stateChangePayloads for targetObjectID %@).", v91, v14, v71 code format];
LABEL_49:

LABEL_50:
    BOOL v57 = 0;
    goto LABEL_51;
  }
  id v9 = [v6 targetObjectId];
  BOOL v10 = [v6 targetOwnerPersonId];
  [v6 stateChangePayloads];
  unsigned int v11 = v95 = v6;
  id v12 = [v11 objectAtIndexedSubscript:0];
  id v13 = CKRecordID_ptr;
  id v14 = +[CLSCollaborationState identifierForTargetObjectID:ownerPersonID:domain:](CLSCollaborationState, "identifierForTargetObjectID:ownerPersonID:domain:", v9, v10, (int)[v12 domain]);

  id v6 = v95;
  if ([v95 hasTargetClassId])
  {
    uint64_t v15 = [v95 targetClassId];
    uint64_t v16 = objc_opt_class();
    LODWORD(v16) = [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v15 forClass:v16 fromEntityWithID:v14 withClass:objc_opt_class()];

    if (v16)
    {
      CLSInitLog();
      id v17 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = objc_opt_class();
        id v19 = v18;
        id v20 = [(PDURLRequestOperation *)self operationID];
        int64_t v21 = [v95 targetClassId];
        *(_DWORD *)buf = 138543874;
        v105 = v18;
        __int16 v106 = 2114;
        v107 = v20;
        __int16 v108 = 2112;
        v109 = v21;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ State change missing reference (targetClassId '%@' is not in roster).", buf, 0x20u);

        id v6 = v95;
      }
    }
  }
  id v22 = [v6 targetOwnerPersonId];
  uint64_t v23 = objc_opt_class();
  LODWORD(v23) = [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v22 forClass:v23 fromEntityWithID:v14 withClass:objc_opt_class()];

  if (v23)
  {
    CLSInitLog();
    id v24 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v25 = objc_opt_class();
      id v26 = v25;
      id v27 = [(PDURLRequestOperation *)self operationID];
      __int16 v28 = [v95 targetOwnerPersonId];
      *(_DWORD *)buf = 138543874;
      v105 = v25;
      __int16 v106 = 2114;
      v107 = v27;
      __int16 v108 = 2112;
      v109 = v28;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ State change missing reference. (ownerPersonID '%@' is not in roster).", buf, 0x20u);

      id v6 = v95;
    }
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = [v6 stateChangePayloads];
  id v98 = [obj countByEnumeratingWithState:&v99 objects:v103 count:16];
  if (v98)
  {
    v93 = a4;
    v94 = v14;
    uint64_t v97 = *(void *)v100;
    while (2)
    {
      for (i = 0; i != v98; i = (char *)i + 1)
      {
        if (*(void *)v100 != v97) {
          objc_enumerationMutation(obj);
        }
        __int16 v30 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        unsigned __int8 v31 = v13[33];
        v32 = [v6 targetObjectId];
        v33 = [v6 targetOwnerPersonId];
        id v34 = objc_msgSend(v31, "identifierForTargetObjectID:ownerPersonID:domain:", v32, v33, (int)objc_msgSend(v30, "domain"));

        if (([v30 hasParticipants] & 1) == 0)
        {
          CLSInitLog();
          id v79 = [(PDOperation *)self logSubsystem];
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v80 = objc_opt_class();
            id v81 = v80;
            __int16 v82 = [(PDURLRequestOperation *)self operationID];
            *(_DWORD *)buf = 138543874;
            v105 = v80;
            __int16 v106 = 2114;
            v107 = v82;
            __int16 v108 = 2112;
            v109 = v30;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Invalid stateChangePayload (missing participants) %@", buf, 0x20u);
          }
          uint64_t v83 = objc_opt_class();
          v84 = [(PDURLRequestOperation *)self operationID];
          +[NSError cls_assignError:v93, 308, @"%@: %@ Invalid stateChangePayload (missing participants) %@", v83, v84, v30 code format];

          BOOL v57 = 0;
          id v6 = v95;
          goto LABEL_45;
        }
        v35 = [v30 participants];
        id v36 = [v35 senderPersonId];

        if (v36)
        {
          uint64_t v37 = [v30 participants];
          v38 = [v37 senderPersonId];
          uint64_t v39 = objc_opt_class();
          LODWORD(v39) = [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v38 forClass:v39 fromEntityWithID:v34 withClass:objc_opt_class()];

          if (v39)
          {
            CLSInitLog();
            id v40 = [(PDOperation *)self logSubsystem];
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              v41 = objc_opt_class();
              id v42 = v41;
              v43 = [(PDURLRequestOperation *)self operationID];
              id v44 = [v30 participants];
              v45 = [v44 senderPersonId];
              *(_DWORD *)buf = 138543874;
              v105 = v41;
              __int16 v106 = 2114;
              v107 = v43;
              __int16 v108 = 2112;
              v109 = v45;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ State change missing reference. (senderPersonId '%@' is not in roster).", buf, 0x20u);

              id v6 = v95;
            }
          }
        }
        id v46 = [v30 participants];
        id v47 = [v46 recipientPersonId];

        if (v47)
        {
          id v48 = [v30 participants];
          v49 = [v48 recipientPersonId];
          uint64_t v50 = objc_opt_class();
          LODWORD(v50) = [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v49 forClass:v50 fromEntityWithID:v34 withClass:objc_opt_class()];

          if (v50)
          {
            CLSInitLog();
            long long v51 = [(PDOperation *)self logSubsystem];
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              long long v52 = objc_opt_class();
              id v53 = v52;
              v54 = [(PDURLRequestOperation *)self operationID];
              v55 = [v30 participants];
              v56 = [v55 recipientPersonId];
              *(_DWORD *)buf = 138543874;
              v105 = v52;
              __int16 v106 = 2114;
              v107 = v54;
              __int16 v108 = 2112;
              v109 = v56;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ State change missing reference. (recipientPersonId '%@' is not in roster).", buf, 0x20u);

              id v6 = v95;
            }
          }
        }

        id v13 = CKRecordID_ptr;
      }
      id v98 = [obj countByEnumeratingWithState:&v99 objects:v103 count:16];
      if (v98) {
        continue;
      }
      break;
    }
    BOOL v57 = 1;
LABEL_45:
    id v14 = v94;
  }
  else
  {
    BOOL v57 = 1;
  }

LABEL_51:
  return v57;
}

- (BOOL)resolveMissingEntityWithObjectID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDOperation *)self database];
  uint64_t v6 = objc_opt_class();
  id v9 = v4;
  uint64_t v7 = +[NSArray arrayWithObjects:&v9 count:1];

  LOBYTE(v6) = [v5 deleteAll:v6 where:@"entityID = ?" bindings:v7];
  return v6;
}

- (id)_applyStateChangesToParentHandoutEntity:(id)a3
{
  id v4 = a3;
  id v40 = [(PDOperation *)self database];
  BOOL v5 = sub_100003E58(v40);
  uint64_t v6 = [v5 objectID];

  if (!v6)
  {
    CLSInitLog();
    unsigned int v11 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v35 = objc_opt_class();
      id v36 = v35;
      uint64_t v37 = [(PDURLRequestOperation *)self operationID];
      *(_DWORD *)buf = 138543874;
      id v48 = v35;
      __int16 v49 = 2114;
      uint64_t v50 = v37;
      __int16 v51 = 2112;
      id v52 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ No currentUser. Not applying changes to parent entity for payload: %@", buf, 0x20u);
    }
    id v12 = 0;
    goto LABEL_39;
  }
  uint64_t v7 = [v4 targetEntityName];
  id v8 = sub_1000F4A70(v7);

  if (v8 == (id)objc_opt_class())
  {
    uint64_t v13 = objc_opt_class();
    id v14 = [v4 targetObjectId];
    uint64_t v15 = [v40 select:v13 identity:v14];
    id v9 = 0;
    BOOL v10 = v15;
LABEL_10:

    objc_msgSend(v4, "targetOwnerPersonId", v15);
    goto LABEL_11;
  }
  if (v8 == (id)objc_opt_class())
  {
    uint64_t v16 = objc_opt_class();
    id v14 = [v4 targetObjectId];
    uint64_t v15 = [v40 select:v16 identity:v14];
    BOOL v10 = 0;
    id v9 = v15;
    goto LABEL_10;
  }
  id v9 = 0;
  BOOL v10 = 0;
  objc_msgSend(v4, "targetOwnerPersonId", 0);
  id v17 = LABEL_11:;
  uint64_t v39 = v6;
  v41 = self;
  if (v17)
  {
    uint64_t v18 = [v4 targetOwnerPersonId];
    unsigned int v19 = [v6 isEqualToString:v18];
  }
  else
  {
    unsigned int v19 = 0;
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v20 = v4;
  int64_t v21 = [v4 stateChangePayloads];
  id v22 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v43;
    if (v10) {
      unsigned int v25 = v19;
    }
    else {
      unsigned int v25 = 0;
    }
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(v21);
        }
        id v27 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        unsigned int v29 = [v27 domain];
        if (v29 == 1)
        {
          if (v10) {
            [(PDAbstractClassZoneOperation *)v41 setCompletionAndLockedStatusForStateChange:v20 andStateChangePayload:v27 forAttachment:v10];
          }
        }
        else if (v29 == 5)
        {
          if (v9) {
            [(PDAbstractClassZoneOperation *)v41 setHandoutClosedStatusForStateChange:v20 andStateChangePayload:v27 forHandout:v9];
          }
        }
        else if (v29 == 3 && v25 != 0)
        {
          if ([v27 state] == 1)
          {
            uint64_t v31 = (uint64_t)v40;
            v32 = v10;
            int v33 = 0;
          }
          else
          {
            if ([v27 state] != 2) {
              goto LABEL_36;
            }
            uint64_t v31 = (uint64_t)v40;
            v32 = v10;
            int v33 = 1;
          }
          sub_1001566F0(v31, v32, v33);
        }
LABEL_36:
      }
      id v23 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v23);
  }

  unsigned int v11 = v38;
  id v12 = v11;
  id v4 = v20;
  uint64_t v6 = v39;
LABEL_39:

  return v12;
}

- (BOOL)setCompletionStatus:(int)a3 forAttachment:(id)a4 locked:(BOOL)a5 dateCompleted:(id)a6 dateModified:(id)a7
{
  BOOL v9 = a5;
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  [v12 setLocked:v9];
  [v12 setCompletionStatus:v10];
  [v12 setDateLastCompleted:v14];

  if (v13) {
    [v12 setDateLastModified:v13];
  }
  uint64_t v15 = [(PDOperation *)self database];
  unsigned __int8 v16 = [v15 updateObject:v12];

  return v16;
}

- (void)setCompletionAndLockedStatusForStateChange:(id)a3 andStateChangePayload:(id)a4 forAttachment:(id)a5
{
  id v24 = a3;
  id v7 = a4;
  id v8 = a5;
  unsigned int v9 = [v8 isComplete];
  BOOL v10 = [v8 completionStatus] == 1
     || [v8 completionStatus] == 2;
  if ([v7 state] == 5)
  {
    unsigned __int8 v11 = [v7 flags];
    self;
    BOOL v12 = (v11 & 0x11) != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  unsigned int v13 = [v7 state];
  self;
  int v14 = v13 == 2 || v12;
  unint64_t v15 = ((unint64_t)[v7 flags] >> 2) & 1;
  unsigned int v16 = [v7 state];
  unsigned int v17 = [v7 state];
  [v8 setLocked:v15];
  if (v17 && (((v9 ^ v14 | v10) & 1) != 0 || v16 == 4))
  {
    unsigned int v18 = [v7 state];
    self;
    uint64_t v19 = v18 > 5 ? 3 : dword_10019B768[v18];
    [v8 setCompletionStatus:v19];
    if (v14)
    {
      if ([v24 hasDateLastModified])
      {
        id v20 = [v24 dateLastModified];
        int64_t v21 = sub_1000F3F70(v20);
        [v8 setDateLastCompleted:v21];
      }
      else
      {
        id v20 = +[NSDate date];
        [v8 setDateLastCompleted:v20];
      }
    }
  }
  if ([v24 hasDateLastModified])
  {
    id v22 = [v24 dateLastModified];
    id v23 = sub_1000F3F70(v22);
    [v8 setDateLastModified:v23];
  }
}

- (void)setHandoutClosedStatusForStateChange:(id)a3 andStateChangePayload:(id)a4 forHandout:(id)a5
{
  id v6 = a5;
  objc_msgSend(v6, "setReviewed:", objc_msgSend(a4, "state") == 2);
}

- (BOOL)_insertOrUpdateEntity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(PDOperation *)self database];
    if ([v5 insertOrUpdateObject:v4])
    {
      id v6 = [v4 objectID];
      BOOL v7 = [(PDAbstractClassZoneOperation *)self resolveMissingEntityWithObjectID:v6];
    }
    else
    {
      CLSInitLog();
      id v8 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v9 = objc_opt_class();
        id v10 = v9;
        unsigned __int8 v11 = [(PDURLRequestOperation *)self operationID];
        int v13 = 138543874;
        int v14 = v9;
        __int16 v15 = 2114;
        unsigned int v16 = v11;
        __int16 v17 = 2114;
        id v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Failed to insert %{public}@.", (uint8_t *)&v13, 0x20u);
      }
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_insertOrUpdateCollectionItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDOperation *)self database];
  uint64_t v6 = objc_opt_class();
  BOOL v7 = [v4 parentObjectID];
  v14[0] = v7;
  id v8 = [v4 referenceObjectID];
  v14[1] = v8;
  unsigned int v9 = +[NSArray arrayWithObjects:v14 count:2];
  id v10 = [v5 select:v6 where:@"parentObjectID = ? AND referenceObjectID = ?" bindings:v9];

  if (v10
    && ([v10 objectID],
        unsigned __int8 v11 = objc_claimAutoreleasedReturnValue(),
        [v4 setObjectID:v11],
        v11,
        ([v4 isEqual:v10] & 1) != 0))
  {
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = [(PDAbstractClassZoneOperation *)self _insertOrUpdateEntity:v4];
  }

  return v12;
}

- (BOOL)_insertOrUpdateSurveyStep:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDOperation *)self database];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    BOOL v7 = objc_opt_new();
    [v7 addObject:v6];
    switch((unint64_t)[v6 questionType])
    {
      case 1uLL:
      case 3uLL:
        id v24 = [v6 answerFormat];
        [v7 addObject:v24];

        break;
      case 2uLL:
      case 4uLL:
        id v8 = objc_opt_new();
        unsigned int v9 = [v6 answerFormat];
        [v7 addObject:v9];
        id v10 = v5;
        uint64_t v11 = objc_opt_class();
        BOOL v12 = [v9 objectID];
        id v47 = v12;
        int v13 = +[NSArray arrayWithObjects:&v47 count:1];
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_10005A2F0;
        v43[3] = &unk_1001F2FC0;
        id v14 = v8;
        id v44 = v14;
        id v34 = v10;
        [v10 selectAll:v11 where:@"parentObjectID = ?" bindings:v13 block:v43];

        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v32 = v9;
        __int16 v15 = [v9 answerChoiceItems];
        id v16 = [v15 countByEnumeratingWithState:&v39 objects:v46 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v40;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v40 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              [v7 addObject:v20];
              int64_t v21 = [v20 objectID];
              [v14 removeObject:v21];
            }
            id v17 = [v15 countByEnumeratingWithState:&v39 objects:v46 count:16];
          }
          while (v17);
        }

        BOOL v5 = v34;
        if ([v14 count])
        {
          id v22 = +[PDDatabase whereSQLForArray:v14 prefix:@"objectID in "];
          [v34 deleteAll:objc_opt_class() where:v22 bindings:v14];
        }
        break;
      default:
        break;
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v25 = v7;
    id v26 = [v25 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v36;
      char v29 = 1;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v25);
          }
          if (![(PDAbstractClassZoneOperation *)self _insertOrUpdateEntity:*(void *)(*((void *)&v35 + 1) + 8 * (void)j)])char v29 = 0; {
        }
          }
        id v27 = [v25 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v27);
      BOOL v23 = v29 & 1;
    }
    else
    {
      BOOL v23 = 1;
    }
  }
  else
  {
    BOOL v23 = 1;
  }

  return v23;
}

- (BOOL)_insertOrUpdateArchivedSurveyStep:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = objc_opt_new();
    [v6 addObject:v5];
    switch((unint64_t)[v5 questionType])
    {
      case 1uLL:
      case 3uLL:
        BOOL v7 = [v5 archivedAnswerFormat];
        [v6 addObject:v7];
        goto LABEL_13;
      case 2uLL:
      case 4uLL:
        BOOL v7 = [v5 archivedAnswerFormat];
        [v6 addObject:v7];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v8 = [v7 archivedAnswerChoiceItems];
        id v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v26;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              [v6 addObject:*(void *)(*((void *)&v25 + 1) + 8 * i)];
            }
            id v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
          }
          while (v10);
        }

LABEL_13:
        break;
      default:
        break;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v6;
    id v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      char v18 = 1;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          if (!-[PDAbstractClassZoneOperation _insertOrUpdateEntity:](self, "_insertOrUpdateEntity:", *(void *)(*((void *)&v21 + 1) + 8 * (void)j), (void)v21))char v18 = 0; {
        }
          }
        id v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
      BOOL v13 = v18 & 1;
    }
    else
    {
      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)_deleteWithPayload:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 hasStatus]
    && ([v5 status],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 code],
        v6,
        v7 != 1))
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = 1;
    switch([v5 type])
    {
      case 1u:
        break;
      case 2u:
        id v9 = [v5 handout];
        id v10 = [v9 objectId];
        [(PDAbstractClassZoneOperation *)self deleteCollectionItemsWithReferenceObjectID:v10];

        uint64_t v11 = [v5 handout];
        BOOL v12 = [v11 objectId];
        unsigned __int8 v13 = [(PDAbstractClassZoneOperation *)self deleteHandoutWithObjectID:v12 shouldDeleteDrafts:0];
        goto LABEL_44;
      case 3u:
        id v14 = [v5 attachment];
        uint64_t v11 = [v14 objectId];

        [(PDAbstractClassZoneOperation *)self _setAuthorizationForAttachmentWithObjectID:v11 shouldAuthorize:0];
        unsigned __int8 v15 = [(PDAbstractClassZoneOperation *)self _deleteEntity:objc_opt_class() identity:v11];
        goto LABEL_20;
      case 4u:
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = [v5 recipient];
        goto LABEL_16;
      case 6u:
        uint64_t v11 = [v5 classInfo];
        BOOL v12 = [v11 classId];
        unsigned __int8 v13 = [(PDAbstractClassZoneOperation *)self deleteClassWithObjectID:v12 deletePersons:0];
        goto LABEL_44;
      case 7u:
        uint64_t v16 = objc_opt_class();
        uint64_t v11 = [v5 person];
        uint64_t v23 = [v11 personId];
        goto LABEL_22;
      case 8u:
        uint64_t v16 = objc_opt_class();
        uint64_t v11 = [v5 classMember];
        uint64_t v23 = [v11 classMemberId];
        goto LABEL_22;
      case 0xFu:
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = [v5 asset];
LABEL_16:
        uint64_t v11 = v17;
        uint64_t v23 = [v17 objectId];
        goto LABEL_22;
      case 0x11u:
        uint64_t v11 = [v5 authStatus];
        unsigned __int8 v15 = [(PDAbstractClassZoneOperation *)self processAuthorizationStatus:v11];
        goto LABEL_20;
      case 0x12u:
        uint64_t v11 = [v5 completionStatus];
        unsigned __int8 v15 = [(PDAbstractClassZoneOperation *)self processCompletionStatus:v11];
        goto LABEL_20;
      case 0x13u:
        uint64_t v11 = [v5 stateChange];
        unsigned __int8 v15 = [(PDAbstractClassZoneOperation *)self _deleteStateChanges:v11];
LABEL_20:
        BOOL v8 = v15;
        goto LABEL_45;
      case 0x14u:
        long long v24 = [v5 collection];
        uint64_t v11 = sub_100023BCC(v24);

        uint64_t v16 = objc_opt_class();
        uint64_t v23 = [v11 objectID];
LABEL_22:
        BOOL v12 = (void *)v23;
        long long v25 = self;
        uint64_t v26 = v16;
        goto LABEL_43;
      case 0x15u:
        id v48 = v5;
        long long v27 = [v5 collectionItem];
        long long v28 = sub_100024274(v27);

        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id obj = v28;
        id v29 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v54;
          do
          {
            v32 = 0;
            id v49 = v30;
            do
            {
              if (*(void *)v54 != v31) {
                objc_enumerationMutation(obj);
              }
              int v33 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v32);
              if ([v33 type] == (id)2)
              {
                id v34 = self;
                long long v35 = [(PDOperation *)self database];
                long long v36 = objc_opt_new();
                uint64_t v37 = objc_opt_class();
                long long v38 = [v33 referenceObjectID];
                v63[0] = v38;
                v63[1] = &off_10020AE18;
                long long v39 = +[NSArray arrayWithObjects:v63 count:2];
                v51[0] = _NSConcreteStackBlock;
                v51[1] = 3221225472;
                v51[2] = sub_10005AD80;
                v51[3] = &unk_1001F2FE8;
                id v40 = v36;
                id v52 = v40;
                [v35 selectAll:v37 where:@"referenceObjectID = ? and type = ?" bindings:v39 block:v51];

                if ([v40 count])
                {
                  long long v41 = +[PDDatabase whereSQLForArray:v40 prefix:@"objectID in "];
                  [v35 deleteAllWithoutTracking:objc_opt_class() where:v41 bindings:v40];
                }
                self = v34;
                id v30 = v49;
              }
              v32 = (char *)v32 + 1;
            }
            while (v30 != v32);
            id v30 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
          }
          while (v30);
        }

        BOOL v8 = 1;
        id v5 = v48;
        break;
      case 0x19u:
        long long v42 = [v5 survey];
        unsigned __int8 v43 = [(PDAbstractClassZoneOperation *)self _deleteSurvey:v42];
        goto LABEL_37;
      case 0x1Au:
        long long v42 = [v5 surveyStep];
        unsigned __int8 v43 = [(PDAbstractClassZoneOperation *)self _deleteSurveyStep:v42];
LABEL_37:
        BOOL v8 = v43;
        goto LABEL_39;
      case 0x1Bu:
        long long v42 = [v5 surveyStepAnswer];
        id v44 = [v42 objectId];
        BOOL v8 = [(PDAbstractClassZoneOperation *)self _deleteDraftAnswer:v44];

LABEL_39:
        break;
      case 0x1Eu:
        uint64_t v45 = objc_opt_class();
        id v46 = [v5 schedule];
        goto LABEL_42;
      case 0x1Fu:
        uint64_t v45 = objc_opt_class();
        id v46 = [v5 scheduledEvent];
LABEL_42:
        uint64_t v11 = v46;
        BOOL v12 = [v46 objectId];
        long long v25 = self;
        uint64_t v26 = v45;
LABEL_43:
        unsigned __int8 v13 = [(PDAbstractClassZoneOperation *)v25 _deleteEntity:v26 identity:v12];
LABEL_44:
        BOOL v8 = v13;

LABEL_45:
        break;
      default:
        CLSInitLog();
        char v18 = [(PDOperation *)self logSubsystem];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = (id)objc_opt_class();
          id v20 = [(PDURLRequestOperation *)self operationID];
          id v21 = [v5 type];
          if v21 < 0x27 && ((0x7FFFFE91DFuLL >> (char)v21))
          {
            long long v22 = *(&off_1001F3080 + (int)v21);
          }
          else
          {
            long long v22 = +[NSString stringWithFormat:@"(unknown: %i)", v21];
          }
          *(_DWORD *)buf = 138543874;
          id v58 = v19;
          __int16 v59 = 2114;
          id v60 = v20;
          __int16 v61 = 2114;
          v62 = v22;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ Unexpected payload type: %{public}@;",
            buf,
            0x20u);
        }
        BOOL v8 = 1;
        break;
    }
  }

  return v8;
}

- (BOOL)deleteHandoutWithObjectID:(id)a3 shouldDeleteDrafts:(BOOL)a4
{
  id v6 = a3;
  unsigned int v7 = [(PDOperation *)self database];
  if (!a4)
  {
    BOOL v8 = [v7 select:objc_opt_class() identity:v6];
    id v9 = v8;
    if (v8 && ![v8 state])
    {

      BOOL v11 = 1;
      goto LABEL_6;
    }
  }
  v14[0] = v6;
  v14[1] = &off_10020AE30;
  id v10 = +[NSArray arrayWithObjects:v14 count:2];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005AF64;
  v13[3] = &unk_1001F3010;
  v13[4] = self;
  [v7 selectAll:objc_opt_class() where:@"parentObjectID = ? and type = ?" bindings:v10 block:v13];
  BOOL v11 = [(PDAbstractClassZoneOperation *)self _deleteEntity:objc_opt_class() identity:v6];

LABEL_6:
  return v11;
}

- (BOOL)deleteClassWithObjectID:(id)a3 deletePersons:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [(PDOperation *)self database];
  BOOL v8 = v7;
  if (v4)
  {
    id v9 = sub_10006B53C(v7, v6);
    id v10 = sub_100003E58(v8);
    BOOL v11 = v10;
    if (v10)
    {
      BOOL v12 = [v10 objectID];

      if (v12)
      {
        unsigned __int8 v13 = [v11 objectID];
        [v9 removeObject:v13];
      }
    }
  }
  else
  {
    id v9 = 0;
  }
  unsigned __int8 v14 = [(PDAbstractClassZoneOperation *)self _deleteEntity:objc_opt_class() identity:v6];
  if ((v14 & 1) == 0)
  {
    CLSInitLog();
    unsigned __int8 v15 = (void *)CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      int v24 = 138543618;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2114;
      id v27 = v6;
      id v17 = v25;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to delete class %{public}@", (uint8_t *)&v24, 0x16u);
    }
  }
  if (v4 && [v9 count])
  {
    char v18 = +[PDDatabase whereSQLForArray:v9 prefix:@"objectID in "];
    unsigned __int8 v14 = [v8 deleteAll:objc_opt_class() where:v18 bindings:v9];
    if ((v14 & 1) == 0)
    {
      CLSInitLog();
      id v19 = (void *)CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = v19;
        id v21 = objc_opt_class();
        int v24 = 138543618;
        id v25 = v21;
        __int16 v26 = 2114;
        id v27 = v6;
        id v22 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to delete persons in class %{public}@", (uint8_t *)&v24, 0x16u);
      }
    }
  }
  return v14;
}

- (BOOL)_deleteEntity:(Class)a3 identity:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(PDOperation *)self database];
  id v25 = v6;
  BOOL v8 = +[NSArray arrayWithObjects:&v25 count:1];
  id v9 = [(objc_class *)a3 identityColumnName];
  id v10 = [v9 stringByAppendingString:@" = ?"];

  if (([v7 deleteAll:a3 where:v10 bindings:v8] & 1) == 0)
  {
    CLSInitLog();
    BOOL v12 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v13 = objc_opt_class();
      id v14 = v13;
      unsigned __int8 v15 = [(PDURLRequestOperation *)self operationID];
      int v17 = 138544130;
      char v18 = v13;
      __int16 v19 = 2114;
      id v20 = v15;
      __int16 v21 = 2114;
      Class v22 = a3;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Failed to delete %{public}@ %@.", (uint8_t *)&v17, 0x2Au);
    }
    goto LABEL_9;
  }
  if (![(PDAbstractClassZoneOperation *)self resolveMissingEntityWithObjectID:v6]
    || ![v7 deleteAll:objc_opt_class() where:@"entityIdentity = ?" bindings:v8]
    || ![v7 deleteAll:objc_opt_class() where:@"objectID = ?" bindings:v8])
  {
LABEL_9:
    BOOL v11 = 0;
    goto LABEL_10;
  }
  [v7 deleteAll:objc_opt_class() where:@"objectID = ?" bindings:v8];
  [v7 deleteAll:objc_opt_class() where:@"objectID = ?" bindings:v8];
  [v7 deleteAll:objc_opt_class() where:@"objectID = ?" bindings:v8];
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (BOOL)_deleteDraftAnswer:(id)a3
{
  id v4 = a3;
  [(PDOperation *)self database];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005B5C0;
  v9[3] = &unk_1001F1ED8;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v4;
  id v5 = v4;
  id v6 = v10;
  unsigned __int8 v7 = [v6 withSyncEnabled:v9];

  return v7;
}

- (BOOL)_deleteStateChanges:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [v3 stateChangePayloads];
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v11 = [v3 targetObjectId];
        BOOL v12 = [v3 targetOwnerPersonId];
        unsigned __int8 v13 = +[CLSCollaborationState identifierForTargetObjectID:ownerPersonID:domain:](CLSCollaborationState, "identifierForTargetObjectID:ownerPersonID:domain:", v11, v12, (int)[v10 domain]);

        [v4 addObject:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v7);
  }

  id v14 = [(PDOperation *)self database];
  if ([v4 count])
  {
    unsigned __int8 v15 = +[PDDatabase whereSQLForArray:v4 prefix:@"objectID in "];
    unsigned __int8 v16 = [v14 deleteAll:objc_opt_class() where:v15 bindings:v4];
    if ((v16 & 1) == 0)
    {
      CLSInitLog();
      int v17 = (void *)CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
      {
        char v18 = v17;
        __int16 v19 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        long long v28 = v19;
        __int16 v29 = 2114;
        id v30 = v3;
        id v20 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to delete CLSCollaborationStateChanges in payload %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    unsigned __int8 v16 = 1;
  }

  return v16;
}

- (BOOL)_deleteSurvey:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectId];
  id v6 = [(PDOperation *)self database];
  id v7 = objc_opt_new();
  uint64_t v8 = objc_opt_class();
  uint64_t v37 = v5;
  id v9 = +[NSArray arrayWithObjects:&v37 count:1];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10005BCC4;
  v29[3] = &unk_1001F3038;
  id v10 = v7;
  id v30 = v10;
  [v6 selectAll:v8 where:@"parentObjectID = ?" bindings:v9 block:v29];

  if ([v10 count])
  {
    id v11 = +[PDDatabase whereSQLForArray:v10 prefix:@"objectID in "];
    if (([v6 deleteAll:objc_opt_class() where:v11 bindings:v10] & 1) == 0)
    {
      CLSInitLog();
      BOOL v12 = (void *)CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v13 = v12;
        id v14 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v34 = v14;
        __int16 v35 = 2114;
        id v36 = v5;
        id v15 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to manually delete survey questions %{public}@", buf, 0x16u);
      }
    }
  }
  uint64_t v16 = objc_opt_class();
  v32 = v5;
  int v17 = +[NSArray arrayWithObjects:&v32 count:1];
  LOBYTE(v16) = [v6 deleteAllWithoutTracking:v16 where:@"objectID = ?" bindings:v17];

  if (v16)
  {
    uint64_t v18 = objc_opt_class();
    uint64_t v31 = v5;
    BOOL v19 = 1;
    id v20 = +[NSArray arrayWithObjects:&v31 count:1];
    LOBYTE(v18) = [v6 deleteAllWithoutTracking:v18 where:@"surveyID = ?" bindings:v20];

    if ((v18 & 1) == 0)
    {
      CLSInitLog();
      __int16 v21 = (void *)CLSLogDatabase;
      BOOL v19 = 0;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
      {
        Class v22 = v21;
        long long v23 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v34 = v23;
        __int16 v35 = 2114;
        id v36 = v5;
        id v24 = v23;
        long long v25 = "%{public}@ failed to delete answers associate with the survey %{public}@";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);

        BOOL v19 = 0;
      }
    }
  }
  else
  {
    CLSInitLog();
    long long v26 = (void *)CLSLogDatabase;
    BOOL v19 = 0;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
    {
      Class v22 = v26;
      id v27 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v34 = v27;
      __int16 v35 = 2114;
      id v36 = v4;
      id v24 = v27;
      long long v25 = "%{public}@ failed to delete CLSSurvey in payload %{public}@";
      goto LABEL_12;
    }
  }

  return v19;
}

- (BOOL)_deleteSurveyStep:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectId];
  id v6 = [(PDOperation *)self database];
  if ([(PDAbstractClassZoneOperation *)self _deleteEntity:objc_opt_class() identity:v5])
  {
    uint64_t v7 = [v4 answerFormatObjectId];
    unsigned int v8 = [v4 answerFormatType];
    uint64_t v36 = v7;
    if (v8 == 1 || v8 == 3 || v8 == 2)
    {
      if (!-[PDAbstractClassZoneOperation _deleteEntity:identity:](self, "_deleteEntity:identity:", objc_opt_class(), v7, v7))
      {
        CLSInitLog();
        id v11 = (void *)CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
        {
          long long v28 = v11;
          *(_DWORD *)buf = 138543618;
          id v48 = (id)objc_opt_class();
          __int16 v49 = 2114;
          uint64_t v50 = v7;
          id v29 = v48;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@ failed to delete answer format %{public}@", buf, 0x16u);
        }
        unsigned __int8 v10 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      CLSInitLog();
      BOOL v12 = CLSLogHandout;
      if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unknown answer format type", buf, 2u);
      }
    }
    unsigned __int8 v10 = 1;
LABEL_16:
    unsigned __int8 v13 = objc_opt_new();
    id v14 = objc_opt_new();
    uint64_t v15 = objc_opt_class();
    long long v38 = v5;
    id v46 = v5;
    uint64_t v16 = +[NSArray arrayWithObjects:&v46 count:1];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10005C2C4;
    v43[3] = &unk_1001F2498;
    id v17 = v13;
    id v44 = v17;
    id v18 = v14;
    id v45 = v18;
    [v6 selectAll:v15 where:@"questionID = ?" bindings:v16 block:v43];

    if ([v18 count])
    {
      BOOL v19 = +[PDDatabase whereSQLForArray:v18 prefix:@"objectID IN "];
      unsigned __int8 v10 = [v6 deleteAll:objc_opt_class() where:v19 bindings:v18];
      if ((v10 & 1) == 0)
      {
        CLSInitLog();
        id v20 = (void *)CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
        {
          id v30 = v20;
          uint64_t v31 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v48 = v31;
          __int16 v49 = 2114;
          uint64_t v50 = (uint64_t)v18;
          id v32 = v31;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@ failed to delete published answers associate with IDs %{public}@", buf, 0x16u);
        }
      }
    }
    if (objc_msgSend(v17, "count", v36))
    {
      __int16 v21 = +[PDDatabase whereSQLForArray:v17 prefix:@"objectID IN "];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10005C350;
      v39[3] = &unk_1001F3060;
      id v40 = v6;
      id v22 = v21;
      id v41 = v22;
      id v23 = v17;
      id v42 = v23;
      unsigned __int8 v10 = [v40 withSyncEnabled:v39];
      if ((v10 & 1) == 0)
      {
        CLSInitLog();
        id v24 = (void *)CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
        {
          int v33 = v24;
          id v34 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v48 = v34;
          __int16 v49 = 2114;
          uint64_t v50 = (uint64_t)v23;
          id v35 = v34;
          _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}@ failed to delete draft answers associate with IDs %{public}@", buf, 0x16u);
        }
      }
    }
    id v5 = v38;
    goto LABEL_27;
  }
  CLSInitLog();
  id v9 = (void *)CLSLogDatabase;
  if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
  {
    long long v26 = v9;
    *(_DWORD *)buf = 138543618;
    id v48 = (id)objc_opt_class();
    __int16 v49 = 2114;
    uint64_t v50 = (uint64_t)v4;
    id v27 = v48;
    _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@ failed to delete CLSQuestionStep in payload %{public}@", buf, 0x16u);
  }
  unsigned __int8 v10 = 0;
LABEL_27:

  return v10;
}

- (void)_setAuthorizationForAttachmentWithObjectID:(id)a3 shouldAuthorize:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(PDOperation *)self database];
  LOBYTE(v4) = sub_1001565D8(v7, v6, v4);

  if ((v4 & 1) == 0)
  {
    CLSInitLog();
    unsigned int v8 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_opt_class();
      id v10 = v9;
      id v11 = [(PDURLRequestOperation *)self operationID];
      int v12 = 138543874;
      unsigned __int8 v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Failed to update authorization for attchment with objectID = %{public}@; - skipping autho"
        "rization status.",
        (uint8_t *)&v12,
        0x20u);
    }
  }
}

@end