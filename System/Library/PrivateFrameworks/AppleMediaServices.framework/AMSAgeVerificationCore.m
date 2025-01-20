@interface AMSAgeVerificationCore
+ (BOOL)_isAgeVerificationNeededForExpiration:(id)a3 at:(id)a4;
+ (BOOL)_isTimestamp:(id)a3 validAsOf:(id)a4;
+ (id)_ageVerificationPresentationResultFromVerificationResult:(id)a3;
+ (id)_momentOfExpiryFrom:(id)a3;
+ (id)_resultForAccountVerificationExpirationTimestamp:(id)a3 withBagControlledAgeVerificationRequired:(id)a4 bagWarningThresholdDays:(id)a5 at:(id)a6;
+ (id)_timestampForWarningThresholdDays:(id)a3 addedTo:(id)a4;
@end

@implementation AMSAgeVerificationCore

+ (id)_resultForAccountVerificationExpirationTimestamp:(id)a3 withBagControlledAgeVerificationRequired:(id)a4 bagWarningThresholdDays:(id)a5 at:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  v14 = objc_alloc_init(AMSAgeVerificationRequiredResult);
  [(AMSAgeVerificationRequiredResult *)v14 setRequiredType:1];
  char v15 = [v13 BOOLValue];

  if ((v15 & 1) == 0) {
    goto LABEL_4;
  }
  if ([a1 _isAgeVerificationNeededForExpiration:v10 at:v12])
  {
    [(AMSAgeVerificationRequiredResult *)v14 setRequiredType:2];
LABEL_4:
    v16 = v14;
    goto LABEL_8;
  }
  v17 = [(id)objc_opt_class() _timestampForWarningThresholdDays:v11 addedTo:v12];
  if ([a1 _isAgeVerificationNeededForExpiration:v10 at:v17]) {
    [(AMSAgeVerificationRequiredResult *)v14 setRequiredType:3];
  }
  v18 = v14;

LABEL_8:
  return v14;
}

+ (id)_timestampForWarningThresholdDays:(id)a3 addedTo:(id)a4
{
  id v5 = a4;
  if (a3) {
    uint64_t v6 = [a3 integerValue];
  }
  else {
    uint64_t v6 = 30;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v7 setDay:v6];
  v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v8 dateByAddingComponents:v7 toDate:v5 options:0];

  return v9;
}

+ (BOOL)_isAgeVerificationNeededForExpiration:(id)a3 at:(id)a4
{
  return [a1 _isTimestamp:a3 validAsOf:a4] ^ 1;
}

+ (BOOL)_isTimestamp:(id)a3 validAsOf:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _momentOfExpiryFrom:a3];
  if (v7) {
    BOOL v8 = [v6 compare:v7] == -1;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)_momentOfExpiryFrom:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(objc_msgSend(v3, "longLongValue") / 1000));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_ageVerificationPresentationResultFromVerificationResult:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AMSPromiseResult);
  id v5 = objc_alloc_init(AMSAgeVerificationPresentationResult);
  id v6 = AMSError(6, @"Age verification screen dismissed without successful age verification", 0, 0);
  id v7 = AMSError(0, @"Invalid age verification result", 0, 0);
  uint64_t v8 = [v3 requiredType];

  if (v8 == 1 || v8 == 3)
  {
    [(AMSAgeVerificationPresentationResult *)v5 setSuccessType:1];
    [(AMSPromiseResult *)v4 setResult:v5];
  }
  else
  {
    if (v8 == 2) {
      v9 = v6;
    }
    else {
      v9 = v7;
    }
    [(AMSPromiseResult *)v4 setError:v9];
  }

  return v4;
}

@end