@interface ISIcon
+ (BOOL)variant:(int)a3 isMemberOfSet:(unint64_t)a4;
+ (BOOL)writeCustomIcon:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (_LIIconVariantInfo)variantInfoForSet:(unint64_t)a3 count:(unint64_t *)a4;
+ (const)_AttachedResourceInfoKey;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)applicationIcon;
+ (id)genericApplicationIcon;
+ (id)genericDocumentIcon;
+ (id)layerUpdateQueue;
+ (id)sizesFromSet:(unint64_t)a3;
+ (id)templateTypeForTag:(id)a3 tagClass:(id)a4;
+ (id)templateTypeForType:(id)a3;
+ (id)transparentIcon;
+ (int)findVariantFromSet:(unint64_t)a3 deviceIdiom:(unint64_t)a4 size:(CGSize)a5 scale:(double)a6;
+ (unint64_t)behaviourRevision;
- (CGImage)CGImageForDescriptor:(id)a3;
- (CGImage)CGImageForImageDescriptor:(id)a3;
- (IFSymbol)symbol;
- (ISIcon)iconWithDecorations:(id)a3;
- (ISIconIdentity)_identity;
- (ISIconManager)manager;
- (NSArray)decorations;
- (NSMutableDictionary)prepareISIconDigestToSignpostIDs;
- (double)_aspectRatio;
- (id)_beginPrepareISIconSignpost:(id)a3 funcName:(const char *)a4;
- (id)_imageForSymbolImageDescriptor:(id)a3;
- (id)_init;
- (id)_prepareImageForImageDescriptor:(id)a3;
- (id)imageForDescriptor:(id)a3;
- (id)imageForImageDescriptor:(id)a3;
- (id)imageForSize:(CGSize)a3 scale:(double)a4;
- (id)prepareImageForDescriptor:(id)a3;
- (unint64_t)badgeOptions;
- (unint64_t)variantOptions;
- (void)_endPrepareISIconSignpost:(id)a3;
- (void)_eventPrepareISIconSignpost:(id)a3 message:(id)a4;
- (void)_prepareImagesForImageDescriptors:(id)a3;
- (void)displayLayer:(id)a3;
- (void)getCGImageForImageDescriptor:(id)a3 completion:(id)a4;
- (void)prepareImagesForDescriptors:(id)a3;
- (void)prepareImagesForImageDescriptors:(id)a3;
- (void)setPrepareISIconDigestToSignpostIDs:(id)a3;
@end

@implementation ISIcon

- (void).cxx_destruct
{
}

- (id)_beginPrepareISIconSignpost:(id)a3 funcName:(const char *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v31 = [MEMORY[0x1E4F1CA48] array];
  if ([v5 count])
  {
    v6 = _ISPrepareISIconSignpostLog();
    BOOL v7 = os_signpost_enabled(v6);

    if (v7)
    {
      v8 = [MEMORY[0x1E4F1CA80] set];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v29 = v5;
      id obj = v5;
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v35;
        p_lock = &self->_lock;
        do
        {
          uint64_t v13 = 0;
          uint64_t v32 = v10;
          do
          {
            if (*(void *)v35 != v11) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
            v15 = [v14 digest];
            if (([v8 containsObject:v15] & 1) == 0)
            {
              [v8 addObject:v15];
              v16 = _ISPrepareISIconSignpostLog();
              os_signpost_id_t v17 = os_signpost_id_generate(v16);

              if (v17)
              {
                v18 = _ISPrepareISIconSignpostLog();
                v19 = v18;
                if (v17 != -1 && os_signpost_enabled(v18))
                {
                  uint64_t v20 = [obj count];
                  *(_DWORD *)buf = 138413314;
                  v39 = self;
                  __int16 v40 = 2112;
                  v41 = v14;
                  __int16 v42 = 2080;
                  v43 = a4;
                  __int16 v44 = 2112;
                  v45 = v15;
                  __int16 v46 = 2048;
                  uint64_t v47 = v20;
                  _os_signpost_emit_with_name_impl(&dword_1AE771000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PrepareISIcon", "ISIcon: %@, descriptor: %@, func: %s, Digest=%{signpost.telemetry:string1}@, NumDescriptors=%{signpost.telemetry:number1}lu enableTelemetry=YES ", buf, 0x34u);
                }

                os_unfair_lock_lock(p_lock);
                v21 = [(ISIcon *)self prepareISIconDigestToSignpostIDs];

                if (!v21)
                {
                  v22 = [MEMORY[0x1E4F1CA60] dictionary];
                  [(ISIcon *)self setPrepareISIconDigestToSignpostIDs:v22];
                }
                v23 = [(ISIcon *)self prepareISIconDigestToSignpostIDs];
                v24 = [v23 objectForKeyedSubscript:v15];

                if (!v24)
                {
                  v24 = [MEMORY[0x1E4F1CA80] set];
                  v25 = [(ISIcon *)self prepareISIconDigestToSignpostIDs];
                  [v25 setObject:v24 forKeyedSubscript:v15];
                }
                v26 = [NSNumber numberWithUnsignedLongLong:v17];
                [v24 addObject:v26];

                v27 = [NSNumber numberWithUnsignedLongLong:v17];
                [v31 addObject:v27];

                os_unfair_lock_unlock(p_lock);
                uint64_t v10 = v32;
              }
            }

            ++v13;
          }
          while (v10 != v13);
          uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
        }
        while (v10);
      }

      id v5 = v29;
    }
  }

  return v31;
}

- (void)setPrepareISIconDigestToSignpostIDs:(id)a3
{
}

- (void)_endPrepareISIconSignpost:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = _ISPrepareISIconSignpostLog();
    BOOL v6 = os_signpost_enabled(v5);

    if (v6)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v27 = v4;
      id obj = v4;
      uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v30)
      {
        p_lock = &self->_lock;
        uint64_t v29 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v37 != v29) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if ([v9 unsignedLongLongValue])
            {
              uint64_t v10 = _ISPrepareISIconSignpostLog();
              BOOL v11 = os_signpost_enabled(v10);

              if (v11)
              {
                v12 = _ISPrepareISIconSignpostLog();
                uint64_t v13 = [v9 unsignedLongLongValue];
                if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
                {
                  os_signpost_id_t v14 = v13;
                  if (os_signpost_enabled(v12))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1AE771000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PrepareISIcon", (const char *)&unk_1AE7C91CB, buf, 2u);
                  }
                }
              }
            }
            os_unfair_lock_lock(p_lock);
            v15 = [(ISIcon *)self prepareISIconDigestToSignpostIDs];
            v16 = [v15 allKeys];
            os_signpost_id_t v17 = (void *)[v16 copy];

            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            id v18 = v17;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v40 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v32;
              do
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v32 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * j);
                  v24 = [(ISIcon *)self prepareISIconDigestToSignpostIDs];
                  v25 = [v24 objectForKeyedSubscript:v23];

                  [v25 removeObject:v9];
                  if (![v25 count])
                  {
                    v26 = [(ISIcon *)self prepareISIconDigestToSignpostIDs];
                    [v26 removeObjectForKey:v23];
                  }
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v40 count:16];
              }
              while (v20);
            }

            p_lock = &self->_lock;
            os_unfair_lock_unlock(&self->_lock);
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v30);
      }

      id v4 = v27;
    }
  }
}

- (void)_eventPrepareISIconSignpost:(id)a3 message:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = _ISPrepareISIconSignpostLog();
    BOOL v9 = os_signpost_enabled(v8);

    if (v9)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      BOOL v11 = [(ISIcon *)self prepareISIconDigestToSignpostIDs];
      id v26 = v6;
      v12 = [v6 digest];
      uint64_t v13 = [v11 objectForKey:v12];
      os_signpost_id_t v14 = (void *)[v13 copy];

      os_unfair_lock_unlock(p_lock);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if ([v20 unsignedLongLongValue])
            {
              uint64_t v21 = _ISPrepareISIconSignpostLog();
              BOOL v22 = os_signpost_enabled(v21);

              if (v22)
              {
                uint64_t v23 = _ISPrepareISIconSignpostLog();
                uint64_t v24 = [v20 unsignedLongLongValue];
                if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
                {
                  os_signpost_id_t v25 = v24;
                  if (os_signpost_enabled(v23))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v32 = v7;
                    _os_signpost_emit_with_name_impl(&dword_1AE771000, v23, OS_SIGNPOST_EVENT, v25, "PrepareISIcon", "%@", buf, 0xCu);
                  }
                }
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v17);
      }

      id v6 = v26;
    }
  }
}

- (NSMutableDictionary)prepareISIconDigestToSignpostIDs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (id)prepareImageForDescriptor:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)[v4 copyWithZone:0];
    v12[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v7 = -[ISIcon _beginPrepareISIconSignpost:funcName:](self, "_beginPrepareISIconSignpost:funcName:", v6, "-[ISIcon prepareImageForDescriptor:]");
    v8 = [(ISIcon *)self imageForDescriptor:v5];
    BOOL v9 = v8;
    if (!v8 || [v8 placeholder])
    {
      [v5 setIgnoreCache:0];
      [(ISIcon *)self _prepareImagesForImageDescriptors:v6];
      uint64_t v10 = [(ISIcon *)self imageForDescriptor:v5];

      BOOL v9 = (void *)v10;
    }
    [(ISIcon *)self _endPrepareISIconSignpost:v7];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (ISIconManager)manager
{
  return +[ISIconManager sharedInstance];
}

uint64_t __24__ISIcon_allocWithZone___block_invoke(uint64_t a1)
{
  allocWithZone__iconFactory = +[ISIcon allocWithZone:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__ISIcon_allocWithZone___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a3;
    if (allocWithZone__onceToken != -1) {
      dispatch_once(&allocWithZone__onceToken, block);
    }
    id v6 = (void *)allocWithZone__iconFactory;
    return v6;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___ISIcon;
    return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)ISIcon;
  id result = [(ISIcon *)&v3 init];
  if (result) {
    *((_DWORD *)result + 2) = 0;
  }
  return result;
}

+ (id)genericApplicationIcon
{
  return +[ISGenericApplicationIcon sharedInstance];
}

+ (unint64_t)behaviourRevision
{
  return 1000;
}

+ (id)applicationIcon
{
  v2 = [MEMORY[0x1E4F223F0] bundleProxyForCurrentProcess];
  objc_super v3 = [ISIcon alloc];
  id v4 = [v2 bundleIdentifier];
  id v5 = [(ISIcon *)v3 initWithBundleIdentifier:v4];

  id v6 = +[ISIconManager sharedInstance];
  objc_super v7 = [v6 findOrRegisterIcon:v5];

  return v7;
}

+ (id)genericDocumentIcon
{
  return +[ISGenericDocumentIcon sharedInstance];
}

+ (id)transparentIcon
{
  return +[ISTransparentIcon sharedInstance];
}

- (unint64_t)variantOptions
{
  return 0;
}

- (unint64_t)badgeOptions
{
  return 0;
}

- (NSArray)decorations
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (IFSymbol)symbol
{
  return 0;
}

- (ISIcon)iconWithDecorations:(id)a3
{
  id v4 = a3;
  id v5 = [[ISDecoratedIcon alloc] initWithIcon:self decorations:v4];

  id v6 = +[ISIconManager sharedInstance];
  objc_super v7 = [v6 findOrRegisterIcon:v5];

  return (ISIcon *)v7;
}

- (CGImage)CGImageForImageDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(ISIcon *)self imageForImageDescriptor:v4];
  if ([v5 CGImage])
  {
    CFTypeRef v6 = CFRetain((CFTypeRef)[v5 CGImage]);
    objc_super v7 = (CGImage *)CFAutorelease(v6);
  }
  else
  {
    v8 = _ISDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ISIcon CGImageForImageDescriptor:]();
    }

    BOOL v9 = (void *)MEMORY[0x1E4F6F1E8];
    uint64_t v10 = [(id)*MEMORY[0x1E4F44408] identifier];
    BOOL v11 = [v9 _placeholderImageWithImageDescriptor:v4 markAsPlaceholder:1 fallbackTypeID:v10 referenceIcon:self];

    if ([v11 CGImage])
    {
      CFTypeRef v12 = CFRetain((CFTypeRef)[v11 CGImage]);
      objc_super v7 = (CGImage *)CFAutorelease(v12);
    }
    else
    {
      objc_super v7 = 0;
    }
    id v5 = v11;
  }

  return v7;
}

- (CGImage)CGImageForDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(ISIcon *)self imageForDescriptor:v4];
  if ([v5 CGImage])
  {
    CFTypeRef v6 = CFRetain((CFTypeRef)[v5 CGImage]);
    objc_super v7 = (CGImage *)CFAutorelease(v6);
  }
  else
  {
    v8 = _ISDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ISIcon CGImageForImageDescriptor:]();
    }

    BOOL v9 = (void *)MEMORY[0x1E4F6F1E8];
    uint64_t v10 = [(id)*MEMORY[0x1E4F44408] identifier];
    BOOL v11 = [v9 _placeholderImageWithImageDescriptor:v4 markAsPlaceholder:1 fallbackTypeID:v10 referenceIcon:self];

    if ([v11 CGImage])
    {
      CFTypeRef v12 = CFRetain((CFTypeRef)[v11 CGImage]);
      objc_super v7 = (CGImage *)CFAutorelease(v12);
    }
    else
    {
      objc_super v7 = 0;
    }
    id v5 = v11;
  }

  return v7;
}

- (void)getCGImageForImageDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__ISIcon_getCGImageForImageDescriptor_completion___block_invoke;
  v8[3] = &unk_1E5F08FC0;
  id v9 = v6;
  id v7 = v6;
  [(ISIcon *)self getImageForImageDescriptor:a3 completion:v8];
}

uint64_t __50__ISIcon_getCGImageForImageDescriptor_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 CGImage];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (double)_aspectRatio
{
  return 1.0;
}

- (void)_prepareImagesForImageDescriptors:(id)a3
{
  id v4 = _ISDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[ISIcon _prepareImagesForImageDescriptors:]((uint64_t)self, v4);
  }
}

- (void)prepareImagesForImageDescriptors:(id)a3
{
  id v4 = a3;
  -[ISIcon _beginPrepareISIconSignpost:funcName:](self, "_beginPrepareISIconSignpost:funcName:", v4, "-[ISIcon prepareImagesForImageDescriptors:]");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(ISIcon *)self _prepareImagesForImageDescriptors:v4];

  [(ISIcon *)self _endPrepareISIconSignpost:v5];
}

- (void)prepareImagesForDescriptors:(id)a3
{
  id v4 = a3;
  -[ISIcon _beginPrepareISIconSignpost:funcName:](self, "_beginPrepareISIconSignpost:funcName:", v4, "-[ISIcon prepareImagesForDescriptors:]");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(ISIcon *)self _prepareImagesForImageDescriptors:v4];

  [(ISIcon *)self _endPrepareISIconSignpost:v5];
}

- (id)imageForImageDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = _ISDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[ISIcon imageForImageDescriptor:](v5);
  }

  id v6 = [(ISIcon *)self prepareImageForDescriptor:v4];

  return v6;
}

- (id)_imageForSymbolImageDescriptor:(id)a3
{
  return 0;
}

- (id)imageForDescriptor:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(ISIcon *)self imageForImageDescriptor:v4];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(ISIcon *)self _imageForSymbolImageDescriptor:v4];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (ISIconIdentity)_identity
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = -[ISImageDescriptor initWithSize:scale:]([ISImageDescriptor alloc], "initWithSize:scale:", 32.0, 32.0, 1.0);
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(ISIcon *)self prepareImagesForImageDescriptors:v4];

  uint64_t v5 = [(ISIcon *)self imageForImageDescriptor:v3];
  id v6 = [v5 uuid];

  return (ISIconIdentity *)v6;
}

+ (BOOL)writeCustomIcon:(id)a3 toURL:(id)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:0];
  }
  return 0;
}

- (id)_prepareImageForImageDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _ISDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[ISIcon(Workaround) _prepareImageForImageDescriptor:](v5);
  }

  id v6 = [(ISIcon *)self prepareImageForDescriptor:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 bitmapData];
  }
  return 0;
}

+ (const)_AttachedResourceInfoKey
{
  return "_kISAttachedResourceInfo";
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[ISImageDescriptor initWithSize:scale:]([ISImageDescriptor alloc], "initWithSize:scale:", a3.width, a3.height, a4);
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(ISIcon *)self prepareImagesForImageDescriptors:v6];

  id v7 = [(ISIcon *)self imageForImageDescriptor:v5];

  return v7;
}

+ (id)layerUpdateQueue
{
  if (layerUpdateQueue_onceToken != -1) {
    dispatch_once(&layerUpdateQueue_onceToken, &__block_literal_global_12);
  }
  uint64_t v2 = (void *)layerUpdateQueue_layerUpdateQueue;
  return v2;
}

void __43__ISIcon_CALayerDelegate__layerUpdateQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("Icon layer update queue", v2);
  v1 = (void *)layerUpdateQueue_layerUpdateQueue;
  layerUpdateQueue_layerUpdateQueue = (uint64_t)v0;
}

- (void)displayLayer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = self;
    [v5 preferredFrameSize];
    if (v7 >= v8) {
      double v9 = v8;
    }
    else {
      double v9 = v7;
    }
    [v5 contentsScale];
    double v11 = v10;
    CFTypeRef v12 = _ISDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ISIcon(CALayerDelegate) displayLayer:]((uint64_t)v6, v12);
    }

    uint64_t v13 = -[ISImageDescriptor initWithSize:scale:]([ISImageDescriptor alloc], "initWithSize:scale:", v9, v9, v11);
    -[ISImageDescriptor setVariantOptions:](v13, "setVariantOptions:", [v5 variantOptions]);
    -[ISImageDescriptor setShape:](v13, "setShape:", [v5 iconShape]);
    -[ISImageDescriptor setShouldApplyMask:](v13, "setShouldApplyMask:", [v5 shouldApplyMask]);
    -[ISImageDescriptor setDrawBorder:](v13, "setDrawBorder:", [v5 drawBorder]);
    os_signpost_id_t v14 = [(ISIcon *)v6 imageForImageDescriptor:v13];
    objc_msgSend(v5, "setContents:", objc_msgSend(v14, "CGImage"));
    if ([v14 placeholder])
    {
      id v15 = +[ISIcon layerUpdateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__ISIcon_CALayerDelegate__displayLayer___block_invoke;
      block[3] = &unk_1E5F09288;
      uint64_t v17 = v6;
      uint64_t v18 = v13;
      id v19 = v5;
      dispatch_async(v15, block);
    }
  }
}

void __40__ISIcon_CALayerDelegate__displayLayer___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = *(void *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 prepareImagesForImageDescriptors:v3];

  id v4 = [*(id *)(a1 + 32) imageForImageDescriptor:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 48), "setContents:", objc_msgSend(v4, "CGImage"));
}

+ (_LIIconVariantInfo)variantInfoForSet:(unint64_t)a3 count:(unint64_t *)a4
{
  int v5 = a3;
  if (a3 >= 5)
  {
    double v8 = _ISDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[ISIcon(LIIconVariant) variantInfoForSet:count:](v5, v8);
    }

    unint64_t v6 = 0;
    id result = 0;
  }
  else
  {
    unint64_t v6 = qword_1AE7C4E88[a3];
    id result = (_LIIconVariantInfo *)*(&off_1E5F09400 + a3);
  }
  *a4 = v6;
  return result;
}

+ (int)findVariantFromSet:(unint64_t)a3 deviceIdiom:(unint64_t)a4 size:(CGSize)a5 scale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  double v10 = +[ISIcon variantInfoForSet:a3 count:&v19];
  uint64_t v11 = v19;
  if (!v19) {
    return 0;
  }
  int v12 = 0;
  for (uint64_t i = &v10->var2; ; i += 6)
  {
    if (((void)i[1] & a4) != 0 && *i == a6)
    {
      int v12 = *((_DWORD *)i - 6);
      if (*(i - 1) >= height || *(i - 2) >= width) {
        break;
      }
    }
    if (!--v11) {
      return v12;
    }
  }
  id v15 = _ISDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = *((void *)i + 2);
    *(_DWORD *)buf = 136315906;
    uint64_t v21 = v18;
    __int16 v22 = 2048;
    double v23 = width;
    __int16 v24 = 2048;
    double v25 = height;
    __int16 v26 = 2048;
    double v27 = a6;
    _os_log_debug_impl(&dword_1AE771000, v15, OS_LOG_TYPE_DEBUG, "Picked %s for size: (%lf, %lf) scale: %lf", buf, 0x2Au);
  }

  return v12;
}

+ (id)sizesFromSet:(unint64_t)a3
{
  unint64_t v12 = 0;
  uint64_t v3 = +[ISIcon variantInfoForSet:a3 count:&v12];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v12];
  if (v12)
  {
    unint64_t v5 = 0;
    p_var1 = (long long *)&v3->var1;
    do
    {
      long long v7 = *p_var1;
      p_var1 += 3;
      long long v11 = v7;
      double v8 = [MEMORY[0x1E4F29238] valueWithBytes:&v11 objCType:"{CGSize=dd}"];
      [v4 addObject:v8];

      ++v5;
    }
    while (v12 > v5);
  }
  double v9 = (void *)[v4 copy];

  return v9;
}

+ (BOOL)variant:(int)a3 isMemberOfSet:(unint64_t)a4
{
  unint64_t v11 = 0;
  unint64_t v5 = +[ISIcon variantInfoForSet:a4 count:&v11];
  if (!v11) {
    return 0;
  }
  if (v5->var0 == a3) {
    return 1;
  }
  long long v7 = v5 + 1;
  uint64_t v8 = 1;
  do
  {
    unint64_t v9 = v8;
    if (v11 == v8) {
      break;
    }
    int var0 = v7->var0;
    ++v7;
    ++v8;
  }
  while (var0 != a3);
  return v11 > v9;
}

+ (id)templateTypeForType:(id)a3
{
  id v3 = a3;
  if (!v3) {
    id v3 = (id)*MEMORY[0x1E4F22608];
  }
  return v3;
}

+ (id)templateTypeForTag:(id)a3 tagClass:(id)a4
{
  return 0;
}

- (void)CGImageForImageDescriptor:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1AE771000, v0, OS_LOG_TYPE_ERROR, "Failed to create icon image for %@", v1, 0xCu);
}

- (void)_prepareImagesForImageDescriptors:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  [v4 UTF8String];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1AE771000, a2, OS_LOG_TYPE_ERROR, "Should not be here. -_prepareImagesForImageDescriptors: should be overridden by: %s", v5, 0xCu);
}

- (void)imageForImageDescriptor:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE771000, log, OS_LOG_TYPE_ERROR, "-imageForImageDescriptor: can do IO please adopt -imageForDescriptor: for IO free drawing or -prepareImageForDescriptor: if IO is allowed. (This will become a fault soon.)", v1, 2u);
}

@end