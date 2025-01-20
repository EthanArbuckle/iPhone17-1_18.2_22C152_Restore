@interface NSError(ADError)
- (uint64_t)initWithAdCode:()ADError andDescription:;
- (void)AD_Log:()ADError;
@end

@implementation NSError(ADError)

- (uint64_t)initWithAdCode:()ADError andDescription:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v6 = a4;
  if (v6) {
    v7 = v6;
  }
  else {
    v7 = &stru_1F270BEE0;
  }
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v9 = [a1 initWithDomain:@"com.apple.ap.adcore" code:a3 userInfo:v8];

  return v9;
}

- (void)AD_Log:()ADError
{
  v4 = NSString;
  id v5 = a3;
  id v7 = [a1 localizedDescription];
  v6 = [v4 stringWithFormat:@"%@", v7];
  _ADLog(v5, v6, 0);
}

@end