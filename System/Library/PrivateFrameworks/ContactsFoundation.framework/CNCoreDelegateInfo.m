@interface CNCoreDelegateInfo
+ (BOOL)supportsSecureCoding;
+ (id)hardCodedPrincipalPathForDSID:(id)a3;
+ (id)nameComponentsForFamilyMember:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMe;
- (CNCoreDelegateInfo)init;
- (CNCoreDelegateInfo)initWithAltDSID:(id)a3;
- (CNCoreDelegateInfo)initWithCoder:(id)a3;
- (CNCoreDelegateInfo)initWithDSID:(id)a3 altDSID:(id)a4 appleID:(id)a5 principalPath:(id)a6 nameComponents:(id)a7 isMe:(BOOL)a8;
- (CNCoreDelegateInfo)initWithFamilyMember:(id)a3;
- (NSNumber)dsid;
- (NSPersonNameComponents)nameComponents;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)principalPath;
- (id)_hardCodedPrincipalPathForFamilyMember:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNCoreDelegateInfo

- (CNCoreDelegateInfo)init
{
  return [(CNCoreDelegateInfo *)self initWithDSID:0 altDSID:0 appleID:0 principalPath:0 nameComponents:0 isMe:1];
}

- (CNCoreDelegateInfo)initWithAltDSID:(id)a3
{
  return [(CNCoreDelegateInfo *)self initWithDSID:0 altDSID:a3 appleID:0 principalPath:0 nameComponents:0 isMe:a3 == 0];
}

- (CNCoreDelegateInfo)initWithDSID:(id)a3 altDSID:(id)a4 appleID:(id)a5 principalPath:(id)a6 nameComponents:(id)a7 isMe:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v32.receiver = self;
  v32.super_class = (Class)CNCoreDelegateInfo;
  v19 = [(CNCoreDelegateInfo *)&v32 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    dsid = v19->_dsid;
    v19->_dsid = (NSNumber *)v20;

    uint64_t v22 = [v15 copy];
    altDSID = v19->_altDSID;
    v19->_altDSID = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    appleID = v19->_appleID;
    v19->_appleID = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    principalPath = v19->_principalPath;
    v19->_principalPath = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    nameComponents = v19->_nameComponents;
    v19->_nameComponents = (NSPersonNameComponents *)v28;

    v19->_isMe = a8;
    v30 = v19;
  }

  return v19;
}

- (CNCoreDelegateInfo)initWithFamilyMember:(id)a3
{
  id v4 = a3;
  v5 = [v4 dsid];
  v6 = [v4 altDSID];
  v7 = [v4 appleID];
  v8 = [(CNCoreDelegateInfo *)self _hardCodedPrincipalPathForFamilyMember:v4];
  v9 = [(id)objc_opt_class() nameComponentsForFamilyMember:v4];
  uint64_t v10 = [v4 isMe];

  v11 = [(CNCoreDelegateInfo *)self initWithDSID:v5 altDSID:v6 appleID:v7 principalPath:v8 nameComponents:v9 isMe:v10];
  return v11;
}

+ (id)nameComponentsForFamilyMember:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  v5 = [v3 firstName];
  BOOL v6 = off_1EE0254C0((uint64_t)&__block_literal_global_121_0, v5);

  if (v6)
  {
    v7 = [v3 firstName];
    [v4 setGivenName:v7];
  }
  v8 = [v3 lastName];
  BOOL v9 = off_1EE0254C0((uint64_t)&__block_literal_global_121_0, v8);

  if (v9)
  {
    uint64_t v10 = [v3 lastName];
    [v4 setFamilyName:v10];

LABEL_6:
    id v11 = v4;
    goto LABEL_8;
  }
  if (v6) {
    goto LABEL_6;
  }
  id v11 = 0;
LABEL_8:

  return v11;
}

- (id)description
{
  id v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"dsid" object:self->_dsid];
  id v5 = (id)[v3 appendName:@"altDSID" object:self->_altDSID];
  id v6 = (id)[v3 appendName:@"appleID" object:self->_appleID];
  id v7 = (id)[v3 appendName:@"principalPath" object:self->_principalPath];
  id v8 = (id)[v3 appendName:@"altDSID" object:self->_altDSID];
  id v9 = (id)[v3 appendName:@"nameComponents" object:self->_nameComponents];
  uint64_t v10 = [v3 build];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNCoreDelegateInfo *)a3;
  BOOL v10 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (dsid = self->_dsid, (unint64_t)dsid | (unint64_t)v4->_dsid)
      && !-[NSNumber isEqual:](dsid, "isEqual:")
      || (altDSID = self->_altDSID, (unint64_t)altDSID | (unint64_t)v4->_altDSID)
      && !-[NSString isEqual:](altDSID, "isEqual:")
      || (appleID = self->_appleID, (unint64_t)appleID | (unint64_t)v4->_appleID)
      && !-[NSString isEqual:](appleID, "isEqual:")
      || (principalPath = self->_principalPath, (unint64_t)principalPath | (unint64_t)v4->_principalPath)
      && !-[NSString isEqual:](principalPath, "isEqual:")
      || (nameComponents = self->_nameComponents,
          (unint64_t)nameComponents | (unint64_t)v4->_nameComponents)
      && !-[NSPersonNameComponents isEqual:](nameComponents, "isEqual:"))
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = +[CNHashBuilder objectHash:self->_dsid];
  unint64_t v4 = +[CNHashBuilder objectHash:self->_altDSID] - v3 + 32 * v3;
  unint64_t v5 = +[CNHashBuilder objectHash:self->_appleID] - v4 + 32 * v4;
  unint64_t v6 = +[CNHashBuilder objectHash:self->_principalPath] - v5 + 32 * v5;
  return +[CNHashBuilder objectHash:self->_nameComponents]
       - v6
       + 32 * v6
       + 486695567;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [CNCoreMutableDelegateInfo alloc];
  dsid = self->_dsid;
  altDSID = self->_altDSID;
  appleID = self->_appleID;
  principalPath = self->_principalPath;
  nameComponents = self->_nameComponents;
  BOOL isMe = self->_isMe;

  return [(CNCoreDelegateInfo *)v4 initWithDSID:dsid altDSID:altDSID appleID:appleID principalPath:principalPath nameComponents:nameComponents isMe:isMe];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNCoreDelegateInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dsid"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appleID"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_principalPath"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_nameComponents"];
  uint64_t v10 = [v4 decodeBoolForKey:@"_isMe"];

  id v11 = [(CNCoreDelegateInfo *)self initWithDSID:v5 altDSID:v6 appleID:v7 principalPath:v8 nameComponents:v9 isMe:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  dsid = self->_dsid;
  id v5 = a3;
  [v5 encodeObject:dsid forKey:@"_dsid"];
  [v5 encodeObject:self->_altDSID forKey:@"_altDSID"];
  [v5 encodeObject:self->_appleID forKey:@"_appleID"];
  [v5 encodeObject:self->_principalPath forKey:@"_principalPath"];
  [v5 encodeObject:self->_nameComponents forKey:@"_nameComponents"];
  [v5 encodeBool:self->_isMe forKey:@"_isMe"];
}

+ (id)hardCodedPrincipalPathForDSID:(id)a3
{
  return (id)[NSString stringWithFormat:@"/%@/principal/", a3];
}

- (id)_hardCodedPrincipalPathForFamilyMember:(id)a3
{
  unint64_t v3 = [a3 dsid];
  id v4 = [v3 stringValue];

  id v5 = [(id)objc_opt_class() hardCodedPrincipalPathForDSID:v4];

  return v5;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)principalPath
{
  return self->_principalPath;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_principalPath, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_dsid, 0);
}

@end