@interface CMIOExtensionInfo
+ (id)infoWithEndpoint:(id)a3 bundleID:(id)a4 bundleInfo:(id)a5;
- (CMIOExtensionInfo)initWithEndpoint:(id)a3 bundleID:(id)a4 bundleInfo:(id)a5;
- (NSDictionary)bundleInfo;
- (NSString)bundleID;
- (OS_xpc_object)endpoint;
- (id)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation CMIOExtensionInfo

+ (id)infoWithEndpoint:(id)a3 bundleID:(id)a4 bundleInfo:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEndpoint:a3 bundleID:a4 bundleInfo:a5];

  return v5;
}

- (CMIOExtensionInfo)initWithEndpoint:(id)a3 bundleID:(id)a4 bundleInfo:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CMIOExtensionInfo;
  v8 = [(CMIOExtensionInfo *)&v10 init];
  if (v8)
  {
    if (a3) {
      v8->_endpoint = (OS_xpc_object *)xpc_retain(a3);
    }
    v8->_bundleID = (NSString *)[a4 copy];
    v8->_bundleInfo = (NSDictionary *)[a5 copy];
    v8->_description = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionInfo: ID %@>", v8->_bundleID];
    v8->_redactedDescription = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionInfo: ID ->"];
  }
  return v8;
}

- (void)dealloc
{
  endpoint = self->_endpoint;
  if (endpoint) {
    xpc_release(endpoint);
  }

  v4.receiver = self;
  v4.super_class = (Class)CMIOExtensionInfo;
  [(CMIOExtensionInfo *)&v4 dealloc];
}

- (id)description
{
  v2 = self->_description;

  return v2;
}

- (id)redactedDescription
{
  v2 = self->_redactedDescription;

  return v2;
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSDictionary)bundleInfo
{
  return self->_bundleInfo;
}

@end