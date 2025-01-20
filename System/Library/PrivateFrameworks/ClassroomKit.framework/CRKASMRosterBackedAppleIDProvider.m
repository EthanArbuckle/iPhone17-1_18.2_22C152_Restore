@interface CRKASMRosterBackedAppleIDProvider
- (CRKASMRosterBackedAppleIDProvider)initWithRosterProvider:(id)a3;
- (CRKASMRosterProviding)rosterProvider;
- (NSString)appleID;
@end

@implementation CRKASMRosterBackedAppleIDProvider

- (CRKASMRosterBackedAppleIDProvider)initWithRosterProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMRosterBackedAppleIDProvider;
  v6 = [(CRKASMRosterBackedAppleIDProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rosterProvider, a3);
  }

  return v7;
}

- (NSString)appleID
{
  v2 = [(CRKASMRosterBackedAppleIDProvider *)self rosterProvider];
  v3 = [v2 roster];
  v4 = [v3 user];
  id v5 = [v4 appleID];

  return (NSString *)v5;
}

- (CRKASMRosterProviding)rosterProvider
{
  return self->_rosterProvider;
}

- (void).cxx_destruct
{
}

@end