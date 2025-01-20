@interface HMAccessCodeUserInformation
+ (HMAccessCodeUserInformation)userInformationWithValue:(id)a3 home:(id)a4;
+ (id)shortDescription;
- (HMAccessCodeUserInformation)initWithRemovedUserInfo:(id)a3;
- (HMAccessCodeUserInformation)initWithSimpleLabel:(id)a3;
- (HMAccessCodeUserInformation)initWithSimpleLabel:(id)a3 labelIdentifier:(id)a4;
- (HMAccessCodeUserInformation)initWithSimpleLabel:(id)a3 labelIdentifier:(id)a4 user:(id)a5 removedUserInfo:(id)a6;
- (HMAccessCodeUserInformation)initWithUser:(id)a3;
- (HMRemovedUserInfo)removedUserInfo;
- (HMUser)user;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSString)simpleLabel;
- (NSUUID)labelIdentifier;
- (id)createAccessCodeUserInformationValue;
@end

@implementation HMAccessCodeUserInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedUserInfo, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_labelIdentifier, 0);

  objc_storeStrong((id *)&self->_simpleLabel, 0);
}

- (HMRemovedUserInfo)removedUserInfo
{
  return (HMRemovedUserInfo *)objc_getProperty(self, a2, 32, 1);
}

- (HMUser)user
{
  return (HMUser *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)labelIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)simpleLabel
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v18 = [(HMAccessCodeUserInformation *)self simpleLabel];
  v4 = [MEMORY[0x1E4F65538] defaultFormatter];
  v5 = (void *)[v3 initWithName:@"simpleLabel" value:v18 options:2 formatter:v4];
  v19[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessCodeUserInformation *)self labelIdentifier];
  v8 = [MEMORY[0x1E4F65538] defaultFormatter];
  v9 = (void *)[v6 initWithName:@"labelIdentifier" value:v7 options:2 formatter:v8];
  v19[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMAccessCodeUserInformation *)self user];
  v12 = (void *)[v10 initWithName:@"user" value:v11];
  v19[2] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v14 = [(HMAccessCodeUserInformation *)self removedUserInfo];
  v15 = (void *)[v13 initWithName:@"removedUserInfo" value:v14];
  v19[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];

  return (NSArray *)v16;
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

- (id)createAccessCodeUserInformationValue
{
  id v3 = [HMAccessCodeUserInformationValue alloc];
  v4 = [(HMAccessCodeUserInformation *)self simpleLabel];
  v5 = [(HMAccessCodeUserInformation *)self labelIdentifier];
  id v6 = [(HMAccessCodeUserInformation *)self user];
  v7 = [v6 uuid];
  v8 = [(HMAccessCodeUserInformation *)self removedUserInfo];
  v9 = [(HMAccessCodeUserInformationValue *)v3 initWithSimpleLabel:v4 labelIdentifier:v5 userUUID:v7 removedUserInfo:v8];

  return v9;
}

- (HMAccessCodeUserInformation)initWithSimpleLabel:(id)a3 labelIdentifier:(id)a4 user:(id)a5 removedUserInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMAccessCodeUserInformation;
  v14 = [(HMAccessCodeUserInformation *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    simpleLabel = v14->_simpleLabel;
    v14->_simpleLabel = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    labelIdentifier = v14->_labelIdentifier;
    v14->_labelIdentifier = (NSUUID *)v17;

    objc_storeStrong((id *)&v14->_user, a5);
    objc_storeStrong((id *)&v14->_removedUserInfo, a6);
  }

  return v14;
}

- (HMAccessCodeUserInformation)initWithRemovedUserInfo:(id)a3
{
  return [(HMAccessCodeUserInformation *)self initWithSimpleLabel:0 labelIdentifier:0 user:0 removedUserInfo:a3];
}

- (HMAccessCodeUserInformation)initWithUser:(id)a3
{
  return [(HMAccessCodeUserInformation *)self initWithSimpleLabel:0 labelIdentifier:0 user:a3 removedUserInfo:0];
}

- (HMAccessCodeUserInformation)initWithSimpleLabel:(id)a3 labelIdentifier:(id)a4
{
  return [(HMAccessCodeUserInformation *)self initWithSimpleLabel:a3 labelIdentifier:a4 user:0 removedUserInfo:0];
}

- (HMAccessCodeUserInformation)initWithSimpleLabel:(id)a3
{
  return [(HMAccessCodeUserInformation *)self initWithSimpleLabel:a3 labelIdentifier:0 user:0 removedUserInfo:0];
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (HMAccessCodeUserInformation)userInformationWithValue:(id)a3 home:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 userUUID];

  if (v7)
  {
    v8 = [v5 userUUID];
    v7 = [v6 userWithUUID:v8];
  }
  v9 = [HMAccessCodeUserInformation alloc];
  id v10 = [v5 simpleLabel];
  id v11 = [v5 labelIdentifier];
  id v12 = [v5 removedUserInfo];
  id v13 = [(HMAccessCodeUserInformation *)v9 initWithSimpleLabel:v10 labelIdentifier:v11 user:v7 removedUserInfo:v12];

  return v13;
}

@end