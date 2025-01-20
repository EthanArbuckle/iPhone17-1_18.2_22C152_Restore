@interface _UIDocumentPickerContainerItem
+ (id)_blockingBadgeForContainer:(id)a3 size:(CGSize)a4 scale:(double)a5;
+ (id)_blockingFolderIconForURL:(id)a3 container:(id)a4 size:(CGSize)a5 scale:(double)a6;
+ (id)_blockingIconForDocumentProxy:(id)a3 withSize:(CGSize)a4;
+ (id)_blockingIconForURL:(id)a3 withSize:(CGSize)a4;
+ (id)_blockingThumbnailForItem:(id)a3 documentProxy:(id)a4 withSize:(CGSize)a5 scale:(double)a6 wantsBorder:(BOOL *)a7 generatedThumbnail:(BOOL *)a8;
+ (id)_lruThumbnailArray;
+ (void)clearLRUThumbnailCache;
+ (void)markThumbnailAsRecentlyUsed:(id)a3;
- (BOOL)isActionApplicableForItem:(int64_t)a3;
- (BOOL)isAlias;
- (BOOL)isEqual:(id)a3;
- (BOOL)pickable;
- (BOOL)renameable;
- (NSDate)modificationDate;
- (NSMapTable)thumbnailsBySize;
- (NSString)description;
- (NSString)pickabilityReason;
- (NSString)subtitle;
- (NSString)subtitle2;
- (NSString)title;
- (NSURL)url;
- (_UIDocumentPickerContainerItem)init;
- (_UIDocumentPickerContainerModel)model;
- (_UIDocumentPickerContainerModel)parentModel;
- (id)_blipWithTags:(id)a3 height:(double)a4 scale:(double)a5;
- (id)_blockingThumbnailWithSize:(CGSize)a3 scale:(double)a4 wantsBorder:(BOOL *)a5;
- (id)_createThumbnailWithSize:(CGSize)a3 scale:(double)a4;
- (id)_formattedSubtitleForNumberOfItems:(unint64_t)a3;
- (id)_resourceIdentifier;
- (id)contentType;
- (id)sortPath;
- (id)tagBlipsWithHeight:(double)a3 scale:(double)a4;
- (id)tags;
- (id)thumbnailWithSize:(CGSize)a3 scale:(double)a4;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)indentationLevel;
- (void)_ensureModelPresent;
- (void)dealloc;
- (void)decrementModelDisplayCount;
- (void)incrementModelDisplayCount;
- (void)modelChanged;
- (void)setParentModel:(id)a3;
- (void)setPickabilityReason:(id)a3;
- (void)setPickable:(BOOL)a3;
- (void)setThumbnailsBySize:(id)a3;
@end

@implementation _UIDocumentPickerContainerItem

- (BOOL)isActionApplicableForItem:(int64_t)a3
{
  v4 = self;
  v5 = v4;
  LOBYTE(v6) = 1;
  switch(a3)
  {
    case 0:
    case 1:
      break;
    case 2:
      BOOL v7 = [(_UIDocumentPickerContainerItem *)v4 type] == 0;
      goto LABEL_5;
    case 3:
      LOBYTE(v6) = [(_UIDocumentPickerContainerItem *)v4 renameable];
      break;
    case 4:
      if ([(_UIDocumentPickerContainerItem *)v4 type]) {
        goto LABEL_10;
      }
      BOOL v6 = ![(_UIDocumentPickerContainerItem *)v5 isAlias];
      break;
    case 5:
    case 6:
      if ([(_UIDocumentPickerContainerItem *)v4 type])
      {
        BOOL v7 = [(_UIDocumentPickerContainerItem *)v5 type] == 1;
LABEL_5:
        LOBYTE(v6) = v7;
      }
      break;
    default:
LABEL_10:
      LOBYTE(v6) = 0;
      break;
  }

  return v6;
}

- (_UIDocumentPickerContainerItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerContainerItem;
  v2 = [(_UIDocumentPickerContainerItem *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_UIDocumentPickerContainerItem *)v2 setPickable:1];
  }
  return v3;
}

- (void)dealloc
{
  [(_UIDocumentPickerContainerItem *)self setParentModel:0];
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerContainerItem;
  [(_UIDocumentPickerContainerItem *)&v3 dealloc];
}

+ (id)_lruThumbnailArray
{
  if (_lruThumbnailArray_onceToken != -1) {
    dispatch_once(&_lruThumbnailArray_onceToken, &__block_literal_global_314);
  }
  v2 = (void *)_lruThumbnailArray_cacheArray;

  return v2;
}

+ (void)markThumbnailAsRecentlyUsed:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _lruThumbnailArray];
  [v5 insertObject:v4 atIndex:0];

  if ((unint64_t)[v5 count] >= 0x29) {
    objc_msgSend(v5, "removeObjectsInRange:", 40, objc_msgSend(v5, "count") - 40);
  }
}

+ (void)clearLRUThumbnailCache
{
  id v2 = [a1 _lruThumbnailArray];
  [v2 removeAllObjects];
}

- (id)thumbnailWithSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = [(_UIDocumentPickerContainerItem *)self url];

  if (v8)
  {
    if (!self->_thumbnailsBySize)
    {
      v9 = [MEMORY[0x263F08968] mapTableWithKeyOptions:0 valueOptions:5];
      thumbnailsBySize = self->_thumbnailsBySize;
      self->_thumbnailsBySize = v9;
    }
    v11 = [_UIDocumentPickerContainerItemThumbnailKey alloc];
    v12 = [(_UIDocumentPickerContainerItem *)self url];
    v13 = -[_UIDocumentPickerContainerItemThumbnailKey initWithPrimaryKey:size:scale:](v11, "initWithPrimaryKey:size:scale:", v12, width, height, a4);

    v14 = [(NSMapTable *)self->_thumbnailsBySize objectForKey:v13];
    if (!v14)
    {
      v15 = [(_UIDocumentPickerContainerItem *)self parentModel];
      if (v15)
      {
        objc_initWeak(&location, self);
        v16 = (void *)MEMORY[0x263F086D0];
        uint64_t v22 = MEMORY[0x263EF8330];
        uint64_t v23 = 3221225472;
        v24 = __58___UIDocumentPickerContainerItem_thumbnailWithSize_scale___block_invoke;
        v25 = &unk_26492D038;
        objc_copyWeak(v29, &location);
        v26 = self;
        v29[1] = *(id *)&width;
        v29[2] = *(id *)&height;
        v29[3] = *(id *)&a4;
        v27 = v13;
        id v17 = v15;
        id v28 = v17;
        v18 = [v16 blockOperationWithBlock:&v22];
        thumbnailLoadOperation = self->_thumbnailLoadOperation;
        self->_thumbnailLoadOperation = v18;

        v20 = objc_msgSend(v17, "thumbnailQueue", v22, v23, v24, v25, v26);
        [v20 addOperation:self->_thumbnailLoadOperation];

        objc_destroyWeak(v29);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_createThumbnailWithSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = (void *)MEMORY[0x230F720E0](self, a2);
  char v29 = 0;
  v9 = -[_UIDocumentPickerContainerItem _blockingThumbnailWithSize:scale:wantsBorder:](self, "_blockingThumbnailWithSize:scale:wantsBorder:", &v29, width, height, a4);
  v10 = v9;
  if (v9)
  {
    [v9 size];
    double v12 = v11 / height;
    [v10 size];
    double v14 = fmax(v12, v13 / width);
    if (fabs(v14 + -1.0) < 2.22044605e-16 && v29 == 0)
    {
      id v22 = v10;
    }
    else
    {
      [v10 size];
      double v17 = v16 / v14;
      [v10 size];
      double v19 = v18 / v14;
      v20 = objc_opt_new();
      [v20 setScale:a4];
      v21 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:format:", v20, v17, v19);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __65___UIDocumentPickerContainerItem__createThumbnailWithSize_scale___block_invoke;
      v24[3] = &unk_26492D060;
      double v26 = v17;
      double v27 = v19;
      id v25 = v10;
      char v28 = v29;
      id v22 = [v21 imageWithActions:v24];
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)_blockingThumbnailWithSize:(CGSize)a3 scale:(double)a4 wantsBorder:(BOOL *)a5
{
  double height = a3.height;
  double width = a3.width;
  if ([(_UIDocumentPickerContainerItem *)self type] == 1)
  {
    if (a5) {
      *a5 = 0;
    }
    v10 = objc_opt_class();
    double v11 = [(_UIDocumentPickerContainerItem *)self url];
    double v12 = objc_msgSend(v10, "_blockingFolderIconForURL:container:size:scale:", v11, 0, width, height, a4);
  }
  else
  {
    double v13 = (void *)MEMORY[0x263F018A8];
    double v14 = [(_UIDocumentPickerContainerItem *)self url];
    v15 = [v14 lastPathComponent];
    double v16 = [(_UIDocumentPickerContainerItem *)self contentType];
    double v11 = [v13 documentProxyForName:v15 type:v16 MIMEType:0];

    double v17 = objc_opt_class();
    double v18 = [(_UIDocumentPickerContainerItem *)self url];
    double v12 = objc_msgSend(v17, "_blockingThumbnailForItem:documentProxy:withSize:scale:wantsBorder:generatedThumbnail:", v18, v11, a5, 0, width, height, a4);
  }

  return v12;
}

- (NSString)title
{
  return 0;
}

- (NSString)subtitle
{
  return 0;
}

- (NSString)subtitle2
{
  return 0;
}

- (NSURL)url
{
  return 0;
}

- (id)_resourceIdentifier
{
  id resourceIdentifier = self->_resourceIdentifier;
  if (!resourceIdentifier)
  {
    id v4 = [(_UIDocumentPickerContainerItem *)self url];
    id v12 = 0;
    uint64_t v5 = *MEMORY[0x263EFF660];
    id v11 = 0;
    [v4 getPromisedItemResourceValue:&v12 forKey:v5 error:&v11];
    id v6 = v12;
    id v7 = v11;

    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(_UIDocumentPickerContainerItem *)self url];
    }
    id v9 = self->_resourceIdentifier;
    self->_id resourceIdentifier = v8;

    id resourceIdentifier = self->_resourceIdentifier;
  }

  return resourceIdentifier;
}

- (_UIDocumentPickerContainerModel)model
{
  return (_UIDocumentPickerContainerModel *)self->_model;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 _resourceIdentifier];
    id v6 = [(_UIDocumentPickerContainerItem *)self _resourceIdentifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v2 = [(_UIDocumentPickerContainerItem *)self _resourceIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)tags
{
  id v2 = [(_UIDocumentPickerContainerItem *)self url];
  id v5 = 0;
  objc_msgSend(v2, "br_getTagNames:error:", &v5, 0);
  id v3 = v5;

  return v3;
}

- (id)tagBlipsWithHeight:(double)a3 scale:(double)a4
{
  char v7 = [(_UIDocumentPickerContainerItem *)self tags];
  id v8 = [v7 reverseObjectEnumerator];
  id v9 = [v8 allObjects];

  if ((unint64_t)[v9 count] >= 4)
  {
    uint64_t v10 = objc_msgSend(v9, "subarrayWithRange:", 0, 3);

    id v9 = (void *)v10;
  }
  id v11 = [(_UIDocumentPickerContainerItem *)self _blipWithTags:v9 height:a3 scale:a4];

  return v11;
}

- (id)_blipWithTags:(id)a3 height:(double)a4 scale:(double)a5
{
  id v7 = a3;
  if ([v7 count])
  {
    id v8 = (void *)MEMORY[0x263F1C6B0];
    id v9 = [NSNumber numberWithDouble:a4];
    uint64_t v10 = [NSNumber numberWithDouble:a5];
    uint64_t v14 = *MEMORY[0x263F1D8D8];
    id v11 = __UIImageCacheKeyWithSentinel();
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __61___UIDocumentPickerContainerItem__blipWithTags_height_scale___block_invoke;
    v15[3] = &unk_26492D0B0;
    double v17 = a4;
    id v16 = v7;
    double v18 = a5;
    id v12 = objc_msgSend(v8, "_cachedImageForKey:fromBlock:", v11, v15, v7, v9, v10, v14);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (NSDate)modificationDate
{
  return (NSDate *)[MEMORY[0x263EFF910] distantPast];
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(_UIDocumentPickerContainerItem *)self url];
  id v7 = [v3 stringWithFormat:@"<%@: %p, %@>", v5, self, v6];

  return (NSString *)v7;
}

- (BOOL)isAlias
{
  if ([(_UIDocumentPickerContainerItem *)self type]) {
    return 0;
  }
  if (!self->_hasCachedIsAlias)
  {
    id v4 = [(_UIDocumentPickerContainerItem *)self url];
    id v6 = 0;
    [v4 getResourceValue:&v6 forKey:*MEMORY[0x263EFF698] error:0];
    id v5 = v6;

    LOBYTE(v4) = [v5 BOOLValue];
    self->_cachedIsAlias = (char)v4;
    self->_hasCachedIsAlias = 1;
  }
  return self->_cachedIsAlias;
}

- (void)incrementModelDisplayCount
{
  ++self->_modelDisplayCount;
  [(_UIDocumentPickerContainerItem *)self _ensureModelPresent];
  if (self->_modelDisplayCount == 1 && self->_model)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel_modelChanged name:@"_UIDocumentPickerModelUpdatedNotification" object:self->_model];

    model = self->_model;
    [(_UIDocumentPickerURLContainerModel *)model startMonitoringChanges];
  }
}

- (void)_ensureModelPresent
{
  if (([(_UIDocumentPickerContainerItem *)self type] == 1
     || [(_UIDocumentPickerContainerItem *)self type] == 2)
    && !self->_model)
  {
    WeakRetained = (_UIDocumentPickerURLContainerModel *)objc_loadWeakRetained((id *)&self->_weak_model);
    model = self->_model;
    self->_model = WeakRetained;

    if (!self->_model)
    {
      id v5 = [(_UIDocumentPickerContainerItem *)self url];
      objc_msgSend(v5, "br_realpathURL");
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      id v6 = [_UIDocumentPickerURLContainerModel alloc];
      id v7 = [(_UIDocumentPickerContainerItem *)self parentModel];
      id v8 = [v7 pickableTypes];
      id v9 = [(_UIDocumentPickerContainerItem *)self parentModel];
      uint64_t v10 = -[_UIDocumentPickerURLContainerModel initWithURL:pickableTypes:mode:](v6, "initWithURL:pickableTypes:mode:", v13, v8, [v9 pickerMode]);
      id v11 = self->_model;
      self->_model = v10;

      id v12 = [(_UIDocumentPickerContainerItem *)self title];
      [(_UIDocumentPickerURLContainerModel *)self->_model setDisplayTitle:v12];

      objc_storeWeak((id *)&self->_weak_model, self->_model);
    }
  }
}

- (void)modelChanged
{
  [(_UIDocumentPickerContainerItem *)self _modelChanged];
  id v3 = [(_UIDocumentPickerContainerItem *)self parentModel];
  [v3 refreshItem:self thumbnailOnly:0];
}

- (void)decrementModelDisplayCount
{
  int64_t v2 = self->_modelDisplayCount - 1;
  self->_modelDisplayCount = v2;
  if (!v2)
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:@"_UIDocumentPickerModelUpdatedNotification" object:self->_model];

    model = self->_model;
    self->_model = 0;

    [(NSOperation *)self->_thumbnailLoadOperation cancel];
    thumbnailLoadOperation = self->_thumbnailLoadOperation;
    self->_thumbnailLoadOperation = 0;
  }
}

- (id)_formattedSubtitleForNumberOfItems:(unint64_t)a3
{
  id v4 = NSString;
  id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v6 = [v5 localizedStringForKey:@"%lu items" value:@"%lu items" table:@"Localizable"];
  id v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (BOOL)renameable
{
  return 0;
}

- (id)contentType
{
  return 0;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)pickable
{
  return self->_pickable;
}

- (void)setPickable:(BOOL)a3
{
  self->_pickable = a3;
}

- (NSMapTable)thumbnailsBySize
{
  return self->_thumbnailsBySize;
}

- (void)setThumbnailsBySize:(id)a3
{
}

- (_UIDocumentPickerContainerModel)parentModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);

  return (_UIDocumentPickerContainerModel *)WeakRetained;
}

- (void)setParentModel:(id)a3
{
}

- (NSString)pickabilityReason
{
  return self->_pickabilityReason;
}

- (void)setPickabilityReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickabilityReason, 0);
  objc_destroyWeak((id *)&self->_parentModel);
  objc_storeStrong((id *)&self->_thumbnailsBySize, 0);
  objc_storeStrong((id *)&self->_thumbnailLoadOperation, 0);
  objc_storeStrong(&self->_resourceIdentifier, 0);
  objc_destroyWeak((id *)&self->_weak_model);

  objc_storeStrong((id *)&self->_model, 0);
}

- (unint64_t)indentationLevel
{
  return 0;
}

- (id)sortPath
{
  id v3 = (void *)MEMORY[0x230F720E0](self, a2);
  id v4 = [(_UIDocumentPickerContainerItem *)self url];
  id v5 = [v4 absoluteString];

  return v5;
}

+ (id)_blockingThumbnailForItem:(id)a3 documentProxy:(id)a4 withSize:(CGSize)a5 scale:(double)a6 wantsBorder:(BOOL *)a7 generatedThumbnail:(BOOL *)a8
{
  double height = a5.height;
  double width = a5.width;
  id v15 = a3;
  id v16 = a4;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v17 = (void *)[objc_alloc(MEMORY[0x263F160A0]) initWithURL:v15];
  double v18 = objc_msgSend(MEMORY[0x263F160A8], "descriptorWithSize:scaleFactor:", width, height, a6);
  id v23 = 0;
  double v19 = [v17 imageForUseMode:0 descriptor:v18 generateIfNeeded:1 contentRect:0 error:&v23];
  id v20 = v23;
  if (v19)
  {
    if (a8) {
      *a8 = 1;
    }
    if (a7) {
      *a7 = 1;
    }
  }
  else
  {
    v21 = cdui_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      +[_UIDocumentPickerContainerItem(Icons) _blockingThumbnailForItem:documentProxy:withSize:scale:wantsBorder:generatedThumbnail:](v15);
    }

    if (a8) {
      *a8 = 0;
    }
    double v19 = objc_msgSend(a1, "_blockingIconForDocumentProxy:withSize:", v16, width, height);
  }

  return v19;
}

+ (id)_blockingIconForURL:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v12 = 0;
  [v7 getPromisedItemResourceValue:&v12 forKey:*MEMORY[0x263EFF780] error:0];
  id v8 = (__CFString *)v12;
  if (UTTypeConformsTo(v8, (CFStringRef)*MEMORY[0x263F01A30]))
  {
    id v9 = objc_msgSend(a1, "_blockingFolderIconForURL:container:size:scale:", v7, 0, width, height, 0.0);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F018A8] documentProxyForName:0 type:v8 MIMEType:0];
    id v9 = objc_msgSend(a1, "_blockingIconForDocumentProxy:withSize:", v10, width, height);
  }

  return v9;
}

+ (id)_blockingIconForDocumentProxy:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  id v5 = a3;
  if (height <= 100.0)
  {
    id v6 = (void *)MEMORY[0x263F1C6B0];
    id v7 = v5;
    if (height >= 50.0) {
      uint64_t v8 = 11;
    }
    else {
      uint64_t v8 = 13;
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x263F1C6B0];
    id v7 = v5;
    uint64_t v8 = 12;
  }
  id v9 = [v6 _iconForResourceProxy:v7 format:v8];

  return v9;
}

+ (id)_blockingBadgeForContainer:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  char v43 = 1;
  id v9 = [v8 identifier];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F324E8]];

  if (!v10) {
    goto LABEL_3;
  }
  id v11 = (void *)MEMORY[0x263F1C6B0];
  id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v13 = [MEMORY[0x263F1CB00] traitCollectionWithDisplayScale:a5];
  uint64_t v14 = [v11 imageNamed:@"iCloudDrive-TopLevel" inBundle:v12 compatibleWithTraitCollection:v13];

  char v43 = 0;
  if (!v14)
  {
LABEL_3:
    id v15 = (void *)MEMORY[0x263F1C6B0];
    id v16 = objc_msgSend(v8, "imageDataForSize:scale:shouldTransformToAppIcon:", (uint64_t)a5, &v43, width, height);
    uint64_t v14 = [v15 imageWithData:v16 scale:a5];

    if (v14
      || (double v17 = width * a5,
          double v18 = (void *)MEMORY[0x263F1C6B0],
          objc_msgSend(v8, "imageDataForSize:scale:shouldTransformToAppIcon:", 1, &v43, v17, height * a5),
          double v19 = objc_claimAutoreleasedReturnValue(),
          [v18 imageWithData:v19 scale:a5],
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          v19,
          v14))
    {
LABEL_5:
      if (!v43) {
        goto LABEL_8;
      }
      [v14 scale];
      uint64_t v20 = objc_msgSend(v14, "_applicationIconImageForFormat:precomposed:scale:", 2, 0);
      goto LABEL_7;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v14 = objc_msgSend(v8, "imageRepresentationsAvailable", 0);
    uint64_t v22 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (!v22)
    {
LABEL_19:
      uint64_t v20 = 0;
LABEL_7:

      uint64_t v14 = (void *)v20;
      goto LABEL_8;
    }
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v40;
LABEL_13:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v40 != v24) {
        objc_enumerationMutation(v14);
      }
      double v26 = *(void **)(*((void *)&v39 + 1) + 8 * v25);
      double v27 = [v26 objectForKey:@"size"];
      [v27 CGSizeValue];
      double v29 = v28;
      double v31 = v30;

      v32 = [v26 objectForKey:@"scale"];
      [v32 floatValue];
      float v34 = v33;
      double v35 = v33;

      char v43 = 0;
      if (v29 * v35 >= v17) {
        break;
      }
      if (v23 == ++v25)
      {
        uint64_t v23 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16, v29 * v35);
        if (v23) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
    v36 = (void *)MEMORY[0x263F1C6B0];
    v37 = objc_msgSend(v8, "imageDataForSize:scale:shouldTransformToAppIcon:", (uint64_t)v34, &v43, v29, v31);
    uint64_t v38 = [v36 imageWithData:v37 scale:a5];

    uint64_t v14 = (void *)v38;
    if (v38) {
      goto LABEL_5;
    }
  }
LABEL_8:

  return v14;
}

+ (id)_blockingFolderIconForURL:(id)a3 container:(id)a4 size:(CGSize)a5 scale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = 0;
  double v15 = *MEMORY[0x263F001B0];
  double v14 = *(double *)(MEMORY[0x263F001B0] + 8);
  BOOL v16 = 1;
  uint64_t v17 = 0;
  while (v13 != 20)
  {
    if (vabdd_f64(width, *(double *)&qword_26492D0D0[v13]) >= 1.0)
    {
      double v18 = 0;
    }
    else
    {
      double v18 = [NSString stringWithUTF8String:qword_26492D0D0[v13 + 1]];
      uint64_t v17 = qword_26492D0D0[v13 + 2];
      double v14 = *(double *)&qword_26492D0D0[v13 + 3];
      BOOL v16 = LOBYTE(qword_26492D0D0[v13 + 4]) != 0;
      double v15 = v14;
    }
    v13 += 5;
    if (v18)
    {
      if (v12) {
        goto LABEL_8;
      }
LABEL_13:
      v21 = objc_msgSend(v11, "br_containerID");
      if ([v21 isEqualToString:*MEMORY[0x263F324E8]])
      {
        uint64_t v22 = objc_msgSend(v11, "br_pathRelativeToSyncedRootURLForContainerID:", v21);
        uint64_t v23 = [v22 pathComponents];
        uint64_t v24 = [v23 count];

        if (v24 == 2)
        {
          uint64_t v25 = [v22 lastPathComponent];
          if ([v25 isEqualToString:*MEMORY[0x263F32500]])
          {
            long long v40 = v25;
            double v26 = (void *)MEMORY[0x263F1C6B0];
            [NSString stringWithFormat:@"Desktop%@", v18];
            goto LABEL_24;
          }
          if ([v25 isEqualToString:*MEMORY[0x263F32510]])
          {
            long long v40 = v25;
            double v26 = (void *)MEMORY[0x263F1C6B0];
            [NSString stringWithFormat:@"Documents%@", v18];
            uint64_t v29 = LABEL_24:;
            double v30 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
            double v31 = [MEMORY[0x263F1CB00] traitCollectionWithDisplayScale:a6];
            v32 = v26;
            float v33 = (void *)v29;
            id v19 = [v32 imageNamed:v29 inBundle:v30 compatibleWithTraitCollection:v31];

            uint64_t v25 = v40;
          }
          else
          {
            id v19 = 0;
          }
        }
        else
        {
          id v19 = 0;
        }
      }
      else
      {
        id v19 = 0;
      }

      goto LABEL_29;
    }
  }
  uint64_t v20 = cdui_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    +[_UIDocumentPickerContainerItem(Icons) _blockingFolderIconForURL:container:size:scale:](width, height, (uint64_t)v11, v20);
  }

  double v18 = 0;
  if (!v12) {
    goto LABEL_13;
  }
LABEL_8:
  if (v16)
  {
    objc_msgSend(a1, "_blockingBadgeForContainer:size:scale:", v12, v15, v14, a6);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v27 = objc_msgSend(a1, "_blockingBadgeForContainer:size:scale:", v12, width, height, a6);
    if (v27)
    {
      id v19 = v27;
      double v28 = v19;
      goto LABEL_31;
    }
    id v19 = 0;
  }
LABEL_29:
  float v34 = (void *)MEMORY[0x263F1C6B0];
  double v35 = [NSString stringWithFormat:@"Folder%@", v18];
  v36 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  double v28 = [v34 imageNamed:v35 inBundle:v36 compatibleWithTraitCollection:0];

  if (v19)
  {
    id v37 = objc_alloc(MEMORY[0x263F1C680]);
    [v28 size];
    uint64_t v38 = objc_msgSend(v37, "initWithSize:");
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __88___UIDocumentPickerContainerItem_Icons___blockingFolderIconForURL_container_size_scale___block_invoke;
    v41[3] = &unk_26492D1A0;
    id v42 = v28;
    double v44 = v15;
    double v45 = v14;
    uint64_t v46 = v17;
    id v19 = v19;
    id v43 = v19;
    double v28 = [v38 imageWithActions:v41];
  }
LABEL_31:

  return v28;
}

@end