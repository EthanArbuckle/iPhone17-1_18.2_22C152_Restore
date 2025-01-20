@interface PDPushLocalClassChanges
- (BOOL)_deleteSyncItemsWithIDs:(id)a3;
- (BOOL)_shouldSkipGeneratingPayload:(id)a3;
- (BOOL)acceptsPayloadType:(int)a3;
- (BOOL)allowMixedResponseStatusCode;
- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4;
- (BOOL)processPayloadStatus:(id)a3 allowMixedResponse:(BOOL)a4 error:(id *)a5;
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (BOOL)shouldProcessPayload:(id)a3;
- (BOOL)stopProcessingIfResponseStatusPayloadFailed;
- (BOOL)wantsToExecute;
- (Class)expectedResponseClass;
- (PDPushLocalClassChanges)initWithDatabase:(id)a3;
- (id)acceptContentType;
- (id)endpointIdentifier;
- (id)logSubsystem;
- (id)requestContentType;
- (id)requestData;
- (void)_updateAssetStatusUsingPendingCLSSyncItemsWithIDs:(id)a3 status:(int64_t)a4;
- (void)prepare;
- (void)updateSchdeuleSyncStatus:(id)a3 status:(int64_t)a4;
- (void)updateSurveySyncStatus:(id)a3 status:(int64_t)a4;
@end

@implementation PDPushLocalClassChanges

- (PDPushLocalClassChanges)initWithDatabase:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PDPushLocalClassChanges;
  v3 = [(PDURLRequestOperation *)&v9 initWithDatabase:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    v5 = *(void **)(v3 + 267);
    *(void *)(v3 + 267) = v4;

    uint64_t v6 = objc_opt_new();
    v7 = *(void **)(v3 + 283);
    *(void *)(v3 + 283) = v6;
  }
  return (PDPushLocalClassChanges *)v3;
}

- (id)logSubsystem
{
  return CLSLogHandout;
}

- (BOOL)acceptsPayloadType:(int)a3
{
  return (a3 < 0x20) & (0xC606801F >> a3);
}

- (id)endpointIdentifier
{
  return @"publishHandout";
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

- (id)requestData
{
  if ([(PDOperation *)self isAborted])
  {
    v3 = 0;
    goto LABEL_26;
  }
  uint64_t v4 = [(PDURLRequestOperation *)self stats];
  if (v4) {
    v4[14] = 0;
  }

  v27 = [(PDOperation *)self database];
  id v28 = objc_alloc_init((Class)PBDataWriter);
  v5 = objc_alloc_init(PDDPPublishHandoutRequest);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_10000B7D4;
  v34[4] = sub_10000B604;
  id v35 = [(PDURLRequestOperation *)self operationID];
  uint64_t v6 = objc_opt_new();
  v7 = *(void **)(&self->super._responseStatusPayloadFailed + 3);
  *(void *)(&self->super._responseStatusPayloadFailed + 3) = v6;

  v8 = (NSMutableArray *)objc_opt_new();
  objc_super v9 = *(NSMutableArray **)((char *)&self->_toBePushedSyncableNewCLSAssetItems + 3);
  *(NSMutableArray **)((char *)&self->_toBePushedSyncableNewCLSAssetItems + 3) = v8;

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10014DB7C;
  v33[3] = &unk_1001F60C8;
  v33[4] = self;
  v33[5] = v34;
  v10 = objc_retainBlock(v33);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = *(id *)((char *)&self->_beingPushedSyncableOtherItems + 3);
  id v12 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v30;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v11);
        }
        ((void (*)(void *, void, void, void, PDDPPublishHandoutRequest *, id, void *))v10[2])(v10, *(void *)(*((void *)&v29 + 1) + 8 * i), *(void *)(&self->super._responseStatusPayloadFailed + 3), *(NSMutableArray **)((char *)&self->_toBePushedSyncableOtherItems + 3), v5, v28, v27);
      }
      id v12 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v12);
  }

  [*(id *)((char *)&self->_beingPushedSyncableOtherItems + 3) removeObjectsInArray:*(void *)(&self->super._responseStatusPayloadFailed + 3)];
  uint64_t v15 = [(PDURLRequestOperation *)self stats];
  v16 = (void *)v15;
  if (v15 && *(void *)(v15 + 112)) {
    goto LABEL_16;
  }
  BOOL v17 = [*(id *)((char *)&self->_beingPushedSyncableCLSAssetItems + 3) count] == 0;

  if (!v17)
  {
    v18 = (NSError *)objc_opt_new();
    v19 = *(NSError **)((char *)&self->super.super._responseStatusError + 3);
    *(NSError **)((char *)&self->super.super._responseStatusError + 3) = v18;

    v16 = [*(id *)((char *)&self->_beingPushedSyncableCLSAssetItems + 3) firstObject];
    ((void (*)(void *, void *, void, void, PDDPPublishHandoutRequest *, id, void *))v10[2])(v10, v16, *(NSError **)((char *)&self->super.super._responseStatusError + 3), *(NSMutableArray **)((char *)&self->_toBePushedSyncableOtherItems + 3), v5, v28, v27);
    [*(id *)((char *)&self->_beingPushedSyncableCLSAssetItems + 3) removeObjectsInArray:*(NSError **)((char *)&self->super.super._responseStatusError + 3)];
LABEL_16:
  }
  CLSInitLog();
  v20 = CLSLogDefault;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [(PDURLRequestOperation *)self stats];
    v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = *(void *)(v21 + 112);
    }
    else {
      uint64_t v23 = 0;
    }
    *(_DWORD *)buf = 134217984;
    uint64_t v37 = v23;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PDPushLocalClassChanges payloadItemCount:%ld.", buf, 0xCu);
  }
  v24 = [(PDURLRequestOperation *)self stats];
  if (!v24 || (BOOL v25 = v24[14] == 0, v24, v25))
  {
    [(PDEndpointRequestOperation *)self markAsFinished];
    v3 = 0;
  }
  else
  {
    v3 = [v28 immutableData];
  }

  _Block_object_dispose(v34, 8);
LABEL_26:

  return v3;
}

- (BOOL)stopProcessingIfResponseStatusPayloadFailed
{
  return 0;
}

- (BOOL)processResponseObject:(id)a3 error:(id *)a4
{
  v43.receiver = self;
  v43.super_class = (Class)PDPushLocalClassChanges;
  BOOL v5 = [(PDAbstractClassZoneOperation *)&v43 processResponseObject:a3 error:a4];
  if (v5)
  {
    if ([*(id *)(&self->super._responseStatusPayloadFailed + 3) count])
    {
      uint64_t v6 = objc_opt_new();
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v7 = *(id *)(&self->super._responseStatusPayloadFailed + 3);
      id v8 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v40;
        do
        {
          id v11 = 0;
          do
          {
            if (*(void *)v40 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = [*(id *)(*((void *)&v39 + 1) + 8 * (void)v11) syncItem];
            uint64_t v13 = [v12 identityValue];
            [v6 addObject:v13];

            id v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v9);
      }

      if (![(PDPushLocalClassChanges *)self _deleteSyncItemsWithIDs:v6])
      {
        CLSInitLog();
        v14 = [(PDPushLocalClassChanges *)self logSubsystem];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "failed to delete processed pending sync items (other)", buf, 2u);
        }
      }
      [*(id *)(&self->super._responseStatusPayloadFailed + 3) removeAllObjects];
    }
    uint64_t v15 = *(uint64_t *)((char *)&self->_multipleChoiceAnswerItemParentChildMap + 3);
    if ((v15 & 0x10) != 0)
    {
      v16 = (objc_class *)objc_opt_class();
      BOOL v17 = NSStringFromClass(v16);
      v18 = [*(id *)((char *)&self->_surveyPayloadIDMap + 3) objectForKeyedSubscript:v17];
      v19 = [v18 allObjects];

      [(PDPushLocalClassChanges *)self updateSurveySyncStatus:v19 status:3];
      uint64_t v15 = *(uint64_t *)((char *)&self->_multipleChoiceAnswerItemParentChildMap + 3);
    }
    if ((v15 & 0x20) != 0)
    {
      v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      v22 = [*(id *)((char *)&self->_surveyPayloadIDMap + 3) objectForKeyedSubscript:v21];
      uint64_t v23 = [v22 allObjects];

      [(PDPushLocalClassChanges *)self updateSchdeuleSyncStatus:v23 status:3];
    }
    if ([*(id *)((char *)&self->super.super._responseStatusError + 3) count])
    {
      v24 = objc_opt_new();
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v25 = *(id *)((char *)&self->super.super._responseStatusError + 3);
      id v26 = [v25 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v35;
        do
        {
          long long v29 = 0;
          do
          {
            if (*(void *)v35 != v28) {
              objc_enumerationMutation(v25);
            }
            long long v30 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * (void)v29), "syncItem", (void)v34);
            long long v31 = [v30 identityValue];
            [v24 addObject:v31];

            long long v29 = (char *)v29 + 1;
          }
          while (v27 != v29);
          id v27 = [v25 countByEnumeratingWithState:&v34 objects:v44 count:16];
        }
        while (v27);
      }

      if (![(PDPushLocalClassChanges *)self _deleteSyncItemsWithIDs:v24])
      {
        CLSInitLog();
        long long v32 = [(PDPushLocalClassChanges *)self logSubsystem];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "failed to delete processed pending sync items (CLSAsset)", buf, 2u);
        }
      }
      objc_msgSend(*(id *)((char *)&self->super.super._responseStatusError + 3), "removeAllObjects", (void)v34);
    }
  }
  return v5;
}

- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PDPushLocalClassChanges;
  BOOL v7 = [(PDAbstractClassZoneOperation *)&v24 processPayloadFromResponse:v6 error:a4];
  if ([v6 hasStatus])
  {
    id v8 = [v6 status];
    if ([v8 code] == 112)
    {
    }
    else
    {
      id v9 = [v6 status];
      unsigned int v10 = [v9 code];

      if (v10 != 2) {
        goto LABEL_19;
      }
    }
    id v11 = 0;
    id v12 = 0;
    switch([v6 type])
    {
      case 0x19u:
        *(NSMutableDictionary **)((char *)&self->_multipleChoiceAnswerItemParentChildMap + 3) = (NSMutableDictionary *)(*(unint64_t *)((char *)&self->_multipleChoiceAnswerItemParentChildMap + 3) | 0x10);
        uint64_t v13 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v13);
        v14 = [v6 survey];
        goto LABEL_9;
      case 0x1Au:
        *(NSMutableDictionary **)((char *)&self->_multipleChoiceAnswerItemParentChildMap + 3) = (NSMutableDictionary *)(*(unint64_t *)((char *)&self->_multipleChoiceAnswerItemParentChildMap + 3) | 0x10);
        uint64_t v15 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v15);
        v16 = [v6 surveyStep];
        goto LABEL_11;
      case 0x1Eu:
        *(NSMutableDictionary **)((char *)&self->_multipleChoiceAnswerItemParentChildMap + 3) = (NSMutableDictionary *)(*(unint64_t *)((char *)&self->_multipleChoiceAnswerItemParentChildMap + 3) | 0x20);
        BOOL v17 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v17);
        v14 = [v6 schedule];
LABEL_9:
        v18 = v14;
        uint64_t v19 = [v14 objectId];
        goto LABEL_12;
      case 0x1Fu:
        *(NSMutableDictionary **)((char *)&self->_multipleChoiceAnswerItemParentChildMap + 3) = (NSMutableDictionary *)(*(unint64_t *)((char *)&self->_multipleChoiceAnswerItemParentChildMap + 3) | 0x20);
        v20 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v20);
        v16 = [v6 scheduledEvent];
LABEL_11:
        v18 = v16;
        uint64_t v19 = [v16 parentObjectId];
LABEL_12:
        id v11 = (void *)v19;

        if (v12 && v11)
        {
          uint64_t v21 = [*(id *)((char *)&self->_surveyPayloadIDMap + 3) objectForKey:v12];

          if (v21)
          {
            v22 = [*(id *)((char *)&self->_surveyPayloadIDMap + 3) objectForKey:v12];
            [v22 addObject:v11];
          }
          else
          {
            v22 = objc_opt_new();
            [v22 addObject:v11];
            [*(id *)((char *)&self->_surveyPayloadIDMap + 3) setObject:v22 forKeyedSubscript:v12];
          }
        }
        break;
      default:
        break;
    }
  }
LABEL_19:

  return v7;
}

- (void)_updateAssetStatusUsingPendingCLSSyncItemsWithIDs:(id)a3 status:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = +[PDPendingSyncItem identityColumnName];
  id v8 = [v7 stringByAppendingString:@" in "];

  id v9 = +[PDDatabase whereSQLForArray:v6 prefix:v8];

  unsigned int v10 = [(PDOperation *)self database];
  id v11 = objc_opt_new();
  uint64_t v12 = objc_opt_class();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10014E7D8;
  v14[3] = &unk_1001F60F0;
  id v13 = v11;
  id v15 = v13;
  [v10 selectAll:v12 where:v9 bindings:v6 block:v14];

  if ([v13 count]) {
    sub_100153804(v10, v13, a4);
  }
}

- (void)updateSurveySyncStatus:(id)a3 status:(int64_t)a4
{
  id v7 = a3;
  id v6 = [(PDOperation *)self database];
  if ([v7 count]) {
    sub_1000BB668(v6, v7, a4);
  }
}

- (void)updateSchdeuleSyncStatus:(id)a3 status:(int64_t)a4
{
  id v7 = a3;
  id v6 = [(PDOperation *)self database];
  if ([v7 count]) {
    sub_1000B4F5C(v6, v7, a4);
  }
}

- (BOOL)_deleteSyncItemsWithIDs:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[PDPendingSyncItem identityColumnName];
  id v6 = [v5 stringByAppendingString:@" in "];

  id v7 = +[PDDatabase whereSQLForArray:v4 prefix:v6];

  id v8 = [(PDOperation *)self database];
  uint64_t v9 = objc_opt_class();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10014EB70;
  v12[3] = &unk_1001F60F0;
  id v13 = v8;
  id v10 = v8;
  [v10 selectAll:v9 where:v7 bindings:v4 block:v12];
  LOBYTE(v9) = [v10 deleteAll:objc_opt_class() where:v7 bindings:v4];

  return v9;
}

- (void)prepare
{
  v2 = self;
  v69.receiver = self;
  v69.super_class = (Class)PDPushLocalClassChanges;
  [(PDAsyncOperation *)&v69 prepare];
  v3 = objc_opt_new();
  id v4 = [(PDOperation *)v2 database];
  uint64_t v5 = objc_opt_new();
  id v6 = *(NSMutableArray **)((char *)&v2->_beingPushedSyncableCLSAssetItems + 3);
  *(NSMutableArray **)((char *)&v2->_beingPushedSyncableCLSAssetItems + 3) = (NSMutableArray *)v5;

  id v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = *(NSMutableArray **)((char *)&v2->_beingPushedSyncableOtherItems + 3);
  *(NSMutableArray **)((char *)&v2->_beingPushedSyncableOtherItems + 3) = (NSMutableArray *)v8;

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = [(PDEndpointRequestOperation *)v2 endpointInfo];
  uint64_t v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = *(void *)(v11 + 64);
  }
  else {
    uint64_t v13 = 0;
  }
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_10014F3A4;
  v65[3] = &unk_1001F6118;
  v65[4] = v2;
  id v14 = v4;
  id v66 = v14;
  id v49 = v3;
  id v67 = v49;
  id v15 = v7;
  id v68 = v15;
  [v14 selectAll:v10, @"entity != ?", @"rowid asc, position asc, state desc, syncOrder asc", v13, 0, &off_10020B260, v65 where orderBy limit offset bindings block];

  if ([*(id *)((char *)&v2->_beingPushedSyncableCLSAssetItems + 3) count])
  {
    id v47 = v15;
    id v48 = v14;
    v51 = objc_opt_new();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = *(id *)((char *)&v2->_beingPushedSyncableOtherItems + 3);
    id v16 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v62;
      uint64_t v52 = *(void *)v62;
      v53 = v2;
      do
      {
        uint64_t v19 = 0;
        id v54 = v17;
        do
        {
          if (*(void *)v62 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v19);
          uint64_t v21 = [v20 syncableItem];
          if (v21)
          {
            v22 = [v20 syncItem];
            id v23 = [v22 entity];

            objc_super v24 = self;
            LODWORD(v23) = [v23 isSubclassOfClass:v24];

            if (v23)
            {
              v56 = v19;
              long long v59 = 0u;
              long long v60 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              id v25 = *(id *)((char *)&v2->_beingPushedSyncableCLSAssetItems + 3);
              id v26 = [v25 countByEnumeratingWithState:&v57 objects:v72 count:16];
              if (v26)
              {
                id v27 = v26;
                uint64_t v28 = *(void *)v58;
LABEL_13:
                uint64_t v29 = 0;
                while (1)
                {
                  if (*(void *)v58 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  long long v30 = *(void **)(*((void *)&v57 + 1) + 8 * v29);
                  long long v31 = [v30 syncableItem];
                  long long v32 = v31;
                  if (v31)
                  {
                    v33 = [v31 parentObjectID];
                    long long v34 = [v21 objectID];
                    unsigned __int8 v35 = [v33 isEqualToString:v34];

                    if (v35) {
                      break;
                    }
                  }

                  if (v27 == (id)++v29)
                  {
                    id v27 = [v25 countByEnumeratingWithState:&v57 objects:v72 count:16];
                    if (v27) {
                      goto LABEL_13;
                    }
                    goto LABEL_20;
                  }
                }
                id v36 = v30;

                if (!v36) {
                  goto LABEL_26;
                }
                [v51 addObject:v36];
                v2 = v53;
                [*(id *)((char *)&v53->_beingPushedSyncableCLSAssetItems + 3) removeObject:v36];
                CLSInitLog();
                long long v37 = (void *)CLSLogDefault;
                id v17 = v54;
                uint64_t v19 = v56;
                if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
                {
                  v38 = v37;
                  long long v39 = [v36 syncableItem];
                  long long v40 = [v39 objectID];
                  *(_DWORD *)buf = 138412290;
                  id v71 = v40;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "PDPushLocalClassChanges: remove CLSAsset sync item (%@) from _toBePushedSyncableNewCLSAssetItems", buf, 0xCu);
                }
                uint64_t v18 = v52;
                if (![*(id *)((char *)&v53->_beingPushedSyncableCLSAssetItems + 3) count])
                {

                  goto LABEL_30;
                }
              }
              else
              {
LABEL_20:

                id v36 = 0;
LABEL_26:
                uint64_t v18 = v52;
                v2 = v53;
                id v17 = v54;
                uint64_t v19 = v56;
              }
            }
          }

          uint64_t v19 = (char *)v19 + 1;
        }
        while (v19 != v17);
        id v17 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
      }
      while (v17);
    }
LABEL_30:

    [*(id *)((char *)&v2->_beingPushedSyncableOtherItems + 3) addObjectsFromArray:v51];
    CLSInitLog();
    long long v41 = (void *)CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      long long v42 = v41;
      id v43 = [v51 count];
      *(_DWORD *)buf = 134217984;
      id v71 = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "PDPushLocalClassChanges: insert %lu CLSAsset to _toBePushedSyncableOtherItems", buf, 0xCu);
    }
    [v51 removeAllObjects];

    id v15 = v47;
    id v14 = v48;
  }
  [*(id *)((char *)&v2->_beingPushedSyncableOtherItems + 3) addObjectsFromArray:v15];
  CLSInitLog();
  v44 = (void *)CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v45 = v44;
    id v46 = [v15 count];
    *(_DWORD *)buf = 134217984;
    id v71 = v46;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "PDPushLocalClassChanges: add %lu toBePushedSyncableOtherCLSAssetItems to _toBePushedSyncableOtherItems", buf, 0xCu);
  }
  [v15 removeAllObjects];
  if ([v49 count]) {
    [(PDPushLocalClassChanges *)v2 _deleteSyncItemsWithIDs:v49];
  }
}

- (BOOL)wantsToExecute
{
  if ([(PDOperation *)self isAborted])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    if ([*(id *)((char *)&self->_beingPushedSyncableCLSAssetItems + 3) count]) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = [*(id *)((char *)&self->_beingPushedSyncableOtherItems + 3) count] != 0;
    }
    CLSInitLog();
    id v4 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = "NO";
      if (v3) {
        uint64_t v5 = "YES";
      }
      int v7 = 136315138;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "PDPushLocalClassChanges wantsToExecute: %s.", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3;
}

- (BOOL)shouldProcessPayload:(id)a3
{
  id v3 = a3;
  id v4 = [v3 status];
  unsigned int v5 = [v3 type];

  unsigned int v6 = [v4 code];
  if (v5 == 1) {
    BOOL v7 = v6 == 1 || [v4 code] == 112;
  }
  else {
    BOOL v7 = v6 - 1 < 2 || v6 == 112;
  }

  return v7;
}

- (BOOL)processPayloadStatus:(id)a3 allowMixedResponse:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 status];
  if ([v9 hasInternalMessage])
  {
    CLSInitLog();
    uint64_t v10 = [(PDPushLocalClassChanges *)self logSubsystem];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v26 = objc_opt_class();
      id v36 = v26;
      id v27 = [(PDURLRequestOperation *)self operationID];
      unsigned int v34 = [v9 code];
      uint64_t v28 = [v9 message];
      [v9 internalMessage];
      *(_DWORD *)buf = 138544386;
      id v43 = v26;
      __int16 v44 = 2114;
      v45 = v27;
      __int16 v46 = 1024;
      *(_DWORD *)id v47 = v34;
      *(_WORD *)&v47[4] = 2112;
      *(void *)&v47[6] = v28;
      v49 = __int16 v48 = 2112;
      uint64_t v29 = (void *)v49;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ status code: %d message: %@ internal message:%@", buf, 0x30u);
    }
  }
  uint64_t v11 = sub_1000F5844(v9);
  [(PDEndpointRequestOperation *)self handleServerAlerts:v11];

  if ([(PDPushLocalClassChanges *)self shouldProcessPayload:v8])
  {
    uint64_t v12 = 0;
LABEL_24:
    BOOL v24 = 1;
    goto LABEL_25;
  }
  uint64_t v12 = sub_1000F51A0(v9, a4);
  if (!v12) {
    goto LABEL_24;
  }
  [(PDEndpointRequestOperation *)self setResponseStatusError:v12];
  if (a5) {
    *a5 = v12;
  }
  CLSInitLog();
  uint64_t v13 = [(PDPushLocalClassChanges *)self logSubsystem];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    long long v30 = objc_opt_class();
    id v31 = v30;
    long long v32 = [(PDURLRequestOperation *)self operationID];
    *(_DWORD *)buf = 138543874;
    id v43 = v30;
    __int16 v44 = 2114;
    v45 = v32;
    __int16 v46 = 2114;
    *(void *)id v47 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ assignment request errored: %{public}@;",
      buf,
      0x20u);
  }
  if ([*(id *)((char *)&self->super.super._responseStatusError + 3) count])
  {
    id v35 = v8;
    id v14 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v33 = 227;
    id v15 = *(id *)((char *)&self->super.super._responseStatusError + 3);
    id v16 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v38;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "syncItem", v33);
          uint64_t v21 = [v20 identityValue];
          [v14 addObject:v21];
        }
        id v17 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v17);
    }

    v22 = [(PDEndpointRequestOperation *)self responseStatusError];
    if ([v22 code] == (id)336) {
      uint64_t v23 = 4;
    }
    else {
      uint64_t v23 = 3;
    }

    [(PDPushLocalClassChanges *)self _updateAssetStatusUsingPendingCLSSyncItemsWithIDs:v14 status:v23];
    [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v33) removeAllObjects];

    BOOL v24 = 0;
    id v8 = v35;
  }
  else
  {
    BOOL v24 = 0;
  }
LABEL_25:

  return v24;
}

- (BOOL)_shouldSkipGeneratingPayload:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [v4 parentObjectID];
    unsigned int v6 = [*(id *)((char *)&self->_toBePushedSyncableNewCLSAssetItems + 3) objectForKey:v5];
    BOOL v7 = v6 != 0;

    if (!v6) {
      [*(id *)((char *)&self->_toBePushedSyncableNewCLSAssetItems + 3) setObject:&off_10020AF98 forKeyedSubscript:v5];
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_surveyPayloadIDMap + 3), 0);
  objc_storeStrong((id *)((char *)&self->_toBePushedSyncableOtherItems + 3), 0);
  objc_storeStrong((id *)((char *)&self->_toBePushedSyncableNewCLSAssetItems + 3), 0);
  objc_storeStrong((id *)((char *)&self->_beingPushedSyncableOtherItems + 3), 0);
  objc_storeStrong((id *)((char *)&self->_beingPushedSyncableCLSAssetItems + 3), 0);
  objc_storeStrong((id *)(&self->super._responseStatusPayloadFailed + 3), 0);

  objc_storeStrong((id *)((char *)&self->super.super._responseStatusError + 3), 0);
}

@end