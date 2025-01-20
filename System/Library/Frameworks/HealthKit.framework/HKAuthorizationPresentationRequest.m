@interface HKAuthorizationPresentationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldDismissWhenBackgrounded;
- (HKAuthorizationPresentationRequest)initWithCoder:(id)a3;
- (NSSet)typesRequiringReadAuthorization;
- (NSSet)typesRequiringShareAuthorization;
- (NSString)readUsageDescription;
- (NSString)researchStudyUsageDescription;
- (NSString)shareUsageDescription;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDismissWhenBackgrounded:(BOOL)a3;
- (void)setReadUsageDescription:(id)a3;
- (void)setResearchStudyUsageDescription:(id)a3;
- (void)setShareUsageDescription:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setTypesRequiringReadAuthorization:(id)a3;
- (void)setTypesRequiringShareAuthorization:(id)a3;
@end

@implementation HKAuthorizationPresentationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKAuthorizationPresentationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKAuthorizationPresentationRequest;
  v5 = [(HKAuthorizationPresentationRequest *)&v19 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"_Type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ReadUsageDescription"];
    readUsageDescription = v5->_readUsageDescription;
    v5->_readUsageDescription = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ShareUsageDescription"];
    shareUsageDescription = v5->_shareUsageDescription;
    v5->_shareUsageDescription = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ResearchStudyUsageDescription"];
    researchStudyUsageDescription = v5->_researchStudyUsageDescription;
    v5->_researchStudyUsageDescription = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForSetOf:", objc_opt_class());
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_TypesRequiringReadAuthorization"];
    typesRequiringReadAuthorization = v5->_typesRequiringReadAuthorization;
    v5->_typesRequiringReadAuthorization = (NSSet *)v13;

    v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForSetOf:", objc_opt_class());
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"_TypesRequiringShareAuthorization"];
    typesRequiringShareAuthorization = v5->_typesRequiringShareAuthorization;
    v5->_typesRequiringShareAuthorization = (NSSet *)v16;

    v5->_dismissWhenBackgrounded = [v4 decodeBoolForKey:@"_ShouldDismissWhenBackgrounded"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"_Type"];
  [v5 encodeObject:self->_readUsageDescription forKey:@"_ReadUsageDescription"];
  [v5 encodeObject:self->_shareUsageDescription forKey:@"_ShareUsageDescription"];
  [v5 encodeObject:self->_researchStudyUsageDescription forKey:@"_ResearchStudyUsageDescription"];
  [v5 encodeObject:self->_typesRequiringReadAuthorization forKey:@"_TypesRequiringReadAuthorization"];
  [v5 encodeObject:self->_typesRequiringShareAuthorization forKey:@"_TypesRequiringShareAuthorization"];
  [v5 encodeBool:self->_dismissWhenBackgrounded forKey:@"_ShouldDismissWhenBackgrounded"];
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSString)readUsageDescription
{
  return self->_readUsageDescription;
}

- (void)setReadUsageDescription:(id)a3
{
}

- (NSString)shareUsageDescription
{
  return self->_shareUsageDescription;
}

- (void)setShareUsageDescription:(id)a3
{
}

- (NSString)researchStudyUsageDescription
{
  return self->_researchStudyUsageDescription;
}

- (void)setResearchStudyUsageDescription:(id)a3
{
}

- (NSSet)typesRequiringReadAuthorization
{
  return self->_typesRequiringReadAuthorization;
}

- (void)setTypesRequiringReadAuthorization:(id)a3
{
}

- (NSSet)typesRequiringShareAuthorization
{
  return self->_typesRequiringShareAuthorization;
}

- (void)setTypesRequiringShareAuthorization:(id)a3
{
}

- (BOOL)shouldDismissWhenBackgrounded
{
  return self->_dismissWhenBackgrounded;
}

- (void)setDismissWhenBackgrounded:(BOOL)a3
{
  self->_dismissWhenBackgrounded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typesRequiringShareAuthorization, 0);
  objc_storeStrong((id *)&self->_typesRequiringReadAuthorization, 0);
  objc_storeStrong((id *)&self->_researchStudyUsageDescription, 0);
  objc_storeStrong((id *)&self->_shareUsageDescription, 0);

  objc_storeStrong((id *)&self->_readUsageDescription, 0);
}

@end