@interface HKObjectAuthorizationPromptSessionMetadata
+ (BOOL)supportsSecureCoding;
- (HKObjectAuthorizationPromptSessionMetadata)initWithCoder:(id)a3;
- (HKObjectAuthorizationPromptSessionMetadata)initWithExpectedObjectType:(id)a3;
- (HKObjectType)expectedObjectType;
- (NSArray)recordTypes;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordTypes:(id)a3;
@end

@implementation HKObjectAuthorizationPromptSessionMetadata

- (HKObjectAuthorizationPromptSessionMetadata)initWithExpectedObjectType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKObjectAuthorizationPromptSessionMetadata;
  v6 = [(HKObjectAuthorizationPromptSessionMetadata *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_expectedObjectType, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKObjectAuthorizationPromptSessionMetadata)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKObjectAuthorizationPromptSessionMetadata;
  id v5 = [(HKObjectAuthorizationPromptSessionMetadata *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExpectedObjectType"];
    expectedObjectType = v5->_expectedObjectType;
    v5->_expectedObjectType = (HKObjectType *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"RecordTypes"];
    recordTypes = v5->_recordTypes;
    v5->_recordTypes = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  expectedObjectType = self->_expectedObjectType;
  id v5 = a3;
  [v5 encodeObject:expectedObjectType forKey:@"ExpectedObjectType"];
  [v5 encodeObject:self->_recordTypes forKey:@"RecordTypes"];
}

- (HKObjectType)expectedObjectType
{
  return self->_expectedObjectType;
}

- (NSArray)recordTypes
{
  return self->_recordTypes;
}

- (void)setRecordTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordTypes, 0);

  objc_storeStrong((id *)&self->_expectedObjectType, 0);
}

@end