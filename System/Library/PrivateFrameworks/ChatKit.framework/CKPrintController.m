@interface CKPrintController
+ (id)printAttributes:(id)a3;
+ (id)printBackgroundColor;
+ (id)printBalloonTextColor;
+ (id)printTranscriptTextColor;
+ (id)sharedInstance;
+ (void)printBalloonDescriptor:(CKBalloonDescriptor_t *)a3;
+ (void)printResolvedColors:(id *)a3 balloonDescriptor:(CKBalloonDescriptor_t *)a4 coloredBalloonView:(id)a5;
- (BOOL)isPrinting;
- (CKPrintController)init;
- (CNAvatarImageRenderer)avatarImageRenderer;
- (NSCache)avatarCache;
- (id)avatarImageForContact:(id)a3 diameter:(double)a4;
- (void)clearAvatarCache;
- (void)setAvatarCache:(id)a3;
- (void)setAvatarImageRenderer:(id)a3;
- (void)setPrinting:(BOOL)a3;
@end

@implementation CKPrintController

- (BOOL)isPrinting
{
  return self->_isPrinting;
}

+ (id)sharedInstance
{
  if (sharedInstance_creation_0 != -1) {
    dispatch_once(&sharedInstance_creation_0, &__block_literal_global_137);
  }
  v2 = (void *)sharedInstance_sInstance_2;

  return v2;
}

void __35__CKPrintController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKPrintController);
  v1 = (void *)sharedInstance_sInstance_2;
  sharedInstance_sInstance_2 = (uint64_t)v0;
}

- (CKPrintController)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKPrintController;
  result = [(CKPrintController *)&v3 init];
  if (result) {
    result->_isPrinting = 0;
  }
  return result;
}

- (void)setPrinting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = @"YES";
      if (self->_isPrinting) {
        v7 = @"YES";
      }
      else {
        v7 = @"NO";
      }
      if (!v3) {
        v6 = @"NO";
      }
      int v8 = 138412546;
      v9 = v7;
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "set isPrinting from [%@] to [%@]", (uint8_t *)&v8, 0x16u);
    }
  }
  self->_isPrinting = v3;
}

- (id)avatarImageForContact:(id)a3 diameter:(double)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 identifier];
  int v8 = [(CKPrintController *)self avatarCache];
  v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1BB30];
    v13 = [MEMORY[0x1E4F42D90] mainScreen];
    [v13 scale];
    v15 = objc_msgSend(v12, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, a4, a4, v14);

    if (v6)
    {
      id v21 = v6;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    }
    else
    {
      v16 = 0;
    }
    v17 = [(CKPrintController *)self avatarImageRenderer];
    id v11 = [v17 avatarImageForContacts:v16 scope:v15];

    if (v11)
    {
      v18 = [(CKPrintController *)self avatarCache];
      [v18 setObject:v11 forKey:v7 cost:1];

      if (IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v7;
          _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "avatar cache store for contact [%@]", buf, 0xCu);
        }
LABEL_18:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "avatar fetch fail for contact [%@]", buf, 0xCu);
      }
      goto LABEL_18;
    }

    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "avatar cache hit for contact [%@]", buf, 0xCu);
    }
  }
  id v11 = v9;
LABEL_20:

  return v11;
}

- (CNAvatarImageRenderer)avatarImageRenderer
{
  avatarImageRenderer = self->_avatarImageRenderer;
  if (!avatarImageRenderer)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1BB20]);
    v5 = [MEMORY[0x1E4F1BB28] defaultSettings];
    id v6 = (CNAvatarImageRenderer *)[v4 initWithSettings:v5];
    v7 = self->_avatarImageRenderer;
    self->_avatarImageRenderer = v6;

    avatarImageRenderer = self->_avatarImageRenderer;
  }

  return avatarImageRenderer;
}

- (NSCache)avatarCache
{
  avatarCache = self->_avatarCache;
  if (!avatarCache)
  {
    id v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    v5 = self->_avatarCache;
    self->_avatarCache = v4;

    [(NSCache *)self->_avatarCache setTotalCostLimit:50];
    avatarCache = self->_avatarCache;
  }

  return avatarCache;
}

- (void)clearAvatarCache
{
  avatarCache = self->_avatarCache;
  self->_avatarCache = 0;
}

+ (id)printBackgroundColor
{
  return (id)[MEMORY[0x1E4F428B8] clearColor];
}

+ (id)printTranscriptTextColor
{
  return (id)[MEMORY[0x1E4F428B8] grayColor];
}

+ (id)printBalloonTextColor
{
  return (id)[MEMORY[0x1E4F428B8] blackColor];
}

+ (id)printAttributes:(id)a3
{
  BOOL v3 = (void *)[a3 mutableCopy];
  uint64_t v4 = *MEMORY[0x1E4FB0700];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];

  if (v5)
  {
    id v6 = +[CKPrintController printTranscriptTextColor];
    [v3 setObject:v6 forKeyedSubscript:v4];
  }

  return v3;
}

+ (void)printBalloonDescriptor:(CKBalloonDescriptor_t *)a3
{
  a3->var2 = 2;
  a3->var5 = 4;
  uint64_t v4 = +[CKUIBehavior sharedBehaviors];
  v5 = [v4 theme];
  id v6 = [v5 unfilledBalloonColorForColorType:0xFFFFFFFFLL];
  [v6 ckColor];
  a3->var6.red = v7;
  a3->var6.green = v8;
  a3->var6.blue = v9;
  a3->var6.alpha = v10;

  a3->var7 = 1;
  a3->var0 = 0;
}

+ (void)printResolvedColors:(id *)a3 balloonDescriptor:(CKBalloonDescriptor_t *)a4 coloredBalloonView:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = +[CKPrintController printBackgroundColor];
  v13[0] = v9;
  *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  [a1 printBalloonDescriptor:a4];
  [v8 setBalloonStyle:2];
  double v10 = +[CKUIBehavior sharedBehaviors];
  id v11 = [v10 theme];
  uint64_t v12 = [v11 unfilledBalloonColorForColorType:0xFFFFFFFFLL];
  [v12 ckColor];
  objc_msgSend(v8, "setStrokeColor:");

  [v8 setColor:4];
  [v8 setUserInterfaceStyle:1];
}

- (void)setAvatarImageRenderer:(id)a3
{
}

- (void)setAvatarCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarCache, 0);

  objc_storeStrong((id *)&self->_avatarImageRenderer, 0);
}

@end