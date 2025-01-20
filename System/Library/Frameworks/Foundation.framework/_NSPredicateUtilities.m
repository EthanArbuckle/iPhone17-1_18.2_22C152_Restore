@interface _NSPredicateUtilities
+ (BOOL)_isReservedWordInParser:(id)a3;
+ (NSNumber)_convertStringToNumber:(uint64_t)a1;
+ (NSString)_parserableCollectionDescription:(uint64_t)a1;
+ (NSString)_parserableDateDescription:(uint64_t)a1;
+ (NSString)_parserableStringDescription:(uint64_t)a1;
+ (id)_compoundPredicateClassesForSecureCoding;
+ (id)_constantValueClassesForSecureCoding;
+ (id)_expressionClassesForSecureCoding;
+ (id)_extendedExpressionClassesForSecureCoding;
+ (id)_operatorClassesForSecureCoding;
+ (id)_predicateClassesForSecureCoding;
+ (id)abs:(id)a3;
+ (id)add:(id)a3 to:(id)a4;
+ (id)average:(id)a3;
+ (id)bitwiseAnd:(id)a3 with:(id)a4;
+ (id)bitwiseOr:(id)a3 with:(id)a4;
+ (id)bitwiseXor:(id)a3 with:(id)a4;
+ (id)canonical:(id)a3;
+ (id)castObject:(id)a3 toType:(id)a4;
+ (id)ceiling:(id)a3;
+ (id)count:(id)a3;
+ (id)distanceToLocation:(id)a3 fromLocation:(id)a4;
+ (id)distinct:(id)a3;
+ (id)divide:(id)a3 by:(id)a4;
+ (id)exp:(id)a3;
+ (id)floor:(id)a3;
+ (id)from:(id)a3 subtract:(id)a4;
+ (id)indexed:(id)a3 by:(id)a4;
+ (id)inverseOrderKey:(id)a3;
+ (id)leftshift:(id)a3 by:(id)a4;
+ (id)length:(id)a3;
+ (id)ln:(id)a3;
+ (id)log:(id)a3;
+ (id)lowercase:(id)a3;
+ (id)max:(id)a3;
+ (id)median:(id)a3;
+ (id)min:(id)a3;
+ (id)mode:(id)a3;
+ (id)modulus:(id)a3 by:(id)a4;
+ (id)multiply:(id)a3 by:(id)a4;
+ (id)noindex:(id)a3;
+ (id)now;
+ (id)objectFrom:(id)a3 withIndex:(id)a4;
+ (id)onesComplement:(id)a3;
+ (id)raise:(id)a3 toPower:(id)a4;
+ (id)random;
+ (id)randomn:(id)a3;
+ (id)rightshift:(id)a3 by:(id)a4;
+ (id)sqrt:(id)a3;
+ (id)stddev:(id)a3;
+ (id)sum:(id)a3;
+ (id)tokenize:(id)a3 using:(id)a4;
+ (id)trunc:(id)a3;
+ (id)uppercase:(id)a3;
+ (uint64_t)_getCommonTypeFor:(uint64_t)a1;
+ (uint64_t)_getITypeFor:(uint64_t)a1;
+ (uint64_t)_predicateEnforceRestrictionsOnKeyPath:(uint64_t)a3 withOperand:(uint64_t)a4 forComponentName:;
+ (uint64_t)_predicateEnforceRestrictionsOnSelector:(uint64_t)a3 withOperand:(BOOL *)a4 isKVC:(uint64_t)a5 forComponentName:;
+ (uint64_t)_predicateEnforceRestrictionsOnTarget:(uint64_t)a3 forComponentName:;
+ (uint64_t)_predicateSecurityAction;
+ (void)_collapseAndTokenize:(uint64_t)a3 flags:(void *)a4 locale:;
+ (void)_doTokenization:(const __CFLocale *)a3 locale:;
+ (void)_processAndTokenize:(uint64_t)a3 flags:(const __CFLocale *)a4 locale:;
+ (void)initialize;
- (double)distanceFromLocation:(id)a3;
@end

@implementation _NSPredicateUtilities

+ (uint64_t)_predicateEnforceRestrictionsOnKeyPath:(uint64_t)a3 withOperand:(uint64_t)a4 forComponentName:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = self;
  v8 = (void *)MEMORY[0x185308110](v7);
  if (a3) {
    int v9 = objc_opt_isKindOfClass() ^ 1;
  }
  else {
    int v9 = 1;
  }
  v10 = (void *)[a2 componentsSeparatedByString:@"."];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    context = v8;
    int v13 = 0;
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      uint64_t v15 = 0;
      int v16 = -v13;
      int v25 = v13 + v12;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v10);
        }
        v17 = *(NSString **)(*((void *)&v27 + 1) + 8 * v15);
        v18 = NSSelectorFromString(v17);
        if (v18)
        {
          int v19 = +[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]((uint64_t)_NSPredicateUtilities, v18, a3, 0, a4);
          char v20 = v19;
          if (v16 == v15) {
            int v21 = 1;
          }
          else {
            int v21 = v19;
          }
          if (((v21 | v9) & 1) != 0 || ![(NSString *)v17 isEqualToString:@"class"])
          {
            if (v20)
            {
LABEL_21:
              uint64_t v22 = 1;
              goto LABEL_22;
            }
          }
          else
          {
            self;
            if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
              goto LABEL_21;
            }
          }
        }
        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v26 count:16];
      int v13 = v25;
      if (v12) {
        continue;
      }
      break;
    }
    uint64_t v22 = 0;
LABEL_22:
    v8 = context;
  }
  else
  {
    uint64_t v22 = 0;
  }
  return v22;
}

+ (uint64_t)_predicateEnforceRestrictionsOnSelector:(uint64_t)a3 withOperand:(BOOL *)a4 isKVC:(uint64_t)a5 forComponentName:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self;
  int v9 = [[NSString alloc] initWithUTF8String:sel_getName(a2)];
  self;
  uint64_t v10 = [*(id *)(_CFPredicatePolicyData() + 32) objectForKey:v9];
  if (v10
    || (self, ![(id)_CFPredicatePolicyRestrictedSelectors() objectForKey:v9])
    && ((self, (_CFPredicatePolicyData_getFlags() & 8) == 0)
     || (objc_opt_class(), (objc_opt_respondsToSelector() & 1) == 0)
     || (self, [*(id *)(_CFPredicatePolicyData() + 24) objectForKey:v9]))
    || (self, [*(id *)(_CFPredicatePolicyData() + 40) objectForKey:v9])
    && (self, (_CFPredicatePolicyData_getFlags() & 8) == 0)
    || (BOOL v13 = [(NSString *)v9 isEqualToString:@"class"], a3)
    && v13
    && (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v11 = 0;
  }
  else
  {
    self;
    uint64_t v14 = _NSOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v15 = 138412546;
      uint64_t v16 = a5;
      __int16 v17 = 2114;
      v18 = v9;
      _os_log_fault_impl(&dword_181795000, v14, OS_LOG_TYPE_FAULT, "NSPredicate: %@ with selector '%{public}@' is forbidden.", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v11 = 1;
  }

  if (a4) {
    *a4 = v10 != 0;
  }
  return v11;
}

+ (uint64_t)_predicateEnforceRestrictionsOnTarget:(uint64_t)a3 forComponentName:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self;
  if (!a2) {
    return 0;
  }
  if (object_isClass(a2))
  {
    v5 = [[NSString alloc] initWithUTF8String:class_getName(a2)];
    v6 = a2;
    goto LABEL_7;
  }
  Class Class = object_getClass(a2);
  if (object_isClass(Class))
  {
    v5 = [[NSString alloc] initWithUTF8String:object_getClassName(a2)];
    v6 = object_getClass(a2);
LABEL_7:
    Superclass = (NSString *)class_getSuperclass(v6);
    if (Superclass) {
      Superclass = [[NSString alloc] initWithUTF8String:class_getName((Class)Superclass)];
    }
    self;
    if ([(id)_CFPredicatePolicyRestrictedClasses() objectForKey:v5])
    {
      self;
      if (![*(id *)(_CFPredicatePolicyData() + 8) objectForKey:v5])
      {
LABEL_17:
        self;
        uint64_t v12 = _NSOSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          int v14 = 138412546;
          uint64_t v15 = a3;
          __int16 v16 = 2114;
          __int16 v17 = v5;
          _os_log_fault_impl(&dword_181795000, v12, OS_LOG_TYPE_FAULT, "NSPredicate: Use of %@ with instance of '%{public}@' is forbidden.", (uint8_t *)&v14, 0x16u);
        }
        uint64_t v7 = 1;
        goto LABEL_25;
      }
      self;
      unint64_t Flags = _CFPredicatePolicyData_getFlags();
      uint64_t v11 = (Flags >> 3) & 1;
      if ((Flags >> 3)) {
        goto LABEL_16;
      }
    }
    else
    {
      LODWORD(v11) = 0;
    }
    if (Superclass)
    {
      self;
      if (![*(id *)(_CFPredicatePolicyData() + 16) objectForKey:v5])
      {
        self;
        if ([(id)_CFPredicatePolicyRestrictedClasses() objectForKey:Superclass])
        {
          self;
          if (![*(id *)(_CFPredicatePolicyData() + 8) objectForKey:Superclass]) {
            goto LABEL_17;
          }
          self;
          if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
            goto LABEL_17;
          }
        }
        goto LABEL_24;
      }
    }
LABEL_16:
    if (v11) {
      goto LABEL_17;
    }
LABEL_24:
    uint64_t v7 = 0;
LABEL_25:

    return v7;
  }
  return 1;
}

+ (NSString)_parserableDateDescription:(uint64_t)a1
{
  self;
  [a2 timeIntervalSinceReferenceDate];
  return +[NSString stringWithFormat:@"CAST(%f, \"NSDate\")", v3];
}

+ (id)objectFrom:(id)a3 withIndex:(id)a4
{
  if ((_NSIsNSArray() & 1) == 0 && !_NSIsNSOrderedSet())
  {
    if (_NSIsNSSet())
    {
      self;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        return (id)[a3 member:a4];
      }
      uint64_t v9 = [a4 constantValue];
      if (![@"FIRST" caseInsensitiveCompare:v9]
        || ![@"LAST" caseInsensitiveCompare:v9])
      {
        return (id)[a3 anyObject];
      }
      goto LABEL_18;
    }
    if (_NSIsNSDictionary())
    {
      self;
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [a4 constantValue];
        BOOL v13 = (void *)[a3 allKeys];
        if ([@"FIRST" caseInsensitiveCompare:v12])
        {
          if ([@"LAST" caseInsensitiveCompare:v12])
          {
            uint64_t v10 = v12;
            goto LABEL_19;
          }
          uint64_t v17 = [v13 lastObject];
        }
        else
        {
          if (![v13 count]) {
            return 0;
          }
          uint64_t v17 = [v13 objectAtIndex:0];
        }
        id v16 = (id)v17;
        id v15 = a3;
      }
      else
      {
        id v15 = a3;
        id v16 = a4;
      }
      return (id)[v15 objectForKey:v16];
    }
    uint64_t v11 = +[NSString stringWithFormat:@"The object %@ is NOT a collection.  Cannot retrieve item at index: %@", a3, a4];
LABEL_33:
    if (v11)
    {
      uint64_t v18 = v11;
      uint64_t v19 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [v19 setObject:a3 forKey:@"list"];
      [v19 setObject:a4 forKey:@"index"];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v18 userInfo:v19]);
    }
    return 0;
  }
  if (_NSIsNSNumber())
  {
    uint64_t v6 = [a4 integerValue];
    id v7 = a3;
LABEL_5:
    return (id)[v7 objectAtIndex:v6];
  }
  self;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = +[NSString stringWithFormat:@"The symbolic index %@ is unknown.", a4, v20];
    goto LABEL_33;
  }
  uint64_t v9 = [a4 constantValue];
  if (![@"FIRST" caseInsensitiveCompare:v9])
  {
    if ([a3 count])
    {
      id v7 = a3;
      uint64_t v6 = 0;
      goto LABEL_5;
    }
    return 0;
  }
  if (![@"LAST" caseInsensitiveCompare:v9])
  {
    return (id)[a3 lastObject];
  }
LABEL_18:
  uint64_t v10 = v9;
LABEL_19:
  if ([@"SIZE" caseInsensitiveCompare:v10])
  {
    uint64_t v11 = +[NSString stringWithFormat:@"The index %@ is NOT appropriate for a collection of type: %@", a4, objc_opt_class()];
    goto LABEL_33;
  }
  uint64_t v14 = [a3 count];

  return +[NSNumber numberWithLong:v14];
}

+ (id)bitwiseAnd:(id)a3 with:(id)a4
{
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't do bit operators on non-numbers" userInfo:0]);
  }
  uint64_t v6 = [a3 integerValue];
  uint64_t v7 = [a4 integerValue] & v6;

  return +[NSNumber numberWithInteger:v7];
}

+ (NSString)_parserableCollectionDescription:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self;
  if (!a2) {
    return (NSString *)@"nil";
  }
  if (_NSIsNSString())
  {
    return +[_NSPredicateUtilities _parserableStringDescription:]((uint64_t)_NSPredicateUtilities, (uint64_t)a2);
  }
  if (_NSIsNSDictionary())
  {
    v5 = a2;
    uint64_t v6 = [a2 allKeys];
    a2 = (void *)v6;
LABEL_13:
    v4 = +[NSMutableString stringWithCapacity:50];
    [(NSMutableString *)v4 appendString:@"{"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(a2);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (v9) {
            [(NSMutableString *)v4 appendString:@", "];
          }
          [(NSMutableString *)v4 appendString:+[_NSPredicateUtilities _parserableCollectionDescription:](_NSPredicateUtilities, v12)];
          if (v6)
          {
            [(NSMutableString *)v4 appendString:@" = "];
            -[NSMutableString appendString:](v4, "appendString:", +[_NSPredicateUtilities _parserableCollectionDescription:](_NSPredicateUtilities, [v5 objectForKey:v12]));
          }
          char v9 = 1;
        }
        uint64_t v8 = [a2 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v8);
    }
    [(NSMutableString *)v4 appendString:@"}"];
    return (NSString *)v4;
  }
  if (_NSIsNSArray())
  {
    uint64_t v6 = 0;
    v5 = a2;
    goto LABEL_13;
  }
  if (_NSIsNSSet())
  {
    v5 = a2;
    a2 = (void *)[a2 allObjects];
    uint64_t v6 = 0;
    goto LABEL_13;
  }

  return (NSString *)[a2 description];
}

+ (id)_extendedExpressionClassesForSecureCoding
{
  if (qword_1EB1ED958 != -1) {
    dispatch_once(&qword_1EB1ED958, &__block_literal_global_211);
  }
  return (id)qword_1EB1ED950;
}

+ (id)_expressionClassesForSecureCoding
{
  if (qword_1EB1ED948 != -1) {
    dispatch_once(&qword_1EB1ED948, &__block_literal_global_196);
  }
  return (id)qword_1EB1ED940;
}

+ (id)_constantValueClassesForSecureCoding
{
  if (qword_1EB1ED978 != -1) {
    dispatch_once(&qword_1EB1ED978, &__block_literal_global_226);
  }
  return (id)qword_1EB1ED970;
}

+ (id)_operatorClassesForSecureCoding
{
  if (qword_1EB1ED968 != -1) {
    dispatch_once(&qword_1EB1ED968, &__block_literal_global_213);
  }
  return (id)qword_1EB1ED960;
}

+ (id)_compoundPredicateClassesForSecureCoding
{
  if (qword_1EB1ED938 != -1) {
    dispatch_once(&qword_1EB1ED938, &__block_literal_global_194);
  }
  return (id)qword_1EB1ED930;
}

+ (BOOL)_isReservedWordInParser:(id)a3
{
  if ((_qfqp2_InitializedGlobals & 1) == 0) {
    _qfqp2_InitializedGlobalData();
  }
  v4 = (void *)_qfqp2_ReservedWords;
  uint64_t v5 = [a3 uppercaseString];

  return [v4 containsObject:v5];
}

+ (void)initialize
{
  if (_NSPredicateUtilities == a1 && _NSCoderGetTrustRestrictions() != 2)
  {
    uint64_t v2 = _CFPredicatePolicyData_getFlags() | 8;
    MEMORY[0x1F40D8F10](v2);
  }
}

+ (NSString)_parserableStringDescription:(uint64_t)a1
{
  self;
  uint64_t v3 = +[NSString stringWithString:a2];
  [(NSMutableString *)v3 replaceOccurrencesOfString:@"\\", @"\\\\", 2, 0, [(NSString *)v3 length] withString options range];
  [(NSMutableString *)v3 replaceOccurrencesOfString:@"\", @"\\\", 2, 0, [(NSString *)v3 length] withString options range];
  return +[NSString stringWithFormat:@"\"%@\"", v3];
}

+ (id)add:(id)a3 to:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  int v6 = _NSIsNSDate();
  int v7 = _NSIsNSNumber();
  int v8 = _NSIsNSDate();
  int v9 = _NSIsNSNumber();
  if (v7 && v9)
  {
    unint64_t v10 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[a3 objCType]);
    unint64_t v11 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[a4 objCType]);
    if (v10 >= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12 == 1)
    {
      uint64_t v24 = [a3 unsignedLongLongValue];
      uint64_t v25 = [a4 unsignedLongLongValue] + v24;
      return +[NSNumber numberWithUnsignedLongLong:v25];
    }
    else if (v12)
    {
      uint64_t v26 = [a3 longLongValue];
      uint64_t v27 = [a4 longLongValue] + v26;
      return +[NSNumber numberWithLongLong:v27];
    }
    else
    {
      [a3 doubleValue];
      double v14 = v13;
      [a4 doubleValue];
      double v16 = v14 + v15;
      return +[NSNumber numberWithDouble:v16];
    }
  }
  else
  {
    if ((v6 & v9) == 1)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F1C9C8];
      [a3 timeIntervalSinceReferenceDate];
      double v20 = v19;
      [a4 doubleValue];
    }
    else
    {
      if ((v7 & v8) != 1)
      {
        long long v28 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v29 = *MEMORY[0x1E4F1C3C8];
        v30[1] = a3;
        uint64_t v31 = @"Parameters";
        v30[0] = a4;
        v32[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
        objc_exception_throw((id)objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, @"incompatible parameters passed to mathematical function", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1)));
      }
      uint64_t v18 = (void *)MEMORY[0x1E4F1C9C8];
      [a3 doubleValue];
      double v20 = v22;
      [a4 timeIntervalSinceReferenceDate];
    }
    double v23 = v20 + v21;
    return (id)[v18 dateWithTimeIntervalSinceReferenceDate:v23];
  }
}

+ (id)multiply:(id)a3 by:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v20[1] = a4;
    double v21 = @"Parameters";
    v20[0] = a3;
    v22[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, @"mathematical functions require NSNumber parameters", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1)));
  }
  unint64_t v6 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[a3 objCType]);
  unint64_t v7 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[a4 objCType]);
  if (v6 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8 == 1)
  {
    uint64_t v14 = [a3 unsignedLongLongValue];
    uint64_t v15 = [a4 unsignedLongLongValue] * v14;
    return +[NSNumber numberWithUnsignedLongLong:v15];
  }
  else if (v8)
  {
    uint64_t v16 = [a3 longLongValue];
    uint64_t v17 = [a4 longLongValue] * v16;
    return +[NSNumber numberWithLongLong:v17];
  }
  else
  {
    [a3 doubleValue];
    double v10 = v9;
    [a4 doubleValue];
    double v12 = v10 * v11;
    return +[NSNumber numberWithDouble:v12];
  }
}

+ (uint64_t)_getITypeFor:(uint64_t)a1
{
  self;
  if (!a2) {
LABEL_13:
  }
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Unknown number type or nil passed to arithmetic function expression." userInfo:0]);
  uint64_t v3 = (char)*a2;
  if (v3 > 99)
  {
    uint64_t result = 0;
    switch(*a2)
    {
      case 'd':
      case 'f':
        return result;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
        goto LABEL_13;
      case 'i':
      case 'l':
        return 2;
      default:
        if (v3 == 113 || v3 == 115) {
          return 2;
        }
        goto LABEL_13;
    }
  }
  if (v3 <= 80)
  {
    if (v3 != 73 && v3 != 76) {
      goto LABEL_13;
    }
    return 2;
  }
  if (v3 != 81)
  {
    if (v3 != 83) {
      goto LABEL_13;
    }
    return 2;
  }
  return 1;
}

+ (id)noindex:(id)a3
{
  return a3;
}

- (double)distanceFromLocation:(id)a3
{
  return 0.0;
}

+ (uint64_t)_predicateSecurityAction
{
  self;
  self;
  uint64_t result = _CFPredicatePolicyData_getFlags();
  if ((result & 8) != 0 || (uint64_t result = dyld_program_sdk_at_least(), result)) {
    __break(1u);
  }
  return result;
}

+ (uint64_t)_getCommonTypeFor:(uint64_t)a1
{
  v25[1] = *MEMORY[0x1E4F143B8];
  self;
  if (!a2)
  {
    uint64_t v13 = 0;
    goto LABEL_23;
  }
  if (![a2 count]
    || (_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0)
  {
    uint64_t v24 = @"collection";
    v25[0] = a2;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
LABEL_23:
    uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    uint64_t v14 = @"Invoked mathematical function with bad collection parameter.";
LABEL_20:
    objc_exception_throw((id)[v15 exceptionWithName:v16 reason:v14 userInfo:v13]);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [a2 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    unint64_t v6 = 3;
    while (1)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(a2);
        }
        unint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((_NSIsNSNumber() & 1) == 0)
        {
          double v11 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v12 = *MEMORY[0x1E4F1C3C8];
          uint64_t v17 = @"collection";
          uint64_t v18 = a2;
          uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
          uint64_t v14 = @"Invoked mathematical function with non-numeric object(s) in collection.";
          uint64_t v15 = v11;
          uint64_t v16 = v12;
          goto LABEL_20;
        }
        unint64_t v9 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[v8 objCType]);
        if (v9 < v6) {
          unint64_t v6 = v9;
        }
      }
      uint64_t v4 = [a2 countByEnumeratingWithState:&v20 objects:v19 count:16];
      if (!v4) {
        return v6;
      }
    }
  }
  return 3;
}

+ (id)sum:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (((_NSIsNSArray() & 1) != 0 || (_NSIsNSSet() & 1) != 0 || _NSIsNSOrderedSet())
    && ![a3 count])
  {
    return +[NSNumber numberWithInteger:0];
  }
  else
  {
    uint64_t v4 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)_NSPredicateUtilities, a3);
    if (v4 == 1)
    {
      long long v30 = 0uLL;
      long long v31 = 0uLL;
      long long v28 = 0uLL;
      long long v29 = 0uLL;
      uint64_t v12 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = 0;
        uint64_t v15 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v29 != v15) {
              objc_enumerationMutation(a3);
            }
            v14 += [*(id *)(*((void *)&v28 + 1) + 8 * i) unsignedLongLongValue];
          }
          uint64_t v13 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
        }
        while (v13);
      }
      else
      {
        uint64_t v14 = 0;
      }
      return +[NSNumber numberWithUnsignedLongLong:v14];
    }
    else if (v4)
    {
      long long v25 = 0uLL;
      long long v26 = 0uLL;
      long long v23 = 0uLL;
      long long v24 = 0uLL;
      uint64_t v17 = [a3 countByEnumeratingWithState:&v23 objects:v22 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = 0;
        uint64_t v20 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(a3);
            }
            v19 += [*(id *)(*((void *)&v23 + 1) + 8 * j) longLongValue];
          }
          uint64_t v18 = [a3 countByEnumeratingWithState:&v23 objects:v22 count:16];
        }
        while (v18);
      }
      else
      {
        uint64_t v19 = 0;
      }
      return +[NSNumber numberWithLongLong:v19];
    }
    else
    {
      long long v35 = 0uLL;
      long long v36 = 0uLL;
      long long v33 = 0uLL;
      long long v34 = 0uLL;
      uint64_t v5 = [a3 countByEnumeratingWithState:&v33 objects:v32 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v34;
        double v8 = 0.0;
        do
        {
          for (uint64_t k = 0; k != v6; ++k)
          {
            if (*(void *)v34 != v7) {
              objc_enumerationMutation(a3);
            }
            [*(id *)(*((void *)&v33 + 1) + 8 * k) doubleValue];
            double v8 = v8 + v10;
          }
          uint64_t v6 = [a3 countByEnumeratingWithState:&v33 objects:v32 count:16];
        }
        while (v6);
      }
      else
      {
        double v8 = 0.0;
      }
      return +[NSNumber numberWithDouble:v8];
    }
  }
}

+ (id)count:(id)a3
{
  if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invoked count with non-collection parameter." userInfo:0]);
  }
  uint64_t v4 = [a3 count];

  return +[NSNumber numberWithInteger:v4];
}

+ (id)min:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (![a3 count]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invoked min with empty collection." userInfo:0]);
  }
  uint64_t v4 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)_NSPredicateUtilities, a3);
  if (_NSIsNSArray()) {
    uint64_t v5 = (void *)[a3 lastObject];
  }
  else {
    uint64_t v5 = (void *)[a3 anyObject];
  }
  if (v4 == 1)
  {
    unint64_t v16 = [v5 unsignedLongLongValue];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v17 = [a3 countByEnumeratingWithState:&v34 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(a3);
          }
          long long v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v21 unsignedLongLongValue] < v16) {
            unint64_t v16 = [v21 unsignedLongLongValue];
          }
        }
        uint64_t v18 = [a3 countByEnumeratingWithState:&v34 objects:v33 count:16];
      }
      while (v18);
    }
    return +[NSNumber numberWithUnsignedLongLong:v16];
  }
  else if (v4)
  {
    uint64_t v22 = [v5 longLongValue];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v23 = [a3 countByEnumeratingWithState:&v29 objects:v28 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(a3);
          }
          uint64_t v27 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if ([v27 longLongValue] < v22) {
            uint64_t v22 = [v27 longLongValue];
          }
        }
        uint64_t v24 = [a3 countByEnumeratingWithState:&v29 objects:v28 count:16];
      }
      while (v24);
    }
    return +[NSNumber numberWithLongLong:v22];
  }
  else
  {
    [v5 doubleValue];
    double v7 = v6;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v39 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v9; ++k)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(a3);
          }
          uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * k);
          [v12 doubleValue];
          if (v13 < v7)
          {
            [v12 doubleValue];
            double v7 = v14;
          }
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v39 objects:v38 count:16];
      }
      while (v9);
    }
    return +[NSNumber numberWithDouble:v7];
  }
}

+ (id)max:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (![a3 count]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invoked max with empty collection." userInfo:0]);
  }
  uint64_t v4 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)_NSPredicateUtilities, a3);
  if (_NSIsNSArray()) {
    uint64_t v5 = (void *)[a3 lastObject];
  }
  else {
    uint64_t v5 = (void *)[a3 anyObject];
  }
  if (v4 == 1)
  {
    unint64_t v16 = [v5 unsignedLongLongValue];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v17 = [a3 countByEnumeratingWithState:&v34 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(a3);
          }
          long long v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v21 unsignedLongLongValue] > v16) {
            unint64_t v16 = [v21 unsignedLongLongValue];
          }
        }
        uint64_t v18 = [a3 countByEnumeratingWithState:&v34 objects:v33 count:16];
      }
      while (v18);
    }
    return +[NSNumber numberWithUnsignedLongLong:v16];
  }
  else if (v4)
  {
    uint64_t v22 = [v5 longLongValue];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v23 = [a3 countByEnumeratingWithState:&v29 objects:v28 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(a3);
          }
          uint64_t v27 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if ([v27 longLongValue] > v22) {
            uint64_t v22 = [v27 longLongValue];
          }
        }
        uint64_t v24 = [a3 countByEnumeratingWithState:&v29 objects:v28 count:16];
      }
      while (v24);
    }
    return +[NSNumber numberWithLongLong:v22];
  }
  else
  {
    [v5 doubleValue];
    double v7 = v6;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v39 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v9; ++k)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(a3);
          }
          uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * k);
          [v12 doubleValue];
          if (v13 > v7)
          {
            [v12 doubleValue];
            double v7 = v14;
          }
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v39 objects:v38 count:16];
      }
      while (v9);
    }
    return +[NSNumber numberWithDouble:v7];
  }
}

+ (id)average:(id)a3
{
  uint64_t v4 = objc_msgSend(a1, "sum:");
  uint64_t v5 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)_NSPredicateUtilities, a3);
  if (v5 == 1)
  {
    double v7 = (double)(unint64_t)[v4 unsignedLongLongValue];
  }
  else if (v5)
  {
    double v7 = (double)[v4 longLongValue];
  }
  else
  {
    [v4 doubleValue];
    double v7 = v6;
  }
  double v8 = v7 / (double)(unint64_t)[a3 count];

  return +[NSNumber numberWithDouble:v8];
}

+ (id)median:(id)a3
{
  uint64_t v3 = (void *)[a3 sortedArrayUsingSelector:sel_compare_];
  char v4 = [v3 count];
  unint64_t v5 = (unint64_t)[v3 count] >> 1;
  if (v4)
  {
    return (id)[v3 objectAtIndex:v5];
  }
  else
  {
    double v6 = (void *)[v3 objectAtIndex:v5 - 1];
    double v7 = objc_msgSend(v3, "objectAtIndex:", (unint64_t)objc_msgSend(v3, "count") >> 1);
    unint64_t v8 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[v6 objCType]);
    unint64_t v9 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[v7 objCType]);
    if (v9 <= v8) {
      unint64_t v10 = v8;
    }
    else {
      unint64_t v10 = v9;
    }
    if (v10 == 1)
    {
      uint64_t v16 = [v6 unsignedLongLongValue];
      unint64_t v17 = (unint64_t)([v7 unsignedLongLongValue] + v16) >> 1;
      return +[NSNumber numberWithUnsignedLongLong:v17];
    }
    else if (v10)
    {
      uint64_t v18 = [v6 longLongValue];
      uint64_t v19 = [v7 longLongValue];
      uint64_t v20 = v19 + v18;
      if (v19 + v18 < 0 != __OFADD__(v19, v18)) {
        ++v20;
      }
      return +[NSNumber numberWithLongLong:v20 >> 1];
    }
    else
    {
      [v6 doubleValue];
      double v12 = v11;
      [v7 doubleValue];
      double v14 = (v12 + v13) * 0.5;
      return +[NSNumber numberWithDouble:v14];
    }
  }
}

+ (id)mode:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)_NSPredicateUtilities, a3);
  unint64_t v5 = (void *)[a3 sortedArrayUsingSelector:sel_compare_];
  double v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        double v14 = v9;
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (![v6 count])
        {
          ++v10;
          [v6 addObject:v9];
          continue;
        }
        if (v4 == 1)
        {
          uint64_t v18 = [v14 unsignedLongLongValue];
          uint64_t v19 = [v9 unsignedLongLongValue];
        }
        else
        {
          if (!v4)
          {
            [v14 doubleValue];
            double v16 = v15;
            [v9 doubleValue];
            if (v16 != v17) {
              goto LABEL_16;
            }
            goto LABEL_10;
          }
          uint64_t v18 = [v14 longLongValue];
          uint64_t v19 = [v9 longLongValue];
        }
        if (v18 != v19)
        {
LABEL_16:
          uint64_t v10 = 1;
          continue;
        }
LABEL_10:
        if (++v10 <= v11)
        {
          if (v10 == v11)
          {
            [v6 addObject:v9];
            uint64_t v10 = v11;
          }
        }
        else
        {
          double v6 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObject:v9];
          unint64_t v11 = v10;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v22 objects:v21 count:16];
    }
    while (v8);
  }
  return v6;
}

+ (id)stddev:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a1, "average:"), "doubleValue");
  double v5 = v4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) doubleValue];
        double v9 = v9 + (v5 - v11) * (v5 - v11);
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sqrt(v9 / (double)(unint64_t)[a3 count]));
}

+ (id)from:(id)a3 subtract:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  int v6 = _NSIsNSDate();
  int v7 = _NSIsNSNumber();
  int v8 = _NSIsNSDate();
  int v9 = _NSIsNSNumber();
  if (v7 && v9)
  {
    unint64_t v10 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[a3 objCType]);
    unint64_t v11 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[a4 objCType]);
    if (v10 >= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12 == 1)
    {
      uint64_t v24 = [a3 unsignedLongLongValue];
      uint64_t v25 = v24 - [a4 unsignedLongLongValue];
      return +[NSNumber numberWithUnsignedLongLong:v25];
    }
    else
    {
      if (!v12)
      {
        [a3 doubleValue];
        double v14 = v13;
        [a4 doubleValue];
LABEL_11:
        double v17 = v14 - v15;
        return +[NSNumber numberWithDouble:v17];
      }
      uint64_t v26 = [a3 longLongValue];
      uint64_t v27 = v26 - [a4 longLongValue];
      return +[NSNumber numberWithLongLong:v27];
    }
  }
  else
  {
    if ((v6 & v8) == 1)
    {
      [a3 timeIntervalSinceReferenceDate];
      double v14 = v16;
      [a4 timeIntervalSinceReferenceDate];
      goto LABEL_11;
    }
    if ((v6 & v9) != 1)
    {
      long long v28 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v29 = *MEMORY[0x1E4F1C3C8];
      v30[1] = a3;
      long long v31 = @"Parameters";
      v30[0] = a4;
      v32[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
      objc_exception_throw((id)objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, @"incompatible parameters passed to mathematical function", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1)));
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F1C9C8];
    [a3 timeIntervalSinceReferenceDate];
    double v21 = v20;
    [a4 doubleValue];
    double v23 = v21 - v22;
    return (id)[v19 dateWithTimeIntervalSinceReferenceDate:v23];
  }
}

+ (id)divide:(id)a3 by:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
  {
    double v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    v22[1] = a4;
    double v23 = @"Parameters";
    v22[0] = a3;
    v24[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    objc_exception_throw((id)objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, @"mathematical functions require NSNumber parameters", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1)));
  }
  unint64_t v6 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[a3 objCType]);
  unint64_t v7 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[a4 objCType]);
  if (v6 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8 == 1)
  {
    unint64_t v14 = [a3 unsignedLongLongValue];
    unint64_t v15 = [a4 unsignedLongLongValue];
    if (v15) {
      unint64_t v16 = v14 / v15;
    }
    else {
      unint64_t v16 = 0;
    }
    return +[NSNumber numberWithUnsignedLongLong:v16];
  }
  else if (v8)
  {
    uint64_t v17 = [a3 longLongValue];
    uint64_t v18 = [a4 longLongValue];
    if (v18) {
      uint64_t v19 = v17 / v18;
    }
    else {
      uint64_t v19 = 0;
    }
    return +[NSNumber numberWithLongLong:v19];
  }
  else
  {
    [a3 doubleValue];
    double v10 = v9;
    [a4 doubleValue];
    double v12 = v10 / v11;
    return +[NSNumber numberWithDouble:v12];
  }
}

+ (id)modulus:(id)a3 by:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
  {
    double v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    v22[1] = a4;
    double v23 = @"Parameters";
    v22[0] = a3;
    v24[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    objc_exception_throw((id)objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, @"mathematical functions require NSNumber parameters", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1)));
  }
  unint64_t v6 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[a3 objCType]);
  unint64_t v7 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[a4 objCType]);
  if (v6 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8 == 1)
  {
    unint64_t v14 = [a3 unsignedLongLongValue];
    unint64_t v15 = [a4 unsignedLongLongValue];
    if (v15) {
      unint64_t v16 = v14 % v15;
    }
    else {
      unint64_t v16 = 0;
    }
    return +[NSNumber numberWithUnsignedLongLong:v16];
  }
  else if (v8)
  {
    uint64_t v17 = [a3 longLongValue];
    uint64_t v18 = [a4 longLongValue];
    if (v18) {
      uint64_t v19 = v17 % v18;
    }
    else {
      uint64_t v19 = 0;
    }
    return +[NSNumber numberWithLongLong:v19];
  }
  else
  {
    [a3 doubleValue];
    long double v10 = v9;
    [a4 doubleValue];
    double v12 = fmod(v10, v11);
    return +[NSNumber numberWithDouble:v12];
  }
}

+ (id)sqrt:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    id v9 = a3;
    long double v10 = @"Parameters";
    v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, @"mathematical functions require NSNumber parameters", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
  }
  [a3 doubleValue];
  double v5 = sqrt(v4);

  return +[NSNumber numberWithDouble:v5];
}

+ (id)log:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    id v9 = a3;
    long double v10 = @"Parameters";
    v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, @"mathematical functions require NSNumber parameters", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
  }
  [a3 doubleValue];
  double v5 = log10(v4);

  return +[NSNumber numberWithDouble:v5];
}

+ (id)ln:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    id v9 = a3;
    long double v10 = @"Parameters";
    v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, @"mathematical functions require NSNumber parameters", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
  }
  [a3 doubleValue];
  double v5 = log(v4);

  return +[NSNumber numberWithDouble:v5];
}

+ (id)raise:(id)a3 toPower:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    long double v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    id v13 = a3;
    unint64_t v14 = @"Parameters";
    v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, @"mathematical functions require NSNumber parameters", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1)));
  }
  [a3 doubleValue];
  long double v7 = v6;
  [a4 doubleValue];
  double v9 = pow(v7, v8);

  return +[NSNumber numberWithDouble:v9];
}

+ (id)exp:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    long double v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    id v9 = a3;
    long double v10 = @"Parameters";
    v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, @"mathematical functions require NSNumber parameters", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
  }
  [a3 doubleValue];
  double v5 = exp(v4);

  return +[NSNumber numberWithDouble:v5];
}

+ (id)floor:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    long double v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    id v9 = a3;
    long double v10 = @"Parameters";
    v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, @"mathematical functions require NSNumber parameters", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
  }
  [a3 doubleValue];
  double v5 = floor(v4);

  return +[NSNumber numberWithDouble:v5];
}

+ (id)ceiling:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    long double v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    id v9 = a3;
    long double v10 = @"Parameters";
    v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, @"mathematical functions require NSNumber parameters", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
  }
  [a3 doubleValue];
  double v5 = ceil(v4);

  return +[NSNumber numberWithDouble:v5];
}

+ (id)abs:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    id v11 = a3;
    uint64_t v12 = @"Parameters";
    v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, @"mathematical functions require NSNumber parameters", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1)));
  }
  uint64_t v4 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (unsigned char *)[a3 objCType]);
  if (v4 == 1) {
    return a3;
  }
  if (v4 == 2)
  {
    uint64_t v5 = [a3 longLongValue];
    if ((v5 & 0x8000000000000000) == 0) {
      return a3;
    }
    return +[NSNumber numberWithLongLong:-v5];
  }
  else
  {
    [a3 doubleValue];
    double v8 = fabs(v7);
    return +[NSNumber numberWithDouble:v8];
  }
}

+ (id)trunc:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    double v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    id v9 = a3;
    uint64_t v10 = @"Parameters";
    v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, @"mathematical functions require NSNumber parameters", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
  }
  [a3 doubleValue];
  double v5 = trunc(v4);

  return +[NSNumber numberWithDouble:v5];
}

+ (void)_doTokenization:(const __CFLocale *)a3 locale:
{
  BOOL v5 = a3 == 0;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self;
  v16.length = [(__CFString *)a2 length];
  v16.location = 0;
  double v6 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, v16, 4 * v5, a3);
  CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(v6);
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA80] set];
  id v9 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  if (Token)
  {
    uint64_t v10 = v9;
    do
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
      if (CurrentTokenRange.location != -1)
      {
        uint64_t v12 = (void *)-[__CFString substringWithRange:](a2, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
        unsigned __int16 v14 = 0;
        objc_msgSend(v12, "getCharacters:range:", &v14, 0, 1);
        if (![(NSCharacterSet *)v10 characterIsMember:v14]) {
          [v8 addObject:v12];
        }
      }
    }
    while (CFStringTokenizerAdvanceToNextToken(v6));
  }
  CFRelease(v6);
  return v8;
}

+ (void)_processAndTokenize:(uint64_t)a3 flags:(const __CFLocale *)a4 locale:
{
  self;
  if (a3)
  {
    double v7 = +[_NSPredicateOperatorUtilities newStringFrom:a2 usingUnicodeTransforms:a3];
    uint64_t v8 = +[_NSPredicateUtilities _doTokenization:locale:]((uint64_t)_NSPredicateUtilities, v7, a4);

    return v8;
  }
  else
  {
    return +[_NSPredicateUtilities _doTokenization:locale:]((uint64_t)_NSPredicateUtilities, a2, a4);
  }
}

+ (void)_collapseAndTokenize:(uint64_t)a3 flags:(void *)a4 locale:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  self;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(a2);
      }
      uint64_t v12 = *(__CFString **)(*((void *)&v16 + 1) + 8 * i);
      if (!_NSIsNSString())
      {

        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unable to tokenize : %@", v12), 0 reason userInfo]);
      }
      id v13 = +[_NSPredicateUtilities _processAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, v12, a3, (const __CFLocale *)a4);
      if (v9) {
        [v9 unionSet:v13];
      }
      else {
        id v9 = v13;
      }
    }
    uint64_t v8 = [a2 countByEnumeratingWithState:&v16 objects:v15 count:16];
  }
  while (v8);
  return v9;
}

+ (id)tokenize:(id)a3 using:(id)a4
{
  if ([a4 rangeOfString:@"n"] != 0x7FFFFFFFFFFFFFFFLL
    || [a4 rangeOfString:@"N"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_9;
  }
  if ([a4 rangeOfString:@"c"] == 0x7FFFFFFFFFFFFFFFLL
    && [a4 rangeOfString:@"C"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([a4 rangeOfString:@"d"] == 0x7FFFFFFFFFFFFFFFLL
      && [a4 rangeOfString:@"D"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([a4 rangeOfString:@"l"] != 0x7FFFFFFFFFFFFFFFLL
        || [a4 rangeOfString:@"L"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        double v6 = +[_NSPredicateOperatorUtilities retainedLocale];
        goto LABEL_10;
      }
LABEL_9:
      double v6 = 0;
LABEL_10:
      uint64_t v7 = 0;
      goto LABEL_11;
    }
    double v6 = 0;
    uint64_t v7 = 2;
  }
  else
  {
    double v6 = 0;
    uint64_t v7 = 1;
  }
LABEL_11:
  if (_NSIsNSString())
  {
    uint64_t v8 = +[_NSPredicateUtilities _processAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, (__CFString *)a3, v7, v6);
  }
  else
  {
    if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && !_NSIsNSOrderedSet())
    {

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unable to tokenize : %@", a3), 0 reason userInfo]);
    }
    uint64_t v8 = +[_NSPredicateUtilities _collapseAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, a3, v7, v6);
  }
  id v9 = v8;

  return v9;
}

+ (id)uppercase:(id)a3
{
  if ((_NSIsNSString() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't uppercase non-string" userInfo:0]);
  }

  return (id)[a3 uppercaseString];
}

+ (id)lowercase:(id)a3
{
  if ((_NSIsNSString() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't lowercase non-string" userInfo:0]);
  }

  return (id)[a3 lowercaseString];
}

+ (id)length:(id)a3
{
  if ((_NSIsNSString() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't apply length: to a non-string" userInfo:0]);
  }
  uint64_t v4 = [a3 length];

  return +[NSNumber numberWithUnsignedInteger:v4];
}

+ (NSNumber)_convertStringToNumber:(uint64_t)a1
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v3 = (char *)[a2 UTF8String];
  uint64_t v8 = 0;
  if (strchr(v3, 46))
  {
    double v4 = strtod_l(v3, &v8, 0);
    if (!v8
      || v8 == v3
      || *v8
      || (uint64_t result = +[NSNumber numberWithDouble:v4]) == 0)
    {
LABEL_10:
      uint64_t v7 = +[NSDecimalNumber decimalNumberWithString:](NSDecimalNumber, "decimalNumberWithString:", a2, v4, v8, v9);
      if ([(NSDecimalNumber *)v7 isEqual:+[NSDecimalNumber notANumber]])
      {
        return 0;
      }
      else
      {
        return (NSNumber *)v7;
      }
    }
  }
  else
  {
    uint64_t v6 = strtoll_l(v3, &v8, 0, 0);
    if (!v8) {
      goto LABEL_10;
    }
    if (v8 == v3) {
      goto LABEL_10;
    }
    if (*v8) {
      goto LABEL_10;
    }
    uint64_t result = +[NSNumber numberWithLongLong:v6];
    if (!result) {
      goto LABEL_10;
    }
  }
  return result;
}

+ (id)castObject:(id)a3 toType:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return a3;
  }
  if (![@"Class" isEqualToString:a4])
  {
    if ([a4 isNSString])
    {
      id v11 = (NSString *)[a4 description];
      self;
      if (![*(id *)(_CFPredicatePolicyData() + 16) objectForKey:v11])
      {
        self;
        uint64_t v12 = _NSOSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v31 = a4;
          __int16 v32 = 2114;
          id v33 = a3;
          __int16 v34 = 2114;
          id v35 = a4;
          _os_log_fault_impl(&dword_181795000, v12, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSExpression CAST(x,'%{public}@') is deprecated and will be removed in a future release.  '%{public}@' should not be cast into the unknown type '%{public}@'", buf, 0x20u);
        }
        self;
        if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
      }
      Class v13 = NSClassFromString(v11);
      if (v13)
      {
        Class v14 = v13;
        if ([(objc_class *)v13 isSubclassOfClass:__NSStringClass]) {
          return (id)[a3 description];
        }
        if ([(objc_class *)v14 isSubclassOfClass:self])
        {
          if (_NSIsNSNumber())
          {
            long long v16 = (void *)MEMORY[0x1E4F1C9C8];
            [a3 doubleValue];
            return (id)objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
          }
          if (_NSIsNSString()) {
            return (id)[MEMORY[0x1E4F1C9C8] dateWithNaturalLanguageString:a3];
          }
          if (_NSIsNSDate()) {
            return a3;
          }
        }
        else
        {
          if ([(objc_class *)v14 isSubclassOfClass:self])
          {
            uint64_t v7 = +[NSDecimalNumber decimalNumberWithString:](NSDecimalNumber, "decimalNumberWithString:", [a3 description]);
            if (![(NSDecimalNumber *)v7 isEqual:+[NSDecimalNumber notANumber]])return v7; {
            goto LABEL_51;
            }
          }
          if (![(objc_class *)v14 isSubclassOfClass:self])
          {
            if ([(objc_class *)v14 isSubclassOfClass:self])
            {
              long long v18 = -[NSSymbolicExpression initWithString:]([NSSymbolicExpression alloc], "initWithString:", [a3 description]);
            }
            else
            {
              if (!class_respondsToSelector(v14, sel_initWithString_)) {
                goto LABEL_51;
              }
              self;
              long long v19 = _NSOSLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543874;
                id v31 = a4;
                __int16 v32 = 2114;
                id v33 = a3;
                __int16 v34 = 2114;
                id v35 = a4;
                _os_log_fault_impl(&dword_181795000, v19, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSExpression CAST(x,'%{public}@') is deprecated and will be removed in a future release.  '%{public}@' should not be cast into type '%{public}@' through initWithString", buf, 0x20u);
              }
              self;
              if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
                +[_NSPredicateUtilities _predicateSecurityAction]();
              }
              uint64_t v20 = (NSSymbolicExpression *)NSAllocateObject(v14, 0, 0);
              -[NSSymbolicExpression initWithString:](v20, "initWithString:", [a3 description]);
              long long v18 = v20;
            }
            return v18;
          }
          if (_NSIsNSDate())
          {
            [a3 timeIntervalSinceReferenceDate];
            return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          }
          if (_NSIsNSString())
          {
            uint64_t v7 = (NSDecimalNumber *)+[_NSPredicateUtilities _convertStringToNumber:]((uint64_t)_NSPredicateUtilities, a3);
            if (v7) {
              return v7;
            }
          }
          else if (_NSIsNSNumber())
          {
            return a3;
          }
        }
LABEL_51:
        uint64_t v21 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v22 = *MEMORY[0x1E4F1C3B8];
        double v23 = +[NSString stringWithFormat:@"Don't know how to cast (%@) into type \"%@\"", a3, a4];
        uint64_t v24 = v21;
        uint64_t v25 = v22;
        goto LABEL_58;
      }
      long long v28 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v27 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = +[NSString stringWithFormat:@"Cannot cast to class \"%@\" which does not exist", a4];
    }
    else
    {
      long long v28 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v27 = *MEMORY[0x1E4F1C3B8];
      uint64_t v29 = +[NSString stringWithFormat:@"Cannot cast to unknown class \"%@\"", a4];
    }
    double v23 = v29;
    uint64_t v24 = v28;
    goto LABEL_57;
  }
  self;
  uint64_t v6 = _NSOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = a3;
    _os_log_fault_impl(&dword_181795000, v6, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSExpression CAST(x,'Class') is deprecated and will be removed in a future release.  '%{public}@' should not be cast into a Class object", buf, 0xCu);
  }
  self;
  if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
    +[_NSPredicateUtilities _predicateSecurityAction]();
  }
  if (![a3 isNSString]) {
    goto LABEL_53;
  }
  self;
  if ([(id)_CFPredicatePolicyRestrictedClasses() objectForKey:a3])
  {
    +[_NSPredicateUtilities _predicateSecurityAction]();
LABEL_53:
    uint64_t v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = *MEMORY[0x1E4F1C3B8];
    double v23 = +[NSString stringWithFormat:@"Cannot cast non string value \"%@\"", a3];
    uint64_t v24 = v26;
LABEL_57:
    uint64_t v25 = v27;
LABEL_58:
    objc_exception_throw((id)[v24 exceptionWithName:v25 reason:v23 userInfo:0]);
  }
  uint64_t v7 = (NSDecimalNumber *)NSClassFromString((NSString *)a3);
  if (v7)
  {
    self;
    if (![*(id *)(_CFPredicatePolicyData() + 16) objectForKey:a3])
    {
      Superclass = class_getSuperclass((Class)v7);
      if (Superclass)
      {
        uint64_t v9 = [[NSString alloc] initWithUTF8String:class_getName(Superclass)];
        self;
        uint64_t v10 = [(id)_CFPredicatePolicyRestrictedClasses() objectForKey:v9];

        if (v10) {
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
      }
    }
  }
  return v7;
}

+ (id)random
{
  if ((_nspredicaterandomnumberseeded & 1) == 0)
  {
    srandomdev();
    _nspredicaterandomnumberseeded = 1;
  }
  double v2 = (double)random() * 4.65661287e-10;

  return +[NSNumber numberWithDouble:v2];
}

+ (id)randomn:(id)a3
{
  if ((_nspredicaterandomnumberseeded & 1) == 0)
  {
    srandomdev();
    _nspredicaterandomnumberseeded = 1;
  }
  uint64_t v4 = random();
  uint64_t v5 = v4 % [a3 longValue];

  return +[NSNumber numberWithLong:v5];
}

+ (id)now
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

+ (id)distanceToLocation:(id)a3 fromLocation:(id)a4
{
  if (!objc_lookUpClass("CLLocation"))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    uint64_t v9 = @"Can't calculate distance unless CLLocation is linked.";
LABEL_9:
    objc_exception_throw((id)[v7 exceptionWithName:v8 reason:v9 userInfo:0]);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = @"Can't calculate distance between non-locations";
    goto LABEL_9;
  }
  [a3 distanceFromLocation:a4];

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

+ (id)canonical:(id)a3
{
  if ((_NSIsNSString() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't canonicalize non-strings" userInfo:0]);
  }
  id v4 = +[_NSPredicateOperatorUtilities newStringFrom:a3 usingUnicodeTransforms:387];

  return v4;
}

+ (id)bitwiseOr:(id)a3 with:(id)a4
{
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't do bit operators on non-numbers" userInfo:0]);
  }
  uint64_t v6 = [a3 integerValue];
  uint64_t v7 = [a4 integerValue] | v6;

  return +[NSNumber numberWithInteger:v7];
}

+ (id)bitwiseXor:(id)a3 with:(id)a4
{
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't do bit operators on non-numbers" userInfo:0]);
  }
  uint64_t v6 = [a3 integerValue];
  uint64_t v7 = [a4 integerValue] ^ v6;

  return +[NSNumber numberWithInteger:v7];
}

+ (id)leftshift:(id)a3 by:(id)a4
{
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't do bit operators on non-numbers" userInfo:0]);
  }
  uint64_t v6 = [a3 integerValue];
  uint64_t v7 = v6 << [a4 integerValue];

  return +[NSNumber numberWithInteger:v7];
}

+ (id)rightshift:(id)a3 by:(id)a4
{
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't do bit operators on non-numbers" userInfo:0]);
  }
  uint64_t v6 = [a3 integerValue];
  uint64_t v7 = v6 >> [a4 integerValue];

  return +[NSNumber numberWithInteger:v7];
}

+ (id)onesComplement:(id)a3
{
  if ((_NSIsNSNumber() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't do bit operators on non-numbers" userInfo:0]);
  }
  uint64_t v4 = ~[a3 integerValue];

  return +[NSNumber numberWithInteger:v4];
}

+ (id)indexed:(id)a3 by:(id)a4
{
  return a3;
}

+ (id)distinct:(id)a3
{
}

+ (id)inverseOrderKey:(id)a3
{
}

+ (id)_predicateClassesForSecureCoding
{
  if (qword_1EB1ED928 != -1) {
    dispatch_once(&qword_1EB1ED928, &__block_literal_global_59);
  }
  return (id)_MergedGlobals_133;
}

@end