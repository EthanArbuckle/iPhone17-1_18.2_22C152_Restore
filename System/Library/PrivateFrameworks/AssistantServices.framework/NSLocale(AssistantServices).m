@interface NSLocale(AssistantServices)
+ (id)af_temperatureUnitForAceTemperatureUnit:()AssistantServices;
+ (void)af_setAceTemperatureUnit:()AssistantServices;
- (id)af_aceTemperatureUnit;
@end

@implementation NSLocale(AssistantServices)

- (id)af_aceTemperatureUnit
{
  v2 = [a1 objectForKey:*MEMORY[0x1E4F1C478]];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F1C480]];
  v4 = (id *)MEMORY[0x1E4F96BE0];
  v5 = (id *)MEMORY[0x1E4F96BE0];
  if ((v3 & 1) == 0)
  {
    if (![v2 isEqualToString:*MEMORY[0x1E4F1C488]])
    {
LABEL_5:
      v7 = (id *)MEMORY[0x1E4F96BE8];
      v8 = [a1 objectForKey:*MEMORY[0x1E4F1C490]];
      int v9 = [v8 BOOLValue];

      if (v9) {
        v10 = v4;
      }
      else {
        v10 = v7;
      }
      id v6 = *v10;
      goto LABEL_9;
    }
    v5 = (id *)MEMORY[0x1E4F96BE8];
  }
  id v6 = *v5;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_9:

  return v6;
}

+ (void)af_setAceTemperatureUnit:()AssistantServices
{
  v2 = objc_msgSend(a1, "af_temperatureUnitForAceTemperatureUnit:");
  if (v2)
  {
    char v3 = v2;
    [a1 _setPreferredTemperatureUnit:v2];
    v2 = v3;
  }
}

+ (id)af_temperatureUnitForAceTemperatureUnit:()AssistantServices
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F96BE0]])
  {
    v4 = (id *)MEMORY[0x1E4F1C480];
LABEL_5:
    id v5 = *v4;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F96BE8]])
  {
    v4 = (id *)MEMORY[0x1E4F1C488];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

@end