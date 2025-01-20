@interface NSTextAttachment(PaperInNotes)
- (id)_paperBundleAssetsURL;
- (id)_paperBundleBaseURL;
- (id)_paperBundleDatabaseURL;
@end

@implementation NSTextAttachment(PaperInNotes)

- (id)_paperBundleBaseURL
{
  if (objc_opt_respondsToSelector())
  {
    id v2 = [a1 _paperBundleURL];
  }
  else
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CB10]);
  }

  return v2;
}

- (id)_paperBundleDatabaseURL
{
  if (objc_opt_respondsToSelector())
  {
    id v2 = [a1 _paperBundleURL];
    v3 = [v2 URLByAppendingPathComponent:@"Database"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_paperBundleAssetsURL
{
  if (objc_opt_respondsToSelector())
  {
    id v2 = [a1 _paperBundleURL];
    v3 = [v2 URLByAppendingPathComponent:@"Assets.bundle"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end