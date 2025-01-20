@interface MKPuckAccuracyLayer
@end

@implementation MKPuckAccuracyLayer

id __45___MKPuckAccuracyLayer_setAccuracy_duration___block_invoke(id result, int a2)
{
  if (a2)
  {
    double v2 = *((double *)result + 5);
    uint64_t v3 = *((void *)result + 4);
    double v4 = *(double *)(v3 + 56);
    BOOL v5 = v2 < v4;
    double v6 = vabdd_f64(v2, v4);
    char v7 = v5;
    if (v6 < 0.01) {
      char v7 = 1;
    }
    *(unsigned char *)(v3 + 65) = v7;
    uint64_t v8 = *((void *)result + 4);
    if (*(unsigned char *)(v8 + 64)) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = *(unsigned __int8 *)(v8 + 65) != 0;
    }
    v10.receiver = (id)*((void *)result + 4);
    v10.super_class = (Class)_MKPuckAccuracyLayer;
    return objc_msgSendSuper2(&v10, sel_setHidden_, v9);
  }
  return result;
}

@end