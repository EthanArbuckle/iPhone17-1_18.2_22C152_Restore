@interface CKPassbookMediaObject
+ (BOOL)isPreviewable;
+ (id)UTITypes;
+ (id)fallbackFilenamePrefix;
- (BOOL)isSupported;
- (BOOL)shouldBeQuickLooked;
- (BOOL)shouldShowDisclosure;
- (BOOL)shouldShowViewer;
- (Class)previewBalloonViewClass;
- (Class)replyContextBalloonViewClass;
- (PKPass)pass;
- (id)attachmentSummary:(unint64_t)a3;
- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4;
- (id)metricsCollectorMediaType;
- (id)previewForWidth:(double)a3 orientation:(char)a4;
- (id)previewItemTitle;
- (int)mediaType;
- (void)setPass:(id)a3;
@end

@implementation CKPassbookMediaObject

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  v7 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v7, "thumbnailFillSizeForWidth:imageSize:", a3, 3.0, 4.0);
  double v9 = v8;
  double v11 = v10;

  v12 = +[CKUIBehavior sharedBehaviors];
  [v12 thumbnailContentAlignmentInsetsForOrientation:v4];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  return -[CKMediaObject generateThumbnailFillToSize:contentAlignmentInsets:](self, "generateThumbnailFillToSize:contentAlignmentInsets:", v9, v11, v14, v16, v18, v20);
}

- (BOOL)isSupported
{
  v2 = +[CKUIBehavior sharedBehaviors];
  char v3 = [v2 supportsPassbookAttachments];

  return v3;
}

+ (BOOL)isPreviewable
{
  v2 = +[CKUIBehavior sharedBehaviors];
  char v3 = [v2 supportsPassbookAttachments];

  return v3;
}

+ (id)UTITypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.pkpass";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E4F6D9A0];
}

+ (id)fallbackFilenamePrefix
{
  return @"PASS";
}

- (id)attachmentSummary:(unint64_t)a3
{
  uint64_t v4 = NSString;
  v5 = IMSharedUtilitiesFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"%lu Passes" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (int)mediaType
{
  return 7;
}

- (Class)previewBalloonViewClass
{
  if ([(CKPassbookMediaObject *)self isSupported])
  {
    v5.receiver = self;
    v5.super_class = (Class)CKPassbookMediaObject;
    char v3 = [(CKMediaObject *)&v5 previewBalloonViewClass];
  }
  else
  {
    char v3 = [(CKMediaObject *)self placeholderBalloonViewClass];
  }

  return (Class)v3;
}

- (Class)replyContextBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  if ([(CKPassbookMediaObject *)self isSupported])
  {
    v9.receiver = self;
    v9.super_class = (Class)CKPassbookMediaObject;
    v7 = [(CKMediaObject *)&v9 previewForWidth:v4 orientation:a3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldShowViewer
{
  v2 = [(CKMediaObject *)self transfer];
  char v3 = [v2 isFileDataReady];

  return v3;
}

- (BOOL)shouldBeQuickLooked
{
  return 0;
}

- (BOOL)shouldShowDisclosure
{
  return 0;
}

- (id)previewItemTitle
{
  v2 = CKFrameworkBundle();
  char v3 = [v2 localizedStringForKey:@"PREVIEW_TITLE_PASS" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

- (PKPass)pass
{
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    _IMWarn();
    char v3 = 0;
  }
  else
  {
    pass = self->_pass;
    if (!pass)
    {
      if (pass_onceToken != -1) {
        dispatch_once(&pass_onceToken, &__block_literal_global_225);
      }
      id v5 = objc_alloc((Class)sPKPassClass);
      v6 = [(CKMediaObject *)self data];
      v7 = (PKPass *)[v5 initWithData:v6 error:0];
      double v8 = self->_pass;
      self->_pass = v7;

      [(PKPass *)self->_pass loadContentSync];
      pass = self->_pass;
    }
    char v3 = pass;
  }

  return v3;
}

uint64_t __29__CKPassbookMediaObject_pass__block_invoke()
{
  uint64_t result = MEMORY[0x192FBA860](@"PKPass", @"PassKit");
  sPKPassClass = result;
  return result;
}

- (void)setPass:(id)a3
{
}

- (void).cxx_destruct
{
}

@end