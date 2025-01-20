@interface HKObjectAuthorizationPromptSessionContext
+ (BOOL)supportsSecureCoding;
- (HKObjectAuthorizationPromptSessionContext)initWithCoder:(id)a3;
- (HKObjectAuthorizationPromptSessionContext)initWithSamplesRequiringAuthorization:(id)a3 metadata:(id)a4;
- (HKObjectAuthorizationPromptSessionMetadata)metadata;
- (NSDictionary)samplesRequiringAuthorization;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKObjectAuthorizationPromptSessionContext

- (HKObjectAuthorizationPromptSessionContext)initWithSamplesRequiringAuthorization:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKObjectAuthorizationPromptSessionContext;
  v8 = [(HKObjectAuthorizationPromptSessionContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    samplesRequiringAuthorization = v8->_samplesRequiringAuthorization;
    v8->_samplesRequiringAuthorization = (NSDictionary *)v9;

    uint64_t v11 = [v7 copy];
    metadata = v8->_metadata;
    v8->_metadata = (HKObjectAuthorizationPromptSessionMetadata *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKObjectAuthorizationPromptSessionContext)initWithCoder:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKObjectAuthorizationPromptSessionContext;
  v5 = [(HKObjectAuthorizationPromptSessionContext *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"SamplesRequiringAuthorization"];
    samplesRequiringAuthorization = v5->_samplesRequiringAuthorization;
    v5->_samplesRequiringAuthorization = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (HKObjectAuthorizationPromptSessionMetadata *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  samplesRequiringAuthorization = self->_samplesRequiringAuthorization;
  id v5 = a3;
  [v5 encodeObject:samplesRequiringAuthorization forKey:@"SamplesRequiringAuthorization"];
  [v5 encodeObject:self->_metadata forKey:@"Metadata"];
}

- (NSDictionary)samplesRequiringAuthorization
{
  return self->_samplesRequiringAuthorization;
}

- (HKObjectAuthorizationPromptSessionMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_samplesRequiringAuthorization, 0);
}

@end