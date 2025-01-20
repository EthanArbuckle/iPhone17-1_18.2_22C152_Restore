@interface CKStaticImageStackView
- (CKStaticImageStackView)initWithFrame:(CGRect)a3 mediaObjects:(id)a4;
- (Class)_PFMessageStackLayoutFrameSolverClass;
- (NSArray)imageLayers;
- (NSArray)mediaObjects;
- (PFMessagesStackLayoutFrameSolver)frameSolver;
- (double)stackCornerRadius;
- (void)_mediaObjectPreviewDidChange:(id)a3;
- (void)_updatePreviews;
- (void)layoutSubviews;
- (void)setFrameSolver:(id)a3;
- (void)setImageLayers:(id)a3;
- (void)setMediaObjects:(id)a3;
- (void)setStackCornerRadius:(double)a3;
@end

@implementation CKStaticImageStackView

- (CKStaticImageStackView)initWithFrame:(CGRect)a3 mediaObjects:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CKStaticImageStackView;
  v10 = -[CKStaticImageStackView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(CKStaticImageStackView *)v10 setMediaObjects:v9];
    v11->_stackCornerRadius = 20.0;
    id v12 = objc_alloc_init([(CKStaticImageStackView *)v11 _PFMessageStackLayoutFrameSolverClass]);
    [(CKStaticImageStackView *)v11 setFrameSolver:v12];
    v13 = objc_opt_new();
    if ([v9 count])
    {
      unint64_t v14 = 0;
      uint64_t v15 = *MEMORY[0x1E4F3A3E0];
      uint64_t v16 = *MEMORY[0x1E4F39EA8];
      do
      {
        v17 = [MEMORY[0x1E4F39BE8] layer];
        [v17 setContentsGravity:v15];
        objc_msgSend(v17, "setAnchorPoint:", 0.5, 0.5);
        [v17 setMasksToBounds:1];
        [v17 setCornerCurve:v16];
        v18 = [(CKStaticImageStackView *)v11 layer];
        [v18 addSublayer:v17];

        [v13 addObject:v17];
        ++v14;
      }
      while ([v9 count] > v14);
    }
    [(CKStaticImageStackView *)v11 setImageLayers:v13];
    [(CKStaticImageStackView *)v11 _updatePreviews];
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v11 selector:sel__mediaObjectPreviewDidChange_ name:@"CKPreviewDidChangeNotification" object:0];
  }
  return v11;
}

- (void)layoutSubviews
{
  *(_DWORD *)buf = 136315138;
  *a2 = "CGSize _SizeWithAspectRatioFittingSize(double, CGSize)";
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "%s would have attempted divide by zero because size.height was 0.", buf, 0xCu);
}

- (void)setStackCornerRadius:(double)a3
{
  if (self->_stackCornerRadius != a3)
  {
    self->_stackCornerRadius = a3;
    [(CKStaticImageStackView *)self setNeedsLayout];
  }
}

- (void)_mediaObjectPreviewDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v7 = [v4 object];
  if (isKindOfClass)
  {
    v8 = [(CKStaticImageStackView *)self mediaObjects];
    int v9 = [v8 containsObject:v7];

    if (v9)
    {
      [(CKStaticImageStackView *)self _updatePreviews];
      [(CKStaticImageStackView *)self setNeedsLayout];
    }
  }
  else
  {
    v10 = (objc_class *)objc_opt_class();

    if (v10)
    {
      v11 = NSString;
      id v12 = NSStringFromClass(v10);
      v13 = [v11 stringWithFormat:@"of type: %@", v12];
    }
    else
    {
      v13 = @"nil";
    }
    if (IMOSLoggingEnabled())
    {
      unint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v13;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Notification object received was %@ instead of expected type CKMediaObject, _mediaObjectPreviewDidChange does nothing", buf, 0xCu);
      }
    }
  }
}

- (void)_updatePreviews
{
  v3 = [(CKStaticImageStackView *)self mediaObjects];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [(CKStaticImageStackView *)self mediaObjects];
      v7 = [v6 objectAtIndexedSubscript:v5];

      v8 = [(CKStaticImageStackView *)self imageLayers];
      int v9 = [v8 objectAtIndexedSubscript:v5];

      v10 = +[CKUIBehavior sharedBehaviors];
      [v10 previewMaxWidth];
      v11 = objc_msgSend(v7, "previewForWidth:orientation:", 0);

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v9, "setContents:", objc_msgSend(v11, "CGImage"));
      }

      ++v5;
      id v12 = [(CKStaticImageStackView *)self mediaObjects];
      unint64_t v13 = [v12 count];
    }
    while (v13 > v5);
  }
}

- (Class)_PFMessageStackLayoutFrameSolverClass
{
  if (_PFMessageStackLayoutFrameSolverClass_onceToken != -1) {
    dispatch_once(&_PFMessageStackLayoutFrameSolverClass_onceToken, &__block_literal_global_62);
  }
  v2 = (void *)_PFMessageStackLayoutFrameSolverClass__PFMessageStackLayoutFrameSolverClass;

  return (Class)v2;
}

uint64_t __63__CKStaticImageStackView__PFMessageStackLayoutFrameSolverClass__block_invoke()
{
  uint64_t result = MEMORY[0x192FBA860](@"PFMessagesStackLayoutFrameSolver", @"PhotosFormats");
  _PFMessageStackLayoutFrameSolverClass__PFMessageStackLayoutFrameSolverClass = result;
  return result;
}

- (NSArray)mediaObjects
{
  return self->_mediaObjects;
}

- (void)setMediaObjects:(id)a3
{
}

- (double)stackCornerRadius
{
  return self->_stackCornerRadius;
}

- (NSArray)imageLayers
{
  return self->_imageLayers;
}

- (void)setImageLayers:(id)a3
{
}

- (PFMessagesStackLayoutFrameSolver)frameSolver
{
  return self->_frameSolver;
}

- (void)setFrameSolver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameSolver, 0);
  objc_storeStrong((id *)&self->_imageLayers, 0);

  objc_storeStrong((id *)&self->_mediaObjects, 0);
}

@end