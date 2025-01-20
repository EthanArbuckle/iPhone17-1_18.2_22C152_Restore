@interface CKPassKitHelper
+ (id)addPassesViewControllerForPass:(id)a3;
+ (id)localizedNameForPass:(id)a3;
+ (id)mailAttachmentIconForPass:(id)a3;
+ (id)organizationNameForPass:(id)a3;
+ (id)passViewForPass:(id)a3 content:(int64_t)a4;
@end

@implementation CKPassKitHelper

+ (id)mailAttachmentIconForPass:(id)a3
{
  id v3 = a3;
  if (PassKitUILibraryCore())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__CKPassKitHelper_mailAttachmentIconForPass___block_invoke;
    block[3] = &unk_1E5620C40;
    id v4 = v3;
    id v8 = v4;
    if (mailAttachmentIconForPass__onceToken != -1) {
      dispatch_once(&mailAttachmentIconForPass__onceToken, block);
    }
    if (mailAttachmentIconForPass__respondsToSelector)
    {
      v5 = [v4 mailAttachmentIcon];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __45__CKPassKitHelper_mailAttachmentIconForPass___block_invoke()
{
  uint64_t result = objc_opt_respondsToSelector();
  mailAttachmentIconForPass__respondsToSelector = result & 1;
  return result;
}

+ (id)localizedNameForPass:(id)a3
{
  id v3 = a3;
  if (PassKitUILibraryCore())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__CKPassKitHelper_localizedNameForPass___block_invoke;
    block[3] = &unk_1E5620C40;
    id v4 = v3;
    id v8 = v4;
    if (localizedNameForPass__onceToken != -1) {
      dispatch_once(&localizedNameForPass__onceToken, block);
    }
    if (localizedNameForPass__respondsToSelector)
    {
      v5 = [v4 localizedName];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __40__CKPassKitHelper_localizedNameForPass___block_invoke()
{
  uint64_t result = objc_opt_respondsToSelector();
  localizedNameForPass__respondsToSelector = result & 1;
  return result;
}

+ (id)organizationNameForPass:(id)a3
{
  id v3 = a3;
  if (PassKitUILibraryCore())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__CKPassKitHelper_organizationNameForPass___block_invoke;
    block[3] = &unk_1E5620C40;
    id v4 = v3;
    id v8 = v4;
    if (organizationNameForPass__onceToken != -1) {
      dispatch_once(&organizationNameForPass__onceToken, block);
    }
    if (organizationNameForPass__respondsToSelector)
    {
      v5 = [v4 organizationName];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __43__CKPassKitHelper_organizationNameForPass___block_invoke()
{
  uint64_t result = objc_opt_respondsToSelector();
  organizationNameForPass__respondsToSelector = result & 1;
  return result;
}

+ (id)passViewForPass:(id)a3 content:(int64_t)a4
{
  id v5 = a3;
  if (PassKitUILibraryCore())
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v6 = (void *)getPKPassViewClass_softClass;
    uint64_t v13 = getPKPassViewClass_softClass;
    if (!getPKPassViewClass_softClass)
    {
      PassKitUILibraryCore();
      v11[3] = (uint64_t)objc_getClass("PKPassView");
      getPKPassViewClass_softClass = v11[3];
      v6 = (void *)v11[3];
    }
    v7 = v6;
    _Block_object_dispose(&v10, 8);
    id v8 = (void *)[[v7 alloc] initWithPass:v5 content:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)addPassesViewControllerForPass:(id)a3
{
  id v3 = a3;
  if (PassKitUILibraryCore())
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2050000000;
    id v4 = (void *)getPKAddPassesViewControllerClass_softClass;
    uint64_t v11 = getPKAddPassesViewControllerClass_softClass;
    if (!getPKAddPassesViewControllerClass_softClass)
    {
      PassKitUILibraryCore();
      v9[3] = (uint64_t)objc_getClass("PKAddPassesViewController");
      getPKAddPassesViewControllerClass_softClass = v9[3];
      id v4 = (void *)v9[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v8, 8);
    v6 = (void *)[[v5 alloc] initWithPass:v3];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end