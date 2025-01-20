id AXGameCenterLocString(void *a1)
{
  id v1;
  void *v2;
  uint64_t vars8;

  v1 = a1;
  if (AXGameCenterLocString_onceToken != -1) {
    dispatch_once(&AXGameCenterLocString_onceToken, &__block_literal_global);
  }
  if (AXGameCenterLocString_bundle)
  {
    v2 = [(id)AXGameCenterLocString_bundle localizedStringForKey:v1 value:&stru_26F6A78E0 table:@"GameCenter"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t __AXGameCenterLocString_block_invoke()
{
  AXGameCenterLocString_bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

id AXGameCenterUIFrameworkLocString(void *a1)
{
  id v1 = a1;
  if (AXGameCenterUIFrameworkLocString_onceToken != -1) {
    dispatch_once(&AXGameCenterUIFrameworkLocString_onceToken, &__block_literal_global_0);
  }
  if (AXGameCenterUIFrameworkLocString_bundle)
  {
    v2 = [(id)AXGameCenterUIFrameworkLocString_bundle localizedStringForKey:v1 value:&stru_26F6A78E0 table:@"GameCenterUIFrameworkAccessibility"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void __AXGameCenterUIFrameworkLocString_block_invoke()
{
  v0 = (void *)MEMORY[0x263F086E0];
  MEMORY[0x24564D750]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = [v4 stringByAppendingPathComponent:@"GameCenterUIFramework.axbundle"];
  uint64_t v2 = [v0 bundleWithPath:v1];
  v3 = (void *)AXGameCenterUIFrameworkLocString_bundle;
  AXGameCenterUIFrameworkLocString_bundle = v2;
}

uint64_t AXSystemGetAccessibilityBundlesDirectoryPath()
{
  return MEMORY[0x270F0A320]();
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