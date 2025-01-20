@interface LSGetMainBundleURL
@end

@implementation LSGetMainBundleURL

void ___LSGetMainBundleURL_block_invoke()
{
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    CFURLRef v1 = CFBundleCopyBundleURL(MainBundle);
    if (v1)
    {
      CFURLRef v8 = v1;
      v2 = [(__CFURL *)v1 pathExtension];
      uint64_t v3 = [v2 length];

      if (v3)
      {
        v4 = [[FSNode alloc] initWithURL:v8 flags:34 error:0];
        v5 = v4;
        if (v4)
        {
          CFURLRef v6 = [(FSNode *)v4 URL];
        }
        else
        {
          CFURLRef v6 = v8;
        }
        v7 = (void *)_LSGetMainBundleURL::result;
        _LSGetMainBundleURL::result = (uint64_t)v6;
      }
      else
      {
        v5 = (FSNode *)_LSGetMainBundleURL::result;
        _LSGetMainBundleURL::result = 0;
      }

      CFURLRef v1 = v8;
    }
  }
}

@end