@interface AXCodeItem
+ (id)_codeItemQueue;
+ (int64_t)codeItemTypeFromString:(id)a3;
- (AXCodeItem)associatedAccessibilityCodeItem;
- (AXCodeItem)initWithPath:(id)a3 isDyldOpened:(BOOL)a4;
- (AXCodeItem)targetCodeItem;
- (BOOL)_isSystemAppAccessibilityBundle;
- (BOOL)isAccessibilityBundle;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLoaded;
- (NSArray)excludedProcesses;
- (NSBundle)cachedBundle;
- (NSMutableDictionary)platformToTarget;
- (NSString)debugCodeTypeDescription;
- (NSString)name;
- (NSString)path;
- (id)description;
- (id)initAccessibilityCodeItemWithPath:(id)a3 targetType:(int64_t)a4 platformToTarget:(id)a5 loadOrder:(unsigned __int16)a6;
- (id)prepareBackingBundleIfNeeded:(id *)a3;
- (int64_t)targetType;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)loadedAtTimestamp;
- (unsigned)loadOrder;
- (void)_cacheLazyProperties;
- (void)addPlatformToTargetEntries:(id)a3;
- (void)loadWithStrategy:(int64_t)a3 onQueue:(id)a4 completion:(id)a5;
- (void)setAssociatedAccessibilityCodeItem:(id)a3;
- (void)setExcludedProcesses:(id)a3;
- (void)setIsLoaded:(BOOL)a3;
- (void)setLoadOrder:(unsigned __int16)a3;
- (void)setName:(id)a3;
- (void)setPath:(id)a3;
- (void)setPlatformToTarget:(id)a3;
- (void)setTargetCodeItem:(id)a3;
- (void)setTargetType:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation AXCodeItem

+ (id)_codeItemQueue
{
  if (_codeItemQueue_onceToken != -1) {
    dispatch_once(&_codeItemQueue_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)_codeItemQueue__queue;
  return v2;
}

uint64_t __28__AXCodeItem__codeItemQueue__block_invoke()
{
  _codeItemQueue__queue = (uint64_t)dispatch_queue_create("AXCodeItemAccess", 0);
  return MEMORY[0x1F41817F8]();
}

+ (int64_t)codeItemTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"dylib"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"bundle"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"framework"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"app"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"executable"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"appex"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"assistantUIBundle"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"siriUIBundle"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"siriUIPresentationBundle"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"uibundle"])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"qldisplay"])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"fpenroll"])
  {
    int64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"servicebundle"])
  {
    int64_t v4 = 13;
  }
  else if ([v3 isEqualToString:@"lockbundle"])
  {
    int64_t v4 = 14;
  }
  else if ([v3 isEqualToString:@"XPCServices"])
  {
    int64_t v4 = 16;
  }
  else if ([v3 isEqualToString:@"wkbundle"])
  {
    int64_t v4 = 15;
  }
  else if ([v3 isEqualToString:@"healthplugin"])
  {
    int64_t v4 = 17;
  }
  else if ([v3 isEqualToString:@"axbundle"])
  {
    int64_t v4 = 18;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (AXCodeItem)initWithPath:(id)a3 isDyldOpened:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXCodeItem;
  v7 = [(AXCodeItem *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = -1;
    [(AXCodeItem *)v7 setPath:v6];
    if (v4)
    {
      *(unsigned char *)&v8->_flags |= 1u;
      uint64_t v9 = mach_absolute_time();
    }
    else
    {
      uint64_t v9 = 0;
    }
    v8->_loadedAtTimestamp = v9;
  }

  return v8;
}

- (id)initAccessibilityCodeItemWithPath:(id)a3 targetType:(int64_t)a4 platformToTarget:(id)a5 loadOrder:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  id v10 = a5;
  objc_super v11 = [(AXCodeItem *)self initWithPath:a3 isDyldOpened:0];
  v12 = v11;
  if (v11)
  {
    [(AXCodeItem *)v11 setTargetType:a4];
    [(AXCodeItem *)v12 setLoadOrder:v6];
    [(AXCodeItem *)v12 setPlatformToTarget:v10];
  }

  return v12;
}

- (void)addPlatformToTargetEntries:(id)a3
{
  id v4 = a3;
  id v5 = [(AXCodeItem *)self platformToTarget];
  [v5 addEntriesFromDictionary:v4];
}

- (id)description
{
  if ([(AXCodeItem *)self type] == 18)
  {
    id v3 = [(AXCodeItem *)self platformToTarget];
    id v4 = [v3 debugDescription];
    id v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

    uint64_t v6 = [(AXCodeItem *)self excludedProcesses];
    v7 = [v6 componentsJoinedByString:@", "];

    v8 = NSString;
    unsigned int v9 = [(AXCodeItem *)self loadOrder];
    id v10 = [(AXCodeItem *)self name];
    objc_super v11 = [(AXCodeItem *)self path];
    v12 = _AXNameForCodeItemType([(AXCodeItem *)self targetType]);
    v13 = [v8 stringWithFormat:@"AXCodeItem<%p> [Rank:%u] %@ [AXBundle name:%@] [Platforms and Targets:%@ %@] [Excluded: %@]", self, v9, v10, v11, v5, v12, v7];
  }
  else
  {
    v14 = NSString;
    id v5 = _AXNameForCodeItemType([(AXCodeItem *)self type]);
    v7 = [(AXCodeItem *)self name];
    id v10 = [(AXCodeItem *)self path];
    v13 = [v14 stringWithFormat:@"AXCodeItem<%p> [type:%@ name:%@] %@", self, v5, v7, v10];
  }

  return v13;
}

- (unint64_t)hash
{
  v2 = [(AXCodeItem *)self path];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 path];
    uint64_t v6 = [(AXCodeItem *)self path];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)name
{
  name = self->_name;
  if (!name)
  {
    [(AXCodeItem *)self _cacheLazyProperties];
    name = self->_name;
  }
  return name;
}

- (int64_t)type
{
  int64_t result = self->_type;
  if (result == -1)
  {
    [(AXCodeItem *)self _cacheLazyProperties];
    return self->_type;
  }
  return result;
}

- (unsigned)loadOrder
{
  if ([(AXCodeItem *)self _isSystemAppAccessibilityBundle]) {
    return 18000;
  }
  else {
    return self->_loadOrder;
  }
}

- (void)_cacheLazyProperties
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  unint64_t v3 = [(AXCodeItem *)self path];
  id v4 = [v3 pathComponents];
  id v5 = [v4 reverseObjectEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (!v6) {
    goto LABEL_43;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v50;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v50 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      objc_super v11 = [v10 pathExtension];
      int v12 = [v11 isEqualToString:@"dylib"];

      if (v12)
      {
        int64_t v45 = 1;
        goto LABEL_42;
      }
      v13 = [v10 pathExtension];
      int v14 = [v13 isEqualToString:@"bundle"];

      if (v14)
      {
        int64_t v45 = 2;
        goto LABEL_42;
      }
      v15 = [v10 pathExtension];
      int v16 = [v15 isEqualToString:@"framework"];

      if (v16)
      {
        int64_t v45 = 3;
        goto LABEL_42;
      }
      v17 = [v10 pathExtension];
      int v18 = [v17 isEqualToString:@"app"];

      if (v18)
      {
        int64_t v45 = 4;
        goto LABEL_42;
      }
      v19 = [v10 pathExtension];
      int v20 = [v19 isEqualToString:@"appex"];

      if (v20)
      {
        int64_t v45 = 6;
        goto LABEL_42;
      }
      v21 = [v10 pathExtension];
      int v22 = [v21 isEqualToString:@"assistantUIBundle"];

      if (v22)
      {
        int64_t v45 = 7;
        goto LABEL_42;
      }
      v23 = [v10 pathExtension];
      int v24 = [v23 isEqualToString:@"siriUIBundle"];

      if (v24)
      {
        int64_t v45 = 8;
        goto LABEL_42;
      }
      v25 = [v10 pathExtension];
      int v26 = [v25 isEqualToString:@"siriUIPresentationBundle"];

      if (v26)
      {
        int64_t v45 = 9;
        goto LABEL_42;
      }
      v27 = [v10 pathExtension];
      int v28 = [v27 isEqualToString:@"uibundle"];

      if (v28)
      {
        int64_t v45 = 10;
        goto LABEL_42;
      }
      v29 = [v10 pathExtension];
      int v30 = [v29 isEqualToString:@"qldisplay"];

      if (v30)
      {
        int64_t v45 = 11;
        goto LABEL_42;
      }
      v31 = [v10 pathExtension];
      int v32 = [v31 isEqualToString:@"fpenroll"];

      if (v32)
      {
        int64_t v45 = 12;
        goto LABEL_42;
      }
      v33 = [v10 pathExtension];
      int v34 = [v33 isEqualToString:@"servicebundle"];

      if (v34)
      {
        int64_t v45 = 13;
        goto LABEL_42;
      }
      v35 = [v10 pathExtension];
      int v36 = [v35 isEqualToString:@"lockbundle"];

      if (v36) {
        goto LABEL_26;
      }
      v37 = [v10 pathExtension];
      int v38 = [v37 isEqualToString:@"XPCServices"];

      if (v38)
      {
        int64_t v45 = 16;
        goto LABEL_42;
      }
      v39 = [v10 pathExtension];
      int v40 = [v39 isEqualToString:@"healthplugin"];

      if (v40)
      {
        int64_t v45 = 17;
        goto LABEL_42;
      }
      v41 = [v10 pathExtension];
      int v42 = [v41 isEqualToString:@"wkbundle"];

      if (v42)
      {
LABEL_26:
        int64_t v45 = 14;
LABEL_42:
        self->_type = v45;
        v46 = [v10 stringByDeletingPathExtension];
        name = self->_name;
        self->_name = v46;

        goto LABEL_43;
      }
      v43 = [v10 pathExtension];
      int v44 = [v43 isEqualToString:@"axbundle"];

      if (v44)
      {
        int64_t v45 = 18;
        goto LABEL_42;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_43:

  if (self->_type == -1)
  {
    v48 = self->_name;
    self->_name = (NSString *)@"<Uninitialized>";

    self->_type = 0;
  }
}

- (unint64_t)loadedAtTimestamp
{
  return self->_loadedAtTimestamp;
}

- (BOOL)isLoaded
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)setIsLoaded:(BOOL)a3
{
  char flags = (char)self->_flags;
  if ((flags & 1) == 0 && a3)
  {
    self->_loadedAtTimestamp = mach_absolute_time();
    char flags = (char)self->_flags;
  }
  *(unsigned char *)&self->_char flags = flags & 0xFE | a3;
}

- (BOOL)isAccessibilityBundle
{
  return [(AXCodeItem *)self type] == 18;
}

- (BOOL)_isSystemAppAccessibilityBundle
{
  unint64_t v3 = [(AXCodeItem *)self name];
  if ([v3 isEqualToString:@"SpringBoard"])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(AXCodeItem *)self name];
    if ([v5 isEqualToString:@"Carousel"])
    {
      char v4 = 1;
    }
    else
    {
      uint64_t v6 = [(AXCodeItem *)self name];
      char v4 = [v6 isEqualToString:@"PineBoard"];
    }
  }

  return [(AXCodeItem *)self isAccessibilityBundle] & v4;
}

- (NSString)debugCodeTypeDescription
{
  uint64_t v2 = [(AXCodeItem *)self type];
  return (NSString *)_AXNameForCodeItemType(v2);
}

- (NSBundle)cachedBundle
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5;
  objc_super v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  unint64_t v3 = +[AXCodeItem _codeItemQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__AXCodeItem_cachedBundle__block_invoke;
  v6[3] = &unk_1E5673030;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSBundle *)v4;
}

void __26__AXCodeItem_cachedBundle__block_invoke(uint64_t a1)
{
}

- (id)prepareBackingBundleIfNeeded:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  int v20 = __Block_byref_object_dispose__5;
  id v21 = 0;
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5;
  int v14 = __Block_byref_object_dispose__5;
  id v15 = 0;
  id v5 = +[AXCodeItem _codeItemQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AXCodeItem_prepareBackingBundleIfNeeded___block_invoke;
  block[3] = &unk_1E5673460;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(v5, block);

  uint64_t v6 = (void *)v11[5];
  if (v6)
  {
    id v7 = 0;
    if (a3) {
      *a3 = v6;
    }
  }
  else
  {
    id v7 = (id)v17[5];
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __43__AXCodeItem_prepareBackingBundleIfNeeded___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  unint64_t v3 = (void *)v2[1];
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v3);
    return;
  }
  id v4 = [v2 path];
  if ([v4 length])
  {
    uint64_t v5 = [v4 stringByDeletingLastPathComponent];

    uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v22 = 0;
    uint64_t v8 = [v6 path];
    char v9 = [v7 fileExistsAtPath:v8 isDirectory:&v22];

    if (v9)
    {
      if (v22)
      {
        uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithURL:v6];
        uint64_t v11 = a1[4];
        uint64_t v12 = *(void **)(v11 + 8);
        *(void *)(v11 + 8) = v10;

        v13 = *(void **)(a1[4] + 8);
        if (v13)
        {
          uint64_t v14 = *(void *)(a1[5] + 8);
          id v15 = v13;
          uint64_t v16 = *(void **)(v14 + 40);
          *(void *)(v14 + 40) = v15;
LABEL_13:

          id v4 = (void *)v5;
          goto LABEL_14;
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoading", @"Could not create bundle from URL: %@", v6);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoading", @"URL is not a directory as expected: %@", v6);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoading", @"URL does not exist: %@", v6);
    uint64_t v20 = };
    uint64_t v21 = *(void *)(a1[6] + 8);
    uint64_t v16 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
    goto LABEL_13;
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoading", @"Code item path was empty");
  uint64_t v18 = *(void *)(a1[6] + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

LABEL_14:
}

- (void)loadWithStrategy:(int64_t)a3 onQueue:(id)a4 completion:(id)a5
{
  uint64_t v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (!v8)
  {
    uint64_t v8 = dispatch_get_global_queue(0, 0);
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v11 = (void *)[&__block_literal_global_103 copy];
    uint64_t v12 = _Block_copy(v11);
    goto LABEL_6;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = _Block_copy(v10);
  uint64_t v12 = _Block_copy(v11);

LABEL_6:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AXCodeItem_loadWithStrategy_onQueue_completion___block_invoke_2;
  block[3] = &unk_1E56734A8;
  id v15 = v12;
  int64_t v16 = a3;
  block[4] = self;
  id v13 = v12;
  dispatch_async(v8, block);
}

void __50__AXCodeItem_loadWithStrategy_onQueue_completion___block_invoke_2(void *a1)
{
  if (!a1[6])
  {
    id v4 = (void *)a1[4];
    id v12 = 0;
    uint64_t v5 = [v4 prepareBackingBundleIfNeeded:&v12];
    id v6 = v12;
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      id v11 = 0;
      char v8 = [v5 loadAndReturnError:&v11];
      id v7 = v11;
      if (v8)
      {
        *(unsigned char *)(a1[4] + 16) |= 1u;
        id v9 = *(void (**)(void))(a1[5] + 16);
LABEL_10:
        v9();

        return;
      }
    }
    id v9 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_10;
  }
  uint64_t v3 = a1[4];
  uint64_t v2 = a1[5];
  objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXLoading", @"dlopen strategy not inplemented");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void, id))(v2 + 16))(v2, v3, 0, v10);
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSMutableDictionary)platformToTarget
{
  return self->_platformToTarget;
}

- (void)setPlatformToTarget:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSArray)excludedProcesses
{
  return self->_excludedProcesses;
}

- (void)setExcludedProcesses:(id)a3
{
}

- (AXCodeItem)associatedAccessibilityCodeItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedAccessibilityCodeItem);
  return (AXCodeItem *)WeakRetained;
}

- (void)setAssociatedAccessibilityCodeItem:(id)a3
{
}

- (int64_t)targetType
{
  return self->_targetType;
}

- (void)setTargetType:(int64_t)a3
{
  self->_targetType = a3;
}

- (void)setLoadOrder:(unsigned __int16)a3
{
  self->_loadOrder = a3;
}

- (AXCodeItem)targetCodeItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetCodeItem);
  return (AXCodeItem *)WeakRetained;
}

- (void)setTargetCodeItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetCodeItem);
  objc_destroyWeak((id *)&self->_associatedAccessibilityCodeItem);
  objc_storeStrong((id *)&self->_excludedProcesses, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_platformToTarget, 0);
  objc_storeStrong((id *)&self->_cachedBundle, 0);
}

@end