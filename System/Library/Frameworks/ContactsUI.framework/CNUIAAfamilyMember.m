@interface CNUIAAfamilyMember
+ (BOOL)supportsSecureCoding;
+ (id)cnuiFamilyMemberWithAAFamilyMember:(id)a3;
- (BOOL)isMe;
- (CNUIAAfamilyMember)initWithCoder:(id)a3;
- (NSString)appleID;
- (NSString)firstName;
- (NSString)lastName;
- (void)encodeWithCoder:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setIsMe:(BOOL)a3;
- (void)setLastName:(id)a3;
@end

@implementation CNUIAAfamilyMember

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);

  objc_storeStrong((id *)&self->_appleID, 0);
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setLastName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setAppleID:(id)a3
{
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if (([v9 allowsKeyedCoding] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"CNUIAAfamilyMember.m" lineNumber:56 description:@"Keyed coder expected"];
  }
  v5 = [(CNUIAAfamilyMember *)self firstName];
  [v9 encodeObject:v5 forKey:@"firstName"];

  v6 = [(CNUIAAfamilyMember *)self lastName];
  [v9 encodeObject:v6 forKey:@"lastName"];

  v7 = [(CNUIAAfamilyMember *)self appleID];
  [v9 encodeObject:v7 forKey:@"appleID"];

  objc_msgSend(v9, "encodeBool:forKey:", -[CNUIAAfamilyMember isMe](self, "isMe"), @"isMe");
}

- (CNUIAAfamilyMember)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNUIAAfamilyMember;
  v5 = [(CNUIAAfamilyMember *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    [(CNUIAAfamilyMember *)v5 setFirstName:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    [(CNUIAAfamilyMember *)v5 setLastName:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleID"];
    [(CNUIAAfamilyMember *)v5 setAppleID:v8];

    -[CNUIAAfamilyMember setIsMe:](v5, "setIsMe:", [v4 decodeBoolForKey:@"isMe"]);
    id v9 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)cnuiFamilyMemberWithAAFamilyMember:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CNUIAAfamilyMember);
  v5 = [v3 firstName];
  [(CNUIAAfamilyMember *)v4 setFirstName:v5];

  v6 = [v3 lastName];
  [(CNUIAAfamilyMember *)v4 setLastName:v6];

  v7 = [v3 appleID];
  [(CNUIAAfamilyMember *)v4 setAppleID:v7];

  uint64_t v8 = [v3 isMe];
  [(CNUIAAfamilyMember *)v4 setIsMe:v8];

  return v4;
}

@end