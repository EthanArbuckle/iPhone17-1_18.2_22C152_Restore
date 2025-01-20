@interface ACDPluginEntry
- (ACDPluginEntry)init;
- (ACDPluginEntry)initWithBundle:(id)a3;
- (BOOL)principalObjectRespondsToSelector:(SEL)a3;
- (NSBundle)bundle;
- (NSSet)supportedAccountTypes;
- (NSSet)supportedDataclasses;
- (NSString)identifier;
- (id)debugDescription;
- (id)description;
- (id)principalObject;
@end

@implementation ACDPluginEntry

- (ACDPluginEntry)init
{
  return 0;
}

- (ACDPluginEntry)initWithBundle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACDPluginEntry;
  v6 = [(ACDPluginEntry *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundle, a3);
  }

  return v7;
}

- (NSSet)supportedAccountTypes
{
  v2 = self;
  objc_sync_enter(v2);
  if ((*(unsigned char *)&v2->_fetchedFlags & 2) == 0)
  {
    bundle = v2->_bundle;
    objc_opt_class();
    uint64_t v4 = _ACDSetForKeyInBundle(bundle, @"ACSupportedAccountTypes");
    supportedAccountTypes = v2->_supportedAccountTypes;
    v2->_supportedAccountTypes = (NSSet *)v4;

    *(unsigned char *)&v2->_fetchedFlags |= 2u;
  }
  objc_sync_exit(v2);

  v6 = v2->_supportedAccountTypes;

  return v6;
}

- (NSSet)supportedDataclasses
{
  v2 = self;
  objc_sync_enter(v2);
  if ((*(unsigned char *)&v2->_fetchedFlags & 4) == 0)
  {
    bundle = v2->_bundle;
    objc_opt_class();
    uint64_t v4 = _ACDSetForKeyInBundle(bundle, @"ACSupportedDataclasses");
    supportedDataclasses = v2->_supportedDataclasses;
    v2->_supportedDataclasses = (NSSet *)v4;

    *(unsigned char *)&v2->_fetchedFlags |= 4u;
  }
  objc_sync_exit(v2);

  v6 = v2->_supportedDataclasses;

  return v6;
}

- (id)principalObject
{
  v2 = self;
  objc_sync_enter(v2);
  if ((*(unsigned char *)&v2->_fetchedFlags & 1) == 0)
  {
    id v3 = objc_alloc_init([(NSBundle *)v2->_bundle principalClass]);
    id principalObject = v2->_principalObject;
    v2->_id principalObject = v3;

    *(unsigned char *)&v2->_fetchedFlags |= 1u;
  }
  objc_sync_exit(v2);

  id v5 = v2->_principalObject;

  return v5;
}

- (NSString)identifier
{
  v2 = self;
  objc_sync_enter(v2);
  if ((*(unsigned char *)&v2->_fetchedFlags & 8) == 0)
  {
    uint64_t v3 = [(NSBundle *)v2->_bundle bundleIdentifier];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v3;

    *(unsigned char *)&v2->_fetchedFlags |= 8u;
  }
  objc_sync_exit(v2);

  id v5 = v2->_identifier;

  return v5;
}

- (BOOL)principalObjectRespondsToSelector:(SEL)a3
{
  uint64_t v4 = [(NSBundle *)self->_bundle principalClass];

  return [(objc_class *)v4 instancesRespondToSelector:a3];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(NSBundle *)self->_bundle bundlePath];
  v7 = [v3 stringWithFormat:@"<%@: %p { bundle: %@ }>", v5, self, v6];

  return v7;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  bundle = self->_bundle;
  v7 = __34__ACDPluginEntry_debugDescription__block_invoke((uint64_t)v5, self->_supportedAccountTypes, (*(unsigned char *)&self->_fetchedFlags >> 1) & 1);
  v8 = __34__ACDPluginEntry_debugDescription__block_invoke((uint64_t)v7, self->_supportedDataclasses, (*(unsigned char *)&self->_fetchedFlags >> 2) & 1);
  objc_super v9 = [v3 stringWithFormat:@"<%@: %p { bundle: %@, supportedAccountTypes: %@, supportedDataclasses: %@ }>", v5, self, bundle, v7, v8];

  return v9;
}

__CFString *__34__ACDPluginEntry_debugDescription__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v4 = a2;
  id v5 = v4;
  if (a3) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"(not loaded)";
  }

  return v6;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_supportedDataclasses, 0);
  objc_storeStrong((id *)&self->_supportedAccountTypes, 0);

  objc_storeStrong(&self->_principalObject, 0);
}

@end