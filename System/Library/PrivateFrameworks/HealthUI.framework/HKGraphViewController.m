@interface HKGraphViewController
- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3;
- (HKGraphView)graphView;
- (HKGraphViewController)initWithGraphView:(id)a3 dateZoom:(int64_t)a4;
- (HKGraphViewControllerDelegate)delegate;
- (HKGraphViewDelegate)graphViewDelegateProxy;
- (id)graphView:(id)a3 graphSeriesForZoom:(int64_t)a4 stackOffset:(int64_t)a5;
- (id)seriesSelectionLineColorForGraphView:(id)a3;
- (id)stackedSeriesGroupHeightsForGraphView:(id)a3;
- (int64_t)dateZoom;
- (int64_t)primarySeriesGroupIndexForGraphView:(id)a3;
- (int64_t)stackCountForGraphView:(id)a3;
- (void)graphView:(id)a3 didFinishUserScrollingToValueRange:(id)a4;
- (void)graphView:(id)a3 didUpdateFromDateZoom:(int64_t)a4 toDateZoom:(int64_t)a5 newVisibleRange:(id)a6;
- (void)graphView:(id)a3 didUpdateLegendViewsWithTopLegendFrame:(CGRect)a4;
- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4;
- (void)graphView:(id)a3 didUpdateSeries:(id)a4 newDataArrived:(BOOL)a5 changeContext:(int64_t)a6;
- (void)graphView:(id)a3 didUpdateVisibleValueRange:(id)a4 changeContext:(int64_t)a5;
- (void)graphView:(id)a3 didUpdateYAxisWidth:(double)a4 toWidth:(double)a5;
- (void)graphView:(id)a3 startupTime:(int64_t)a4;
- (void)graphViewDidBeginSelection:(id)a3;
- (void)graphViewDidEndSelection:(id)a3;
- (void)graphViewDidTapYAxis:(id)a3;
- (void)graphViewExternalSelectionEnd:(id)a3;
- (void)graphViewRenderedView:(id)a3;
- (void)graphViewSizeChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailView:(id)a3;
- (void)setGraphViewDelegateProxy:(id)a3;
@end

@implementation HKGraphViewController

- (HKGraphViewController)initWithGraphView:(id)a3 dateZoom:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKGraphViewController;
  v8 = [(HKGraphViewController *)&v11 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_graphView, a3);
    [(HKGraphView *)v9->_graphView setDelegate:v9];
    objc_storeWeak((id *)&v9->_graphViewDelegateProxy, 0);
    v9->_dateZoom = a4;
  }

  return v9;
}

- (void)setDetailView:(id)a3
{
}

- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3
{
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  char v6 = [WeakRetained graphViewPointSelectionDifferentiatesSeriesGroups:v4];

  return v6;
}

- (void)graphViewDidBeginSelection:(id)a3
{
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  [WeakRetained graphViewDidBeginSelection:v4];
}

- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4
{
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  [WeakRetained graphView:v7 didUpdateSelectedPoint:v6];
}

- (void)graphViewDidEndSelection:(id)a3
{
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  [WeakRetained graphViewDidEndSelection:v4];
}

- (void)graphView:(id)a3 didUpdateFromDateZoom:(int64_t)a4 toDateZoom:(int64_t)a5 newVisibleRange:(id)a6
{
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id v10 = a6;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  [WeakRetained graphView:v11 didUpdateFromDateZoom:a4 toDateZoom:a5 newVisibleRange:v10];
}

- (void)graphView:(id)a3 didUpdateVisibleValueRange:(id)a4 changeContext:(int64_t)a5
{
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  [WeakRetained graphView:v9 didUpdateVisibleValueRange:v8 changeContext:a5];
}

- (void)graphView:(id)a3 didFinishUserScrollingToValueRange:(id)a4
{
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  [WeakRetained graphView:v7 didFinishUserScrollingToValueRange:v6];
}

- (int64_t)stackCountForGraphView:(id)a3
{
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  int64_t v6 = [WeakRetained stackCountForGraphView:v4];

  return v6;
}

- (int64_t)primarySeriesGroupIndexForGraphView:(id)a3
{
  id v4 = a3;
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
    int64_t v9 = [v8 primarySeriesGroupIndexForGraphView:v4];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)stackedSeriesGroupHeightsForGraphView:(id)a3
{
  id v4 = a3;
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
    int64_t v9 = [v8 stackedSeriesGroupHeightsForGraphView:v4];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)graphView:(id)a3 graphSeriesForZoom:(int64_t)a4 stackOffset:(int64_t)a5
{
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  id v10 = [WeakRetained graphView:v8 graphSeriesForZoom:a4 stackOffset:a5];

  return v10;
}

- (void)graphViewSizeChanged:(id)a3
{
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  [WeakRetained graphViewSizeChanged:v4];
}

- (void)graphView:(id)a3 didUpdateYAxisWidth:(double)a4 toWidth:(double)a5
{
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  [WeakRetained graphView:v8 didUpdateYAxisWidth:a4 toWidth:a5];
}

- (void)graphView:(id)a3 didUpdateSeries:(id)a4 newDataArrived:(BOOL)a5 changeContext:(int64_t)a6
{
  BOOL v7 = a5;
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  [WeakRetained graphView:v11 didUpdateSeries:v10 newDataArrived:v7 changeContext:a6];
}

- (id)seriesSelectionLineColorForGraphView:(id)a3
{
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  int64_t v6 = [WeakRetained seriesSelectionLineColorForGraphView:v4];

  return v6;
}

- (void)graphView:(id)a3 didUpdateLegendViewsWithTopLegendFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  p_graphViewDelegateProxdouble y = &self->_graphViewDelegateProxy;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphView:didUpdateLegendViewsWithTopLegendFrame:", v9, x, y, width, height);
}

- (void)graphViewDidTapYAxis:(id)a3
{
  p_graphViewDelegateProxdouble y = &self->_graphViewDelegateProxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  [WeakRetained graphViewDidTapYAxis:v4];
}

- (void)graphView:(id)a3 startupTime:(int64_t)a4
{
  p_graphViewDelegateProxdouble y = &self->_graphViewDelegateProxy;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  [WeakRetained graphView:v6 startupTime:a4];
}

- (void)graphViewExternalSelectionEnd:(id)a3
{
  p_graphViewDelegateProxdouble y = &self->_graphViewDelegateProxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  [WeakRetained graphViewExternalSelectionEnd:v4];
}

- (void)graphViewRenderedView:(id)a3
{
  p_graphViewDelegateProxdouble y = &self->_graphViewDelegateProxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  [WeakRetained graphViewRenderedView:v4];
}

- (HKGraphView)graphView
{
  return self->_graphView;
}

- (HKGraphViewDelegate)graphViewDelegateProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graphViewDelegateProxy);
  return (HKGraphViewDelegate *)WeakRetained;
}

- (void)setGraphViewDelegateProxy:(id)a3
{
}

- (HKGraphViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKGraphViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)dateZoom
{
  return self->_dateZoom;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_graphViewDelegateProxy);
  objc_storeStrong((id *)&self->_graphView, 0);
}

@end