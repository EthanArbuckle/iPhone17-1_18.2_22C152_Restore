@interface QLTransitionDriver
- (BOOL)isSourceViewTransformed;
- (BOOL)presenting;
- (BOOL)transitionContainerMasksToBounds;
- (CGAffineTransform)sourceViewTransform;
- (CGPoint)sourceViewCenter;
- (CGRect)sourceViewBounds;
- (CGRect)sourceViewFrame;
- (CGRect)transitionContainerOriginalFrame;
- (CGRect)uncroppedFrame;
- (CGSize)transitionPreviewSize;
- (QLDismissGestureTracking)gestureTracker;
- (QLItem)transitionPreviewItem;
- (UIView)destinationView;
- (UIView)sourceView;
- (UIView)transitionContainer;
- (double)duration;
- (double)hostNavigationOffset;
- (double)topNavigationOffset;
- (void)setDestinationView:(id)a3;
- (void)setDuration:(double)a3;
- (void)setGestureTracker:(id)a3;
- (void)setHostNavigationOffset:(double)a3;
- (void)setIsSourceViewTransformed:(BOOL)a3;
- (void)setPresenting:(BOOL)a3;
- (void)setSourceView:(id)a3;
- (void)setSourceViewBounds:(CGRect)a3;
- (void)setSourceViewCenter:(CGPoint)a3;
- (void)setSourceViewFrame:(CGRect)a3;
- (void)setSourceViewTransform:(CGAffineTransform *)a3;
- (void)setTopNavigationOffset:(double)a3;
- (void)setTransitionContainer:(id)a3;
- (void)setTransitionContainerMasksToBounds:(BOOL)a3;
- (void)setTransitionContainerOriginalFrame:(CGRect)a3;
- (void)setTransitionPreviewItem:(id)a3;
- (void)setTransitionPreviewSize:(CGSize)a3;
- (void)setUncroppedFrame:(CGRect)a3;
@end

@implementation QLTransitionDriver

- (CGSize)transitionPreviewSize
{
  objc_copyStruct(v4, &self->_transitionPreviewSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTransitionPreviewSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_transitionPreviewSize, &v3, 16, 1, 0);
}

- (QLItem)transitionPreviewItem
{
  return (QLItem *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransitionPreviewItem:(id)a3
{
}

- (UIView)transitionContainer
{
  return (UIView *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTransitionContainer:(id)a3
{
}

- (UIView)destinationView
{
  return (UIView *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDestinationView:(id)a3
{
}

- (UIView)sourceView
{
  return (UIView *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSourceView:(id)a3
{
}

- (CGRect)sourceViewFrame
{
  objc_copyStruct(v6, &self->_sourceViewFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setSourceViewFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_sourceViewFrame, &v3, 32, 1, 0);
}

- (BOOL)isSourceViewTransformed
{
  return self->_isSourceViewTransformed;
}

- (void)setIsSourceViewTransformed:(BOOL)a3
{
  self->_isSourceViewTransformed = a3;
}

- (CGRect)sourceViewBounds
{
  objc_copyStruct(v6, &self->_sourceViewBounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setSourceViewBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_sourceViewBounds, &v3, 32, 1, 0);
}

- (CGPoint)sourceViewCenter
{
  objc_copyStruct(v4, &self->_sourceViewCenter, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setSourceViewCenter:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_sourceViewCenter, &v3, 16, 1, 0);
}

- (CGAffineTransform)sourceViewTransform
{
  objc_copyStruct(retstr, &self->_sourceViewTransform, 48, 1, 0);
  return result;
}

- (void)setSourceViewTransform:(CGAffineTransform *)a3
{
}

- (CGRect)uncroppedFrame
{
  objc_copyStruct(v6, &self->_uncroppedFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setUncroppedFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_uncroppedFrame, &v3, 32, 1, 0);
}

- (CGRect)transitionContainerOriginalFrame
{
  objc_copyStruct(v6, &self->_transitionContainerOriginalFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setTransitionContainerOriginalFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_transitionContainerOriginalFrame, &v3, 32, 1, 0);
}

- (BOOL)transitionContainerMasksToBounds
{
  return self->_transitionContainerMasksToBounds;
}

- (void)setTransitionContainerMasksToBounds:(BOOL)a3
{
  self->_transitionContainerMasksToBounds = a3;
}

- (QLDismissGestureTracking)gestureTracker
{
  return (QLDismissGestureTracking *)objc_getProperty(self, a2, 48, 1);
}

- (void)setGestureTracker:(id)a3
{
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)topNavigationOffset
{
  return self->_topNavigationOffset;
}

- (void)setTopNavigationOffset:(double)a3
{
  self->_topNavigationOffset = a3;
}

- (double)hostNavigationOffset
{
  return self->_hostNavigationOffset;
}

- (void)setHostNavigationOffset:(double)a3
{
  self->_hostNavigationOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureTracker, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_destinationView, 0);
  objc_storeStrong((id *)&self->_transitionContainer, 0);

  objc_storeStrong((id *)&self->_transitionPreviewItem, 0);
}

@end