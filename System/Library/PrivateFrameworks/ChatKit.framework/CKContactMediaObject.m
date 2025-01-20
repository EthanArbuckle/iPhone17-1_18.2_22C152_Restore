@interface CKContactMediaObject
+ (BOOL)isPreviewable;
+ (BOOL)shouldUseTranscoderGeneratedPreviewSize;
+ (id)UTITypes;
+ (id)fallbackFilenamePrefix;
- (BOOL)generatePreviewOutOfProcess;
- (BOOL)supportsBlastDoor;
- (BOOL)vCardParsingFailed;
- (CGSize)bbSize;
- (CNContactVCardSummary)vCardSummary;
- (Class)balloonViewClass;
- (Class)placeholderBalloonViewClass;
- (Class)previewBalloonViewClass;
- (NSDictionary)contactMediaInfo;
- (UIImage)vCardImage;
- (id)_transcodeControllerSharedInstance;
- (id)attachmentSummary:(unint64_t)a3;
- (id)contactCardPayloadFileURL:(id)a3;
- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4;
- (id)icon;
- (id)metricsCollectorMediaType;
- (id)previewDispatchCache;
- (id)previewItemTitle;
- (id)previewItemURL;
- (id)subtitle;
- (id)title;
- (id)vCardImageOfSize:(CGSize)a3;
- (int)mediaType;
- (unint64_t)oopPreviewRequestBudget;
- (unint64_t)oopPreviewRequestCount;
- (void)generateOOPPreview;
- (void)setContactMediaInfo:(id)a3;
- (void)setOopPreviewRequestCount:(unint64_t)a3;
- (void)setVCardImage:(id)a3;
- (void)setVCardParsingFailed:(BOOL)a3;
- (void)setVCardSummary:(id)a3;
@end

@implementation CKContactMediaObject

+ (BOOL)isPreviewable
{
  return 1;
}

+ (id)UTITypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F22718];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E4F6D970];
}

+ (id)fallbackFilenamePrefix
{
  return @"CARD";
}

+ (BOOL)shouldUseTranscoderGeneratedPreviewSize
{
  return 0;
}

- (id)attachmentSummary:(unint64_t)a3
{
  v4 = NSString;
  v5 = IMSharedUtilitiesFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"%lu Contacts" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (BOOL)generatePreviewOutOfProcess
{
  v5.receiver = self;
  v5.super_class = (Class)CKContactMediaObject;
  BOOL v3 = [(CKMediaObject *)&v5 generatePreviewOutOfProcess];
  if (v3) {
    LOBYTE(v3) = [(CKContactMediaObject *)self supportsBlastDoor];
  }
  return v3;
}

- (int)mediaType
{
  return 4;
}

- (Class)balloonViewClass
{
  v2 = +[CKUIBehavior sharedBehaviors];
  BOOL v3 = [v2 contactBalloonViewClass];

  return (Class)v3;
}

- (Class)previewBalloonViewClass
{
  v2 = +[CKUIBehavior sharedBehaviors];
  BOOL v3 = [v2 contactBalloonViewClass];

  return (Class)v3;
}

- (Class)placeholderBalloonViewClass
{
  if ([(CKMediaObject *)self isFromMe])
  {
    v2 = +[CKUIBehavior sharedBehaviors];
    BOOL v3 = [v2 contactBalloonViewClass];
  }
  else
  {
    BOOL v3 = objc_opt_class();
  }

  return (Class)v3;
}

- (BOOL)supportsBlastDoor
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Blastdoor is support for vcards", v4, 2u);
    }
  }
  return 1;
}

- (id)title
{
  if (![(CKContactMediaObject *)self generatePreviewOutOfProcess])
  {
    v10 = [(CKContactMediaObject *)self vCardSummary];
    BOOL v3 = v10;
    if (v10 && [v10 contactCount])
    {
      v11 = [v3 avatarContacts];
      v7 = [v11 firstObject];

      v12 = +[CKUIBehavior sharedBehaviors];
      int v13 = [v12 useSingleLineForContactVCardNames];

      if (v13)
      {
        uint64_t v14 = [MEMORY[0x1E4F1B910] stringFromContact:v7 style:0];
      }
      else
      {
        if ([MEMORY[0x1E4F1B910] nameOrderForContact:v7] == 1) {
          [v7 givenName];
        }
        else {
        uint64_t v14 = [v7 familyName];
        }
      }
      v9 = (void *)v14;
      if ([v7 contactType] == 1)
      {
        uint64_t v15 = [v7 organizationName];

        v9 = (void *)v15;
      }
      goto LABEL_19;
    }
LABEL_12:
    v7 = 0;
    goto LABEL_20;
  }
  BOOL v3 = [(CKContactMediaObject *)self contactMediaInfo];
  if (!v3) {
    goto LABEL_12;
  }
  v4 = +[CKUIBehavior sharedBehaviors];
  int v5 = [v4 useSingleLineForContactVCardNames];

  if (v5) {
    v6 = @"contactFormatterTitle";
  }
  else {
    v6 = @"contactNameTitle";
  }
  v7 = [v3 objectForKeyedSubscript:v6];
  v8 = [v3 objectForKeyedSubscript:@"organizationNameTitle"];

  if (v8)
  {
    v9 = [v3 objectForKeyedSubscript:@"organizationNameTitle"];
LABEL_19:

    v7 = v9;
  }
LABEL_20:

  if (!v7)
  {
    v17.receiver = self;
    v17.super_class = (Class)CKContactMediaObject;
    v7 = [(CKMediaObject *)&v17 title];
  }

  return v7;
}

- (id)icon
{
  if ([(CKMediaObject *)self shouldSuppressPreview]
    || (+[CKUIBehavior sharedBehaviors],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 contactImageSize],
        -[CKContactMediaObject vCardImageOfSize:](self, "vCardImageOfSize:"),
        v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v6.receiver = self;
    v6.super_class = (Class)CKContactMediaObject;
    v4 = [(CKMediaObject *)&v6 icon];
  }

  return v4;
}

- (id)subtitle
{
  if ([(CKContactMediaObject *)self generatePreviewOutOfProcess])
  {
    BOOL v3 = [(CKContactMediaObject *)self contactMediaInfo];
    if (v3)
    {
      v4 = +[CKUIBehavior sharedBehaviors];
      int v5 = [v4 useSingleLineForContactVCardNames];

      if (v5) {
        objc_super v6 = @"organizationNameSubtitle";
      }
      else {
        objc_super v6 = @"contactNameSubtitle";
      }
      v7 = [v3 objectForKeyedSubscript:v6];
      goto LABEL_17;
    }
LABEL_11:
    v7 = 0;
    goto LABEL_17;
  }
  v8 = [(CKContactMediaObject *)self vCardSummary];
  BOOL v3 = v8;
  if (!v8 || ![v8 contactCount]) {
    goto LABEL_11;
  }
  v9 = [v3 avatarContacts];
  v10 = [v9 firstObject];

  v11 = +[CKUIBehavior sharedBehaviors];
  int v12 = [v11 useSingleLineForContactVCardNames];

  if (v12)
  {
    uint64_t v13 = [v10 organizationName];
  }
  else
  {
    if ([MEMORY[0x1E4F1B910] nameOrderForContact:v10] == 1) {
      [v10 familyName];
    }
    else {
    uint64_t v13 = [v10 givenName];
    }
  }
  v7 = (void *)v13;

LABEL_17:
  if (v7)
  {
    uint64_t v14 = [(CKContactMediaObject *)self title];
    int v15 = [v14 isEqualToString:v7];

    if (v15)
    {

      v7 = 0;
    }
  }

  return v7;
}

- (CGSize)bbSize
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 contactImageSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  if ([(CKContactMediaObject *)self mediaType] == 4)
  {
    double v7 = +[CKUIBehavior sharedBehaviors];
    [v7 contactImageSize];
    double v9 = v8;

    double v10 = fmin(v9, a3);
    v11 = -[CKContactMediaObject vCardImageOfSize:](self, "vCardImageOfSize:", v10, v10);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CKContactMediaObject;
    v11 = [(CKMediaObject *)&v13 generateThumbnailForWidth:v4 orientation:a3];
  }

  return v11;
}

- (id)previewItemURL
{
  if (CKIsRunningInMacCatalyst())
  {
    double v3 = [(CKMediaObject *)self fileURL];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (id)previewItemTitle
{
  v2 = CKFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"PREVIEW_TITLE_CONTACT" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

- (id)contactCardPayloadFileURL:(id)a3
{
  id v4 = a3;
  double v5 = [(CKMediaObject *)self fileURL];
  double v6 = IMPreviewCachesDirectoryWithAttachmentURL();

  double v7 = [(CKMediaObject *)self fileURL];
  double v8 = [v7 lastPathComponent];

  double v9 = [v6 URLByAppendingPathComponent:v8 isDirectory:0];
  double v10 = [v9 URLByAppendingPathExtension:v4];

  return v10;
}

- (id)previewDispatchCache
{
  return +[CKPreviewDispatchCache transcriptPreviewCache];
}

- (id)_transcodeControllerSharedInstance
{
  return (id)[MEMORY[0x1E4F6EBE0] sharedInstance];
}

- (unint64_t)oopPreviewRequestBudget
{
  return 2;
}

- (void)generateOOPPreview
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v3 = [(CKContactMediaObject *)self previewCacheKey];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Request to generate OOP preview with key %@", buf, 0xCu);
    }
  }
  double v5 = [(CKContactMediaObject *)self previewDispatchCache];
  if ([v5 isGeneratingPreviewForKey:v3])
  {
    if (IMOSLoggingEnabled())
    {
      double v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v3;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Already generating OOP preview for key %@", buf, 0xCu);
      }
    }
    goto LABEL_19;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v7 startTimingForKey:@"OOPPreviewGeneration"];
  uint64_t v29 = 0;
  *(_OWORD *)buf = 0u;
  long long v28 = 0u;
  IMClientPreviewConstraints();
  double v8 = [(CKMediaObject *)self fileURL];
  double v9 = [(CKMediaObject *)self previewFilenameExtension];
  double v10 = IMAttachmentPreviewFileURL();

  v11 = [(CKMediaObject *)self transferGUID];
  if (!v10)
  {
LABEL_13:

    goto LABEL_19;
  }
  [(CKContactMediaObject *)self setOopPreviewRequestCount:[(CKContactMediaObject *)self oopPreviewRequestCount] + 1];
  unint64_t v12 = [(CKContactMediaObject *)self oopPreviewRequestCount];
  if (v12 < [(CKContactMediaObject *)self oopPreviewRequestBudget])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __42__CKContactMediaObject_generateOOPPreview__block_invoke;
    v16[3] = &unk_1E5624F18;
    v16[4] = self;
    id v17 = v10;
    long long v20 = *(_OWORD *)buf;
    long long v21 = v28;
    uint64_t v22 = v29;
    id v18 = v11;
    id v19 = v7;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42__CKContactMediaObject_generateOOPPreview__block_invoke_128;
    v15[3] = &unk_1E5620C40;
    v15[4] = self;
    [v5 enqueueGenerationBlock:v16 completion:v15 withPriority:0 forKey:v3];

    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    objc_super v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [(CKMediaObject *)self transferGUID];
      *(_DWORD *)v23 = 136315394;
      v24 = "-[CKContactMediaObject generateOOPPreview]";
      __int16 v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "%s request budget exhausted for %@", v23, 0x16u);
    }
  }

LABEL_19:
}

uint64_t __42__CKContactMediaObject_generateOOPPreview__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) senderContext];
  double v5 = [*(id *)(a1 + 32) _transcodeControllerSharedInstance];
  double v6 = [*(id *)(a1 + 32) fileURL];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 64);
  long long v15 = v9;
  uint64_t v16 = *(void *)(a1 + 96);
  LOBYTE(v13) = 1;
  [v5 generatePreview:v6 previewURL:v7 senderContext:v4 constraints:buf balloonBundleID:0 transferGUID:v8 completionBlock:&__block_literal_global_63 blockUntilReply:v13];

  [*(id *)(a1 + 56) stopTimingForKey:@"OOPPreviewGeneration"];
  if (IMOSLoggingEnabled())
  {
    double v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Preview generation timing %@", buf, 0xCu);
    }
  }
  return 0;
}

void __42__CKContactMediaObject_generateOOPPreview__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double v6 = @"NO";
      if (a2) {
        double v6 = @"YES";
      }
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "IMTranscoderAgent preview generation completed with success %@ and error %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void __42__CKContactMediaObject_generateOOPPreview__block_invoke_128(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CKContactMediaObject_generateOOPPreview__block_invoke_2_129;
  block[3] = &unk_1E5620C40;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __42__CKContactMediaObject_generateOOPPreview__block_invoke_2_129(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Posting preview change notif for OOP generation completion", v4, 2u);
    }
  }
  return [*(id *)(a1 + 32) postPreviewDidChangeNotifications];
}

- (NSDictionary)contactMediaInfo
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  contactMediaInfo = self->_contactMediaInfo;
  if (!contactMediaInfo)
  {
    id v4 = [(CKContactMediaObject *)self contactCardPayloadFileURL:@"plist"];
    id v15 = 0;
    double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4 error:&v15];
    id v6 = v15;
    int v7 = self->_contactMediaInfo;
    self->_contactMediaInfo = v5;

    uint64_t v8 = self->_contactMediaInfo;
    if (v8) {
      BOOL v9 = v6 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        unint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = [v4 path];
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v13;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Successfully loaded contactMediaInfo at: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      self->_contactMediaInfo = 0;

      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = [v4 path];
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v11;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Failed to load contactMediaInfo at: %@", buf, 0xCu);
        }
      }
      [(CKContactMediaObject *)self generateOOPPreview];
    }

    contactMediaInfo = self->_contactMediaInfo;
  }

  return contactMediaInfo;
}

- (CNContactVCardSummary)vCardSummary
{
  p_vCardSummary = &self->_vCardSummary;
  vCardSummary = self->_vCardSummary;
  if (!vCardSummary)
  {
    if (self->_vCardParsingFailed)
    {
      vCardSummary = 0;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v18 = &v17;
      uint64_t v19 = 0x3032000000;
      long long v20 = __Block_byref_object_copy__22;
      long long v21 = __Block_byref_object_dispose__22;
      id v22 = 0;
      double v5 = [(CKMediaObject *)self data];
      if (v5)
      {
        id v6 = dispatch_group_create();
        dispatch_group_enter(v6);
        int v7 = +[CKPreviewDispatchCache mapThumbnailQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __36__CKContactMediaObject_vCardSummary__block_invoke;
        block[3] = &unk_1E5620A80;
        uint64_t v16 = &v17;
        id v14 = v5;
        uint64_t v8 = v6;
        id v15 = v8;
        dispatch_async(v7, block);

        dispatch_time_t v9 = dispatch_time(0, 2000000000);
        intptr_t v10 = dispatch_group_wait(v8, v9);
        uint64_t v11 = (void *)v18[5];
        if (!v10 || v11) {
          objc_storeStrong((id *)p_vCardSummary, v11);
        }
        else {
          self->_vCardParsingFailed = 1;
        }
      }
      _Block_object_dispose(&v17, 8);

      vCardSummary = *p_vCardSummary;
    }
  }

  return vCardSummary;
}

void __36__CKContactMediaObject_vCardSummary__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v9 = 0;
  uint64_t v3 = [MEMORY[0x1E4F1B998] summaryOfVCard:v2 error:&v9];
  id v4 = v9;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (v4)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)vCardImageOfSize:(CGSize)a3
{
  double width = a3.width;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(CKContactMediaObject *)self generatePreviewOutOfProcess];
  vCardImage = self->_vCardImage;
  if (v5)
  {
    if (vCardImage) {
      goto LABEL_19;
    }
    uint64_t v7 = [(CKContactMediaObject *)self contactCardPayloadFileURL:@"ktx"];
    uint64_t v8 = [v7 path];

    id v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v8];
    intptr_t v10 = [MEMORY[0x1E4F42A80] imageWithData:v9 scale:width / 10.0];
    uint64_t v11 = self->_vCardImage;
    self->_vCardImage = v10;

    unint64_t v12 = self->_vCardImage;
    int v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v28 = 138412290;
          uint64_t v29 = v8;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Successfully loaded avatar image at: %@", (uint8_t *)&v28, 0xCu);
        }
      }
    }
    else
    {
      if (v13)
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          int v28 = 138412290;
          uint64_t v29 = v8;
          _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Failed to load preview avatar image at: %@", (uint8_t *)&v28, 0xCu);
        }
      }
      [(CKContactMediaObject *)self generateOOPPreview];
    }
  }
  else if (!vCardImage)
  {
    id v15 = [(CKContactMediaObject *)self vCardSummary];
    if (v15)
    {
      uint64_t v16 = [(CKContactMediaObject *)self vCardSummary];
      uint64_t v17 = [v16 contactCount];

      if (v17)
      {
        uint64_t v18 = [(CKContactMediaObject *)self vCardSummary];
        uint64_t v19 = [v18 avatarContacts];
        long long v20 = [v19 firstObject];

        long long v21 = +[CKAddressBook monogrammerWithDiameter:1 style:0 useAppTintColor:0 customFont:width];
        id v22 = [v20 givenName];
        v23 = [v20 familyName];
        v24 = [v21 monogramForPersonWithFirstName:v22 lastName:v23];
        __int16 v25 = self->_vCardImage;
        self->_vCardImage = v24;
      }
    }
  }
  vCardImage = self->_vCardImage;
LABEL_19:

  return vCardImage;
}

- (void)setContactMediaInfo:(id)a3
{
}

- (void)setVCardSummary:(id)a3
{
}

- (unint64_t)oopPreviewRequestCount
{
  return self->_oopPreviewRequestCount;
}

- (void)setOopPreviewRequestCount:(unint64_t)a3
{
  self->_oopPreviewRequestCount = a3;
}

- (BOOL)vCardParsingFailed
{
  return self->_vCardParsingFailed;
}

- (void)setVCardParsingFailed:(BOOL)a3
{
  self->_vCardParsingFailed = a3;
}

- (UIImage)vCardImage
{
  return self->_vCardImage;
}

- (void)setVCardImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vCardImage, 0);
  objc_storeStrong((id *)&self->_vCardSummary, 0);

  objc_storeStrong((id *)&self->_contactMediaInfo, 0);
}

@end