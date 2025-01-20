@interface PMLMutableDenseVector(Equivalence)
- (BOOL)isEqualToPMLMutableDenseVector:()Equivalence;
- (uint64_t)isEqual:()Equivalence;
@end

@implementation PMLMutableDenseVector(Equivalence)

- (uint64_t)isEqual:()Equivalence
{
  id v4 = a3;
  v5 = v4;
  if (v4 == a1)
  {
    uint64_t v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [a1 isEqualToPMLMutableDenseVector:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToPMLMutableDenseVector:()Equivalence
{
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5 == [v4 count])
  {
    if ([a1 count])
    {
      unint64_t v6 = 0;
      do
      {
        [a1 valueAt:v6];
        float v8 = v7;
        [v4 valueAt:v6];
        BOOL v10 = v8 == v9;
        if (v8 != v9) {
          break;
        }
        ++v6;
      }
      while (v6 < [a1 count]);
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

@end