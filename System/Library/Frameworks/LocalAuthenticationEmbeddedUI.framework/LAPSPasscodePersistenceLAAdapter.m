@interface LAPSPasscodePersistenceLAAdapter
- (BOOL)canRemovePasscode:(id *)a3;
@end

@implementation LAPSPasscodePersistenceLAAdapter

- (BOOL)canRemovePasscode:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263F10468]);
  id v15 = 0;
  [v4 canEvaluatePolicy:1 error:&v15];
  id v5 = v15;
  if ([v5 code] == -7 || objc_msgSend(v5, "code") == -6)
  {
    v6 = LACLogPasscodeService();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v5;
      _os_log_impl(&dword_23F450000, v6, OS_LOG_TYPE_DEFAULT, "canRemovePasscode: YES (%@)", buf, 0xCu);
    }
    BOOL v7 = 1;
  }
  else
  {
    [v4 biometryType];
    v6 = NSLocalizedStringFromLACBiometryType();
    v16[0] = *MEMORY[0x263F07F80];
    v8 = [NSString stringWithFormat:@"Biometry Enrolled (%@)", v5];
    v17[0] = v8;
    v16[1] = *MEMORY[0x263F08320];
    v9 = +[LALocalizedString passcodeRemovalNotAllowedTitle:v6];
    v17[1] = v9;
    v16[2] = *MEMORY[0x263F08348];
    v10 = +[LALocalizedString passcodeRemovalNotAllowedText:v6];
    v16[3] = @"LAPSInteractiveErrorKey";
    v17[2] = v10;
    v17[3] = MEMORY[0x263EFFA88];
    v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
    v12 = +[LAPSErrorBuilder errorWithCode:8 userInfo:v11];

    if (a3) {
      *a3 = v12;
    }
    v13 = LACLogPasscodeService();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[LAPSPasscodePersistenceLAAdapter canRemovePasscode:]((uint64_t)v12, v13);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (void)canRemovePasscode:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F450000, a2, OS_LOG_TYPE_ERROR, "canRemovePasscode: NO (%@)", (uint8_t *)&v2, 0xCu);
}

@end