@interface LAPSPasscodeChangeSystemStubbedAdapter
- (BOOL)canChangePasscodeWithError:(id *)a3;
- (BOOL)hasPasscode;
- (id)lastPasscodeChange;
- (id)newPasscodeRequest;
- (id)oldPasscodeRequest;
- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5;
- (void)verifyNewPasscode:(id)a3 completion:(id)a4;
- (void)verifyPasscode:(id)a3 completion:(id)a4;
@end

@implementation LAPSPasscodeChangeSystemStubbedAdapter

- (id)oldPasscodeRequest
{
  v2 = objc_alloc_init(LAPSFetchOldPasscodeRequest);
  [(LAPSFetchOldPasscodeRequest *)v2 setFailedAttempts:0];
  v3 = +[LAPSPasscodeType numericSixDigitsType];
  [(LAPSFetchOldPasscodeRequest *)v2 setPasscodeType:v3];

  [(LAPSFetchOldPasscodeRequest *)v2 setBackoffTimeout:0];

  return v2;
}

- (id)newPasscodeRequest
{
  v2 = objc_alloc_init(LAPSFetchNewPasscodeRequest);
  v3 = __60__LAPSPasscodeChangeSystemStubbedAdapter_newPasscodeRequest__block_invoke();
  [(LAPSFetchNewPasscodeRequest *)v2 setAllowedPasscodeTypes:v3];

  v4 = +[LAPSPasscodeType numericSixDigitsType];
  [(LAPSFetchNewPasscodeRequest *)v2 setPasscodeType:v4];

  [(LAPSFetchNewPasscodeRequest *)v2 setIsPasscodeRecoverySupported:1];
  [(LAPSFetchNewPasscodeRequest *)v2 setIsPasscodeRecoveryRestricted:0];
  [(LAPSFetchNewPasscodeRequest *)v2 setIsPasscodeRecoveryEnabled:1];
  return v2;
}

id __60__LAPSPasscodeChangeSystemStubbedAdapter_newPasscodeRequest__block_invoke()
{
  v8[4] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFF9D8];
  v1 = +[LAPSPasscodeType numericFourDigitsType];
  v8[0] = v1;
  v2 = +[LAPSPasscodeType numericSixDigitsType];
  v8[1] = v2;
  v3 = +[LAPSPasscodeType numericCustomDigitsType];
  v8[2] = v3;
  v4 = +[LAPSPasscodeType alphanumericType];
  v8[3] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];
  v6 = [v0 orderedSetWithArray:v5];

  return v6;
}

- (id)lastPasscodeChange
{
  v2 = [MEMORY[0x263EFF910] now];
  v3 = [v2 dateByAddingTimeInterval:-86400.0];

  return v3;
}

- (BOOL)hasPasscode
{
  return 1;
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__LAPSPasscodeChangeSystemStubbedAdapter_verifyPasscode_completion___block_invoke;
  v10[3] = &unk_26506EE10;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_after(v7, MEMORY[0x263EF83A0], v10);
}

void __68__LAPSPasscodeChangeSystemStubbedAdapter_verifyPasscode_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) passcode];
  int v3 = [v2 isEqualToString:@"111111"];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v3)
  {
    id v5 = *(void (**)(uint64_t, void))(v4 + 16);
    v5(v4, 0);
  }
  else
  {
    id v6 = +[LAPSErrorBuilder invalidPasscodeErrorWithFailedAttemptsCount:1];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

- (void)verifyNewPasscode:(id)a3 completion:(id)a4
{
  id v4 = a4;
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__LAPSPasscodeChangeSystemStubbedAdapter_verifyNewPasscode_completion___block_invoke;
  block[3] = &unk_26506EE38;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x263EF83A0], block);
}

uint64_t __71__LAPSPasscodeChangeSystemStubbedAdapter_verifyNewPasscode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  return 1;
}

- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5
{
  id v5 = a5;
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__LAPSPasscodeChangeSystemStubbedAdapter_changePasscode_to_completion___block_invoke;
  block[3] = &unk_26506EE38;
  id v9 = v5;
  id v7 = v5;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

uint64_t __71__LAPSPasscodeChangeSystemStubbedAdapter_changePasscode_to_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end