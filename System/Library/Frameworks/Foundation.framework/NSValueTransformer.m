@interface NSValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
+ (NSArray)valueTransformerNames;
+ (NSValueTransformer)valueTransformerForName:(NSValueTransformerName)name;
+ (void)_warnAboutInscureArchiverCitingOffender:(uint64_t)a1;
+ (void)setValueTransformer:(NSValueTransformer *)transformer forName:(NSValueTransformerName)name;
- (id)_initForFoundationOnly;
- (id)reverseTransformedValue:(id)value;
- (id)transformedValue:(id)value;
@end

@implementation NSValueTransformer

+ (NSArray)valueTransformerNames
{
  os_unfair_lock_lock(&stru_1EB1ED8A4);
  v2 = (void *)qword_1EB1ED8A8;
  if (!qword_1EB1ED8A8)
  {
    v2 = objc_msgSend((id)objc_msgSend((id)_getTransformerRegistry(), "allKeys"), "copy");
    qword_1EB1ED8A8 = (uint64_t)v2;
  }
  id v3 = v2;
  os_unfair_lock_unlock(&stru_1EB1ED8A4);

  return (NSArray *)v3;
}

+ (void)setValueTransformer:(NSValueTransformer *)transformer forName:(NSValueTransformerName)name
{
  if (!name) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Name cannot be nil" userInfo:0]);
  }
  os_unfair_lock_lock(&stru_1EB1ED8A4);
  TransformerRegistry = (void *)_getTransformerRegistry();
  if (transformer) {
    [TransformerRegistry setObject:transformer forKey:name];
  }
  else {
    [TransformerRegistry removeObjectForKey:name];
  }

  qword_1EB1ED8A8 = 0;

  os_unfair_lock_unlock(&stru_1EB1ED8A4);
}

+ (NSValueTransformer)valueTransformerForName:(NSValueTransformerName)name
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (name)
  {
    if (name == (NSValueTransformerName)@"NSKeyedUnarchiveFromData"
      || name == (NSValueTransformerName)@"NSUnarchiveFromData")
    {
      +[NSValueTransformer _warnAboutInscureArchiverCitingOffender:]((uint64_t)NSValueTransformer, (uint64_t)name);
    }
    os_unfair_lock_lock(&stru_1EB1ED8A4);
    Class v7 = (Class)(id)[(id)_getTransformerRegistry() objectForKey:name];
    os_unfair_lock_unlock(&stru_1EB1ED8A4);
    if (v7) {
      return (NSValueTransformer *)v7;
    }
    Class v7 = NSClassFromString(name);
    if (dyld_program_sdk_at_least())
    {
      if (!v7) {
        return (NSValueTransformer *)v7;
      }
      if (![(objc_class *)v7 isSubclassOfClass:objc_opt_class()])
      {
        v9 = _NSOSLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v10 = 138543618;
          v11 = _NSMethodExceptionProem((objc_class *)a1, a2);
          __int16 v12 = 2114;
          NSValueTransformerName v13 = name;
          _os_log_error_impl(&dword_181795000, v9, OS_LOG_TYPE_ERROR, "%{public}@: '%{public}@' is not a subclass of NSValueTransformer.", (uint8_t *)&v10, 0x16u);
        }
        Class v7 = 0;
        return (NSValueTransformer *)v7;
      }
    }
    else if (!v7)
    {
      return (NSValueTransformer *)v7;
    }
    Class v7 = (Class)objc_alloc_init(v7);
    [a1 setValueTransformer:v7 forName:name];
    return (NSValueTransformer *)v7;
  }
  return 0;
}

- (id)_initForFoundationOnly
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSValueTransformer;
  return [(NSValueTransformer *)&v3 init];
}

+ (void)_warnAboutInscureArchiverCitingOffender:(uint64_t)a1
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  self;
  if (qword_1EB1ED8B0 != -1) {
    dispatch_once(&qword_1EB1ED8B0, &__block_literal_global_55);
  }
  if ((_MergedGlobals_128 & 1) == 0)
  {
    objc_super v3 = _NSOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      int v4 = 138543362;
      uint64_t v5 = a2;
      _os_log_fault_impl(&dword_181795000, v3, OS_LOG_TYPE_FAULT, "'%{public}@' should not be used to for un-archiving and will be removed in a future release", (uint8_t *)&v4, 0xCu);
    }
  }
}

+ (Class)transformedValueClass
{
  return 0;
}

const char *__62__NSValueTransformer__warnAboutInscureArchiverCitingOffender___block_invoke()
{
  result = getenv("NSValueTransformerDisableDeprecationWarnings");
  if (result)
  {
    result = (const char *)strncmp(result, "YES", 3uLL);
    if (!result) {
      _MergedGlobals_128 = 1;
    }
  }
  return result;
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)value
{
  return value;
}

- (id)reverseTransformedValue:(id)value
{
  if (([(id)objc_opt_class() allowsReverseTransformation] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Transformer does not support reverse transformations" userInfo:0]);
  }

  return [(NSValueTransformer *)self transformedValue:value];
}

@end