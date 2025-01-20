@interface XRMobileAgentTeam
- (NSSet)members;
- (XRMobileAgentTeam)init;
- (XRMobileAgentTeam)initWithMembers:(id)a3;
@end

@implementation XRMobileAgentTeam

- (XRMobileAgentTeam)initWithMembers:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)XRMobileAgentTeam;
  v9 = [(XRMobileAgentTeam *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v4 v5:v6 v7:v8];
    members = v9->_members;
    v9->_members = (NSSet *)v10;
  }
  return v9;
}

- (XRMobileAgentTeam)init
{
  v3 = objc_opt_new();
  uint64_t v7 = (XRMobileAgentTeam *)[[XRMobileAgentTeam alloc] initWithMembers:v4 teamID:v3 name:v5 icon:v6];

  return v7;
}

- (NSSet)members
{
  return self->_members;
}

- (void).cxx_destruct
{
}

@end