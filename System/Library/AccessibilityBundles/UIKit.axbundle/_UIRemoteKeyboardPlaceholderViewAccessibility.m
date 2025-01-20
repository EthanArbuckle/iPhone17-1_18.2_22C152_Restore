@interface _UIRemoteKeyboardPlaceholderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityActiveKeyboard;
- (id)accessibilityElements;
- (int64_t)accessibilityContainerType;
@end

@implementation _UIRemoteKeyboardPlaceholderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIRemoteKeyboardPlaceholderView";
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
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", @"FBSSceneDefinition", @"identity");
  [location[0] validateClass:@"FBSSceneIdentity" hasProperty:@"workspaceIdentifier" withType:"@"];
  objc_storeStrong(location, 0);
}

- (id)_accessibilityActiveKeyboard
{
  v6 = self;
  v5[1] = (id)a2;
  if (AXUIKeyboardIsOOP())
  {
    v5[0] = [(_UIRemoteKeyboardPlaceholderViewAccessibility *)v6 accessibilityElements];
    id v4 = (id)[v5[0] lastObject];
    id v7 = (id)[v4 _accessibilityActiveKeyboard];
    objc_storeStrong(&v4, 0);
    objc_storeStrong(v5, 0);
  }
  else
  {
    id v7 = 0;
  }
  v2 = v7;

  return v2;
}

- (id)accessibilityElements
{
  v24[1] = *MEMORY[0x263EF8340];
  v22 = self;
  v21[1] = (id)a2;
  v21[0] = (id)[(_UIRemoteKeyboardPlaceholderViewAccessibility *)self window];
  if (v21[0])
  {
    if (AXUIKeyboardIsOOP())
    {
      id location = 0;
      id v9 = (id)[v21[0] windowScene];
      id v18 = (id)[v9 safeValueForKey:@"_FBSScene"];

      id v10 = (id)[v18 safeValueForKey:@"identity"];
      id v17 = (id)[v10 safeStringForKey:@"workspaceIdentifier"];

      if ((axIsAutomaticArbiterClientKeyboardActive() & 1) == 0
        || (axKeyboardInSeparateProcessAndScene(v21[0]) & 1) != 0
        || ([v17 isEqualToString:@"com.apple.BannerKit"] & 1) != 0)
      {
        id v23 = 0;
        int v20 = 1;
      }
      else
      {
        id v16 = (id)[MEMORY[0x263F1C738] activeInstance];
        id v15 = (id)[v16 safeValueForKey:@"remoteTextInputPartner"];
        NSClassFromString(&cfstr_Uikbrtipartner_0.isa);
        if (objc_opt_isKindOfClass())
        {
          id v14 = (id)[v15 safeValueForKey:@"rtiClient"];
          NSClassFromString(&cfstr_Rtiinputsystem.isa);
          if (objc_opt_isKindOfClass())
          {
            id v13 = (id)[v14 safeDictionaryForKey:@"connections"];
            id v8 = getRTIInputUIServiceMachNameiOS();
            id v12 = (id)objc_msgSend(v13, "objectForKey:");

            if (v12)
            {
              unsigned int v11 = [v12 processIdentifier];
              objc_storeStrong(&location, (id)__AXUIRemoteKeyboardPlaceholderElement);
              if (!location || [location remotePid] != v11)
              {
                v2 = (void *)[objc_alloc(MEMORY[0x263F21678]) initWithUUID:@"KeyboardSingleton" andRemotePid:v11 andContextId:0];
                id v3 = location;
                id location = v2;

                objc_storeStrong((id *)&__AXUIRemoteKeyboardPlaceholderElement, location);
              }
            }
            objc_storeStrong(&v12, 0);
            objc_storeStrong(&v13, 0);
          }
          objc_storeStrong(&v14, 0);
        }
        if (!location)
        {
          id v4 = (id)AXUIRepresentedKeyboardElement();
          id v5 = location;
          id location = v4;
        }
        [location setAccessibilityContainer:v22];
        [location setOnClientSide:1];
        v24[0] = location;
        id v23 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
        int v20 = 1;
        objc_storeStrong(&v15, 0);
        objc_storeStrong(&v16, 0);
      }
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&location, 0);
    }
    else
    {
      id v23 = 0;
      int v20 = 1;
    }
  }
  else
  {
    id v23 = 0;
    int v20 = 1;
  }
  objc_storeStrong(v21, 0);
  v6 = v23;

  return v6;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end