@interface WKError
+ (id)errorWithCode:(int64_t)a3;
@end

@implementation WKError

+ (id)errorWithCode:(int64_t)a3
{
  v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  if ((unint64_t)(a3 - 1) > 5) {
    v6 = @"WatchKitErrorUnknownErrorMessage";
  }
  else {
    v6 = off_264599030[a3 - 1];
  }
  v7 = [MEMORY[0x263F086E0] bundleForClass:a1];
  uint64_t v8 = [v7 localizedStringForKey:v6 value:&stru_26D3103D0 table:@"Localizable"];

  if (v8) {
    v6 = (__CFString *)v8;
  }
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08320]];
  v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.watchkit.errors" code:a3 userInfo:v5];

  return v9;
}

@end