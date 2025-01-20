@interface BWTiledEspressoInferenceAdapter
+ (void)initialize;
- (id)inferenceProviderForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7;
@end

@implementation BWTiledEspressoInferenceAdapter

- (id)inferenceProviderForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  if ((a3 - 159) < 2)
  {
    v10 = off_1E5C1E870;
    goto LABEL_7;
  }
  if ((a3 - 170) < 2)
  {
    v10 = off_1E5C1EB20;
    goto LABEL_7;
  }
  if (a3 == 107)
  {
    v10 = off_1E5C1EB10;
LABEL_7:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      a5 = 0;
    }
    v11 = (void *)[objc_alloc(*v10) initWithConfiguration:a5 resourceProvider:a6];
    if (a7) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v11 = 0;
  if (a7) {
LABEL_10:
  }
    *a7 = 0;
LABEL_11:
  return v11;
}

+ (void)initialize
{
}

@end