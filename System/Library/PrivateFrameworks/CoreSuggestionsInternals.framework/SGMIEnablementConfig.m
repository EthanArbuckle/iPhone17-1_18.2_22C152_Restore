@interface SGMIEnablementConfig
+ (BOOL)detectSalientMails;
+ (BOOL)logWarningSignatureStats;
@end

@implementation SGMIEnablementConfig

+ (BOOL)logWarningSignatureStats
{
  v2 = +[SGMITrialClientWrapper sharedInstance];
  v3 = [v2 signatureStatsLogging];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)detectSalientMails
{
  v2 = [MEMORY[0x1E4F5DAF0] detectSalientMails];
  v3 = v2;
  if (v2)
  {
    char v4 = [v2 BOOLValue];
  }
  else
  {
    v5 = +[SGMITrialClientWrapper sharedInstance];
    v6 = [v5 isEnabled];
    v7 = [v5 isDNUOnlyEnablement];
    if (v6)
    {
      int v8 = [v6 BOOLValue];
      if (v7) {
        char v4 = 0;
      }
      else {
        char v4 = v8;
      }
      if (v7) {
        BOOL v9 = v8 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9)
      {
        if ([v7 BOOLValue]) {
          char v4 = [MEMORY[0x1E4F93B08] isDNUEnabled];
        }
        else {
          char v4 = 1;
        }
      }
    }
    else
    {
      char v4 = 0;
    }
  }
  return v4;
}

@end