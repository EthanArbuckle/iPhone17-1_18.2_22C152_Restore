@interface CLEmergencyEnablementAssertion
+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4;
+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4;
+ (id)newAssertionWithBundleId:(id)a3 bundlePath:(id)a4 reason:(id)a5 overrideDeauthorizationForBeneficiary:(BOOL)a6;
+ (id)newAssertionWithReason:(id)a3;
@end

@implementation CLEmergencyEnablementAssertion

+ (id)newAssertionWithBundleId:(id)a3 bundlePath:(id)a4 reason:(id)a5 overrideDeauthorizationForBeneficiary:(BOOL)a6
{
  return sub_1906F6730((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6);
}

+ (id)newAssertionWithReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0055E0);
  }
  v4 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
  {
    int v7 = 68289026;
    int v8 = 0;
    __int16 v9 = 2082;
    v10 = "";
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Non-specific CLEmergencyEnablementAssertion is no longer supported #CLEEA\"}", (uint8_t *)&v7, 0x12u);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0055E0);
    }
  }
  v5 = qword_1EB2713E0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
  {
    int v7 = 68289026;
    int v8 = 0;
    __int16 v9 = 2082;
    v10 = "";
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Non-specific CLEmergencyEnablementAssertion is no longer supported #CLEEA", "{\"msg%{public}.0s\":\"Non-specific CLEmergencyEnablementAssertion is no longer supported #CLEEA\"}", (uint8_t *)&v7, 0x12u);
  }
  return sub_1906F6730((uint64_t)&stru_1EE006720, (uint64_t)&stru_1EE006720, (uint64_t)a3, 0);
}

+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4
{
  id v5 = (id)[a3 copy];

  return sub_1906F6730((uint64_t)v5, (uint64_t)&stru_1EE006720, (uint64_t)a4, 0);
}

+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4
{
  id v5 = (id)objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "copy");

  return sub_1906F6730((uint64_t)&stru_1EE006720, (uint64_t)v5, (uint64_t)a4, 0);
}

@end