@interface HKWidthDesignationProvider
+ (int64_t)widthDesignationFromViewWidth:(double)a3;
@end

@implementation HKWidthDesignationProvider

+ (int64_t)widthDesignationFromViewWidth:(double)a3
{
  uint64_t v3 = llround(a3);
  if ((unint64_t)(v3 - 320) < 0x37) {
    return 1;
  }
  if (v3 > 1194) {
    return 6;
  }
  if ((unint64_t)(v3 - 982) < 0xD5) {
    return 5;
  }
  if ((unint64_t)(v3 - 727) < 0xFF) {
    return 4;
  }
  if ((unint64_t)(v3 - 461) < 0x10A) {
    return 3;
  }
  if ((unint64_t)(v3 - 375) < 0x56) {
    return 2;
  }
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
    +[HKWidthDesignationProvider widthDesignationFromViewWidth:](v6, a3);
  }
  return 1;
}

+ (void)widthDesignationFromViewWidth:(void *)a1 .cold.1(void *a1, double a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  int v5 = 138543618;
  id v6 = (id)objc_opt_class();
  __int16 v7 = 2050;
  double v8 = a2;
  id v4 = v6;
  _os_log_error_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: View with width outside defined width: (%{public}f)", (uint8_t *)&v5, 0x16u);
}

@end