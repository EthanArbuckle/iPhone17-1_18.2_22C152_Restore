@interface AISRepairContext
- (AISRepairContext)initWithAltDSID:(id)a3;
- (AISRepairContext)initWithUserProfileIdentifier:(id)a3;
- (NSString)altDSID;
- (NSString)userProfileIdentifier;
- (void)setUserProfileIdentifier:(id)a3;
@end

@implementation AISRepairContext

- (AISRepairContext)initWithAltDSID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AISRepairContext;
  v5 = [(AISSetupContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;
  }
  return v5;
}

- (AISRepairContext)initWithUserProfileIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(AISRepairContext *)self initWithAltDSID:&stru_26FC49990];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    userProfileIdentifier = v5->_userProfileIdentifier;
    v5->_userProfileIdentifier = (NSString *)v6;
  }
  return v5;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)userProfileIdentifier
{
  return self->_userProfileIdentifier;
}

- (void)setUserProfileIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end