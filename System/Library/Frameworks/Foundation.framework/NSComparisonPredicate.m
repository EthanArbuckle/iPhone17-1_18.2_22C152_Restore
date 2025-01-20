@interface NSComparisonPredicate
+ (BOOL)supportsSecureCoding;
+ (NSComparisonPredicate)predicateWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs customSelector:(SEL)selector;
+ (NSComparisonPredicate)predicateWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs modifier:(NSComparisonPredicateModifier)modifier type:(NSPredicateOperatorType)type options:(NSComparisonPredicateOptions)options;
+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftExpression:(id)a4 rightExpression:(id)a5;
+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightKeyPath:(id)a5;
+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightValue:(id)a5;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSComparisonPredicate)initWithCoder:(NSCoder *)coder;
- (NSComparisonPredicate)initWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs customSelector:(SEL)selector;
- (NSComparisonPredicate)initWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs modifier:(NSComparisonPredicateModifier)modifier type:(NSPredicateOperatorType)type options:(NSComparisonPredicateOptions)options;
- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftExpression:(id)a4 rightExpression:(id)a5;
- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightKeyPath:(id)a5;
- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightValue:(id)a5;
- (NSComparisonPredicate)predicateWithSubstitutionVariables:(id)a3;
- (NSComparisonPredicateModifier)comparisonPredicateModifier;
- (NSComparisonPredicateOptions)options;
- (NSExpression)leftExpression;
- (NSExpression)rightExpression;
- (NSPredicateOperatorType)predicateOperatorType;
- (SEL)customSelector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generateMetadataDescription;
- (id)keyPathExpressionForString:(id)a3;
- (id)predicateFormat;
- (id)predicateOperator;
- (unint64_t)hash;
- (void)_acceptExpressions:(id)a3 flags:(unint64_t)a4;
- (void)_acceptOperator:(id)a3 flags:(unint64_t)a4;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPredicateOperator:(id)a3;
@end

@implementation NSComparisonPredicate

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  v7 = (void *)MEMORY[0x185308110](self, a2);
  if ((a4 & 4) != 0) {
    [a3 visitPredicate:self];
  }
  if ((a4 & 0xA) == 0xA) {
    [(NSComparisonPredicate *)self _acceptOperator:a3 flags:a4];
  }
  if (a4) {
    [(NSComparisonPredicate *)self _acceptExpressions:a3 flags:a4];
  }
  if ((a4 & 0xA) == 2) {
    [(NSComparisonPredicate *)self _acceptOperator:a3 flags:a4];
  }
  if ((a4 & 4) == 0) {
    [a3 visitPredicate:self];
  }
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (![(NSPredicate *)self _allowsEvaluation]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This predicate has evaluation disabled" userInfo:0]);
  }
  v7 = (void *)MEMORY[0x185308110]();
  if (!a4 || (v8 = (id *)a4, object_getClass(a4) != (Class)_NSNestedDictionary))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = (objc_class *)objc_opt_class();
    v8 = (id *)&v19;
    object_setClass(&v19, v9);
    *(void *)&long long v20 = a4;
  }
  v10 = [(NSComparisonPredicate *)self leftExpression];
  id v11 = [(NSComparisonPredicate *)self predicateOperator];
  uint64_t v12 = [v11 operatorType];
  if (v12 == 11)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = 4211063755;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = [(NSExpression *)v10 expressionValueWithObject:a3 context:v8];
  id v15 = [(NSExpression *)[(NSComparisonPredicate *)self rightExpression] expressionValueWithObject:a3 context:v8];
  if (v12 == 11)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(void *)(StatusReg + 704) = v13;
    char v17 = [v11 performOperationUsingObject:v14 andObject:v15];
    *(void *)(StatusReg + 704) = 0;
  }
  else
  {
    char v17 = [v11 performOperationUsingObject:v14 andObject:v15];
  }
  if (v8 != a4) {

  }
  return v17;
}

- (id)predicateOperator
{
  return self->_predicateOperator;
}

- (NSExpression)leftExpression
{
  v2 = self->_lhs;

  return v2;
}

- (NSExpression)rightExpression
{
  v2 = self->_rhs;

  return v2;
}

- (void)_acceptExpressions:(id)a3 flags:(unint64_t)a4
{
  [(NSExpression *)[(NSComparisonPredicate *)self leftExpression] acceptVisitor:a3 flags:a4];
  v7 = [(NSComparisonPredicate *)self rightExpression];

  [(NSExpression *)v7 acceptVisitor:a3 flags:a4];
}

- (void)_acceptOperator:(id)a3 flags:(unint64_t)a4
{
  id v6 = [(NSComparisonPredicate *)self predicateOperator];

  [v6 acceptVisitor:a3 flags:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPredicateOperatorType)predicateOperatorType
{
  id v2 = [(NSComparisonPredicate *)self predicateOperator];

  return [v2 operatorType];
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "hash");
  uint64_t v4 = [(NSExpression *)[(NSComparisonPredicate *)self leftExpression] hash] ^ v3;
  return v4 ^ [(NSExpression *)[(NSComparisonPredicate *)self rightExpression] hash];
}

- (NSComparisonPredicateOptions)options
{
  id v2 = [(NSComparisonPredicate *)self predicateOperator];

  return [v2 options];
}

- (NSComparisonPredicate)initWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs modifier:(NSComparisonPredicateModifier)modifier type:(NSPredicateOperatorType)type options:(NSComparisonPredicateOptions)options
{
  id v10 = +[NSPredicateOperator _newOperatorWithType:type modifier:modifier options:options];
  id v11 = [(NSComparisonPredicate *)self initWithPredicateOperator:v10 leftExpression:lhs rightExpression:rhs];

  return v11;
}

- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftExpression:(id)a4 rightExpression:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4 || !a5)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Cannot create a comparison predicate with nil operator or expression." userInfo:0]);
  }
  v10.receiver = self;
  v10.super_class = (Class)NSComparisonPredicate;
  v8 = [(NSComparisonPredicate *)&v10 init];
  if (v8)
  {
    v8->_predicateOperator = (NSPredicateOperator *)a3;
    v8->_lhs = (NSExpression *)a4;
    v8->_rhs = (NSExpression *)a5;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  self->_lhs = 0;
  self->_rhs = 0;

  self->_predicateOperator = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSComparisonPredicate;
  [(NSComparisonPredicate *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSComparisonPredicate;
  [(NSPredicate *)&v5 encodeWithCoder:a3];
  objc_msgSend(a3, "encodeObject:forKey:", -[NSComparisonPredicate leftExpression](self, "leftExpression"), @"NSLeftExpression");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSComparisonPredicate rightExpression](self, "rightExpression"), @"NSRightExpression");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSComparisonPredicate predicateOperator](self, "predicateOperator"), @"NSPredicateOperator");
}

- (NSComparisonPredicate)predicateWithSubstitutionVariables:(id)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  }
  objc_super v5 = (void *)MEMORY[0x185308110](self, a2);
  uint64_t v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredicateOperator:leftExpression:rightExpression:", -[NSComparisonPredicate predicateOperator](self, "predicateOperator"), -[NSExpression _expressionWithSubstitutionVariables:](-[NSComparisonPredicate leftExpression](self, "leftExpression"), "_expressionWithSubstitutionVariables:", a3), -[NSExpression _expressionWithSubstitutionVariables:](-[NSComparisonPredicate rightExpression](self, "rightExpression"), "_expressionWithSubstitutionVariables:", a3));

  return (NSComparisonPredicate *)v6;
}

- (void)allowEvaluation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NSExpression *)self->_lhs allowEvaluation];
  [(NSExpression *)self->_rhs allowEvaluation];
  v3.receiver = self;
  v3.super_class = (Class)NSComparisonPredicate;
  [(NSPredicate *)&v3 allowEvaluation];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator", a3), "copy");
  objc_super v5 = (void *)[(NSExpression *)[(NSComparisonPredicate *)self leftExpression] copy];
  uint64_t v6 = (void *)[(NSExpression *)[(NSComparisonPredicate *)self rightExpression] copy];
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPredicateOperator:v4 leftExpression:v5 rightExpression:v6];

  return v7;
}

- (id)predicateFormat
{
  objc_super v3 = +[NSString stringWithFormat:@"%@ %@ %@", [(NSComparisonPredicate *)self leftExpression], [(NSComparisonPredicate *)self predicateOperator], [(NSComparisonPredicate *)self rightExpression]];
  if ([(NSComparisonPredicate *)self comparisonPredicateModifier] == NSAllPredicateModifier)
  {
    uint64_t v4 = @"ALL ";
  }
  else
  {
    NSComparisonPredicateModifier v5 = [(NSComparisonPredicate *)self comparisonPredicateModifier];
    uint64_t v4 = &stru_1ECA5C228;
    if (v5 == NSAnyPredicateModifier) {
      uint64_t v4 = @"ANY ";
    }
  }
  return +[NSString stringWithFormat:@"%@%@", v4, v3];
}

- (NSComparisonPredicateModifier)comparisonPredicateModifier
{
  id v2 = [(NSComparisonPredicate *)self predicateOperator];

  return [v2 modifier];
}

- (NSComparisonPredicate)initWithCoder:(NSCoder *)coder
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (![(NSCoder *)coder allowsKeyedCoding])
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v13.receiver = self;
  v13.super_class = (Class)NSComparisonPredicate;
  NSComparisonPredicateModifier v5 = [(NSPredicate *)&v13 initWithCoder:coder];
  if (v5)
  {
    uint64_t v6 = [(NSCoder *)coder allowedClasses];
    uint64_t v7 = [(NSSet *)v6 count];
    if (v7)
    {
      id v8 = (id)[(NSSet *)v6 mutableCopy];
      objc_msgSend(v8, "unionSet:", +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding](_NSPredicateUtilities, "_extendedExpressionClassesForSecureCoding"));
      id v9 = (id)[(NSSet *)v6 mutableCopy];
      objc_msgSend(v9, "unionSet:", +[_NSPredicateUtilities _operatorClassesForSecureCoding](_NSPredicateUtilities, "_operatorClassesForSecureCoding"));
    }
    else
    {
      id v8 = +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding];
      id v9 = +[_NSPredicateUtilities _operatorClassesForSecureCoding];
    }
    v5->_lhs = (NSExpression *)[(NSCoder *)coder decodeObjectOfClasses:v8 forKey:@"NSLeftExpression"];
    v5->_rhs = (NSExpression *)[(NSCoder *)coder decodeObjectOfClasses:v8 forKey:@"NSRightExpression"];
    v5->_predicateOperator = (NSPredicateOperator *)[(NSCoder *)coder decodeObjectOfClasses:v9 forKey:@"NSPredicateOperator"];
    if (objc_opt_isKindOfClass())
    {
      if (objc_opt_isKindOfClass())
      {
        if (objc_opt_isKindOfClass())
        {
          objc_super v10 = 0;
          if (!v7)
          {
LABEL_16:
            if (v10)
            {

              objc_exception_throw(v10);
            }
            return v5;
          }
LABEL_15:

          goto LABEL_16;
        }
        uint64_t v11 = @"Malformed comparison predicate (bad operator)";
      }
      else
      {
        uint64_t v11 = @"Malformed comparison predicate (bad right expression)";
      }
    }
    else
    {
      uint64_t v11 = @"Malformed comparison predicate (bad left expression)";
    }
    objc_super v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v11 userInfo:0];
    if (!v7) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "isEqual:", objc_msgSend(a3, "predicateOperator"))|| !-[NSExpression isEqual:](-[NSComparisonPredicate leftExpression](self, "leftExpression"), "isEqual:", objc_msgSend(a3, "leftExpression")))
  {
    return 0;
  }
  NSComparisonPredicateModifier v5 = [(NSComparisonPredicate *)self rightExpression];
  uint64_t v6 = [a3 rightExpression];

  return [(NSExpression *)v5 isEqual:v6];
}

+ (NSComparisonPredicate)predicateWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs modifier:(NSComparisonPredicateModifier)modifier type:(NSPredicateOperatorType)type options:(NSComparisonPredicateOptions)options
{
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithLeftExpression:lhs rightExpression:rhs modifier:modifier type:type options:options];

  return (NSComparisonPredicate *)v7;
}

- (void)setPredicateOperator:(id)a3
{
  predicateOperator = self->_predicateOperator;
  if (predicateOperator != a3)
  {

    self->_predicateOperator = (NSPredicateOperator *)a3;
  }
}

+ (NSComparisonPredicate)predicateWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs customSelector:(SEL)selector
{
  NSComparisonPredicateModifier v5 = (void *)[objc_alloc((Class)a1) initWithLeftExpression:lhs rightExpression:rhs customSelector:selector];

  return (NSComparisonPredicate *)v5;
}

- (NSComparisonPredicate)initWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs customSelector:(SEL)selector
{
  id v8 = [[NSCustomPredicateOperator alloc] initWithCustomSelector:selector modifier:0];
  id v9 = [(NSComparisonPredicate *)self initWithPredicateOperator:v8 leftExpression:lhs rightExpression:rhs];

  return v9;
}

+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightValue:(id)a5
{
  NSComparisonPredicateModifier v5 = (void *)[objc_alloc((Class)a1) initWithPredicateOperator:a3 leftKeyPath:a4 rightValue:a5];

  return (NSComparisonPredicate *)v5;
}

+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightKeyPath:(id)a5
{
  NSComparisonPredicateModifier v5 = (void *)[objc_alloc((Class)a1) initWithPredicateOperator:a3 leftKeyPath:a4 rightKeyPath:a5];

  return (NSComparisonPredicate *)v5;
}

+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftExpression:(id)a4 rightExpression:(id)a5
{
  NSComparisonPredicateModifier v5 = (void *)[objc_alloc((Class)a1) initWithPredicateOperator:a3 leftExpression:a4 rightExpression:a5];

  return (NSComparisonPredicate *)v5;
}

- (id)keyPathExpressionForString:(id)a3
{
  id v3 = +[NSExpression _newKeyPathExpressionForString:a3];

  return v3;
}

- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightKeyPath:(id)a5
{
  id v8 = [[NSKeyPathExpression alloc] initWithKeyPath:[(NSComparisonPredicate *)self keyPathExpressionForString:a4]];
  id v9 = [[NSKeyPathExpression alloc] initWithKeyPath:[(NSComparisonPredicate *)self keyPathExpressionForString:a5]];
  objc_super v10 = [(NSComparisonPredicate *)self initWithPredicateOperator:a3 leftExpression:v8 rightExpression:v9];

  return v10;
}

- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightValue:(id)a5
{
  id v8 = [[NSKeyPathExpression alloc] initWithKeyPath:[(NSComparisonPredicate *)self keyPathExpressionForString:a4]];
  id v9 = [[NSConstantValueExpression alloc] initWithObject:a5];
  objc_super v10 = [(NSComparisonPredicate *)self initWithPredicateOperator:a3 leftExpression:v8 rightExpression:v9];

  return v10;
}

- (SEL)customSelector
{
  id v2 = [(NSComparisonPredicate *)self predicateOperator];

  return (SEL)[v2 selector];
}

- (id)generateMetadataDescription
{
  NSPredicateOperatorType v3 = [(NSComparisonPredicate *)self predicateOperatorType];
  unint64_t v4 = v3;
  if (v3 > NSCustomSelectorPredicateOperatorType)
  {
    if (v3 - 99 >= 2)
    {
      id v8 = +[NSString stringWithFormat:@"Unknown type of NSComparisonPredicate given to NSMetadataQuery (%@)", self];
      goto LABEL_80;
    }
  }
  else if (((1 << v3) & 0x7BF) == 0)
  {
    if (v3 == NSMatchesPredicateOperatorType) {
      id v8 = +[NSString stringWithFormat:@"NSMatchesPredicateOperatorType NSComparisonPredicate not allowed to NSMetadataQuery (%@)", self];
    }
    else {
      id v8 = +[NSString stringWithFormat:@"NSCustomSelectorPredicateOperatorType NSComparisonPredicate not allowed to NSMetadataQuery (%@)", self];
    }
    goto LABEL_80;
  }
  NSComparisonPredicateModifier v5 = [(NSComparisonPredicate *)self leftExpression];
  uint64_t v6 = [(NSExpression *)v5 expressionType];
  if (v6 != 3)
  {
    if (v6 == 15)
    {
      uint64_t v7 = @"*";
      switch(v4)
      {
        case 0uLL:
          id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSLessThanPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)", self];
          goto LABEL_80;
        case 1uLL:
          id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSLessThanOrEqualToPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)", self];
          goto LABEL_80;
        case 2uLL:
          id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSGreaterThanPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)", self];
          goto LABEL_80;
        case 3uLL:
          id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSGreaterThanOrEqualToPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)", self];
          goto LABEL_80;
        case 5uLL:
          id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSNotEqualToPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)", self];
          goto LABEL_80;
        default:
          goto LABEL_8;
      }
    }
    id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with left expression which is not NSKeyPathExpressionType or NSAnyKeyExpressionType given to NSMetadataQuery (%@)", self];
LABEL_80:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0]);
  }
  uint64_t v7 = [(NSExpression *)v5 keyPath];
LABEL_8:
  id v9 = [(NSComparisonPredicate *)self rightExpression];
  uint64_t v10 = [(NSExpression *)v9 expressionType];
  if (v10 && v10 != 14)
  {
    id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with right expression which is not NSConstantValueExpressionType or NSAggregateExpressionType given to NSMetadataQuery (%@)", self];
    goto LABEL_80;
  }
  id v11 = [(NSExpression *)v9 constantValue];
  if (_NSIsNSString())
  {
    uint64_t v12 = "*";
    uint64_t v13 = 4;
    unint64_t v14 = v4 - 7;
    id v15 = "*";
    v16 = "";
    char v17 = "";
    switch(v14)
    {
      case 0uLL:
        goto LABEL_38;
      case 1uLL:
        id v15 = "";
        uint64_t v13 = 4;
        goto LABEL_37;
      case 2uLL:
        id v15 = "*";
        uint64_t v13 = 4;
        uint64_t v12 = "";
        goto LABEL_37;
      case 3uLL:
        goto LABEL_37;
      default:
        if ("" != (char *)99)
        {
          uint64_t v12 = "";
          id v15 = "";
          uint64_t v13 = (uint64_t)"";
        }
LABEL_37:
        id v11 = (id)objc_msgSend(v11, "__escapeString5991");
        v16 = v12;
        char v17 = v15;
LABEL_38:
        char v28 = [(NSComparisonPredicate *)self options];
        v29 = "c";
        if ((v28 & 1) == 0) {
          v29 = "";
        }
        v30 = "d";
        if ((v28 & 2) == 0) {
          v30 = "";
        }
        v31 = "w";
        if ((v28 & 0x10) == 0) {
          v31 = "";
        }
        long long v24 = +[NSString stringWithFormat:@"'%s%@%s'%s%s%s", v17, v11, v16, v29, v30, v31];
        unint64_t v4 = v13;
        break;
    }
    goto LABEL_45;
  }
  if (_NSIsNSNumber())
  {
    if (!(!v19 & v18))
    {
      switch(v4)
      {
        case 7uLL:
          id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSLikePredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)", self];
          goto LABEL_80;
        case 8uLL:
          id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSBeginsWithPredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)", self];
          goto LABEL_80;
        case 9uLL:
          id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSEndsWithPredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)", self];
          goto LABEL_80;
        case 0xAuLL:
          id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSInPredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)", self];
          goto LABEL_80;
        default:
          goto LABEL_81;
      }
    }
    if (v4 == 99)
    {
      id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSContainsPredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)", self];
      goto LABEL_80;
    }
    long long v20 = (NSString *)[v11 description];
LABEL_25:
    long long v24 = v20;
LABEL_45:
    switch(v4)
    {
      case 0uLL:
        id result = +[NSString stringWithFormat:@"%@ < %@", v7, v24, v33];
        break;
      case 1uLL:
        id result = +[NSString stringWithFormat:@"%@ <= %@", v7, v24, v33];
        break;
      case 2uLL:
        id result = +[NSString stringWithFormat:@"%@ > %@", v7, v24, v33];
        break;
      case 3uLL:
        id result = +[NSString stringWithFormat:@"%@ >= %@", v7, v24, v33];
        break;
      case 4uLL:
        id result = +[NSString stringWithFormat:@"%@ == %@", v7, v24, v33];
        break;
      case 5uLL:
        id result = +[NSString stringWithFormat:@"%@ != %@", v7, v24, v33];
        break;
      default:
        if (v4 == 100)
        {
          uint64_t v27 = 0;
          return +[NSString stringWithFormat:@"InRange(%@,%@,%@)", v7, v24, v27];
        }
        id result = 0;
        break;
    }
    return result;
  }
  if (_NSIsNSDate())
  {
    if (!(!v22 & v21))
    {
      switch(v4)
      {
        case 7uLL:
          id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSLikePredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)", self];
          break;
        case 8uLL:
          id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSBeginsWithPredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)", self];
          break;
        case 9uLL:
          id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSEndsWithPredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)", self];
          break;
        case 0xAuLL:
          id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSInPredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)", self];
          break;
        default:
LABEL_81:
          JUMPOUT(0);
      }
      goto LABEL_80;
    }
    if (v4 == 99)
    {
      id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSContainsPredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)", self];
      goto LABEL_80;
    }
    [v11 timeIntervalSinceReferenceDate];
    long long v20 = +[NSString stringWithFormat:@"%f", v23];
    goto LABEL_25;
  }
  if (!_NSIsNSArray())
  {
    id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with a right expression which is not a string, number, or date given to NSMetadataQuery (%@)", self];
    goto LABEL_80;
  }
  if (v4 != 100)
  {
    id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with type other than NSBetweenPredicateOperatorType and right expression which is an array given to NSMetadataQuery (%@)", self];
    goto LABEL_80;
  }
  if ([v11 count] != 2)
  {
    id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSBetweenPredicateOperatorType and right expression which is an array with an invalid count given to NSMetadataQuery (%@)", self];
    goto LABEL_80;
  }
  uint64_t v25 = (void *)[v11 objectAtIndex:0];
  v26 = (void *)[v11 objectAtIndex:1];
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
  {
    id v8 = +[NSString stringWithFormat:@"NSComparisonPredicate with NSBetweenPredicateOperatorType and right expression which is an array containing other than numbers given to NSMetadataQuery (%@)", self];
    goto LABEL_80;
  }
  long long v24 = (NSString *)[v25 description];
  uint64_t v27 = [v26 description];
  return +[NSString stringWithFormat:@"InRange(%@,%@,%@)", v7, v24, v27];
}

@end