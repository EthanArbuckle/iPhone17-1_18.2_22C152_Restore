@interface SAError
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5 underlyingError:(id)a6;
@end

@implementation SAError

+ (id)errorWithCode:(int64_t)a3
{
  if (a3 < 4096)
  {
    switch(a3)
    {
      case 1:
        v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"SAErrorNotAuthorized";
        goto LABEL_11;
      case 2:
        v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"SAErrorNotAllowed";
        goto LABEL_11;
      case 3:
        v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"SAErrorInvalidArgument";
        goto LABEL_11;
      case 4:
        v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"SAErrorOperationFailed";
LABEL_11:
        v5 = [v6 localizedStringForKey:v8 value:&stru_26F9E5E48 table:0];

        break;
      default:
        v5 = 0;
        break;
    }
  }
  else if (((a3 == 4096) & os_variant_has_internal_content()) != 0)
  {
    v5 = @"Place holder for future private errors";
  }
  else
  {
    v5 = 0;
  }
  switch(a3)
  {
    case 4:
      v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v10 = v9;
      v11 = @"SAErrorOperationFailed";
      goto LABEL_18;
    case 2:
      v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v10 = v9;
      v11 = @"SAErrorNotAvailableRecovery";
      goto LABEL_18;
    case 1:
      v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v10 = v9;
      v11 = @"SAErrorNotAuthorizedRecovery";
LABEL_18:
      v12 = [v9 localizedStringForKey:v11 value:&stru_26F9E5E48 table:0];

      goto LABEL_20;
  }
  v12 = 0;
LABEL_20:
  v13 = [a1 errorWithCode:a3 description:v5 recoverySuggestion:v12];

  return v13;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5
{
  return (id)[a1 errorWithCode:a3 description:a4 recoverySuggestion:a5 underlyingError:0];
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5 underlyingError:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v13 = v12;
  if (v9) {
    [v12 setObject:v9 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  if (v10) {
    [v13 setObject:v10 forKeyedSubscript:*MEMORY[0x263F08348]];
  }
  if (v11) {
    [v13 setObject:v11 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  v14 = [MEMORY[0x263F087E8] errorWithDomain:SAErrorDomain code:a3 userInfo:v13];

  return v14;
}

@end