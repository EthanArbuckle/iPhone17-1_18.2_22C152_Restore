@interface CHKObjcUtilities
+ (id)archivedPreferencesWithHashesForBundleIDs:(id)a3;
+ (id)createWorkLoopWithLabel:(id)a3 qos:(unsigned int)a4;
+ (id)preferredLanguagesForContainerBundleIdentifier:(id)a3;
@end

@implementation CHKObjcUtilities

+ (id)createWorkLoopWithLabel:(id)a3 qos:(unsigned int)a4
{
  inactive = dispatch_workloop_create_inactive((const char *)[a3 UTF8String]);
  dispatch_workloop_set_autorelease_frequency(inactive, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_set_qos_class_fallback();
  dispatch_activate(inactive);

  return inactive;
}

+ (id)preferredLanguagesForContainerBundleIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F70FE8];
  id v11 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v11 count:1];
  v7 = objc_msgSend(v3, "preferredLanguagesForBundleIDs:", v6, v11, v12);
  v8 = [v7 objectForKeyedSubscript:v5];

  if ([v8 count]) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

+ (id)archivedPreferencesWithHashesForBundleIDs:(id)a3
{
  return (id)[MEMORY[0x1E4F1CA20] archivedPreferencesWithHashesForBundleIDs:a3];
}

@end