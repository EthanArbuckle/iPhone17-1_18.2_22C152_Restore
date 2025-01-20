@interface HDBackgroundObservationServerExtensionManager
- (HDBackgroundObservationServerExtensionManager)init;
- (id)extensionForBundleIdentifier:(id)a3 error:(id *)a4;
@end

@implementation HDBackgroundObservationServerExtensionManager

- (HDBackgroundObservationServerExtensionManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)HDBackgroundObservationServerExtensionManager;
  v2 = [(HDBackgroundObservationServerExtensionManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    availableExtensions = v3->_availableExtensions;
    v3->_availableExtensions = v4;
  }
  return v3;
}

- (id)extensionForBundleIdentifier:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v7 = v6;
  v8 = v7;
  if (!self)
  {

    availableExtensions = (NSMutableDictionary *)MEMORY[0x10];
LABEL_17:
    -[NSMutableDictionary removeObjectForKey:](availableExtensions, "removeObjectForKey:", v8, (void)v20);
    id v11 = 0;
    id v18 = 0;
    goto LABEL_18;
  }
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v25 = *MEMORY[0x1E4F282B0];
  v26[0] = @"com.apple.healthkit.background-observation";
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v9 error:a4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = (id)[v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "hd_extensionContainerBundleIdentifier", (void)v20);
        if ([v15 isEqualToString:v8])
        {
          id v11 = v14;

          goto LABEL_12;
        }
      }
      id v11 = (id)[v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  availableExtensions = self->_availableExtensions;
  if (!v11) {
    goto LABEL_17;
  }
  uint64_t v17 = [(NSMutableDictionary *)availableExtensions objectForKeyedSubscript:v8];
  if (v17)
  {
    id v18 = (id)v17;
  }
  else
  {
    id v18 = [[HDBackgroundObservationServerExtension alloc] _initWithExtension:v11];
    [(NSMutableDictionary *)self->_availableExtensions setObject:v18 forKeyedSubscript:v8];
  }
LABEL_18:
  os_unfair_lock_unlock(&self->_lock);

  return v18;
}

- (void).cxx_destruct
{
}

@end