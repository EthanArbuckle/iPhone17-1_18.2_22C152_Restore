@interface DESAdaptiveClipping
+ (BOOL)computeClippingIndicator:(id)a3 clippingBound:(float)a4 scale:(float)a5 clippingIndicator:(float *)a6;
@end

@implementation DESAdaptiveClipping

+ (BOOL)computeClippingIndicator:(id)a3 clippingBound:(float)a4 scale:(float)a5 clippingIndicator:(float *)a6
{
  id v9 = a3;
  v10 = v9;
  if (!a6)
  {
    v14 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[DESAdaptiveClipping computeClippingIndicator:clippingBound:scale:clippingIndicator:](v14);
    }
    goto LABEL_33;
  }
  BOOL v11 = (LODWORD(a5) & 0x7FFFFFFFu) - 1 < 0x7FFFFF;
  BOOL v12 = ((LODWORD(a5) & 0x7FFFFFFFu) - 0x800000) >> 24 < 0x7F;
  if (a5 >= 0.0)
  {
    BOOL v12 = 0;
    BOOL v11 = 0;
  }
  if ((LODWORD(a5) & 0x7FFFFFFF) == 0) {
    BOOL v11 = 1;
  }
  int v13 = (LODWORD(a5) & 0x7FFFFFFF) == 0x7F800000 || v11;
  if ((v13 | v12) == 1)
  {
    v14 = [NSString stringWithFormat:@"Malformed scale for clipping indicator, should be a positive floating point number"];
    v15 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  double v22 = sqrt(a4 * a4 - a5 * a5);
  if (v22 == INFINITY || *(void *)&v22 == 0)
  {
    v14 = [NSString stringWithFormat:@"Malformed deltaClippingBound for clipping indicator, should be a positive floating point number"];
    v15 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  id v24 = v9;
  uint64_t v25 = [v24 bytes];
  unint64_t v26 = [v24 length];
  float v27 = 0.0;
  if (v26 >= 4)
  {
    unint64_t v28 = 0;
    double v29 = 0.0;
    do
    {
      double v29 = v29 + (float)(*(float *)(v25 + 4 * v28) * *(float *)(v25 + 4 * v28));
      ++v28;
    }
    while (v28 < (unint64_t)[v24 length] >> 2);
    float v27 = v29;
  }
  float v30 = sqrtf(v27);
  if (fabsf(v30) == INFINITY)
  {
    v33 = NSString;
    v34 = objc_msgSend(NSNumber, "numberWithFloat:");
    v14 = [v33 stringWithFormat:@"Failed to calculate L2 norm from result: %@", v34];

    v15 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
LABEL_31:
    }
      +[DESAdaptiveClipping computeClippingIndicator:clippingBound:scale:clippingIndicator:]((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_32:

LABEL_33:
    BOOL v32 = 0;
    goto LABEL_34;
  }
  if (v22 < v30) {
    float v31 = -a5;
  }
  else {
    float v31 = a5;
  }
  *a6 = v31;
  BOOL v32 = 1;
LABEL_34:

  return v32;
}

+ (void)computeClippingIndicator:(os_log_t)log clippingBound:scale:clippingIndicator:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Unexpected null pointer passed in for adaptive clipping indicator", v1, 2u);
}

+ (void)computeClippingIndicator:(uint64_t)a3 clippingBound:(uint64_t)a4 scale:(uint64_t)a5 clippingIndicator:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end