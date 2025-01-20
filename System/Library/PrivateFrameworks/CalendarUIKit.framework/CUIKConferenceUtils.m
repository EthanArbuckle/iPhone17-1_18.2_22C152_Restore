@interface CUIKConferenceUtils
+ (id)_imageForApplicationRecord:(id)a3 URL:(id)a4 isBroadcast:(BOOL)a5;
+ (id)_platformImageForISIcon:(id)a3;
+ (id)_prepareImageForDefaultDescriptor:(id)a3;
+ (id)_systemImageNamed:(id)a3;
+ (id)_titleForApplicationRecord:(id)a3 URL:(id)a4;
+ (id)_workQueue;
+ (id)subtitleForURL:(id)a3 displayedWithTitle:(id)a4;
+ (id)subtitleForVirtualConference:(id)a3 displayedWithTitle:(id)a4;
+ (id)synchronousOutlineIconForURL:(id)a3 isBroadcast:(BOOL)a4 outImageName:(id *)a5 incomplete:(BOOL *)a6;
+ (id)synchronousTitleForURL:(id)a3 incomplete:(BOOL *)a4;
+ (unint64_t)_buttonTypeForApplicationRecord:(id)a3 URL:(id)a4 isBroadcast:(BOOL)a5;
+ (void)_displayDetailsForURL:(id)a3 isBroadcast:(BOOL)a4 completionHandler:(id)a5;
+ (void)displayDetailsForJoinMethod:(id)a3 completionHandler:(id)a4;
+ (void)displayDetailsForURL:(id)a3 completionHandler:(id)a4;
+ (void)imageForRoomType:(id)a3 completionHandler:(id)a4;
@end

@implementation CUIKConferenceUtils

+ (id)_workQueue
{
  if (_workQueue_onceToken != -1) {
    dispatch_once(&_workQueue_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)_workQueue_workQueue;

  return v2;
}

void __33__CUIKConferenceUtils__workQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("CUIKConferenceUtils.workQueue", 0);
  v1 = (void *)_workQueue_workQueue;
  _workQueue_workQueue = (uint64_t)v0;
}

+ (id)_prepareImageForDefaultDescriptor:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1BA8];
  id v4 = a3;
  v5 = [v3 mainScreen];
  [v5 scale];
  double v7 = v6;

  id v8 = objc_alloc(MEMORY[0x1E4F6F258]);
  [MEMORY[0x1E4F25510] conferenceImageSize];
  double v10 = v9;
  [MEMORY[0x1E4F25510] conferenceImageSize];
  v12 = objc_msgSend(v8, "initWithSize:scale:", v10, v11, v7);
  [v12 setDrawBorder:1];
  v13 = [v4 prepareImageForDescriptor:v12];

  return v13;
}

+ (id)_imageForApplicationRecord:(id)a3 URL:(id)a4 isBroadcast:(BOOL)a5
{
  id v8 = a4;
  double v9 = [a3 bundleIdentifier];
  if (!v9
    || (double v10 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v9],
        [a1 _platformImageForISIcon:v10],
        double v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    if (a5)
    {
      v12 = @"play.tv.fill";
    }
    else if (objc_msgSend(v8, "cal_hasSchemeTel"))
    {
      v12 = @"phone.fill";
    }
    else if ([MEMORY[0x1E4F576A0] isPreferredURL:v8])
    {
      v12 = @"video.fill";
    }
    else
    {
      v12 = @"link";
    }
    double v11 = [a1 _systemImageNamed:v12];
  }

  return v11;
}

+ (id)synchronousTitleForURL:(id)a3 incomplete:(BOOL *)a4
{
  double v6 = (void *)MEMORY[0x1E4F25510];
  id v7 = a3;
  id v8 = [v6 applicationRecordForURL:v7 incomplete:a4];
  double v9 = [a1 _titleForApplicationRecord:v8 URL:v7];

  return v9;
}

+ (id)synchronousOutlineIconForURL:(id)a3 isBroadcast:(BOOL)a4 outImageName:(id *)a5 incomplete:(BOOL *)a6
{
  id v10 = a3;
  uint64_t v11 = [MEMORY[0x1E4F25510] applicationRecordForURL:v10 incomplete:a6];
  v12 = (void *)v11;
  if (a4)
  {
    v13 = @"play.tv";
  }
  else if (v11 || ([MEMORY[0x1E4F576A0] isPreferredURL:v10] & 1) != 0)
  {
    v13 = @"video";
  }
  else if (objc_msgSend(v10, "cal_hasSchemeTel"))
  {
    v13 = @"phone";
  }
  else
  {
    v13 = @"link";
  }
  v14 = [a1 _systemImageNamed:v13];
  if (a5) {
    *a5 = v13;
  }

  return v14;
}

+ (id)_systemImageNamed:(id)a3
{
  v3 = [MEMORY[0x1E4FB1818] systemImageNamed:a3];
  id v4 = [v3 imageWithRenderingMode:2];

  return v4;
}

+ (id)_platformImageForISIcon:(id)a3
{
  v3 = [a1 _prepareImageForDefaultDescriptor:a3];
  id v4 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v5 = [v3 CGImage];
  [v3 scale];
  double v6 = objc_msgSend(v4, "imageWithCGImage:scale:orientation:", v5, 0);

  return v6;
}

+ (id)_titleForApplicationRecord:(id)a3 URL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_5;
  }
  id v7 = [v5 bundleIdentifier];
  id v8 = [v5 localizedName];
  if ([v7 isEqualToString:@"com.microsoft.lync2013.iphone"])
  {
    double v9 = CUIKBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"Skype" value:&stru_1F187C430 table:0];

    id v8 = (void *)v10;
  }

  if (!v8)
  {
LABEL_5:
    id v8 = objc_msgSend(v6, "cal_ShortDisplayStringForURL");
  }

  return v8;
}

+ (unint64_t)_buttonTypeForApplicationRecord:(id)a3 URL:(id)a4 isBroadcast:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5)
  {
    unint64_t v9 = 2;
  }
  else if (v7 || ([MEMORY[0x1E4F576A0] isPreferredURL:v8] & 1) != 0)
  {
    unint64_t v9 = 0;
  }
  else if (objc_msgSend(v8, "cal_hasSchemeTel"))
  {
    unint64_t v9 = 3;
  }
  else
  {
    unint64_t v9 = 1;
  }

  return v9;
}

+ (void)_displayDetailsForURL:(id)a3 isBroadcast:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1E4F25510];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__CUIKConferenceUtils__displayDetailsForURL_isBroadcast_completionHandler___block_invoke;
  v13[3] = &unk_1E636A798;
  id v15 = v9;
  id v16 = a1;
  BOOL v17 = a4;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  [v10 applicationRecordForURL:v12 completionHandler:v13];
}

void __75__CUIKConferenceUtils__displayDetailsForURL_isBroadcast_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  id v6 = a2;
  id v8 = [v3 _imageForApplicationRecord:v6 URL:v4 isBroadcast:v5];
  id v7 = [*(id *)(a1 + 48) _titleForApplicationRecord:v6 URL:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) _buttonTypeForApplicationRecord:v6 URL:*(void *)(a1 + 32) isBroadcast:*(unsigned __int8 *)(a1 + 56)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)displayDetailsForJoinMethod:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 URL];
  uint64_t v8 = [v7 isBroadcast];

  [a1 _displayDetailsForURL:v9 isBroadcast:v8 completionHandler:v6];
}

+ (void)displayDetailsForURL:(id)a3 completionHandler:(id)a4
{
}

+ (void)imageForRoomType:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CUIKConferenceUtils_imageForRoomType_completionHandler___block_invoke;
  block[3] = &unk_1E636A7C0;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __58__CUIKConferenceUtils_imageForRoomType_completionHandler___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) extensionBundleIdentifier];
  v2 = [MEMORY[0x1E4F25510] FacetimeConferenceExtensionBundleID];
  uint64_t v3 = [v9 caseInsensitiveCompare:v2];

  if (v3)
  {
    id v4 = v9;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F25510] FacetimeAppBundleID];
  }
  uint64_t v5 = v4;
  if (!v4
    || (id v6 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v4],
        [*(id *)(a1 + 48) _platformImageForISIcon:v6],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    uint64_t v8 = [MEMORY[0x1E4F6F248] genericApplicationIcon];
    id v7 = [*(id *)(a1 + 48) _platformImageForISIcon:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)subtitleForVirtualConference:(id)a3 displayedWithTitle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 joinMethods];
  uint64_t v8 = [v7 firstObject];

  id v9 = (void *)MEMORY[0x1E4FADB70];
  id v10 = [v8 URL];
  id v11 = [v9 conversationLinkForURL:v10];

  id v12 = [v11 linkName];
  id v13 = [v6 title];

  id v14 = [v8 title];
  if ([v12 length] && (int v15 = objc_msgSend(v5, "isEqualToString:", v12), v16 = v12, !v15)
    || [v13 length] && (v17 = objc_msgSend(v5, "isEqualToString:", v13), id v16 = v13, !v17)
    || [v14 length] && (v18 = objc_msgSend(v5, "isEqualToString:", v14), id v16 = v14, (v18 & 1) == 0))
  {
    id v19 = v16;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)subtitleForURL:(id)a3 displayedWithTitle:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4FADB70] conversationLinkForURL:a3];
  id v7 = [v6 linkName];
  if ([v7 length] && (objc_msgSend(v5, "isEqualToString:", v7) & 1) == 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

@end