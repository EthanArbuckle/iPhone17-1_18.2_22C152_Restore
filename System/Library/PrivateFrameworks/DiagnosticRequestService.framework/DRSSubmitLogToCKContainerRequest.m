@interface DRSSubmitLogToCKContainerRequest
+ (BOOL)_requestMOHasRequiredFields_ON_MOC_QUEUE:(id)a3;
+ (Class)_moClass;
+ (id)entityName;
+ (id)safeguardArchiveZoneID;
+ (id)xcRecordZoneID;
- (BOOL)isEqualToRequest:(id)a3;
- (DRSSubmitLogToCKContainerRequest)initWithXPCDict:(id)a3;
- (NSData)recordDictionaryData;
- (NSDictionary)recordDictionary;
- (NSString)containerName;
- (NSString)fileAssetField;
- (NSString)recordType;
- (id)_initWithSubmitLogToCKContainerRequestMO_ON_MOC_QUEUE:(id)a3;
- (id)debugDescription;
- (id)jsonCompatibleDictionaryRepresentationVerbose:(BOOL)a3;
- (id)recordRepresentation;
- (id)requestType;
- (id)zoneID;
- (unint64_t)expectedType;
- (void)_configureRequestMO:(id)a3;
@end

@implementation DRSSubmitLogToCKContainerRequest

- (id)debugDescription
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)DRSSubmitLogToCKContainerRequest;
  v4 = [(DRSRequest *)&v11 debugDescription];
  v5 = [(DRSSubmitLogToCKContainerRequest *)self containerName];
  v6 = [(DRSSubmitLogToCKContainerRequest *)self recordType];
  v7 = [(DRSSubmitLogToCKContainerRequest *)self fileAssetField];
  v8 = [(DRSSubmitLogToCKContainerRequest *)self recordDictionary];
  v9 = [v3 stringWithFormat:@"%@ %@ %@ %@ %@", v4, v5, v6, v7, v8];

  return v9;
}

- (void)_configureRequestMO:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DRSSubmitLogToCKContainerRequest;
  [(DRSSubmitLogRequest *)&v10 _configureRequestMO:v4];
  id v5 = v4;
  v6 = [(DRSSubmitLogToCKContainerRequest *)self containerName];
  [v5 setContainerName:v6];

  v7 = [(DRSSubmitLogToCKContainerRequest *)self recordType];
  [v5 setRecordType:v7];

  v8 = [(DRSSubmitLogToCKContainerRequest *)self fileAssetField];
  [v5 setFileAssetField:v8];

  v9 = [(DRSSubmitLogToCKContainerRequest *)self recordDictionaryData];
  [v5 setRecordDictionaryData:v9];
}

+ (Class)_moClass
{
  return (Class)objc_opt_class();
}

+ (id)entityName
{
  return @"DRSSubmitLogToCKContainerRequestMO";
}

- (unint64_t)expectedType
{
  return 4;
}

- (DRSSubmitLogToCKContainerRequest)initWithXPCDict:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)DRSSubmitLogToCKContainerRequest;
  id v5 = [(DRSRequest *)&v38 initWithXPCDict:v4];
  if (v5)
  {
    string = xpc_dictionary_get_string(v4, "containerName");
    if (!string) {
      goto LABEL_27;
    }
    uint64_t v7 = [NSString stringWithUTF8String:string];
    containerName = v5->_containerName;
    v5->_containerName = (NSString *)v7;

    v9 = xpc_dictionary_get_string(v4, "RecordType");
    if (!v9) {
      goto LABEL_27;
    }
    uint64_t v10 = [NSString stringWithUTF8String:v9];
    recordType = v5->_recordType;
    v5->_recordType = (NSString *)v10;

    v12 = xpc_dictionary_get_string(v4, "FileAssetField");
    if (!v12) {
      goto LABEL_27;
    }
    uint64_t v13 = [NSString stringWithUTF8String:v12];
    fileAssetField = v5->_fileAssetField;
    v5->_fileAssetField = (NSString *)v13;

    size_t length = 0;
    data = xpc_dictionary_get_data(v4, "RecordDictionaryData", &length);
    if (data && length)
    {
      uint64_t v16 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", data);
      recordDictionaryData = v5->_recordDictionaryData;
      v5->_recordDictionaryData = (NSData *)v16;

      v18 = [(DRSSubmitLogToCKContainerRequest *)v5 recordDictionaryData];
      uint64_t v19 = DRSDictionaryForData((uint64_t)v18);
      recordDictionary = v5->_recordDictionary;
      v5->_recordDictionary = (NSDictionary *)v19;

      v21 = [(DRSSubmitLogToCKContainerRequest *)v5 recordDictionary];

      if (v21)
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v22 = [(DRSSubmitLogToCKContainerRequest *)v5 recordDictionary];
        v23 = [v22 allKeys];

        uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v34 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v31 = DPLogHandle_SubmitLogToCKContainerError();
                if (os_signpost_enabled(v31))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v40 = v28;
                  _os_signpost_emit_with_name_impl(&dword_209E70000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidRecordKey", "%{public}@", buf, 0xCu);
                }

                goto LABEL_26;
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

        [(DRSRequest *)v5 setDecisionServerDecision:2];
        goto LABEL_17;
      }
      v23 = DPLogHandle_SubmitLogToCKContainerError();
      if (!os_signpost_enabled(v23)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      v30 = "FailedToDeserializeRecordDictionaryData";
    }
    else
    {
      v23 = DPLogHandle_SubmitLogToCKContainerError();
      if (!os_signpost_enabled(v23))
      {
LABEL_26:

LABEL_27:
        v29 = 0;
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      v30 = "SubmitLogToCKContainerMissingRecordData";
    }
    _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v30, (const char *)&unk_209EEADD1, buf, 2u);
    goto LABEL_26;
  }
LABEL_17:
  v29 = v5;
LABEL_28:

  return v29;
}

+ (BOOL)_requestMOHasRequiredFields_ON_MOC_QUEUE:(id)a3
{
  id v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___DRSSubmitLogToCKContainerRequest;
  if (objc_msgSendSuper2(&v9, sel__requestMOHasRequiredFields_ON_MOC_QUEUE_, v4))
  {
    id v5 = v4;
    v6 = [v5 containerName];

    if (v6)
    {
      v6 = [v5 recordType];

      if (v6)
      {
        v6 = [v5 fileAssetField];

        if (v6)
        {
          uint64_t v7 = [v5 recordDictionaryData];
          LOBYTE(v6) = v7 != 0;
        }
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (id)_initWithSubmitLogToCKContainerRequestMO_ON_MOC_QUEUE:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DRSSubmitLogToCKContainerRequest;
  id v5 = [(DRSSubmitLogRequest *)&v24 _initWithSubmitLogRequestMO_ON_MOC_QUEUE:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 containerName];
  uint64_t v7 = (void *)v5[18];
  v5[18] = v6;

  uint64_t v8 = [v4 recordType];
  objc_super v9 = (void *)v5[19];
  v5[19] = v8;

  uint64_t v10 = [v4 recordDictionaryData];
  objc_super v11 = (void *)v5[21];
  v5[21] = v10;

  v12 = [v5 recordDictionaryData];

  if (!v12)
  {
    v20 = DPLogHandle_SubmitLogToCKContainerError();
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v23 = 0;
      v21 = "MissingRecordDictionaryDataFromMO";
LABEL_9:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v21, (const char *)&unk_209EEADD1, v23, 2u);
    }
LABEL_10:

    uint64_t v19 = 0;
    goto LABEL_11;
  }
  uint64_t v13 = [v4 fileAssetField];
  v14 = (void *)v5[20];
  v5[20] = v13;

  v15 = [v5 recordDictionaryData];
  uint64_t v16 = DRSDictionaryForData((uint64_t)v15);
  v17 = (void *)v5[22];
  v5[22] = v16;

  v18 = [v5 recordDictionary];

  if (!v18)
  {
    v20 = DPLogHandle_SubmitLogToCKContainerError();
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v23 = 0;
      v21 = "FailedToDeserializeRecordDictionaryDataFromMO";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  uint64_t v19 = v5;
LABEL_11:

  return v19;
}

- (id)requestType
{
  return @"SubmitLogToCKContainer";
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DRSSubmitLogToCKContainerRequest;
  if ([(DRSSubmitLogRequest *)&v16 isEqualToRequest:v4])
  {
    id v5 = v4;
    uint64_t v6 = [(DRSSubmitLogToCKContainerRequest *)self containerName];
    uint64_t v7 = [v5 containerName];
    if ([v6 isEqualToString:v7])
    {
      uint64_t v8 = [(DRSSubmitLogToCKContainerRequest *)self recordType];
      objc_super v9 = [v5 recordType];
      if ([v8 isEqualToString:v9])
      {
        uint64_t v10 = [(DRSSubmitLogToCKContainerRequest *)self fileAssetField];
        objc_super v11 = [v5 fileAssetField];
        if ([v10 isEqualToString:v11])
        {
          v15 = [(DRSSubmitLogToCKContainerRequest *)self recordDictionaryData];
          v12 = [v5 recordDictionaryData];
          char v13 = [v15 isEqualToData:v12];
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)jsonCompatibleDictionaryRepresentationVerbose:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x21050DCE0](self, a2);
  v16.receiver = self;
  v16.super_class = (Class)DRSSubmitLogToCKContainerRequest;
  uint64_t v6 = [(DRSRequest *)&v16 jsonCompatibleDictionaryRepresentationVerbose:v3];
  uint64_t v7 = (void *)MEMORY[0x263F08900];
  uint64_t v8 = [(DRSSubmitLogToCKContainerRequest *)self recordDictionary];
  LODWORD(v7) = [v7 isValidJSONObject:v8];

  if (v7)
  {
    objc_super v9 = [(DRSSubmitLogToCKContainerRequest *)self recordDictionary];
    [v6 setObject:v9 forKeyedSubscript:@"recordDictionary"];
  }
  else
  {
    uint64_t v10 = DPLogHandle_Request();
    if (os_signpost_enabled(v10))
    {
      objc_super v11 = [(DRSSubmitLogToCKContainerRequest *)self debugDescription];
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SkippedRecordDictionaryJSONSerialization", "Record dictionary for %{public}@ cannot be serialized in JSON", buf, 0xCu);
    }
    [v6 setObject:@"<Could not serialize>" forKeyedSubscript:@"recordDictionary"];
  }
  v12 = [(DRSSubmitLogToCKContainerRequest *)self containerName];
  [v6 setObject:v12 forKeyedSubscript:@"containerName"];

  char v13 = [(DRSSubmitLogToCKContainerRequest *)self recordType];
  [v6 setObject:v13 forKeyedSubscript:@"recordType"];

  v14 = [(DRSSubmitLogToCKContainerRequest *)self fileAssetField];
  [v6 setObject:v14 forKeyedSubscript:@"fileAssetField"];

  return v6;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (NSString)fileAssetField
{
  return self->_fileAssetField;
}

- (NSData)recordDictionaryData
{
  return self->_recordDictionaryData;
}

- (NSDictionary)recordDictionary
{
  return self->_recordDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordDictionary, 0);
  objc_storeStrong((id *)&self->_recordDictionaryData, 0);
  objc_storeStrong((id *)&self->_fileAssetField, 0);
  objc_storeStrong((id *)&self->_recordType, 0);

  objc_storeStrong((id *)&self->_containerName, 0);
}

+ (id)xcRecordZoneID
{
  if (xcRecordZoneID_onceToken != -1) {
    dispatch_once(&xcRecordZoneID_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)xcRecordZoneID_xcRecordZone;

  return (id)[v2 zoneID];
}

void __68__DRSSubmitLogToCKContainerRequest_CKRecord_Private__xcRecordZoneID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFD7F8]) initWithZoneName:@"3pDevEngagement"];
  v1 = (void *)xcRecordZoneID_xcRecordZone;
  xcRecordZoneID_xcRecordZone = v0;
}

+ (id)safeguardArchiveZoneID
{
  if (safeguardArchiveZoneID_onceToken != -1) {
    dispatch_once(&safeguardArchiveZoneID_onceToken, &__block_literal_global_68);
  }
  v2 = (void *)safeguardArchiveZoneID_safeguardArchiveZone;

  return (id)[v2 zoneID];
}

void __76__DRSSubmitLogToCKContainerRequest_CKRecord_Private__safeguardArchiveZoneID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFD7F8]) initWithZoneName:@"safeguard_zone"];
  v1 = (void *)safeguardArchiveZoneID_safeguardArchiveZone;
  safeguardArchiveZoneID_safeguardArchiveZone = v0;
}

- (id)zoneID
{
  BOOL v3 = [(DRSRequest *)self teamID];
  int v4 = [v3 isEqualToString:kDRSDMPPSTeamID[0]];

  if (!v4) {
    goto LABEL_6;
  }
  id v5 = [(DRSRequest *)self issueCategory];
  int v6 = [v5 isEqualToString:kDRSDMPPSXCArchiveIssueCategory[0]];

  if (v6)
  {
    uint64_t v7 = [(id)objc_opt_class() xcRecordZoneID];
    goto LABEL_7;
  }
  uint64_t v8 = [(DRSRequest *)self issueCategory];
  int v9 = [v8 isEqualToString:kDRSDMPPSSafeguardArchiveIssueCategory[0]];

  if (v9)
  {
    uint64_t v7 = [(id)objc_opt_class() safeguardArchiveZoneID];
  }
  else
  {
LABEL_6:
    uint64_t v7 = 0;
  }
LABEL_7:

  return v7;
}

- (id)recordRepresentation
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BOOL v3 = [(DRSRequest *)self logs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(DRSSubmitLogToCKContainerRequest *)self recordDictionary];
    id v32 = 0;
    char v6 = DRValidateCKRecordDictionary(v5, &v32);
    uint64_t v7 = v32;

    if (v6)
    {
      uint64_t v8 = [(DRSSubmitLogToCKContainerRequest *)self zoneID];
      id v9 = objc_alloc(MEMORY[0x263EFD7C8]);
      uint64_t v10 = [(DRSSubmitLogToCKContainerRequest *)self recordType];
      if (v8) {
        uint64_t v11 = [v9 initWithRecordType:v10 zoneID:v8];
      }
      else {
        uint64_t v11 = [v9 initWithRecordType:v10];
      }
      uint64_t v19 = (void *)v11;

      v20 = [(DRSSubmitLogToCKContainerRequest *)self recordDictionary];
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      v29 = __74__DRSSubmitLogToCKContainerRequest_CKRecord_Private__recordRepresentation__block_invoke;
      v30 = &unk_263FC9A08;
      v14 = v19;
      v31 = v14;
      [v20 enumerateKeysAndObjectsUsingBlock:&v27];

      v21 = [(DRSRequest *)self fileAssets];
      v22 = [v21 firstObject];

      if (v22)
      {
        v23 = [(DRSSubmitLogToCKContainerRequest *)self fileAssetField];
        [v14 setObject:v22 forKeyedSubscript:v23];

        char v13 = v14;
      }
      else
      {
        objc_super v24 = DPLogHandle_CKRecordError();
        if (os_signpost_enabled(v24))
        {
          uint64_t v25 = [(DRSRequest *)self requestID];
          *(_DWORD *)buf = 138543362;
          long long v34 = v25;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MissingFileAsset", "No file asset found for %{public}@", buf, 0xCu);
        }
        char v13 = 0;
      }
    }
    else
    {
      v14 = DPLogHandle_CKRecordError();
      if (os_signpost_enabled(v14))
      {
        v15 = [(DRSSubmitLogToCKContainerRequest *)self debugDescription];
        uint64_t v16 = [v7 localizedDescription];
        v17 = (void *)v16;
        v18 = @"Unknown error";
        if (v16) {
          v18 = (__CFString *)v16;
        }
        *(_DWORD *)buf = 138543618;
        long long v34 = v15;
        __int16 v35 = 2114;
        long long v36 = v18;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MalformedRecordDictionary", "Record dictionary for %{public}@ is malformed: %{public}@", buf, 0x16u);
      }
      char v13 = 0;
    }
  }
  else
  {
    uint64_t v7 = DPLogHandle_CKRecordError();
    if (os_signpost_enabled(v7))
    {
      v12 = [(DRSRequest *)self requestID];
      *(_DWORD *)buf = 138543362;
      long long v34 = v12;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MissingFilePaths", "No file paths found for %{public}@", buf, 0xCu);
    }
    char v13 = 0;
  }

  return v13;
}

uint64_t __74__DRSSubmitLogToCKContainerRequest_CKRecord_Private__recordRepresentation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

@end