void start()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  id v13;

  v1 = +[NSBundle mainBundle];
  v2 = [v1 bundleURL];
  v3 = [v2 URLByDeletingLastPathComponent];

  v4 = [v3 URLByDeletingLastPathComponent];

  v5 = +[NSBundle bundleWithURL:v4];
  if (v5)
  {
    v13 = 0;
    v7 = [v5 loadAndReturnError:&v13];
    v8 = v13;
    if (v7)
    {
      v10 = (objc_class *)[v1 principalClass];
      if (v10)
      {
        v12 = objc_alloc_init(v10);
        v11 = +[NSXPCListener serviceListener];
        [v11 setDelegate:v12];
      }
      else
      {
        NSLog(@"Unable to find principal class by name.");
        v11 = 0;
      }
      [v11 resume];
    }
    else
    {
      NSLog(@"Error loading framework: %@", v8);
    }
  }
  else
  {
    NSLog(@"Unable to find framework using URL: %@", v4);
  }
  exit(1);
}

void NSLog(NSString *format, ...)
{
}

void exit(int a1)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}