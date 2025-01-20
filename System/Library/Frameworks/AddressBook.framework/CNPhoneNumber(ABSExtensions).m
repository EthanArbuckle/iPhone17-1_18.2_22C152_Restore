@interface CNPhoneNumber(ABSExtensions)
+ (id)fullyQualifiedStringForStringValue:()ABSExtensions countryCode:;
@end

@implementation CNPhoneNumber(ABSExtensions)

+ (id)fullyQualifiedStringForStringValue:()ABSExtensions countryCode:
{
  id v5 = a3;
  id v6 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334E0] + 16))())
  {
    id v7 = v5;
  }
  else
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263EFEB28]) initWithStringValue:v5 countryCode:v6];
    id v7 = [v8 unformattedInternationalStringValue];
  }

  return v7;
}

@end