@interface CalAlarmMetadata
+ (BOOL)isRecognizedParameter:(id)a3 forProperty:(id)a4 inComponent:(id)a5;
+ (BOOL)isRecognizedProperty:(id)a3 inComponent:(id)a4;
+ (BOOL)shouldSkipSavingUnrecognizedParametersForProperty:(id)a3 inComponent:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)metadataWithData:(id)a3;
- (CalAlarmMetadata)initWithCoder:(id)a3;
@end

@implementation CalAlarmMetadata

+ (BOOL)isRecognizedProperty:(id)a3 inComponent:(id)a4
{
  uint64_t v4 = isRecognizedProperty_inComponent__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&isRecognizedProperty_inComponent__onceToken, &__block_literal_global_17);
  }
  char v6 = [(id)isRecognizedProperty_inComponent__recognizedProperties containsObject:v5];

  return v6;
}

uint64_t __53__CalAlarmMetadata_isRecognizedProperty_inComponent___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4FB8130], *MEMORY[0x1E4FB8138], *MEMORY[0x1E4FB8248], *MEMORY[0x1E4FB82B0], *MEMORY[0x1E4FB82D0], *MEMORY[0x1E4FB7FD8], *MEMORY[0x1E4FB7FF8], *MEMORY[0x1E4FB8048], *MEMORY[0x1E4FB8090], *MEMORY[0x1E4FB8118], 0);
  uint64_t v2 = isRecognizedProperty_inComponent__recognizedProperties;
  isRecognizedProperty_inComponent__recognizedProperties = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

+ (BOOL)isRecognizedParameter:(id)a3 forProperty:(id)a4 inComponent:(id)a5
{
  uint64_t v6 = isRecognizedParameter_forProperty_inComponent__onceToken;
  id v7 = a4;
  id v8 = a3;
  if (v6 != -1) {
    dispatch_once(&isRecognizedParameter_forProperty_inComponent__onceToken, &__block_literal_global_2_0);
  }
  v9 = [(id)isRecognizedParameter_forProperty_inComponent__recognizedParametersByPropertyName objectForKeyedSubscript:v7];

  char v10 = [v9 containsObject:v8];
  return v10;
}

void __66__CalAlarmMetadata_isRecognizedParameter_forProperty_inComponent___block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  id v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FB8128], *MEMORY[0x1E4FB8120], *MEMORY[0x1E4FB8050], 0);
  v4[0] = *MEMORY[0x1E4FB82B0];
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FB82E0], 0);
  v4[1] = *MEMORY[0x1E4FB8090];
  v5[0] = v1;
  v5[1] = v0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)isRecognizedParameter_forProperty_inComponent__recognizedParametersByPropertyName;
  isRecognizedParameter_forProperty_inComponent__recognizedParametersByPropertyName = v2;
}

+ (BOOL)shouldSkipSavingUnrecognizedParametersForProperty:(id)a3 inComponent:(id)a4
{
  uint64_t v4 = shouldSkipSavingUnrecognizedParametersForProperty_inComponent__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&shouldSkipSavingUnrecognizedParametersForProperty_inComponent__onceToken, &__block_literal_global_5);
  }
  char v6 = [(id)shouldSkipSavingUnrecognizedParametersForProperty_inComponent__propertiesToSkipSavingUnrecognizedParameters containsObject:v5];

  return v6;
}

uint64_t __82__CalAlarmMetadata_shouldSkipSavingUnrecognizedParametersForProperty_inComponent___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4FB7FD8], 0);
  uint64_t v2 = shouldSkipSavingUnrecognizedParametersForProperty_inComponent__propertiesToSkipSavingUnrecognizedParameters;
  shouldSkipSavingUnrecognizedParametersForProperty_inComponent__propertiesToSkipSavingUnrecognizedParameters = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

+ (id)metadataWithData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___CalAlarmMetadata;
  id v5 = objc_msgSendSuper2(&v10, sel_metadataWithData_, v4);
  if (!v5)
  {
    id v9 = 0;
    id v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v9];
    id v6 = v9;
    if (!v5)
    {
      id v7 = CDBiCalendarConversionHandle;
      if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_1A8E81000, v7, OS_LOG_TYPE_ERROR, "Error unarchiving alarm metadata: %@", buf, 0xCu);
      }
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalAlarmMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  if (initWithCoder__onceToken != -1) {
    dispatch_once(&initWithCoder__onceToken, &__block_literal_global_19);
  }
  id v5 = [v4 decodeObjectOfClasses:initWithCoder__attachmentClasses forKey:@"Attach"];
  id v6 = [v4 decodeObjectOfClasses:initWithCoder__attendeeClasses forKey:@"Attendee"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Description"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Summary"];
  id v9 = (void *)v8;
  if (v5 || v6 || v7 || v8)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4FB7EC8]);
    [v11 setAttach:v5];
    [v11 setAttendee:v6];
    [v11 setDescription:v7];
    [v11 setSummary:v9];
    v13.receiver = self;
    v13.super_class = (Class)CalAlarmMetadata;
    objc_super v10 = [(CalItemMetadata *)&v13 initWithICSComponent:v11];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CalAlarmMetadata;
    objc_super v10 = [(CalItemMetadata *)&v14 initWithCoder:v4];
  }

  return v10;
}

void __34__CalAlarmMetadata_initWithCoder___block_invoke()
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCoder__attachmentClasses;
  initWithCoder__attachmentClasses = v2;

  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  uint64_t v6 = [v4 setWithArray:v5];
  id v7 = (void *)initWithCoder__attendeeClasses;
  initWithCoder__attendeeClasses = v6;
}

@end