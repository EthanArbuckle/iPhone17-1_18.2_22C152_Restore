@interface AVEditView
- (AVEditViewDataSource)dataSource;
- (AVEditViewDelegate)delegate;
- (BOOL)isScrubbing;
- (BOOL)isTrimming;
- (BOOL)prefersThumbVisible;
- (CGSize)intrinsicContentSize;
- (UIMovieScrubber)movieScrubber;
- (double)movieScrubberDuration:(id)a3;
- (double)movieScrubberThumbnailAspectRatio:(id)a3;
- (double)trimEndTime;
- (double)trimStartTime;
- (id)movieScrubber:(id)a3 evenlySpacedTimestamps:(int)a4 startingAt:(id)a5 endingAt:(id)a6;
- (void)layoutSubviews;
- (void)movieScrubber:(id)a3 editingEndValueDidChange:(double)a4;
- (void)movieScrubber:(id)a3 editingStartValueDidChange:(double)a4;
- (void)movieScrubber:(id)a3 requestThumbnailImageForTimestamp:(id)a4;
- (void)movieScrubber:(id)a3 valueDidChange:(double)a4;
- (void)movieScrubberDidBeginScrubbing:(id)a3 withHandle:(int)a4;
- (void)movieScrubberDidEndScrubbing:(id)a3 withHandle:(int)a4;
- (void)movieScrubberDidFinishRequestingThumbnails:(id)a3;
- (void)movieScrubberWillBeginRequestingThumbnails:(id)a3;
- (void)reloadData;
- (void)setCurrentTime:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMovieScrubber:(id)a3;
- (void)setPrefersThumbVisible:(BOOL)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setThumbnailImage:(CGImage *)a3 forTimestamp:(id)a4;
- (void)setTrimming:(BOOL)a3;
- (void)userObservationGestureRecognizerFired:(id)a3;
@end

@implementation AVEditView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieScrubber, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setMovieScrubber:(id)a3
{
}

- (UIMovieScrubber)movieScrubber
{
  return (UIMovieScrubber *)objc_getProperty(self, a2, 432, 1);
}

- (BOOL)isTrimming
{
  return self->_trimming;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (BOOL)prefersThumbVisible
{
  return self->_prefersThumbVisible;
}

- (void)setDelegate:(id)a3
{
}

- (AVEditViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVEditViewDelegate *)WeakRetained;
}

- (AVEditViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (AVEditViewDataSource *)WeakRetained;
}

- (void)movieScrubberDidFinishRequestingThumbnails:(id)a3
{
  id v4 = [(AVEditView *)self delegate];
  [v4 editViewDidFinishRequestingThumbnails:self];
}

- (void)movieScrubberWillBeginRequestingThumbnails:(id)a3
{
  id v4 = [(AVEditView *)self delegate];
  [v4 editViewWillBeginRequestingThumbnails:self];
}

- (void)movieScrubber:(id)a3 editingEndValueDidChange:(double)a4
{
  [(AVEditView *)self setTrimming:1];
  [(AVEditView *)self setScrubbing:1];
  id v6 = [(AVEditView *)self delegate];
  [v6 editView:self trimEndTimeDidChange:a4];
}

- (void)movieScrubber:(id)a3 editingStartValueDidChange:(double)a4
{
  [(AVEditView *)self setTrimming:1];
  [(AVEditView *)self setScrubbing:1];
  id v6 = [(AVEditView *)self delegate];
  [v6 editView:self trimStartTimeDidChange:a4];
}

- (void)movieScrubberDidEndScrubbing:(id)a3 withHandle:(int)a4
{
}

- (void)movieScrubberDidBeginScrubbing:(id)a3 withHandle:(int)a4
{
}

- (void)movieScrubber:(id)a3 valueDidChange:(double)a4
{
  id v6 = [(AVEditView *)self delegate];
  [v6 editView:self currentTimeDidChange:a4];
}

- (void)movieScrubber:(id)a3 requestThumbnailImageForTimestamp:(id)a4
{
  id v5 = a4;
  id v6 = [(AVEditView *)self dataSource];
  [v6 editView:self requestThumbnailImageForTimestamp:v5];
}

- (double)movieScrubberThumbnailAspectRatio:(id)a3
{
  id v4 = [(AVEditView *)self dataSource];
  [v4 editViewThumbnailAspectRatio:self];
  double v6 = v5;

  return v6;
}

- (id)movieScrubber:(id)a3 evenlySpacedTimestamps:(int)a4 startingAt:(id)a5 endingAt:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  v10 = [MEMORY[0x1E4F1CA48] array];
  if (a4 >= 1)
  {
    [v8 doubleValue];
    double v12 = v11;
    [v9 doubleValue];
    double v14 = v13;
    int v15 = a4 - 1;
    if (a4 != 1)
    {
      double v16 = (v13 - v12) / (double)a4;
      double v17 = 0.0;
      do
      {
        v18 = [NSNumber numberWithDouble:v12 + v17 * v16];
        [v10 addObject:v18];

        double v17 = v17 + 1.0;
        --v15;
      }
      while (v15);
    }
    v19 = [NSNumber numberWithDouble:v14];
    [v10 addObject:v19];
  }

  return v10;
}

- (double)movieScrubberDuration:(id)a3
{
  id v4 = [(AVEditView *)self dataSource];
  [v4 editViewDuration:self];
  double v6 = v5;

  double v7 = fabs(v6);
  BOOL v8 = v7 < INFINITY;
  BOOL v9 = v7 <= INFINITY;
  double result = 0.0;
  if (v8) {
    double result = v6;
  }
  if (!v9) {
    return v6;
  }
  return result;
}

- (void)setCurrentTime:(double)a3
{
  double v3 = fabs(a3);
  BOOL v4 = v3 < INFINITY;
  BOOL v5 = v3 <= INFINITY;
  double v6 = 0.0;
  if (v4) {
    double v6 = a3;
  }
  if (v5) {
    double v7 = v6;
  }
  else {
    double v7 = a3;
  }
  id v8 = [(AVEditView *)self movieScrubber];
  [v8 setValue:v7];
}

- (void)setTrimming:(BOOL)a3
{
  self->_trimming = a3;
  if (a3) {
    [(AVEditView *)self setPrefersThumbVisible:0];
  }
}

- (void)setPrefersThumbVisible:(BOOL)a3
{
  BOOL v3 = a3;
  self->_prefersThumbVisible = a3;
  id v4 = [(AVEditView *)self movieScrubber];
  [v4 setThumbIsVisible:v3];
}

- (void)setScrubbing:(BOOL)a3
{
  if (self->_scrubbing != a3)
  {
    BOOL v3 = a3;
    self->_scrubbing = a3;
    BOOL v5 = [(AVEditView *)self delegate];
    id v6 = v5;
    if (v3)
    {
      [v5 editViewDidBeginScrubbing:self];
    }
    else
    {
      [v5 editViewDidEndScrubbing:self];

      [(AVEditView *)self setTrimming:0];
    }
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  BOOL v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(AVEditView *)self reloadData];
    BOOL v5 = obj;
  }
}

- (void)setThumbnailImage:(CGImage *)a3 forTimestamp:(id)a4
{
  id v6 = a4;
  id v7 = [(AVEditView *)self movieScrubber];
  [v7 setThumbnailImage:a3 forTimestamp:v6];
}

- (void)userObservationGestureRecognizerFired:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 4 || objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 5) {
    [(AVEditView *)self setScrubbing:0];
  }
}

- (void)reloadData
{
  BOOL v3 = [(AVEditView *)self movieScrubber];

  if (v3)
  {
    double v17 = [(AVEditView *)self movieScrubber];
    [(AVUserInteractionObserverGestureRecognizer *)v17 reloadData];
  }
  else
  {
    id v4 = [(AVEditView *)self dataSource];
    [v4 editViewDuration:self];
    double v6 = v5;

    if (v6 <= 0.0) {
      return;
    }
    id v7 = objc_alloc(MEMORY[0x1E4FB19B8]);
    [(AVEditView *)self bounds];
    double v11 = objc_msgSend(v7, "initWithFrame:", v8 + 15.0, v9 + 0.0, v10 + -30.0);
    [(AVEditView *)self setMovieScrubber:v11];

    double v12 = [(AVEditView *)self movieScrubber];
    [v12 setDataSource:self];

    double v13 = [(AVEditView *)self movieScrubber];
    [v13 setDelegate:self];

    [(AVEditView *)self setPrefersThumbVisible:1];
    double v14 = [(AVEditView *)self movieScrubber];
    [(AVEditView *)self addSubview:v14];

    double v17 = [[AVUserInteractionObserverGestureRecognizer alloc] initWithTarget:self action:sel_userObservationGestureRecognizerFired_];
    int v15 = [(AVEditView *)self movieScrubber];
    [v15 addGestureRecognizer:v17];

    double v16 = [(AVEditView *)self movieScrubber];
    [v16 setEditable:1];
  }
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(AVEditView *)self movieScrubber];

  if (v3)
  {
    id v4 = [(AVEditView *)self movieScrubber];
    [v4 intrinsicContentSize];
    double v6 = v5;
    double v8 = v7;

    double v9 = v6;
    double v10 = v8;
  }
  else
  {
    double v9 = *MEMORY[0x1E4FB30D8];
    double v10 = *MEMORY[0x1E4FB30D8];
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)AVEditView;
  [(AVEditView *)&v13 layoutSubviews];
  [(AVEditView *)self bounds];
  double v4 = v3;
  double v6 = v5 + 15.0;
  double v8 = v7 + 0.0;
  double v10 = v9 + -30.0;
  double v11 = [(AVEditView *)self movieScrubber];
  objc_msgSend(v11, "setFrame:", v6, v8, v10, v4);

  double v12 = [(AVEditView *)self movieScrubber];
  [v12 setEdgeInset:15.0];
}

- (double)trimEndTime
{
  v2 = [(AVEditView *)self movieScrubber];
  [v2 trimEndValue];
  double v4 = v3;

  return v4;
}

- (double)trimStartTime
{
  v2 = [(AVEditView *)self movieScrubber];
  [v2 trimStartValue];
  double v4 = v3;

  return v4;
}

@end