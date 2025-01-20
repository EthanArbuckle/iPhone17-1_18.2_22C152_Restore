@interface NSBundle
+ (id)aaui_loadBundle:(id)a3 atPath:(id)a4;
@end

@implementation NSBundle

+ (id)aaui_loadBundle:(id)a3 atPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = UISystemRootDirectory();
  v8 = [v7 stringByAppendingPathComponent:v6];

  v9 = [v8 stringByAppendingPathComponent:v5];
  v10 = +[NSBundle bundleWithPath:v9];
  if (([v10 isLoaded] & 1) == 0)
  {
    v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%@ not loaded. Loading...", (uint8_t *)&v13, 0xCu);
    }

    [v10 load];
  }

  return v10;
}

@end