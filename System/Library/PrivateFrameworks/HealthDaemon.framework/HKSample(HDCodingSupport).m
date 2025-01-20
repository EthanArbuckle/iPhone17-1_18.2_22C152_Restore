@interface HKSample(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport;
- (HDCodableSample)codableRepresentationForSync;
@end

@implementation HKSample(HDCodingSupport)

- (HDCodableSample)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableSample);
  v8.receiver = a1;
  v8.super_class = (Class)&off_1F186E250;
  v3 = objc_msgSendSuper2(&v8, sel_codableRepresentationForSync);
  [(HDCodableSample *)v2 setObject:v3];

  v4 = [a1 sampleType];
  -[HDCodableSample setDataType:](v2, "setDataType:", [v4 code]);

  [a1 _startTimestamp];
  if (v5 != 2.22507386e-308) {
    -[HDCodableSample setStartDate:](v2, "setStartDate:");
  }
  [a1 _endTimestamp];
  if (v6 != 2.22507386e-308) {
    -[HDCodableSample setEndDate:](v2, "setEndDate:");
  }

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4 = a3;
  if ([a1 conformsToProtocol:&unk_1F1878810])
  {
    double v5 = [a1 codableRepresentationForSync];
    BOOL v6 = v5 != 0;
    if (v5) {
      [v4 addBinarySamples:v5];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)createWithCodable:()HDCodingSupport
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = 0;
    goto LABEL_16;
  }
  id v4 = v3;
  double v5 = [v4 sample];
  uint64_t v6 = [v5 dataType];

  if (_HKValidDataTypeCode())
  {
    v7 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:v6];
    objc_super v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "dataObjectClass")), "_init");
    if ([v8 conformsToProtocol:&unk_1F1878810])
    {
      if ([v4 applyToObject:v8])
      {
        uint64_t v9 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
        v11 = objc_msgSend(v8, "_validateWithConfiguration:", v9, v10);
        if (v11) {
          v12 = 0;
        }
        else {
          v12 = v8;
        }
        id v13 = v12;

        goto LABEL_14;
      }
    }
    else
    {
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v16 = v14;
        int v18 = 138412290;
        id v19 = (id)objc_opt_class();
        id v17 = v19;
        _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Class: %@ must either conform to _HKBinarySample or implement creatWithCodable:", (uint8_t *)&v18, 0xCu);
      }
    }
    id v13 = 0;
LABEL_14:

    goto LABEL_15;
  }
  id v13 = 0;
LABEL_15:

LABEL_16:

  return v13;
}

@end