@interface ATXMinimalAction
+ (id)datastore;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXMinimalAction)initWithBundleId:(id)a3 actionType:(id)a4 paramHash:(int64_t)a5;
- (ATXMinimalAction)initWithProto:(id)a3;
- (ATXMinimalAction)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXMinimalAction:(id)a3;
- (NSString)actionType;
- (NSString)bundleId;
- (id)actionFromDatastoreLookup;
- (id)actionFromDatastoreLookupForDatastore:(id)a3;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (int64_t)paramHash;
- (unsigned)dataVersion;
@end

@implementation ATXMinimalAction

- (ATXMinimalAction)initWithBundleId:(id)a3 actionType:(id)a4 paramHash:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXMinimalAction;
  v10 = [(ATXMinimalAction *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    bundleId = v10->_bundleId;
    v10->_bundleId = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    actionType = v10->_actionType;
    v10->_actionType = (NSString *)v13;

    v10->_paramHash = a5;
  }

  return v10;
}

- (id)actionFromDatastoreLookup
{
  v3 = [(id)objc_opt_class() datastore];
  v4 = [(ATXMinimalAction *)self actionFromDatastoreLookupForDatastore:v3];

  return v4;
}

+ (id)datastore
{
  return +[_ATXDataStore sharedInstance];
}

- (id)actionFromDatastoreLookupForDatastore:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__35;
  objc_super v16 = __Block_byref_object_dispose__35;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke;
  v8[3] = &unk_1E68AD278;
  id v5 = v4;
  id v9 = v5;
  v10 = self;
  uint64_t v11 = &v12;
  [v5 _doSync:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_2;
  v5[3] = &unk_1E68AD200;
  uint64_t v6 = *(void *)(a1 + 40);
  v3[4] = v6;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_3;
  v4[3] = &unk_1E68AD228;
  v4[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  [v2 prepAndRunQuery:@"SELECT slotSetKey.uuid, alog.slots FROM alog, slotSetKey, alogBundleId, alogAction WHERE alog.id = slotSetKey.alogId AND alog.bundleId = alogBundleId.id AND alog.actionType = alogAction.id AND alogBundleId.bundleId=? AND alogAction.actionType=? AND slotSetKey.paramHash=? ORDER BY date DESC LIMIT 1", v5, v4, v3 onPrep onRow onError];
}

void __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  [v4 bindParam:1 toNSString:v3];
  [v4 bindParam:2 toNSString:*(void *)(*(void *)(a1 + 32) + 16)];
  [v4 bindParam:3 toInt64:*(void *)(*(void *)(a1 + 32) + 24)];
}

uint64_t __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 getNSDataForColumn:0];
  if (v4) {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v4, "bytes"));
  }
  else {
    id v5 = 0;
  }
  id v33 = 0;
  uint64_t v6 = [v3 getNSDataForColumn:1];
  if (v6)
  {
    v7 = ATXSlotSetsDeserialize();
  }
  else
  {
    v7 = 0;
  }
  uint64_t v8 = [v7 first];
  uint64_t v28 = a1;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  [v7 second];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
  id v13 = v11;
  if (v12)
  {
    uint64_t v14 = v12;
    v26 = v4;
    id v27 = v3;
    uint64_t v15 = *(void *)v30;
LABEL_9:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v30 != v15) {
        objc_enumerationMutation(v11);
      }
      id v17 = *(void **)(*((void *)&v29 + 1) + 8 * v16);
      v18 = [v17 uuid];
      char v19 = [v18 isEqual:v5];

      if (v19) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v14) {
          goto LABEL_9;
        }
        id v13 = v11;
        id v4 = v26;
        id v3 = v27;
        goto LABEL_18;
      }
    }
    id v13 = v17;

    id v4 = v26;
    id v3 = v27;
    if (!v13) {
      goto LABEL_19;
    }
    v20 = *(void **)(*(void *)(*(void *)(v28 + 32) + 8) + 40);
    v21 = [v13 parameters];
    uint64_t v22 = [v20 copyWithParameterWhitelist:v21];
    uint64_t v23 = *(void *)(*(void *)(v28 + 32) + 8);
    v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
LABEL_18:

LABEL_19:
  return *MEMORY[0x1E4F93C10];
}

uint64_t __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_4_cold_1(a1, (uint64_t)v3, v4);
  }

  id v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v5;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v5 = a3;
    uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)jsonDict
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6[0] = @"bundleId";
  v6[1] = @"actionType";
  actionType = self->_actionType;
  v7[0] = self->_bundleId;
  v7[1] = actionType;
  v6[2] = @"paramHash";
  id v3 = [NSNumber numberWithLongLong:self->_paramHash];
  v7[2] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(ATXMinimalAction *)self jsonDict];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXMinimalAction *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXMinimalAction *)self isEqualToATXMinimalAction:v5];

  return v6;
}

- (BOOL)isEqualToATXMinimalAction:(id)a3
{
  id v4 = (id *)a3;
  bundleId = self->_bundleId;
  BOOL v6 = (NSString *)v4[1];
  if (bundleId == v6)
  {
  }
  else
  {
    v7 = v6;
    uint64_t v8 = bundleId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_7;
    }
  }
  actionType = self->_actionType;
  id v11 = (NSString *)v4[2];
  if (actionType == v11)
  {

    goto LABEL_9;
  }
  uint64_t v12 = v11;
  id v13 = actionType;
  char v14 = [(NSString *)v13 isEqual:v12];

  if (v14)
  {
LABEL_9:
    BOOL v15 = self->_paramHash == (void)v4[3];
    goto LABEL_10;
  }
LABEL_7:
  BOOL v15 = 0;
LABEL_10:

  return v15;
}

- (ATXMinimalAction)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBMinimalAction alloc] initWithData:v4];

    self = [(ATXMinimalAction *)self initWithProto:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXMinimalAction *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (ATXMinimalAction)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXMinimalAction initWithProto:]((uint64_t)self, v10);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  BOOL v6 = [v5 bundleId];
  v7 = [v5 actionType];
  uint64_t v8 = [v5 paramHash];

  self = [(ATXMinimalAction *)self initWithBundleId:v6 actionType:v7 paramHash:v8];
  char v9 = self;
LABEL_8:

  return v9;
}

- (id)proto
{
  id v3 = objc_opt_new();
  [v3 setBundleId:self->_bundleId];
  [v3 setActionType:self->_actionType];
  [v3 setParamHash:self->_paramHash];
  return v3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (int64_t)paramHash
{
  return self->_paramHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

void __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_4_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Unable to fetch action corresponding to minimalAction %@. Error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  int v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  __int16 v6 = v4;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);
}

@end