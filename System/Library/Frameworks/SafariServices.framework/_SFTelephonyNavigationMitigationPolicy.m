@interface _SFTelephonyNavigationMitigationPolicy
+ (double)test_suspiciousClassificationExpirationDuration;
- (BOOL)policyAppliesToURL:(id)a3;
- (SFDialogPresenting)dialogPresenter;
- (void)_checkIfSuspiciousClassificationHasExpiredAndTransitionIfNeeded;
- (void)_handleInput:(int64_t)a3;
- (void)handleNavigationToURL:(id)a3 completionHandler:(id)a4;
- (void)setDialogPresenter:(id)a3;
- (void)userAcceptedCallPrompt;
- (void)userDeclinedCallPrompt;
@end

@implementation _SFTelephonyNavigationMitigationPolicy

- (void)setDialogPresenter:(id)a3
{
}

- (BOOL)policyAppliesToURL:(id)a3
{
  id v3 = a3;
  if (([v3 isTelephonyURL] & 1) != 0
    || ([v3 isFaceTimeURL] & 1) != 0
    || ([v3 isFaceTimeAudioURL] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isFaceTimeMultiwayURL];
  }

  return v4;
}

- (void)handleNavigationToURL:(id)a3 completionHandler:(id)a4
{
  v8 = (void (**)(id, uint64_t))a4;
  [(_SFTelephonyNavigationMitigationPolicy *)self _checkIfSuspiciousClassificationHasExpiredAndTransitionIfNeeded];
  unint64_t classification = self->_classification;
  if (classification >= 2)
  {
    if (classification == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dialogPresenter);
      v7 = [MEMORY[0x1E4F78270] telephonyNavigationDialogWithCompletionHandler:v8];
      [WeakRetained presentDialog:v7 sender:self];
    }
  }
  else
  {
    v8[2](v8, 1);
  }
}

- (void)userAcceptedCallPrompt
{
}

- (void)userDeclinedCallPrompt
{
}

- (void)_checkIfSuspiciousClassificationHasExpiredAndTransitionIfNeeded
{
  if (self->_dateUserLastDeclined)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    char v4 = [(NSDate *)self->_dateUserLastDeclined dateByAddingTimeInterval:60.0];
    uint64_t v5 = [v3 compare:v4];

    if (v5 != -1)
    {
      dateUserLastDeclined = self->_dateUserLastDeclined;
      self->_dateUserLastDeclined = 0;

      [(_SFTelephonyNavigationMitigationPolicy *)self _handleInput:2];
    }
  }
}

- (void)_handleInput:(int64_t)a3
{
  [(_SFTelephonyNavigationMitigationPolicy *)self _checkIfSuspiciousClassificationHasExpiredAndTransitionIfNeeded];
  int64_t classification = self->_classification;
  uint64_t v6 = 2 * ((unint64_t)(a3 - 1) > 1);
  int64_t v7 = (unint64_t)(a3 - 3) < 0xFFFFFFFFFFFFFFFELL;
  if (classification) {
    int64_t v7 = self->_classification;
  }
  if (classification != 1) {
    uint64_t v6 = v7;
  }
  if (classification == 2) {
    int64_t v8 = 2 * (a3 != 1);
  }
  else {
    int64_t v8 = v6;
  }
  self->_int64_t classification = v8;
  if (!a3)
  {
    v9 = [MEMORY[0x1E4F1C9C8] date];
    dateUserLastDeclined = self->_dateUserLastDeclined;
    self->_dateUserLastDeclined = v9;
  }
}

+ (double)test_suspiciousClassificationExpirationDuration
{
  return 60.0;
}

- (SFDialogPresenting)dialogPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dialogPresenter);

  return (SFDialogPresenting *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dialogPresenter);

  objc_storeStrong((id *)&self->_dateUserLastDeclined, 0);
}

@end