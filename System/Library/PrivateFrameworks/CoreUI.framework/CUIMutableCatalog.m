@interface CUIMutableCatalog
- (CUIMutableCatalog)init;
- (CUIMutableCatalog)initWithName:(id)a3;
- (CUIMutableCatalog)initWithName:(id)a3 fromBundle:(id)a4 error:(id *)a5;
- (id)_baseKeyForName:(id)a3;
- (unint64_t)_storageRefForRendition:(id)a3 representsODRContent:(BOOL *)a4;
- (void)dealloc;
- (void)insertCGImage:(CGImage *)a3 name:(id)a4 scale:(double)a5 idiom:(int64_t)a6 subtype:(int64_t)a7;
- (void)insertCGImage:(CGImage *)a3 withName:(id)a4 andDescription:(id)a5;
- (void)removeImageNamed:(id)a3 scale:(double)a4 idiom:(int64_t)a5 subtype:(int64_t)a6;
- (void)removeImageNamed:(id)a3 withDescription:(id)a4;
- (void)removeImagesNamed:(id)a3;
@end

@implementation CUIMutableCatalog

- (CUIMutableCatalog)initWithName:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CUIMutableCatalog;
  uint64_t v13 = 0;
  v4 = [(CUIMutableCatalog *)&v12 init];
  [(CUICatalog *)v4 setStorageRef:+[CUIThemeFacet themeNamed:a3 forBundleIdentifier:kCUIMutableStructureThemeStoreBundlePrefix error:&v13]];
  if (![(CUICatalog *)v4 storageRef])
  {
    _CUILog(4, (uint64_t)"-[CUIMutableCatalog init] got error: %@", v5, v6, v7, v8, v9, v10, v13);

    return 0;
  }
  return v4;
}

- (unint64_t)_storageRefForRendition:(id)a3 representsODRContent:(BOOL *)a4
{
  *a4 = 0;
  return [(CUICatalog *)self storageRef];
}

- (id)_baseKeyForName:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    return v4;
  }
  return result;
}

- (void)insertCGImage:(CGImage *)a3 withName:(id)a4 andDescription:(id)a5
{
  id v10 = [(CUICatalog *)self _themeStore];
  if ((*((unsigned char *)self + 88) & 1) == 0)
  {
    *((unsigned char *)self + 88) |= 1u;
    int v11 = objc_opt_respondsToSelector() & 1;
    char v12 = v11 ? 2 : 0;
    *((unsigned char *)self + 88) = *((unsigned char *)self + 88) & 0xFD | v12;
    if (!v11)
    {
      uint64_t v13 = NSStringFromSelector(a2);
      NSStringFromSelector(a2);
      _CUILog(4, (uint64_t)"-[CUIMutableCatalog %@] themeStore doesn't respond to %@ ", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
    }
  }
  if ((*((unsigned char *)self + 88) & 2) != 0)
  {
    [v10 insertCGImage:a3 withName:a4 andDescription:a5];
  }
}

- (CUIMutableCatalog)init
{
  return 0;
}

- (CUIMutableCatalog)initWithName:(id)a3 fromBundle:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)dealloc
{
  [(CUICatalog *)self clearCachedImageResources];
  v3.receiver = self;
  v3.super_class = (Class)CUIMutableCatalog;
  [(CUICatalog *)&v3 dealloc];
}

- (void)insertCGImage:(CGImage *)a3 name:(id)a4 scale:(double)a5 idiom:(int64_t)a6 subtype:(int64_t)a7
{
  uint64_t v13 = objc_alloc_init(CUINamedImageDescription);
  [(CUINamedImageDescription *)v13 setScale:a5];
  [(CUINamedImageDescription *)v13 setIdiom:a6];
  [(CUINamedImageDescription *)v13 setSubtype:a7];
  [(CUIMutableCatalog *)self insertCGImage:a3 withName:a4 andDescription:v13];
}

- (void)removeImageNamed:(id)a3 scale:(double)a4 idiom:(int64_t)a5 subtype:(int64_t)a6
{
  int v11 = objc_alloc_init(CUINamedImageDescription);
  [(CUINamedImageDescription *)v11 setScale:a4];
  [(CUINamedImageDescription *)v11 setIdiom:a5];
  [(CUINamedImageDescription *)v11 setSubtype:a6];
  [(CUIMutableCatalog *)self removeImageNamed:a3 withDescription:v11];
}

- (void)removeImageNamed:(id)a3 withDescription:(id)a4
{
  id v8 = [(CUICatalog *)self _themeStore];
  if ((*((unsigned char *)self + 88) & 1) == 0)
  {
    *((unsigned char *)self + 88) |= 1u;
    int v9 = objc_opt_respondsToSelector() & 1;
    char v10 = v9 ? 2 : 0;
    *((unsigned char *)self + 88) = *((unsigned char *)self + 88) & 0xFD | v10;
    if (!v9)
    {
      int v11 = NSStringFromSelector(a2);
      NSStringFromSelector(a2);
      _CUILog(4, (uint64_t)"-[CUIMutableCatalog %@] themeStore doesn't respond to %@ ", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
    }
  }
  if ((*((unsigned char *)self + 88) & 2) != 0)
  {
    [v8 removeImageNamed:a3 withDescription:a4];
  }
}

- (void)removeImagesNamed:(id)a3
{
  id v6 = [(CUICatalog *)self _themeStore];
  if ((*((unsigned char *)self + 88) & 1) == 0)
  {
    *((unsigned char *)self + 88) |= 1u;
    int v7 = objc_opt_respondsToSelector() & 1;
    char v8 = v7 ? 2 : 0;
    *((unsigned char *)self + 88) = *((unsigned char *)self + 88) & 0xFD | v8;
    if (!v7)
    {
      int v9 = NSStringFromSelector(a2);
      NSStringFromSelector(a2);
      _CUILog(4, (uint64_t)"-[CUIMutableCatalog %@] themeStore doesn't respond to %@ ", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
    }
  }
  if ((*((unsigned char *)self + 88) & 2) != 0)
  {
    [v6 removeImagesNamed:a3];
  }
}

@end