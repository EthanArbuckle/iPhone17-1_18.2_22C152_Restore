@interface NSSecureUnarchiveFromDataTransformer
+ (NSArray)allowedTopLevelClasses;
- (id)description;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation NSSecureUnarchiveFromDataTransformer

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E4F1CA00];
      v11 = (__CFString *)*MEMORY[0x1E4F1C3C8];
      v12 = @"Cannot unarchive type from non-NSData object.";
      uint64_t v9 = 0;
LABEL_10:
      objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v12 userInfo:v9]);
    }
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithArray:", objc_msgSend((id)objc_opt_class(), "allowedTopLevelClasses"));
    id v13 = 0;
    id v3 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v4 fromData:v3 error:&v13];

    if (v3) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v13 == 0;
    }
    if (!v5)
    {
      v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = [v13 localizedDescription];
      v14 = @"NSUnderlyingError";
      v15[0] = v13;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v10 = v7;
      v11 = @"NSInvalidUnarchiveOperationException";
      v12 = (__CFString *)v8;
      goto LABEL_10;
    }
  }
  return v3;
}

+ (NSArray)allowedTopLevelClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() transformedValueClass];
  if (v2)
  {
    v4[0] = v2;
    return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    if (qword_1EB1ED8C0 != -1) {
      dispatch_once(&qword_1EB1ED8C0, &__block_literal_global_96);
    }
    return (NSArray *)qword_1EB1ED8B8;
  }
}

uint64_t __62__NSSecureUnarchiveFromDataTransformer_allowedTopLevelClasses__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t result = objc_msgSend(v0, "initWithObjects:", MEMORY[0x1E4F1C978], MEMORY[0x1E4F1C9E8], MEMORY[0x1E4F1CAD0], NSString, NSNumber, MEMORY[0x1E4F1C9C8], MEMORY[0x1E4F1C9B8], objc_opt_class(), NSUUID, MEMORY[0x1E4F1CA98], 0);
  qword_1EB1ED8B8 = result;
  return result;
}

- (id)reverseTransformedValue:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v4 = (void *)[(id)objc_opt_class() allowedTopLevelClasses];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v22;
LABEL_4:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v22 != v7) {
      objc_enumerationMutation(v4);
    }
    if (objc_opt_isKindOfClass()) {
      break;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v20 count:16];
      if (!v6)
      {
LABEL_10:
        uint64_t v9 = +[NSString stringWithFormat:@"Object of class %@ is not among allowed top level class list %@", objc_opt_class(), v4];
        v10 = (void *)MEMORY[0x1E4F1CA00];
        v11 = (__CFString *)*MEMORY[0x1E4F1C3C8];
        uint64_t v12 = 0;
        goto LABEL_16;
      }
      goto LABEL_4;
    }
  }
  id v17 = 0;
  id result = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v17];
  if (result) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v17 == 0;
  }
  if (!v14)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = [v17 localizedDescription];
    v18 = @"NSUnderlyingError";
    id v19 = v17;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v10 = v15;
    v11 = @"NSInvalidArchiveOperationException";
    uint64_t v9 = (NSString *)v16;
LABEL_16:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v9 userInfo:v12]);
  }
  return result;
}

- (id)description
{
  return @"<shared NSSecureUnarchiveFromData transformer>";
}

@end