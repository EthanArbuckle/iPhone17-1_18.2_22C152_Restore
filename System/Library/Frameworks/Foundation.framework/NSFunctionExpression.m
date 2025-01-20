@interface NSFunctionExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowsEvaluation;
- (BOOL)_shouldUseParensWithDescription;
- (BOOL)isEqual:(id)a3;
- (NSFunctionExpression)initWithCoder:(id)a3;
- (NSFunctionExpression)initWithExpressionType:(unint64_t)a3 operand:(id)a4 selector:(SEL)a5 argumentArray:(id)a6;
- (NSFunctionExpression)initWithSelector:(SEL)a3 argumentArray:(id)a4;
- (NSFunctionExpression)initWithTarget:(id)a3 selectorName:(id)a4 arguments:(id)a5;
- (SEL)selector;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)arguments;
- (id)binaryOperatorForSelector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)function;
- (id)operand;
- (id)predicateFormat;
- (uint64_t)_validateExpression;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFunctionExpression

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if ((a4 & 4) != 0) {
      [a3 visitPredicateExpression:self];
    }
    objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "acceptVisitor:flags:", a3, a4);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = [(NSFunctionExpression *)self arguments];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) acceptVisitor:a3 flags:a4];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v12 count:16];
      }
      while (v9);
    }
    if ((a4 & 4) == 0) {
      [a3 visitPredicateExpression:self];
    }
  }
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  if (![(NSFunctionExpression *)self _allowsEvaluation]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This expression has evaluation disabled" userInfo:0]);
  }
  *(void *)&v89[1] = 0;
  id v7 = (void *)MEMORY[0x185308110]();
  id v8 = [(NSFunctionExpression *)self arguments];
  unint64_t v87 = [v8 count];
  uint64_t v9 = [(NSFunctionExpression *)self selector];
  _expressionFlags expressionFlags = self->super._expressionFlags;
  *(void *)v89 = (*(unsigned char *)&expressionFlags & 2) != 0;
  v84 = v9;
  if (v9
    && (*(unsigned char *)&expressionFlags & 4) == 0
    && +[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]((uint64_t)_NSPredicateUtilities, v84, (uint64_t)[(NSFunctionExpression *)self operand], v89, @"NSFunctionExpression"))
  {
    +[_NSPredicateUtilities _predicateSecurityAction]();
  }
  v11 = objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "expressionValueWithObject:context:", a3, a4);
  *(void *)&long long v85 = v11;
  if (!v11)
  {
    return 0;
  }
  id v12 = v11;
  BOOL isClass = object_isClass((id)v85);
  if (isClass)
  {
    Name = class_getName((Class)v85);
    if (strncmp("_NSPredicateUtilities", Name, 0x15uLL))
    {
      self;
      long long v15 = _NSOSLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        int v91 = 138543362;
        v92 = (NSString *)v85;
        _os_log_fault_impl(&dword_181795000, v15, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSFunctionExpression on a Class '%{public}@' is deprecated and will be removed in a future release.  NSFunctionExpression should operate on instances.", (uint8_t *)&v91, 0xCu);
      }
      self;
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
      {
        [(NSFunctionExpression *)self operand];
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
      }
    }
  }
  if (+[_NSPredicateUtilities _predicateEnforceRestrictionsOnTarget:forComponentName:]((uint64_t)_NSPredicateUtilities, (objc_class *)v85, @"NSFunctionExpression"))+[_NSPredicateUtilities _predicateSecurityAction](); {
  if (v87 >> 60)
  }
  {
    CFStringRef v75 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v87);
    v76 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v75 userInfo:0];
    CFRelease(v75);
    objc_exception_throw(v76);
  }
  v80[1] = v80;
  if (v87 <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v87;
  }
  MEMORY[0x1F4188790](v16);
  v18 = (char *)v80 - v17;
  uint64_t v88 = 0;
  if (v19 >= 0x101)
  {
    v18 = (char *)_CFCreateArrayStorage();
    v83 = v18;
  }
  else
  {
    v83 = 0;
  }
  LODWORD(v81) = isClass;
  v86 = v18;
  v82 = v7;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  uint64_t v21 = [v8 countByEnumeratingWithState:&v96 objects:v95 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v97;
    v23 = v86;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v97 != v22) {
          objc_enumerationMutation(v8);
        }
        v25 = (void *)[*(id *)(*((void *)&v96 + 1) + 8 * i) expressionValueWithObject:a3 context:a4];
        id v26 = v25;
        *v23++ = v25;
      }
      uint64_t v21 = [v8 countByEnumeratingWithState:&v96 objects:v95 count:16];
    }
    while (v21);
  }
  if (v89[0]
    && v87
    && (*(unsigned char *)&self->super._expressionFlags & 8) == 0
    && +[_NSPredicateUtilities _predicateEnforceRestrictionsOnKeyPath:withOperand:forComponentName:]((uint64_t)_NSPredicateUtilities, (void *)*v86, (uint64_t)[(NSFunctionExpression *)self operand], @"NSFunctionExpression"))
  {
    +[_NSPredicateUtilities _predicateSecurityAction]();
  }
  v27 = (void *)v85;
  Class = object_getClass((id)v85);
  v29 = v82;
  v30 = v84;
  v31 = Class;
  if (v81) {
    ClassMethod = class_getClassMethod(Class, v84);
  }
  else {
    ClassMethod = class_getInstanceMethod(Class, v84);
  }
  v33 = ClassMethod;
  unint64_t v34 = v87;
  if (ClassMethod)
  {
    if (v34 + 2 != method_getNumberOfArguments(ClassMethod))
    {
      self;
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
      {
        self;
        v36 = _NSOSLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v91) = 0;
          _os_log_fault_impl(&dword_181795000, v36, OS_LOG_TYPE_FAULT, "NSPredicate: NSFunctionExpression incorrect number of arguments passed to method", (uint8_t *)&v91, 2u);
        }
        +[_NSPredicateUtilities _predicateSecurityAction]();
      }
    }
    if (v34)
    {
      uint64_t v37 = 0;
      *(void *)&long long v35 = 138412546;
      long long v81 = v35;
      unsigned int v38 = 1;
      while (1)
      {
        BYTE4(v90) = 0;
        LODWORD(v90) = 0;
        method_getArgumentType(v33, v38 + 1, (char *)&v90, 4uLL);
        BOOL v39 = ((char)v90 - 78) > 0x24 || ((1 << (v90 - 78)) & 0x1300000113) == 0;
        int v40 = v39 ? v90 : BYTE1(v90);
        if (v40 == 35) {
          break;
        }
        if (v40 != 64)
        {
          self;
          v41 = _NSOSLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          {
            v45 = (NSString *)@"<unknown>";
            if (v84) {
              v45 = NSStringFromSelector(v84);
            }
            int v91 = v81;
            v92 = v45;
            __int16 v93 = 2080;
            v94 = &v90;
            _os_log_fault_impl(&dword_181795000, v41, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSFunctionExpression with selector '%@' and parameter encoding '%s' is forbidden", (uint8_t *)&v91, 0x16u);
          }
LABEL_59:
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
LABEL_60:
        uint64_t v37 = v38;
        if (v87 <= v38++) {
          goto LABEL_69;
        }
      }
      v42 = (void *)v86[v37];
      if (([v42 isNSData] & 1) == 0 && !objc_msgSend(v42, "isNSString")) {
        goto LABEL_60;
      }
      self;
      v43 = _NSOSLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
        v46 = (NSString *)@"<unknown>";
        if (v84) {
          v46 = NSStringFromSelector(v84);
        }
        int v91 = v81;
        v92 = v46;
        __int16 v93 = 2080;
        v94 = &v90;
        _os_log_fault_impl(&dword_181795000, v43, OS_LOG_TYPE_FAULT, "NSPredicate: Invalid argument passed to NSFunctionExpression with selector '%@' and parameter encoding '%s' expecting pointer", (uint8_t *)&v91, 0x16u);
      }
      goto LABEL_59;
    }
LABEL_69:
    BYTE4(v90) = 0;
    LODWORD(v90) = 0;
    method_getReturnType(v33, (char *)&v90, 4uLL);
    v30 = v84;
    v27 = (void *)v85;
    unint64_t v47 = v87;
    int v48 = v90;
    unsigned int v49 = (char)v90 - 78;
    if (v49 <= 0x24 && ((1 << v49) & 0x1300000113) != 0) {
      int v48 = BYTE1(v90);
    }
    if (v48 == 35 || v48 == 64) {
      goto LABEL_83;
    }
    self;
    v50 = _NSOSLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
    {
      if (v30) {
        v73 = NSStringFromSelector(v30);
      }
      else {
        v73 = (NSString *)@"<unknown>";
      }
      int v91 = 138412546;
      v92 = v73;
      __int16 v93 = 2080;
      v94 = &v90;
      _os_log_fault_impl(&dword_181795000, v50, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSFunctionExpression with selector '%@' and return type '%s' is forbidden", (uint8_t *)&v91, 0x16u);
    }
    goto LABEL_82;
  }
  self;
  char Flags = _CFPredicatePolicyData_getFlags();
  unint64_t v47 = v87;
  if ((Flags & 8) != 0)
  {
    if (v31)
    {
      v52 = class_getName(v31);
      if (strcmp(v52, "OCPartialMockObject"))
      {
        if (strcmp(v52, "OCMockObject"))
        {
          self;
          v53 = _NSOSLog();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v91) = 0;
            _os_log_fault_impl(&dword_181795000, v53, OS_LOG_TYPE_FAULT, "NSPredicate: NSFunctionExpression unable to find method", (uint8_t *)&v91, 2u);
          }
LABEL_82:
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
      }
    }
  }
LABEL_83:
  switch(v47)
  {
    case 0uLL:
      id v54 = [v27 v30];
      goto LABEL_125;
    case 1uLL:
      id v54 = objc_msgSend(v27, v30, *v86);
      goto LABEL_125;
    case 2uLL:
      id v54 = objc_msgSend(v27, v30, *v86, v86[1]);
      goto LABEL_125;
    case 3uLL:
      id v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2]);
      goto LABEL_125;
    case 4uLL:
      id v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2], v86[3]);
      goto LABEL_125;
    case 5uLL:
      id v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2], v86[3], v86[4]);
      goto LABEL_125;
    case 6uLL:
      id v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2], v86[3], v86[4], v86[5]);
      goto LABEL_125;
    case 7uLL:
      id v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2], v86[3], v86[4], v86[5], v86[6]);
      goto LABEL_125;
    case 8uLL:
      id v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2], v86[3], v86[4], v86[5], v86[6], v86[7]);
      goto LABEL_125;
    case 9uLL:
      id v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2], v86[3], v86[4], v86[5], v86[6], v86[7], v86[8]);
LABEL_125:
      *(void *)&v89[1] = v54;
      if (v54) {
        goto LABEL_126;
      }
      goto LABEL_135;
    default:
      self;
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
      {
        self;
        v55 = _NSOSLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v91) = 0;
          _os_log_fault_impl(&dword_181795000, v55, OS_LOG_TYPE_FAULT, "NSPredicate: NSFunctionExpression no longer allows arbitrarily long parameter lists", (uint8_t *)&v91, 2u);
        }
        +[_NSPredicateUtilities _predicateSecurityAction]();
      }
      v56 = (void *)[v27 methodSignatureForSelector:v30];
      if (!v56)
      {
        v77 = (void *)MEMORY[0x1E4F1CA00];
        if (v30) {
          v78 = NSStringFromSelector(v84);
        }
        else {
          v78 = (NSString *)@"<unknown>";
        }
        v79 = +[NSString stringWithFormat:@"NSPredicateFunctionMissingSignature: can't find selector (%@) on %@", v78, (void)v85];
        objc_exception_throw((id)[v77 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v79 userInfo:0]);
      }
      v57 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v56];
      v58 = v57;
      if (!v57) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSPredicateFunctionBadInvocation: can't make invocation" userInfo:0]);
      }
      [v57 setSelector:v30];
      [v58 setTarget:v27];
      uint64_t v59 = [v56 numberOfArguments];
      if (v59 != v87)
      {
        self;
        if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
        {
          self;
          v61 = _NSOSLog();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
          {
            if (v30) {
              v74 = NSStringFromSelector(v30);
            }
            else {
              v74 = (NSString *)@"<unknown>";
            }
            int v91 = 138412290;
            v92 = v74;
            _os_log_fault_impl(&dword_181795000, v61, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSFunctionExpression with selector '%@' passed the incorrect number of arguments", (uint8_t *)&v91, 0xCu);
          }
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
      }
      uint64_t v62 = 0;
      *(void *)&long long v60 = 138412546;
      long long v85 = v60;
      do
      {
        id v90 = 0;
        id v90 = (id)v86[v62];
        v63 = (const char *)[v56 getArgumentTypeAtIndex:v62 + 2];
        v64 = (id *)v63;
        if (v63)
        {
          if (strlen(v63) >= 2)
          {
            int v65 = *(unsigned __int8 *)v64;
            if (v65 == 94 || v65 == 64 && *((unsigned char *)v64 + 1) == 63)
            {
              self;
              if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
              {
                self;
                v66 = _NSOSLog();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
                {
                  v69 = (NSString *)@"<unknown>";
                  if (v84) {
                    v69 = NSStringFromSelector(v84);
                  }
                  int v91 = v85;
                  v92 = v69;
                  __int16 v93 = 2080;
                  v94 = v64;
                  _os_log_fault_impl(&dword_181795000, v66, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSFunctionExpression with selector '%@' and parameter encoding '%s' is forbidden", (uint8_t *)&v91, 0x16u);
                }
                +[_NSPredicateUtilities _predicateSecurityAction]();
              }
              if (([v90 isNSData] & 1) != 0 || objc_msgSend(v90, "isNSString"))
              {
                self;
                v67 = _NSOSLog();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
                {
                  v68 = (NSString *)@"<unknown>";
                  if (v84) {
                    v68 = NSStringFromSelector(v84);
                  }
                  int v91 = v85;
                  v92 = v68;
                  __int16 v93 = 2080;
                  v94 = v64;
                  _os_log_fault_impl(&dword_181795000, v67, OS_LOG_TYPE_FAULT, "NSPredicate: Invalid argument passed to NSFunctionExpression with selector '%@' and parameter encoding '%s' expecting pointer", (uint8_t *)&v91, 0x16u);
                }
                +[_NSPredicateUtilities _predicateSecurityAction]();
              }
            }
          }
        }
        [v58 setArgument:&v90 atIndex:v62 + 2];
        ++v62;
      }
      while (v87 != v62);
      [v58 invoke];
      if ([v56 methodReturnLength]) {
        [v58 getReturnValue:&v89[1]];
      }
      if (!*(void *)&v89[1]) {
        goto LABEL_135;
      }
LABEL_126:
      self;
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0 && !object_isClass(*(id *)&v89[1]))
      {
        Class v70 = object_getClass(*(id *)&v89[1]);
        if (!object_isClass(v70))
        {
          self;
          v71 = _NSOSLog();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v91) = 0;
            _os_log_fault_impl(&dword_181795000, v71, OS_LOG_TYPE_FAULT, "NSPredicate: NSFunctionExpression must return an object", (uint8_t *)&v91, 2u);
          }
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
      }
LABEL_135:
      id v72 = *(id *)&v89[1];
      free(v83);
      id result = *(id *)&v89[1];
      break;
  }
  return result;
}

- (id)operand
{
  return self->_operand;
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

- (id)arguments
{
  return self->_arguments;
}

- (BOOL)_allowsEvaluation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSFunctionExpression;
  return [(NSExpression *)&v3 _allowsEvaluation];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  NSUInteger v3 = [NSStringFromSelector([(NSFunctionExpression *)self selector]) hash];
  uint64_t v4 = objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "hash");
  return v4 ^ objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "hash") ^ v3;
}

- (BOOL)_shouldUseParensWithDescription
{
  unsigned int v2 = objc_msgSend(-[NSFunctionExpression binaryOperatorForSelector](self, "binaryOperatorForSelector"), "characterAtIndex:", 0) << 24;
  if (v2) {
    BOOL v3 = v2 == 1526726656;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (id)predicateFormat
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSFunctionExpression *)self binaryOperatorForSelector];
  uint64_t v4 = [(NSFunctionExpression *)self selector];
  if (v3)
  {
    v5 = objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 0);
    v6 = objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 1);
    int v7 = [v5 _shouldUseParensWithDescription];
    int v8 = [v6 _shouldUseParensWithDescription];
    BOOL v9 = v7 == 0;
    if (v7) {
      uint64_t v10 = CFSTR("(");
    }
    else {
      uint64_t v10 = &stru_1ECA5C228;
    }
    if (v9) {
      v11 = &stru_1ECA5C228;
    }
    else {
      v11 = @"");
    }
    if (v8) {
      id v12 = CFSTR("(");
    }
    else {
      id v12 = &stru_1ECA5C228;
    }
    if (v8) {
      long long v13 = @"");
    }
    else {
      long long v13 = &stru_1ECA5C228;
    }
    unsigned int v14 = [v3 characterAtIndex:0] << 24;
    if (v14 == 1526726656)
    {
      return +[NSString stringWithFormat:@"%@%@%@[%@]", v10, v5, v11, v6, v49, v50, v51];
    }
    else if (v14 == 1694498816)
    {
      return +[NSString stringWithFormat:@"%@%@%@ ** %@%@%@", v10, v5, v11, v12, v6, v13, v51];
    }
    else
    {
      return +[NSString stringWithFormat:@"%@%@%@ %@ %@%@%@", v10, v5, v11, v3, v12, v6, v13];
    }
  }
  else
  {
    uint64_t v16 = v4;
    if (v4 == sel_onesComplement_)
    {
      v27 = objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 0);
      int v28 = [v27 _shouldUseParensWithDescription];
      v29 = &stru_1ECA5C228;
      v30 = CFSTR("(");
      if (v28) {
        v29 = @"");
      }
      else {
        v30 = &stru_1ECA5C228;
      }
      return +[NSString stringWithFormat:@"%@~%@%@", v30, v27, v29, v48, v49, v50, v51];
    }
    else
    {
      id v17 = [(NSFunctionExpression *)self operand];
      if (!v17
        || (v18 = v17, (objc_opt_isKindOfClass() & 1) != 0)
        && _NSPredicateUtilities == (__objc2_class *)[v18 constantValue])
      {
        if (v16 == sel_castObject_toType_)
        {
          id v26 = +[NSString stringWithString:](NSMutableString, "stringWithString:", @"CAST(");
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          id v40 = [(NSFunctionExpression *)self arguments];
          uint64_t v41 = [v40 countByEnumeratingWithState:&v58 objects:v57 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = 0;
            uint64_t v44 = *(void *)v59;
            do
            {
              for (uint64_t i = 0; i != v42; ++i)
              {
                if (*(void *)v59 != v44) {
                  objc_enumerationMutation(v40);
                }
                v46 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                if (-v43 != i) {
                  [(NSMutableString *)v26 appendString:@", "];
                }
                -[NSMutableString appendString:](v26, "appendString:", [v46 predicateFormat]);
              }
              v43 += v42;
              uint64_t v42 = [v40 countByEnumeratingWithState:&v58 objects:v57 count:16];
            }
            while (v42);
          }
        }
        else
        {
          v31 = NSStringFromSelector(v16);
          if (+[_NSPredicateUtilities _isReservedWordInParser:v31])
          {
            v32 = @"#";
          }
          else
          {
            v32 = &stru_1ECA5C228;
          }
          id v26 = +[NSString stringWithString:v32];
          [(NSMutableString *)v26 appendString:v31];
          -[NSMutableString appendString:](v26, "appendString:", @"(");
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v33 = [(NSFunctionExpression *)self arguments];
          uint64_t v34 = [v33 countByEnumeratingWithState:&v63 objects:v62 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = 0;
            uint64_t v37 = *(void *)v64;
            do
            {
              for (uint64_t j = 0; j != v35; ++j)
              {
                if (*(void *)v64 != v37) {
                  objc_enumerationMutation(v33);
                }
                BOOL v39 = *(void **)(*((void *)&v63 + 1) + 8 * j);
                if (-v36 != j) {
                  [(NSMutableString *)v26 appendString:@", "];
                }
                -[NSMutableString appendString:](v26, "appendString:", [v39 predicateFormat]);
              }
              v36 += v35;
              uint64_t v35 = [v33 countByEnumeratingWithState:&v63 objects:v62 count:16];
            }
            while (v35);
          }
        }
        [(NSMutableString *)v26 appendString:@""]);
      }
      else
      {
        if (!objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "count")) {
          return +[NSString stringWithFormat:@"FUNCTION(%@, \"%@\")", v18, NSStringFromSelector(v16), v47, v48, v49, v50, v51];
        }
        unint64_t v19 = +[NSString string];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v20 = [(NSFunctionExpression *)self arguments];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v52 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v54;
          do
          {
            for (uint64_t k = 0; k != v22; ++k)
            {
              if (*(void *)v54 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v53 + 1) + 8 * k);
              [(NSString *)v19 appendString:@", "];
              -[NSString appendString:](v19, "appendString:", [v25 predicateFormat]);
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v53 objects:v52 count:16];
          }
          while (v22);
        }
        return +[NSString stringWithFormat:@"FUNCTION(%@, \"%@\" %@)", v18, NSStringFromSelector(v16), v19];
      }
      return v26;
    }
  }
}

- (id)binaryOperatorForSelector
{
  unsigned int v2 = [(NSFunctionExpression *)self selector];
  if (v2 == sel_add_to_) {
    return @"+";
  }
  if (v2 == sel_from_subtract_) {
    return @"-";
  }
  if (v2 == sel_multiply_by_) {
    return @"*";
  }
  if (v2 == sel_divide_by_) {
    return @"/";
  }
  if (v2 == sel_raise_toPower_) {
    return @"e";
  }
  if (v2 == sel_objectFrom_withIndex_) {
    return @"[";
  }
  if (v2 == sel_bitwiseAnd_with_) {
    return @"&";
  }
  if (v2 == sel_bitwiseOr_with_) {
    return @"|";
  }
  if (v2 == sel_bitwiseXor_with_) {
    return @"^";
  }
  if (v2 == sel_leftshift_by_) {
    return @"<<";
  }
  if (v2 == sel_rightshift_by_) {
    return @">>";
  }
  return 0;
}

- (NSFunctionExpression)initWithSelector:(SEL)a3 argumentArray:(id)a4
{
  int v7 = [[NSConstantValueExpression alloc] initWithObject:_NSPredicateUtilities];
  int v8 = [(NSFunctionExpression *)self initWithExpressionType:4 operand:v7 selector:a3 argumentArray:a4];

  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFunctionExpression;
  [(NSFunctionExpression *)&v3 dealloc];
}

- (NSFunctionExpression)initWithExpressionType:(unint64_t)a3 operand:(id)a4 selector:(SEL)a5 argumentArray:(id)a6
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)NSFunctionExpression;
  BOOL v9 = [(NSExpression *)&v12 initWithExpressionType:a3];
  v9->_operand = (NSExpression *)a4;
  if (a5) {
    SEL v10 = a5;
  }
  else {
    SEL v10 = 0;
  }
  v9->_selector = v10;
  v9->_arguments = (NSArray *)a6;
  -[NSFunctionExpression _validateExpression]((uint64_t)v9);
  return v9;
}

- (uint64_t)_validateExpression
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    BOOL v8 = 0;
    if (*(void *)(result + 32)) {
      unsigned int v2 = *(const char **)(result + 32);
    }
    else {
      unsigned int v2 = 0;
    }
    id result = +[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]((uint64_t)_NSPredicateUtilities, v2, *(void *)(result + 24), &v8, @"NSFunctionExpression");
    if ((result & 1) == 0) {
      *(_DWORD *)(v1 + 8) |= 4u;
    }
    if (v8)
    {
      *(_DWORD *)(v1 + 8) |= 2u;
      id result = [*(id *)(v1 + 40) firstObject];
      if (result)
      {
        objc_super v3 = (void *)result;
        if ([(id)result expressionType])
        {
          id result = [v3 expressionType];
          if (result != 3) {
            return result;
          }
          id result = [v3 keyPath];
          uint64_t v4 = (void *)result;
        }
        else
        {
          uint64_t v4 = (void *)[v3 constantValue];
          id result = [v4 isNSString];
          if ((result & 1) == 0) {
            return result;
          }
        }
        if (v4)
        {
          id result = +[_NSPredicateUtilities _predicateEnforceRestrictionsOnKeyPath:withOperand:forComponentName:]((uint64_t)_NSPredicateUtilities, v4, *(void *)(v1 + 24), @"NSFunctionExpression");
          int v5 = *(_DWORD *)(v1 + 8);
          int v6 = v5 | 8;
          unsigned int v7 = v5 & 0xFFFFFFF3;
          if (!result) {
            unsigned int v7 = v6;
          }
          *(_DWORD *)(v1 + 8) = v7;
        }
      }
    }
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSFunctionExpression;
  [(NSExpression *)&v5 encodeWithCoder:a3];
  objc_msgSend(a3, "encodeObject:forKey:", NSStringFromSelector(-[NSFunctionExpression selector](self, "selector")), @"NSSelectorName");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFunctionExpression operand](self, "operand"), @"NSOperand");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFunctionExpression arguments](self, "arguments"), @"NSArguments");
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  }
  uint64_t v5 = objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "_expressionWithSubstitutionVariables:", a3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [(NSFunctionExpression *)self arguments];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11++), "_expressionWithSubstitutionVariables:", a3));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v9);
  }
  id v12 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithExpressionType:operand:selector:argumentArray:", -[NSFunctionExpression expressionType](self, "expressionType"), v5, -[NSFunctionExpression selector](self, "selector"), v6);

  return v12;
}

- (unint64_t)expressionType
{
  return 4;
}

- (void)allowEvaluation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSExpression *)self->_operand allowEvaluation];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  arguments = self->_arguments;
  uint64_t v4 = [(NSArray *)arguments countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(arguments);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) allowEvaluation];
      }
      uint64_t v5 = [(NSArray *)arguments countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v5);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSFunctionExpression;
  [(NSExpression *)&v8 allowEvaluation];
}

- (NSFunctionExpression)initWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    uint64_t v22 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v23 = *MEMORY[0x1E4F1C3C8];
    v24 = @"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers";
    goto LABEL_44;
  }
  v26.receiver = self;
  v26.super_class = (Class)NSFunctionExpression;
  uint64_t v5 = [(NSExpression *)&v26 initWithCoder:a3];
  if (!v5) {
    return v5;
  }
  uint64_t v6 = (void *)[a3 allowedClasses];
  uint64_t v25 = [v6 count];
  if (v25)
  {
    id v7 = (id)[v6 mutableCopy];
    objc_msgSend(v7, "unionSet:", +[_NSPredicateUtilities _expressionClassesForSecureCoding](_NSPredicateUtilities, "_expressionClassesForSecureCoding"));
    id v8 = (id)[v6 mutableCopy];
    objc_msgSend(v8, "unionSet:", +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding](_NSPredicateUtilities, "_extendedExpressionClassesForSecureCoding"));
  }
  else
  {
    id v7 = +[_NSPredicateUtilities _expressionClassesForSecureCoding];
    id v8 = +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding];
  }
  uint64_t v9 = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSSelectorName"];
  p_selector = (char **)&v5->_selector;
  SEL v11 = NSSelectorFromString(v9);
  if (v11) {
    SEL v12 = v11;
  }
  else {
    SEL v12 = 0;
  }
  *p_selector = (char *)v12;
  v5->_operand = (NSExpression *)(id)[a3 decodeObjectOfClasses:v7 forKey:@"NSOperand"];
  v5->_arguments = (NSArray *)(id)[a3 decodeObjectOfClasses:v8 forKey:@"NSArguments"];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v13 = @"Malformed function expression (bad operator)";
    goto LABEL_18;
  }
  if (v5->_arguments && (_NSIsNSSet() & 1) == 0 && (_NSIsNSArray() & 1) == 0 && !_NSIsNSOrderedSet())
  {
    long long v13 = @"Malformed function expression (bad arguments)";
LABEL_18:
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v13 userInfo:0];
    if (v14) {
      goto LABEL_30;
    }
    goto LABEL_19;
  }
  if (!*p_selector)
  {
    long long v13 = @"Malformed function expression (bad selector)";
    goto LABEL_18;
  }
LABEL_19:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  arguments = v5->_arguments;
  uint64_t v16 = [(NSArray *)arguments countByEnumeratingWithState:&v28 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(arguments);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:@"Malformed function expression (bad argument)" userInfo:0];
          goto LABEL_30;
        }
      }
      uint64_t v17 = [(NSArray *)arguments countByEnumeratingWithState:&v28 objects:v27 count:16];
      uint64_t v14 = 0;
      if (v17) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_30:
  -[NSFunctionExpression _validateExpression]((uint64_t)v5);
  if (objc_opt_isKindOfClass())
  {
    id v20 = *p_selector;
    if (*p_selector)
    {
      if (sel_valueForKeyPath_ == v20) {
        goto LABEL_38;
      }
      goto LABEL_36;
    }
    if (sel_valueForKeyPath_)
    {
      id v20 = 0;
LABEL_36:
      if (v20 == sel_valueForKey_) {
        goto LABEL_38;
      }
      self;
      if ((_CFPredicatePolicyData_getFlags() & 8) == 0) {
        goto LABEL_38;
      }
      uint64_t v22 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v23 = *MEMORY[0x1E4F1C3C8];
      v24 = @"NSKeyPathExpression is malformed";
LABEL_44:
      objc_exception_throw((id)[v22 exceptionWithName:v23 reason:v24 userInfo:0]);
    }
  }
LABEL_38:
  if (v25)
  {
  }
  if (v14)
  {

    objc_exception_throw(v14);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[(NSExpression *)self->_operand copy];
  id v5 = [(NSFunctionExpression *)self arguments];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_arguments, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        SEL v11 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * v10) copy];
        [v6 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v8);
  }
  SEL v12 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithExpressionType:operand:selector:argumentArray:", -[NSFunctionExpression expressionType](self, "expressionType"), v4, -[NSFunctionExpression selector](self, "selector"), v6);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(NSFunctionExpression *)self selector];
  if (v5 != (const char *)[a3 selector]
    || !objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "isEqual:", objc_msgSend(a3, "operand")))
  {
    return 0;
  }
  id v6 = [(NSFunctionExpression *)self arguments];
  uint64_t v7 = [a3 arguments];

  return [v6 isEqual:v7];
}

- (id)function
{
  unsigned int v2 = [(NSFunctionExpression *)self selector];

  return NSStringFromSelector(v2);
}

- (NSFunctionExpression)initWithTarget:(id)a3 selectorName:(id)a4 arguments:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  SEL v9 = NSSelectorFromString((NSString *)a4);
  if (!v9) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Invalid selector name (%@)", a4), 0 reason userInfo]);
  }
  uint64_t v10 = v9;
  v13.receiver = self;
  v13.super_class = (Class)NSFunctionExpression;
  SEL v11 = [(NSExpression *)&v13 initWithExpressionType:4];
  v11->_operand = (NSExpression *)a3;
  v11->_selector = v10;
  v11->_arguments = (NSArray *)a5;
  -[NSFunctionExpression _validateExpression]((uint64_t)v11);
  return v11;
}

@end