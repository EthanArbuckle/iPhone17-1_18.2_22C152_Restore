@interface AVEditBehaviorContext
- (AVAssetImageGenerator)imageGenerator;
- (AVEditBehavior)behavior;
- (AVEditBehaviorContext)initWithAVKitOwner:(id)a3;
- (AVEditBehaviorParameters)parameters;
- (AVEditView)editView;
- (AVObservationController)observationController;
- (AVPlayerController)playerController;
- (AVPlayerViewController)playerViewController;
- (AVZoomingBehavior)zoomingBehavior;
- (BOOL)isEditing;
- (CGAffineTransform)rotationTransform;
- (NSMutableArray)pendingImageRequests;
- (NSMutableDictionary)requestedImageTimeToCMTimeMap;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)doneButton;
- (UIBarButtonItem)flexibleSpaceItem;
- (UIBarButtonItem)pauseButton;
- (UIBarButtonItem)playButton;
- (UIToolbar)toolbar;
- (UIView)containerView;
- (double)editViewDuration:(id)a3;
- (double)editViewThumbnailAspectRatio:(id)a3;
- (id)_makeBarButtonItems;
- (id)playerTimeObserver;
- (id)videoCompostitionRotatingAsset:(id)a3;
- (unint64_t)currentRotation;
- (void)_generateThumbnails;
- (void)cancel:(id)a3;
- (void)contentViewWillTransitionToSize:(CGSize)a3 withCoordinator:(id)a4;
- (void)dealloc;
- (void)didAddBehavior:(id)a3;
- (void)didRemoveBehavior:(id)a3;
- (void)done:(id)a3;
- (void)editView:(id)a3 currentTimeDidChange:(double)a4;
- (void)editView:(id)a3 requestThumbnailImageForTimestamp:(id)a4;
- (void)editView:(id)a3 trimEndTimeDidChange:(double)a4;
- (void)editView:(id)a3 trimStartTimeDidChange:(double)a4;
- (void)editViewDidBeginScrubbing:(id)a3;
- (void)editViewDidEndScrubbing:(id)a3;
- (void)editViewWillBeginRequestingThumbnails:(id)a3;
- (void)endEditing;
- (void)pause:(id)a3;
- (void)play:(id)a3;
- (void)rotateClockwise;
- (void)setBehavior:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCurrentRotation:(unint64_t)a3;
- (void)setDoneButton:(id)a3;
- (void)setEditView:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFlexibleSpaceItem:(id)a3;
- (void)setImageGenerator:(id)a3;
- (void)setObservationController:(id)a3;
- (void)setPauseButton:(id)a3;
- (void)setPlayButton:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setPlayerTimeObserver:(id)a3;
- (void)setRotationTransform:(CGAffineTransform *)a3;
- (void)setToolbar:(id)a3;
- (void)setZoomingBehavior:(id)a3;
- (void)startEditing;
@end

@implementation AVEditBehaviorContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedImageTimeToCMTimeMap, 0);
  objc_storeStrong((id *)&self->_pendingImageRequests, 0);
  objc_storeStrong((id *)&self->_pauseButton, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_flexibleSpaceItem, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong(&self->_playerTimeObserver, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_imageGenerator, 0);
  objc_storeStrong((id *)&self->_editView, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_zoomingBehavior, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_destroyWeak((id *)&self->_behavior);

  objc_destroyWeak((id *)&self->_playerViewController);
}

- (void)setCurrentRotation:(unint64_t)a3
{
  self->_currentRotation = a3;
}

- (unint64_t)currentRotation
{
  return self->_currentRotation;
}

- (NSMutableDictionary)requestedImageTimeToCMTimeMap
{
  return self->_requestedImageTimeToCMTimeMap;
}

- (NSMutableArray)pendingImageRequests
{
  return self->_pendingImageRequests;
}

- (void)setPauseButton:(id)a3
{
}

- (UIBarButtonItem)pauseButton
{
  return self->_pauseButton;
}

- (void)setPlayButton:(id)a3
{
}

- (UIBarButtonItem)playButton
{
  return self->_playButton;
}

- (void)setFlexibleSpaceItem:(id)a3
{
}

- (UIBarButtonItem)flexibleSpaceItem
{
  return self->_flexibleSpaceItem;
}

- (void)setDoneButton:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setToolbar:(id)a3
{
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setPlayerTimeObserver:(id)a3
{
}

- (id)playerTimeObserver
{
  return self->_playerTimeObserver;
}

- (void)setPlayerController:(id)a3
{
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setImageGenerator:(id)a3
{
}

- (AVAssetImageGenerator)imageGenerator
{
  return self->_imageGenerator;
}

- (void)setEditView:(id)a3
{
}

- (AVEditView)editView
{
  return self->_editView;
}

- (void)setObservationController:(id)a3
{
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setZoomingBehavior:(id)a3
{
}

- (AVZoomingBehavior)zoomingBehavior
{
  return self->_zoomingBehavior;
}

- (AVEditBehaviorParameters)parameters
{
  return self->_parameters;
}

- (void)setRotationTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_rotationTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_rotationTransform.c = v4;
  *(_OWORD *)&self->_rotationTransform.a = v3;
}

- (CGAffineTransform)rotationTransform
{
  long long v3 = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].b;
  return self;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setBehavior:(id)a3
{
}

- (AVEditBehavior)behavior
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behavior);

  return (AVEditBehavior *)WeakRetained;
}

- (AVPlayerViewController)playerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewController);

  return (AVPlayerViewController *)WeakRetained;
}

- (id)_makeBarButtonItems
{
  v36[5] = *MEMORY[0x1E4F143B8];
  long long v3 = [(AVEditBehaviorContext *)self flexibleSpaceItem];

  if (!v3)
  {
    long long v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    [(AVEditBehaviorContext *)self setFlexibleSpaceItem:v4];

    v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
    [(AVEditBehaviorContext *)self setCancelButton:v5];

    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:17 target:self action:sel_play_];
    [(AVEditBehaviorContext *)self setPlayButton:v6];

    v7 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    v8 = [(AVEditBehaviorContext *)self playButton];
    [v8 setTintColor:v7];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:18 target:self action:sel_pause_];
    [(AVEditBehaviorContext *)self setPauseButton:v9];

    v10 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    v11 = [(AVEditBehaviorContext *)self pauseButton];
    [v11 setTintColor:v10];

    v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_done_];
    [(AVEditBehaviorContext *)self setDoneButton:v12];

    v13 = [MEMORY[0x1E4FB1618] systemYellowColor];
    v14 = [(AVEditBehaviorContext *)self doneButton];
    [v14 setTintColor:v13];
  }
  v15 = [(AVEditBehaviorContext *)self toolbar];
  uint64_t v16 = [v15 items];
  if (!v16)
  {

    goto LABEL_12;
  }
  v17 = (void *)v16;
  v18 = [(AVEditBehaviorContext *)self editView];
  if (([v18 isScrubbing] & 1) == 0)
  {
    v19 = [(AVEditBehaviorContext *)self editView];
    if ([v19 isTrimming])
    {
LABEL_8:

      goto LABEL_9;
    }
    v20 = [(AVEditBehaviorContext *)self playerController];
    if ([v20 isSeeking])
    {

      goto LABEL_8;
    }
    v33 = [(AVEditBehaviorContext *)self playerController];
    char v34 = [v33 isScrubbing];

    if (v34) {
      goto LABEL_10;
    }
LABEL_12:
    v23 = [(AVEditBehaviorContext *)self playerController];
    uint64_t v24 = [v23 timeControlStatus];

    if (v24)
    {
      v25 = [(AVEditBehaviorContext *)self editView];
      [v25 setPrefersThumbVisible:1];

      v21 = [(AVEditBehaviorContext *)self cancelButton];
      v35[0] = v21;
      v26 = [(AVEditBehaviorContext *)self flexibleSpaceItem];
      v35[1] = v26;
      v27 = [(AVEditBehaviorContext *)self pauseButton];
      v35[2] = v27;
      v28 = [(AVEditBehaviorContext *)self flexibleSpaceItem];
      v35[3] = v28;
      v29 = [(AVEditBehaviorContext *)self doneButton];
      v35[4] = v29;
      v30 = (void *)MEMORY[0x1E4F1C978];
      v31 = v35;
    }
    else
    {
      v21 = [(AVEditBehaviorContext *)self cancelButton];
      v36[0] = v21;
      v26 = [(AVEditBehaviorContext *)self flexibleSpaceItem];
      v36[1] = v26;
      v27 = [(AVEditBehaviorContext *)self playButton];
      v36[2] = v27;
      v28 = [(AVEditBehaviorContext *)self flexibleSpaceItem];
      v36[3] = v28;
      v29 = [(AVEditBehaviorContext *)self doneButton];
      v36[4] = v29;
      v30 = (void *)MEMORY[0x1E4F1C978];
      v31 = v36;
    }
    v22 = [v30 arrayWithObjects:v31 count:5];

    goto LABEL_16;
  }
LABEL_9:

LABEL_10:
  v21 = [(AVEditBehaviorContext *)self toolbar];
  v22 = [v21 items];
LABEL_16:

  return v22;
}

- (void)_generateThumbnails
{
  long long v3 = [(AVEditBehaviorContext *)self imageGenerator];
  long long v4 = [(AVEditBehaviorContext *)self pendingImageRequests];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__AVEditBehaviorContext__generateThumbnails__block_invoke;
  v6[3] = &unk_1E5FC2CB8;
  v6[4] = self;
  [v3 generateCGImagesAsynchronouslyForTimes:v4 completionHandler:v6];

  v5 = [(AVEditBehaviorContext *)self pendingImageRequests];
  [v5 removeAllObjects];
}

void __44__AVEditBehaviorContext__generateThumbnails__block_invoke(uint64_t a1, long long *a2, CGImageRef image, uint64_t a4, uint64_t a5)
{
  if (!a5)
  {
    uint64_t v13 = v5;
    uint64_t v14 = v6;
    CGImageRetain(image);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__AVEditBehaviorContext__generateThumbnails__block_invoke_2;
    block[3] = &unk_1E5FC2C90;
    long long v11 = *a2;
    uint64_t v12 = *((void *)a2 + 2);
    block[4] = *(void *)(a1 + 32);
    block[5] = image;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __44__AVEditBehaviorContext__generateThumbnails__block_invoke_2(uint64_t a1)
{
  long long v7 = *(_OWORD *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 64);
  v2 = [MEMORY[0x1E4F29238] valueWithCMTime:&v7];
  long long v3 = [*(id *)(a1 + 32) requestedImageTimeToCMTimeMap];
  long long v4 = [v3 objectForKeyedSubscript:v2];

  uint64_t v5 = [*(id *)(a1 + 32) editView];
  [v5 setThumbnailImage:*(void *)(a1 + 40) forTimestamp:v4];

  uint64_t v6 = [*(id *)(a1 + 32) requestedImageTimeToCMTimeMap];
  [v6 setObject:0 forKeyedSubscript:v2];

  CGImageRelease(*(CGImageRef *)(a1 + 40));
}

- (void)editViewWillBeginRequestingThumbnails:(id)a3
{
  id v3 = [(AVEditBehaviorContext *)self imageGenerator];
  [v3 cancelAllCGImageGeneration];
}

- (void)editViewDidEndScrubbing:(id)a3
{
  id v4 = a3;
  if ([v4 isTrimming])
  {
    [v4 trimStartTime];
    AVTimeIntervalToCMTime(&v52, v5);
    uint64_t v6 = [(AVEditBehaviorContext *)self playerController];
    long long v7 = [v6 player];
    uint64_t v8 = [v7 currentItem];
    [v8 setReversePlaybackEndTime:&v52];

    [v4 trimEndTime];
    AVTimeIntervalToCMTime(&v51, v9);
    v10 = [(AVEditBehaviorContext *)self playerController];
    long long v11 = [v10 player];
    uint64_t v12 = [v11 currentItem];
    CMTime v50 = v51;
    [v12 setForwardPlaybackEndTime:&v50];

    uint64_t v13 = [(AVEditBehaviorContext *)self playerController];
    uint64_t v14 = [v13 player];
    v15 = [v14 currentItem];
    uint64_t v16 = v15;
    if (v15) {
      [v15 forwardPlaybackEndTime];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    v17 = [(AVEditBehaviorContext *)self playerController];
    v18 = [v17 player];
    v19 = [v18 currentItem];
    v20 = v19;
    if (v19) {
      [v19 currentTime];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    int32_t v21 = CMTimeCompare(&time1, &time2);

    v22 = [(AVEditBehaviorContext *)self playerController];
    v23 = [v22 player];
    uint64_t v24 = [v23 currentItem];
    v25 = v24;
    if (v21 < 0)
    {
      v26 = [(AVEditBehaviorContext *)self playerController];
      v27 = [v26 player];
      v28 = [v27 currentItem];
      v29 = v28;
      if (v28) {
        [v28 forwardPlaybackEndTime];
      }
      else {
        memset(v47, 0, sizeof(v47));
      }
      long long v45 = *MEMORY[0x1E4F1FA48];
      uint64_t v46 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      long long v43 = v45;
      uint64_t v44 = v46;
      v36 = v47;
      goto LABEL_24;
    }
    if (v24) {
      [v24 reversePlaybackEndTime];
    }
    else {
      memset(&v42, 0, sizeof(v42));
    }
    v30 = [(AVEditBehaviorContext *)self playerController];
    v31 = [v30 player];
    v32 = [v31 currentItem];
    v33 = v32;
    if (v32) {
      [v32 currentTime];
    }
    else {
      memset(&v41, 0, sizeof(v41));
    }
    int32_t v34 = CMTimeCompare(&v42, &v41);

    if (v34 >= 1)
    {
      v22 = [(AVEditBehaviorContext *)self playerController];
      v23 = [v22 player];
      v25 = [v23 currentItem];
      v26 = [(AVEditBehaviorContext *)self playerController];
      v27 = [v26 player];
      v35 = [v27 currentItem];
      v29 = v35;
      if (v35) {
        [v35 reversePlaybackEndTime];
      }
      else {
        memset(v40, 0, sizeof(v40));
      }
      long long v45 = *MEMORY[0x1E4F1FA48];
      uint64_t v46 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      long long v43 = v45;
      uint64_t v44 = v46;
      v36 = v40;
LABEL_24:
      [v25 seekToTime:v36 toleranceBefore:&v45 toleranceAfter:&v43 completionHandler:0];
    }
  }
  v37 = [(AVEditBehaviorContext *)self playerViewController];
  v38 = [v37 playerController];
  [v38 endScrubbing:self];

  v39 = [(AVEditBehaviorContext *)self playerController];
  [v39 currentTime];
  objc_msgSend(v4, "setCurrentTime:");
}

- (void)editViewDidBeginScrubbing:(id)a3
{
  id v5 = [(AVEditBehaviorContext *)self playerViewController];
  id v4 = [v5 playerController];
  [v4 beginScrubbing:self];
}

- (void)editView:(id)a3 trimEndTimeDidChange:(double)a4
{
  uint64_t v6 = [(AVEditBehaviorContext *)self playerController];
  long long v7 = [v6 player];
  uint64_t v8 = [v7 currentItem];
  Float64 v9 = v8;
  if (!v8)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_5;
  }
  [v8 forwardPlaybackEndTime];

  if ((v15 & 0x100000000) != 0)
  {
    uint64_t v6 = [(AVEditBehaviorContext *)self playerController];
    long long v7 = [v6 player];
    Float64 v9 = [v7 currentItem];
    long long v12 = *MEMORY[0x1E4F1F9F8];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [v9 setForwardPlaybackEndTime:&v12];
LABEL_5:
  }
  v10 = [(AVEditBehaviorContext *)self playerViewController];
  long long v11 = [v10 playerController];
  [v11 seekToTime:a4];
}

- (void)editView:(id)a3 trimStartTimeDidChange:(double)a4
{
  uint64_t v6 = [(AVEditBehaviorContext *)self playerController];
  long long v7 = [v6 player];
  uint64_t v8 = [v7 currentItem];
  Float64 v9 = v8;
  if (!v8)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_5;
  }
  [v8 reversePlaybackEndTime];

  if ((v15 & 0x100000000) != 0)
  {
    uint64_t v6 = [(AVEditBehaviorContext *)self playerController];
    long long v7 = [v6 player];
    Float64 v9 = [v7 currentItem];
    long long v12 = *MEMORY[0x1E4F1F9F8];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [v9 setReversePlaybackEndTime:&v12];
LABEL_5:
  }
  v10 = [(AVEditBehaviorContext *)self playerViewController];
  long long v11 = [v10 playerController];
  [v11 seekToTime:a4];
}

- (void)editView:(id)a3 currentTimeDidChange:(double)a4
{
  if ([a3 isScrubbing])
  {
    id v7 = [(AVEditBehaviorContext *)self playerViewController];
    uint64_t v6 = [v7 playerController];
    [v6 seekToTime:a4];
  }
}

- (void)editView:(id)a3 requestThumbnailImageForTimestamp:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F29238];
  id v6 = a4;
  [v6 doubleValue];
  CMTimeMakeWithSeconds(&v11, v7, 90000);
  uint64_t v8 = [v5 valueWithCMTime:&v11];
  Float64 v9 = [(AVEditBehaviorContext *)self pendingImageRequests];
  [v9 addObject:v8];

  v10 = [(AVEditBehaviorContext *)self requestedImageTimeToCMTimeMap];
  [v10 setObject:v6 forKeyedSubscript:v8];
}

- (double)editViewThumbnailAspectRatio:(id)a3
{
  id v3 = [(AVEditBehaviorContext *)self playerController];
  id v4 = [v3 player];
  id v5 = [v4 currentItem];
  [v5 presentationSize];
  double v7 = v6;
  double v9 = v8;

  double result = v7 / v9;
  if (v9 <= 0.0) {
    return 1.0;
  }
  return result;
}

- (double)editViewDuration:(id)a3
{
  id v3 = [(AVEditBehaviorContext *)self playerController];
  [v3 contentDuration];
  double v5 = v4;

  return v5;
}

- (void)contentViewWillTransitionToSize:(CGSize)a3 withCoordinator:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__AVEditBehaviorContext_contentViewWillTransitionToSize_withCoordinator___block_invoke;
  v4[3] = &unk_1E5FC2C48;
  v4[4] = self;
  [a4 animateAlongsideTransition:v4 completion:&__block_literal_global_67];
}

void __73__AVEditBehaviorContext_contentViewWillTransitionToSize_withCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) editView];
  [v1 reloadData];
}

- (void)didRemoveBehavior:(id)a3
{
  double v4 = [(AVEditBehaviorContext *)self playerViewController];
  double v5 = [(AVEditBehaviorContext *)self zoomingBehavior];
  [v4 removeBehavior:v5];

  [(AVEditBehaviorContext *)self endEditing];

  [(AVEditBehaviorContext *)self setPlayerController:0];
}

- (void)didAddBehavior:(id)a3
{
  double v4 = [(AVEditBehaviorContext *)self playerViewController];
  double v5 = [(AVEditBehaviorContext *)self zoomingBehavior];
  [v4 addBehavior:v5];

  double v6 = [(AVEditBehaviorContext *)self playerViewController];
  double v7 = [v6 playerController];
  [(AVEditBehaviorContext *)self setPlayerController:v7];

  id v9 = [(AVEditBehaviorContext *)self observationController];
  id v8 = (id)[v9 startObserving:self keyPath:@"playerController.player.currentItem" includeInitialValue:1 observationHandler:&__block_literal_global_64];
}

void __40__AVEditBehaviorContext_didAddBehavior___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v4 = a3;
  id v5 = [v9 playerViewController];

  if (v5 == v4)
  {
    double v6 = [v9 playerController];
    double v7 = [v6 player];
    id v8 = [v7 currentItem];
    objc_msgSend(v8, "avkit_setCurrentEditBehaviorContext:", v9);
  }
}

- (void)done:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v5 = [(AVEditBehaviorContext *)self doneButton];
  double v6 = [v4 popoverPresentationController];
  [v6 setBarButtonItem:v5];

  double v7 = [(AVEditBehaviorContext *)self behavior];
  id v8 = [v7 delegate];
  id v9 = [(AVEditBehaviorContext *)self behavior];
  v10 = [v8 editBehaviorAlertActionsForDoneButtonTap:v9];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(v4, "addAction:", *(void *)(*((void *)&v20 + 1) + 8 * v15++), (void)v20);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  uint64_t v16 = (void *)MEMORY[0x1E4FB1410];
  v17 = AVLocalizedString(@"EDIT_BEHAVIOR_CONTEXT_CANCEL");
  v18 = [v16 actionWithTitle:v17 style:1 handler:0];

  [v18 setEnabled:1];
  [v4 addAction:v18];
  v19 = [(AVEditBehaviorContext *)self playerViewController];
  [v19 presentViewController:v4 animated:0 completion:0];
}

- (void)pause:(id)a3
{
  id v5 = [(AVEditBehaviorContext *)self playerViewController];
  id v4 = [v5 playerController];
  [v4 pause:self];
}

- (void)play:(id)a3
{
  id v5 = [(AVEditBehaviorContext *)self playerViewController];
  id v4 = [v5 playerController];
  [v4 play:self];
}

- (void)cancel:(id)a3
{
  id v4 = [(AVEditBehaviorContext *)self playerViewController];
  id v5 = [v4 player];
  double v6 = [v5 currentItem];
  long long v17 = *MEMORY[0x1E4F1F9F8];
  long long v14 = v17;
  uint64_t v18 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t v7 = v18;
  [v6 setReversePlaybackEndTime:&v17];

  id v8 = [(AVEditBehaviorContext *)self playerViewController];
  id v9 = [v8 player];
  v10 = [v9 currentItem];
  long long v15 = v14;
  uint64_t v16 = v7;
  [v10 setForwardPlaybackEndTime:&v15];

  [(AVEditBehaviorContext *)self endEditing];
  id v11 = [(AVEditBehaviorContext *)self behavior];
  uint64_t v12 = [v11 delegate];
  uint64_t v13 = [(AVEditBehaviorContext *)self behavior];
  [v12 editBehaviorDidCancel:v13];
}

- (id)videoCompostitionRotatingAsset:(id)a3
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(v4, "avkit_tracksWithMediaType:", *MEMORY[0x1E4F15C18]);
  double v6 = [v5 firstObject];

  [v6 naturalSize];
  double v29 = *(double *)&v8;
  double v31 = *(double *)&v7;
  BOOL v11 = ((v8 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v8 >= 0
     || (unint64_t)(v8 - 1) < 0xFFFFFFFFFFFFFLL;
  if ((v7 < 0 || ((v7 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
    && (unint64_t)(v7 - 1) > 0xFFFFFFFFFFFFELL
    || !v11)
  {
    long long v15 = 0;
  }
  else
  {
    __int16 v48 = 0;
    if (v6)
    {
      [v6 preferredTransform];
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v45 = 0u;
    }
    int RotationAngleAndFlipsFromCGAffineTransform = FigGetRotationAngleAndFlipsFromCGAffineTransform();
    int v17 = RotationAngleAndFlipsFromCGAffineTransform
        + 90 * [(AVEditBehaviorContext *)self currentRotation];
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v44.a = *MEMORY[0x1E4F1DAB8];
    long long v27 = *(_OWORD *)&v44.a;
    *(_OWORD *)&v44.c = v28;
    *(_OWORD *)&v44.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v26 = *(_OWORD *)&v44.tx;
    CGAffineTransformMakeTranslation(&t2, v31 * -0.5, v29 * -0.5);
    *(_OWORD *)&t1.a = v27;
    *(_OWORD *)&t1.c = v28;
    *(_OWORD *)&t1.tx = v26;
    CGAffineTransformConcat(&v44, &t1, &t2);
    CGAffineTransformMakeRotation(&v41, (double)v17 / 180.0 * 3.14159265);
    CGAffineTransform v40 = v44;
    CGAffineTransformConcat(&t1, &v40, &v41);
    CGAffineTransform v44 = t1;
    if (HIBYTE(v48))
    {
      CGAffineTransformMakeScale(&v39, 1.0, -1.0);
      CGAffineTransform v40 = v44;
      CGAffineTransformConcat(&t1, &v40, &v39);
      CGAffineTransform v44 = t1;
    }
    if ((_BYTE)v48)
    {
      CGAffineTransformMakeScale(&v38, -1.0, 1.0);
      CGAffineTransform v40 = v44;
      CGAffineTransformConcat(&t1, &v40, &v38);
      CGAffineTransform v44 = t1;
    }
    CGAffineTransformMakeRotation(&v37, (double)v17 / 180.0 * 3.14159265);
    float64x2_t v18 = vrndaq_f64(vabsq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v37.c, v29), *(float64x2_t *)&v37.a, v31)));
    double v19 = v18.f64[1];
    double v32 = v18.f64[0];
    CGAffineTransformMakeTranslation(&v36, 0.5 * v18.f64[0], vmuld_lane_f64(0.5, v18, 1));
    CGAffineTransform v40 = v44;
    CGAffineTransformConcat(&t1, &v40, &v36);
    CGAffineTransform v44 = t1;
    long long v20 = [MEMORY[0x1E4F165C0] videoCompositionLayerInstruction];
    objc_msgSend(v20, "setTrackID:", objc_msgSend(v6, "trackID"));
    CGAffineTransform t1 = v44;
    long long v30 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)&v40.a = *MEMORY[0x1E4F1FA48];
    CGFloat v21 = *(double *)(MEMORY[0x1E4F1FA48] + 16);
    v40.c = v21;
    [v20 setTransform:&t1 atTime:&v40];
    CGAffineTransform v35 = v44;
    [(AVEditBehaviorContext *)self setRotationTransform:&v35];
    long long v22 = [MEMORY[0x1E4F165B8] videoCompositionInstruction];
    if (v4) {
      [v4 duration];
    }
    else {
      memset(&duration, 0, sizeof(duration));
    }
    *(_OWORD *)&t1.a = v30;
    t1.c = v21;
    CMTimeRangeMake(&v34, (CMTime *)&t1, &duration);
    [v22 setTimeRange:&v34];
    v50[0] = v20;
    long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
    [v22 setLayerInstructions:v23];

    long long v15 = [MEMORY[0x1E4F165B0] videoCompositionWithPropertiesOfAsset:v4];
    v49 = v22;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    [v15 setInstructions:v24];

    objc_msgSend(v15, "setRenderSize:", v32, v19);
  }

  return v15;
}

- (void)rotateClockwise
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVEditBehaviorContext *)self playerController];
  id v4 = [v3 player];
  id v5 = [v4 currentItem];
  double v6 = [v5 asset];

  if (v6)
  {
    [(AVEditBehaviorContext *)self setCurrentRotation:([(AVEditBehaviorContext *)self currentRotation] + 1) & 3];
    uint64_t v7 = [(AVEditBehaviorContext *)self playerController];
    uint64_t v8 = [v7 player];
    id v9 = [v8 currentItem];
    v10 = [v9 asset];
    BOOL v11 = [(AVEditBehaviorContext *)self videoCompostitionRotatingAsset:v10];

    if (v11)
    {
      uint64_t v12 = [(AVEditBehaviorContext *)self playerController];
      uint64_t v13 = [v12 player];
      long long v14 = [v13 currentItem];
      [v14 setVideoComposition:v11];
    }
    else
    {
      uint64_t v12 = _AVLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        uint64_t v16 = "-[AVEditBehaviorContext rotateClockwise]";
        _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "%s Did not get a valid video composition.", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- (void)endEditing
{
  [(AVEditBehaviorContext *)self setEditing:0];
  id v3 = [(AVEditBehaviorContext *)self observationController];
  [v3 stopAllObservation];

  id v4 = [(AVEditBehaviorContext *)self containerView];
  [v4 removeFromSuperview];

  [(AVEditBehaviorContext *)self setContainerView:0];
  [(AVEditBehaviorContext *)self setEditView:0];
  id v5 = [(AVEditBehaviorContext *)self playerTimeObserver];

  if (v5)
  {
    double v6 = [(AVEditBehaviorContext *)self playerController];
    uint64_t v7 = [v6 player];
    uint64_t v8 = [(AVEditBehaviorContext *)self playerTimeObserver];
    [v7 removeTimeObserver:v8];

    [(AVEditBehaviorContext *)self setPlayerTimeObserver:0];
  }
}

- (void)startEditing
{
  v23[3] = *MEMORY[0x1E4F143B8];
  if (![(AVEditBehaviorContext *)self isEditing])
  {
    [(AVEditBehaviorContext *)self setEditing:1];
    id v3 = [(AVEditBehaviorContext *)self playerViewController];
    [v3 loadViewIfNeeded];
    id v4 = [v3 contentView];
    [v4 loadPlaybackControlsViewIfNeeded];

    id v5 = [v3 contentView];
    [v5 interruptActiveInteractions];

    objc_initWeak(&location, self);
    double v6 = [(AVEditBehaviorContext *)self playerController];
    uint64_t v7 = [v6 player];
    CMTimeMake(&v20, 1, 30);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __37__AVEditBehaviorContext_startEditing__block_invoke;
    float64x2_t v18 = &unk_1E5FC2C00;
    objc_copyWeak(&v19, &location);
    uint64_t v8 = [v7 addPeriodicTimeObserverForInterval:&v20 queue:0 usingBlock:&v15];
    -[AVEditBehaviorContext setPlayerTimeObserver:](self, "setPlayerTimeObserver:", v8, v15, v16, v17, v18);

    id v9 = [(AVEditBehaviorContext *)self observationController];
    v23[0] = @"playerController.player.currentItem.duration";
    v23[1] = @"playerController.player.currentItem.presentationSize";
    v23[2] = @"playerController.status";
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
    id v11 = (id)[v9 startObserving:self keyPaths:v10 includeInitialValue:1 observationHandler:&__block_literal_global_8832];

    uint64_t v12 = [(AVEditBehaviorContext *)self observationController];
    v22[0] = @"playerController.player.timeControlStatus";
    v22[1] = @"playerController.scrubbing";
    v22[2] = @"playerController.seeking";
    v22[3] = @"editView.trimming";
    v22[4] = @"editView.scrubbing";
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
    id v14 = (id)[v12 startObserving:self keyPaths:v13 includeInitialValue:0 observationHandler:&__block_literal_global_51];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __37__AVEditBehaviorContext_startEditing__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained editView];
  char v4 = [v3 isScrubbing];

  if ((v4 & 1) == 0)
  {
    id v8 = objc_loadWeakRetained(v1);
    id v5 = [v8 editView];
    id v6 = objc_loadWeakRetained(v1);
    uint64_t v7 = [v6 playerController];
    [v7 currentTime];
    objc_msgSend(v5, "setCurrentTime:");
  }
}

void __37__AVEditBehaviorContext_startEditing__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 _makeBarButtonItems];
  id v3 = [v2 toolbar];

  [v3 setItems:v4];
}

void __37__AVEditBehaviorContext_startEditing__block_invoke_2(uint64_t a1, void *a2)
{
  v76[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 playerController];
  id v4 = [v3 player];
  id v5 = [v4 currentItem];
  id v6 = v5;
  if (!v5) {
    goto LABEL_16;
  }
  [(AVEditView *)v5 duration];
  if ((v73 & 0x1D) != 1) {
    goto LABEL_16;
  }
  uint64_t v7 = [v2 playerController];
  if ([v7 status] != 2)
  {

LABEL_16:
    goto LABEL_17;
  }
  id v8 = [v2 playerController];
  id v9 = [v8 player];
  v10 = [v9 currentItem];
  [v10 presentationSize];
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = MEMORY[0x1E4F1DB30];
  double v16 = *MEMORY[0x1E4F1DB30];

  if (v12 != v16 || v14 != *(double *)(v15 + 8))
  {
    uint64_t v17 = [v2 editView];

    if (!v17)
    {
      float64x2_t v18 = [v2 playerViewController];
      id v3 = [v18 view];

      id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v3 addSubview:v4];
      v65 = (void *)MEMORY[0x1E4F28DC8];
      v71 = [v4 leftAnchor];
      v69 = [v3 leftAnchor];
      v67 = [v71 constraintEqualToAnchor:v69];
      v76[0] = v67;
      id v19 = [v4 rightAnchor];
      CMTime v20 = [v3 rightAnchor];
      CGFloat v21 = [v19 constraintEqualToAnchor:v20];
      v76[1] = v21;
      long long v22 = [v4 bottomAnchor];
      long long v23 = [v3 bottomAnchor];
      uint64_t v24 = [v22 constraintEqualToAnchor:v23];
      v76[2] = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:3];
      [v65 activateConstraints:v25];

      id v6 = objc_alloc_init(AVEditView);
      [(AVEditView *)v6 setDataSource:v2];
      [(AVEditView *)v6 setDelegate:v2];
      long long v26 = [v2 playerController];
      [v26 currentTime];
      -[AVEditView setCurrentTime:](v6, "setCurrentTime:");

      long long v27 = [v2 playerViewController];
      long long v28 = [v27 player];
      double v29 = [v28 currentItem];

      long long v30 = [v2 playerController];
      LODWORD(v28) = [v30 hasEnabledVideo];

      v72 = v29;
      if (v28)
      {
        double v31 = (void *)MEMORY[0x1E4F16368];
        double v32 = [v29 asset];
        v33 = [v31 assetImageGeneratorWithAsset:v32];
        [v2 setImageGenerator:v33];

        CMTimeRange v34 = [v2 imageGenerator];
        [v34 setAppliesPreferredTrackTransform:1];

        CGAffineTransform v35 = [v2 imageGenerator];
        CGAffineTransform v36 = [v2 playerViewController];
        CGAffineTransform v37 = [v36 contentView];
        CGAffineTransform v38 = [v37 traitCollection];
        [v38 displayScale];
        double v40 = v39;
        double v41 = 1.0;
        if (v39 >= 1.0)
        {
          v69 = [v2 playerViewController];
          CGFloat v21 = [v69 contentView];
          CMTime v20 = [v21 traitCollection];
          [v20 displayScale];
          double v41 = v42;
        }
        [(AVEditView *)v6 intrinsicContentSize];
        objc_msgSend(v35, "setMaximumSize:", 0.0, v41 * v43);
        if (v40 >= 1.0)
        {
        }
      }
      id v44 = objc_alloc_init(MEMORY[0x1E4FB1DF0]);
      [v2 setToolbar:v44];

      long long v45 = [v2 toolbar];
      [v45 setBarStyle:1];

      long long v46 = [v2 _makeBarButtonItems];
      long long v47 = [v2 toolbar];
      [v47 setItems:v46];

      id v48 = objc_alloc(MEMORY[0x1E4FB1C60]);
      v75[0] = v6;
      v49 = [v2 toolbar];
      v75[1] = v49;
      CMTime v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
      CMTime v51 = (void *)[v48 initWithArrangedSubviews:v50];

      [v51 setAxis:1];
      [v51 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v4 addSubview:v51];
      CMTime v52 = [v4 safeAreaLayoutGuide];
      v61 = (void *)MEMORY[0x1E4F28DC8];
      v70 = [v51 leftAnchor];
      v68 = [v52 leftAnchor];
      v66 = [v70 constraintEqualToAnchor:v68];
      v74[0] = v66;
      v64 = [v51 rightAnchor];
      v62 = [v52 rightAnchor];
      v60 = [v64 constraintEqualToAnchor:v62];
      v74[1] = v60;
      v59 = [v51 bottomAnchor];
      v63 = v52;
      v58 = [v52 bottomAnchor];
      v53 = [v59 constraintEqualToAnchor:v58];
      v74[2] = v53;
      v54 = [v51 topAnchor];
      v55 = [v52 topAnchor];
      v56 = [v54 constraintEqualToAnchor:v55];
      v74[3] = v56;
      v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
      [v61 activateConstraints:v57];

      [v2 setContainerView:v4];
      [v2 setEditView:v6];

      goto LABEL_16;
    }
  }
LABEL_17:
}

- (void)dealloc
{
  [(AVEditBehaviorContext *)self endEditing];
  v3.receiver = self;
  v3.super_class = (Class)AVEditBehaviorContext;
  [(AVEditBehaviorContext *)&v3 dealloc];
}

- (AVEditBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AVEditBehaviorContext;
  id v5 = [(AVEditBehaviorContext *)&v19 init];
  id v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_playerViewController, v4);
    [v4 setRequiresImmediateAssetInspection:1];

    id v8 = [[AVObservationController alloc] initWithOwner:v6];
    observationController = v6->_observationController;
    v6->_observationController = v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    pendingImageRequests = v6->_pendingImageRequests;
    v6->_pendingImageRequests = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    requestedImageTimeToCMTimeMap = v6->_requestedImageTimeToCMTimeMap;
    v6->_requestedImageTimeToCMTimeMap = (NSMutableDictionary *)v12;

    double v14 = objc_alloc_init(AVZoomingBehavior);
    zoomingBehavior = v6->_zoomingBehavior;
    v6->_zoomingBehavior = v14;

    v6->_currentRotation = 0;
    uint64_t v16 = MEMORY[0x1E4F1DAB8];
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v6->_rotationTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v6->_rotationTransform.c = v17;
    *(_OWORD *)&v6->_rotationTransform.tx = *(_OWORD *)(v16 + 32);
  }

  return v6;
}

@end