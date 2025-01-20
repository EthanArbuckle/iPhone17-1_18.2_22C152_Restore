@interface CSLPRFApplicationLibrary
+ (id)_withClassLock_libraryForLocation:(unint64_t)a3;
+ (id)libraryForLocation:(unint64_t)a3;
+ (id)sharedLibraryForLocation:(unint64_t)a3;
@end

@implementation CSLPRFApplicationLibrary

+ (id)_withClassLock_libraryForLocation:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (a3 >= 4)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"location < __locationCount"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v16 = NSStringFromSelector(a2);
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138544642;
      v20 = v16;
      __int16 v21 = 2114;
      v22 = v18;
      __int16 v23 = 2048;
      id v24 = a1;
      __int16 v25 = 2114;
      v26 = @"CSLPRFApplicationLibrary.m";
      __int16 v27 = 1024;
      int v28 = 51;
      __int16 v29 = 2114;
      v30 = v15;
      _os_log_error_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x22F502080);
  }
  id v5 = __sharedLibraries[a3];
  v6 = v5;
  if (v5)
  {
    v7 = (CSLPRFLocalApplicationLibrary *)v5;
LABEL_4:
    v3 = (CSLPRFCompositeApplicationLibrary *)v7;
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        v7 = +[CSLPRFWatchApplicationLibrary libraryForWatchApplications];
        goto LABEL_4;
      case 1uLL:
        v7 = objc_alloc_init(CSLPRFLocalApplicationLibrary);
        goto LABEL_4;
      case 2uLL:
        v9 = [CSLPRFCompositeApplicationLibrary alloc];
        v10 = +[CSLPRFWatchApplicationLibrary libraryForWatchApplications];
        v11 = objc_alloc_init(CSLPRFBulletinBoardApplicationLibrary);
        goto LABEL_13;
      case 3uLL:
        v9 = [CSLPRFCompositeApplicationLibrary alloc];
        v10 = objc_alloc_init(CSLPRFLocalApplicationLibrary);
        v11 = +[CSLPRFWatchApplicationLibrary libraryForWatchApplications];
LABEL_13:
        v12 = v11;
        v3 = [(CSLPRFCompositeApplicationLibrary *)v9 initWithPrimaryLibrary:v10 secondaryLibrary:v11];

        break;
      default:
        break;
    }
  }

  return v3;
}

+ (id)libraryForLocation:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a3 >= 4)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"location < __locationCount"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(a2);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2048;
      id v17 = a1;
      __int16 v18 = 2114;
      v19 = @"CSLPRFApplicationLibrary.m";
      __int16 v20 = 1024;
      int v21 = 39;
      __int16 v22 = 2114;
      __int16 v23 = v8;
      _os_log_error_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x22F50224CLL);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  id v5 = __sharedLibraries[a3];
  if (!v5)
  {
    objc_msgSend(a1, "_withClassLock_libraryForLocation:", a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
  return v5;
}

+ (id)sharedLibraryForLocation:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a3 >= 4)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"location < __locationCount"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v11 = NSStringFromSelector(a2);
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      v15 = v11;
      __int16 v16 = 2114;
      id v17 = v13;
      __int16 v18 = 2048;
      id v19 = a1;
      __int16 v20 = 2114;
      int v21 = @"CSLPRFApplicationLibrary.m";
      __int16 v22 = 1024;
      int v23 = 27;
      __int16 v24 = 2114;
      __int16 v25 = v10;
      _os_log_error_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x22F50241CLL);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  id v5 = __sharedLibraries[a3];
  if (!v5)
  {
    v6 = objc_msgSend(a1, "_withClassLock_libraryForLocation:", a3);
    id v7 = __sharedLibraries[a3];
    __sharedLibraries[a3] = v6;

    id v5 = v6;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
  return v5;
}

@end