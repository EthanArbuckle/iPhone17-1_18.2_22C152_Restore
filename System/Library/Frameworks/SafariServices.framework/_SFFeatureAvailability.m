@interface _SFFeatureAvailability
+ (BOOL)_isEligibleForDomain:(unint64_t)a3;
+ (BOOL)isBrowserSelectionSheetEligible;
+ (BOOL)isHSWADisabled;
+ (BOOL)isTabBarAvailableForScreenSize:(CGSize)a3;
+ (BOOL)isYttriumEligible;
+ (BOOL)supportsCVV;
+ (void)supportsCVV;
@end

@implementation _SFFeatureAvailability

+ (BOOL)isBrowserSelectionSheetEligible
{
  return [a1 _isEligibleForDomain:8];
}

+ (BOOL)_isEligibleForDomain:(unint64_t)a3
{
  int domain_answer = os_eligibility_get_domain_answer();
  v4 = WBS_LOG_CHANNEL_PREFIXViewService();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (domain_answer)
  {
    if (v5)
    {
      +[_SFFeatureAvailability _isEligibleForDomain:](domain_answer, v4);
LABEL_6:
      LOBYTE(v5) = 0;
    }
  }
  else if (v5)
  {
    +[_SFFeatureAvailability _isEligibleForDomain:](v4);
    goto LABEL_6;
  }
  return v5;
}

+ (BOOL)isTabBarAvailableForScreenSize:(CGSize)a3
{
  BOOL v3 = fmin(a3.width, a3.height) > 375.0;
  return fmax(a3.width, a3.height) >= 812.0 || v3;
}

+ (BOOL)supportsCVV
{
  if (!MGGetBoolAnswer()) {
    return 0;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  id v7 = 0;
  char v3 = [v2 canEvaluatePolicy:2 error:&v7];
  id v4 = v7;
  if (v4)
  {
    BOOL v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[_SFFeatureAvailability supportsCVV];
    }
  }

  return v3;
}

+ (BOOL)isHSWADisabled
{
  return [a1 _isEligibleForDomain:5];
}

+ (BOOL)isYttriumEligible
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    LOBYTE(v3) = [a1 _isEligibleForDomain:40];
  }
  return v3;
}

+ (void)supportsCVV
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Encountered error when determining can evaluate policy: %{public}@", (uint8_t *)&v5, 0xCu);
}

+ (void)_isEligibleForDomain:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Unable to determine eligibility", v1, 2u);
}

+ (void)_isEligibleForDomain:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "Error when determining eligibility, error (%d)", (uint8_t *)v2, 8u);
}

@end