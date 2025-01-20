void sub_3AB0(id a1)
{
  id v1;
  uint64_t vars8;

  v1 = +[AXValidationManager sharedInstance];
  [v1 performValidations:&stru_40C8 withPreValidationHandler:&stru_40E8 postValidationHandler:0 safeCategoryInstallationHandler:&stru_4128];
}

BOOL sub_3B14(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL sub_3B1C(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"AX NanoMailBridgeSettings"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"AX NanoMailBridgeSettings"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 localizedStringForKey:v1 value:&stru_4188 table:@"Accessibility"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}