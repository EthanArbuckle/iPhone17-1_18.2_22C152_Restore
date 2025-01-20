@interface APSettings
+ (NSMapTable)mapTable;
+ (id)defaultValues;
+ (id)settings;
+ (id)storageWithDefaultValues:(id)a3;
- (APSettings)init;
- (APSettingsStorableProtocol)storage;
- (id)_gatherSubclassProperties;
- (id)_namespacedKey:(id)a3;
- (id)_propertyNameFromSetSelectorString:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)synchronize;
@end

@implementation APSettings

+ (id)defaultValues
{
  return 0;
}

+ (id)storageWithDefaultValues:(id)a3
{
  id v3 = a3;
  v4 = [[APSettingsStorageFile alloc] initWithDefaultValues:v3];

  return v4;
}

+ (NSMapTable)mapTable
{
  if (qword_1EB7898E8 != -1) {
    dispatch_once(&qword_1EB7898E8, &unk_1F2E9CBB0);
  }
  v2 = (void *)qword_1EB789890;
  return (NSMapTable *)v2;
}

+ (id)settings
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [a1 mapTable];
  objc_sync_enter(v5);
  id v6 = [v5 objectForKey:v4];
  if (!v6)
  {
    id v6 = objc_alloc_init((Class)objc_opt_class());
    if (v6)
    {
      [v5 setObject:v6 forKey:v4];
    }
    else
    {
      v7 = APLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_ERROR, "Failed to initialize settings storage.", v9, 2u);
      }

      id v6 = 0;
    }
  }
  objc_sync_exit(v5);

  return v6;
}

- (void)synchronize
{
  id v2 = [(APSettings *)self storage];
  [v2 synchronize];
}

- (APSettings)init
{
  v7.receiver = self;
  v7.super_class = (Class)APSettings;
  id v2 = [(APSettings *)&v7 init];
  if (v2)
  {
    id v3 = [(id)objc_opt_class() defaultValues];
    uint64_t v4 = [(id)objc_opt_class() storageWithDefaultValues:v3];
    storage = v2->_storage;
    v2->_storage = (APSettingsStorableProtocol *)v4;
  }
  return v2;
}

- (id)_namespacedKey:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  objc_super v7 = [v3 stringWithFormat:@"%@%@%@", v6, @".", v4];

  return v7;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  id v5 = [(APSettings *)self _gatherSubclassProperties];
  if ([v5 containsObject:v4])
  {
    id v6 = [(APSettings *)self storage];
    objc_super v7 = [(APSettings *)self _namespacedKey:v4];
    v8 = [v6 valueForKey:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_super v7 = [(APSettings *)self _gatherSubclassProperties];
  if ([v7 containsObject:v6])
  {
    v8 = [(APSettings *)self storage];
    v9 = [(APSettings *)self _namespacedKey:v6];
    [v8 setValue:v10 forKey:v9];
  }
}

- (id)_gatherSubclassProperties
{
  unsigned int outCount = 0;
  id v2 = (objc_class *)objc_opt_class();
  id v3 = class_copyPropertyList(v2, &outCount);
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v5 = (void *)[v4 initWithCapacity:outCount];
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      objc_super v7 = [NSString stringWithUTF8String:property_getName(v3[i])];
      [v5 addObject:v7];
    }
  }
  free(v3);
  return v5;
}

- (id)_propertyNameFromSetSelectorString:(id)a3
{
  id v3 = [a3 substringFromIndex:3];
  id v4 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);

  id v5 = [v4 substringToIndex:1];
  id v6 = [v5 lowercaseString];
  objc_super v7 = [v4 substringFromIndex:1];
  v8 = [v6 stringByAppendingString:v7];

  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector((SEL)[v4 selector]);
  if ([v5 hasPrefix:@"set"])
  {
    id v6 = [(APSettings *)self _propertyNameFromSetSelectorString:v5];
    id location = 0;
    [v4 getArgument:&location atIndex:2];
    id v7 = objc_loadWeakRetained(&location);
    [(APSettings *)self setValue:v7 forUndefinedKey:v6];

    objc_destroyWeak(&location);
  }
  else
  {
    id location = [(APSettings *)self valueForUndefinedKey:v5];
    [v4 retainArguments];
    [v4 setReturnValue:&location];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v5 = NSStringFromSelector(a3);
  id v6 = [(APSettings *)self _gatherSubclassProperties];
  if ([v5 hasPrefix:@"set"])
  {
    id v7 = [(APSettings *)self _propertyNameFromSetSelectorString:v5];
    if ([v6 containsObject:v7])
    {
      v8 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:"v@:@"];

      goto LABEL_9;
    }

    goto LABEL_7;
  }
  if (![v6 containsObject:v5])
  {
LABEL_7:
    v11.receiver = self;
    v11.super_class = (Class)APSettings;
    uint64_t v9 = [(APSettings *)&v11 methodSignatureForSelector:a3];
    goto LABEL_8;
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:"@@:"];
LABEL_8:
  v8 = (void *)v9;
LABEL_9:

  return v8;
}

- (APSettingsStorableProtocol)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
}

@end