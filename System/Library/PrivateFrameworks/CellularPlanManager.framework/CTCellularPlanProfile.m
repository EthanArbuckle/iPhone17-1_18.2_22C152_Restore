@interface CTCellularPlanProfile
+ (BOOL)supportsSecureCoding;
- (BOOL)isBootstrap;
- (BOOL)isDeleteNotAllowed;
- (BOOL)isDisableNotAllowed;
- (BOOL)isSelected;
- (BOOL)requiresUserConsent;
- (CTCellularPlanProfile)initWithCoder:(id)a3;
- (CTCellularPlanProfile)initWithProfileId:(id)a3 iccid:(id)a4 selected:(BOOL)a5 bootstrap:(BOOL)a6 disableNotAllowed:(BOOL)a7 deleteNotAllowed:(BOOL)a8 requiresUserConsent:(BOOL)a9;
- (NSData)profileId;
- (NSString)iccid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)redactedDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setIccid:(id)a3;
- (void)setIsBootstrap:(BOOL)a3;
- (void)setIsDeleteNotAllowed:(BOOL)a3;
- (void)setIsDisableNotAllowed:(BOOL)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setProfileId:(id)a3;
- (void)setRequiresUserConsent:(BOOL)a3;
@end

@implementation CTCellularPlanProfile

- (CTCellularPlanProfile)initWithProfileId:(id)a3 iccid:(id)a4 selected:(BOOL)a5 bootstrap:(BOOL)a6 disableNotAllowed:(BOOL)a7 deleteNotAllowed:(BOOL)a8 requiresUserConsent:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CTCellularPlanProfile;
  v17 = [(CTCellularPlanProfile *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(CTCellularPlanProfile *)v17 setProfileId:v15];
    [(CTCellularPlanProfile *)v18 setIccid:v16];
    [(CTCellularPlanProfile *)v18 setIsSelected:v12];
    [(CTCellularPlanProfile *)v18 setIsBootstrap:v11];
    [(CTCellularPlanProfile *)v18 setIsDisableNotAllowed:v10];
    [(CTCellularPlanProfile *)v18 setIsDeleteNotAllowed:v9];
    [(CTCellularPlanProfile *)v18 setRequiresUserConsent:a9];
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = (void *)[(NSData *)self->_profileId copy];
  v6 = (void *)[(NSString *)self->_iccid copy];
  LOBYTE(v9) = self->_requiresUserConsent;
  v7 = (void *)[v4 initWithProfileId:v5 iccid:v6 selected:self->_isSelected bootstrap:self->_isBootstrap disableNotAllowed:self->_isDisableNotAllowed deleteNotAllowed:self->_isDeleteNotAllowed requiresUserConsent:v9];

  return v7;
}

- (CTCellularPlanProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTCellularPlanProfile;
  v5 = [(CTCellularPlanProfile *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iccid"];
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profileId"];
    profileId = v5->_profileId;
    v5->_profileId = (NSData *)v8;

    BOOL v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isBootstrap"];
    v5->_isBootstrap = [v10 BOOLValue];

    BOOL v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isActive"];
    v5->_isSelected = [v11 BOOLValue];

    BOOL v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isDisableNotAllowed"];
    v5->_isDisableNotAllowed = [v12 BOOLValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isDeleteNotAllowed"];
    v5->_isDeleteNotAllowed = [v13 BOOLValue];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requiresUserConsent"];
    v5->_requiresUserConsent = [v14 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  iccid = self->_iccid;
  id v5 = a3;
  [v5 encodeObject:iccid forKey:@"iccid"];
  [v5 encodeObject:self->_profileId forKey:@"profileId"];
  uint64_t v6 = [NSNumber numberWithBool:self->_isBootstrap];
  [v5 encodeObject:v6 forKey:@"isBootstrap"];

  v7 = [NSNumber numberWithBool:self->_isSelected];
  [v5 encodeObject:v7 forKey:@"isSelected"];

  uint64_t v8 = [NSNumber numberWithBool:self->_isDisableNotAllowed];
  [v5 encodeObject:v8 forKey:@"isDisableNotAllowed"];

  uint64_t v9 = [NSNumber numberWithBool:self->_isDeleteNotAllowed];
  [v5 encodeObject:v9 forKey:@"isDeleteNotAllowed"];

  id v10 = [NSNumber numberWithBool:self->_requiresUserConsent];
  [v5 encodeObject:v10 forKey:@"requiresUserConsent"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(CTCellularPlanProfile *)self iccid];
  id v5 = [v3 stringWithFormat:@"<plan: iccid:%@, isSelected:%d, isDisableNotAllowed:%d, isDeleteNotAllowed:%d, requiresUserConsent:%d>", v4, -[CTCellularPlanProfile isSelected](self, "isSelected"), -[CTCellularPlanProfile isDisableNotAllowed](self, "isDisableNotAllowed"), -[CTCellularPlanProfile isDeleteNotAllowed](self, "isDeleteNotAllowed"), -[CTCellularPlanProfile requiresUserConsent](self, "requiresUserConsent")];

  return v5;
}

- (id)redactedDescription
{
  return (id)[NSString stringWithFormat:@"<plan: isSelected:%d, isDisableNotAllowed:%d, isDeleteNotAllowed:%d, requiresUserConsent:%d>", -[CTCellularPlanProfile isSelected](self, "isSelected"), -[CTCellularPlanProfile isDisableNotAllowed](self, "isDisableNotAllowed"), -[CTCellularPlanProfile isDeleteNotAllowed](self, "isDeleteNotAllowed"), -[CTCellularPlanProfile requiresUserConsent](self, "requiresUserConsent")];
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (BOOL)isBootstrap
{
  return self->_isBootstrap;
}

- (void)setIsBootstrap:(BOOL)a3
{
  self->_isBootstrap = a3;
}

- (BOOL)isDisableNotAllowed
{
  return self->_isDisableNotAllowed;
}

- (void)setIsDisableNotAllowed:(BOOL)a3
{
  self->_isDisableNotAllowed = a3;
}

- (BOOL)isDeleteNotAllowed
{
  return self->_isDeleteNotAllowed;
}

- (void)setIsDeleteNotAllowed:(BOOL)a3
{
  self->_isDeleteNotAllowed = a3;
}

- (BOOL)requiresUserConsent
{
  return self->_requiresUserConsent;
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (NSData)profileId
{
  return self->_profileId;
}

- (void)setProfileId:(id)a3
{
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_profileId, 0);
}

@end