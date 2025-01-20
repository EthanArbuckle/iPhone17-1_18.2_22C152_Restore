@interface CKAddressBook
+ (id)contactImageCache;
+ (id)contactImageOfDiameter:(double)a3 forID:(id)a4 monogramStyle:(int64_t)a5 tintMonogramText:(BOOL)a6;
+ (id)contactImageOfDiameter:(double)a3 forID:(id)a4 monogramStyle:(int64_t)a5 tintMonogramText:(BOOL)a6 customFont:(id)a7;
+ (id)locationSharingContactImageOfDiameter:(double)a3 forID:(id)a4 useCustomFont:(BOOL)a5;
+ (id)monogrammerProvider;
+ (id)monogrammerWithDiameter:(double)a3 style:(int64_t)a4 useAppTintColor:(BOOL)a5 customFont:(id)a6;
+ (id)placeholderContactImageOfDiameter:(double)a3 monogramStyle:(int64_t)a4 tintMonogramText:(BOOL)a5;
+ (id)transcriptContactImageOfDiameter:(double)a3 forID:(id)a4;
+ (void)flushMonogrammers;
@end

@implementation CKAddressBook

+ (id)contactImageCache
{
  if (contactImageCache_once != -1) {
    dispatch_once(&contactImageCache_once, &__block_literal_global_246);
  }
  v2 = (void *)contactImageCache_cache;

  return v2;
}

void __34__CKAddressBook_contactImageCache__block_invoke()
{
  uint64_t v0 = CKDefaultCacheLimit();
  uint64_t v1 = CKCreateNSCache(v0);
  v2 = (void *)contactImageCache_cache;
  contactImageCache_cache = v1;

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:contactImageCache_cache selector:sel_removeAllObjects name:*MEMORY[0x1E4F6CA58] object:0];
}

+ (id)contactImageOfDiameter:(double)a3 forID:(id)a4 monogramStyle:(int64_t)a5 tintMonogramText:(BOOL)a6
{
  return (id)[a1 contactImageOfDiameter:a4 forID:a5 monogramStyle:a6 tintMonogramText:0 customFont:a3];
}

+ (id)contactImageOfDiameter:(double)a3 forID:(id)a4 monogramStyle:(int64_t)a5 tintMonogramText:(BOOL)a6 customFont:(id)a7
{
  BOOL v8 = a6;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  *(double *)v25 = a3;
  v25[1] = [v12 intValue];
  v25[2] = a5;
  BOOL v26 = v8;
  *(_DWORD *)((char *)&v26 + 1) = v13 != 0;
  v14 = [MEMORY[0x1E4F29238] value:v25 withObjCType:"{?=diqBB}"];
  v15 = [a1 contactImageCache];
  v16 = [v15 objectForKey:v14];
  if (!v16)
  {
    v17 = [MEMORY[0x1E4F6E6D8] sharedInstance];
    [MEMORY[0x1E4F1BBE8] descriptorForRequiredKeysIncludingImage:1];
    int64_t v24 = a5;
    v19 = BOOL v18 = v8;
    v27[0] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    v21 = [v17 fetchCNContactForHandleID:v12 withKeys:v20];

    if (![MEMORY[0x1E4F6E6D8] isCNContactAKnownContact:v21]
      || ([a1 monogrammerWithDiameter:v24 style:v18 useAppTintColor:v13 customFont:a3],
          v22 = objc_claimAutoreleasedReturnValue(),
          [v22 monogramForContact:v21],
          v16 = objc_claimAutoreleasedReturnValue(),
          v22,
          !v16))
    {
      v16 = [a1 placeholderContactImageOfDiameter:v24 monogramStyle:v18 tintMonogramText:a3];
    }
    [v15 setObject:v16 forKey:v14];
  }

  return v16;
}

+ (id)placeholderContactImageOfDiameter:(double)a3 monogramStyle:(int64_t)a4 tintMonogramText:(BOOL)a5
{
  v5 = [a1 monogrammerWithDiameter:a4 style:a5 useAppTintColor:0 customFont:a3];
  v6 = [v5 silhouetteMonogram];

  return v6;
}

+ (id)transcriptContactImageOfDiameter:(double)a3 forID:(id)a4
{
  return (id)[a1 contactImageOfDiameter:a4 forID:0 monogramStyle:0 tintMonogramText:a3];
}

+ (id)locationSharingContactImageOfDiameter:(double)a3 forID:(id)a4 useCustomFont:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if (v5)
  {
    v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:42.0];
  }
  else
  {
    v9 = 0;
  }
  v10 = [a1 contactImageOfDiameter:v8 forID:1 monogramStyle:1 tintMonogramText:v9 customFont:a3];

  return v10;
}

+ (id)monogrammerProvider
{
  return +[_CKAddressBookMonogrammerProvider sharedInstance];
}

+ (void)flushMonogrammers
{
  pthread_mutex_lock(&__CKAddressBook_MonogrammersMutex);
  pthread_mutex_unlock(&__CKAddressBook_MonogrammersMutex);
  id v3 = [a1 contactImageCache];
  [v3 removeAllObjects];
}

+ (id)monogrammerWithDiameter:(double)a3 style:(int64_t)a4 useAppTintColor:(BOOL)a5 customFont:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  pthread_mutex_lock(&__CKAddressBook_MonogrammersMutex);
  [MEMORY[0x1E4F29060] isMainThread];
  *(double *)BOOL v18 = a3;
  v18[1] = a4;
  BOOL v19 = v6;
  *(_DWORD *)((char *)&v19 + 1) = v10 != 0;
  v11 = [MEMORY[0x1E4F29238] value:v18 withObjCType:"{?=dqBB}"];
  id v12 = [0 objectForKey:v11];
  if (!v12)
  {
    id v13 = [a1 monogrammerProvider];
    id v12 = [v13 monogrammerForStyle:a4 diameter:a3];

    if (v6)
    {
      v14 = +[CKUIBehavior sharedBehaviors];
      v15 = [v14 theme];
      v16 = [v15 appTintColor];
      [v12 monogramsWithTint:v16];
    }
    if (v10) {
      [v12 setFont:v10];
    }
    [0 setObject:v12 forKey:v11];
  }
  pthread_mutex_unlock(&__CKAddressBook_MonogrammersMutex);

  return v12;
}

@end