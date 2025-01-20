@interface HMI_CVML_Error
+ (id)createNSErrorWithStatus:(int64_t)a3 andMessage:(id)a4;
+ (id)createNSExceptionWithStatus:(int64_t)a3 andMessage:(id)a4;
@end

@implementation HMI_CVML_Error

+ (id)createNSErrorWithStatus:(int64_t)a3 andMessage:(id)a4
{
  v18[2] = *MEMORY[0x263EF8340];
  if (a3 == 128)
  {
    v4 = 0;
  }
  else
  {
    v6 = NSString;
    id v7 = a4;
    v8 = [v6 stringWithUTF8String:CVML_getModuleDescription(a3)];
    v9 = [v6 stringWithFormat:@"com.apple.cvml.%@", v8];

    v17[0] = *MEMORY[0x263F08320];
    v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 localizedStringForKey:v7 value:&stru_26D98B6C8 table:0];

    v18[0] = v11;
    v17[1] = *MEMORY[0x263F08338];
    v12 = [MEMORY[0x263F086E0] mainBundle];
    v13 = [NSString stringWithUTF8String:CVML_getStatusDescription(a3)];
    v14 = [v12 localizedStringForKey:v13 value:&stru_26D98B6C8 table:0];
    v18[1] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    v4 = [MEMORY[0x263F087E8] errorWithDomain:v9 code:a3 userInfo:v15];
  }
  return v4;
}

+ (id)createNSExceptionWithStatus:(int64_t)a3 andMessage:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  if (a3 == 128)
  {
    v4 = 0;
  }
  else
  {
    v6 = NSString;
    id v7 = a4;
    v8 = [v6 stringWithUTF8String:CVML_getModuleDescription(a3)];
    v9 = [v6 stringWithFormat:@"CVML module = %@", v8];

    uint64_t v18 = *MEMORY[0x263F08320];
    v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 localizedStringForKey:v9 value:&stru_26D98B6C8 table:0];
    v19[0] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

    v13 = (void *)MEMORY[0x263EFF940];
    v14 = [MEMORY[0x263F086E0] mainBundle];
    v15 = [NSString stringWithUTF8String:CVML_getStatusDescription(a3)];
    v16 = [v14 localizedStringForKey:v15 value:&stru_26D98B6C8 table:0];
    v4 = [v13 exceptionWithName:v16 reason:v7 userInfo:v12];
  }
  return v4;
}

@end