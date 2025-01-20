@interface AXFullscreenCaptionPreviewViewController
- (AXFullscreenCaptionPreviewViewController)init;
- (BOOL)prefersStatusBarHidden;
- (id)_nextCludImage;
- (int64_t)_nextCloudImageIndex;
- (int64_t)modalPresentationStyle;
- (void)_handlePreviewTapped:(id)a3;
- (void)_transitionToNextCloudImage;
- (void)dealloc;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AXFullscreenCaptionPreviewViewController

- (AXFullscreenCaptionPreviewViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXFullscreenCaptionPreviewViewController;
  result = [(AXFullscreenCaptionPreviewViewController *)&v3 initWithNibName:0 bundle:0];
  if (result) {
    result->_visibleCloudImageIndex = -1;
  }
  return result;
}

- (void)dealloc
{
  [(NSTimer *)self->_cloudTimer invalidate];
  cloudTimer = self->_cloudTimer;
  self->_cloudTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)AXFullscreenCaptionPreviewViewController;
  [(AXFullscreenCaptionPreviewViewController *)&v4 dealloc];
}

- (void)_handlePreviewTapped:(id)a3
{
  [(NSTimer *)self->_cloudTimer invalidate];
  cloudTimer = self->_cloudTimer;
  self->_cloudTimer = 0;

  id v5 = [(AXFullscreenCaptionPreviewViewController *)self presentingViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (int64_t)_nextCloudImageIndex
{
  if (self->_visibleCloudImageIndex == -1) {
    return 0;
  }
  objc_super v3 = +[AXCaptionPreviewView cloudImages];
  unint64_t v4 = (unint64_t)[v3 count];

  if (!v4) {
    return 0;
  }
  else {
    return (self->_visibleCloudImageIndex + 1) % v4;
  }
}

- (id)_nextCludImage
{
  int64_t v3 = [(AXFullscreenCaptionPreviewViewController *)self _nextCloudImageIndex];
  ++self->_visibleCloudImageIndex;
  unint64_t v4 = +[AXCaptionPreviewView cloudImages];
  id v5 = v4;
  if (v3) {
    [v4 objectAtIndex:v3];
  }
  else {
  v6 = [v4 firstObject];
  }

  return v6;
}

- (void)_transitionToNextCloudImage
{
  int64_t v3 = [(AXFullscreenCaptionPreviewViewController *)self _previewView];
  unint64_t v4 = [(AXFullscreenCaptionPreviewViewController *)self _previewView];
  id v5 = [v4 cloudsView1];
  [v5 alpha];
  double v7 = v6;

  v8 = [(AXFullscreenCaptionPreviewViewController *)self _previewView];
  v9 = v8;
  if (v7 == 1.0)
  {
    v10 = [v8 cloudsView2];

    v11 = [(AXFullscreenCaptionPreviewViewController *)self _previewView];
    [v11 cloudsView1];
  }
  else
  {
    v10 = [v8 cloudsView1];

    v11 = [(AXFullscreenCaptionPreviewViewController *)self _previewView];
    [v11 cloudsView2];
  v12 = };

  v13 = [(AXFullscreenCaptionPreviewViewController *)self _nextCludImage];
  [v10 setImage:v13];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __71__AXFullscreenCaptionPreviewViewController__transitionToNextCloudImage__block_invoke;
  v21[3] = &unk_2087C0;
  id v22 = v10;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __71__AXFullscreenCaptionPreviewViewController__transitionToNextCloudImage__block_invoke_2;
  v17[3] = &unk_20A968;
  id v18 = v12;
  id v19 = v3;
  id v20 = v22;
  id v14 = v22;
  id v15 = v3;
  id v16 = v12;
  +[UIView animateWithDuration:v21 animations:v17 completion:2.0];
}

id __71__AXFullscreenCaptionPreviewViewController__transitionToNextCloudImage__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __71__AXFullscreenCaptionPreviewViewController__transitionToNextCloudImage__block_invoke_2(id *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __71__AXFullscreenCaptionPreviewViewController__transitionToNextCloudImage__block_invoke_3;
  v2[3] = &unk_209510;
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  +[UIView performWithoutAnimation:v2];
}

id __71__AXFullscreenCaptionPreviewViewController__transitionToNextCloudImage__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 sendSubviewToBack:v3];
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)loadView
{
  uint64_t v3 = objc_alloc_init(_AXFullscreenCaptionPreviewView);
  [(AXFullscreenCaptionPreviewViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)AXFullscreenCaptionPreviewViewController;
  [(AXFullscreenCaptionPreviewViewController *)&v8 viewDidLoad];
  [(AXFullscreenCaptionPreviewViewController *)self setModalPresentationCapturesStatusBarAppearance:1];
  id v3 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handlePreviewTapped:"];
  id v4 = [(AXFullscreenCaptionPreviewViewController *)self view];
  [v4 addGestureRecognizer:v3];

  id v5 = [(AXFullscreenCaptionPreviewViewController *)self _previewView];
  double v6 = [v5 cloudsView1];
  double v7 = [(AXFullscreenCaptionPreviewViewController *)self _nextCludImage];
  [v6 setImage:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)AXFullscreenCaptionPreviewViewController;
  [(AXFullscreenCaptionPreviewViewController *)&v14 viewDidAppear:a3];
  objc_initWeak(&location, self);
  objc_super v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = __58__AXFullscreenCaptionPreviewViewController_viewDidAppear___block_invoke;
  v11 = &unk_20C010;
  objc_copyWeak(&v12, &location);
  id v4 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:&v8 block:3.5];
  cloudTimer = self->_cloudTimer;
  self->_cloudTimer = v4;

  double v6 = [(AXFullscreenCaptionPreviewViewController *)self view];
  double v7 = [v6 captionSubtitlePreviewView];
  [v7 update];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __58__AXFullscreenCaptionPreviewViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _transitionToNextCloudImage];
}

- (void).cxx_destruct
{
}

@end