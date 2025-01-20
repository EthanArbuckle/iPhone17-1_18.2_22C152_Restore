@interface CKLocationAttachmentItem
+ (id)UTITypes;
- (BOOL)isDroppedPin;
- (CKLocationAttachmentItem)initWithFileURL:(id)a3 size:(CGSize)a4 transferGUID:(id)a5 guid:(id)a6 createdDate:(id)a7;
- (CLLocationCoordinate2D)coordinate;
- (NSString)locationTitle;
- (id)_generateThumbnailFillToSize:(CGSize)a3;
- (id)vCardURLProperties;
- (void)generatePreviewWithCompletion:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setLocationTitle:(id)a3;
@end

@implementation CKLocationAttachmentItem

+ (id)UTITypes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], @"loc.vcf", (CFStringRef)*MEMORY[0x1E4F22718]);
  v5[0] = PreferredIdentifierForTag;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (CKLocationAttachmentItem)initWithFileURL:(id)a3 size:(CGSize)a4 transferGUID:(id)a5 guid:(id)a6 createdDate:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CKLocationAttachmentItem;
  v17 = -[CKAttachmentItem initWithFileURL:size:transferGUID:guid:createdDate:shareURL:](&v26, sel_initWithFileURL_size_transferGUID_guid_createdDate_shareURL_, v13, v14, v15, v16, 0, width, height);
  if (v17)
  {
    [(CKLocationAttachmentItem *)v17 setCoordinate:__IMWeakkCLLocationCoordinate2DInvalid()];
    v18 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v13];
    if (v18)
    {
      id v25 = 0;
      v19 = [MEMORY[0x1E4F1B998] contactsWithData:v18 error:&v25];
      id v20 = v25;
      if (v20)
      {
        v21 = [v13 absoluteString];
        [v21 lastPathComponent];
      }
      else
      {
        v21 = [v19 firstObject];
        [v21 givenName];
      v23 = };

      [(CKLocationAttachmentItem *)v17 setLocationTitle:v23];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v13;
          _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Initializing CKLocationAttachmentItem at URL %@ with nil data", buf, 0xCu);
        }
      }
      v18 = v17;
      v17 = 0;
    }
  }
  return v17;
}

- (void)generatePreviewWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() previewCache];
  v6 = CKAttachmentPreviewCacheKey(self);
  v7 = +[CKUIBehavior sharedBehaviors];
  v8 = +[CKUIBehavior sharedBehaviors];
  [v8 mapPreviewMaxWidth];
  double v10 = v9;
  [(CKAttachmentItem *)self size];
  objc_msgSend(v7, "thumbnailFillSizeForWidth:imageSize:", v10, v11, v12);
  uint64_t v14 = v13;
  uint64_t v16 = v15;

  if (([v5 isGeneratingPreviewForKey:v6] & 1) == 0)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __58__CKLocationAttachmentItem_generatePreviewWithCompletion___block_invoke;
    v22[3] = &unk_1E5623A10;
    v22[4] = self;
    v22[5] = v14;
    v22[6] = v16;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__CKLocationAttachmentItem_generatePreviewWithCompletion___block_invoke_42;
    v17[3] = &unk_1E5622F40;
    id v18 = v5;
    id v19 = v6;
    id v20 = self;
    id v21 = v4;
    [v18 enqueueGenerationBlock:v22 completion:v17 withPriority:1 forKey:v19];
  }
}

id __58__CKLocationAttachmentItem_generatePreviewWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "_generateThumbnailFillToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v4;
}

void __58__CKLocationAttachmentItem_generatePreviewWithCompletion___block_invoke_42(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __58__CKLocationAttachmentItem_generatePreviewWithCompletion___block_invoke_2;
  v5[3] = &unk_1E5622F40;
  id v6 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __58__CKLocationAttachmentItem_generatePreviewWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachedPreviewForKey:*(void *)(a1 + 40)];
  id v4 = v2;
  if (v2)
  {
    [*(id *)(a1 + 48) _savePreview:v2];
    id v2 = v4;
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v2);
    id v2 = v4;
  }
}

- (id)_generateThumbnailFillToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (_generateThumbnailFillToSize___pred_CLLocationCoordinate2DIsValidCoreLocation != -1) {
    dispatch_once(&_generateThumbnailFillToSize___pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_34);
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__12;
  v40 = __Block_byref_object_dispose__12;
  id v41 = 0;
  uint64_t v6 = [(CKLocationAttachmentItem *)self coordinate];
  double v8 = v7;
  double v10 = v9;
  if ((_generateThumbnailFillToSize___CLLocationCoordinate2DIsValid(v6) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v44 = (__CFString *)self;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "%@ has invalid coordinate. Abort preview generation.", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
      _CKLogExternal();
    }
    goto LABEL_48;
  }
  double v11 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotOptions", @"MapKit");
  if (!v11)
  {
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v44 = @"MKMapSnapshotOptions";
        __int16 v45 = 2112;
        v46 = @"MapKit";
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
      }
    }
    goto LABEL_33;
  }
  id v12 = objc_alloc_init(v11);
  [v12 setMapType:0];
  if (_generateThumbnailFillToSize___pred_MKCoordinateRegionMakeWithDistanceMapKit != -1) {
    dispatch_once(&_generateThumbnailFillToSize___pred_MKCoordinateRegionMakeWithDistanceMapKit, &__block_literal_global_59);
  }
  _generateThumbnailFillToSize___MKCoordinateRegionMakeWithDistance(v8, v10, 500.0, 500.0);
  if (v14 < -180.0 || v14 > 180.0 || v13 < -90.0 || v13 > 90.0 || v15 < 0.0 || v15 > 180.0 || v16 < 0.0 || v16 > 360.0)
  {
    if (!IMOSLoggingEnabled())
    {
LABEL_28:

LABEL_33:
      id v23 = 0;
      goto LABEL_49;
    }
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "CKLocationAttachmentItem - Map region is invalid, bailing!", buf, 2u);
    }
LABEL_27:

    goto LABEL_28;
  }
  objc_msgSend(v12, "setRegion:");
  objc_msgSend(v12, "setSize:", width, height);
  v17 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotFeatureAnnotation", @"MapKit");
  if (v17)
  {
    id v18 = objc_msgSend([v17 alloc], "initWithCoordinate:title:representation:", 0, 2, v8, v10);
    v42 = v18;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
    [v12 _setCustomFeatureAnnotations:v19];
  }
  else if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v44 = @"MKMapSnapshotFeatureAnnotation";
      __int16 v45 = 2112;
      v46 = @"MapKit";
      _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
    }
  }
  id v25 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotter", @"MapKit");
  if (!v25)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_28;
    }
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v44 = @"MKMapSnapshotter";
      __int16 v45 = 2112;
      v46 = @"MapKit";
      _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
    }
    goto LABEL_27;
  }
  objc_super v26 = (void *)[[v25 alloc] initWithOptions:v12];
  v27 = dispatch_group_create();
  dispatch_group_enter(v27);
  id v28 = +[CKPreviewDispatchCache mapThumbnailQueue];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __57__CKLocationAttachmentItem__generateThumbnailFillToSize___block_invoke_68;
  v33[3] = &unk_1E5620EB0;
  v35 = &v36;
  uint64_t v29 = v27;
  v34 = v29;
  [v26 startWithQueue:v28 completionHandler:v33];

  dispatch_time_t v30 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v29, v30))
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v44 = (__CFString *)self;
        _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "%@ thumbnail generation timed out.", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
      _CKLogExternal();
    }
  }

LABEL_48:
  id v23 = (id)v37[5];
LABEL_49:
  _Block_object_dispose(&v36, 8);

  return v23;
}

void *__57__CKLocationAttachmentItem__generateThumbnailFillToSize___block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("CLLocationCoordinate2DIsValid", @"CoreLocation");
  _generateThumbnailFillToSize___CLLocationCoordinate2DIsValid = result;
  return result;
}

void *__57__CKLocationAttachmentItem__generateThumbnailFillToSize___block_invoke_57()
{
  result = (void *)MEMORY[0x192FBA870]("MKCoordinateRegionMakeWithDistance", @"MapKit");
  _generateThumbnailFillToSize___MKCoordinateRegionMakeWithDistance = result;
  return result;
}

void __57__CKLocationAttachmentItem__generateThumbnailFillToSize___block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && IMOSLoggingEnabled())
  {
    double v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Got error back in CKLocationAttachmentItem for map snapshot: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = [v5 image];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (CLLocationCoordinate2D)coordinate
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (coordinate__pred_CLLocationCoordinate2DIsValidCoreLocation != -1) {
    dispatch_once(&coordinate__pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_75_0);
  }
  if (coordinate__pred_CLLocationCoordinate2DMakeCoreLocation != -1) {
    dispatch_once(&coordinate__pred_CLLocationCoordinate2DMakeCoreLocation, &__block_literal_global_77_1);
  }
  p_coordinate = &self->_coordinate;
  if (coordinate__CLLocationCoordinate2DIsValid(self->_coordinate.latitude, self->_coordinate.longitude)) {
    goto LABEL_28;
  }
  double v4 = __IMWeakkCLLocationCoordinate2DInvalid();
  CLLocationDegrees v6 = v5;
  [(CKLocationAttachmentItem *)self vCardURLProperties];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v8) {
    goto LABEL_27;
  }
  uint64_t v9 = v8;
  v37 = &self->_coordinate;
  uint64_t v39 = *(void *)v41;
  id v38 = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v41 != v39) {
        objc_enumerationMutation(v7);
      }
      int v11 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v40 + 1) + 8 * i)];
      id v12 = [v11 host];
      if ([v12 isEqualToString:@"maps.apple.com"])
      {
        uint64_t v13 = [v11 queryParameters];
        double v14 = [v13 objectForKey:@"sll"];
        double v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v16 = [v13 objectForKey:@"ll"];
        }
        v17 = v16;

        id v18 = [v17 componentsSeparatedByString:@","];
        if ([v18 count] == 2)
        {
          id v21 = (double (*)(uint64_t, double, double))coordinate__CLLocationCoordinate2DMake;
          id v19 = [v18 objectAtIndex:0];
          [v19 doubleValue];
          double v23 = v22;
          id v20 = [v18 objectAtIndex:1];
          uint64_t v24 = [v20 doubleValue];
          double v4 = v21(v24, v23, v25);
          CLLocationDegrees v6 = v26;
LABEL_26:

          p_coordinate = v37;
          id v7 = v38;
          goto LABEL_27;
        }
      }
      else
      {
        if (![v12 isEqualToString:@"maps.google.com"]) {
          goto LABEL_21;
        }
        uint64_t v13 = [v11 queryParameters];
        v17 = [v13 objectForKey:@"q"];
        id v18 = [v17 componentsSeparatedByString:@" "];
        if ([v18 count])
        {
          id v19 = [v18 objectAtIndex:0];
          id v20 = [v19 componentsSeparatedByString:@","];
          if ([v20 count] == 2)
          {
            v27 = (double (*)(uint64_t, double, double))coordinate__CLLocationCoordinate2DMake;
            id v28 = [v20 objectAtIndex:0];
            [v28 doubleValue];
            double v30 = v29;
            v31 = [v20 objectAtIndex:1];
            uint64_t v32 = [v31 doubleValue];
            double v4 = v27(v32, v30, v33);
            CLLocationDegrees v6 = v34;

            goto LABEL_26;
          }

          id v7 = v38;
        }
      }

LABEL_21:
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v9) {
      continue;
    }
    break;
  }
  p_coordinate = v37;
LABEL_27:

  p_coordinate->double latitude = v4;
  p_coordinate->double longitude = v6;

LABEL_28:
  double latitude = p_coordinate->latitude;
  double longitude = p_coordinate->longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

void *__38__CKLocationAttachmentItem_coordinate__block_invoke()
{
  CLLocationCoordinate2D result = (void *)MEMORY[0x192FBA870]("CLLocationCoordinate2DIsValid", @"CoreLocation");
  coordinate__CLLocationCoordinate2DIsValid = result;
  return result;
}

void *__38__CKLocationAttachmentItem_coordinate__block_invoke_2()
{
  CLLocationCoordinate2D result = (void *)MEMORY[0x192FBA870]("CLLocationCoordinate2DMake", @"CoreLocation");
  coordinate__CLLocationCoordinate2DMake = result;
  return result;
}

- (id)vCardURLProperties
{
  id v2 = [(CKAttachmentItem *)self fileURL];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2 options:8 error:0];
    if (v3)
    {
      uint64_t v8 = 0;
      double v4 = [MEMORY[0x1E4F1B998] contactsWithData:v3 error:&v8];
      if ([v4 count])
      {
        double v5 = [v4 firstObject];
        CLLocationDegrees v6 = [v5 urlAddresses];
      }
      else
      {
        CLLocationDegrees v6 = 0;
      }

      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  CLLocationDegrees v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)isDroppedPin
{
  id v2 = [(CKAttachmentItem *)self fileURL];
  uint64_t v3 = [v2 lastPathComponent];
  char v4 = [v3 isEqualToString:@"Dropped Pin.loc.vcf"];

  return v4;
}

- (NSString)locationTitle
{
  return self->_locationTitle;
}

- (void)setLocationTitle:(id)a3
{
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (void).cxx_destruct
{
}

@end