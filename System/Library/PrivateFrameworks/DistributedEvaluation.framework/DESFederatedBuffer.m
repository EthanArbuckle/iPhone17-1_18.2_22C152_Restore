@interface DESFederatedBuffer
+ (id)computeApproximateStaleness:(double)a3 stalenessScale:(id)a4 stalenessBias:(id)a5;
+ (id)computeDownScalingFactor:(id)a3 approximateStaleness:(id)a4;
@end

@implementation DESFederatedBuffer

+ (id)computeApproximateStaleness:(double)a3 stalenessScale:(id)a4 stalenessBias:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [MEMORY[0x1E4F1C9C8] now];
  [v9 timeIntervalSince1970];
  double v11 = v10 - a3;

  if (v11 < 0.0)
  {
    v12 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[DESFederatedBuffer computeApproximateStaleness:stalenessScale:stalenessBias:]();
    }
LABEL_23:

    v21 = 0;
    goto LABEL_24;
  }
  [v7 doubleValue];
  if (v13 <= 0.0)
  {
    v12 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[DESFederatedBuffer computeApproximateStaleness:stalenessScale:stalenessBias:].cold.4(v12);
    }
    goto LABEL_23;
  }
  double v14 = v13;
  [v8 doubleValue];
  double v16 = v11 / v14 + v15;
  v17 = +[DESLogging coreChannel];
  v12 = v17;
  if ((*(uint64_t *)&v16 <= -1 || ((*(void *)&v16 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(void *)&v16 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(void *)&v16 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[DESFederatedBuffer computeApproximateStaleness:stalenessScale:stalenessBias:]();
    }
    goto LABEL_23;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    +[DESFederatedBuffer computeApproximateStaleness:stalenessScale:stalenessBias:]();
  }

  v21 = [NSNumber numberWithDouble:v16];
LABEL_24:

  return v21;
}

+ (id)computeDownScalingFactor:(id)a3 approximateStaleness:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v8 = v6;
  if (!v5)
  {
    double v12 = 1.0;
LABEL_11:
    double v16 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[DESFederatedBuffer computeDownScalingFactor:approximateStaleness:]();
    }

    double v15 = [NSNumber numberWithDouble:v12];
    goto LABEL_14;
  }
  [v6 doubleValue];
  long double v10 = v9 + 1.0;
  [v5 doubleValue];
  double v12 = pow(v10, v11);
  double v7 = fabs(v12);
  if (v12 >= 1.0 && v7 != INFINITY) {
    goto LABEL_11;
  }
  double v14 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    +[DESFederatedBuffer computeDownScalingFactor:approximateStaleness:]();
  }

  double v15 = 0;
LABEL_14:

  return v15;
}

+ (void)computeApproximateStaleness:stalenessScale:stalenessBias:.cold.1()
{
  v0 = objc_msgSend(NSNumber, "numberWithDouble:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BECCB000, v1, v2, "Invalid time delta for approximate staleness: %@", v3, v4, v5, v6, v7);
}

+ (void)computeApproximateStaleness:stalenessScale:stalenessBias:.cold.2()
{
  v0 = objc_msgSend(NSNumber, "numberWithDouble:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BECCB000, v1, v2, "Approximate staleness for Federated Buffer: %@", v3, v4, v5, v6, v7);
}

+ (void)computeApproximateStaleness:stalenessScale:stalenessBias:.cold.3()
{
  v0 = objc_msgSend(NSNumber, "numberWithDouble:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BECCB000, v1, v2, "Invalid approximate staleness: %@", v3, v4, v5, v6, v7);
}

+ (void)computeApproximateStaleness:(os_log_t)log stalenessScale:stalenessBias:.cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Approximate staleness scale should be greater than zero", v1, 2u);
}

+ (void)computeDownScalingFactor:approximateStaleness:.cold.1()
{
  v0 = objc_msgSend(NSNumber, "numberWithDouble:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BECCB000, v1, v2, "Down-scaling factor for Federated Buffer: %@", v3, v4, v5, v6, v7);
}

+ (void)computeDownScalingFactor:approximateStaleness:.cold.2()
{
  v0 = objc_msgSend(NSNumber, "numberWithDouble:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BECCB000, v1, v2, "Invalid down-scaling factor %@", v3, v4, v5, v6, v7);
}

@end