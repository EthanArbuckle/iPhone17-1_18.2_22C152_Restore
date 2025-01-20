@interface NLLogCategory
+ (id)_getCategory:(id)a3;
+ (id)categoryWithName:(id)a3;
+ (id)categoryWithName:(id)a3 inSubsystem:(id)a4;
+ (id)defaultCategory;
+ (void)_addCategory:(id)a3 inSubsystem:(id)a4;
+ (void)initialize;
- (NSString)loggingCategory;
- (NSString)loggingSubsystem;
- (OS_os_log)internal;
- (id)initCategory:(id)a3 inSubsystem:(id)a4;
@end

@implementation NLLogCategory

+ (void)initialize
{
  uint64_t v2 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v3 = (void *)categoryList;
  categoryList = v2;

  +[NLLogCategory _addCategory:@"default" inSubsystem:@"com.apple.NaturalLanguageFramework"];
}

+ (id)defaultCategory
{
  return +[NLLogCategory _getCategory:@"default"];
}

+ (id)categoryWithName:(id)a3
{
  return +[NLLogCategory categoryWithName:a3 inSubsystem:@"com.apple.NaturalLanguageFramework"];
}

+ (id)categoryWithName:(id)a3 inSubsystem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NLLogCategory _getCategory:v5];
  if (!v7)
  {
    +[NLLogCategory _addCategory:v5 inSubsystem:v6];
    v7 = +[NLLogCategory _getCategory:v5];
  }

  return v7;
}

+ (void)_addCategory:(id)a3 inSubsystem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[NLLogCategory alloc] initCategory:v6 inSubsystem:v5];

  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  [(id)categoryList setObject:v7 forKey:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
}

+ (id)_getCategory:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  v4 = [(id)categoryList objectForKey:v3];

  os_unfair_lock_unlock((os_unfair_lock_t)&lock);

  return v4;
}

- (id)initCategory:(id)a3 inSubsystem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NLLogCategory;
  v9 = [(NLLogCategory *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_loggingSubsystem, a4);
    objc_storeStrong((id *)&v10->_loggingCategory, a3);
    os_log_t v11 = os_log_create((const char *)[@"com.apple.NaturalLanguageFramework" UTF8String], (const char *)objc_msgSend(v7, "UTF8String"));
    internal = v10->_internal;
    v10->_internal = (OS_os_log *)v11;
  }
  return v10;
}

- (OS_os_log)internal
{
  return self->_internal;
}

- (NSString)loggingCategory
{
  return self->_loggingCategory;
}

- (NSString)loggingSubsystem
{
  return self->_loggingSubsystem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingSubsystem, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

@end