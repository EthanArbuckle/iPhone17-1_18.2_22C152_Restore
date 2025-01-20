@interface NSCompoundPredicate
+ (BOOL)supportsSecureCoding;
+ (NSCompoundPredicate)andPredicateWithSubpredicates:(NSArray *)subpredicates;
+ (NSCompoundPredicate)notPredicateWithSubpredicate:(NSPredicate *)predicate;
+ (NSCompoundPredicate)orPredicateWithSubpredicates:(NSArray *)subpredicates;
+ (id)_operatorForType:(unint64_t)a3;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)subpredicates;
- (NSCompoundPredicate)initWithCoder:(NSCoder *)coder;
- (NSCompoundPredicate)initWithType:(NSCompoundPredicateType)type subpredicates:(NSArray *)subpredicates;
- (NSCompoundPredicate)predicateWithSubstitutionVariables:(id)a3;
- (NSCompoundPredicateType)compoundPredicateType;
- (id)_copySubpredicateDescription:(id)a3;
- (id)_predicateOperator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generateMetadataDescription;
- (id)predicateFormat;
- (unint64_t)hash;
- (void)_acceptSubpredicates:(id)a3 flags:(unint64_t)a4;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSCompoundPredicate

- (unint64_t)hash
{
  v2 = [(NSCompoundPredicate *)self subpredicates];

  return [(NSArray *)v2 hash];
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(NSPredicate *)self _allowsEvaluation]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This predicate has evaluation disabled" userInfo:0]);
  }
  v7 = (void *)MEMORY[0x185308110]();
  if (!a4 || (v8 = (id *)a4, object_getClass(a4) != (Class)_NSNestedDictionary))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v9 = (objc_class *)objc_opt_class();
    v8 = (id *)&v14;
    object_setClass(&v14, v9);
    *(void *)&long long v15 = a4;
  }
  id v10 = [(NSCompoundPredicate *)self _predicateOperator];
  v11 = [(NSCompoundPredicate *)self subpredicates];
  char v12 = 0;
  if (v10 && v11) {
    char v12 = [v10 evaluatePredicates:v11 withObject:a3 substitutionVariables:v8];
  }
  if (v8 != a4) {

  }
  return v12;
}

- (NSArray)subpredicates
{
  v2 = self->_subpredicates;

  return v2;
}

- (id)_predicateOperator
{
  v3 = objc_opt_class();
  NSCompoundPredicateType v4 = [(NSCompoundPredicate *)self compoundPredicateType];

  return (id)[v3 _operatorForType:v4];
}

- (NSCompoundPredicateType)compoundPredicateType
{
  return self->_type;
}

+ (id)_operatorForType:(unint64_t)a3
{
  if (a3 == 2) {
    return +[NSCompoundPredicateOperator orPredicateOperator];
  }
  if (a3 == 1) {
    return +[NSCompoundPredicateOperator andPredicateOperator];
  }
  if (a3) {
    return 0;
  }
  return +[NSCompoundPredicateOperator notPredicateOperator];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)predicateFormat
{
  v3 = (void *)MEMORY[0x185308110](self, a2);
  uint64_t v4 = objc_msgSend(-[NSCompoundPredicate _predicateOperator](self, "_predicateOperator"), "description");
  v5 = [(NSCompoundPredicate *)self subpredicates];
  uint64_t v6 = [(NSArray *)v5 count];
  NSCompoundPredicateType v7 = [(NSCompoundPredicate *)self compoundPredicateType];
  NSCompoundPredicateType v8 = v7;
  if (v6 != 1)
  {
    if (v6)
    {
      uint64_t v25 = v6 - 1;
      char v12 = &stru_1ECA5C228;
      v13 = v12;
      uint64_t v14 = v6 - 2;
      v26 = v3;
      if (v6 == 2)
      {
        long long v19 = (NSString *)v12;
      }
      else
      {
        uint64_t v15 = 0;
        do
        {
          uint64_t v16 = [(NSArray *)v5 objectAtIndex:v15];
          long long v17 = (void *)MEMORY[0x185308110]();
          id v18 = [(NSCompoundPredicate *)self _copySubpredicateDescription:v16];
          long long v19 = [[NSString alloc] initWithFormat:@"%@%@ %@ ", v13, v18, v4];

          ++v15;
          v13 = v19;
        }
        while (v14 != v15);
      }
      id v22 = [(NSCompoundPredicate *)self _copySubpredicateDescription:[(NSArray *)v5 objectAtIndex:v14]];
      id v23 = [(NSCompoundPredicate *)self _copySubpredicateDescription:[(NSArray *)v5 objectAtIndex:v25]];
      uint64_t v20 = [[NSString alloc] initWithFormat:@"%@%@ %@ %@", v19, v22, v4, v23];

      v3 = v26;
      goto LABEL_18;
    }
    if (v7 == NSAndPredicateType)
    {
      v9 = NSTruePredicate;
    }
    else
    {
      if (v7 == NSNotPredicateType)
      {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't have a NOT predicate with no subpredicate." userInfo:0]);
      }
      v9 = NSFalsePredicate;
    }
    id v10 = [(__objc2_class *)v9 defaultInstance];
    goto LABEL_14;
  }
  id v10 = [(NSArray *)v5 objectAtIndex:0];
  v11 = v10;
  if (v8)
  {
LABEL_14:
    uint64_t v20 = (NSString *)(id)[(__objc2_class *)v10 predicateFormat];
    goto LABEL_18;
  }
  id v21 = [(NSCompoundPredicate *)self _copySubpredicateDescription:v10];
  uint64_t v20 = [[NSString alloc] initWithFormat:@"%@ %@", v4, v21];

LABEL_18:

  return v20;
}

- (id)_copySubpredicateDescription:(id)a3
{
  if (objc_opt_isKindOfClass()) {
    return -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", @"(%@)", [a3 description]);
  }
  v5 = (void *)[a3 description];

  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  self->_subpredicates = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCompoundPredicate;
  [(NSCompoundPredicate *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSCompoundPredicate;
  [(NSPredicate *)&v5 encodeWithCoder:a3];
  objc_msgSend(a3, "encodeObject:forKey:", -[NSCompoundPredicate subpredicates](self, "subpredicates"), @"NSSubpredicates");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType"), @"NSCompoundPredicateType");
}

- (void)allowEvaluation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  subpredicates = self->_subpredicates;
  uint64_t v4 = [(NSArray *)subpredicates countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(subpredicates);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) allowEvaluation];
      }
      uint64_t v5 = [(NSArray *)subpredicates countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v5);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSCompoundPredicate;
  [(NSPredicate *)&v8 allowEvaluation];
}

+ (NSCompoundPredicate)orPredicateWithSubpredicates:(NSArray *)subpredicates
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithType:2 subpredicates:subpredicates];

  return (NSCompoundPredicate *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(NSCompoundPredicate *)self subpredicates];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v9) copy];
        [v5 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v7);
  }
  long long v11 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:subpredicates:", -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType"), v5);

  return v11;
}

+ (NSCompoundPredicate)andPredicateWithSubpredicates:(NSArray *)subpredicates
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithType:1 subpredicates:subpredicates];

  return (NSCompoundPredicate *)v3;
}

- (NSCompoundPredicate)initWithType:(NSCompoundPredicateType)type subpredicates:(NSArray *)subpredicates
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (type == NSNotPredicateType && (!subpredicates || ![(NSArray *)subpredicates count])) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Tried to construct NSCompoundPredicate for NSNotPredicateType with %@", subpredicates), 0 reason userInfo]);
  }
  v10.receiver = self;
  v10.super_class = (Class)NSCompoundPredicate;
  uint64_t v7 = [(NSCompoundPredicate *)&v10 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_type = type;
    v7->_subpredicates = (NSArray *)[(NSArray *)subpredicates copy];
  }
  return v8;
}

- (NSCompoundPredicate)initWithCoder:(NSCoder *)coder
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(NSCoder *)coder allowsKeyedCoding])
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v16.receiver = self;
  v16.super_class = (Class)NSCompoundPredicate;
  uint64_t v5 = [(NSPredicate *)&v16 initWithCoder:coder];
  if (v5)
  {
    uint64_t v6 = [(NSCoder *)coder allowedClasses];
    uint64_t v7 = [(NSSet *)v6 count];
    if (v7)
    {
      id v8 = (id)[(NSSet *)v6 mutableCopy];
      objc_msgSend(v8, "unionSet:", +[_NSPredicateUtilities _compoundPredicateClassesForSecureCoding](_NSPredicateUtilities, "_compoundPredicateClassesForSecureCoding"));
    }
    else
    {
      id v8 = +[_NSPredicateUtilities _compoundPredicateClassesForSecureCoding];
    }
    v5->_type = [(NSCoder *)coder decodeIntegerForKey:@"NSCompoundPredicateType"];
    v5->_subpredicates = (NSArray *)[(NSCoder *)coder decodeObjectOfClasses:v8 forKey:@"NSSubpredicates"];
    if ((_NSIsNSSet() & 1) != 0
      || (_NSIsNSArray() & 1) != 0
      || (_NSIsNSOrderedSet() & 1) != 0
      || (uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:@"Malformed set expression (bad subpredicatees)" userInfo:0]) == 0)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      subpredicates = v5->_subpredicates;
      uint64_t v11 = [(NSArray *)subpredicates countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
LABEL_12:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(subpredicates);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [(NSArray *)subpredicates countByEnumeratingWithState:&v18 objects:v17 count:16];
            if (v12) {
              goto LABEL_12;
            }
            goto LABEL_18;
          }
        }
        uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:@"Malformed set expression (bad subpredicate)" userInfo:0];
        if (v7) {
          goto LABEL_20;
        }
        goto LABEL_21;
      }
LABEL_18:
      uint64_t v9 = 0;
    }
    if (v7) {
LABEL_20:
    }

LABEL_21:
    if (v9)
    {

      objc_exception_throw(v9);
    }
  }
  return v5;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  uint64_t v7 = (void *)MEMORY[0x185308110](self, a2);
  if ((a4 & 4) != 0)
  {
    [a3 visitPredicate:self];
    [(NSCompoundPredicate *)self _acceptSubpredicates:a3 flags:a4];
  }
  else
  {
    [(NSCompoundPredicate *)self _acceptSubpredicates:a3 flags:a4];
    [a3 visitPredicate:self];
  }
}

- (void)_acceptSubpredicates:(id)a3 flags:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(NSCompoundPredicate *)self subpredicates];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10++) acceptVisitor:a3 flags:a4];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v8);
  }
}

+ (NSCompoundPredicate)notPredicateWithSubpredicate:(NSPredicate *)predicate
{
  id v4 = objc_alloc((Class)a1);
  uint64_t v5 = objc_msgSend(v4, "initWithType:subpredicates:", 0, objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", predicate));

  return (NSCompoundPredicate *)v5;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  NSCompoundPredicateType v5 = [(NSCompoundPredicate *)self compoundPredicateType];
  if (v5 != [a3 compoundPredicateType]) {
    return 0;
  }
  uint64_t v6 = [(NSCompoundPredicate *)self subpredicates];
  uint64_t v7 = [a3 subpredicates];

  return [(NSArray *)v6 isEqual:v7];
}

- (NSCompoundPredicate)predicateWithSubstitutionVariables:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = (void *)MEMORY[0x185308110]();
  uint64_t v7 = [(NSCompoundPredicate *)self subpredicates];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
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
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11++), "predicateWithSubstitutionVariables:", a3));
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v9);
  }
  long long v12 = (NSCompoundPredicate *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:subpredicates:", -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType"), v5);

  return v12;
}

- (id)generateMetadataDescription
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  NSCompoundPredicateType v3 = [(NSCompoundPredicate *)self compoundPredicateType];
  id v4 = [(NSCompoundPredicate *)self subpredicates];
  id v5 = v4;
  if (v3 == NSOrPredicateType)
  {
    if ([(NSArray *)v4 count] <= 1)
    {
      long long v20 = +[NSString stringWithFormat:@"NSOrPredicateType NSCompoundPredicate with wrong number (%ld) of subpredicates given to NSMetadataQuery (%@)", [(NSArray *)v5 count], self];
      goto LABEL_32;
    }
    id v7 = (id)objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v8 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      char v10 = 0;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v5);
          }
          long long v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (v10) {
            [v7 appendString:@" || "];
          }
          [v7 appendFormat:@"(%@)", objc_msgSend(v13, "generateMetadataDescription")];
          char v10 = 1;
        }
        uint64_t v9 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v22 count:16];
      }
      while (v9);
    }
  }
  else
  {
    if (v3 != NSAndPredicateType)
    {
      if (v3)
      {
        long long v20 = +[NSString stringWithFormat:@"Unknown type of NSCompoundPredicate given to NSMetadataQuery (%@)", self, v21];
      }
      else
      {
        if ([(NSArray *)v4 count] == 1) {
          return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"! (%@)", objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", 0), "generateMetadataDescription"));
        }
        long long v20 = +[NSString stringWithFormat:@"NSNotPredicateType NSCompoundPredicate with wrong number (%ld) of subpredicates given to NSMetadataQuery (%@)", [(NSArray *)v5 count], self];
      }
LABEL_32:
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0]);
    }
    if ([(NSArray *)v4 count] <= 1)
    {
      long long v20 = +[NSString stringWithFormat:@"NSAndPredicateType NSCompoundPredicate with wrong number (%ld) of subpredicates given to NSMetadataQuery (%@)", [(NSArray *)v5 count], self];
      goto LABEL_32;
    }
    id v7 = (id)objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v14 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      char v16 = 0;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v5);
          }
          uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          if (v16) {
            [v7 appendString:@" && "];
          }
          [v7 appendFormat:@"(%@)", objc_msgSend(v19, "generateMetadataDescription")];
          char v16 = 1;
        }
        uint64_t v15 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v27 count:16];
      }
      while (v15);
    }
  }
  return +[NSString stringWithString:v7];
}

@end