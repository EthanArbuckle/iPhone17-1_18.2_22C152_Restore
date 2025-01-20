@interface NSLayoutConstraintDiffConstraints
@end

@implementation NSLayoutConstraintDiffConstraints

uint64_t ___NSLayoutConstraintDiffConstraints_block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2 == a3) {
    return 0;
  }
  unint64_t v5 = [a2 _constraintValueHashIncludingConstant:0 includeOtherMutableProperties:0];
  unint64_t v6 = [a3 _constraintValueHashIncludingConstant:0 includeOtherMutableProperties:0];
  if (v5 < v6) {
    return -2;
  }
  if (v5 > v6) {
    return 2;
  }
  if ([a2 _isEqualToConstraintValue:a3 includingConstant:0 includeOtherMutableProperties:0])
  {
    [a2 constant];
    double v9 = v8;
    [a3 constant];
    if (v9 < v10) {
      return -1;
    }
    else {
      return v9 > v10;
    }
  }
  else if (a2 < a3)
  {
    return -2;
  }
  else
  {
    return 2;
  }
}

@end