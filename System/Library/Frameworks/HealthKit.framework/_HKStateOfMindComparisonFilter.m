@interface _HKStateOfMindComparisonFilter
+ (BOOL)_isValidReflectiveInterval:(uint64_t)a1;
+ (BOOL)_isValidValence:(uint64_t)a1;
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7;
+ (id)_allowedValueClassesForLabelsAndDomains;
+ (id)_allowedValueClassesForReflectiveInterval;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (int64_t)enumRepresentationForKeyPath:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
- (uint64_t)_acceptsStateOfMindWithLabelsOrDomains:(void *)a1;
- (void)_acceptsStateOfMindWithReflectiveInterval:(void *)result;
- (void)_acceptsStateOfMindWithValence:(void *)result;
@end

@implementation _HKStateOfMindComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return [&unk_1EECE6B88 containsObject:a3];
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"reflectiveInterval"]
    || [v5 isEqualToString:@"valence"])
  {
    uint64_t v6 = +[_HKStateOfMindComparisonFilter _allowedValueClassesForReflectiveInterval]();
  }
  else if ([v5 isEqualToString:@"labels"] {
         || [v5 isEqualToString:@"domains"])
  }
  {
    uint64_t v6 = +[_HKStateOfMindComparisonFilter _allowedValueClassesForLabelsAndDomains]();
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKStateOfMindComparisonFilter.m" lineNumber:81 description:@"Unreachable code has been executed"];

    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  v8 = (void *)v6;

  return v8;
}

+ (id)_allowedValueClassesForReflectiveInterval
{
  v4[1] = *MEMORY[0x1E4F143B8];
  self;
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  v2 = [v0 setWithArray:v1];

  return v2;
}

+ (id)_allowedValueClassesForLabelsAndDomains
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self;
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);

  return v2;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v7 = a4;
  if ([v7 isEqualToString:@"reflectiveInterval"])
  {
    self;
    BOOL v8 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  else
  {
    if ([v7 isEqualToString:@"valence"])
    {
      self;
      BOOL v9 = a3 < 6;
      goto LABEL_13;
    }
    if (![v7 isEqualToString:@"labels"]
      && ![v7 isEqualToString:@"domains"])
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:a1 file:@"_HKStateOfMindComparisonFilter.m" lineNumber:97 description:@"Unreachable code has been executed"];

      BOOL v9 = 0;
      goto LABEL_13;
    }
    self;
    BOOL v8 = a3 == 4 || a3 == 10;
  }
  BOOL v9 = v8;
LABEL_13:

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS____HKStateOfMindComparisonFilter;
  if (!objc_msgSendSuper2(&v20, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v13, v14, a5, a6, a7))goto LABEL_11; {
  if (![v14 isEqualToString:@"reflectiveInterval"])
  }
  {
    if ([v14 isEqualToString:@"valence"])
    {
      char v15 = +[_HKStateOfMindComparisonFilter _isValidValence:]((uint64_t)a1, v13);
      goto LABEL_9;
    }
    if ([v14 isEqualToString:@"labels"]
      || [v14 isEqualToString:@"domains"])
    {
      uint64_t v16 = objc_opt_class();
      char v15 = HKIsValueOrContainerValidForOperatorType(a5, v13, v16, (uint64_t)a7);
      goto LABEL_9;
    }
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:a1 file:@"_HKStateOfMindComparisonFilter.m" lineNumber:119 description:@"Unreachable code has been executed"];

LABEL_11:
    BOOL v17 = 0;
    goto LABEL_12;
  }
  char v15 = +[_HKStateOfMindComparisonFilter _isValidReflectiveInterval:]((uint64_t)a1, v13);
LABEL_9:
  BOOL v17 = v15;
LABEL_12:

  return v17;
}

+ (BOOL)_isValidReflectiveInterval:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:sel__isValidReflectiveInterval_ object:v3 file:@"_HKStateOfMindComparisonFilter.m" lineNumber:173 description:@"Reflective interval can only be an NSNumber"];
  }
  uint64_t v4 = +[HKStateOfMind validateKind:](HKStateOfMind, "validateKind:", HKStateOfMindKindFromReflectiveInterval([v2 integerValue]));
  BOOL v5 = v4 == 0;

  return v5;
}

+ (BOOL)_isValidValence:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:sel__isValidValence_ object:v3 file:@"_HKStateOfMindComparisonFilter.m" lineNumber:220 description:@"Valence can only be an NSNumber"];
  }
  [v2 doubleValue];
  uint64_t v4 = +[HKStateOfMind validateValence:](HKStateOfMind, "validateValence:");
  BOOL v5 = v4 == 0;

  return v5;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"reflectiveInterval"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"valence"])
  {
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"labels"])
  {
    int64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"domains"])
  {
    int64_t v6 = 3;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKStateOfMindComparisonFilter.m" lineNumber:133 description:@"Unreachable code has been executed"];

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKStateOfMindComparisonFilter;
    int64_t v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    switch([(_HKComparisonFilter *)self keyPathIntegerValue])
    {
      case 0:
        unsigned __int8 v7 = -[_HKStateOfMindComparisonFilter _acceptsStateOfMindWithReflectiveInterval:](self, [v6 reflectiveInterval]);
        goto LABEL_7;
      case 1:
        [v6 valence];
        unsigned __int8 v7 = -[_HKStateOfMindComparisonFilter _acceptsStateOfMindWithValence:](self, v10);
LABEL_7:
        char v8 = v7;
        break;
      case 2:
        v11 = [v6 labels];
        goto LABEL_10;
      case 3:
        v11 = [v6 domains];
LABEL_10:
        v12 = v11;
        char v8 = -[_HKStateOfMindComparisonFilter _acceptsStateOfMindWithLabelsOrDomains:](self, v11);

        break;
      default:
        objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2 object:self file:@"_HKStateOfMindComparisonFilter.m" lineNumber:152 description:@"Unreachable code has been executed"];

        char v8 = 0;
        break;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)_acceptsStateOfMindWithReflectiveInterval:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = [result value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel__acceptsStateOfMindWithReflectiveInterval_ object:v3 file:@"_HKStateOfMindComparisonFilter.m" lineNumber:189 description:@"Our comparison filter on reflective interval must only store an NSNumber value"];
    }
    id v6 = [v3 value];
    unsigned __int8 v7 = [NSNumber numberWithInteger:a2];
    BOOL v8 = HKComparisonResultMatchesPredicateOperator([v7 compare:v6], objc_msgSend(v3, "operatorType"));

    return (void *)v8;
  }
  return result;
}

- (void)_acceptsStateOfMindWithValence:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = [result value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel__acceptsStateOfMindWithValence_ object:v3 file:@"_HKStateOfMindComparisonFilter.m" lineNumber:233 description:@"Our comparison filter on valence must only store an NSNumber value"];
    }
    id v6 = [v3 value];
    unsigned __int8 v7 = [NSNumber numberWithDouble:a2];
    BOOL v8 = HKComparisonResultMatchesPredicateOperator([v7 compare:v6], objc_msgSend(v3, "operatorType"));

    return (void *)v8;
  }
  return result;
}

- (uint64_t)_acceptsStateOfMindWithLabelsOrDomains:(void *)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1) {
    goto LABEL_20;
  }
  uint64_t v4 = [a1 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v6 = [a1 value];
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      v12 = [a1 value];
      objc_opt_class();
      char v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) == 0)
      {
        BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_super v9 = v8;
        double v10 = a1;
        uint64_t v11 = 279;
        goto LABEL_19;
      }
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = objc_msgSend(a1, "value", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          if ([v3 containsObject:*(void *)(*((void *)&v20 + 1) + 8 * i)])
          {

            uint64_t v7 = 1;
            goto LABEL_21;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    goto LABEL_20;
  }
  uint64_t v7 = [v3 containsObject:v6];

  if ([a1 operatorType] != 4)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v9 = v8;
    double v10 = a1;
    uint64_t v11 = 266;
LABEL_19:
    [v8 handleFailureInMethod:sel__acceptsStateOfMindWithLabelsOrDomains_ object:v10 file:@"_HKStateOfMindComparisonFilter.m" lineNumber:v11 description:@"Unreachable code has been executed"];

LABEL_20:
    uint64_t v7 = 0;
  }
LABEL_21:

  return v7;
}

@end