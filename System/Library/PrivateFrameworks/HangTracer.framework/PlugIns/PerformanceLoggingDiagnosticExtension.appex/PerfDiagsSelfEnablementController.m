@interface PerfDiagsSelfEnablementController
+ (BOOL)isAnyModeActive;
@end

@implementation PerfDiagsSelfEnablementController

+ (BOOL)isAnyModeActive
{
  v16[0] = @"PDSEHangTracer";
  v16[1] = @"PDSEHTThirdParty";
  v16[2] = @"PDSESentry";
  v16[3] = @"PDSEAppLaunch";
  v16[4] = @"PDSEWorkflowResponsiveness";
  +[NSArray arrayWithObjects:v16 count:5];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = arrayOfCFPrefsWithPrefix(@"com.apple.da", @"mobile", *(void *)(*((void *)&v11 + 1) + 8 * i));
        id v9 = objc_msgSend(v8, "count", (void)v11);

        v5 |= v9 != 0;
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

@end