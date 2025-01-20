@interface CKLocationShareOfferChatItem
+ (id)placeholderPreviewCache;
+ (id)titleBarMaskImageForWidth:(double)a3;
- (BOOL)failed;
- (BOOL)isFromMe;
- (BOOL)shouldUpdatePreviewWithLocation:(id)a3 lastKnownLocation:(id)a4 previewURL:(id)a5;
- (CKLocationShareOfferChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (Class)balloonViewClass;
- (FMFLocation)lastKnownLocation;
- (IMHandle)sender;
- (NSString)locationText;
- (NSString)titleText;
- (id)_desaturatedImageForImage:(id)a3;
- (id)_generatePlaceholderThumbnailFillToSize:(CGSize)a3;
- (id)_generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4 withCoordinate:(CLLocationCoordinate2D)a5 forState:(int64_t)a6;
- (id)_placeholderCacheKey;
- (id)_previewCacheKey:(unint64_t)a3;
- (id)modificationDateForPreview:(id)a3;
- (id)previewForWidth:(double)a3 orientation:(char)a4;
- (id)previewURL;
- (id)previewURLForWidth:(unint64_t)a3;
- (id)savedPreviewFromURL:(id)a3;
- (id)time;
- (id)transcriptTraitCollection;
- (int64_t)offerState;
- (void)_generateMapPreview;
- (void)_handleLocationDidChangeNotification:(id)a3;
- (void)configureBalloonView:(id)a3;
- (void)dealloc;
- (void)savePreview:(id)a3 toURL:(id)a4;
- (void)setLastKnownLocation:(id)a3;
@end

@implementation CKLocationShareOfferChatItem

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKLocationShareOfferChatItem;
  [(CKLocationShareOfferChatItem *)&v4 dealloc];
}

- (CKLocationShareOfferChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CKLocationShareOfferChatItem;
  objc_super v4 = [(CKChatItem *)&v13 initWithIMChatItem:a3 maxWidth:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__handleLocationDidChangeNotification_ name:*MEMORY[0x1E4F6BAF8] object:0];

    v6 = [MEMORY[0x1E4F6BCB8] sharedInstance];
    v7 = [(CKLocationShareOfferChatItem *)v4 sender];
    v8 = [v6 findMyLocationForHandleOrSibling:v7];

    v9 = [v8 fmfLocation];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 location];

      if (v11) {
        [(CKLocationShareOfferChatItem *)v4 setLastKnownLocation:v10];
      }
    }
  }
  return v4;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isFromMe
{
  return 0;
}

- (BOOL)failed
{
  return 0;
}

- (id)time
{
  v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 time];

  return v3;
}

- (IMHandle)sender
{
  v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 sender];

  return (IMHandle *)v3;
}

- (void)configureBalloonView:(id)a3
{
}

- (int64_t)offerState
{
  v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 offerState];

  return v3;
}

- (NSString)titleText
{
  int64_t v3 = [(CKLocationShareOfferChatItem *)self sender];
  objc_super v4 = [v3 _displayNameWithAbbreviation];

  if (![(CKLocationShareOfferChatItem *)self offerState])
  {
    v5 = NSString;
    v6 = CKFrameworkBundle();
    v7 = v6;
    v8 = @"SHARE_BUBBLE_ACTION_TEXT";
    goto LABEL_6;
  }
  if ([(CKLocationShareOfferChatItem *)self offerState] == 1
    || [(CKLocationShareOfferChatItem *)self offerState] == 2)
  {
    v5 = NSString;
    v6 = CKFrameworkBundle();
    v7 = v6;
    v8 = @"SHARE_BUBBLE_LOCATION_TEXT";
LABEL_6:
    v9 = [v6 localizedStringForKey:v8 value:&stru_1EDE4CA38 table:@"ChatKit"];
    v10 = objc_msgSend(v5, "stringWithFormat:", v9, v4);

    v11 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v12 = [v11 userInterfaceLayoutDirection];

    if (v12 == 1) {
      objc_super v13 = @"\u200F";
    }
    else {
      objc_super v13 = @"\u200E";
    }
    v14 = [(__CFString *)v13 stringByAppendingString:v10];

    goto LABEL_10;
  }
  v14 = 0;
LABEL_10:

  return (NSString *)v14;
}

- (NSString)locationText
{
  v2 = [(CKLocationShareOfferChatItem *)self lastKnownLocation];
  int64_t v3 = [v2 shortAddress];

  if (!v3 || [v3 isEqualToString:&stru_1EDE4CA38])
  {
    objc_super v4 = CKFrameworkBundle();
    uint64_t v5 = [v4 localizedStringForKey:@"LOCATING" value:&stru_1EDE4CA38 table:@"ChatKit"];

    int64_t v3 = (void *)v5;
  }

  return (NSString *)v3;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", a4);
  [v6 scale];
  unint64_t v8 = (unint64_t)(v7 * a3);

  v9 = [(CKLocationShareOfferChatItem *)self _previewCacheKey:v8];
  v10 = +[CKPreviewDispatchCache transcriptPreviewCache];
  v11 = [v10 cachedPreviewForKey:v9];
  if (v11)
  {
    uint64_t v12 = 0;
    goto LABEL_29;
  }
  uint64_t v12 = [(CKLocationShareOfferChatItem *)self previewURLForWidth:v8];
  v11 = [(CKLocationShareOfferChatItem *)self savedPreviewFromURL:v12];
  if (!v11) {
    goto LABEL_15;
  }
  if ([(CKLocationShareOfferChatItem *)self offerState] == 2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [(CKLocationShareOfferChatItem *)self _desaturatedImageForImage:v11];

      v11 = (void *)v13;
    }
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v27 = self;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_DEBUG, "%@ preview read from disk.", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v25 = self;
    _CKLog();
  }
  objc_msgSend(v10, "setCachedPreview:key:", v11, v9, v25);
  if (!v11)
  {
LABEL_15:
    v15 = [(CKLocationShareOfferChatItem *)self _placeholderCacheKey];
    v16 = +[CKLocationShareOfferChatItem placeholderPreviewCache];
    v11 = [v16 objectForKey:v15];

    if (v11)
    {
LABEL_28:

      goto LABEL_29;
    }
    if ([(CKLocationShareOfferChatItem *)self offerState] == 2)
    {
      v11 = [(CKLocationShareOfferChatItem *)self _desaturatedImageForImage:0];
      if (v11)
      {
        v17 = +[CKLocationShareOfferChatItem placeholderPreviewCache];
        [v17 setObject:v11 forKey:v15];

        goto LABEL_28;
      }
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = self;
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Preview is nil for location chat item: %@ and state: IMLocationShareOfferStateExpired", buf, 0xCu);
        }
LABEL_26:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = self;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Preview is nil for location chat item: %@", buf, 0xCu);
      }
      goto LABEL_26;
    }
    v11 = 0;
    goto LABEL_28;
  }
LABEL_29:
  if ([(CKLocationShareOfferChatItem *)self offerState] != 2)
  {
    v19 = [(CKLocationShareOfferChatItem *)self lastKnownLocation];
    BOOL v20 = v19 == 0;

    if (v20) {
      goto LABEL_34;
    }
    if (!v12)
    {
      uint64_t v12 = [(CKLocationShareOfferChatItem *)self previewURLForWidth:v8];
    }
    v21 = [(CKLocationShareOfferChatItem *)self lastKnownLocation];
    v22 = [(CKLocationShareOfferChatItem *)self lastKnownLocation];
    BOOL v23 = [(CKLocationShareOfferChatItem *)self shouldUpdatePreviewWithLocation:v21 lastKnownLocation:v22 previewURL:v12];

    if (v23) {
LABEL_34:
    }
      [(CKLocationShareOfferChatItem *)self _generateMapPreview];
  }

  return v11;
}

- (id)_previewCacheKey:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v6 = [(CKLocationShareOfferChatItem *)self sender];
  double v7 = [v6 ID];
  int64_t v8 = [(CKLocationShareOfferChatItem *)self offerState];
  int v9 = [(CKBalloonChatItem *)self balloonOrientation];
  v10 = [(CKLocationShareOfferChatItem *)self transcriptTraitCollection];
  v11 = [v5 stringWithFormat:@"%@-%d-%d-%d-%ld", v7, v8, a3, v9, objc_msgSend(v10, "userInterfaceStyle")];

  return v11;
}

- (id)_placeholderCacheKey
{
  int64_t v3 = NSString;
  int64_t v4 = [(CKLocationShareOfferChatItem *)self offerState];
  uint64_t v5 = [(CKLocationShareOfferChatItem *)self transcriptTraitCollection];
  v6 = objc_msgSend(v3, "stringWithFormat:", @"placeholder-%d-%ld", v4, objc_msgSend(v5, "userInterfaceStyle"));

  return v6;
}

- (id)previewURL
{
  int64_t v3 = +[CKUIBehavior sharedBehaviors];
  [v3 previewMaxWidth];
  double v5 = v4;

  v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 scale];
  unint64_t v8 = (unint64_t)(v5 * v7);

  return [(CKLocationShareOfferChatItem *)self previewURLForWidth:v8];
}

- (id)previewURLForWidth:(unint64_t)a3
{
  double v5 = [(CKLocationShareOfferChatItem *)self sender];
  v6 = [v5 ID];
  double v7 = [(CKLocationShareOfferChatItem *)self transcriptTraitCollection];
  unint64_t v8 = CKLocationSharePreviewCachesFileURL(v6, a3, @"jpeg", [v7 userInterfaceStyle]);

  return v8;
}

- (void)_generateMapPreview
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int64_t v3 = +[CKUIBehavior sharedBehaviors];
  [v3 mapPreviewMaxWidth];
  double v5 = v4;

  v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 scale];
  unint64_t v8 = (unint64_t)(v5 * v7);

  int v9 = [(CKLocationShareOfferChatItem *)self _previewCacheKey:v8];
  v10 = +[CKPreviewDispatchCache transcriptPreviewCache];
  if ([v10 isGeneratingPreviewForKey:v9])
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_DEBUG, "%@ is already generating preview. Abort.", (uint8_t *)&buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke;
    v18[3] = &unk_1E5620E10;
    *(double *)&v18[6] = v5;
    v18[4] = self;
    v18[5] = &buf;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke_137;
    v12[3] = &unk_1E5620E60;
    id v13 = v10;
    id v14 = v9;
    v15 = self;
    p_long long buf = &buf;
    unint64_t v17 = v8;
    [v13 enqueueGenerationBlock:v18 completion:v12 withPriority:-1 forKey:v14];

    _Block_object_dispose(&buf, 8);
  }
}

id __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    double v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v31 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_DEBUG, "%@ generate preview.", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    uint64_t v29 = *(void *)(a1 + 32);
    _CKLog();
  }
  v6 = objc_msgSend(MEMORY[0x1E4F6BCB8], "sharedInstance", v29);
  double v7 = [*(id *)(a1 + 32) sender];
  unint64_t v8 = [v6 findMyLocationForHandleOrSibling:v7];
  int v9 = [v8 fmfLocation];

  if (v9)
  {
    [*(id *)(a1 + 32) setLastKnownLocation:v9];
    v10 = +[CKUIBehavior sharedBehaviors];
    [v10 locationOfferMapThumbnailFillSizeForWidth:*(double *)(a1 + 48)];
    double v12 = v11;
    double v14 = v13;

    v15 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v15, "thumbnailContentAlignmentInsetsForOrientation:", objc_msgSend(*(id *)(a1 + 32), "balloonOrientation"));
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    v24 = *(void **)(a1 + 32);
    [v9 coordinate];
    v27 = objc_msgSend(v24, "_generateThumbnailFillToSize:contentAlignmentInsets:withCoordinate:forState:", objc_msgSend(*(id *)(a1 + 32), "offerState"), v12, v14, v17, v19, v21, v23, v25, v26);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

void __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke_137(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke_2;
  block[3] = &unk_1E5620E60;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cachedPreviewForKey:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    id v4 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke_3;
    v7[3] = &unk_1E5620E38;
    uint64_t v5 = *(void *)(a1 + 64);
    v7[4] = *(void *)(a1 + 48);
    uint64_t v9 = v5;
    id v8 = v2;
    [v4 enqueueSaveBlock:v7 withPriority:-1];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 postNotificationName:@"CKPreviewDidChangeNotification" object:*(void *)(a1 + 48)];
    }
  }
}

void __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sender];
  id v3 = [v2 ID];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 32) transcriptTraitCollection];
  CKLocationSharePreviewCachesFileURL(v3, v4, @"jpeg", [v5 userInterfaceStyle]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) savePreview:*(void *)(a1 + 40) toURL:v6];
}

- (id)_generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4 withCoordinate:(CLLocationCoordinate2D)a5 forState:(int64_t)a6
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  CGFloat top = a4.top;
  double height = a3.height;
  double width = a3.width;
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  if (_generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___pred_CLLocationCoordinate2DIsValidCoreLocation != -1) {
    dispatch_once(&_generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_3);
  }
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__1;
  v90 = __Block_byref_object_dispose__1;
  id v91 = 0;
  if ((_generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___CLLocationCoordinate2DIsValid(latitude, longitude) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      v66 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        LODWORD(v94) = 138412290;
        *(void *)((char *)&v94 + 4) = self;
        _os_log_impl(&dword_18EF18000, v66, OS_LOG_TYPE_INFO, "%@ has invalid coordinate. Abort preview generation.", (uint8_t *)&v94, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
      _CKLogExternal();
    }
    goto LABEL_38;
  }
  id v13 = objc_alloc_init((Class)MEMORY[0x192FBA860](@"MKMapSnapshotOptions", @"MapKit"));
  [v13 setMapType:0];
  if (_generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___pred_MKCoordinateRegionMakeWithDistanceMapKit != -1) {
    dispatch_once(&_generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___pred_MKCoordinateRegionMakeWithDistanceMapKit, &__block_literal_global_154);
  }
  _generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___MKCoordinateRegionMakeWithDistance(latitude, longitude, 500.0, 500.0);
  if (v15 >= -180.0
    && v15 <= 180.0
    && v14 >= -90.0
    && v14 <= 90.0
    && v16 >= 0.0
    && v16 <= 180.0
    && v17 >= 0.0
    && v17 <= 360.0)
  {
    objc_msgSend(v13, "setRegion:");
    double v18 = +[CKUIBehavior sharedBehaviors];
    [v18 locationShareBalloonButtonHeight];
    double v20 = v19;
    double v21 = +[CKUIBehavior sharedBehaviors];
    [v21 locationShareBalloonLabelMaxHeightForOfferState:0];
    double v23 = v22;

    double v70 = v20 + v23;
    double v24 = height + v20 + v23;
    objc_msgSend(v13, "setSize:", width, v24);
    double v25 = [(CKLocationShareOfferChatItem *)self transcriptTraitCollection];
    [v13 setTraitCollection:v25];

    double v26 = [MEMORY[0x1E4F42A80] ckImageNamed:@"fmf_disc"];
    double v27 = top;
    *(void *)&long long v94 = 0;
    *((void *)&v94 + 1) = &v94;
    uint64_t v95 = 0x4010000000;
    v96 = "";
    long long v97 = 0u;
    long long v98 = 0u;
    [v26 size];
    double v29 = v28;
    double v31 = v30;
    double v32 = left + *MEMORY[0x1E4F1DAD8];
    double v33 = v27;
    double v34 = v27 + *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v35 = width - (left + right);
    double v36 = v24 - (v33 + bottom);
    if (CKMainScreenScale_once_1 != -1) {
      dispatch_once(&CKMainScreenScale_once_1, &__block_literal_global_245);
    }
    double v37 = *(double *)&CKMainScreenScale_sMainScreenScale_1;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_1 == 0.0) {
      double v37 = 1.0;
    }
    double v38 = v29 * v37;
    double v39 = v31 * v37;
    double v40 = v32 * v37 + floor((v35 * v37 - v29 * v37) * 0.5);
    double v41 = v34 * v37 + floor((v36 * v37 - v31 * v37) * 0.5);
    double v42 = 1.0 / v37;
    *(double *)&long long v97 = v42 * v40;
    *((double *)&v97 + 1) = v42 * v41;
    *(double *)&long long v98 = v38 * v42;
    *((double *)&v98 + 1) = v39 * v42;
    v43 = [CKEntity alloc];
    v44 = [(CKLocationShareOfferChatItem *)self sender];
    v45 = [(CKEntity *)v43 initWithIMHandle:v44];

    double v46 = v35;
    v47 = [(CKEntity *)v45 locationShareBalloonContactImage];
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x4010000000;
    v83[3] = "";
    long long v84 = 0u;
    long long v85 = 0u;
    [v47 size];
    double v49 = v48;
    double v51 = v50;
    if (CKMainScreenScale_once_1 != -1) {
      dispatch_once(&CKMainScreenScale_once_1, &__block_literal_global_245);
    }
    double v52 = *(double *)&CKMainScreenScale_sMainScreenScale_1;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_1 == 0.0) {
      double v52 = 1.0;
    }
    double v53 = v49 * v52;
    double v54 = v51 * v52;
    double v55 = v32 * v52 + floor((v46 * v52 - v49 * v52) * 0.5);
    double v56 = v34 * v52 + floor((v36 * v52 - v51 * v52) * 0.5);
    double v57 = 1.0 / v52;
    *(double *)&long long v84 = v57 * v55;
    *((double *)&v84 + 1) = v57 * v56;
    *(double *)&long long v85 = v53 * v57;
    *((double *)&v85 + 1) = v54 * v57;
    v58 = objc_msgSend(objc_alloc((Class)MEMORY[0x192FBA860](@"MKMapSnapshotter", @"MapKit")), "initWithOptions:", v13);
    v59 = dispatch_group_create();
    dispatch_group_enter(v59);
    v60 = +[CKPreviewDispatchCache mapThumbnailQueue];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __108__CKLocationShareOfferChatItem__generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___block_invoke_164;
    v73[3] = &unk_1E5620E88;
    double v80 = width;
    double v81 = height;
    double v82 = v70;
    v77 = &v86;
    v78 = &v94;
    v79 = v83;
    id v61 = v26;
    id v74 = v61;
    id v62 = v47;
    id v75 = v62;
    v63 = v59;
    v76 = v63;
    [v58 startWithQueue:v60 completionHandler:v73];

    dispatch_time_t v64 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(v63, v64))
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        v65 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          v93 = self;
          _os_log_impl(&dword_18EF18000, v65, OS_LOG_TYPE_INFO, "%@ thumbnail generation timed out.", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
        _CKLogExternal();
      }
    }

    _Block_object_dispose(v83, 8);
    _Block_object_dispose(&v94, 8);

LABEL_38:
    id v67 = (id)v87[5];
    goto LABEL_44;
  }
  if (IMOSLoggingEnabled())
  {
    v68 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      LOWORD(v94) = 0;
      _os_log_impl(&dword_18EF18000, v68, OS_LOG_TYPE_INFO, "CKLocationShareOfferChatItem - Map region is invalid, bailing!", (uint8_t *)&v94, 2u);
    }
  }
  id v67 = 0;
LABEL_44:
  _Block_object_dispose(&v86, 8);

  return v67;
}

void *__108__CKLocationShareOfferChatItem__generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("CLLocationCoordinate2DIsValid", @"CoreLocation");
  _generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___CLLocationCoordinate2DIsValid = result;
  return result;
}

void *__108__CKLocationShareOfferChatItem__generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___block_invoke_152()
{
  result = (void *)MEMORY[0x192FBA870]("MKCoordinateRegionMakeWithDistance", @"MapKit");
  _generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___MKCoordinateRegionMakeWithDistance = result;
  return result;
}

void __108__CKLocationShareOfferChatItem__generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___block_invoke_164(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && IMOSLoggingEnabled())
  {
    double v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Got error back in CKLocationShareOfferChatItem for map snapshot: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  uint64_t v8 = [v5 image];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  UIGraphicsBeginImageContextWithOptions(*(CGSize *)(a1 + 80), 0, 0.0);
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) size];
  double v12 = *MEMORY[0x1E4F1DAD8] + floor((*(double *)(a1 + 80) - v11) * 0.5);
  double v14 = *(double *)(a1 + 96);
  double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8) + floor((*(double *)(a1 + 88) - v13) * 0.5) - v14 * 0.5;
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 40)
                                                              - v14;
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 40)
                                                              - *(double *)(a1 + 96);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "drawAtPoint:", v12, v15);
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 40), "drawAtPoint:", *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  uint64_t v16 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  double v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  UIGraphicsEndImageContext();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)transcriptTraitCollection
{
  v7.receiver = self;
  v7.super_class = (Class)CKLocationShareOfferChatItem;
  v2 = [(CKChatItem *)&v7 transcriptTraitCollection];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F43058] keyWindow];
    id v4 = [v5 traitCollection];
  }

  return v4;
}

- (id)_generatePlaceholderThumbnailFillToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = [(CKLocationShareOfferChatItem *)self transcriptTraitCollection];
  objc_super v7 = CKLocationSharePreviewPlaceHolderCacheFileURL(v6, (unint64_t)width, @"jpeg");

  uint64_t v40 = 0;
  double v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__1;
  v44 = __Block_byref_object_dispose__1;
  id v45 = 0;
  v39[0] = [(CKBalloonChatItem *)self balloonOrientation];
  uint64_t v8 = [(CKLocationShareOfferChatItem *)self transcriptTraitCollection];
  v39[1] = [v8 userInterfaceStyle];

  uint64_t v9 = [MEMORY[0x1E4F29238] value:v39 withObjCType:"{?=cq}"];
  v10 = +[CKLocationMediaObject placeholderPreviewCache];
  uint64_t v11 = [v10 objectForKey:v9];
  double v12 = (void *)v41[5];
  v41[5] = v11;

  if (v41[5])
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      double v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Found cached thumbnail in memory", buf, 2u);
      }
    }
    if (!os_log_shim_legacy_logging_enabled() || !_CKShouldLogExternal()) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  uint64_t v14 = [(CKLocationShareOfferChatItem *)self savedPreviewFromURL:v7];
  double v15 = (void *)v41[5];
  v41[5] = v14;

  if (v41[5])
  {
    uint64_t v16 = +[CKLocationMediaObject placeholderPreviewCache];
    [v16 setObject:v41[5] forKey:v9];

    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Found cached thumnail on disk.", buf, 2u);
      }
    }
    if (!os_log_shim_legacy_logging_enabled() || !_CKShouldLogExternal()) {
      goto LABEL_17;
    }
LABEL_16:
    _CKLogExternal();
LABEL_17:
    id v18 = (id)v41[5];
    goto LABEL_18;
  }
  id v20 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotOptions", @"MapKit");
  if (v20)
  {
    id v21 = objc_alloc_init(v20);
    [v21 setMapType:105];
    double v22 = [(CKLocationShareOfferChatItem *)self transcriptTraitCollection];
    [v21 setTraitCollection:v22];

    objc_msgSend(v21, "setSize:", width, height);
    double v23 = [MEMORY[0x1E4F42D90] mainScreen];
    [v23 scale];
    objc_msgSend(v21, "setScale:");

    double v24 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotter", @"MapKit");
    if (v24)
    {
      double v25 = (void *)[[v24 alloc] initWithOptions:v21];
      double v26 = dispatch_group_create();
      dispatch_group_enter(v26);
      double v27 = dispatch_get_global_queue(0, 0);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __72__CKLocationShareOfferChatItem__generatePlaceholderThumbnailFillToSize___block_invoke;
      v36[3] = &unk_1E5620EB0;
      double v38 = &v40;
      double v28 = v26;
      double v37 = v28;
      [v25 startWithQueue:v27 completionHandler:v36];

      dispatch_time_t v29 = dispatch_time(0, 5000000000);
      if (dispatch_group_wait(v28, v29))
      {
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(2);
          double v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            v47 = (__CFString *)self;
            _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "%@ thumbnail generation timed out.", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
          _CKLogExternal();
        }
      }
      uint64_t v31 = v41[5];
      if (v31)
      {
        [(CKLocationShareOfferChatItem *)self savePreview:v31 toURL:v7];
        double v32 = +[CKLocationMediaObject placeholderPreviewCache];
        [v32 setObject:v41[5] forKey:v9];

        double v33 = (void *)v41[5];
      }
      else
      {
        double v33 = 0;
      }
      id v18 = v33;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        double v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          v47 = @"MKMapSnapshotter";
          __int16 v48 = 2112;
          double v49 = @"MapKit";
          _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
        }
      }
      id v18 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      double v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        v47 = @"MKMapSnapshotOptions";
        __int16 v48 = 2112;
        double v49 = @"MapKit";
        _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
      }
    }
    id v18 = 0;
  }
LABEL_18:

  _Block_object_dispose(&v40, 8);

  return v18;
}

void __72__CKLocationShareOfferChatItem__generatePlaceholderThumbnailFillToSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && IMOSLoggingEnabled())
  {
    objc_super v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Got error back in CKLocationMediaObject for map snapshot: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = [v5 image];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)savePreview:(id)a3 toURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = v5;
    id v8 = v6;
    im_perform_with_task_assertion();
  }
}

void __50__CKLocationShareOfferChatItem_savePreview_toURL___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = CKUIImageJPEGRepresentationWithHardwareAcceleration();
  CKFreeSpaceWriteDataToURL(v2, *(void **)(a1 + 40), 1);
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_DEBUG, "%@ preview saved to %@.", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
    _CKLog();
  }
}

- (id)savedPreviewFromURL:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
    id v4 = a3;
    uint64_t v5 = (void *)[[v3 alloc] initWithContentsOfURL:v4 options:1 error:0];

    if (v5)
    {
      id v6 = [MEMORY[0x1E4F42A80] ckImageWithData:v5];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)modificationDateForPreview:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  uint64_t v5 = [v3 defaultManager];
  id v6 = [v4 path];

  uint64_t v7 = [v5 attributesOfItemAtPath:v6 error:0];
  __int16 v8 = [v7 objectForKey:*MEMORY[0x1E4F28310]];

  return v8;
}

- (void)_handleLocationDidChangeNotification:(id)a3
{
  id v14 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v14 fmfHandle];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = [(CKLocationShareOfferChatItem *)self sender];
  id v6 = [v5 findMySiblingHandles];
  uint64_t v7 = objc_msgSend(v6, "__im_fmfHandles");

  if (v4 && [v7 containsObject:v4])
  {
    __int16 v8 = [MEMORY[0x1E4F6BCB8] sharedInstance];
    uint64_t v9 = [(CKLocationShareOfferChatItem *)self sender];
    uint64_t v10 = [v8 findMyLocationForHandleOrSibling:v9];
    int v11 = [v10 fmfLocation];

    id v12 = [(CKLocationShareOfferChatItem *)self lastKnownLocation];
    uint64_t v13 = [(CKLocationShareOfferChatItem *)self previewURL];
    LODWORD(v10) = [(CKLocationShareOfferChatItem *)self shouldUpdatePreviewWithLocation:v11 lastKnownLocation:v12 previewURL:v13];

    [(CKLocationShareOfferChatItem *)self setLastKnownLocation:v11];
    if (v10) {
      [(CKLocationShareOfferChatItem *)self _generateMapPreview];
    }
  }
}

- (BOOL)shouldUpdatePreviewWithLocation:(id)a3 lastKnownLocation:(id)a4 previewURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    int v11 = [v8 location];

    if (v11)
    {
      if (!v9) {
        goto LABEL_5;
      }
      id v12 = +[CKUIBehavior sharedBehaviors];
      [v12 locationValidInterval];
      double v14 = v13;

      double v15 = [v8 timestamp];
      uint64_t v16 = [v9 timestamp];
      [v15 timeIntervalSinceDate:v16];
      double v18 = v17;

      if (v18 <= v14)
      {
        int v19 = [(CKLocationShareOfferChatItem *)self modificationDateForPreview:v10];
        id v20 = v19;
        if (v19)
        {
          id v21 = v19;
        }
        else
        {
          id v21 = [MEMORY[0x1E4F1C9C8] distantPast];
        }
        double v22 = v21;

        int v11 = [MEMORY[0x1E4F1C9C8] date];
        [v11 timeIntervalSinceDate:v22];
        double v24 = v23;

        LOBYTE(v11) = v24 > v14;
      }
      else
      {
LABEL_5:
        LOBYTE(v11) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return (char)v11;
}

- (id)_desaturatedImageForImage:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F42D90];
  id v4 = a3;
  uint64_t v5 = [v3 mainScreen];
  [v5 scale];
  double v7 = v6;

  [v4 size];
  CGFloat v9 = v7 * v8;
  [v4 size];
  CGFloat v11 = v7 * v10;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  double v13 = CGBitmapContextCreate(0, (unint64_t)v9, (unint64_t)v11, 8uLL, 0, DeviceGray, 0);
  id v14 = v4;
  double v15 = (CGImage *)[v14 CGImage];

  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.double width = v9;
  v20.size.double height = v11;
  CGContextDrawImage(v13, v20, v15);
  CGImageRef Image = CGBitmapContextCreateImage(v13);
  double v17 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:Image scale:0 orientation:v7];
  CGColorSpaceRelease(DeviceGray);
  CGContextRelease(v13);
  if (Image) {
    CFRelease(Image);
  }

  return v17;
}

+ (id)titleBarMaskImageForWidth:(double)a3
{
  double v4 = *(double *)&titleBarMaskImageForWidth__sWidth;
  if (*(double *)&titleBarMaskImageForWidth__sWidth != a3)
  {
    titleBarMaskImageForWidth__sWidth = *(void *)&a3;
    uint64_t v5 = +[CKUIBehavior sharedBehaviors];
    [v5 locationOfferMapThumbnailFillSizeForWidth:a3];
    CGFloat v7 = v6;
    double v9 = v8;

    double v10 = +[CKUIBehavior sharedBehaviors];
    [v10 locationShareBalloonButtonHeight];
    double v12 = v11;
    double v13 = +[CKUIBehavior sharedBehaviors];
    [v13 locationShareBalloonLabelMaxHeightForOfferState:0];
    CGFloat v15 = v12 + v14;

    v22.double width = v7;
    v22.double height = v9;
    UIGraphicsBeginImageContextWithOptions(v22, 0, 0.0);
    uint64_t v16 = [MEMORY[0x1E4F428B8] blackColor];
    [v16 set];

    v23.origin.x = 0.0;
    v23.origin.y = v9 - v15;
    v23.size.double width = v7;
    v23.size.double height = v15;
    UIRectFill(v23);
    uint64_t v17 = UIGraphicsGetImageFromCurrentImageContext();
    double v18 = (void *)titleBarMaskImageForWidth__sTitleBarMaskImage;
    titleBarMaskImageForWidth__sTitleBarMaskCGImageRef Image = v17;

    UIGraphicsEndImageContext();
  }
  int v19 = (void *)titleBarMaskImageForWidth__sTitleBarMaskImage;

  return v19;
}

+ (id)placeholderPreviewCache
{
  if (placeholderPreviewCache_once != -1) {
    dispatch_once(&placeholderPreviewCache_once, &__block_literal_global_190);
  }
  v2 = (void *)placeholderPreviewCache_sPlaceholderPreviews;

  return v2;
}

void __55__CKLocationShareOfferChatItem_placeholderPreviewCache__block_invoke()
{
  uint64_t v0 = CKCreateNSCache(0);
  v1 = (void *)placeholderPreviewCache_sPlaceholderPreviews;
  placeholderPreviewCache_sPlaceholderPreviews = v0;
}

- (FMFLocation)lastKnownLocation
{
  return self->_lastKnownLocation;
}

- (void)setLastKnownLocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end