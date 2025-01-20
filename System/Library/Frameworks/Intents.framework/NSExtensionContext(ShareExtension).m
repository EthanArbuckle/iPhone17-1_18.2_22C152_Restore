@interface NSExtensionContext(ShareExtension)
- (id)_intents_intent;
- (id)intent;
- (uint64_t)_intents_accessedIntent;
- (void)_intents_setAccessedIntent:()ShareExtension;
- (void)_intents_setIntent:()ShareExtension;
@end

@implementation NSExtensionContext(ShareExtension)

- (id)intent
{
  os_unfair_lock_lock((os_unfair_lock_t)&extentionContextIntentAccessorLock);
  v2 = objc_msgSend(a1, "_intents_intent");
  if (objc_msgSend(a1, "_intents_accessedIntent"))
  {
    v3 = v2;
  }
  else
  {
    id v4 = [a1 _UUID];
    v5 = [MEMORY[0x1E4F223F0] bundleProxyForCurrentProcess];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
    id v7 = v6;

    v8 = [v7 protocol];
    char v9 = [v8 isEqualToString:@"com.apple.share-services"];

    if ((v9 & 1) == 0)
    {
      id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-[NSExtensionContext intent] can only be called from a share extension." userInfo:0];
      objc_exception_throw(v17);
    }
    v10 = +[INImageServiceConnection sharedConnection];
    v3 = [v10 fetchShareExtensionIntentForExtensionContextUUID:v4];

    objc_msgSend(a1, "_intents_setIntent:", v3);
    objc_msgSend(a1, "_intents_setAccessedIntent:", 1);
    if (v4 && v3)
    {
      v11 = [v3 _className];
      +[INIntent _setSharedExtensionContextUUID:v4 forIntentClassName:v11];
    }
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    if (!v3
      || ([v3 _className],
          v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v14 isEqualToString:v13],
          v14,
          (v15 & 1) == 0))
    {
      +[INIntent _setSharedExtensionContextUUID:v4 forIntentClassName:v13];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&extentionContextIntentAccessorLock);

  return v3;
}

- (void)_intents_setIntent:()ShareExtension
{
}

- (id)_intents_intent
{
  return objc_getAssociatedObject(a1, (const void *)_intentPropertyKey);
}

- (void)_intents_setAccessedIntent:()ShareExtension
{
  v2 = (const void *)_accessedIntentPropertyKey;
  objc_msgSend(NSNumber, "numberWithBool:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);
}

- (uint64_t)_intents_accessedIntent
{
  v1 = objc_getAssociatedObject(a1, (const void *)_accessedIntentPropertyKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end