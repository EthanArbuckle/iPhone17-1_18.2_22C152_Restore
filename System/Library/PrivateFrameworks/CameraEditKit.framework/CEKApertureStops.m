@interface CEKApertureStops
+ (BOOL)isValidApertureIndex:(unint64_t)a3;
+ (BOOL)isValidApertureIndexFullStop:(unint64_t)a3;
+ (id)closestValidValueForAperture:(double)a3;
+ (id)validApertureValues;
+ (unint64_t)firstFullStopIndexAfterOrIncludingIndex:(unint64_t)a3;
+ (unint64_t)indexOfClosestValidValueForAperture:(double)a3;
@end

@implementation CEKApertureStops

uint64_t __56__CEKApertureStops_indexOfClosestValidValueForAperture___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 doubleValue];
  double v9 = vabdd_f64(v8, *(double *)(a1 + 48));
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v9 >= *(double *)(v10 + 24))
  {
    *a4 = 1;
  }
  else
  {
    *(double *)(v10 + 24) = v9;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

+ (id)closestValidValueForAperture:(double)a3
{
  v4 = [(id)objc_opt_class() validApertureValues];
  v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend((id)objc_opt_class(), "indexOfClosestValidValueForAperture:", a3));

  return v5;
}

+ (unint64_t)indexOfClosestValidValueForAperture:(double)a3
{
  v4 = [(id)objc_opt_class() validApertureValues];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0x7FEFFFFFFFFFFFFFLL;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CEKApertureStops_indexOfClosestValidValueForAperture___block_invoke;
  v7[3] = &unk_1E63CDC28;
  *(double *)&v7[6] = a3;
  v7[4] = v8;
  v7[5] = &v9;
  [v4 enumerateObjectsUsingBlock:v7];
  unint64_t v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

+ (id)validApertureValues
{
  if (validApertureValues_onceToken != -1) {
    dispatch_once(&validApertureValues_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)validApertureValues_apertureValues;
  return v2;
}

void __39__CEKApertureStops_validApertureValues__block_invoke()
{
  v0 = (void *)validApertureValues_apertureValues;
  validApertureValues_apertureValues = (uint64_t)&unk_1F1A0FF38;
}

+ (unint64_t)firstFullStopIndexAfterOrIncludingIndex:(unint64_t)a3
{
  unint64_t v3 = ((a3 + 1) % 3) ^ 3;
  if (!((a3 + 1) % 3)) {
    unint64_t v3 = 0;
  }
  return v3 + a3;
}

+ (BOOL)isValidApertureIndexFullStop:(unint64_t)a3
{
  return [(id)objc_opt_class() firstFullStopIndexAfterOrIncludingIndex:a3] == a3;
}

+ (BOOL)isValidApertureIndex:(unint64_t)a3
{
  v4 = [(id)objc_opt_class() validApertureValues];
  LOBYTE(a3) = [v4 count] > a3;

  return a3;
}

@end