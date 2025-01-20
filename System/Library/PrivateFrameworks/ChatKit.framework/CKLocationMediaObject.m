@interface CKLocationMediaObject
+ (BOOL)isPreviewable;
+ (Class)__ck_attachmentItemClass;
+ (id)UTITypes;
+ (id)fallbackFilenamePrefix;
+ (id)placeholderPreviewCache;
+ (id)placeholderPreviewForWidth:(double)a3 orientation:(char)a4;
+ (id)vcardDataFromCLLocation:(id)a3;
- (BOOL)isDroppedPin;
- (CGSize)bbSize;
- (CKLocationMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5;
- (CLLocationCoordinate2D)coordinate;
- (Class)balloonViewClass;
- (Class)placeholderBalloonViewClass;
- (Class)previewBalloonViewClass;
- (NSString)title;
- (id)attachmentSummary:(unint64_t)a3;
- (id)bbPreviewFillToSize:(CGSize)a3;
- (id)generatePlaceholderThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4;
- (id)generatePlaceholderThumbnailForWidth:(double)a3 orientation:(char)a4;
- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4;
- (id)mapItem;
- (id)metricsCollectorMediaType;
- (id)pasteboardItemProvider;
- (id)previewCacheKeyWithOrientation:(char)a3;
- (id)previewCachesFileURLWithOrientation:(char)a3 extension:(id)a4 generateIntermediaries:(BOOL)a5;
- (id)previewForWidth:(double)a3 orientation:(char)a4;
- (id)previewItemTitle;
- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4;
- (id)transcriptTraitCollection;
- (id)vCardURLProperties;
- (int)mediaType;
- (void)coordinate;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation CKLocationMediaObject

- (id)mapItem
{
  v3 = (objc_class *)MEMORY[0x192FBA860](@"MKPlacemark", @"MapKit");
  uint64_t v4 = MEMORY[0x192FBA860](@"MKMapItem", @"MapKit");
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v7 = (objc_class *)v4;
    v8 = [(CKMediaObject *)self data];
    uint64_t v33 = 0;
    v9 = [MEMORY[0x1E4F1B998] contactsWithData:v8 error:&v33];
    if ([v9 count])
    {
      v32 = v8;
      v10 = [v9 firstObject];
      v11 = [v10 postalAddresses];
      if ([v11 count])
      {
        uint64_t v31 = [v11 objectAtIndex:0];
      }
      else
      {
        uint64_t v31 = 0;
      }
      v15 = [v10 phoneNumbers];
      if ([v15 count])
      {
        v13 = [v15 objectAtIndex:0];
      }
      else
      {
        v13 = 0;
      }
      v16 = [v10 urlAddresses];
      if ([v16 count])
      {
        v14 = [v16 lastObject];
      }
      else
      {
        v14 = 0;
      }

      v12 = (void *)v31;
      v8 = v32;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
    }
    id v17 = [v3 alloc];
    [(CKLocationMediaObject *)self coordinate];
    double v19 = v18;
    double v21 = v20;
    v22 = [v12 value];
    v23 = objc_msgSend(v17, "initWithCoordinate:postalAddress:", v22, v19, v21);

    v6 = (void *)[[v7 alloc] initWithPlacemark:v23];
    v24 = [v13 value];
    v25 = [v24 stringValue];
    [v6 setPhoneNumber:v25];

    if (v14)
    {
      v26 = (void *)MEMORY[0x1E4F1CB10];
      v27 = [v14 value];
      v28 = [v26 URLWithString:v27];
      [v6 setUrl:v28];
    }
    v29 = [(CKLocationMediaObject *)self title];
    [v6 setName:v29];
  }

  return v6;
}

+ (Class)__ck_attachmentItemClass
{
  return (Class)objc_opt_class();
}

+ (id)vcardDataFromCLLocation:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  [a3 coordinate];
  v3 = objc_msgSend(NSString, "__ck_appleMapsURLStringForCoordinate:coordinateName:", 0);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
  if (v3 && [v3 length])
  {
    BOOL v5 = (void *)[v4 mutableCopy];
    v6 = [v5 urlAddresses];
    v7 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:@"map url" value:v3];
    v8 = [v6 arrayByAddingObject:v7];

    [v5 setUrlAddresses:v8];
    v9 = +[CKUIBehavior sharedBehaviors];
    v10 = [v9 locationRelativeDateFormatter];

    v11 = [MEMORY[0x1E4F1C9C8] date];
    v12 = [v10 stringFromDate:v11];

    v13 = NSString;
    v14 = CKFrameworkBundle();
    v15 = [v14 localizedStringForKey:@"LOCATION_FOOTER_DETAILS_VIEW" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v16 = objc_msgSend(v13, "stringWithFormat:", v15, v12);

    id v17 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v18 = [v17 userInterfaceLayoutDirection];

    if (v18 == 1) {
      double v19 = @"\u200F";
    }
    else {
      double v19 = @"\u200E";
    }
    double v20 = [(__CFString *)v19 stringByAppendingString:v16];

    [v5 setGivenName:v20];
    [v5 setUrlAddresses:v8];
    uint64_t v21 = [v5 copy];

    id v4 = (id)v21;
  }
  v22 = (void *)MEMORY[0x1E4F1B998];
  v27[0] = v4;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  uint64_t v26 = 0;
  v24 = [v22 dataWithContacts:v23 error:&v26];

  return v24;
}

+ (id)placeholderPreviewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  v6 = objc_alloc_init(CKLocationMediaObject);
  v7 = [(CKLocationMediaObject *)v6 previewForWidth:v4 orientation:a3];

  return v7;
}

+ (id)UTITypes
{
  v5[2] = *MEMORY[0x1E4F143B8];
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], @"loc.vcf", (CFStringRef)*MEMORY[0x1E4F22718]);
  v5[0] = PreferredIdentifierForTag;
  v5[1] = @"com.apple.messages.maputi";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E4F6D978];
}

+ (id)fallbackFilenamePrefix
{
  return @"LOC";
}

- (id)attachmentSummary:(unint64_t)a3
{
  uint64_t v4 = NSString;
  BOOL v5 = IMSharedUtilitiesFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"%lu Locations" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (CKLocationMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CKLocationMediaObject;
  BOOL v5 = [(CKMediaObject *)&v7 initWithTransfer:a3 context:a4 forceInlinePreview:a5];
  if (v5) {
    [(CKLocationMediaObject *)v5 setCoordinate:__kCLLocationCoordinate2DInvalid()];
  }
  return v5;
}

- (int)mediaType
{
  return 5;
}

- (NSString)title
{
  if ([(CKContactMediaObject *)self generatePreviewOutOfProcess])
  {
    v3 = [(CKContactMediaObject *)self contactMediaInfo];
    uint64_t v4 = v3;
    if (v3)
    {
      BOOL v5 = [v3 objectForKeyedSubscript:@"contactFormatterTitle"];
      if (v5) {
        goto LABEL_7;
      }
      BOOL v5 = [v4 objectForKeyedSubscript:@"organizationNameTitle"];
      if (v5) {
        goto LABEL_7;
      }
    }
    v32.receiver = self;
    v32.super_class = (Class)CKLocationMediaObject;
    v6 = [(CKContactMediaObject *)&v32 title];
    BOOL v5 = v6;
    if (v4 || ![v6 isEqualToString:@"Current Location"])
    {
LABEL_7:
      if (![v5 isEqualToString:@"Current Location"]) {
        goto LABEL_27;
      }
      objc_super v7 = +[CKUIBehavior sharedBehaviors];
      v8 = [v7 locationRelativeDateFormatter];

      uint64_t v9 = [(CKMediaObject *)self time];
      goto LABEL_21;
    }
LABEL_16:
    v8 = CKFrameworkBundle();
    uint64_t v15 = [v8 localizedStringForKey:@"LOCATING" value:&stru_1EDE4CA38 table:@"ChatKit"];
LABEL_26:

    BOOL v5 = (void *)v15;
    goto LABEL_27;
  }
  v10 = [(CKContactMediaObject *)self vCardSummary];
  uint64_t v4 = v10;
  if (v10 && [v10 contactCount])
  {
    v11 = [v4 avatarContacts];
    v12 = [v11 firstObject];

    uint64_t v13 = [MEMORY[0x1E4F1B910] stringFromContact:v12 style:0];
    if (v13)
    {
      BOOL v5 = (void *)v13;

      goto LABEL_17;
    }
    BOOL v5 = [v12 organizationName];

    if (v5) {
      goto LABEL_17;
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)CKLocationMediaObject;
  v14 = [(CKContactMediaObject *)&v31 title];
  BOOL v5 = v14;
  if (!v4 && [v14 isEqualToString:@"Current Location"]) {
    goto LABEL_16;
  }
LABEL_17:
  if (([v5 isEqualToString:@"Current Location"] & 1) != 0
    || (CKFrameworkBundle(),
        v16 = objc_claimAutoreleasedReturnValue(),
        [v16 localizedStringForKey:@"Current Location" value:&stru_1EDE4CA38 table:@"ChatKit"], id v17 = objc_claimAutoreleasedReturnValue(), v18 = objc_msgSend(v5, "isEqualToString:", v17), v17, v16, v18))
  {
    double v19 = +[CKUIBehavior sharedBehaviors];
    v8 = [v19 locationRelativeDateFormatter];

    double v20 = [(CKMediaObject *)self time];
    uint64_t v21 = [v8 stringFromDate:v20];

    if (v21)
    {
LABEL_22:
      v23 = NSString;
      v24 = CKFrameworkBundle();
      v25 = [v24 localizedStringForKey:@"LOCATION_FOOTER_DETAILS_VIEW" value:&stru_1EDE4CA38 table:@"ChatKit"];
      uint64_t v26 = objc_msgSend(v23, "stringWithFormat:", v25, v21);

      v27 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v28 = [v27 userInterfaceLayoutDirection];

      if (v28 == 1) {
        v29 = @"\u200F";
      }
      else {
        v29 = @"\u200E";
      }
      uint64_t v15 = [(__CFString *)v29 stringByAppendingString:v26];

      BOOL v5 = (void *)v21;
      goto LABEL_26;
    }
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
LABEL_21:
    v22 = (void *)v9;
    uint64_t v21 = [v8 stringFromDate:v9];

    goto LABEL_22;
  }
LABEL_27:

  return (NSString *)v5;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)previewBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)placeholderBalloonViewClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isPreviewable
{
  return 1;
}

- (id)previewCacheKeyWithOrientation:(char)a3
{
  uint64_t v4 = NSString;
  BOOL v5 = CKOrientedPreviewCacheKey(self, a3);
  v6 = [(CKLocationMediaObject *)self transcriptTraitCollection];
  objc_super v7 = [v4 stringWithFormat:@"%@-%zd", v5, objc_msgSend(v6, "userInterfaceStyle")];

  return v7;
}

- (id)previewCachesFileURLWithOrientation:(char)a3 extension:(id)a4 generateIntermediaries:(BOOL)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CKLocationMediaObject;
  v6 = [(CKMediaObject *)&v12 previewCachesFileURLWithOrientation:a3 extension:a4 generateIntermediaries:a5];
  objc_super v7 = NSString;
  v8 = [(CKLocationMediaObject *)self transcriptTraitCollection];
  uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", @"%ld", objc_msgSend(v8, "userInterfaceStyle"));

  v10 = IMAttachmentPreviewFileURLFromURLWithSuffix();

  return v10;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    id v7 = 0;
    goto LABEL_17;
  }
  if (previewForWidth_orientation___pred_CLLocationCoordinate2DIsValidCoreLocation != -1) {
    dispatch_once(&previewForWidth_orientation___pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_141);
  }
  v8 = [(CKLocationMediaObject *)self previewCacheKeyWithOrientation:v4];
  uint64_t v9 = [(CKMediaObject *)self transfer];
  if (![(CKMediaObject *)self isPreviewable]
    || ([v9 isFileDataReady] & 1) == 0 && (objc_msgSend(v9, "isRestoring") & 1) == 0)
  {
    *(void *)&long long buf = v4;
    *(_DWORD *)((char *)&buf + 1) = [(CKLocationMediaObject *)self isDroppedPin];
    v10 = [(CKLocationMediaObject *)self transcriptTraitCollection];
    *((void *)&buf + 1) = [v10 userInterfaceStyle];

    v11 = [MEMORY[0x1E4F29238] value:&buf withObjCType:"{?=cBq}"];
    objc_super v12 = +[CKLocationMediaObject placeholderPreviewCache];
    uint64_t v13 = [v12 objectForKey:v11];

    if (!v13)
    {
      v14 = [(CKLocationMediaObject *)self generatePlaceholderThumbnailForWidth:v4 orientation:a3];
      v34.receiver = self;
      v34.super_class = (Class)CKLocationMediaObject;
      uint64_t v13 = [(CKMediaObject *)&v34 generatePreviewFromThumbnail:v14 width:v4 orientation:a3];

      if (v13)
      {
        if (v11)
        {
          uint64_t v15 = +[CKLocationMediaObject placeholderPreviewCache];
          [v15 setObject:v13 forKey:v11];
        }
      }
    }
    id v7 = v13;

    goto LABEL_16;
  }
  v33.receiver = self;
  v33.super_class = (Class)CKLocationMediaObject;
  id v7 = [(CKMediaObject *)&v33 previewForWidth:v4 orientation:a3];
  if (!v7)
  {
    if ([(CKContactMediaObject *)self generatePreviewOutOfProcess])
    {
      [(CKMediaObject *)self generateOOPPreviewForWidth:v4 orientation:a3];
    }
    else if (((uint64_t (*)(uint64_t))previewForWidth_orientation___CLLocationCoordinate2DIsValid)([(CKLocationMediaObject *)self coordinate]))
    {
      id v17 = [(CKContactMediaObject *)self previewDispatchCache];
      if ([v17 isGeneratingPreviewForKey:v8])
      {
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(2);
          int v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = self;
            _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_DEBUG, "%@ is already generating preview. Abort.", (uint8_t *)&buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          v24 = self;
          _CKLog();
        }
      }
      else
      {
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_152;
        v31[3] = &unk_1E5624FF8;
        v31[4] = self;
        *(double *)&v31[5] = a3;
        char v32 = v4;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_166;
        v26[3] = &unk_1E5627180;
        id v27 = v17;
        id v28 = v8;
        v29 = self;
        char v30 = v4;
        [v27 enqueueGenerationBlock:v31 completion:v26 withPriority:-1 forKey:v28];
      }
      *(void *)&long long buf = v4;
      BYTE1(buf) = [(CKLocationMediaObject *)self isDroppedPin];
      double v19 = [(CKLocationMediaObject *)self transcriptTraitCollection];
      *((void *)&buf + 1) = [v19 userInterfaceStyle];

      double v20 = [MEMORY[0x1E4F29238] value:&buf withObjCType:"{?=cBq}"];
      uint64_t v21 = +[CKLocationMediaObject placeholderPreviewCache];
      id v7 = [v21 objectForKey:v20];

      if (!v7)
      {
        v22 = [(CKLocationMediaObject *)self generatePlaceholderThumbnailForWidth:v4 orientation:a3];
        v25.receiver = self;
        v25.super_class = (Class)CKLocationMediaObject;
        id v7 = [(CKMediaObject *)&v25 generatePreviewFromThumbnail:v22 width:v4 orientation:a3];

        if (v7)
        {
          v23 = +[CKLocationMediaObject placeholderPreviewCache];
          [v23 setObject:v7 forKey:v20];
        }
      }

      goto LABEL_16;
    }
    id v7 = 0;
  }
LABEL_16:

LABEL_17:

  return v7;
}

void *__53__CKLocationMediaObject_previewForWidth_orientation___block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("CLLocationCoordinate2DIsValid", @"CoreLocation");
  previewForWidth_orientation___CLLocationCoordinate2DIsValid = result;
  return result;
}

id __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_152(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      BOOL v5 = *(void **)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      objc_super v31 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_DEBUG, "%@ generate preview.", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    uint64_t v27 = *(void *)(a1 + 32);
    _CKLog();
  }
  v6 = +[CKUIBehavior sharedBehaviors];
  [v6 mapThumbnailFillSizeForWidth:*(double *)(a1 + 40)];
  double v8 = v7;
  double v10 = v9;

  v11 = +[CKUIBehavior sharedBehaviors];
  [v11 thumbnailContentAlignmentInsetsForOrientation:*(char *)(a1 + 48)];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = objc_msgSend(*(id *)(a1 + 32), "generateThumbnailFillToSize:contentAlignmentInsets:", v8, v10, v13, v15, v17, v19);
  id v21 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v21 startTimingForKey:@"CKLocationMediaObject_PreviewGenerationTime"];
  v22 = [*(id *)(a1 + 32) generatePreviewFromThumbnail:v20 width:*(char *)(a1 + 48) orientation:*(double *)(a1 + 40)];
  [v21 stopTimingForKey:@"CKLocationMediaObject_PreviewGenerationTime"];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = [*(id *)(a1 + 32) UTIType];
      *(_DWORD *)long long buf = 138412546;
      objc_super v31 = v24;
      __int16 v32 = 2112;
      id v33 = v21;
      _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_DEBUG, "Cache miss on UTI type %@ generated with timing: %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    id v28 = [*(id *)(a1 + 32) UTIType];
    id v29 = v21;
    _CKLog();
  }
  objc_super v25 = objc_msgSend(MEMORY[0x1E4F6E890], "sharedInstance", v28, v29);
  [v25 trackEvent:*MEMORY[0x1E4F6DA68]];

  return v22;
}

void __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_166(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_2;
  v4[3] = &unk_1E5627180;
  id v5 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  char v8 = *(unsigned char *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachedPreviewForKey:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_3;
    void v5[3] = &unk_1E5624FD0;
    v5[4] = *(void *)(a1 + 48);
    char v7 = *(unsigned char *)(a1 + 56);
    id v6 = v2;
    [v4 enqueueSaveBlock:v5 forMediaObject:*(void *)(a1 + 48) withPriority:0];
    [*(id *)(a1 + 48) postPreviewDidChangeNotifications];
  }
}

void __53__CKLocationMediaObject_previewForWidth_orientation___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 48);
  id v6 = [v3 previewFilenameExtension];
  char v7 = [v4 previewCachesFileURLWithOrientation:v5 extension:v6 generateIntermediaries:1];

  if (IMOSLoggingEnabled())
  {
    char v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      double v10 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Saving local preview to %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [v3 savePreview:*(void *)(a1 + 40) toURL:v7 forOrientation:*(char *)(a1 + 48)];
}

- (id)transcriptTraitCollection
{
  v7.receiver = self;
  v7.super_class = (Class)CKLocationMediaObject;
  id v2 = [(CKMediaObject *)&v7 transcriptTraitCollection];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    char v5 = [MEMORY[0x1E4F43058] keyWindow];
    id v4 = [v5 traitCollection];
  }

  return v4;
}

- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (generateThumbnailFillToSize_contentAlignmentInsets___pred_CLLocationCoordinate2DIsValidCoreLocation != -1) {
    dispatch_once(&generateThumbnailFillToSize_contentAlignmentInsets___pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_173_0);
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__39;
  v38 = __Block_byref_object_dispose__39;
  id v39 = 0;
  uint64_t v7 = [(CKLocationMediaObject *)self coordinate];
  double v9 = v8;
  double v11 = v10;
  if ((generateThumbnailFillToSize_contentAlignmentInsets___CLLocationCoordinate2DIsValid(v7) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        v41 = (__CFString *)self;
        _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "%@ has invalid coordinate. Abort preview generation.", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
      _CKLogExternal();
    }
    goto LABEL_32;
  }
  double v12 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotOptions", @"MapKit");
  if (!v12)
  {
    if (IMOSLoggingEnabled())
    {
      id v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        v41 = @"MKMapSnapshotOptions";
        __int16 v42 = 2112;
        v43 = @"MapKit";
        _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
      }
    }
    goto LABEL_42;
  }
  id v13 = objc_alloc_init(v12);
  [v13 setMapType:0];
  double v14 = [(CKLocationMediaObject *)self transcriptTraitCollection];
  [v13 setTraitCollection:v14];

  [v13 _setUseSnapshotService:1];
  if (generateThumbnailFillToSize_contentAlignmentInsets___pred_MKCoordinateRegionMakeWithDistanceMapKit != -1) {
    dispatch_once(&generateThumbnailFillToSize_contentAlignmentInsets___pred_MKCoordinateRegionMakeWithDistanceMapKit, &__block_literal_global_185);
  }
  generateThumbnailFillToSize_contentAlignmentInsets___MKCoordinateRegionMakeWithDistance(v9, v11, 500.0, 500.0);
  if (v16 >= -180.0
    && v16 <= 180.0
    && v15 >= -90.0
    && v15 <= 90.0
    && v17 >= 0.0
    && v17 <= 180.0
    && v18 >= 0.0
    && v18 <= 360.0)
  {
    objc_msgSend(v13, "setRegion:");
    objc_msgSend(v13, "setSize:", width, height);
    double v19 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotter", @"MapKit");
    if (v19)
    {
      double v20 = (void *)[[v19 alloc] initWithOptions:v13];
      id v21 = dispatch_group_create();
      dispatch_group_enter(v21);
      v22 = +[CKPreviewDispatchCache mapThumbnailQueue];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __76__CKLocationMediaObject_generateThumbnailFillToSize_contentAlignmentInsets___block_invoke_191;
      v31[3] = &unk_1E5620EB0;
      id v33 = &v34;
      v23 = v21;
      __int16 v32 = v23;
      [v20 startWithQueue:v22 completionHandler:v31];

      dispatch_time_t v24 = dispatch_time(0, 20000000000);
      if (dispatch_group_wait(v23, v24))
      {
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(2);
          objc_super v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            v41 = (__CFString *)self;
            _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "%@ thumbnail generation timed out.", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
          _CKLogExternal();
        }
      }

LABEL_32:
      id v27 = (id)v35[5];
      goto LABEL_43;
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_37;
    }
    id v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      v41 = @"MKMapSnapshotter";
      __int16 v42 = 2112;
      v43 = @"MapKit";
      _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
    }
    goto LABEL_36;
  }
  if (IMOSLoggingEnabled())
  {
    id v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "CKLocationMediaObject - Map region is invalid, bailing!", buf, 2u);
    }
LABEL_36:
  }
LABEL_37:

LABEL_42:
  id v27 = 0;
LABEL_43:
  _Block_object_dispose(&v34, 8);

  return v27;
}

void *__76__CKLocationMediaObject_generateThumbnailFillToSize_contentAlignmentInsets___block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("CLLocationCoordinate2DIsValid", @"CoreLocation");
  generateThumbnailFillToSize_contentAlignmentInsets___CLLocationCoordinate2DIsValid = result;
  return result;
}

void *__76__CKLocationMediaObject_generateThumbnailFillToSize_contentAlignmentInsets___block_invoke_183()
{
  result = (void *)MEMORY[0x192FBA870]("MKCoordinateRegionMakeWithDistance", @"MapKit");
  generateThumbnailFillToSize_contentAlignmentInsets___MKCoordinateRegionMakeWithDistance = result;
  return result;
}

void __76__CKLocationMediaObject_generateThumbnailFillToSize_contentAlignmentInsets___block_invoke_191(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Got error back in CKLocationMediaObject for map snapshot: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = [v5 image];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (CGSize)bbSize
{
  double v2 = 270.0;
  double v3 = 130.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (id)bbPreviewFillToSize:(CGSize)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v5 = [(CKMediaObject *)self transferGUID];
        int v12 = 138412290;
        uint64_t v13 = v5;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Transfer %@ was marked as failed for preview generation, not showing preview in notification", (uint8_t *)&v12, 0xCu);
      }
    }
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = [(CKMediaObject *)self fileURL];
    uint64_t v8 = [(CKMediaObject *)self previewFilenameExtension];
    uint64_t v9 = IMAttachmentPreviewFileURL();

    id v6 = [(CKMediaObject *)self savedPreviewFromURL:v9 forOrientation:0];
    if (!v6 && IMOSLoggingEnabled())
    {
      double v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        uint64_t v13 = v9;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Expected OOP preview for SB at %@, got nil", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  return v6;
}

- (id)previewItemTitle
{
  double v2 = CKFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"PREVIEW_TITLE_LOCATION" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

- (CLLocationCoordinate2D)coordinate
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (coordinate__pred_CLLocationCoordinate2DIsValidCoreLocation_0 != -1) {
    dispatch_once(&coordinate__pred_CLLocationCoordinate2DIsValidCoreLocation_0, &__block_literal_global_201);
  }
  if (coordinate__pred_CLLocationCoordinate2DMakeCoreLocation_0 != -1) {
    dispatch_once(&coordinate__pred_CLLocationCoordinate2DMakeCoreLocation_0, &__block_literal_global_203);
  }
  v44[0] = 0;
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    v44[1] = (void *)MEMORY[0x1E4F143A8];
    v44[2] = (void *)3221225472;
    v44[3] = __TelephonyUtilitiesLibraryCore_block_invoke;
    v44[4] = &__block_descriptor_40_e5_v8__0l;
    v44[5] = v44;
    long long v46 = xmmword_1E5628818;
    uint64_t v47 = 0;
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary) {
    -[CKLocationMediaObject coordinate](v44);
  }
  if (v44[0]) {
    free(v44[0]);
  }
  p_coordinate = &self->_coordinate;
  if (coordinate__CLLocationCoordinate2DIsValid_0(self->_coordinate.latitude, self->_coordinate.longitude))
  {
    double latitude = p_coordinate->latitude;
    if (p_coordinate->latitude != 0.0)
    {
      double longitude = self->_coordinate.longitude;
      if (longitude != 0.0) {
        goto LABEL_37;
      }
    }
  }
  double v6 = __kCLLocationCoordinate2DInvalid();
  CLLocationDegrees v8 = v7;
  [(CKLocationMediaObject *)self vCardURLProperties];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (!v10) {
    goto LABEL_34;
  }
  uint64_t v11 = v10;
  v37 = &self->_coordinate;
  uint64_t v39 = *(void *)v41;
  id v38 = v9;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v41 != v39) {
        objc_enumerationMutation(v9);
      }
      uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v40 + 1) + 8 * i)];
      uint64_t v14 = [v13 host];
      if ([v14 isEqualToString:@"maps.apple.com"])
      {
        double v15 = [v13 queryParameters];
        double v16 = [v15 objectForKey:@"sll"];
        double v17 = v16;
        if (v16)
        {
          id v18 = v16;
        }
        else
        {
          id v18 = [v15 objectForKey:@"ll"];
        }
        double v19 = v18;

        double v20 = [v19 componentsSeparatedByString:@","];
        if ([v20 count] == 2)
        {
          v23 = (double (*)(uint64_t, double, double))coordinate__CLLocationCoordinate2DMake_0;
          id v21 = [v20 objectAtIndex:0];
          [v21 doubleValue];
          double v25 = v24;
          v22 = [v20 objectAtIndex:1];
          uint64_t v26 = [v22 doubleValue];
          double v6 = v23(v26, v25, v27);
          CLLocationDegrees v8 = v28;
LABEL_33:

          p_coordinate = v37;
          id v9 = v38;
          goto LABEL_34;
        }
      }
      else
      {
        if (![v14 isEqualToString:@"maps.google.com"]) {
          goto LABEL_28;
        }
        double v15 = [v13 tuQueryParameters];
        double v19 = [v15 objectForKey:@"q"];
        double v20 = [v19 componentsSeparatedByString:@" "];
        if ([v20 count])
        {
          id v21 = [v20 objectAtIndex:0];
          v22 = [v21 componentsSeparatedByString:@","];
          if ([v22 count] == 2)
          {
            id v29 = (double (*)(uint64_t, double, double))coordinate__CLLocationCoordinate2DMake_0;
            char v30 = [v22 objectAtIndex:0];
            [v30 doubleValue];
            double v32 = v31;
            id v33 = [v22 objectAtIndex:1];
            uint64_t v34 = [v33 doubleValue];
            double v6 = v29(v34, v32, v35);
            CLLocationDegrees v8 = v36;

            goto LABEL_33;
          }

          id v9 = v38;
        }
      }

LABEL_28:
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v11) {
      continue;
    }
    break;
  }
  p_coordinate = v37;
LABEL_34:

  p_coordinate->double latitude = v6;
  p_coordinate->double longitude = v8;

  double latitude = p_coordinate->latitude;
  double longitude = p_coordinate->longitude;
LABEL_37:
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

void *__35__CKLocationMediaObject_coordinate__block_invoke()
{
  CLLocationCoordinate2D result = (void *)MEMORY[0x192FBA870]("CLLocationCoordinate2DIsValid", @"CoreLocation");
  coordinate__CLLocationCoordinate2DIsValid_0 = result;
  return result;
}

void *__35__CKLocationMediaObject_coordinate__block_invoke_2()
{
  CLLocationCoordinate2D result = (void *)MEMORY[0x192FBA870]("CLLocationCoordinate2DMake", @"CoreLocation");
  coordinate__CLLocationCoordinate2DMake_0 = result;
  return result;
}

- (id)vCardURLProperties
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v2 = [(CKMediaObject *)self data];
  if (v2)
  {
    id v20 = 0;
    double v3 = [MEMORY[0x1E4F1B998] contactsWithData:v2 error:&v20];
    id v4 = v20;
    if ([v3 count])
    {
      id v5 = [v3 firstObject];
      double v6 = [v5 urlAddresses];
    }
    else
    {
      double v6 = 0;
    }
    CLLocationDegrees v8 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "value", (void)v16);
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }

    double v7 = [MEMORY[0x1E4F1C978] arrayWithArray:v8];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

+ (id)placeholderPreviewCache
{
  if (placeholderPreviewCache_once_0 != -1) {
    dispatch_once(&placeholderPreviewCache_once_0, &__block_literal_global_214_1);
  }
  double v2 = (void *)placeholderPreviewCache_sPlaceholderPreviews_0;

  return v2;
}

void __48__CKLocationMediaObject_placeholderPreviewCache__block_invoke()
{
  uint64_t v0 = CKCreateNSCache(4);
  v1 = (void *)placeholderPreviewCache_sPlaceholderPreviews_0;
  placeholderPreviewCache_sPlaceholderPreviews_0 = v0;
}

- (BOOL)isDroppedPin
{
  int v3 = CKIsRunningInMacCatalyst();
  id v4 = [(CKMediaObject *)self filename];
  id v5 = v4;
  if (v3) {
    double v6 = @"CL.loc.vcf";
  }
  else {
    double v6 = @"Dropped Pin.loc.vcf";
  }
  char v7 = [v4 isEqualToString:v6];

  return v7;
}

- (id)generatePlaceholderThumbnailForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  char v7 = +[CKUIBehavior sharedBehaviors];
  [v7 mapThumbnailFillSizeForWidth:a3];
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = +[CKUIBehavior sharedBehaviors];
  [v12 thumbnailContentAlignmentInsetsForOrientation:v4];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  return -[CKLocationMediaObject generatePlaceholderThumbnailFillToSize:contentAlignmentInsets:](self, "generatePlaceholderThumbnailFillToSize:contentAlignmentInsets:", v9, v11, v14, v16, v18, v20);
}

- (id)generatePlaceholderThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  char v7 = [(CKLocationMediaObject *)self transcriptTraitCollection];
  double v8 = CKLocationSharePreviewPlaceHolderCacheFileURL(v7, (unint64_t)width, @"jpeg");

  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  double v35 = __Block_byref_object_copy__39;
  double v36 = __Block_byref_object_dispose__39;
  id v37 = 0;
  uint64_t v9 = [(CKMediaObject *)self savedPreviewFromURL:v8 forOrientation:0];
  double v10 = (void *)v33[5];
  v33[5] = v9;

  if (v33[5])
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      double v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Found cached thumnail on disk.", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
      _CKLogExternal();
    }
    id v12 = (id)v33[5];
  }
  else
  {
    double v13 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotOptions", @"MapKit");
    if (v13)
    {
      id v14 = objc_alloc_init(v13);
      [v14 setMapType:105];
      double v15 = [(CKLocationMediaObject *)self transcriptTraitCollection];
      [v14 setTraitCollection:v15];

      objc_msgSend(v14, "setSize:", width, height);
      double v16 = [MEMORY[0x1E4F42D90] mainScreen];
      [v16 scale];
      objc_msgSend(v14, "setScale:");

      double v17 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotter", @"MapKit");
      if (v17)
      {
        double v18 = (void *)[[v17 alloc] initWithOptions:v14];
        double v19 = dispatch_group_create();
        dispatch_group_enter(v19);
        double v20 = dispatch_get_global_queue(0, 0);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __87__CKLocationMediaObject_generatePlaceholderThumbnailFillToSize_contentAlignmentInsets___block_invoke;
        v29[3] = &unk_1E5620EB0;
        double v31 = &v32;
        id v21 = v19;
        char v30 = v21;
        [v18 startWithQueue:v20 completionHandler:v29];

        dispatch_time_t v22 = dispatch_time(0, 5000000000);
        if (dispatch_group_wait(v21, v22))
        {
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(2);
            v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v39 = (__CFString *)self;
              _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "%@ thumbnail generation timed out.", buf, 0xCu);
            }
          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
            _CKLogExternal();
          }
        }
        uint64_t v24 = v33[5];
        if (v24)
        {
          [(CKMediaObject *)self savePreview:v24 toURL:v8 forOrientation:0];
          double v25 = (void *)v33[5];
        }
        else
        {
          double v25 = 0;
        }
        id v12 = v25;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          double v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412546;
            uint64_t v39 = @"MKMapSnapshotter";
            __int16 v40 = 2112;
            long long v41 = @"MapKit";
            _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
          }
        }
        id v12 = 0;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          uint64_t v39 = @"MKMapSnapshotOptions";
          __int16 v40 = 2112;
          long long v41 = @"MapKit";
          _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
        }
      }
      id v12 = 0;
    }
  }
  _Block_object_dispose(&v32, 8);

  return v12;
}

void __87__CKLocationMediaObject_generatePlaceholderThumbnailFillToSize_contentAlignmentInsets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && IMOSLoggingEnabled())
  {
    char v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Got error back in CKLocationMediaObject for map snapshot: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = [v5 image];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)pasteboardItemProvider
{
  [(CKLocationMediaObject *)self coordinate];
  double v4 = v3;
  double v6 = v5;
  char v7 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v8 = [(CKMediaObject *)self filename];
  uint64_t v9 = objc_msgSend(v7, "__ck_appleMapsURLForCoordinate:coordinateName:", v8, v4, v6);

  double v10 = (void *)MEMORY[0x1E4F28D78];
  int v11 = [(CKMediaObject *)self fileURL];
  id v12 = objc_msgSend(v10, "__ck_itemProviderForAppleMapsCoordinateURL:vCardURL:", v9, v11);

  if (v12)
  {
    id v13 = v12;
  }
  else if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v16 = 0;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Unexpected ItemProvider in LocationMediaObject", v16, 2u);
    }
  }

  return v12;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  v24[3] = *MEMORY[0x1E4F143B8];
  [(CKLocationMediaObject *)self coordinate];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
  double v10 = [(CKMediaObject *)self filename];
  int v11 = objc_msgSend(v9, "__ck_appleMapsURLForCoordinate:coordinateName:", v10, v6, v8);

  id v12 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v13 = [v11 absoluteString];
  id v14 = (void *)[v12 initWithString:v13];

  uint64_t v15 = [v14 length];
  v23[0] = @"com.apple.messages.mapvcard.name";
  double v16 = [(CKMediaObject *)self filename];
  v24[0] = v16;
  v23[1] = @"com.apple.messages.mapvcard";
  double v17 = [(CKMediaObject *)self fileURL];
  v24[1] = v17;
  v23[2] = @"com.apple.messages.maputi";
  double v18 = [(CKMediaObject *)self UTIType];
  v24[2] = v18;
  double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  objc_msgSend(v14, "addAttribute:value:range:", @"com.apple.messages.mapattribute", v19, 0, v15);
  dispatch_time_t v22 = v14;
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];

  return v20;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (void)coordinate
{
  double v2 = [MEMORY[0x1E4F28B00] currentHandler];
  double v3 = [NSString stringWithUTF8String:"void *TelephonyUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKLocationMediaObject.m", 50, @"%s", *a1);

  __break(1u);
}

@end