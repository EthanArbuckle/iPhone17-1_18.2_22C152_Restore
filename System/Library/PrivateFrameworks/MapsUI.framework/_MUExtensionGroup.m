@interface _MUExtensionGroup
- (GEOAppleMediaServicesResult)appStoreApp;
- (NSString)appIdentifier;
- (_MUExtensionGroup)initWithAppIdentifier:(id)a3;
- (_MXExtension)bestExtensionToUse;
- (void)addExtensionIfMatchedAppIdentifier:(id)a3;
- (void)setAppStoreApp:(id)a3;
@end

@implementation _MUExtensionGroup

- (_MXExtension)bestExtensionToUse
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__6;
  v8 = __Block_byref_object_dispose__6;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (_MXExtension *)v2;
}

- (void)addExtensionIfMatchedAppIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [v4 _containingAppIdentifer];
  int v6 = [v5 isEqual:self->_appIdentifier];

  if (v6)
  {
    id v7 = v4;
    geo_isolate_sync();
  }
}

- (_MUExtensionGroup)initWithAppIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MUExtensionGroup;
  int v6 = [(_MUExtensionGroup *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appIdentifier, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    extensions = v7->_extensions;
    v7->_extensions = v8;

    uint64_t v10 = geo_isolater_create();
    extensionsLock = v7->_extensionsLock;
    v7->_extensionsLock = (geo_isolater *)v10;
  }
  return v7;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (GEOAppleMediaServicesResult)appStoreApp
{
  return self->_appStoreApp;
}

- (void)setAppStoreApp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreApp, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionsLock, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

@end