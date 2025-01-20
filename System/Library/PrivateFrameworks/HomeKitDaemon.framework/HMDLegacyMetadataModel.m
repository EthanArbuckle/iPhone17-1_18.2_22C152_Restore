@interface HMDLegacyMetadataModel
+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5;
+ (id)hmbProperties;
- (HMDLegacyMetadataModel)init;
- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6;
@end

@implementation HMDLegacyMetadataModel

- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v12 = [v9 recordID];
    v13 = [v12 recordName];
    char v14 = [v13 isEqual:@"9C3BF4D1-C7CF-4217-BCD2-0F7E96D5B300"];

    if (v14) {
      goto LABEL_9;
    }
    _HMFPreconditionFailure();
  }
  v15 = [v10 zoneID];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (!v17)
  {
    v23 = (HMDLegacyMetadataModel *)_HMFPreconditionFailure();
    return [(HMDLegacyMetadataModel *)v23 init];
  }
  id v18 = objc_alloc(MEMORY[0x263EFD7E8]);
  v19 = [v17 zoneID];
  v20 = (void *)[v18 initWithRecordName:@"9C3BF4D1-C7CF-4217-BCD2-0F7E96D5B300" zoneID:v19];

  id v9 = (id)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"MetadataBlob" recordID:v20];
LABEL_9:
  v21 = [(HMDLegacyMetadataModel *)self cloudMetadata];
  [v9 setObject:v21 forKeyedSubscript:@"kRecordEncodedDataBlobKey"];

  return v9;
}

- (HMDLegacyMetadataModel)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"457C009B-1DA4-4B71-BD69-93D344A81A8B"];
  v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  v7.receiver = self;
  v7.super_class = (Class)HMDLegacyMetadataModel;
  v5 = [(HMBModel *)&v7 initWithModelID:v3 parentModelID:v4];

  return v5;
}

+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = [v7 recordType];
  char v9 = [v8 isEqual:@"MetadataBlob"];

  if (v9)
  {
    id v10 = objc_alloc_init((Class)a1);
    if (v10)
    {
      id v11 = [v7 objectForKeyedSubscript:@"kRecordEncodedDataBlobKey"];

      if (v11)
      {
        v12 = [v7 objectForKeyedSubscript:@"kRecordEncodedDataBlobKey"];
        [v10 setCloudMetadata:v12];
      }
    }
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    id v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_234797 != -1) {
    dispatch_once(&hmbProperties_onceToken_234797, &__block_literal_global_234798);
  }
  v2 = (void *)hmbProperties__properties_234799;
  return v2;
}

void __39__HMDLegacyMetadataModel_hmbProperties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"cloudMetadata";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)hmbProperties__properties_234799;
  hmbProperties__properties_234799 = v1;
}

@end