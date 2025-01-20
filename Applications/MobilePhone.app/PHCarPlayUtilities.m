@interface PHCarPlayUtilities
+ (BOOL)activeInterfaceMechanismIsHardware;
+ (BOOL)activeInterfaceMechanismIsTouchOnly;
+ (BOOL)shouldLimitKeypadAccess;
@end

@implementation PHCarPlayUtilities

+ (BOOL)activeInterfaceMechanismIsHardware
{
  v2 = +[UIScreen _carScreen];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 _capabilityForKey:_UIScreenCapabilityInteractionModelsKey];
    unsigned __int8 v5 = [v4 integerValue];

    v6 = [v3 _capabilityForKey:_UIScreenCapabilityTouchLevelsKey];
    id v7 = [v6 integerValue];

    BOOL v9 = ((v5 & 1) == 0 || v7 == (id)2) && (v5 & 6) != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  v10 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v11 = [v10 BOOLForKey:@"StarkForceHardwareInterface"];

  return v11 | v9;
}

+ (BOOL)activeInterfaceMechanismIsTouchOnly
{
  v2 = +[UIScreen _carScreen];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 _capabilityForKey:_UIScreenCapabilityInteractionModelsKey];
    unsigned __int8 v5 = [v4 integerValue];

    v6 = [v3 _capabilityForKey:_UIScreenCapabilityTouchLevelsKey];
    id v7 = [v6 integerValue];

    BOOL v9 = (v5 & 7) == 1 && v7 != (id)2;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)shouldLimitKeypadAccess
{
  v2 = +[AVExternalDevice currentCarPlayExternalDevice];
  v3 = v2;
  if (v2 && [v2 limitedUI])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [v3 limitedUIElements];
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      uint64_t v8 = AVExternalDeviceLimitedUIElementSoftPhoneKeypad;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v12 + 1) + 8 * i) isEqualToString:v8])
          {
            BOOL v10 = 1;
            goto LABEL_14;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v10 = 0;
LABEL_14:
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

@end