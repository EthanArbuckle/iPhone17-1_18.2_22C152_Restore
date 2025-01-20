@interface CKDServerTrustCache
+ (BOOL)shouldRefetchTrusts;
+ (id)validatedTrusts;
+ (void)setFetchAttempt;
+ (void)setValidatedTrusts:(id)a3;
@end

@implementation CKDServerTrustCache

+ (void)setValidatedTrusts:(id)a3
{
}

+ (id)validatedTrusts
{
  return (id)qword_1EBBCFC68;
}

+ (void)setFetchAttempt
{
  qword_1EBBCFC70 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], a2, v2);
  MEMORY[0x1F41817F8]();
}

+ (BOOL)shouldRefetchTrusts
{
  if (!qword_1EBBCFC70) {
    return 1;
  }
  objc_msgSend_timeIntervalSinceNow((void *)qword_1EBBCFC70, a2, v2);
  if (v5 < -1800.0) {
    return 1;
  }
  if (qword_1EBBCFC68) {
    return 0;
  }
  objc_msgSend_timeIntervalSinceNow((void *)qword_1EBBCFC70, v3, v4);
  return v7 < -1.0;
}

@end