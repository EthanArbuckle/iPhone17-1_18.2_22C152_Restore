@interface FMFMonogramUtility
+ (__CFString)hexStringFromColor:(id)a3;
+ (id)contactImageCache;
+ (id)contactStatusCache;
+ (id)monogramImageOfDiameter:(double)a3 forContact:(id)a4 monogramStyle:(int64_t)a5 tintColor:(id)a6 customFont:(id)a7 isPersonImage:(BOOL *)a8;
+ (id)monogramImageOfDiameter:(double)a3 forContact:(id)a4 useTintColor:(id)a5 useCustomFont:(BOOL)a6 isPersonImage:(BOOL *)a7;
+ (id)monogrammerWithDiameter:(double)a3 style:(int64_t)a4 useTintColor:(id)a5 customFont:(id)a6;
+ (id)placeholderContactImageOfDiameter:(double)a3 monogramStyle:(int64_t)a4 useTintColor:(id)a5;
+ (void)clearMonogramCache;
@end

@implementation FMFMonogramUtility

+ (id)contactImageCache
{
  if (contactImageCache_once != -1) {
    dispatch_once(&contactImageCache_once, &__block_literal_global_1);
  }
  v2 = (void *)imageCache;
  return v2;
}

uint64_t __39__FMFMonogramUtility_contactImageCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)imageCache;
  imageCache = (uint64_t)v0;

  v2 = (void *)imageCache;
  return [v2 setEvictsObjectsWithDiscardedContent:0];
}

+ (id)contactStatusCache
{
  if (contactStatusCache_once != -1) {
    dispatch_once(&contactStatusCache_once, &__block_literal_global_2);
  }
  v2 = (void *)statusCache;
  return v2;
}

uint64_t __40__FMFMonogramUtility_contactStatusCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)statusCache;
  statusCache = (uint64_t)v0;

  v2 = (void *)statusCache;
  return [v2 setEvictsObjectsWithDiscardedContent:0];
}

+ (void)clearMonogramCache
{
  if (imageCache) {
    [(id)imageCache removeAllObjects];
  }
  v2 = (void *)statusCache;
  if (statusCache)
  {
    [v2 removeAllObjects];
  }
}

+ (id)monogramImageOfDiameter:(double)a3 forContact:(id)a4 useTintColor:(id)a5 useCustomFont:(BOOL)a6 isPersonImage:(BOOL *)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  if (v8)
  {
    v14 = [MEMORY[0x263F1C658] systemFontOfSize:*MEMORY[0x263F03B70] weight:34.0 design:*MEMORY[0x263F1D340]];
  }
  else
  {
    v14 = 0;
  }
  v15 = [a1 monogramImageOfDiameter:v12 forContact:1 monogramStyle:v13 tintColor:v14 customFont:a7 isPersonImage:a3];

  return v15;
}

+ (id)monogramImageOfDiameter:(double)a3 forContact:(id)a4 monogramStyle:(int64_t)a5 tintColor:(id)a6 customFont:(id)a7 isPersonImage:(BOOL *)a8
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v14 = (__CFString *)a4;
  id v15 = a6;
  id v16 = a7;
  v29 = (unsigned __int8 *)a8;
  *a8 = 0;
  double v30 = a3;
  id v31 = [(__CFString *)v14 identifier];

  int64_t v32 = a5;
  BOOL v34 = v15 != 0;
  *(_DWORD *)((char *)&v34 + 1) = v16 != 0;
  uint64_t v33 = [a1 hexStringFromColor:v15];
  v17 = [MEMORY[0x263F08D40] value:&v30 withObjCType:"{?=d^{__CFString}q^{__CFString}BB}"];
  v18 = [a1 contactImageCache];
  v19 = [a1 contactStatusCache];
  v20 = [v18 objectForKey:v17];
  v21 = LogCategory_Daemon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v14;
    _os_log_impl(&dword_2188D1000, v21, OS_LOG_TYPE_DEFAULT, "FMFMonogramUtility monogramImageOfDiameterForContact: %@", buf, 0xCu);
  }

  if (v20)
  {
    v22 = [v19 objectForKey:v17];
    v23 = LogCategory_Daemon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v20;
      _os_log_impl(&dword_2188D1000, v23, OS_LOG_TYPE_DEFAULT, "FMFMonogramUtility: Using cached image %@", buf, 0xCu);
    }

    if (v22) {
      unsigned __int8 *v29 = [v22 BOOLValue];
    }
  }
  else
  {
    if (!v14) {
      goto LABEL_13;
    }
    v24 = [a1 monogrammerWithDiameter:a5 style:v15 useTintColor:v16 customFont:a3];
    v20 = [v24 monogramForContact:v14 isContactImage:v29];

    v25 = LogCategory_Daemon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = @"Image";
      _os_log_impl(&dword_2188D1000, v25, OS_LOG_TYPE_DEFAULT, "FMFMonogramUtility: Record found, using %@", buf, 0xCu);
    }

    if (!v20)
    {
LABEL_13:
      v26 = LogCategory_Daemon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188D1000, v26, OS_LOG_TYPE_DEFAULT, "FMFMonogramUtility: No Record, using placeholder", buf, 2u);
      }

      v20 = [a1 placeholderContactImageOfDiameter:a5 monogramStyle:v15 useTintColor:a3];
    }
    v27 = [NSNumber numberWithBool:*v29];
    [v19 setObject:v27 forKey:v17];

    [v18 setObject:v20 forKey:v17];
  }

  return v20;
}

+ (id)placeholderContactImageOfDiameter:(double)a3 monogramStyle:(int64_t)a4 useTintColor:(id)a5
{
  v5 = [a1 monogrammerWithDiameter:a4 style:a5 useTintColor:0 customFont:a3];
  v6 = [v5 monogramForContact:0];

  return v6;
}

+ (id)monogrammerWithDiameter:(double)a3 style:(int64_t)a4 useTintColor:(id)a5 customFont:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  pthread_mutex_lock(&__FMFAddressBook_MonogrammersMutex);
  [MEMORY[0x263F08B88] isMainThread];
  BOOL v17 = v10 != 0;
  *(_DWORD *)((char *)&v17 + 1) = v11 != 0;
  v16[2] = objc_msgSend(a1, "hexStringFromColor:", v10, *(void *)&a3, a4);
  id v12 = [MEMORY[0x263F08D40] value:v16 withObjCType:"{?=dq^{__CFString}BB}"];
  id v13 = [0 objectForKey:v12];
  if (!v13)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x263EFEC28]) initWithStyle:a4 diameter:a3];
    id v13 = v14;
    if (v17) {
      [v14 monogramsWithTint:v10];
    }
    if (BYTE1(v17)) {
      [v13 setFont:v11];
    }
    [0 setObject:v13 forKey:v12];
  }
  pthread_mutex_unlock(&__FMFAddressBook_MonogrammersMutex);

  return v13;
}

+ (__CFString)hexStringFromColor:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  id v5 = v3;
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v4, kCGRenderingIntentDefault, (CGColorRef)[v5 CGColor], 0);
  CGColorSpaceRelease(v4);
  size_t NumberOfComponents = CGColorGetNumberOfComponents(CopyByMatchingToColorSpace);
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  if (NumberOfComponents > 2)
  {
    double v11 = *Components;
    double v12 = Components[1];
    double v13 = Components[2];
    CGColorRelease(CopyByMatchingToColorSpace);
    float v14 = v11 * 255.0;
    unint64_t v15 = llroundf(v14);
    float v16 = v12 * 255.0;
    float v17 = v13 * 255.0;
    id v10 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"#%02lX%02lX%02lX", v15, llroundf(v16), llroundf(v17));
  }
  else
  {
    v9 = LogCategory_Daemon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_2188D1000, v9, OS_LOG_TYPE_DEFAULT, "FMFMonogramUtility: invalid color provided in hexStringFromColor: %@", buf, 0xCu);
    }

    CGColorRelease(CopyByMatchingToColorSpace);
    id v10 = @"#FFFFFF";
  }

  return v10;
}

@end