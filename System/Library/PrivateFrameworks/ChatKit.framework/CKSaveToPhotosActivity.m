@interface CKSaveToPhotosActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (CKMediaObject)mediaObject;
- (CKSaveToPhotosActivity)initWithMediaObject:(id)a3 presenterViewController:(id)a4;
- (UIViewController)presenterViewController;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation CKSaveToPhotosActivity

- (CKSaveToPhotosActivity)initWithMediaObject:(id)a3 presenterViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKSaveToPhotosActivity;
  v9 = [(UIActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaObject, a3);
    objc_storeWeak((id *)&v10->_presenterViewController, v8);
  }

  return v10;
}

- (id)activityType
{
  return @"CKActivityTypeSaveToPhotos";
}

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityTitle
{
  v2 = [(CKSaveToPhotosActivity *)self mediaObject];
  int v3 = [v2 mediaType];

  if (v3 == 2)
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"PREVIEW_SAVE_VIDEO";
  }
  else
  {
    v4 = CKFrameworkBundle();
    if (v3 == 3)
    {
      v5 = v4;
      v6 = @"PREVIEW_SAVE_PHOTO";
    }
    else
    {
      v5 = v4;
      v6 = @"PREVIEW_SAVE_ITEM";
    }
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v7;
}

- (id)_systemImageName
{
  return @"square.and.arrow.down";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return [a3 count] != 0;
}

- (void)performActivity
{
  v14[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(CKSaveToPhotosActivity *)self mediaObject];
  v4 = [(CKSaveToPhotosActivity *)self presenterViewController];
  if (_IMWillLog())
  {
    v10 = v3;
    v11 = v4;
    _IMAlwaysLog();
  }
  if (v4 && v3)
  {
    v14[0] = v3;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v6 = CKMomentShareURLForMediaObjects(v5);

    v13 = v3;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    uint64_t v8 = *MEMORY[0x1E4F6DB40];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__CKSaveToPhotosActivity_performActivity__block_invoke;
    v12[3] = &unk_1E56211F0;
    v12[4] = self;
    v9 = +[CKUtilities quickSaveConfirmationAlertForMediaObjects:v7 momentShareURL:v6 popoverSource:0 metricsSource:v8 cancelHandler:0 preSaveHandler:0 postSaveHandler:v12];

    if (v9)
    {
      [v4 presentViewController:v9 animated:1 completion:0];
    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }
  else
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    -[UIActivity activityDidFinish:](self, "activityDidFinish:", 0, v10, v11);
  }
}

uint64_t __41__CKSaveToPhotosActivity_performActivity__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) activityDidFinish:a2];
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (UIViewController)presenterViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterViewController);

  return (UIViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenterViewController);

  objc_storeStrong((id *)&self->_mediaObject, 0);
}

@end