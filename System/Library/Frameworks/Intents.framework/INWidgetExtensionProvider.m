@interface INWidgetExtensionProvider
+ (INWidgetExtensionProvider)sharedProvider;
- (CHSWidgetExtensionProvider)provider;
- (INWidgetExtensionProvider)init;
- (id)descriptorForIntent:(id)a3;
- (void)setProvider:(id)a3;
@end

@implementation INWidgetExtensionProvider

- (void).cxx_destruct
{
}

- (void)setProvider:(id)a3
{
}

- (CHSWidgetExtensionProvider)provider
{
  return self->_provider;
}

- (id)descriptorForIntent:(id)a3
{
  id v4 = a3;
  v5 = [(INWidgetExtensionProvider *)self provider];
  v6 = [v5 extensions];
  v7 = [v6 allObjects];

  v8 = objc_msgSend(v7, "if_flatMap:", &__block_literal_global_3_111612);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_3;
  v16[3] = &unk_1E551EB98;
  id v9 = v4;
  id v17 = v9;
  v10 = objc_msgSend(v8, "if_firstObjectPassingTest:", v16);
  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    v12 = objc_msgSend(v7, "if_flatMap:", &__block_literal_global_11_111613);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_6;
    v14[3] = &unk_1E551EBE0;
    id v15 = v9;
    objc_msgSend(v12, "if_firstObjectPassingTest:", v14);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

uint64_t __49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 supportsIntent:*(void *)(a1 + 32)];
}

uint64_t __49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 supportsIntent:*(void *)(a1 + 32)];
}

id __49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 orderedControlDescriptors];
  v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_14);

  return v3;
}

INControlDescriptor *__49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 intentType];

  if (v3)
  {
    id v4 = [v2 intentType];
    v5 = [v4 componentsSeparatedByString:@"."];
    v6 = [v5 lastObject];

    v7 = [INControlDescriptor alloc];
    v8 = [v2 extensionIdentity];
    id v9 = [v8 extensionBundleIdentifier];
    v10 = [v2 kind];
    id v11 = [v2 actionIntentType];
    v12 = [(INControlDescriptor *)v7 initWithExtensionBundleIdentifier:v9 kind:v10 intentClassName:v6 actionIntentType:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __49__INWidgetExtensionProvider_descriptorForIntent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 orderedDescriptors];
  v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_6_111624);

  return v3;
}

INWidgetDescriptor *__49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 intentType];

  if (v3)
  {
    if (([v2 supportedFamilies] & 8) != 0)
    {
      unint64_t v4 = 3;
    }
    else if (([v2 supportedFamilies] & 4) != 0)
    {
      unint64_t v4 = 2;
    }
    else if (([v2 supportedFamilies] & 2) != 0)
    {
      unint64_t v4 = 1;
    }
    else
    {
      unint64_t v4 = ((unint64_t)[v2 supportedFamilies] >> 2) & 4;
    }
    v5 = [v2 intentType];
    v6 = [v5 componentsSeparatedByString:@"."];
    v7 = [v6 lastObject];

    v8 = [INWidgetDescriptor alloc];
    id v9 = [v2 extensionBundleIdentifier];
    v10 = [v2 kind];
    v3 = [(INWidgetDescriptor *)v8 initWithExtensionBundleIdentifier:v9 kind:v10 intentClassName:v7 preferredSizeClass:v4];
  }

  return v3;
}

- (INWidgetExtensionProvider)init
{
  v18.receiver = self;
  v18.super_class = (Class)INWidgetExtensionProvider;
  id v2 = [(INWidgetExtensionProvider *)&v18 init];
  if (v2)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v3 = (void *)getCHSWidgetDescriptorsPredicateClass_softClass;
    uint64_t v27 = getCHSWidgetDescriptorsPredicateClass_softClass;
    if (!getCHSWidgetDescriptorsPredicateClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getCHSWidgetDescriptorsPredicateClass_block_invoke;
      v22 = &unk_1E5520EB8;
      v23 = &v24;
      __getCHSWidgetDescriptorsPredicateClass_block_invoke((uint64_t)&v19);
      v3 = (void *)v25[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v24, 8);
    v5 = [v4 visible];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v6 = (void *)getCHSControlDescriptorsPredicateClass_softClass;
    uint64_t v27 = getCHSControlDescriptorsPredicateClass_softClass;
    if (!getCHSControlDescriptorsPredicateClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getCHSControlDescriptorsPredicateClass_block_invoke;
      v22 = &unk_1E5520EB8;
      v23 = &v24;
      __getCHSControlDescriptorsPredicateClass_block_invoke((uint64_t)&v19);
      v6 = (void *)v25[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v24, 8);
    v8 = [v7 visible];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    id v9 = (void *)getCHSWidgetExtensionProviderOptionsClass_softClass;
    uint64_t v27 = getCHSWidgetExtensionProviderOptionsClass_softClass;
    if (!getCHSWidgetExtensionProviderOptionsClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getCHSWidgetExtensionProviderOptionsClass_block_invoke;
      v22 = &unk_1E5520EB8;
      v23 = &v24;
      __getCHSWidgetExtensionProviderOptionsClass_block_invoke((uint64_t)&v19);
      id v9 = (void *)v25[3];
    }
    v10 = v9;
    _Block_object_dispose(&v24, 8);
    id v11 = (void *)[[v10 alloc] initWithWidgetsPredicate:v5 controlsPredicate:v8 includeIntents:0];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v12 = (void *)getCHSWidgetExtensionProviderClass_softClass;
    uint64_t v27 = getCHSWidgetExtensionProviderClass_softClass;
    if (!getCHSWidgetExtensionProviderClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getCHSWidgetExtensionProviderClass_block_invoke;
      v22 = &unk_1E5520EB8;
      v23 = &v24;
      __getCHSWidgetExtensionProviderClass_block_invoke((uint64_t)&v19);
      v12 = (void *)v25[3];
    }
    v13 = v12;
    _Block_object_dispose(&v24, 8);
    uint64_t v14 = [[v13 alloc] initWithOptions:v11];
    provider = v2->_provider;
    v2->_provider = (CHSWidgetExtensionProvider *)v14;

    v16 = v2;
  }

  return v2;
}

+ (INWidgetExtensionProvider)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_111641);
  }
  id v2 = (void *)sharedProvider_sharedProvider;

  return (INWidgetExtensionProvider *)v2;
}

uint64_t __43__INWidgetExtensionProvider_sharedProvider__block_invoke()
{
  v0 = objc_alloc_init(INWidgetExtensionProvider);
  uint64_t v1 = sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end