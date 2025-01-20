void sub_2A04(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t vars8;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    NSLog(@"Failed to clear override configuration file: %@", v3);
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"UNABLE_TO_CLEAR_CONFIGURATION_FILE_TITLE" value:&stru_4318 table:0];

    [*(id *)(a1 + 32) presentError:v6 title:v5];
  }
  else
  {
    NSLog(@"Cleared override configuration file.");
  }
}

uint64_t sub_2E34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2F10(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    NSLog(@"Failed to set override configuration file: %@", v3);
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"UNABLE_TO_OVERRIDE_CONFIGURATION_FILE_TITLE" value:&stru_4318 table:0];

    [*(id *)(a1 + 32) presentError:v4 title:v6];
  }
  else
  {
    NSLog(@"Set override configuration file");
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v7 localizedStringForKey:@"SUCCESSULLY SET OVERRIDE CONFIGURATION FILE" value:&stru_4318 table:0];

    v8 = +[UIAlertController alertControllerWithTitle:v6 message:0 preferredStyle:1];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"OK" value:&stru_4318 table:0];

    v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:0];
    [v8 addAction:v11];

    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
  }

  v12 = +[NSFileManager defaultManager];
  uint64_t v13 = *(void *)(a1 + 40);
  id v17 = 0;
  unsigned __int8 v14 = [v12 removeItemAtURL:v13 error:&v17];
  id v15 = v17;

  if ((v14 & 1) == 0)
  {
    v16 = [*(id *)(a1 + 40) path];
    NSLog(@"Failed to remove configuration file at: %@. %@", v16, v15);
  }
}

uint64_t CFPrefs_GetInt64()
{
  return _CFPrefs_GetInt64();
}

void NSLog(NSString *format, ...)
{
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return _UTTypeConformsTo(inUTI, inConformsToUTI);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_typeWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeWithIdentifier:");
}