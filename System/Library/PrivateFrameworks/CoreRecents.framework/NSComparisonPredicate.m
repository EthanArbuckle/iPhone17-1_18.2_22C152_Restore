@interface NSComparisonPredicate
- (BOOL)cr_isInvalidComparisonPredicate;
- (id)cr_sqlNameForFieldName:(id)a3;
- (void)cr_addToClause:(id)a3 usingOperator:(id)a4 bindings:(id)a5;
- (void)cr_processWithContext:(id)a3;
@end

@implementation NSComparisonPredicate

- (void)cr_processWithContext:(id)a3
{
  if ([(NSComparisonPredicate *)self cr_isInvalidComparisonPredicate]) {
    goto LABEL_6;
  }
  v5 = [(NSComparisonPredicate *)self leftExpression];
  v6 = [(NSComparisonPredicate *)self rightExpression];
  if ((id)[(NSExpression *)v5 expressionType] != (id)3) {
    goto LABEL_6;
  }
  id v7 = [(NSExpression *)v6 expressionType];
  if (v7)
  {
    if (v7 != (id)14) {
      goto LABEL_6;
    }
  }
  if ([(NSComparisonPredicate *)self comparisonPredicateModifier]) {
    goto LABEL_6;
  }
  NSPredicateOperatorType v8 = [(NSComparisonPredicate *)self predicateOperatorType];
  id v9 = [(NSExpression *)v5 cr_expressionValue];
  id v10 = [(NSExpression *)v6 cr_expressionValue];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !v9
    || [(NSComparisonPredicate *)self cr_isInvalidOperatorType:v8 forKeyPath:v9])
  {
    goto LABEL_6;
  }
  if (v8 == NSInPredicateOperatorType)
  {
    if ([v10 count])
    {
      if (![@"kind" caseInsensitiveCompare:v9]) {
        objc_msgSend(a3, "setWantsGroups:", objc_msgSend(v10, "containsObject:", CRAddressKindGroup) | objc_msgSend(a3, "wantsGroups"));
      }
      goto LABEL_16;
    }
LABEL_6:
    [a3 setHadError:1];
    return;
  }
LABEL_16:
  [a3 addPredicate:self forFieldName:v9];
}

- (void)cr_addToClause:(id)a3 usingOperator:(id)a4 bindings:(id)a5
{
  id v9 = [(NSComparisonPredicate *)self leftExpression];
  id v10 = [(NSComparisonPredicate *)self rightExpression];
  NSPredicateOperatorType v11 = [(NSComparisonPredicate *)self predicateOperatorType];
  NSPredicateOperatorType v12 = v11;
  CFStringRef v13 = @"%@%@ == ?";
  switch(v11)
  {
    case NSLessThanPredicateOperatorType:
      CFStringRef v13 = @"%@%@ < ?";
      goto LABEL_18;
    case NSLessThanOrEqualToPredicateOperatorType:
      CFStringRef v13 = @"%@%@ <= ?";
      goto LABEL_18;
    case NSGreaterThanPredicateOperatorType:
      CFStringRef v13 = @"%@%@ > ?";
      goto LABEL_18;
    case NSGreaterThanOrEqualToPredicateOperatorType:
      CFStringRef v13 = @"%@%@ >= ?";
      goto LABEL_18;
    case NSEqualToPredicateOperatorType:
      goto LABEL_18;
    case NSNotEqualToPredicateOperatorType:
      CFStringRef v13 = @"%@%@ != ?";
      goto LABEL_18;
    case NSMatchesPredicateOperatorType:
    case NSLikePredicateOperatorType:
    case NSBeginsWithPredicateOperatorType:
    case NSEndsWithPredicateOperatorType:
      goto LABEL_26;
    case NSInPredicateOperatorType:
      CFStringRef v13 = CFSTR("%@%@ IN (?");
      goto LABEL_18;
    case NSCustomSelectorPredicateOperatorType:
      v14 = [(NSComparisonPredicate *)self customSelector];
      if (sel_isEqual(v14, "tokenSearch:"))
      {
        uint64_t v15 = 5;
        CFStringRef v16 = @"cpsearch";
LABEL_14:
        v17 = +[NSString stringWithFormat:@"%%@%@(%%@, ?, %d)", v16, v15];
        goto LABEL_17;
      }
      if (sel_isEqual(v14, "prefixSearch:"))
      {
        uint64_t v15 = 2;
        CFStringRef v16 = @"icusearch";
        goto LABEL_14;
      }
      if (!sel_isEqual(v14, "phoneSearch:")) {
LABEL_26:
      }
        sub_10001B644();
      v17 = +[NSString stringWithFormat:@"%%@%@(%%@, ?, %ld)", @"phonesearch", 1];
LABEL_17:
      CFStringRef v13 = (const __CFString *)v17;
LABEL_18:
      objc_msgSend(a3, "appendFormat:", v13, a4, -[NSComparisonPredicate cr_sqlNameForFieldName:](self, "cr_sqlNameForFieldName:", objc_msgSend(objc_msgSend(-[NSExpression cr_expressionValue](v9, "cr_expressionValue"), "componentsSeparatedByString:", @"."), "objectAtIndex:", 0)));
      if (v12 == NSInPredicateOperatorType)
      {
        v18 = (char *)objc_msgSend(-[NSExpression cr_expressionValue](v10, "cr_expressionValue"), "count");
        if ((unint64_t)v18 >= 2)
        {
          v19 = v18 - 1;
          do
          {
            [a3 appendString:@",?"];
            --v19;
          }
          while (v19);
        }
        [a3 appendString:@""]);
      }
      id v20 = [(NSExpression *)v10 cr_sqlBindings];
      [a5 addObjectsFromArray:v20];
      return;
    default:
      if (v11 != NSBetweenPredicateOperatorType) {
        goto LABEL_26;
      }
      CFStringRef v13 = @"%@%@ BETWEEN ? AND ?";
      goto LABEL_18;
  }
}

- (id)cr_sqlNameForFieldName:(id)a3
{
  id v3 = sub_100006960((uint64_t)a3);
  return [v3 objectForKey:@"sql"];
}

- (BOOL)cr_isInvalidComparisonPredicate
{
  if (qword_100034530 != -1) {
    dispatch_once(&qword_100034530, &stru_10002D3B8);
  }
  NSPredicateOperatorType v3 = [(NSComparisonPredicate *)self predicateOperatorType];
  BOOL result = 0;
  if ((uint64_t)v3 <= (uint64_t)NSEndsWithPredicateOperatorType)
  {
    if (v3 < NSMatchesPredicateOperatorType) {
      return result;
    }
    return 1;
  }
  if (v3 != NSInPredicateOperatorType && v3 != NSBetweenPredicateOperatorType)
  {
    if (v3 == NSCustomSelectorPredicateOperatorType) {
      return objc_msgSend((id)qword_100034528, "containsObject:", NSStringFromSelector(-[NSComparisonPredicate customSelector](self, "customSelector"))) ^ 1;
    }
    return 1;
  }
  return result;
}

@end