@interface AFClientPluginManager
+ (id)clientPluginManagerWithFactoryInitializationBlock:(id)a3;
- (id)speakableNamespaceProviderForAceObject:(id)a3;
@end

@implementation AFClientPluginManager

+ (id)clientPluginManagerWithFactoryInitializationBlock:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  id v4 = a3;
  v5 = CPSystemRootDirectory();
  v12[0] = v5;
  v12[1] = @"System";
  v12[2] = @"/Library/Assistant/UIPlugins";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  v7 = [v3 pathWithComponents:v6];

  v11[0] = @"SiriDomains";
  v11[1] = @"SiriDisambiguationDomains";
  v11[2] = @"SiriProviderDomains";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  v9 = +[AFPluginManager pluginManagerForPath:v7 domainKeys:v8 factoryInitializationBlock:v4];

  return v9;
}

- (id)speakableNamespaceProviderForAceObject:(id)a3
{
  id v5 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__41585;
  v20 = __Block_byref_object_dispose__41586;
  id v21 = 0;
  v6 = [v5 groupIdentifier];
  v7 = [v5 encodedClassName];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__AFClientPluginManager_AceFactorySupport__speakableNamespaceProviderForAceObject___block_invoke;
  void v11[3] = &unk_1E592B268;
  v14 = &v16;
  id v8 = v5;
  SEL v15 = a2;
  id v12 = v8;
  v13 = self;
  [(AFPluginManager *)self enumerateFactoryInstancesForDomainKey:@"SiriProviderDomains" groupIdentifier:v6 classIdentifier:v7 usingBlock:v11];

  id v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __83__AFClientPluginManager_AceFactorySupport__speakableNamespaceProviderForAceObject___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v11 = a2;
  if ([v11 conformsToProtocol:&unk_1EEEE6FA8]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v5 = [v11 speakableNamespaceProviderForAceObject:a1[4]];
    uint64_t v6 = *(void *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = *(id *)(*(void *)(a1[6] + 8) + 40);
    if (v8 == v11)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a1[7], a1[5], @"AFClientPluginManager.m", 49, @"Plugin factory %@ must return a new allocated instance of id<AFSpeakableNamespaceProvider> from speakableNamespaceProviderForAceObject:", objc_opt_class() object file lineNumber description];

      id v8 = *(id *)(*(void *)(a1[6] + 8) + 40);
      if (!v8) {
        goto LABEL_7;
      }
    }
    else if (!v8)
    {
      goto LABEL_7;
    }
    if (([v8 conformsToProtocol:&unk_1EEEAF308] & 1) == 0)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a1[7], a1[5], @"AFClientPluginManager.m", 50, @"instance must conform to AFSpeakableNamespaceProvider, %@", *(void *)(*(void *)(a1[6] + 8) + 40) object file lineNumber description];
    }
  }
LABEL_7:
  if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
    *a3 = 1;
  }
}

@end