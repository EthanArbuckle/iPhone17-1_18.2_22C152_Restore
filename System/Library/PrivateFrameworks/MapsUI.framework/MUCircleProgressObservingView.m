@interface MUCircleProgressObservingView
- (CGSize)intrinsicContentSize;
- (MUCircleProgressObservingView)initWithFrame:(CGRect)a3;
- (NSProgress)progress;
- (UIImage)image;
- (id)primaryAction;
- (void)_updateProgressView;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setImage:(id)a3;
- (void)setPrimaryAction:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation MUCircleProgressObservingView

- (MUCircleProgressObservingView)initWithFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  v6 = -[MUCircleProgressView initWithFrame:]([MUCircleProgressView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MUCircleProgressView *)v6 frame];
  double v8 = v7;
  [(MUCircleProgressView *)v6 frame];
  v17.receiver = self;
  v17.super_class = (Class)MUCircleProgressObservingView;
  v9 = -[MUCircleProgressObservingView initWithFrame:](&v17, sel_initWithFrame_, x, y, v8);
  v10 = v9;
  if (v9)
  {
    p_progressView = (id *)&v9->_progressView;
    objc_storeStrong((id *)&v9->_progressView, v6);
    [(MUCircleProgressObservingView *)v10 addSubview:*p_progressView];
    v12 = [[MUEdgeLayout alloc] initWithItem:*p_progressView container:v10];
    [(MUConstraintLayout *)v12 activate];

    LODWORD(v13) = 1148846080;
    [*p_progressView setContentHuggingPriority:0 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [*p_progressView setContentHuggingPriority:1 forAxis:v14];
    v15 = v10;
  }

  return v10;
}

- (void)dealloc
{
  [(NSProgress *)self->_progress removeObserver:self forKeyPath:@"fractionCompleted" context:_ProgressKVOContext];
  [(NSProgress *)self->_progress removeObserver:self forKeyPath:@"indeterminate" context:_ProgressKVOContext];
  v3.receiver = self;
  v3.super_class = (Class)MUCircleProgressObservingView;
  [(MUCircleProgressObservingView *)&v3 dealloc];
}

- (CGSize)intrinsicContentSize
{
  [(MUCircleProgressView *)self->_progressView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIImage)image
{
  return [(MUCircleProgressView *)self->_progressView image];
}

- (void)setImage:(id)a3
{
}

- (void)setProgress:(id)a3
{
  v5 = (NSProgress *)a3;
  p_progress = &self->_progress;
  progress = self->_progress;
  if (progress != v5)
  {
    double v8 = v5;
    [(NSProgress *)progress removeObserver:self forKeyPath:@"fractionCompleted" context:_ProgressKVOContext];
    [(NSProgress *)*p_progress removeObserver:self forKeyPath:@"indeterminate" context:_ProgressKVOContext];
    objc_storeStrong((id *)&self->_progress, a3);
    [(NSProgress *)*p_progress addObserver:self forKeyPath:@"fractionCompleted" options:0 context:_ProgressKVOContext];
    [(NSProgress *)*p_progress addObserver:self forKeyPath:@"indeterminate" options:0 context:_ProgressKVOContext];
    progress = (NSProgress *)[(MUCircleProgressObservingView *)self _updateProgressView];
    v5 = v8;
  }
  MEMORY[0x1F41817F8](progress, v5);
}

- (id)primaryAction
{
  return [(MUCircleProgressView *)self->_progressView primaryAction];
}

- (void)setPrimaryAction:(id)a3
{
}

- (void)_updateProgressView
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(MUCircleProgressView *)self->_progressView setIndeterminate:[(NSProgress *)self->_progress isIndeterminate]];
  [(NSProgress *)self->_progress fractionCompleted];
  progressView = self->_progressView;
  -[MUCircleProgressView setProgress:](progressView, "setProgress:");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)_ProgressKVOContext == a6)
  {
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3, a4, a5))
    {
      [(MUCircleProgressObservingView *)self _updateProgressView];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__MUCircleProgressObservingView_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E574EFD0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MUCircleProgressObservingView;
    -[MUCircleProgressObservingView observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __80__MUCircleProgressObservingView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateProgressView];
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end