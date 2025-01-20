@interface CADPropertyFilter(EKPredicateEvaluating)
- (uint64_t)ekPredicateFilterMatches:()EKPredicateEvaluating;
@end

@implementation CADPropertyFilter(EKPredicateEvaluating)

- (uint64_t)ekPredicateFilterMatches:()EKPredicateEvaluating
{
  id v4 = a3;
  unint64_t v5 = [a1 property];
  if (v5 > 0xE) {
    v6 = 0;
  }
  else {
    v6 = off_1E5B97808[v5];
  }
  v7 = [v4 valueForKeyPath:v6];

  if ([a1 isInteger])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "integerValue"));
  }
  else if ([a1 isString])
  {
    uint64_t v8 = [a1 stringValue];
  }
  else
  {
    if (([a1 isDate] & 1) == 0)
    {
      v9 = 0;
      BOOL v10 = v7 == 0;
      BOOL v11 = 1;
      goto LABEL_18;
    }
    uint64_t v8 = [a1 dateValue];
  }
  v9 = (void *)v8;
  BOOL v10 = v7 == 0;
  BOOL v11 = v8 == 0;
  if (v7 && v8)
  {
    uint64_t v12 = [v7 compare:v8];
    switch([a1 comparison])
    {
      case 0:
        BOOL v13 = v12 == 0;
        goto LABEL_25;
      case 1:
        BOOL v16 = v12 == 0;
        goto LABEL_29;
      case 2:
        BOOL v13 = v12 == -1;
        goto LABEL_25;
      case 3:
        BOOL v16 = v12 == 1;
        goto LABEL_29;
      case 4:
        BOOL v13 = v12 == 1;
LABEL_25:
        LOBYTE(a1) = v13;
        break;
      case 5:
        BOOL v16 = v12 == -1;
LABEL_29:
        LOBYTE(a1) = !v16;
        break;
      default:
        goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (v8 && !v7)
  {
    LOBYTE(a1) = 0;
    goto LABEL_32;
  }
LABEL_18:
  char v14 = [a1 comparison];
  char v15 = v10 ^ v11;
  if (((1 << v14) & 0x16) == 0) {
    char v15 = v10 ^ v11 ^ 1;
  }
  LOBYTE(a1) = v15;
LABEL_32:

  return a1 & 1;
}

@end