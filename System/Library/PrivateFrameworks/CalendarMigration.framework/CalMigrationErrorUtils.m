@interface CalMigrationErrorUtils
+ (id)errorFromException:(id)a3;
@end

@implementation CalMigrationErrorUtils

+ (id)errorFromException:(id)a3
{
  v15[5] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v14[0] = @"ExceptionName";
  v4 = [v3 name];
  v15[0] = v4;
  v14[1] = @"ExceptionReason";
  v5 = [v3 reason];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x263EFF9D0] null];
  }
  v15[1] = v6;
  v14[2] = @"ExceptionCallStackReturnAddresses";
  v7 = [v3 callStackReturnAddresses];
  v15[2] = v7;
  v14[3] = @"ExceptionCallStackSymbols";
  v8 = [v3 callStackSymbols];
  v15[3] = v8;
  v14[4] = @"ExceptionUserInfo";
  v9 = [v3 userInfo];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x263EFF9D0] null];
  }
  v15[4] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];
  if (!v9) {

  }
  if (!v5) {
  v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.calendar.MigrationErrors" code:2 userInfo:v11];
  }

  return v12;
}

@end