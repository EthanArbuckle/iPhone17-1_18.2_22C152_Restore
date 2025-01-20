@interface _UIDocumentPickerURLContainerModel
+ (id)_tagBlipColors;
+ (id)allTags;
+ (id)tagColorsByTag;
+ (void)_tagColorsDidChange;
- (BOOL)afterInitialUpdate;
- (BOOL)shouldAllowPickingType:(id)a3;
- (BOOL)shouldEnableContainer:(id)a3;
- (BOOL)shouldShowContainerForType:(id)a3;
- (NSArray)modelObjects;
- (NSArray)pickableTypes;
- (NSString)description;
- (NSString)displayTitle;
- (NSURL)url;
- (_UIDocumentPickerDirectoryObserver)observer;
- (_UIDocumentPickerURLContainerModel)init;
- (_UIDocumentPickerURLContainerModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5;
- (id)_createObserver;
- (id)scopes;
- (id)urlObserver;
- (unint64_t)pickerMode;
- (void)arrayController:(id)a3 modelChanged:(id)a4 differences:(id)a5;
- (void)callUpdateHandlerWithNewItems:(id)a3 diff:(id)a4;
- (void)dealloc;
- (void)refreshItem:(id)a3 thumbnailOnly:(BOOL)a4;
- (void)setDisplayTitle:(id)a3;
- (void)setModelObjects:(id)a3;
- (void)setObserver:(id)a3;
- (void)setPickableTypes:(id)a3;
- (void)setPickerMode:(unint64_t)a3;
- (void)setUrl:(id)a3;
- (void)setUrlObserver:(id)a3;
- (void)startMonitoringChanges;
- (void)stopMonitoringChanges;
- (void)updateObserverForURL:(id)a3;
- (void)updateSortDescriptors;
@end

@implementation _UIDocumentPickerURLContainerModel

+ (id)tagColorsByTag
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52___UIDocumentPickerURLContainerModel_tagColorsByTag__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tagColorsByTag_onceToken != -1) {
    dispatch_once(&tagColorsByTag_onceToken, block);
  }
  v2 = (void *)[(id)_UIDocumentPickerURLContainerModelColorsByTag copy];

  return v2;
}

+ (id)allTags
{
  id v2 = (id)[a1 tagColorsByTag];
  v3 = (void *)[(id)_UIDocumentPickerURLContainerModelAllTags copy];

  return v3;
}

+ (id)_tagBlipColors
{
  if (_tagBlipColors_onceToken != -1) {
    dispatch_once(&_tagBlipColors_onceToken, &__block_literal_global_4);
  }
  id v2 = (void *)_tagBlipColors_colors;

  return v2;
}

+ (void)_tagColorsDidChange
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 objectForKey:@"FinderTagDictVersion"];
  int v4 = 134217984;
  uint64_t v5 = [v3 unsignedIntegerValue];
  _os_log_fault_impl(&dword_22CA47000, a2, OS_LOG_TYPE_FAULT, "[ERROR] Finder tag dictionary has incorrect version (%lu, should be 2)", (uint8_t *)&v4, 0xCu);
}

- (_UIDocumentPickerURLContainerModel)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  uint64_t v5 = [NSString stringWithUTF8String:"-[_UIDocumentPickerURLContainerModel init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (_UIDocumentPickerURLContainerModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5
{
  id v9 = a4;
  v10 = objc_msgSend(a3, "br_realpathURL");
  if ([(_UIDocumentPickerURLContainerModel *)self isMemberOfClass:objc_opt_class()]
    && (!v10
     || (objc_msgSend(NSURL, "ui_cloudDocsContainerURL"),
         v11 = objc_claimAutoreleasedReturnValue(),
         int v12 = [v10 isEqual:v11],
         v11,
         v12)))
  {
    v13 = [[_UIDocumentPickerRootContainerModel alloc] initWithPickableTypes:v9 mode:a5];
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)_UIDocumentPickerURLContainerModel;
    v14 = [(_UIDocumentPickerContainerModel *)&v27 init];
    v15 = v14;
    if (v14)
    {
      p_url = &v14->_url;
      objc_storeStrong((id *)&v14->_url, v10);
      objc_storeStrong((id *)&v15->_pickableTypes, a4);
      v15->_pickerMode = a5;
      uint64_t v17 = objc_opt_new();
      presentedItemOperationQueue = v15->_presentedItemOperationQueue;
      v15->_presentedItemOperationQueue = (NSOperationQueue *)v17;

      [(NSOperationQueue *)v15->_presentedItemOperationQueue setMaxConcurrentOperationCount:1];
      if (*p_url)
      {
        objc_initWeak(&location, v15);
        v19 = +[BRObservableFile observerForKey:0 onFileURL:*p_url];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __69___UIDocumentPickerURLContainerModel_initWithURL_pickableTypes_mode___block_invoke;
        v24[3] = &unk_26492CF50;
        objc_copyWeak(&v25, &location);
        uint64_t v20 = [v19 addObserverBlock:v24];
        id urlObserver = v15->_urlObserver;
        v15->_id urlObserver = (id)v20;

        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }
    }
    v13 = v15;
    self = &v13->super;
  }
  p_super = &v13->super;

  return p_super;
}

- (void)dealloc
{
  v3 = [(_UIDocumentPickerURLContainerModel *)self observer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerURLContainerModel;
  [(_UIDocumentPickerContainerModel *)&v4 dealloc];
}

- (NSString)displayTitle
{
  displayTitle = self->_displayTitle;
  if (displayTitle)
  {
    v3 = displayTitle;
  }
  else
  {
    url = self->_url;
    id v9 = 0;
    BOOL v6 = [(NSURL *)url getResourceValue:&v9 forKey:*MEMORY[0x263EFF738] error:0];
    v3 = (NSString *)v9;
    if (!v6)
    {
      uint64_t v7 = [(NSURL *)self->_url lastPathComponent];

      v3 = (NSString *)v7;
    }
  }

  return v3;
}

- (void)startMonitoringChanges
{
  v3 = [(_UIDocumentPickerURLContainerModel *)self observer];

  if (!v3)
  {
    objc_super v4 = [(_UIDocumentPickerURLContainerModel *)self _createObserver];
    [(_UIDocumentPickerURLContainerModel *)self setObserver:v4];

    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->_startObservingTime = v5;
  }

  [(_UIDocumentPickerURLContainerModel *)self updateSortDescriptors];
}

- (id)_createObserver
{
  v3 = [(_UIDocumentPickerURLContainerModel *)self url];
  char v4 = objc_msgSend(v3, "br_isInMobileDocuments");

  if (v4) {
    double v5 = _UIDocumentPickerCloudDirectoryObserver;
  }
  else {
    double v5 = _UIDocumentPickerLocalDirectoryObserver;
  }
  id v6 = [v5 alloc];
  uint64_t v7 = [(_UIDocumentPickerURLContainerModel *)self scopes];
  v8 = (void *)[v6 initWithScopes:v7 delegate:self];

  return v8;
}

- (id)scopes
{
  v7[1] = *MEMORY[0x263EF8340];
  v3 = [(_UIDocumentPickerURLContainerModel *)self url];

  if (v3)
  {
    char v4 = [(_UIDocumentPickerURLContainerModel *)self url];
    v7[0] = v4;
    double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)stopMonitoringChanges
{
  v3 = [(_UIDocumentPickerURLContainerModel *)self observer];
  [v3 invalidate];

  [(_UIDocumentPickerURLContainerModel *)self setObserver:0];
  uint64_t v4 = MEMORY[0x263EFFA68];

  [(_UIDocumentPickerURLContainerModel *)self callUpdateHandlerWithNewItems:v4 diff:0];
}

- (void)updateSortDescriptors
{
  v25[3] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __59___UIDocumentPickerURLContainerModel_updateSortDescriptors__block_invoke;
  v21[3] = &unk_26492CF78;
  id v4 = v3;
  id v22 = v4;
  double v5 = (void *)MEMORY[0x230F72310](v21);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __59___UIDocumentPickerURLContainerModel_updateSortDescriptors__block_invoke_3;
  v19 = &unk_26492CFC0;
  id v6 = v5;
  id v20 = v6;
  uint64_t v7 = (void *)MEMORY[0x230F72310](&v16);
  v8 = objc_msgSend(MEMORY[0x263F08B30], "sortDescriptorWithKey:ascending:comparator:", @"title", 1, v6, v16, v17, v18, v19);
  id v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:0 ascending:0 comparator:&__block_literal_global_122];
  v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"tags" ascending:0 comparator:v7];
  int v11 = [(_UIDocumentPickerContainerModel *)self sortOrder];
  switch(v11)
  {
    case 2:
      v23[0] = v10;
      v23[1] = v8;
      v23[2] = v9;
      int v12 = (void *)MEMORY[0x263EFF8C0];
      v13 = v23;
      goto LABEL_7;
    case 1:
      v24[0] = v8;
      v24[1] = v9;
      v24[2] = v10;
      int v12 = (void *)MEMORY[0x263EFF8C0];
      v13 = v24;
      goto LABEL_7;
    case 0:
      v25[0] = v9;
      v25[1] = v8;
      v25[2] = v10;
      int v12 = (void *)MEMORY[0x263EFF8C0];
      v13 = v25;
LABEL_7:
      v14 = [v12 arrayWithObjects:v13 count:3];
      v15 = [(_UIDocumentPickerURLContainerModel *)self observer];
      [v15 setSortDescriptors:v14];

      break;
  }
}

- (void)refreshItem:(id)a3 thumbnailOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(_UIDocumentPickerURLContainerModel *)self modelObjects];
  uint64_t v8 = [v7 indexOfObject:v6];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [MEMORY[0x263F088C8] indexPathForItem:v8 inSection:0];
    v10 = [(_UIDocumentPickerURLContainerModel *)self modelObjects];
    if (v4)
    {
      id v20 = v9;
      v21 = @"_UIDocumentPickerModelModifiedThumbnail";
      int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
      v22[0] = v11;
      int v12 = NSDictionary;
      v13 = (void **)v22;
      v14 = &v21;
    }
    else
    {
      uint64_t v15 = *MEMORY[0x263F1D860];
      uint64_t v17 = v9;
      uint64_t v18 = v15;
      int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
      v19 = v11;
      int v12 = NSDictionary;
      v13 = &v19;
      v14 = (__CFString **)&v18;
    }
    uint64_t v16 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:1];
    [(_UIDocumentPickerURLContainerModel *)self callUpdateHandlerWithNewItems:v10 diff:v16];
  }
}

- (BOOL)shouldEnableContainer:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 documentsTypes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [v4 documentsTypes];
    uint64_t v8 = [v7 valueForKeyPath:@"@distinctUnionOfArrays.LSItemContentTypes"];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          if (-[_UIDocumentPickerURLContainerModel shouldShowContainerForType:](self, "shouldShowContainerForType:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16))
          {
            BOOL v14 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 0;
LABEL_12:
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)shouldAllowPickingType:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = (__CFString *)a3;
  double v5 = [(_UIDocumentPickerURLContainerModel *)self pickableTypes];

  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [(_UIDocumentPickerURLContainerModel *)self pickableTypes];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      uint64_t v10 = *MEMORY[0x263F01A78];
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(__CFString **)(*((void *)&v15 + 1) + 8 * i);
          if (UTTypeConformsTo(v4, v12) || ([(__CFString *)v12 isEqual:v10] & 1) != 0)
          {
            BOOL v13 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        BOOL v13 = 0;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
LABEL_15:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)shouldShowContainerForType:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (__CFString *)a3;
  double v5 = [(_UIDocumentPickerURLContainerModel *)self pickableTypes];

  if (v5)
  {
    if ([(_UIDocumentPickerURLContainerModel *)self pickerMode]
      && [(_UIDocumentPickerURLContainerModel *)self pickerMode] != 1)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      uint64_t v6 = [(_UIDocumentPickerURLContainerModel *)self pickableTypes];
      double v5 = (void *)[v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        uint64_t v7 = *(void *)v11;
        while (2)
        {
          for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v6);
            }
            if (UTTypeConformsTo(*(CFStringRef *)(*((void *)&v10 + 1) + 8 * i), v4))
            {
              LOBYTE(v5) = 1;
              goto LABEL_15;
            }
          }
          double v5 = (void *)[v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }

  return (char)v5;
}

- (void)arrayController:(id)a3 modelChanged:(id)a4 differences:(id)a5
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v51 = a5;
  v58 = [MEMORY[0x263EFF980] array];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v74;
    uint64_t v54 = *(void *)v74;
    do
    {
      uint64_t v11 = 0;
      uint64_t v52 = v9;
      do
      {
        if (*(void *)v74 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v73 + 1) + 8 * v11);
        [v12 setParentModel:self];
        if ([v12 type])
        {
          if ([v12 type] != 2) {
            goto LABEL_40;
          }
          long long v13 = [v12 container];
          int v14 = [v12 pickable];
          uint64_t v15 = [(__CFString *)v13 documentsTypes];
          long long v16 = v15;
          if (v14)
          {
            uint64_t v17 = [v15 count];

            if (v17)
            {
              v60 = v12;
              uint64_t v53 = v11;
              v55 = v13;
              long long v18 = [(__CFString *)v13 documentsTypes];
              long long v19 = [v18 valueForKeyPath:@"@distinctUnionOfArrays.LSItemContentTypes"];

              long long v71 = 0u;
              long long v72 = 0u;
              long long v70 = 0u;
              long long v69 = 0u;
              id v59 = v19;
              uint64_t v20 = [v59 countByEnumeratingWithState:&v69 objects:v78 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                uint64_t v22 = *(void *)v70;
                do
                {
                  for (uint64_t i = 0; i != v21; ++i)
                  {
                    if (*(void *)v70 != v22) {
                      objc_enumerationMutation(v59);
                    }
                    CFStringRef v24 = *(const __CFString **)(*((void *)&v69 + 1) + 8 * i);
                    long long v65 = 0u;
                    long long v66 = 0u;
                    long long v67 = 0u;
                    long long v68 = 0u;
                    id v25 = self;
                    v26 = [(_UIDocumentPickerURLContainerModel *)self pickableTypes];
                    uint64_t v27 = [v26 countByEnumeratingWithState:&v65 objects:v77 count:16];
                    if (v27)
                    {
                      uint64_t v28 = v27;
                      uint64_t v29 = *(void *)v66;
                      while (2)
                      {
                        for (uint64_t j = 0; j != v28; ++j)
                        {
                          if (*(void *)v66 != v29) {
                            objc_enumerationMutation(v26);
                          }
                          CFStringRef v31 = *(const __CFString **)(*((void *)&v65 + 1) + 8 * j);
                          if (UTTypeConformsTo(v31, v24))
                          {
                            v32 = [NSString stringWithFormat:@"Container declares type %@, which requested type %@ conforms to", v24, v31];
                            [v60 setPickabilityReason:v32];

                            goto LABEL_25;
                          }
                        }
                        uint64_t v28 = [v26 countByEnumeratingWithState:&v65 objects:v77 count:16];
                        if (v28) {
                          continue;
                        }
                        break;
                      }
                    }
LABEL_25:

                    self = v25;
                  }
                  uint64_t v21 = [v59 countByEnumeratingWithState:&v69 objects:v78 count:16];
                }
                while (v21);
              }

              uint64_t v9 = v52;
              uint64_t v11 = v53;
              uint64_t v10 = v54;
              long long v13 = v55;
              long long v12 = v60;
              goto LABEL_39;
            }
            v46 = v12;
            v47 = @"Container doesn't declare any types, so it's pickable by default";
            goto LABEL_38;
          }
          v61 = [v15 valueForKeyPath:@"@distinctUnionOfArrays.LSItemContentTypes"];

          v38 = NSString;
          v39 = [(__CFString *)v13 identifier];
          [v61 allObjects];
          v40 = v56 = v13;
          v41 = [v40 componentsJoinedByString:@", "];
          [(_UIDocumentPickerURLContainerModel *)self pickableTypes];
          v43 = uint64_t v42 = v11;
          v44 = [v43 componentsJoinedByString:@", "];
          v45 = [v38 stringWithFormat:@"Container %@ declares types (%@), which doesn't overlap requested types (%@)", v39, v41, v44];
          [v12 setPickabilityReason:v45];

          uint64_t v11 = v42;
          uint64_t v10 = v54;

          long long v13 = v56;
        }
        else
        {
          if ([(_UIDocumentPickerURLContainerModel *)self pickerMode]
            && [(_UIDocumentPickerURLContainerModel *)self pickerMode] != 1)
          {
            [v12 setPickable:0];
            long long v13 = [NSString stringWithFormat:@"Document picker is in a mode that doesn't allow picking items"];
            v46 = v12;
            v47 = v13;
LABEL_38:
            [v46 setPickabilityReason:v47];
            goto LABEL_39;
          }
          long long v13 = [v12 contentType];
          if (!v13)
          {
            [v12 setPickable:0];
            v48 = NSString;
            v34 = [v12 url];
            v35 = [v48 stringWithFormat:@"Item %@ has nil type.", v34];
            [v12 setPickabilityReason:v35];
            goto LABEL_36;
          }
          if (![(_UIDocumentPickerURLContainerModel *)self shouldAllowPickingType:v13])
          {
            [v12 setPickable:0];
            v33 = NSString;
            v34 = [v12 url];
            v35 = [(_UIDocumentPickerURLContainerModel *)self pickableTypes];
            v36 = [v35 componentsJoinedByString:@", "];
            v37 = [v33 stringWithFormat:@"Item %@ has type %@, which does not conform to any of the allowed types (%@)", v34, v13, v36];
            [v12 setPickabilityReason:v37];

LABEL_36:
          }
        }
LABEL_39:

LABEL_40:
        [v58 addObject:v12];
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
    }
    while (v9);
  }

  if (self->_startObservingTime != 0.0)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->_startObservingTime = 0.0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79___UIDocumentPickerURLContainerModel_arrayController_modelChanged_differences___block_invoke;
  block[3] = &unk_26492CFE8;
  block[4] = self;
  id v63 = v58;
  id v64 = v51;
  id v49 = v51;
  id v50 = v58;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)callUpdateHandlerWithNewItems:(id)a3 diff:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10) {
    [(_UIDocumentPickerURLContainerModel *)self setModelObjects:v10];
  }
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v8 = v7;
  if (v6) {
    [v7 setObject:v6 forKey:@"changes"];
  }
  if (v10) {
    [v8 setObject:v10 forKey:@"model"];
  }
  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"_UIDocumentPickerModelUpdatedNotification" object:self userInfo:v8];
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  id v6 = [(_UIDocumentPickerURLContainerModel *)self url];
  id v7 = [v3 stringWithFormat:@"<%@: %p, %@>", v5, self, v6];

  return (NSString *)v7;
}

- (BOOL)afterInitialUpdate
{
  id v2 = [(_UIDocumentPickerURLContainerModel *)self observer];
  char v3 = [v2 afterInitialUpdate];

  return v3;
}

- (void)updateObserverForURL:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIDocumentPickerURLContainerModel *)self url];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = cdui_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[_UIDocumentPickerURLContainerModel updateObserverForURL:](self);
    }

    [(_UIDocumentPickerURLContainerModel *)self setUrl:v4];
    uint64_t v8 = [(_UIDocumentPickerURLContainerModel *)self observer];

    if (v8)
    {
      uint64_t v9 = cdui_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[_UIDocumentPickerURLContainerModel updateObserverForURL:](v9);
      }

      id v10 = [(_UIDocumentPickerURLContainerModel *)self observer];
      [v10 invalidate];

      [(_UIDocumentPickerURLContainerModel *)self setObserver:0];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59___UIDocumentPickerURLContainerModel_updateObserverForURL___block_invoke;
      block[3] = &unk_26492CC78;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

- (NSArray)modelObjects
{
  return self->_modelObjects;
}

- (void)setModelObjects:(id)a3
{
}

- (NSArray)pickableTypes
{
  return self->_pickableTypes;
}

- (void)setPickableTypes:(id)a3
{
}

- (unint64_t)pickerMode
{
  return self->_pickerMode;
}

- (void)setPickerMode:(unint64_t)a3
{
  self->_pickerMode = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void)setDisplayTitle:(id)a3
{
}

- (_UIDocumentPickerDirectoryObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (id)urlObserver
{
  return self->_urlObserver;
}

- (void)setUrlObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_urlObserver, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_displayTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_pickableTypes, 0);
  objc_storeStrong((id *)&self->_modelObjects, 0);

  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
}

- (void)updateObserverForURL:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22CA47000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] move: invalidating observer after move", v1, 2u);
}

- (void)updateObserverForURL:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 url];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22CA47000, v2, v3, "[DEBUG] move: observed folder %@ has moved to %@", v4, v5, v6, v7, v8);
}

@end