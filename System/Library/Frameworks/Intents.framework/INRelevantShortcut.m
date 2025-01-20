@interface INRelevantShortcut
+ (BOOL)supportsSecureCoding;
- (INDefaultCardTemplate)watchTemplate;
- (INImage)_keyImage;
- (INRelevantShortcut)init;
- (INRelevantShortcut)initWithCoder:(id)a3;
- (INRelevantShortcut)initWithShortcut:(INShortcut *)shortcut;
- (INRelevantShortcutRole)shortcutRole;
- (INShortcut)shortcut;
- (NSArray)relevanceProviders;
- (NSString)widgetKind;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setRelevanceProviders:(NSArray *)relevanceProviders;
- (void)setShortcut:(id)a3;
- (void)setShortcutRole:(INRelevantShortcutRole)shortcutRole;
- (void)setWatchTemplate:(INDefaultCardTemplate *)watchTemplate;
- (void)setWidgetKind:(NSString *)widgetKind;
@end

@implementation INRelevantShortcut

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 _keyImage];
  v8 = [v6 _keyImage];

  if (v7 && v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = -1;
    }
  }
  else
  {
    if (v8) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v7) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = v10;
    }
  }

  return v9;
}

- (INImage)_keyImage
{
  v3 = [(INRelevantShortcut *)self watchTemplate];
  v4 = [v3 _keyImage];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(INRelevantShortcut *)self shortcut];
    id v6 = [v7 _keyImage];
  }

  return (INImage *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_watchTemplate, 0);

  objc_storeStrong((id *)&self->_relevanceProviders, 0);
}

- (void)setShortcut:(id)a3
{
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (void)setShortcutRole:(INRelevantShortcutRole)shortcutRole
{
  self->_shortcutRole = shortcutRole;
}

- (INRelevantShortcutRole)shortcutRole
{
  return self->_shortcutRole;
}

- (void)setWidgetKind:(NSString *)widgetKind
{
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (void)setWatchTemplate:(INDefaultCardTemplate *)watchTemplate
{
}

- (INDefaultCardTemplate)watchTemplate
{
  return self->_watchTemplate;
}

- (void)encodeWithCoder:(id)a3
{
  shortcut = self->_shortcut;
  id v5 = a3;
  [v5 encodeObject:shortcut forKey:@"shortcut"];
  [v5 encodeObject:self->_relevanceProviders forKey:@"relevanceProviders"];
  [v5 encodeObject:self->_watchTemplate forKey:@"watchTemplate"];
  [v5 encodeObject:self->_widgetKind forKey:@"widgetKind"];
  [v5 encodeInteger:self->_shortcutRole forKey:@"shortcutRole"];
}

- (INRelevantShortcut)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)INRelevantShortcut;
  id v5 = [(INRelevantShortcut *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcut"];
    shortcut = v5->_shortcut;
    v5->_shortcut = (INShortcut *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"relevanceProviders"];
    relevanceProviders = v5->_relevanceProviders;
    v5->_relevanceProviders = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchTemplate"];
    watchTemplate = v5->_watchTemplate;
    v5->_watchTemplate = (INDefaultCardTemplate *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widgetKind"];
    widgetKind = v5->_widgetKind;
    v5->_widgetKind = (NSString *)v15;

    v5->_shortcutRole = [v4 decodeIntegerForKey:@"shortcutRole"];
    v17 = v5;
  }

  return v5;
}

- (NSArray)relevanceProviders
{
  return self->_relevanceProviders;
}

- (void)setRelevanceProviders:(NSArray *)relevanceProviders
{
  v34[2] = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = relevanceProviders;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v24 + 1) + 8 * i);
        v34[0] = objc_opt_class();
        v34[1] = objc_opt_class();
        uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
        uint64_t v10 = [v9 arrayByAddingObject:objc_opt_class()];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (!v12)
        {
LABEL_18:

          v18 = NSString;
          objc_super v19 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v19);
          uint64_t v21 = [v18 stringWithFormat:@"\"%@\" is not a valid relevance provider class", v20];

          id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0];
          objc_exception_throw(v22);
        }
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v29;
LABEL_8:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          if ([v8 isMemberOfClass:*(void *)(*((void *)&v28 + 1) + 8 * v15)]) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
            if (!v13) {
              goto LABEL_18;
            }
            goto LABEL_8;
          }
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v5);
  }

  v16 = (NSArray *)[(NSArray *)v3 copy];
  v17 = self->_relevanceProviders;
  self->_relevanceProviders = v16;
}

- (INRelevantShortcut)initWithShortcut:(INShortcut *)shortcut
{
  uint64_t v4 = shortcut;
  v12.receiver = self;
  v12.super_class = (Class)INRelevantShortcut;
  uint64_t v5 = [(INRelevantShortcut *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [(INShortcut *)v4 copy];
    v7 = v5->_shortcut;
    v5->_shortcut = (INShortcut *)v6;

    uint64_t v8 = objc_opt_new();
    relevanceProviders = v5->_relevanceProviders;
    v5->_relevanceProviders = (NSArray *)v8;

    v5->_shortcutRole = 0;
    uint64_t v10 = v5;
  }

  return v5;
}

- (INRelevantShortcut)init
{
  v3 = [INShortcut alloc];
  uint64_t v4 = objc_opt_new();
  id v5 = [(INShortcut *)v3 _initWithIntent:v4];
  uint64_t v6 = [(INRelevantShortcut *)self initWithShortcut:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(INRelevantShortcut *)self relevanceProviders];
  [v4 setRelevanceProviders:v5];

  uint64_t v6 = [(INRelevantShortcut *)self watchTemplate];
  [v4 setWatchTemplate:v6];

  v7 = [(INRelevantShortcut *)self widgetKind];
  [v4 setWidgetKind:v7];

  uint64_t v8 = [(INRelevantShortcut *)self shortcut];
  [v4 setShortcut:v8];

  objc_msgSend(v4, "setShortcutRole:", -[INRelevantShortcut shortcutRole](self, "shortcutRole"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (void *)[(INRelevantShortcut *)self copy];
    id v9 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v10 = INImageProxyInjectionQueue();
    [v9 setUnderlyingQueue:v10];

    [v9 setMaxConcurrentOperationCount:1];
    [v9 setSuspended:1];
    id v11 = (void *)MEMORY[0x1E4F28B48];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__INRelevantShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
    v19[3] = &unk_1E551F740;
    v19[4] = v8;
    id v20 = v7;
    objc_super v12 = [v11 blockOperationWithBlock:v19];
    uint64_t v13 = [(INRelevantShortcut *)self shortcut];
    if (v13)
    {
      uint64_t v14 = objc_alloc_init(INImageProxyInjectionOperation);
      [(INImageProxyInjectionOperation *)v14 setInjector:v13];
      [(INImageProxyInjectionOperation *)v14 setImageProxyRequestBlock:v6];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __80__INRelevantShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
      v18[3] = &unk_1E551E178;
      v18[4] = v8;
      [(INImageProxyInjectionOperation *)v14 setCopyReturnBlock:v18];
      [v12 addDependency:v14];
      [v9 addOperation:v14];
    }
    uint64_t v15 = [(INRelevantShortcut *)self watchTemplate];
    if (v15)
    {
      v16 = objc_alloc_init(INImageProxyInjectionOperation);
      [(INImageProxyInjectionOperation *)v16 setInjector:v15];
      [(INImageProxyInjectionOperation *)v16 setImageProxyRequestBlock:v6];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __80__INRelevantShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3;
      v17[3] = &unk_1E551E178;
      v17[4] = v8;
      [(INImageProxyInjectionOperation *)v16 setCopyReturnBlock:v17];
      [v12 addDependency:v16];
      [v9 addOperation:v16];
    }
    [v9 addOperation:v12];
    [v9 setSuspended:0];
  }
}

uint64_t __80__INRelevantShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __80__INRelevantShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) setShortcut:a2];
  }
  return result;
}

uint64_t __80__INRelevantShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) setWatchTemplate:a2];
  }
  return result;
}

@end