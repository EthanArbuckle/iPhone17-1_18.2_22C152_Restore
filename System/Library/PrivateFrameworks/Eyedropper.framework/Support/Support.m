uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  objc_class *v7;
  NSString *v8;
  uint64_t v9;

  _set_user_dir_suffix();
  BSSetMainThreadPriorityFixedForUI();
  pthread_self();
  BSPthreadSetFixedPriority();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = UIApplicationMain(a1, a2, v6, v8);

  return v9;
}

uint64_t BSPthreadSetFixedPriority()
{
  return _BSPthreadSetFixedPriority();
}

uint64_t BSSetMainThreadPriorityFixedForUI()
{
  return _BSSetMainThreadPriorityFixedForUI();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}