id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileSafariSettings.axbundle"],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F721538 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id profileSymbolAccessibilityLabel(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"person.lanyardcard.fill"])
  {
    v2 = @"profile.icon.person.lanyardcard.fill";
    goto LABEL_25;
  }
  if ([v1 isEqualToString:@"emoji.face.grinning.inverse"])
  {
    v2 = @"profile.icon.emoji.face.grinning.inverse";
    goto LABEL_25;
  }
  if ([v1 isEqualToString:@"rocket.fill"])
  {
    v2 = @"profile.icon.rocket.fill";
    goto LABEL_25;
  }
  if ([v1 isEqualToString:@"book.closed.fill"])
  {
    v2 = @"profile.icon.book.closed.fill";
    goto LABEL_25;
  }
  if ([v1 isEqualToString:@"graduationcap.fill"])
  {
    v2 = @"profile.icon.graduationcap.fill";
    goto LABEL_25;
  }
  if ([v1 isEqualToString:@"figure.stand"])
  {
    v2 = @"profile.icon.figure.stand";
    goto LABEL_25;
  }
  if ([v1 isEqualToString:@"wrench.and.screwdriver.fill"])
  {
    v2 = @"profile.icon.wrench.and.screwdriver.fill";
    goto LABEL_25;
  }
  if ([v1 isEqualToString:@"paintpalette.fill"])
  {
    v2 = @"profile.icon.paintpalette.fill";
    goto LABEL_25;
  }
  if ([v1 isEqualToString:@"globe.americas.fill"])
  {
    v2 = @"profile.icon.globe.americas.fill";
    goto LABEL_25;
  }
  if ([v1 isEqualToString:@"airplane.departure"])
  {
    v2 = @"profile.icon.airplane.departure";
    goto LABEL_25;
  }
  if ([v1 isEqualToString:@"person.fill"])
  {
    v2 = @"profile.icon.person.fill";
    goto LABEL_25;
  }
  if ([v1 isEqualToString:@"ellipsis"])
  {
    v2 = @"profile.icon.ellipsis";
LABEL_25:
    v3 = accessibilityLocalizedString(v2);
    if (v3) {
      goto LABEL_27;
    }
  }
  v3 = accessibilityUIKitSymbolNamesLocalizedString();
LABEL_27:

  return v3;
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x270F09D40]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F0A418]();
}

void abort(void)
{
}

uint64_t accessibilityUIKitSymbolNamesLocalizedString()
{
  return MEMORY[0x270F80B10]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}