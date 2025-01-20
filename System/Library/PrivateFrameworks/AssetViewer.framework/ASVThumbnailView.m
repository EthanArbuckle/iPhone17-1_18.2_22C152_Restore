@interface ASVThumbnailView
- (ASVThumbnailView)initWithCoder:(id)a3;
- (ASVThumbnailView)initWithFrame:(CGRect)a3;
- (ASVThumbnailViewDelegate)delegate;
- (CGSize)maxThumbnailSize;
- (QLItem)thumbnailItem;
- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4;
- (void)_commonInit;
- (void)previewCurrentItem;
- (void)setDelegate:(id)a3;
- (void)setMaxThumbnailSize:(CGSize)a3;
- (void)setThumbnailItem:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateThumbnailIfNeeded;
@end

@implementation ASVThumbnailView

- (ASVThumbnailView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = AssetViewerLogHandleForCategory(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2840000, v8, OS_LOG_TYPE_DEFAULT, "ARQL ASVThumbnailView initWithFrame called", buf, 2u);
  }

  v13.receiver = self;
  v13.super_class = (Class)ASVThumbnailView;
  v9 = -[ASVThumbnailView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v10 = v9;
  if (v9)
  {
    [(ASVThumbnailView *)v9 _commonInit];
    v11 = v10;
  }

  return v10;
}

- (ASVThumbnailView)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = AssetViewerLogHandleForCategory(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2840000, v5, OS_LOG_TYPE_DEFAULT, "ARQL ASVThumbnailView initWithCoder called", buf, 2u);
  }

  v9.receiver = self;
  v9.super_class = (Class)ASVThumbnailView;
  v6 = [(ASVThumbnailView *)&v9 initWithCoder:v4];

  if (v6)
  {
    [(ASVThumbnailView *)v6 _commonInit];
    v7 = v6;
  }

  return v6;
}

- (void)_commonInit
{
  v49[8] = *MEMORY[0x1E4F143B8];
  p_maxThumbnailSize = &self->_maxThumbnailSize;
  self->_maxThumbnailSize = (CGSize)vdupq_n_s64(0x4072C00000000000uLL);
  id v4 = [MEMORY[0x1E4FB1618] colorWithHexValue:@"262626" error:0];
  [(ASVThumbnailView *)self setBackgroundColor:v4];

  v5 = (NSOperationQueue *)objc_opt_new();
  operationQueue = self->_operationQueue;
  self->_operationQueue = v5;

  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2050000000;
  v7 = (void *)getQLItemThumbnailGeneratorClass_softClass;
  uint64_t v48 = getQLItemThumbnailGeneratorClass_softClass;
  if (!getQLItemThumbnailGeneratorClass_softClass)
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __getQLItemThumbnailGeneratorClass_block_invoke;
    v44[3] = &unk_1E6DD8270;
    v44[4] = &v45;
    __getQLItemThumbnailGeneratorClass_block_invoke((uint64_t)v44);
    v7 = (void *)v46[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v45, 8);
  objc_super v9 = (QLItemThumbnailGenerator *)objc_opt_new();
  thumbnailGenerator = self->_thumbnailGenerator;
  self->_thumbnailGenerator = v9;

  v11 = +[ASVThumbnailButton thumbnailButton];
  button = self->_button;
  self->_button = v11;

  [(ASVThumbnailButton *)self->_button addTarget:self action:sel_previewCurrentItem forControlEvents:64];
  [(ASVThumbnailView *)self addSubview:self->_button];
  [(ASVThumbnailButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v13 = [(ASVThumbnailButton *)self->_button widthAnchor];
  v14 = [v13 constraintEqualToConstant:p_maxThumbnailSize->width];
  p_widthButtonConstraint = &self->_widthButtonConstraint;
  widthButtonConstraint = self->_widthButtonConstraint;
  self->_widthButtonConstraint = v14;

  v17 = [(ASVThumbnailButton *)self->_button heightAnchor];
  v18 = [v17 constraintEqualToConstant:p_maxThumbnailSize->height];
  p_heightButtonConstraint = &self->_heightButtonConstraint;
  heightButtonConstraint = self->_heightButtonConstraint;
  self->_heightButtonConstraint = v18;

  LODWORD(v21) = 1144750080;
  [(NSLayoutConstraint *)self->_widthButtonConstraint setPriority:v21];
  LODWORD(v22) = 1144750080;
  [(NSLayoutConstraint *)self->_heightButtonConstraint setPriority:v22];
  v32 = (void *)MEMORY[0x1E4F28DC8];
  v43 = [(ASVThumbnailButton *)self->_button centerYAnchor];
  v42 = [(ASVThumbnailView *)self centerYAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v49[0] = v41;
  v40 = [(ASVThumbnailButton *)self->_button centerXAnchor];
  v39 = [(ASVThumbnailView *)self centerXAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v49[1] = v38;
  v37 = [(ASVThumbnailButton *)self->_button leadingAnchor];
  v36 = [(ASVThumbnailView *)self leadingAnchor];
  v35 = [v37 constraintGreaterThanOrEqualToAnchor:v36];
  v49[2] = v35;
  v34 = [(ASVThumbnailButton *)self->_button trailingAnchor];
  v33 = [(ASVThumbnailView *)self trailingAnchor];
  v23 = [v34 constraintLessThanOrEqualToAnchor:v33];
  v49[3] = v23;
  v24 = [(ASVThumbnailButton *)self->_button topAnchor];
  v25 = [(ASVThumbnailView *)self topAnchor];
  v26 = [v24 constraintGreaterThanOrEqualToAnchor:v25];
  v49[4] = v26;
  v27 = [(ASVThumbnailButton *)self->_button bottomAnchor];
  v28 = [(ASVThumbnailView *)self bottomAnchor];
  v29 = [v27 constraintLessThanOrEqualToAnchor:v28];
  v49[5] = v29;
  v30 = *p_heightButtonConstraint;
  v49[6] = *p_widthButtonConstraint;
  v49[7] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:8];
  [v32 activateConstraints:v31];
}

- (void)setThumbnailItem:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailItem, a3);
  [(ASVThumbnailView *)self updateThumbnailIfNeeded];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ASVThumbnailView;
  id v4 = a3;
  [(ASVThumbnailView *)&v10 traitCollectionDidChange:v4];
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  double v6 = v5;

  v7 = [(ASVThumbnailView *)self traitCollection];
  [v7 displayScale];
  double v9 = v8;

  if (v6 != v9) {
    [(ASVThumbnailView *)self updateThumbnailIfNeeded];
  }
}

- (void)setMaxThumbnailSize:(CGSize)a3
{
  if (a3.width != self->_maxThumbnailSize.width || a3.height != self->_maxThumbnailSize.height)
  {
    self->_maxThumbnailSize = a3;
    [(ASVThumbnailView *)self updateThumbnailIfNeeded];
  }
}

- (void)updateThumbnailIfNeeded
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = AssetViewerLogHandleForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2840000, v3, OS_LOG_TYPE_DEFAULT, "ARQL ASVThumbnailView updateThumbnailIfNeeded() called", buf, 2u);
  }

  id v4 = [(ASVThumbnailView *)self traitCollection];
  [v4 displayScale];
  double v6 = v5;

  [(ASVThumbnailView *)self maxThumbnailSize];
  if (*(double *)&v6 != 0.0)
  {
    double v9 = v7;
    double v10 = v8;
    if (v7 != *MEMORY[0x1E4F1DB30] || v8 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      v12 = [(ASVThumbnailView *)self thumbnailItem];
      BOOL v13 = v12 == 0;

      if (!v13)
      {
        [(NSLayoutConstraint *)self->_widthButtonConstraint setConstant:v9];
        [(NSLayoutConstraint *)self->_heightButtonConstraint setConstant:v10];
        self->_lastRequestedThumbnailSize.double width = v9;
        self->_lastRequestedThumbnailSize.double height = v10;
        self->_lastRequestedThumbnailScale = *(double *)&v6;
        v14 = [(ASVThumbnailView *)self thumbnailItem];
        objc_initWeak(&location, self);
        v15 = AssetViewerLogHandleForCategory(2);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = [v14 previewItemURL];
          *(_DWORD *)buf = 138412546;
          v25 = v14;
          __int16 v26 = 2112;
          v27 = v16;
          _os_log_impl(&dword_1E2840000, v15, OS_LOG_TYPE_DEFAULT, "ARQL ASVThumbnailView generating thumbnail at %@, %@", buf, 0x16u);
        }
        thumbnailGenerator = self->_thumbnailGenerator;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __43__ASVThumbnailView_updateThumbnailIfNeeded__block_invoke;
        v19[3] = &unk_1E6DD8248;
        objc_copyWeak(v22, &location);
        id v18 = v14;
        id v20 = v18;
        double v21 = self;
        v22[1] = v6;
        v22[2] = *(id *)&v9;
        v22[3] = *(id *)&v10;
        -[QLItemThumbnailGenerator generateThumbnailForItem:ofSize:minimumSize:scale:badgeType:completionBlock:](thumbnailGenerator, "generateThumbnailForItem:ofSize:minimumSize:scale:badgeType:completionBlock:", v18, 0, v19, v9, v10, v9, *(double *)&v6);

        objc_destroyWeak(v22);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __43__ASVThumbnailView_updateThumbnailIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ASVThumbnailView_updateThumbnailIfNeeded__block_invoke_2;
  block[3] = &unk_1E6DD8220;
  objc_copyWeak(v11, (id *)(a1 + 48));
  id v8 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  v11[1] = *(id *)(a1 + 56);
  long long v12 = *(_OWORD *)(a1 + 64);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v11);
}

void __43__ASVThumbnailView_updateThumbnailIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained) {
    goto LABEL_13;
  }
  id v3 = AssetViewerLogHandleForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = *(void *)(a1 + 32) != 0;
    *(_DWORD *)buf = 67109120;
    BOOL v18 = v4;
    _os_log_impl(&dword_1E2840000, v3, OS_LOG_TYPE_DEFAULT, "ARQL ASVThumbnailView thumbnail generation done, has thumbnail? %d", buf, 8u);
  }

  uint64_t v5 = [WeakRetained thumbnailItem];
  if (![v5 isEqual:*(void *)(a1 + 40)]
    || (uint64_t v6 = *(void *)(a1 + 48), *(double *)(v6 + 448) != *(double *)(a1 + 64)))
  {
LABEL_12:

    goto LABEL_13;
  }
  double v7 = (double *)(v6 + 432);
  double v8 = *(double *)(a1 + 72);
  double v9 = *(double *)(a1 + 80);
  double v10 = *v7;
  double v11 = v7[1];

  if (v8 == v10 && v9 == v11)
  {
    [WeakRetained layoutIfNeeded];
    BOOL v13 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __43__ASVThumbnailView_updateThumbnailIfNeeded__block_invoke_44;
    v14[3] = &unk_1E6DD81F8;
    id v15 = WeakRetained;
    id v16 = *(id *)(a1 + 32);
    [v13 animateWithDuration:v14 animations:0.2];

    uint64_t v5 = v15;
    goto LABEL_12;
  }
LABEL_13:
}

void __43__ASVThumbnailView_updateThumbnailIfNeeded__block_invoke_44(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setThumbnail:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 40))
  {
    v2 = *(void **)(*(void *)(a1 + 32) + 408);
    [v2 setError:0];
  }
  else
  {
    id v3 = (id)objc_opt_new();
    [*(id *)(*(void *)(a1 + 32) + 408) setError:v3];
  }
}

- (void)previewCurrentItem
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(ASVThumbnailView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(ASVThumbnailView *)self thumbnailItem];

    if (v5)
    {
      uint64_t v6 = AssetViewerLogHandleForCategory(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        double v7 = [(ASVThumbnailView *)self thumbnailItem];
        double v8 = [v7 previewItemURL];
        double v9 = [(ASVThumbnailView *)self thumbnailItem];
        double v10 = [v9 previewItemURL];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_impl(&dword_1E2840000, v6, OS_LOG_TYPE_DEFAULT, "ARQL ASVThumbnailView preview current item, path: %@,  obj: %@", buf, 0x16u);
      }
      uint64_t v19 = 0;
      id v20 = &v19;
      uint64_t v21 = 0x2050000000;
      double v11 = (void *)getQLPreviewControllerClass_softClass;
      uint64_t v22 = getQLPreviewControllerClass_softClass;
      if (!getQLPreviewControllerClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __getQLPreviewControllerClass_block_invoke;
        v25 = &unk_1E6DD8270;
        __int16 v26 = &v19;
        __getQLPreviewControllerClass_block_invoke((uint64_t)buf);
        double v11 = (void *)v20[3];
      }
      long long v12 = v11;
      _Block_object_dispose(&v19, 8);
      id v13 = [v12 alloc];
      v14 = [(ASVThumbnailView *)self thumbnailItem];
      v23 = v14;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
      id v16 = (void *)[v13 initWithPreviewItems:v15];

      [v16 setDelegate:self];
      v17 = [(ASVThumbnailView *)self delegate];
      BOOL v18 = [(ASVThumbnailView *)self thumbnailItem];
      [v17 thumbnailView:self wantsToPresentPreviewController:v16 forItem:v18];
    }
  }
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  char v4 = self;
  uint64_t v5 = [(ASVThumbnailButton *)self->_button thumbnail];

  if (v5) {
    char v4 = (ASVThumbnailView *)v4->_button;
  }
  uint64_t v6 = v4;
  return v6;
}

- (ASVThumbnailViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASVThumbnailViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (QLItem)thumbnailItem
{
  return self->_thumbnailItem;
}

- (CGSize)maxThumbnailSize
{
  double width = self->_maxThumbnailSize.width;
  double height = self->_maxThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heightButtonConstraint, 0);
  objc_storeStrong((id *)&self->_widthButtonConstraint, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end