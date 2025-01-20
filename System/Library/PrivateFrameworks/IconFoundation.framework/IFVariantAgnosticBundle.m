@interface IFVariantAgnosticBundle
- (id)infoDictionary;
@end

@implementation IFVariantAgnosticBundle

- (id)infoDictionary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(IFBundle *)self bundle])
  {
    [(IFBundle *)self bundle];
    v3 = (void *)_CFBundleCopyInfoPlistURL();
    if (v3)
    {
      id v10 = 0;
      v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3 error:&v10];
      v5 = v10;
      if (v4)
      {
        id v6 = v4;
      }
      else
      {
        v8 = IFDefaultLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v12 = v3;
          __int16 v13 = 2112;
          v14 = v5;
          _os_log_impl(&dword_1DC6CA000, v8, OS_LOG_TYPE_INFO, "Failed to read Info.plist contents at URL: %@. Error: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v5 = IFDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7 = [(IFBundle *)self bundleURL];
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_1DC6CA000, v5, OS_LOG_TYPE_INFO, "Failed to determine Info.plist URL for bundle at URL: %@", buf, 0xCu);
      }
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end