@interface MUInfoCardDraggableContent
- (BOOL)isHeader;
- (NSItemProviderWriting)draggableContent;
- (UIView)view;
- (int)analyticsTarget;
- (void)setAnalyticsTarget:(int)a3;
- (void)setDraggableContent:(id)a3;
- (void)setHeader:(BOOL)a3;
- (void)setView:(id)a3;
@end

@implementation MUInfoCardDraggableContent

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (NSItemProviderWriting)draggableContent
{
  return self->_draggableContent;
}

- (void)setDraggableContent:(id)a3
{
}

- (BOOL)isHeader
{
  return self->_header;
}

- (void)setHeader:(BOOL)a3
{
  self->_header = a3;
}

- (int)analyticsTarget
{
  return self->_analyticsTarget;
}

- (void)setAnalyticsTarget:(int)a3
{
  self->_analyticsTarget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggableContent, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end