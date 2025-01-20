@interface INShortcut
+ (BOOL)supportsSecureCoding;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (INImage)_keyImage;
- (INImage)activityImage;
- (INIntent)intent;
- (INShortcut)initWithActivityData:(id)a3 activityImage:(id)a4 activitySubtitle:(id)a5 activityBundleIdentifier:(id)a6;
- (INShortcut)initWithCoder:(id)a3;
- (INShortcut)initWithIntent:(INIntent *)intent;
- (INShortcut)initWithUserActivity:(NSUserActivity *)userActivity;
- (INShortcut)initWithUserActivity:(id)a3 bundleIdentifier:(id)a4;
- (INShortcut)shortcutWithActivityBundleIdentifier:(id)a3;
- (INShortcut)shortcutWithActivityImage:(id)a3;
- (NSData)activityData;
- (NSString)_associatedAppBundleIdentifier;
- (NSString)_subtitle;
- (NSString)_title;
- (NSString)activityBundleIdentifier;
- (NSString)activitySubtitle;
- (NSString)description;
- (NSUserActivity)userActivity;
- (id)_initWithIntent:(id)a3;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INShortcut

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

- (INImage)_keyImage
{
  v3 = [(INShortcut *)self intent];
  v4 = [v3 _keyImage];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(INShortcut *)self activityImage];
  }
  v7 = v6;

  return (INImage *)v7;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28DB0];
  id v11 = 0;
  id v6 = (void (**)(id, void *, id))a4;
  v7 = [v5 archivedDataWithRootObject:self requiringSecureCoding:1 error:&v11];
  id v8 = v11;
  v6[2](v6, v7, v8);

  v9 = objc_opt_new();

  return v9;
}

+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.sirikit.shortcut";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.sirikit.shortcut";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  id v8 = objc_msgSend(v6, "_in_safeUnarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, a5);

  return v8;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    v9 = INImageProxyInjectionQueue();
    [v8 setUnderlyingQueue:v9];

    [v8 setMaxConcurrentOperationCount:1];
    [v8 setSuspended:1];
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__65171;
    v22[4] = __Block_byref_object_dispose__65172;
    v10 = self;
    v23 = v10;
    id v11 = (void *)MEMORY[0x1E4F28B48];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__INShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
    v19[3] = &unk_1E551E410;
    id v20 = v7;
    v21 = v22;
    v12 = [v11 blockOperationWithBlock:v19];
    v13 = [(INShortcut *)v10 intent];
    uint64_t v14 = [(INShortcut *)v10 activityImage];
    v15 = (void *)v14;
    if (v13)
    {
      v16 = objc_alloc_init(INImageProxyInjectionOperation);
      [(INImageProxyInjectionOperation *)v16 setInjector:v13];
      [(INImageProxyInjectionOperation *)v16 setImageProxyRequestBlock:v6];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __72__INShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
      v18[3] = &unk_1E551A818;
      v18[4] = v10;
      v18[5] = v22;
      [(INImageProxyInjectionOperation *)v16 setCopyReturnBlock:v18];
      [v12 addDependency:v16];
      [v8 addOperation:v16];
    }
    else
    {
      if (!v14)
      {
LABEL_7:
        [v8 addOperation:v12];
        [v8 setSuspended:0];

        _Block_object_dispose(v22, 8);
        goto LABEL_8;
      }
      v16 = objc_alloc_init(INImageProxyInjectionOperation);
      [(INImageProxyInjectionOperation *)v16 setInjector:v15];
      [(INImageProxyInjectionOperation *)v16 setImageProxyRequestBlock:v6];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __72__INShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3;
      v17[3] = &unk_1E551A840;
      v17[4] = v10;
      v17[5] = v22;
      [(INImageProxyInjectionOperation *)v16 setCopyReturnBlock:v17];
      [v12 addDependency:v16];
      [v8 addOperation:v16];
    }

    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __72__INShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __72__INShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithIntent:v3];

    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

uint64_t __72__INShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) shortcutWithActivityImage:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return MEMORY[0x1F41817F8](v3, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activitySubtitle, 0);
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_intent, 0);

  objc_storeStrong((id *)&self->_activityData, 0);
}

- (NSString)activityBundleIdentifier
{
  return self->_activityBundleIdentifier;
}

- (NSString)activitySubtitle
{
  return self->_activitySubtitle;
}

- (INImage)activityImage
{
  return self->_activityImage;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INShortcut *)self intent];
  id v6 = INIntentWithTypedIntent(v5);
  [v4 encodeObject:v6 forKey:@"intent"];

  id v7 = [(INShortcut *)self activityData];
  [v4 encodeObject:v7 forKey:@"userActivity"];

  id v8 = [(INShortcut *)self activityImage];
  [v4 encodeObject:v8 forKey:@"activityImage"];

  v9 = [(INShortcut *)self activitySubtitle];
  [v4 encodeObject:v9 forKey:@"activitySubtitle"];

  id v10 = [(INShortcut *)self activityBundleIdentifier];
  [v4 encodeObject:v10 forKey:@"activityBundleIdentifier"];
}

- (INShortcut)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
  id v6 = INTypedIntentWithIntent(v5);

  if (v6)
  {
    self = (INShortcut *)[(INShortcut *)self _initWithIntent:v6];
    id v7 = self;
  }
  else
  {
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivity"];
    if ([v8 length])
    {
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityImage"];
      id v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = objc_opt_class();
      v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
      v13 = [v4 decodeObjectOfClasses:v12 forKey:@"activitySubtitle"];

      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityBundleIdentifier"];
      self = [(INShortcut *)self initWithActivityData:v8 activityImage:v9 activitySubtitle:v13 activityBundleIdentifier:v14];

      id v7 = self;
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (INShortcut *)a3;
  if (self == v5)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      id v7 = [(INShortcut *)self intent];
      id v8 = [(INShortcut *)v6 intent];
      if (v7 != v8)
      {
        v9 = [(INShortcut *)self intent];
        uint64_t v3 = [(INShortcut *)v6 intent];
        v32 = v9;
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
          goto LABEL_25;
        }
      }
      uint64_t v11 = [(INShortcut *)self userActivity];
      v12 = [(INShortcut *)v6 userActivity];
      if (v11 != v12)
      {
        v13 = [(INShortcut *)self userActivity];
        v31 = [(INShortcut *)v6 userActivity];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
LABEL_23:

LABEL_24:
          if (v7 == v8)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        v29 = v13;
      }
      uint64_t v14 = [(INShortcut *)self activityImage];
      v15 = [(INShortcut *)v6 activityImage];
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        v16 = [(INShortcut *)self activityImage];
        v27 = [(INShortcut *)v6 activityImage];
        v28 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          char v10 = 0;
          v22 = v30;
          goto LABEL_21;
        }
        v25 = v12;
        v26 = v11;
      }
      v17 = [(INShortcut *)self activitySubtitle];
      uint64_t v18 = [(INShortcut *)v6 activitySubtitle];
      if (v17 == (void *)v18)
      {

        char v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        [(INShortcut *)self activitySubtitle];
        id v20 = v24 = v3;
        v21 = [(INShortcut *)v6 activitySubtitle];
        char v10 = [v20 isEqualToString:v21];

        uint64_t v3 = v24;
      }
      v22 = v30;
      v12 = v25;
      uint64_t v11 = v26;
      if (v30 == v15)
      {
LABEL_22:

        v13 = v29;
        if (v11 == v12) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    char v10 = 0;
  }
LABEL_27:

  return v10;
}

- (NSString)description
{
  intent = self->_intent;
  if (intent)
  {
    [NSString stringWithFormat:@"intent: %@", intent];
LABEL_5:
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (self->_userActivity)
  {
    [NSString stringWithFormat:@"userActivity: %@", self->_userActivity];
    goto LABEL_5;
  }
  id v4 = @"(empty)";
LABEL_6:
  uint64_t v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v5 stringWithFormat:@"<%@: %p %@>", v7, self, v4];

  return (NSString *)v8;
}

- (NSString)_associatedAppBundleIdentifier
{
  uint64_t v3 = [(INShortcut *)self intent];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(v3, "_intents_bundleIdForDisplay");
  }
  else
  {
    id v6 = [(INShortcut *)self userActivity];
    if (v6)
    {
      id v7 = [(INShortcut *)self activityBundleIdentifier];
      uint64_t v5 = INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity(v7);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSString)_subtitle
{
  uint64_t v3 = [(INShortcut *)self intent];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 _subtitle];
  }
  else
  {
    id v6 = [(INShortcut *)self userActivity];
    if (v6)
    {
      uint64_t v5 = [(INShortcut *)self activitySubtitle];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSString)_title
{
  uint64_t v3 = [(INShortcut *)self intent];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 _title];
  }
  else
  {
    id v6 = [(INShortcut *)self userActivity];
    id v7 = v6;
    if (v6)
    {
      uint64_t v5 = [v6 title];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSData)activityData
{
  uint64_t v3 = [(INShortcut *)self userActivity];
  activityData = self->_activityData;
  if (activityData) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    id v6 = [v3 contentAttributeSet];
    id v7 = [v6 thumbnailData];

    id v8 = [v3 contentAttributeSet];
    [v8 setThumbnailData:0];

    INUserActivitySerializeToData(v3);
    v9 = (NSData *)objc_claimAutoreleasedReturnValue();
    char v10 = self->_activityData;
    self->_activityData = v9;

    uint64_t v11 = [v3 contentAttributeSet];
    [v11 setThumbnailData:v7];

    activityData = self->_activityData;
  }
  v12 = activityData;

  return v12;
}

- (INShortcut)shortcutWithActivityBundleIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(INShortcut *)self userActivity];

  if (v5)
  {
    id v6 = objc_alloc((Class)objc_opt_class());
    id v7 = [(INShortcut *)self activityData];
    id v8 = [(INShortcut *)self activityImage];
    v9 = [(INShortcut *)self activitySubtitle];
    char v10 = (INShortcut *)[v6 initWithActivityData:v7 activityImage:v8 activitySubtitle:v9 activityBundleIdentifier:v4];
  }
  else
  {
    char v10 = self;
  }

  return v10;
}

- (INShortcut)shortcutWithActivityImage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(INShortcut *)self userActivity];

  if (v5)
  {
    id v6 = objc_alloc((Class)objc_opt_class());
    id v7 = [(INShortcut *)self activityData];
    id v8 = [(INShortcut *)self activitySubtitle];
    v9 = [(INShortcut *)self activityBundleIdentifier];
    char v10 = (INShortcut *)[v6 initWithActivityData:v7 activityImage:v4 activitySubtitle:v8 activityBundleIdentifier:v9];
  }
  else
  {
    char v10 = self;
  }

  return v10;
}

- (INShortcut)initWithActivityData:(id)a3 activityImage:(id)a4 activitySubtitle:(id)a5 activityBundleIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)INShortcut;
  uint64_t v14 = [(INShortcut *)&v31 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    activityData = v14->_activityData;
    v14->_activityData = (NSData *)v15;

    uint64_t v17 = [v11 copy];
    activityImage = v14->_activityImage;
    v14->_activityImage = (INImage *)v17;

    if ([v12 length])
    {
      uint64_t v19 = [v12 copy];
      activitySubtitle = v14->_activitySubtitle;
      v14->_activitySubtitle = (NSString *)v19;
    }
    else
    {
      activitySubtitle = v14->_activitySubtitle;
      v14->_activitySubtitle = 0;
    }

    uint64_t v21 = [v13 copy];
    activityBundleIdentifier = v14->_activityBundleIdentifier;
    v14->_activityBundleIdentifier = (NSString *)v21;

    if ([v10 length])
    {
      uint64_t v23 = INUserActivityDeserializeFromData(v10);
      userActivity = v14->_userActivity;
      v14->_userActivity = (NSUserActivity *)v23;

      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2050000000;
      v25 = (void *)getCSSearchableItemAttributeSetClass_softClass_79696;
      uint64_t v36 = getCSSearchableItemAttributeSetClass_softClass_79696;
      if (!getCSSearchableItemAttributeSetClass_softClass_79696)
      {
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __getCSSearchableItemAttributeSetClass_block_invoke_79697;
        v32[3] = &unk_1E5520EB8;
        v32[4] = &v33;
        __getCSSearchableItemAttributeSetClass_block_invoke_79697((uint64_t)v32);
        v25 = (void *)v34[3];
      }
      v26 = v25;
      _Block_object_dispose(&v33, 8);
      id v27 = objc_alloc_init(v26);
      v28 = [(INImage *)v14->_activityImage _imageData];
      [v27 setThumbnailData:v28];

      [(NSUserActivity *)v14->_userActivity setContentAttributeSet:v27];
    }
    v29 = v14;
  }

  return v14;
}

- (INShortcut)initWithUserActivity:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    id v8 = a4;
    v9 = [v7 title];
    uint64_t v10 = [v9 length];

    if (!v10) {
      NSLog((NSString *)@"Shortcut created from user activity (%@) is invalid because it is missing a title", v7);
    }
    id v11 = [v7 contentAttributeSet];
    id v12 = [v11 thumbnailURL];
    if ([v12 isFileURL])
    {
      id v13 = +[INImage imageWithURL:v12];
    }
    else
    {
      uint64_t v15 = [v11 thumbnailData];
      if ([v15 length])
      {
        id v13 = +[INImage imageWithImageData:v15];
      }
      else
      {
        id v13 = 0;
      }
    }
    v16 = [v11 contentDescription];
    self = [(INShortcut *)self initWithActivityData:0 activityImage:v13 activitySubtitle:v16 activityBundleIdentifier:v8];

    if (self)
    {
      objc_storeStrong((id *)&self->_userActivity, a3);
      uint64_t v17 = self;
    }

    uint64_t v14 = self;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (INShortcut)initWithUserActivity:(NSUserActivity *)userActivity
{
  return [(INShortcut *)self initWithUserActivity:userActivity bundleIdentifier:0];
}

- (id)_initWithIntent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INShortcut;
  BOOL v5 = [(INShortcut *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    intent = v5->_intent;
    v5->_intent = (INIntent *)v6;

    id v8 = v5;
  }

  return v5;
}

- (INShortcut)initWithIntent:(INIntent *)intent
{
  id v4 = intent;
  BOOL v5 = v4;
  if (v4 && ([(INIntent *)v4 _isConfigurable] || _INIsIntentValidForSuggestion(v5)))
  {
    self = (INShortcut *)[(INShortcut *)self _initWithIntent:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end