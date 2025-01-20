@interface HFWallpaperEditCollectionBuilder
- (BOOL)hkObjectNewlyCreated;
- (HFHomeKitObject)hkObject;
- (HFWallpaperEditCollection)updatedEditCollection;
- (HFWallpaperEditCollectionBuilder)initWithHomeKitObject:(id)a3;
- (HFWallpaperEditCollectionBuilder)initWithHomeKitObject:(id)a3 namedWallpaperCollectionType:(int64_t)a4;
- (NAFuture)initialEditCollectionFuture;
- (id)commitWallpaper;
- (id)description;
- (id)editCollectionForWallpaper:(id)a3 image:(id)a4;
- (id)wallpaperEditCollectionFuture;
- (int64_t)namedWallpaperCollectionType;
- (void)setHkObject:(id)a3;
- (void)setHkObjectNewlyCreated:(BOOL)a3;
- (void)setInitialEditCollectionFuture:(id)a3;
- (void)setNamedWallpaperCollectionType:(int64_t)a3;
- (void)setUpdatedEditCollection:(id)a3;
- (void)setWallpaper:(id)a3 image:(id)a4;
@end

@implementation HFWallpaperEditCollectionBuilder

- (HFWallpaperEditCollectionBuilder)initWithHomeKitObject:(id)a3 namedWallpaperCollectionType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFWallpaperEditCollectionBuilder;
  v8 = [(HFWallpaperEditCollectionBuilder *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_hkObject, a3);
    v9->_namedWallpaperCollectionType = a4;
  }

  return v9;
}

- (HFWallpaperEditCollectionBuilder)initWithHomeKitObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFWallpaperEditCollectionBuilder;
  v6 = [(HFWallpaperEditCollectionBuilder *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hkObject, a3);
  }

  return v7;
}

- (id)description
{
  int64_t v3 = [(HFWallpaperEditCollectionBuilder *)self namedWallpaperCollectionType];
  v4 = @"room";
  if (!v3) {
    v4 = @"home";
  }
  id v5 = NSString;
  v6 = v4;
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  objc_super v9 = [(HFWallpaperEditCollectionBuilder *)self updatedEditCollection];
  v10 = [v5 stringWithFormat:@"<%@: %p, type = %@, editCollection = %@>", v8, self, v6, v9];

  return v10;
}

- (void)setHkObject:(id)a3
{
  id v10 = a3;
  p_hkObject = &self->_hkObject;
  uint64_t v6 = [(HFHomeKitObject *)self->_hkObject isEqual:v10];
  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    v8 = *p_hkObject;
    if (*p_hkObject)
    {
      objc_super v9 = [(HFWallpaperEditCollectionBuilder *)self initialEditCollectionFuture];
      [v9 cancel];

      [(HFWallpaperEditCollectionBuilder *)self setInitialEditCollectionFuture:0];
    }
    [(HFWallpaperEditCollectionBuilder *)self setHkObjectNewlyCreated:v8 == 0];
    objc_storeStrong((id *)&self->_hkObject, a3);
    id v7 = v10;
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (id)wallpaperEditCollectionFuture
{
  int64_t v3 = [(HFWallpaperEditCollectionBuilder *)self updatedEditCollection];
  if (v3)
  {
    v4 = (void *)MEMORY[0x263F58190];
    id v5 = [(HFWallpaperEditCollectionBuilder *)self updatedEditCollection];
    uint64_t v6 = [v4 futureWithResult:v5];
  }
  else
  {
    uint64_t v6 = [(HFWallpaperEditCollectionBuilder *)self initialEditCollectionFuture];
  }

  return v6;
}

- (void)setWallpaper:(id)a3 image:(id)a4
{
  id v5 = [(HFWallpaperEditCollectionBuilder *)self editCollectionForWallpaper:a3 image:a4];
  [(HFWallpaperEditCollectionBuilder *)self setUpdatedEditCollection:v5];
}

- (id)commitWallpaper
{
  int64_t v3 = [(HFWallpaperEditCollectionBuilder *)self initialEditCollectionFuture];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__HFWallpaperEditCollectionBuilder_commitWallpaper__block_invoke;
  v6[3] = &unk_264095570;
  v6[4] = self;
  v4 = [v3 flatMap:v6];

  return v4;
}

id __51__HFWallpaperEditCollectionBuilder_commitWallpaper__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) hkObjectNewlyCreated]) {
    goto LABEL_4;
  }
  uint64_t v4 = [*(id *)(a1 + 32) updatedEditCollection];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = [v3 wallpaper];
    id v7 = [*(id *)(a1 + 32) updatedEditCollection];
    v8 = [v7 wallpaper];
    char v9 = [v6 isEqual:v8];

    if ((v9 & 1) == 0)
    {
LABEL_4:
      uint64_t v10 = [*(id *)(a1 + 32) updatedEditCollection];
      objc_super v11 = (void *)v10;
      if (v10) {
        v12 = (void *)v10;
      }
      else {
        v12 = v3;
      }
      id v13 = v12;

      v14 = +[HFWallpaperManager sharedInstance];
      v15 = [v13 wallpaper];
      v16 = [v13 originalImage];

      v17 = [*(id *)(a1 + 32) hkObject];
      [v14 setWallpaper:v15 image:v16 forHomeKitObject:v17];

      [*(id *)(a1 + 32) setInitialEditCollectionFuture:0];
      [*(id *)(a1 + 32) setHkObjectNewlyCreated:0];
    }
  }
  v18 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA88]];

  return v18;
}

- (NAFuture)initialEditCollectionFuture
{
  if (!self->_initialEditCollectionFuture)
  {
    id v3 = [(HFWallpaperEditCollectionBuilder *)self hkObject];

    if (v3)
    {
      objc_initWeak(&location, self);
      uint64_t v4 = (void *)MEMORY[0x263F58190];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __63__HFWallpaperEditCollectionBuilder_initialEditCollectionFuture__block_invoke;
      v17[3] = &unk_26408F0F0;
      objc_copyWeak(&v18, &location);
      id v5 = [v4 lazyFutureWithBlock:v17];
      initialEditCollectionFuture = self->_initialEditCollectionFuture;
      self->_initialEditCollectionFuture = v5;

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      id v7 = +[HFWallpaperManager sharedInstance];
      v8 = objc_msgSend(v7, "defaultWallpaperForCollectionType:", -[HFWallpaperEditCollectionBuilder namedWallpaperCollectionType](self, "namedWallpaperCollectionType"));

      char v9 = +[HFWallpaperManager sharedInstance];
      uint64_t v10 = [v9 wallpaperImageForWallpaper:v8 variant:0];

      objc_super v11 = (void *)MEMORY[0x263F58190];
      v12 = [(HFWallpaperEditCollectionBuilder *)self editCollectionForWallpaper:v8 image:v10];
      id v13 = [v11 futureWithResult:v12];
      v14 = self->_initialEditCollectionFuture;
      self->_initialEditCollectionFuture = v13;
    }
  }
  v15 = self->_initialEditCollectionFuture;
  return v15;
}

void __63__HFWallpaperEditCollectionBuilder_initialEditCollectionFuture__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[HFWallpaperManager sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained hkObject];
  id v7 = [v4 wallpaperForHomeKitObject:v6];
  id v10 = [v7 flatMap:&__block_literal_global_109];

  v8 = [v3 completionHandlerAdapter];

  id v9 = (id)[v10 addCompletionBlock:v8];
}

id __63__HFWallpaperEditCollectionBuilder_initialEditCollectionFuture__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFWallpaperManager sharedInstance];
  uint64_t v4 = [v3 wallpaperImageForWallpaper:v2 variant:0];

  id v5 = +[HFWallpaperManager sharedInstance];
  uint64_t v6 = [v5 wallpaperImageForWallpaper:v2 variant:1];

  id v7 = [[HFWallpaperEditCollection alloc] initWithWallpaper:v2 originalImage:v4 processedImage:v6];
  v8 = [MEMORY[0x263F58190] futureWithResult:v7];

  return v8;
}

- (id)editCollectionForWallpaper:(id)a3 image:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[HFWallpaperManager sharedInstance];
  v8 = [v7 generateProcessedImageFromWallpaper:v6 originalImage:v5];

  id v9 = [[HFWallpaperEditCollection alloc] initWithWallpaper:v6 originalImage:v5 processedImage:v8];
  return v9;
}

- (HFHomeKitObject)hkObject
{
  return self->_hkObject;
}

- (int64_t)namedWallpaperCollectionType
{
  return self->_namedWallpaperCollectionType;
}

- (void)setNamedWallpaperCollectionType:(int64_t)a3
{
  self->_namedWallpaperCollectionType = a3;
}

- (BOOL)hkObjectNewlyCreated
{
  return self->_hkObjectNewlyCreated;
}

- (void)setHkObjectNewlyCreated:(BOOL)a3
{
  self->_hkObjectNewlyCreated = a3;
}

- (void)setInitialEditCollectionFuture:(id)a3
{
}

- (HFWallpaperEditCollection)updatedEditCollection
{
  return self->_updatedEditCollection;
}

- (void)setUpdatedEditCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedEditCollection, 0);
  objc_storeStrong((id *)&self->_initialEditCollectionFuture, 0);
  objc_storeStrong((id *)&self->_hkObject, 0);
}

@end