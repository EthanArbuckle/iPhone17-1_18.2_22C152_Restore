@interface DOCOpenLocationIntent
+ (id)intentFromActivity:(id)a3;
+ (id)intentFromGenericIntent:(id)a3;
@end

@implementation DOCOpenLocationIntent

+ (id)intentFromActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 activityType];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if ([v4 isEqualToString:v6])
  {
    v7 = [v3 interaction];
    v8 = [v7 intent];
    v9 = INTypedIntentWithIntent();

    if (v9) {
      goto LABEL_8;
    }
    v10 = (NSObject **)MEMORY[0x263F3AC28];
    v11 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[DOCOpenLocationIntent(DOCOpenLocationIntentExtensions) intentFromActivity:]((uint64_t)v3, v11);
    }
  }
  v9 = 0;
LABEL_8:

  return v9;
}

+ (id)intentFromGenericIntent:(id)a3
{
  id v3 = a3;
  v4 = INTypedIntentWithIntent();
  if (!v4)
  {
    v5 = (NSObject **)MEMORY[0x263F3AC28];
    v6 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[DOCOpenLocationIntent(DOCOpenLocationIntentExtensions) intentFromGenericIntent:]((uint64_t)v3, v6);
    }
  }

  return v4;
}

@end