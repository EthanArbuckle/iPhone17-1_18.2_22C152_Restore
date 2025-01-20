@interface BuddyUINavigationBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityIdentifier;
@end

@implementation BuddyUINavigationBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UINavigationBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityIdentifier
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v3 = AXLogUIA();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(BuddyUINavigationBarAccessibility *)self accessibilityIdentification];
    *(_DWORD *)buf = 138412546;
    v30 = self;
    __int16 v31 = 2112;
    v32 = v4;
    _os_log_impl(&dword_2424F4000, v3, OS_LOG_TYPE_INFO, "NavBar: Buddy: identification:%@ %@", buf, 0x16u);
  }
  v5 = [(BuddyUINavigationBarAccessibility *)self accessibilityIdentification];
  int v6 = [v5 isEqualToString:@"AXSetupMainNavBar"];

  if (v6)
  {
    buf[0] = 0;
    objc_opt_class();
    char v28 = 0;
    objc_opt_class();
    v7 = __UIAccessibilityCastAsClass();
    v8 = v7;
    v9 = [v7 delegate];
    __UIAccessibilityCastAsClass();
    v10 = (BuddyUINavigationBarAccessibility *)objc_claimAutoreleasedReturnValue();

    if (buf[0]) {
      abort();
    }
    v11 = [(BuddyUINavigationBarAccessibility *)v10 visibleViewController];
    v12 = AXLogUIA();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v10;
      __int16 v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_2424F4000, v12, OS_LOG_TYPE_INFO, "NavBar: Buddy: nav controller: %@ visible: %@", buf, 0x16u);
    }

    if (v11)
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [v14 componentsSeparatedByString:@"Controller"];
      v16 = [v15 firstObject];

      objc_opt_class();
      v17 = __UIAccessibilityCastAsSafeCategory();
      v18 = v17;
      if (v17 && ([v17 accessibilityShowsEscapeOffer] & 1) == 0)
      {
        uint64_t v19 = [(__CFString *)v16 stringByAppendingString:@"DeviceChosen"];

        v16 = (__CFString *)v19;
      }
      v20 = AXLogUIA();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = (BuddyUINavigationBarAccessibility *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v30 = v21;
        __int16 v31 = 2112;
        v32 = v16;
        v22 = v21;
        _os_log_impl(&dword_2424F4000, v20, OS_LOG_TYPE_INFO, "NavBar: Buddy: class: %@, name: %@", buf, 0x16u);
      }
    }
    else
    {
      v16 = @"UnknownSetupPane";
    }
  }
  else
  {
    v23 = AXLogUIA();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v27.receiver = self;
      v27.super_class = (Class)BuddyUINavigationBarAccessibility;
      v24 = [(BuddyUINavigationBarAccessibility *)&v27 accessibilityIdentifier];
      *(_DWORD *)buf = 138412290;
      v30 = v24;
      _os_log_impl(&dword_2424F4000, v23, OS_LOG_TYPE_INFO, "NavBar: Buddy: returning super identifier: %@", buf, 0xCu);
    }
    v26.receiver = self;
    v26.super_class = (Class)BuddyUINavigationBarAccessibility;
    v16 = [(BuddyUINavigationBarAccessibility *)&v26 accessibilityIdentifier];
  }

  return v16;
}

@end