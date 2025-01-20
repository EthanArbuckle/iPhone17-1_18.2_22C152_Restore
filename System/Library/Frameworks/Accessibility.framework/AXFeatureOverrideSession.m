@interface AXFeatureOverrideSession
- (AXFeatureOverrideSession)initWithUUID:(id)a3;
- (NSUUID)uuid;
- (void)setUuid:(id)a3;
@end

@implementation AXFeatureOverrideSession

- (AXFeatureOverrideSession)initWithUUID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXFeatureOverrideSession;
  v5 = [(AXFeatureOverrideSession *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AXFeatureOverrideSession *)v5 setUuid:v4];
  }

  return v6;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end