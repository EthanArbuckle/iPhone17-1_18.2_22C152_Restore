@interface CLKDevice
- (BOOL)supportsFireWaterDialOption;
@end

@implementation CLKDevice

- (BOOL)supportsFireWaterDialOption
{
  return (char *)[(CLKDevice *)self deviceCategory] - 2 < (unsigned char *)&dword_0 + 3;
}

@end