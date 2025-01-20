@interface GEONavdPowerLogManager
+ (void)_powerLogWithEventName:(id)a3;
@end

@implementation GEONavdPowerLogManager

+ (void)_powerLogWithEventName:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length] && PLShouldLogRegisteredEvent())
  {
    v4 = @"Event";
    v5[0] = v3;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
    PLLogRegisteredEvent();
  }
}

@end