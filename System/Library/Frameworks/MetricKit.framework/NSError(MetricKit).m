@interface NSError(MetricKit)
+ (id)_defaultDescriptionForMXErrorCode:()MetricKit;
+ (id)errorWithMXErrorCode:()MetricKit;
@end

@implementation NSError(MetricKit)

+ (id)_defaultDescriptionForMXErrorCode:()MetricKit
{
  v4 = [MEMORY[0x263F086E0] mainBundle];
  v5 = v4;
  if (a3 > 5)
  {
    v6 = 0;
  }
  else
  {
    v6 = [v4 localizedStringForKey:off_2647ED240[a3] value:&stru_26DB027A0 table:0];
  }

  return v6;
}

+ (id)errorWithMXErrorCode:()MetricKit
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = [a1 alloc];
  uint64_t v10 = *MEMORY[0x263F08320];
  v6 = [(objc_class *)a1 _defaultDescriptionForMXErrorCode:a3];
  v11[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = (void *)[v5 initWithDomain:@"MXErrorDomain" code:a3 userInfo:v7];

  return v8;
}

@end