@interface CKEffectPreviewCollectionViewController
- (BOOL)hideEffects;
- (CKEffectPreviewCollectionViewController)init;
- (CKEffectPreviewCollectionViewControllerDelegate)delegate;
- (CKFullScreenEffect)currentEffect;
- (CKFullScreenEffectManager)fsem;
- (CKMomentCollectionViewCell)currentCell;
- (NSString)resizingSavedIdentifier;
- (NSTimer)animationTimer;
- (UIView)cellWrapper;
- (void)addAnimationTimerForCell:(id)a3;
- (void)dealloc;
- (void)displayEffectWithIdentifier:(id)a3;
- (void)loadView;
- (void)resumeEffect;
- (void)setAnimationTimer:(id)a3;
- (void)setCellWrapper:(id)a3;
- (void)setCurrentCell:(id)a3;
- (void)setCurrentEffect:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFsem:(id)a3;
- (void)setHideEffects:(BOOL)a3;
- (void)setResizingSavedIdentifier:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKEffectPreviewCollectionViewController

- (CKEffectPreviewCollectionViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKEffectPreviewCollectionViewController;
  v2 = [(CKEffectPreviewCollectionViewController *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(CKFullScreenEffectManager);
    [(CKEffectPreviewCollectionViewController *)v2 setFsem:v3];
  }
  return v2;
}

- (void)loadView
{
  v3 = [CKEffectPreviewCollectionView alloc];
  id v5 = objc_alloc_init(MEMORY[0x1E4F42890]);
  v4 = -[CKEffectPreviewCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CKEffectPreviewCollectionViewController *)self setView:v4];
}

- (void)dealloc
{
  v3 = [(CKEffectPreviewCollectionViewController *)self animationTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CKEffectPreviewCollectionViewController;
  [(CKEffectPreviewCollectionViewController *)&v4 dealloc];
}

- (void)displayEffectWithIdentifier:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKEffectPreviewCollectionViewController *)self fsem];
  v6 = [v5 effectForIdentifier:v4];

  v7 = [(CKEffectPreviewCollectionViewController *)self currentEffect];

  if (v7 != v6)
  {
    v8 = [(CKEffectPreviewCollectionViewController *)self currentCell];
    [v8 removeFromSuperview];

    [(CKEffectPreviewCollectionViewController *)self setCurrentCell:0];
    [(CKEffectPreviewCollectionViewController *)self setCurrentEffect:v6];
    if (v6)
    {
      id v56 = v4;
      v9 = [(CKEffectPreviewCollectionViewController *)self animationTimer];
      [v9 invalidate];

      v10 = [CKMomentCollectionViewCell alloc];
      v11 = [(CKEffectPreviewCollectionViewController *)self view];
      [v11 frame];
      v12 = -[CKMomentCollectionViewCell initWithFrame:](v10, "initWithFrame:");

      [(CKEffectPreviewCollectionViewController *)self setCurrentCell:v12];
      v55 = v6;
      [(CKMomentCollectionViewCell *)v12 setEffect:v6];
      [(CKMomentCollectionViewCell *)v12 setupEffectIfNeeded];
      v13 = [(CKEffectPreviewCollectionViewController *)self delegate];
      v59 = [v13 balloonView];

      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      v60 = v12;
      id obj = [(CKMomentCollectionViewCell *)v12 effectViews];
      uint64_t v61 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
      if (v61)
      {
        uint64_t v58 = *(void *)v68;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v68 != v58) {
              objc_enumerationMutation(obj);
            }
            uint64_t v62 = v14;
            v15 = *(void **)(*((void *)&v67 + 1) + 8 * v14);
            v16 = [v59 superview];
            [v59 center];
            double v18 = v17;
            double v20 = v19;
            v21 = [(CKEffectPreviewCollectionViewController *)self view];
            objc_msgSend(v16, "convertPoint:toView:", v21, v18, v20);
            objc_msgSend(v15, "setFocusPoint:");

            v22 = [v59 superview];
            [v59 frame];
            double v24 = v23;
            double v26 = v25;
            double v28 = v27;
            double v30 = v29;
            v31 = [(CKEffectPreviewCollectionViewController *)self view];
            objc_msgSend(v22, "convertRect:toView:", v31, v24, v26, v28, v30);
            objc_msgSend(v15, "setMessageRect:");

            objc_msgSend(v15, "setMessageOrientation:", objc_msgSend(v59, "orientation"));
            v32 = [(CKEffectPreviewCollectionViewController *)self delegate];
            v33 = [v32 balloonView];

            [v33 center];
            double v35 = v34;
            double v37 = v36;
            [v33 bounds];
            CGFloat v39 = v38;
            CGFloat v41 = v40;
            v42 = [MEMORY[0x1E4F42D90] mainScreen];
            [v42 scale];
            CGFloat v44 = v43;
            v74.width = v39;
            v74.height = v41;
            UIGraphicsBeginImageContextWithOptions(v74, 0, v44);

            [v33 bounds];
            objc_msgSend(v33, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
            v45 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            v46 = [(CKMomentCollectionViewCell *)v60 effectViews];
            uint64_t v47 = [v46 countByEnumeratingWithState:&v63 objects:v71 count:16];
            if (v47)
            {
              uint64_t v48 = v47;
              uint64_t v49 = *(void *)v64;
              do
              {
                uint64_t v50 = 0;
                do
                {
                  if (*(void *)v64 != v49) {
                    objc_enumerationMutation(v46);
                  }
                  v51 = *(void **)(*((void *)&v63 + 1) + 8 * v50);
                  v52 = [v33 superview];
                  v53 = [(CKEffectPreviewCollectionViewController *)self view];
                  objc_msgSend(v52, "convertPoint:toView:", v53, v35, v37);
                  objc_msgSend(v51, "setFocusPoint:");

                  [v51 setMessageImage:v45];
                  ++v50;
                }
                while (v48 != v50);
                uint64_t v48 = [v46 countByEnumeratingWithState:&v63 objects:v71 count:16];
              }
              while (v48);
            }

            uint64_t v14 = v62 + 1;
          }
          while (v62 + 1 != v61);
          uint64_t v61 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
        }
        while (v61);
      }

      v54 = [(CKEffectPreviewCollectionViewController *)self view];
      [v54 addSubview:v60];

      [(CKEffectPreviewCollectionViewController *)self addAnimationTimerForCell:v60];
      [(CKMomentCollectionViewCell *)v60 animate];

      v6 = v55;
      id v4 = v56;
    }
  }
}

- (void)setCurrentEffect:(id)a3
{
  p_currentEffect = &self->_currentEffect;
  id v5 = a3;
  objc_storeWeak((id *)p_currentEffect, v5);
  id v7 = [v5 backgroundColor];

  v6 = [(CKEffectPreviewCollectionViewController *)self view];
  [v6 setBackgroundColor:v7];
}

- (void)addAnimationTimerForCell:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, v4);
  id v5 = (void *)MEMORY[0x1E4F1CB00];
  v6 = [v4 effect];
  [v6 duration];
  double v8 = v7;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __68__CKEffectPreviewCollectionViewController_addAnimationTimerForCell___block_invoke;
  uint64_t v14 = &unk_1E5629740;
  objc_copyWeak(&v15, &location);
  v9 = [v5 timerWithTimeInterval:1 repeats:&v11 block:v8];

  v10 = objc_msgSend(MEMORY[0x1E4F1CAC0], "currentRunLoop", v11, v12, v13, v14);
  [v10 addTimer:v9 forMode:*MEMORY[0x1E4F1C4B0]];

  [(CKEffectPreviewCollectionViewController *)self setAnimationTimer:v9];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __68__CKEffectPreviewCollectionViewController_addAnimationTimerForCell___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained animate];
}

- (void)resumeEffect
{
  v3 = [(CKEffectPreviewCollectionViewController *)self resizingSavedIdentifier];
  [(CKEffectPreviewCollectionViewController *)self displayEffectWithIdentifier:v3];

  [(CKEffectPreviewCollectionViewController *)self setResizingSavedIdentifier:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)CKEffectPreviewCollectionViewController;
  id v7 = a4;
  -[CKEffectPreviewCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(CKEffectPreviewCollectionViewController *)self resizingSavedIdentifier];
  if (v8)
  {
    [(CKEffectPreviewCollectionViewController *)self setResizingSavedIdentifier:v8];
  }
  else
  {
    v9 = [(CKEffectPreviewCollectionViewController *)self currentEffect];
    v10 = [v9 identifier];
    [(CKEffectPreviewCollectionViewController *)self setResizingSavedIdentifier:v10];
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_resumeEffect object:0];
  [(CKEffectPreviewCollectionViewController *)self displayEffectWithIdentifier:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__CKEffectPreviewCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v11[3] = &unk_1E5621550;
  v11[4] = self;
  [v7 animateAlongsideTransition:&__block_literal_global_166 completion:v11];
}

uint64_t __94__CKEffectPreviewCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:sel_resumeEffect withObject:0 afterDelay:0.5];
}

- (CKEffectPreviewCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKEffectPreviewCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKFullScreenEffect)currentEffect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEffect);

  return (CKFullScreenEffect *)WeakRetained;
}

- (NSTimer)animationTimer
{
  return self->_animationTimer;
}

- (void)setAnimationTimer:(id)a3
{
}

- (CKFullScreenEffectManager)fsem
{
  return self->_fsem;
}

- (void)setFsem:(id)a3
{
}

- (CKMomentCollectionViewCell)currentCell
{
  return self->_currentCell;
}

- (void)setCurrentCell:(id)a3
{
}

- (NSString)resizingSavedIdentifier
{
  return self->_resizingSavedIdentifier;
}

- (void)setResizingSavedIdentifier:(id)a3
{
}

- (BOOL)hideEffects
{
  return self->_hideEffects;
}

- (void)setHideEffects:(BOOL)a3
{
  self->_hideEffects = a3;
}

- (UIView)cellWrapper
{
  return self->_cellWrapper;
}

- (void)setCellWrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellWrapper, 0);
  objc_storeStrong((id *)&self->_resizingSavedIdentifier, 0);
  objc_storeStrong((id *)&self->_currentCell, 0);
  objc_storeStrong((id *)&self->_fsem, 0);
  objc_storeStrong((id *)&self->_animationTimer, 0);
  objc_destroyWeak((id *)&self->_currentEffect);

  objc_destroyWeak((id *)&self->_delegate);
}

@end