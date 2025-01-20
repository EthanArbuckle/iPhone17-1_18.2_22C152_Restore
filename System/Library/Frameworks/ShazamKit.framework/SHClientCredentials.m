@interface SHClientCredentials
- (BOOL)canEnableSpectralOutput;
- (BOOL)isEntitledForSource:(int64_t)a3;
- (SHAttribution)attribution;
- (SHClientCredentials)initWithConnection:(id)a3;
- (SHClientCredentials)initWithEntitlements:(id)a3 attribution:(id)a4;
- (SHEntitlements)entitlements;
- (int64_t)audioTapClient;
- (int64_t)clientType;
@end

@implementation SHClientCredentials

- (SHClientCredentials)initWithConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)SHAttribution) initWithConnection:v4];
  id v6 = [objc_alloc((Class)SHEntitlements) initWithConnection:v4];

  v7 = [(SHClientCredentials *)self initWithEntitlements:v6 attribution:v5];
  return v7;
}

- (SHClientCredentials)initWithEntitlements:(id)a3 attribution:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHClientCredentials;
  v9 = [(SHClientCredentials *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attribution, a4);
    objc_storeStrong((id *)&v10->_entitlements, a3);
  }

  return v10;
}

- (int64_t)clientType
{
  v2 = [(SHClientCredentials *)self entitlements];
  if ([v2 isEntitledForInternalClient]) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (BOOL)isEntitledForSource:(int64_t)a3
{
  int64_t v3 = [(SHClientCredentials *)self entitlements];
  unsigned __int8 v4 = [v3 isEntitledForMicrophone];

  return v4;
}

- (int64_t)audioTapClient
{
  v9[0] = @"com.apple.assistant_service";
  v9[1] = @"com.apple.WorkflowKit.BackgroundShortcutRunner";
  int64_t v3 = +[NSArray arrayWithObjects:v9 count:2];
  unsigned __int8 v4 = [(SHClientCredentials *)self attribution];
  id v5 = [v4 bundleIdentifier];
  unsigned int v6 = [v3 containsObject:v5];

  if (v6) {
    int64_t v7 = 2;
  }
  else {
    int64_t v7 = 1;
  }

  return v7;
}

- (BOOL)canEnableSpectralOutput
{
  return (id)[(SHClientCredentials *)self clientType] == (id)1;
}

- (SHAttribution)attribution
{
  return self->_attribution;
}

- (SHEntitlements)entitlements
{
  return self->_entitlements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);

  objc_storeStrong((id *)&self->_attribution, 0);
}

@end