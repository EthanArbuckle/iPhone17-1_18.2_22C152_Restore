@interface NSUTIPredicateOperator
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForVariant:(unint64_t)a3;
- (id)predicateFormat;
- (unint64_t)variant;
@end

@implementation NSUTIPredicateOperator

- (id)initForVariant:(unint64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3 >= 2)
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    v8 = @"parameter";
    v9[0] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, @"Unsupported variant", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)));
  }
  if (a3) {
    uint64_t v3 = 1101;
  }
  else {
    uint64_t v3 = 1100;
  }
  v7.receiver = self;
  v7.super_class = (Class)NSUTIPredicateOperator;
  return [(NSPredicateOperator *)&v7 initWithOperatorType:v3 modifier:0];
}

- (unint64_t)variant
{
  return [(NSPredicateOperator *)self operatorType] != 1100;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t v5 = [(NSUTIPredicateOperator *)self variant];

  return (id)[v4 initForVariant:v5];
}

- (id)predicateFormat
{
  if ([(NSPredicateOperator *)self operatorType] == 1100) {
    return @"UTI-EQUALS";
  }
  else {
    return @"UTI-CONFORMS-TO";
  }
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  BOOL result = 0;
  v18[2] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    if _NSIsNSString() && (_NSIsNSString())
    {
      if (qword_1EB1ED218 != -1) {
        dispatch_once(&qword_1EB1ED218, &__block_literal_global_16);
      }
      if ([(NSPredicateOperator *)self operatorType] == 1100)
      {
        v8 = (unsigned int (*)(id, id))_MergedGlobals_97;
        if (!_MergedGlobals_97)
        {
          v9 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v10 = *MEMORY[0x1E4F1C3B8];
          v15[0] = @"lhs";
          v15[1] = @"rhs";
          v16[0] = a3;
          v16[1] = a4;
          uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
          v12 = @"Unable to load UTTypeEqual";
          goto LABEL_15;
        }
        return v8(a3, a4) != 0;
      }
      v8 = (unsigned int (*)(id, id))qword_1EB1ED210;
      if (qword_1EB1ED210) {
        return v8(a3, a4) != 0;
      }
      v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      v13[0] = @"lhs";
      v13[1] = @"rhs";
      v14[0] = a3;
      v14[1] = a4;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
      v12 = @"Unable to load UTTypeConformsTo";
    }
    else
    {
      v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3C8];
      v17[0] = @"lhs";
      v17[1] = @"rhs";
      v18[0] = a3;
      v18[1] = a4;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
      v12 = @"Unsupported variant";
    }
LABEL_15:
    objc_exception_throw((id)[v9 exceptionWithName:v10 reason:v12 userInfo:v11]);
  }
  return result;
}

void __73__NSUTIPredicateOperator_performPrimitiveOperationUsingObject_andObject___block_invoke()
{
  v0 = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 256);
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_97 = dlsym(v0, "UTTypeEqual");
    v2 = dlsym(v1, "UTTypeConformsTo");
    qword_1EB1ED210 = (uint64_t)v2;
  }
  else
  {
    v2 = (void *)qword_1EB1ED210;
  }
  if (_MergedGlobals_97) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    NSLog((NSString *)@"NSUTIPredicateOperator couldn't load a MobileCoreServices symbol.");
  }
}

@end