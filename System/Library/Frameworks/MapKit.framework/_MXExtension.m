@interface _MXExtension
+ (BOOL)shouldDeserializeCacheItems;
+ (void)setShouldDeserializeCacheItems:(BOOL)a3;
- (BOOL)_isIntentExtension;
- (BOOL)_isMapsExtension;
- (BOOL)_setEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)canSupportIntent:(id)a3;
- (BOOL)canSupportIntentClass:(Class)a3;
- (BOOL)isEnabled;
- (NSDictionary)attributes;
- (NSDictionary)infoDictionary;
- (NSExtension)extension;
- (NSSet)capabilities;
- (NSString)containingAppDisplayName;
- (NSString)displayName;
- (NSString)extensionPointIdentifier;
- (NSString)identifier;
- (_MXExtension)initWithExtensionIdentifier:(id)a3 extensionProvider:(id)a4;
- (_MXExtensionProvider)provider;
- (id)_containingAppIdentifer;
- (id)_iconForTableUI;
- (id)_iconWithFormat:(int)a3;
- (id)confirmIntent:(id)a3 expectResponseClass:(Class)a4 withCompletion:(id)a5;
- (id)description;
- (id)handleIntent:(id)a3 expectResponseClass:(Class)a4 withCompletion:(id)a5;
- (id)handleRequest:(id)a3 requestDispatcher:(id)a4 completion:(id)a5;
- (id)resolveIntentSlot:(id)a3 forIntent:(id)a4 completionBlock:(id)a5;
- (id)siblingExtensions;
- (id)startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4;
- (id)startSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4 toObserver:(id)a5;
- (unint64_t)type;
- (void)_loadCacheItems:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setProvider:(id)a3;
- (void)startExtensionServiceWithInputItems:(id)a3 begin:(id)a4 completion:(id)a5;
@end

@implementation _MXExtension

- (_MXExtension)initWithExtensionIdentifier:(id)a3 extensionProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MXExtension;
  v8 = [(_MXExtension *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeWeak((id *)&v8->_provider, v7);
  }

  return v8;
}

- (NSString)extensionPointIdentifier
{
  v2 = [(_MXExtension *)self extension];
  v3 = [v2 extensionPointIdentifier];

  return (NSString *)v3;
}

- (NSDictionary)infoDictionary
{
  v2 = [(_MXExtension *)self extension];
  v3 = [v2 infoDictionary];

  return (NSDictionary *)v3;
}

- (NSDictionary)attributes
{
  v2 = [(_MXExtension *)self extension];
  v3 = [v2 attributes];

  return (NSDictionary *)v3;
}

- (BOOL)isEnabled
{
  v2 = [(_MXExtension *)self extension];
  char v3 = [v2 optedIn];

  return v3;
}

- (unint64_t)type
{
  v2 = [(_MXExtension *)self extension];
  unint64_t v3 = [v2 _mapExtensionType];

  return v3;
}

- (NSSet)capabilities
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(_MXExtension *)self attributes];
  unint64_t v3 = [v2 objectForKey:@"MapsExtensionCapabilities"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v4, v12);
  }
  else
  {
LABEL_13:
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "set", v12);
  }
  v10 = (void *)v9;

  return (NSSet *)v10;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p> ", objc_opt_class(), self];
  [v3 appendFormat:@"{ bundle identifier: %@; ", self->_identifier];
  id v4 = [(_MXExtension *)self extension];
  uint64_t v5 = [v4 extensionPointIdentifier];
  unint64_t v6 = [(_MXExtension *)self type];
  uint64_t v7 = @"Non-UI";
  if (v6 == 1) {
    uint64_t v7 = @"UI";
  }
  [v3 appendFormat:@"ExtensionPointName: %@; %@ }", v5, v7];

  v8 = (void *)[v3 copy];

  return v8;
}

- (NSString)displayName
{
  v2 = [(_MXExtension *)self extension];
  unint64_t v3 = [v2 _displayName];

  return (NSString *)v3;
}

- (NSString)containingAppDisplayName
{
  v2 = [(_MXExtension *)self extension];
  unint64_t v3 = [v2 _containingAppDisplayName];

  return (NSString *)v3;
}

- (NSExtension)extension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  id v4 = [WeakRetained _extensionWithIdentifier:self->_identifier];

  return (NSExtension *)v4;
}

- (BOOL)_setEnabled:(BOOL)a3 error:(id *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v8 = WeakRetained;
  if (a3) {
    char v9 = [WeakRetained _enableExtension:self error:a4];
  }
  else {
    char v9 = [WeakRetained _disableExtension:self error:a4];
  }
  BOOL v10 = v9;

  return v10;
}

- (BOOL)_isMapsExtension
{
  unint64_t v3 = [(_MXExtension *)self extensionPointIdentifier];
  if ([v3 isEqualToString:@"com.apple.maps.services"])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(_MXExtension *)self extensionPointIdentifier];
    char v4 = [v5 isEqualToString:@"com.apple.maps.ui-services"];
  }
  return v4;
}

- (BOOL)_isIntentExtension
{
  unint64_t v3 = [(_MXExtension *)self extensionPointIdentifier];
  if ([v3 isEqualToString:*MEMORY[0x1E4F300E8]])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(_MXExtension *)self extensionPointIdentifier];
    char v4 = [v5 isEqualToString:*MEMORY[0x1E4F300F0]];
  }
  return v4;
}

- (id)siblingExtensions
{
  unint64_t v3 = [(_MXExtension *)self provider];
  char v4 = [(_MXExtension *)self _containingAppIdentifer];
  uint64_t v5 = [v3 siblingExtensionsWithContainingAppIdentifer:v4];

  return v5;
}

- (id)_containingAppIdentifer
{
  v2 = [(_MXExtension *)self extension];
  unint64_t v3 = [v2 _containingAppIdentifer];

  return v3;
}

- (id)_iconForTableUI
{
  return [(_MXExtension *)self _iconWithFormat:0];
}

- (id)_iconWithFormat:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  char v4 = [(_MXExtension *)self extension];
  uint64_t v5 = [v4 _iconWithFormat:v3];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (_MXExtensionProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (_MXExtensionProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)handleRequest:(id)a3 requestDispatcher:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[_MXExtensionService alloc] initWithExtensionProxy:self];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87___MXExtension_MXExtensionRequestHandling__handleRequest_requestDispatcher_completion___block_invoke;
  v16[3] = &unk_1E54BC4C0;
  uint64_t v17 = v11;
  id v18 = v8;
  long long v12 = v11;
  id v13 = v8;
  long long v14 = [(_MXExtensionService *)v12 handleRequest:v10 requestDispatcher:v9 completion:v16];

  return v14;
}

- (id)startSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4 toObserver:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[_MXExtensionService alloc] initWithExtensionProxy:self];
  long long v12 = [(_MXExtensionService *)v11 startSendingUpdatesForRequest:v10 requestDispatcher:v9 toObserver:v8];

  return v12;
}

- (BOOL)canSupportIntent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_MXExtension *)self extension];
  char v6 = [v5 _canSupportIntent:v4];

  return v6;
}

- (BOOL)canSupportIntentClass:(Class)a3
{
  id v4 = [(_MXExtension *)self extension];
  LOBYTE(a3) = [v4 _canSupportIntentClass:a3];

  return (char)a3;
}

- (void)startExtensionServiceWithInputItems:(id)a3 begin:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [[_MXExtensionService alloc] initWithExtensionProxy:self];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __104___MXExtension_ridesharing_willBeDepreicatedSoon__startExtensionServiceWithInputItems_begin_completion___block_invoke;
  v13[3] = &unk_1E54B9B48;
  long long v14 = v9;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  v11 = v9;
  id v12 = v7;
  [(_MXExtensionService *)v11 connectExtensionWithHandler:v13];
}

+ (BOOL)shouldDeserializeCacheItems
{
  return _shouldDeserializeCacheItems;
}

+ (void)setShouldDeserializeCacheItems:(BOOL)a3
{
  _shouldDeserializeCacheItems = a3;
}

- (id)resolveIntentSlot:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 identifier];
  id v12 = [[_MXExtensionService alloc] initWithExtensionProxy:self];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70___MXExtension_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke;
  v18[3] = &unk_1E54BF300;
  id v20 = v11;
  id v21 = v8;
  v19 = v12;
  id v13 = v11;
  long long v14 = v12;
  id v15 = v8;
  id v16 = [(_MXExtensionService *)v14 resolveIntentSlot:v10 forIntent:v9 completionBlock:v18];

  return v16;
}

- (id)confirmIntent:(id)a3 expectResponseClass:(Class)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 identifier];
  v11 = [[_MXExtensionService alloc] initWithExtensionProxy:self];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75___MXExtension_INIntent__confirmIntent_expectResponseClass_withCompletion___block_invoke;
  v17[3] = &unk_1E54BF328;
  v17[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v20 = v8;
  id v12 = v10;
  id v13 = v11;
  id v14 = v8;
  id v15 = [(_MXExtensionService *)v13 confirmIntent:v9 expectResponseClass:a4 withCompletion:v17];

  return v15;
}

- (id)handleIntent:(id)a3 expectResponseClass:(Class)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 identifier];
  v11 = [[_MXExtensionService alloc] initWithExtensionProxy:self];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74___MXExtension_INIntent__handleIntent_expectResponseClass_withCompletion___block_invoke;
  v17[3] = &unk_1E54BF328;
  v17[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v20 = v8;
  id v12 = v10;
  id v13 = v11;
  id v14 = v8;
  id v15 = [(_MXExtensionService *)v13 handleIntent:v9 expectResponseClass:a4 withCompletion:v17];

  return v15;
}

- (id)startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_MXExtensionService alloc] initWithExtensionProxy:self];
  id v9 = [(_MXExtensionService *)v8 startSendingUpdatesForIntent:v7 toObserver:v6];

  return v9;
}

- (void)_loadCacheItems:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42___MXExtension_INIntent___loadCacheItems___block_invoke;
  v3[3] = &unk_1E54BF3A0;
  v3[4] = self;
  [MEMORY[0x1E4F306F8] deserializeCacheItems:a3 completion:v3];
}

@end