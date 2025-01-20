@interface DRSConfigMetadata
+ (BOOL)_isValidState:(unsigned __int8)a3 completionType:(unint64_t)a4 receivedDate:(id)a5 appliedDate:(id)a6 completedDate:(id)a7 completionDescription:(id)a8;
+ (id)_ON_CONTEXT_QUEUE_configMetadataForFilterPredicate:(id)a3 context:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 errorOut:(id *)a7;
+ (id)_ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:(id)a3 context:(id)a4 errorOut:(id *)a5;
+ (unint64_t)_ON_CONTEXT_QUEUE_countForFilterPredicate:(id)a3 context:(id)a4 errorOut:(id *)a5;
- (BOOL)_updateContextWithMORepresentation:(id)a3 errorOut:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)logTelemetry;
- (BOOL)reportToDecisionServer;
- (DRConfig)config;
- (DRSConfigMetadata)initWithTeamID:(id)a3 configUUID:(id)a4 state:(unsigned __int8)a5 completionType:(unint64_t)a6 receivedDate:(id)a7 appliedDate:(id)a8 completedDate:(id)a9 completionDescription:(id)a10 config:(id)a11 logTelemetry:(BOOL)a12 reportToDecisionServer:(BOOL)a13;
- (NSDate)appliedDate;
- (NSDate)completedDate;
- (NSDate)receivedDate;
- (NSString)completionDescription;
- (NSString)teamID;
- (NSUUID)configUUID;
- (id)_ON_CONTEXT_QUEUE_initWithConfigMetadataMO:(id)a3;
- (id)_ON_CONTEXT_QUEUE_moRepresentationInContext:(id)a3 createIfMissing:(BOOL)a4 errorOut:(id *)a5;
- (id)_uuidPredicate;
- (id)jsonDictionaryRepresentation;
- (unint64_t)completionType;
- (unsigned)state;
@end

@implementation DRSConfigMetadata

+ (BOOL)_isValidState:(unsigned __int8)a3 completionType:(unint64_t)a4 receivedDate:(id)a5 appliedDate:(id)a6 completedDate:(id)a7 completionDescription:(id)a8
{
  int v12 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v17 = v16;
  if (v13)
  {
    if ((v12 - 1) >= 2) {
      BOOL v18 = a4 != 4097;
    }
    else {
      BOOL v18 = a4 == 4097;
    }
    if (v18)
    {
      if (v12 == 3 || !v16)
      {
        switch(v12)
        {
          case 3:
            if (!v14)
            {
              v19 = DPLogHandle_ConfigPersistedStoreError();
              if (!os_signpost_enabled(v19)) {
                goto LABEL_16;
              }
              LOWORD(v25[0]) = 0;
              v20 = "Missing applied date";
              goto LABEL_12;
            }
            if (!v15)
            {
              v19 = DPLogHandle_ConfigPersistedStoreError();
              if (!os_signpost_enabled(v19)) {
                goto LABEL_16;
              }
              LOWORD(v25[0]) = 0;
              v20 = "Complete state must have a non-nil completed date";
              goto LABEL_12;
            }
            if ([v14 compare:v13] == -1)
            {
              v19 = DPLogHandle_ConfigPersistedStoreError();
              if (!os_signpost_enabled(v19)) {
                goto LABEL_16;
              }
              LOWORD(v25[0]) = 0;
              v20 = "Applied date < received date";
              goto LABEL_12;
            }
            if ([v15 compare:v14] == -1)
            {
              v19 = DPLogHandle_ConfigPersistedStoreError();
              if (!os_signpost_enabled(v19)) {
                goto LABEL_16;
              }
              LOWORD(v25[0]) = 0;
              v20 = "Completed date > applied date";
              goto LABEL_12;
            }
            break;
          case 2:
            if (!v14)
            {
              v19 = DPLogHandle_ConfigPersistedStoreError();
              if (!os_signpost_enabled(v19)) {
                goto LABEL_16;
              }
              LOWORD(v25[0]) = 0;
              v20 = "Missing applied date";
              goto LABEL_12;
            }
            if (v15)
            {
              v19 = DPLogHandle_ConfigPersistedStoreError();
              if (!os_signpost_enabled(v19)) {
                goto LABEL_16;
              }
              LOWORD(v25[0]) = 0;
              v20 = "Active state must have a nil completed date";
              goto LABEL_12;
            }
            if ([v14 compare:v13] == -1)
            {
              v19 = DPLogHandle_ConfigPersistedStoreError();
              if (!os_signpost_enabled(v19)) {
                goto LABEL_16;
              }
              LOWORD(v25[0]) = 0;
              v20 = "Applied date > received date";
              goto LABEL_12;
            }
            break;
          case 1:
            if (v14)
            {
              v19 = DPLogHandle_ConfigPersistedStoreError();
              if (!os_signpost_enabled(v19)) {
                goto LABEL_16;
              }
              LOWORD(v25[0]) = 0;
              v20 = "Waiting state must have nil applied date";
              goto LABEL_12;
            }
            if (v15)
            {
              v19 = DPLogHandle_ConfigPersistedStoreError();
              if (!os_signpost_enabled(v19)) {
                goto LABEL_16;
              }
              LOWORD(v25[0]) = 0;
              v20 = "Waiting state must have nil completed date";
              goto LABEL_12;
            }
            break;
        }
        BOOL v23 = 1;
        goto LABEL_17;
      }
      v19 = DPLogHandle_ConfigPersistedStoreError();
      if (os_signpost_enabled(v19))
      {
        LOWORD(v25[0]) = 0;
        v20 = "Waiting state must have nil completion description";
LABEL_12:
        v21 = v19;
        uint32_t v22 = 2;
LABEL_15:
        _os_signpost_emit_with_name_impl(&dword_209E70000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidMetadataConfiguration", v20, (uint8_t *)v25, v22);
      }
    }
    else
    {
      v19 = DPLogHandle_ConfigPersistedStoreError();
      if (os_signpost_enabled(v19))
      {
        v25[0] = 67109376;
        v25[1] = v12;
        __int16 v26 = 2048;
        unint64_t v27 = a4;
        v20 = "State %u is incompatible with completion type: %llu";
        v21 = v19;
        uint32_t v22 = 18;
        goto LABEL_15;
      }
    }
  }
  else
  {
    v19 = DPLogHandle_ConfigPersistedStoreError();
    if (os_signpost_enabled(v19))
    {
      LOWORD(v25[0]) = 0;
      v20 = "Missing received date";
      goto LABEL_12;
    }
  }
LABEL_16:

  BOOL v23 = 0;
LABEL_17:

  return v23;
}

- (DRSConfigMetadata)initWithTeamID:(id)a3 configUUID:(id)a4 state:(unsigned __int8)a5 completionType:(unint64_t)a6 receivedDate:(id)a7 appliedDate:(id)a8 completedDate:(id)a9 completionDescription:(id)a10 config:(id)a11 logTelemetry:(BOOL)a12 reportToDecisionServer:(BOOL)a13
{
  unsigned int v31 = a5;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v38 = a4;
  id v37 = a7;
  id v36 = a8;
  id v35 = a9;
  id v34 = a10;
  id v19 = a11;
  v39 = v19;
  if (!v18)
  {
    uint32_t v22 = DPLogHandle_ConfigPersistedStoreError();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      BOOL v23 = "Missing teamID";
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    __int16 v26 = 0;
    unint64_t v27 = self;
    goto LABEL_19;
  }
  id v32 = v18;
  if (v19
    && ([v19 teamID],
        v20 = objc_claimAutoreleasedReturnValue(),
        char v21 = [v20 isEqualToString:v32],
        v20,
        id v19 = v39,
        (v21 & 1) == 0))
  {
    v24 = DPLogHandle_ConfigPersistedStoreError();
    if (os_signpost_enabled(v24))
    {
      v25 = [v39 teamID];
      *(_DWORD *)buf = 138543618;
      id v42 = v32;
      __int16 v43 = 2114;
      v44 = v25;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidMetadataConfiguration", "teamID does not match config teamID (%{public}@ vs %{public}@)", buf, 0x16u);
    }
    __int16 v26 = 0;
    id v18 = v32;
    unint64_t v27 = self;
  }
  else
  {
    if (!v38)
    {
      uint32_t v22 = DPLogHandle_ConfigPersistedStoreError();
      id v18 = v32;
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        BOOL v23 = "Missing UUID";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    id v18 = v32;
    if (v31 != 3 && !v19)
    {
      uint32_t v22 = DPLogHandle_ConfigPersistedStoreError();
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        BOOL v23 = "Waiting or active state must have config";
LABEL_16:
        _os_signpost_emit_with_name_impl(&dword_209E70000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidMetadataConfiguration", v23, buf, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    if (![(id)objc_opt_class() _isValidState:v31 completionType:a6 receivedDate:v37 appliedDate:v36 completedDate:v35 completionDescription:v34])goto LABEL_18; {
    v40.receiver = self;
    }
    v40.super_class = (Class)DRSConfigMetadata;
    v29 = [(DRSConfigMetadata *)&v40 init];
    if (v29)
    {
      v30 = v29;
      objc_storeStrong((id *)&v29->_teamID, a3);
      objc_storeStrong((id *)&v30->_configUUID, a4);
      v30->_state = v31;
      v30->_completionType = a6;
      objc_storeStrong((id *)&v30->_receivedDate, a7);
      objc_storeStrong((id *)&v30->_appliedDate, a8);
      objc_storeStrong((id *)&v30->_completedDate, a9);
      objc_storeStrong((id *)&v30->_completionDescription, a10);
      objc_storeStrong((id *)&v30->_config, a11);
      v29 = v30;
      v30->_logTelemetry = a12;
      id v18 = v32;
      v29->_reportToDecisionServer = a13;
    }
    unint64_t v27 = v29;
    __int16 v26 = v27;
  }
LABEL_19:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DRSConfigMetadata *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_23;
  }
  if (v4 == self)
  {
    char v47 = 1;
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;
    int v7 = [(DRSConfigMetadata *)self state];
    if (v7 != [(DRSConfigMetadata *)v6 state]) {
      goto LABEL_21;
    }
    unint64_t v8 = [(DRSConfigMetadata *)self completionType];
    if (v8 != [(DRSConfigMetadata *)v6 completionType]) {
      goto LABEL_21;
    }
    BOOL v9 = [(DRSConfigMetadata *)self logTelemetry];
    if (v9 != [(DRSConfigMetadata *)v6 logTelemetry]) {
      goto LABEL_21;
    }
    BOOL v10 = [(DRSConfigMetadata *)self reportToDecisionServer];
    if (v10 != [(DRSConfigMetadata *)v6 reportToDecisionServer]) {
      goto LABEL_21;
    }
    v11 = [(DRSConfigMetadata *)self teamID];
    int v12 = [(DRSConfigMetadata *)v6 teamID];
    int v13 = [v11 isEqualToString:v12];

    if (!v13) {
      goto LABEL_21;
    }
    id v14 = [(DRSConfigMetadata *)self configUUID];
    id v15 = [(DRSConfigMetadata *)v6 configUUID];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_21;
    }
    v17 = [(DRSConfigMetadata *)self receivedDate];
    id v18 = [(DRSConfigMetadata *)v6 receivedDate];
    int v19 = [v17 isEqualToDate:v18];

    if (!v19) {
      goto LABEL_21;
    }
    v20 = [(DRSConfigMetadata *)self appliedDate];
    char v21 = [(DRSConfigMetadata *)v6 appliedDate];
    char IsNil = _oneIsNil((uint64_t)v20, (uint64_t)v21);

    if (IsNil) {
      goto LABEL_21;
    }
    uint64_t v23 = [(DRSConfigMetadata *)self appliedDate];
    if (v23)
    {
      v24 = (void *)v23;
      v25 = [(DRSConfigMetadata *)self appliedDate];
      __int16 v26 = [(DRSConfigMetadata *)v6 appliedDate];
      int v27 = [v25 isEqualToDate:v26];

      if (!v27) {
        goto LABEL_21;
      }
    }
    uint64_t v28 = [(DRSConfigMetadata *)self completedDate];
    v29 = [(DRSConfigMetadata *)v6 completedDate];
    char v30 = _oneIsNil((uint64_t)v28, (uint64_t)v29);

    if (v30) {
      goto LABEL_21;
    }
    uint64_t v31 = [(DRSConfigMetadata *)self completedDate];
    if (v31)
    {
      id v32 = (void *)v31;
      v33 = [(DRSConfigMetadata *)self completedDate];
      id v34 = [(DRSConfigMetadata *)v6 completedDate];
      int v35 = [v33 isEqualToDate:v34];

      if (!v35) {
        goto LABEL_21;
      }
    }
    id v36 = [(DRSConfigMetadata *)self completionDescription];
    id v37 = [(DRSConfigMetadata *)v6 completionDescription];
    char v38 = _oneIsNil((uint64_t)v36, (uint64_t)v37);

    if (v38) {
      goto LABEL_21;
    }
    uint64_t v39 = [(DRSConfigMetadata *)self completionDescription];
    if (v39)
    {
      objc_super v40 = (void *)v39;
      v41 = [(DRSConfigMetadata *)self completionDescription];
      id v42 = [(DRSConfigMetadata *)v6 completionDescription];
      int v43 = [v41 isEqualToString:v42];

      if (!v43) {
        goto LABEL_21;
      }
    }
    v44 = [(DRSConfigMetadata *)self config];
    uint64_t v45 = [(DRSConfigMetadata *)v6 config];
    char v46 = _oneIsNil((uint64_t)v44, (uint64_t)v45);

    if ((v46 & 1) == 0)
    {
      uint64_t v49 = [(DRSConfigMetadata *)self config];
      if (v49)
      {
        v50 = (void *)v49;
        v51 = [(DRSConfigMetadata *)self config];
        v52 = [(DRSConfigMetadata *)v6 config];
        char v47 = [v51 isEqual:v52];
      }
      else
      {
        char v47 = 1;
      }
    }
    else
    {
LABEL_21:
      char v47 = 0;
    }
  }
  else
  {
LABEL_23:
    char v47 = 0;
  }
LABEL_25:

  return v47;
}

- (id)_ON_CONTEXT_QUEUE_initWithConfigMetadataMO:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 configMO];
  uint32_t v22 = (void *)v5;
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = objc_alloc(MEMORY[0x263F3A180]);
    uint64_t v23 = objc_msgSend(v7, "ON_CONTEXT_QUEUE_initWithConfigMO:", v6);
  }
  else
  {
    uint64_t v23 = 0;
  }
  char v21 = self;
  v20 = [v4 teamID];
  unint64_t v8 = [v4 configUUID];
  unsigned __int8 v9 = [v4 state];
  uint64_t v10 = [v4 completionType];
  v11 = [v4 receivedDate];
  int v12 = [v4 appliedDate];
  int v13 = [v4 completedDate];
  id v14 = [v4 completionDescription];
  char v15 = [v4 logTelemetry];
  char v16 = [v4 reportToDecisionServer];

  BYTE1(v19) = v16;
  LOBYTE(v19) = v15;
  v17 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v21, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v20, v8, v9, v10, v11, v12, v13, v14, v23, v19);

  return v17;
}

- (id)_uuidPredicate
{
  v2 = (void *)MEMORY[0x263F08A98];
  v3 = [(DRSConfigMetadata *)self configUUID];
  id v4 = [v2 predicateWithFormat:@"configUUID == %@", v3];

  return v4;
}

+ (id)_ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:(id)a3 context:(id)a4 errorOut:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unsigned __int8 v9 = (void *)MEMORY[0x263F08A98];
  id v10 = a4;
  v11 = [v9 predicateWithFormat:@"configUUID == %@", v8];
  int v12 = objc_msgSend(a1, "_ON_CONTEXT_QUEUE_configMetadataForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:", v11, v10, 0, 0, a5);

  int v13 = 0;
  if (!*a5 && v12)
  {
    if ([v12 count])
    {
      if ([v12 count] == 1)
      {
        int v13 = [v12 firstObject];
        goto LABEL_10;
      }
      id v14 = DPLogHandle_ConfigPersistedStoreError();
      if (os_signpost_enabled(v14))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v8;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataQueryFailed", "Found more than 1 ConfigMetadata with UUID %{public}@", buf, 0xCu);
      }

      char v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08320];
      uint64_t v19 = @"Duplicate UUIDs";
      char v16 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      *a5 = [v15 errorWithDomain:@"DRSConfigPersistenceError" code:0 userInfo:v16];
    }
    int v13 = 0;
  }
LABEL_10:

  return v13;
}

+ (id)_ON_CONTEXT_QUEUE_configMetadataForFilterPredicate:(id)a3 context:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 errorOut:(id *)a7
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a3;
  id v14 = +[DRSConfigMetadataMO fetchRequest];
  [v14 setPredicate:v13];

  [v14 setSortDescriptors:v12];
  if (a6) {
    [v14 setFetchLimit:a6];
  }
  id v22 = 0;
  char v15 = [v11 executeFetchRequest:v14 error:&v22];
  id v16 = v22;
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
    *a7 = v18;
    uint64_t v19 = DPLogHandle_ConfigPersistedStoreError();
    if (os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v18;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataQueryFailed", "Failed due to error %{public}@", buf, 0xCu);
    }

    id v20 = 0;
  }
  else
  {
    id v20 = v15;
  }

  return v20;
}

+ (unint64_t)_ON_CONTEXT_QUEUE_countForFilterPredicate:(id)a3 context:(id)a4 errorOut:(id *)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  unsigned __int8 v9 = +[DRSConfigMetadataMO fetchRequest];
  [v9 setPredicate:v8];

  id v16 = 0;
  unint64_t v10 = [v7 countForFetchRequest:v9 error:&v16];

  id v11 = v16;
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
    *a5 = v13;
    id v14 = DPLogHandle_ConfigPersistedStoreError();
    if (os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataCountQueryFailed", "Failed due to error %{public}@", buf, 0xCu);
    }

    unint64_t v10 = 0;
  }

  return v10;
}

- (id)_ON_CONTEXT_QUEUE_moRepresentationInContext:(id)a3 createIfMissing:(BOOL)a4 errorOut:(id *)a5
{
  BOOL v6 = a4;
  v34[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  unsigned __int8 v9 = objc_opt_class();
  unint64_t v10 = [(DRSConfigMetadata *)self configUUID];
  objc_msgSend(v9, "_ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:context:errorOut:", v10, v8, a5);
  id v11 = (DRSConfigMetadataMO *)objc_claimAutoreleasedReturnValue();

  if (*a5) {
    goto LABEL_2;
  }
  id v13 = v11;
  if (!v11)
  {
    if (v6)
    {
      id v13 = [[DRSConfigMetadataMO alloc] initWithContext:v8];
      if (v13) {
        goto LABEL_4;
      }
      id v24 = NSString;
      uint64_t v25 = [(DRSConfigMetadata *)self configUUID];
      __int16 v26 = [v24 stringWithFormat:@"Could not create DRSConfigMetadataMO instance for %@", v25];

      int v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F08320];
      v34[0] = v26;
      uint64_t v28 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
      *a5 = [v27 errorWithDomain:@"DRSConfigPersistenceError" code:0 userInfo:v28];

      v29 = DPLogHandle_ConfigPersistedStoreError();
      if (os_signpost_enabled(v29))
      {
        char v30 = [(DRSConfigMetadata *)self configUUID];
        *(_DWORD *)buf = 138543362;
        id v32 = v30;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataQueryFailed", "Could not initalize DRSConfigMetadataMO instance for %{public}@", buf, 0xCu);
      }
    }
    id v11 = 0;
LABEL_2:
    id v12 = 0;
    goto LABEL_8;
  }
LABEL_4:
  id v14 = [(DRSConfigMetadata *)self teamID];
  [(DRSConfigMetadataMO *)v13 setTeamID:v14];

  char v15 = [(DRSConfigMetadata *)self configUUID];
  [(DRSConfigMetadataMO *)v13 setConfigUUID:v15];

  [(DRSConfigMetadataMO *)v13 setState:[(DRSConfigMetadata *)self state]];
  [(DRSConfigMetadataMO *)v13 setCompletionType:[(DRSConfigMetadata *)self completionType]];
  id v16 = [(DRSConfigMetadata *)self receivedDate];
  [(DRSConfigMetadataMO *)v13 setReceivedDate:v16];

  v17 = [(DRSConfigMetadata *)self appliedDate];
  [(DRSConfigMetadataMO *)v13 setAppliedDate:v17];

  id v18 = [(DRSConfigMetadata *)self completedDate];
  [(DRSConfigMetadataMO *)v13 setCompletedDate:v18];

  uint64_t v19 = [(DRSConfigMetadata *)self completionDescription];
  [(DRSConfigMetadataMO *)v13 setCompletionDescription:v19];

  [(DRSConfigMetadataMO *)v13 setLogTelemetry:[(DRSConfigMetadata *)self logTelemetry]];
  [(DRSConfigMetadataMO *)v13 setReportToDecisionServer:[(DRSConfigMetadata *)self reportToDecisionServer]];
  if (!v11)
  {
    id v20 = [(DRSConfigMetadata *)self config];

    if (v20)
    {
      id v21 = [(DRSConfigMetadata *)self config];
      id v22 = objc_msgSend(v21, "ON_CONTEXT_QUEUE_configMOInContext:", v8);

      [(DRSConfigMetadataMO *)v13 setConfigMO:v22];
    }
  }
  id v11 = v13;
  id v12 = v11;
LABEL_8:

  return v12;
}

- (BOOL)_updateContextWithMORepresentation:(id)a3 errorOut:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  id v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__DRSConfigMetadata__updateContextWithMORepresentation_errorOut___block_invoke;
  v10[3] = &unk_263FC9AA0;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  id v12 = &v14;
  id v13 = &v20;
  [v7 performBlockAndWait:v10];
  if (a4) {
    *a4 = (id) v15[5];
  }
  char v8 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __65__DRSConfigMetadata__updateContextWithMORepresentation_errorOut___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  id v4 = objc_msgSend(v2, "_ON_CONTEXT_QUEUE_moRepresentationInContext:createIfMissing:errorOut:", v3, 1, &v7);
  id v5 = v7;
  id v6 = v7;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v5);
  if (v4) {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

- (id)jsonDictionaryRepresentation
{
  v30[6] = *MEMORY[0x263EF8340];
  v29[0] = @"teamID";
  uint64_t v28 = [(DRSConfigMetadata *)self teamID];
  v30[0] = v28;
  v29[1] = @"configUUID";
  uint64_t v3 = [(DRSConfigMetadata *)self configUUID];
  id v4 = [v3 UUIDString];
  v30[1] = v4;
  v29[2] = @"receivedDate";
  id v5 = NSNumber;
  id v6 = [(DRSConfigMetadata *)self receivedDate];
  [v6 timeIntervalSince1970];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  v30[2] = v7;
  v29[3] = @"state";
  [(DRSConfigMetadata *)self state];
  char v8 = DRConfigStringForState();
  v30[3] = v8;
  v29[4] = @"logTelemetry";
  unsigned __int8 v9 = objc_msgSend(NSNumber, "numberWithBool:", -[DRSConfigMetadata logTelemetry](self, "logTelemetry"));
  v30[4] = v9;
  v29[5] = @"reportToDPDS";
  unint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[DRSConfigMetadata reportToDecisionServer](self, "reportToDecisionServer"));
  v30[5] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:6];
  id v12 = (void *)[v11 mutableCopy];

  id v13 = [(DRSConfigMetadata *)self appliedDate];

  if (v13)
  {
    uint64_t v14 = NSNumber;
    char v15 = [(DRSConfigMetadata *)self appliedDate];
    [v15 timeIntervalSince1970];
    uint64_t v16 = objc_msgSend(v14, "numberWithDouble:");
    [v12 setObject:v16 forKeyedSubscript:@"appliedDate"];
  }
  v17 = [(DRSConfigMetadata *)self completedDate];

  if (v17)
  {
    id v18 = NSNumber;
    id v19 = [(DRSConfigMetadata *)self completedDate];
    [v19 timeIntervalSince1970];
    uint64_t v20 = objc_msgSend(v18, "numberWithDouble:");
    [v12 setObject:v20 forKeyedSubscript:@"completedDate"];
  }
  if ([(DRSConfigMetadata *)self completionType] != 4097)
  {
    id v21 = DRConfigCompletionTypeString([(DRSConfigMetadata *)self completionType]);
    [v12 setObject:v21 forKeyedSubscript:@"completionType"];

    uint64_t v22 = [(DRSConfigMetadata *)self completionDescription];

    if (v22)
    {
      char v23 = [(DRSConfigMetadata *)self completionDescription];
      [v12 setObject:v23 forKeyedSubscript:@"completionDescription"];
    }
  }
  id v24 = [(DRSConfigMetadata *)self config];

  if (v24)
  {
    uint64_t v25 = [(DRSConfigMetadata *)self config];
    __int16 v26 = [v25 jsonDictRepresentation];
    [v12 setObject:v26 forKeyedSubscript:@"config"];
  }

  return v12;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSUUID)configUUID
{
  return self->_configUUID;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (unsigned)state
{
  return self->_state;
}

- (unint64_t)completionType
{
  return self->_completionType;
}

- (NSDate)appliedDate
{
  return self->_appliedDate;
}

- (NSDate)completedDate
{
  return self->_completedDate;
}

- (NSString)completionDescription
{
  return self->_completionDescription;
}

- (BOOL)logTelemetry
{
  return self->_logTelemetry;
}

- (BOOL)reportToDecisionServer
{
  return self->_reportToDecisionServer;
}

- (DRConfig)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_completionDescription, 0);
  objc_storeStrong((id *)&self->_completedDate, 0);
  objc_storeStrong((id *)&self->_appliedDate, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_configUUID, 0);

  objc_storeStrong((id *)&self->_teamID, 0);
}

@end