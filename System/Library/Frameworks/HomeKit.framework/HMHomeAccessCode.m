@interface HMHomeAccessCode
+ (id)homeAccessCodeWithValue:(id)a3 home:(id)a4;
+ (id)shortDescription;
- (HMAccessCodeUserInformation)userInformation;
- (HMAccessCodeValue)accessCodeValue;
- (HMHomeAccessCode)initWithAccessCodeValue:(id)a3 userInformation:(id)a4;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (id)createHomeAccessCodeValue;
@end

@implementation HMHomeAccessCode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInformation, 0);

  objc_storeStrong((id *)&self->_accessCodeValue, 0);
}

- (HMAccessCodeUserInformation)userInformation
{
  return (HMAccessCodeUserInformation *)objc_getProperty(self, a2, 16, 1);
}

- (HMAccessCodeValue)accessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMHomeAccessCode *)self accessCodeValue];
  v5 = (void *)[v3 initWithName:@"accessCodeValue" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMHomeAccessCode *)self userInformation];
  v8 = (void *)[v6 initWithName:@"userInformation" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)createHomeAccessCodeValue
{
  id v3 = [HMHomeAccessCodeValue alloc];
  v4 = [(HMHomeAccessCode *)self accessCodeValue];
  v5 = [(HMHomeAccessCode *)self userInformation];
  id v6 = [v5 createAccessCodeUserInformationValue];
  v7 = [(HMHomeAccessCodeValue *)v3 initWithAccessCodeValue:v4 userInformationValue:v6];

  return v7;
}

- (HMHomeAccessCode)initWithAccessCodeValue:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMHomeAccessCode;
  v8 = [(HMHomeAccessCode *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accessCodeValue = v8->_accessCodeValue;
    v8->_accessCodeValue = (HMAccessCodeValue *)v9;

    objc_storeStrong((id *)&v8->_userInformation, a4);
  }

  return v8;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)homeAccessCodeWithValue:(id)a3 home:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 userInformationValue];
  v8 = +[HMAccessCodeUserInformation userInformationWithValue:v7 home:v5];

  uint64_t v9 = [HMHomeAccessCode alloc];
  v10 = [v6 accessCodeValue];

  v11 = [(HMHomeAccessCode *)v9 initWithAccessCodeValue:v10 userInformation:v8];

  return v11;
}

@end