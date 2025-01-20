@interface FBSystemServiceOpenApplicationRequest
- (BOOL)isTrusted;
- (FBProcess)clientProcess;
- (FBSOpenApplicationOptions)options;
- (FBSystemServiceOpenApplicationRequest)initWithBundleId:(id)a3;
- (NSString)bundleIdentifier;
- (id)description;
- (void)setBundleIdentifier:(id)a3;
- (void)setClientProcess:(id)a3;
- (void)setOptions:(id)a3;
- (void)setTrusted:(BOOL)a3;
@end

@implementation FBSystemServiceOpenApplicationRequest

- (FBSOpenApplicationOptions)options
{
  return self->_options;
}

- (BOOL)isTrusted
{
  return self->_trusted;
}

- (FBProcess)clientProcess
{
  return self->_clientProcess;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setTrusted:(BOOL)a3
{
  self->_trusted = a3;
}

- (void)setOptions:(id)a3
{
}

- (void)setClientProcess:(id)a3
{
}

- (FBSystemServiceOpenApplicationRequest)initWithBundleId:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBSystemServiceOpenApplicationRequest;
  v5 = [(FBSystemServiceOpenApplicationRequest *)&v8 init];
  v6 = v5;
  if (v5) { {
    [(FBSystemServiceOpenApplicationRequest *)v5 setBundleIdentifier:v4];
  }
  }

  return v6;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_trusted withName:@"trusted"];
  id v5 = (id)[v3 appendObject:self->_bundleIdentifier withName:@"bundleID"];
  v6 = [(FBSOpenApplicationOptions *)self->_options url];
  v7 = [v6 scheme];
  id v8 = (id)[v3 appendObject:v7 withName:@"urlScheme" skipIfNil:1];

  v9 = FBSProcessPrettyDescription();
  id v10 = (id)[v3 appendObject:v9 withName:@"client"];

  v11 = [v3 build];

  return v11;
}

@end