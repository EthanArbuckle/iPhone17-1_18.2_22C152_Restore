@interface NSCustomPredicateOperator
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (NSCustomPredicateOperator)initWithCoder:(id)a3;
- (NSCustomPredicateOperator)initWithCustomSelector:(SEL)a3 modifier:(unint64_t)a4;
- (SEL)selector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)symbol;
- (uint64_t)_validateOperator;
- (unint64_t)operatorType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSCustomPredicateOperator

- (unint64_t)operatorType
{
  return 11;
}

- (NSCustomPredicateOperator)initWithCustomSelector:(SEL)a3 modifier:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSCustomPredicateOperator;
  v5 = [(NSPredicateOperator *)&v9 initWithOperatorType:11 modifier:a4];
  v6 = v5;
  if (v5)
  {
    if (a3) {
      SEL v7 = a3;
    }
    else {
      SEL v7 = 0;
    }
    v5->_selector = v7;
  }
  -[NSCustomPredicateOperator _validateOperator]((uint64_t)v5);
  return v6;
}

- (uint64_t)_validateOperator
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    BOOL v3 = 0;
    if (*(void *)(result + 24)) {
      v2 = *(const char **)(result + 24);
    }
    else {
      v2 = 0;
    }
    result = +[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]((uint64_t)_NSPredicateUtilities, v2, 0, &v3, @"NSCustomPredicateOperator");
    if ((result & 1) == 0) {
      *(_DWORD *)(v1 + 32) |= 2u;
    }
    if (v3) {
      *(_DWORD *)(v1 + 32) |= 1u;
    }
  }
  return result;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v26 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Can't invoke the selector %@ on (nil)", NSStringFromSelector(-[NSCustomPredicateOperator selector](self, "selector", 0, a4))), 0 reason userInfo];
    objc_exception_throw(v26);
  }
  uint64_t v7 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 704);
  BOOL isClass = object_isClass(a3);
  if (isClass)
  {
    Name = class_getName((Class)a3);
    if (strncmp("_NSPredicateUtilities", Name, 0x15uLL))
    {
      self;
      uint64_t v10 = _NSOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v31 = a3;
        _os_log_fault_impl(&dword_181795000, v10, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSCustomPredicateOperator on a Class '%{public}@' is deprecated and will be removed in a future release.  NSCustomPredicateOperator should operate on instances.", buf, 0xCu);
      }
      if (v7 != 4211063755)
      {
        self;
        if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
      }
    }
  }
  if (+[_NSPredicateUtilities _predicateEnforceRestrictionsOnTarget:forComponentName:]((uint64_t)_NSPredicateUtilities, (objc_class *)a3, @"NSCustomPredicateOperator"))+[_NSPredicateUtilities _predicateSecurityAction](); {
  v11 = [(NSCustomPredicateOperator *)self selector];
  }
  v12 = v11;
  BOOL v27 = *(unsigned char *)&self->_operatorFlags & 1;
  if (v7 == 4211063755)
  {
    v13 = +[NSSelfExpression defaultInstance];
    if (!v12) {
      goto LABEL_19;
    }
  }
  else
  {
    v13 = 0;
    if (!v11) {
      goto LABEL_19;
    }
  }
  if ((*(unsigned char *)&self->_operatorFlags & 2) == 0)
  {
    if (+[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]((uint64_t)_NSPredicateUtilities, v12, (uint64_t)v13, &v27, @"NSCustomPredicateOperator"))
    {
      self;
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
        +[_NSPredicateUtilities _predicateSecurityAction]();
      }
    }
  }
LABEL_19:
  if (v27)
  {
    if (a4)
    {
      if ((*(_DWORD *)&self->_operatorFlags & 4) == 0)
      {
        if ([a4 isNSString])
        {
          if (+[_NSPredicateUtilities _predicateEnforceRestrictionsOnKeyPath:withOperand:forComponentName:]((uint64_t)_NSPredicateUtilities, a4, (uint64_t)v13, @"NSCustomPredicateOperator"))
          {
            self;
            if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
              +[_NSPredicateUtilities _predicateSecurityAction]();
            }
          }
        }
      }
    }
  }
  Class = object_getClass(a3);
  if (isClass) {
    ClassMethod = class_getClassMethod(Class, v12);
  }
  else {
    ClassMethod = class_getInstanceMethod(Class, v12);
  }
  v16 = ClassMethod;
  if (ClassMethod)
  {
    char v29 = 0;
    *(_DWORD *)dst = 0;
    method_getArgumentType(ClassMethod, 2u, dst, 4uLL);
    int v17 = strnlen(dst, 5uLL);
    if (v17 == 2)
    {
      if (dst[0] != 94 && (dst[0] != 64 || dst[1] != 63))
      {
LABEL_44:
        method_getReturnType(v16, dst, 4uLL);
        if (strnlen(dst, 5uLL) != 1
          || (unsigned int v20 = dst[0] - 66, v20 > 0x31)
          || ((1 << v20) & 0x2008200020083) == 0)
        {
          self;
          if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
          {
            self;
            v21 = _NSOSLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              if (v12) {
                v25 = NSStringFromSelector(v12);
              }
              else {
                v25 = (NSString *)@"<unknown>";
              }
              *(_DWORD *)buf = 138412546;
              id v31 = v25;
              __int16 v32 = 2080;
              v33 = dst;
              _os_log_fault_impl(&dword_181795000, v21, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSCustomPredicateOperator with selector '%@' and return type '%s' is forbidden", buf, 0x16u);
            }
            +[_NSPredicateUtilities _predicateSecurityAction]();
          }
        }
        return objc_msgSend(a3, v12, a4);
      }
    }
    else if (v17 != 1 || dst[0] != 42)
    {
      goto LABEL_44;
    }
    self;
    if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
    {
      self;
      v18 = _NSOSLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        if (v12) {
          v24 = NSStringFromSelector(v12);
        }
        else {
          v24 = (NSString *)@"<unknown>";
        }
        *(_DWORD *)buf = 138412546;
        id v31 = v24;
        __int16 v32 = 2080;
        v33 = dst;
        _os_log_fault_impl(&dword_181795000, v18, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSCustomPredicateOperator with selector '%@' and parameter encoding '%s' is forbidden", buf, 0x16u);
      }
      +[_NSPredicateUtilities _predicateSecurityAction]();
    }
    if (([a4 isNSData] & 1) != 0 || objc_msgSend(a4, "isNSString"))
    {
      self;
      v19 = _NSOSLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        if (v12) {
          v23 = NSStringFromSelector(v12);
        }
        else {
          v23 = (NSString *)@"<unknown>";
        }
        *(_DWORD *)buf = 138412546;
        id v31 = v23;
        __int16 v32 = 2080;
        v33 = dst;
        _os_log_fault_impl(&dword_181795000, v19, OS_LOG_TYPE_FAULT, "NSPredicate: Invalid argument passed to NSCustomPredicateOperator with selector '%@' and parameter encoding '%s' expecting pointer", buf, 0x16u);
      }
      +[_NSPredicateUtilities _predicateSecurityAction]();
    }
    goto LABEL_44;
  }
  return objc_msgSend(a3, v12, a4);
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v7.receiver = self;
  v7.super_class = (Class)NSCustomPredicateOperator;
  [(NSPredicateOperator *)&v7 encodeWithCoder:a3];
  if (self->_selector) {
    selector = self->_selector;
  }
  else {
    selector = 0;
  }
  [a3 encodeObject:NSStringFromSelector(selector) forKey:@"NSSelectorName"];
  self;
  if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
  {
    self;
    v6 = _NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_181795000, v6, OS_LOG_TYPE_FAULT, "NSPredicate: Archiving an NSCustomPredicateOperator is deprecated and secure coding support will be removed in a future release.", buf, 2u);
    }
  }
}

- (NSCustomPredicateOperator)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v13 = @"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers";
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)NSCustomPredicateOperator;
  v5 = [(NSPredicateOperator *)&v14 initWithCoder:a3];
  if (v5)
  {
    v6 = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSSelectorName"];
    p_selector = &v5->_selector;
    SEL v8 = NSSelectorFromString(v6);
    if (v8)
    {
      SEL *p_selector = v8;
      -[NSCustomPredicateOperator _validateOperator]((uint64_t)v5);
      goto LABEL_5;
    }
    SEL *p_selector = 0;

    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v13 = @"Attempted to decode custom predicate operator with nil selector";
LABEL_11:
    objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v13 userInfo:0]);
  }
LABEL_5:
  self;
  if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
  {
    self;
    uint64_t v9 = _NSOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_181795000, v9, OS_LOG_TYPE_FAULT, "NSPredicate: Unarchiving an NSCustomPredicateOperator is deprecated and secure coding support will be removed in a future release.", buf, 2u);
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  if (self->_selector) {
    SEL selector = self->_selector;
  }
  else {
    SEL selector = 0;
  }
  unint64_t v6 = [(NSPredicateOperator *)self modifier];

  return (id)[v4 initWithCustomSelector:selector modifier:v6];
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v5 = [(NSCustomPredicateOperator *)self operatorType];
  if (v5 != [a3 operatorType]) {
    return 0;
  }
  unint64_t v6 = [(NSPredicateOperator *)self modifier];
  if (v6 != [a3 modifier]) {
    return 0;
  }
  objc_super v7 = [(NSCustomPredicateOperator *)self selector];
  return v7 == (const char *)[a3 selector];
}

- (id)symbol
{
  v2 = [(NSCustomPredicateOperator *)self selector];

  return NSStringFromSelector(v2);
}

@end