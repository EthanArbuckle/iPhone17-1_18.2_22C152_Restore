@interface UISystemShellApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsSystemAppServer;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4;
@end

@implementation UISystemShellApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISystemShellApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  v17 = self;
  SEL v16 = a2;
  int64_t v15 = a3;
  if ((unint64_t)a3 <= 0x44C)
  {
    int64_t v4 = a3 - 1100;
    char v3 = 0;
  }
  else
  {
    int64_t v4 = a3 - 1100;
    char v3 = 1;
  }
  if ((v3 & 1) == 0)
  {
    switch(v4)
    {
      case 0:
        id v18 = (id)AXFrontBoardRunningAppPIDs();
        goto LABEL_23;
      case 1:
        id v18 = (id)AXFrontBoardFocusedAppPID();
        goto LABEL_23;
      case 2:
        id v18 = (id)AXFrontBoardFocusedAppPIDs();
        goto LABEL_23;
      case 3:
        id v18 = (id)AXFrontBoardSpeakThisAppPIDs();
        goto LABEL_23;
      case 4:
        id v18 = (id)AXFrontBoardSpeakThisAppPIDForPoint();
        goto LABEL_23;
      case 5:
        id v18 = (id)AXFrontBoardFocusedAppPIDsIgnoringSiri();
        goto LABEL_23;
      case 6:
        id v18 = (id)[NSNumber numberWithBool:AXFrontBoardIsSystemAppUINonExclusive() & 1];
        goto LABEL_23;
      case 7:
        break;
      case 8:
        id v14 = (id)AXFrontBoardFocusedApps();
        id v18 = (id)objc_msgSend(v14, "ax_mappedArrayUsingBlock:", &__block_literal_global_36);
        objc_storeStrong(&v14, 0);
        goto LABEL_23;
      case 9:
        id v13 = (id)AXFrontBoardFocusedApps();
        id v18 = (id)objc_msgSend(v13, "ax_mappedArrayUsingBlock:", &__block_literal_global_273);
        objc_storeStrong(&v13, 0);
        goto LABEL_23;
      case 10:
        id v12 = (id)AXFrontBoardFocusedApps();
        id v11 = (id)objc_msgSend(v12, "ax_firstObjectUsingBlock:", &__block_literal_global_277);
        char v9 = 0;
        if (v11)
        {
          id v10 = (id)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "pid"));
          char v9 = 1;
          id v5 = v10;
        }
        else
        {
          id v5 = &unk_26F48EAE0;
        }
        id v18 = v5;
        if (v9) {

        }
        objc_storeStrong(&v11, 0);
        objc_storeStrong(&v12, 0);
        goto LABEL_23;
      case 11:
        id v18 = (id)AXFrontBoardFocusedAppPidsForContinuity();
        goto LABEL_23;
      default:
        JUMPOUT(0);
    }
  }
  v8.receiver = v17;
  v8.super_class = (Class)UISystemShellApplicationAccessibility;
  id v18 = [(UISystemShellApplicationAccessibility *)&v8 _iosAccessibilityAttributeValue:v15];
LABEL_23:
  v6 = v18;

  return v6;
}

id __73__UISystemShellApplicationAccessibility__iosAccessibilityAttributeValue___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[location[0] bundleIdentifier];
  objc_storeStrong(location, 0);

  return v3;
}

id __73__UISystemShellApplicationAccessibility__iosAccessibilityAttributeValue___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(location[0], "pid"));
  objc_storeStrong(location, 0);

  return v3;
}

uint64_t __73__UISystemShellApplicationAccessibility__iosAccessibilityAttributeValue___block_invoke_3(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[location[0] bundleIdentifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F21248]];

  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  id v11 = self;
  SEL v10 = a2;
  int64_t v9 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  if (v9 == 91510)
  {
    id v12 = (id)[NSNumber numberWithInt:AXFrontBoardPIDForApplicationWithBundleID()];
    int v7 = 1;
  }
  else
  {
    if (v9 == 91700)
    {
      id v12 = (id)AXFrontBoardSpeakThisAppPIDForPoint();
    }
    else
    {
      v6.receiver = v11;
      v6.super_class = (Class)UISystemShellApplicationAccessibility;
      id v12 = [(UISystemShellApplicationAccessibility *)&v6 _iosAccessibilityAttributeValue:v9 forParameter:location];
    }
    int v7 = 1;
  }
  objc_storeStrong(&location, 0);
  char v4 = v12;

  return v4;
}

- (BOOL)_accessibilityIsSystemAppServer
{
  return 1;
}

@end