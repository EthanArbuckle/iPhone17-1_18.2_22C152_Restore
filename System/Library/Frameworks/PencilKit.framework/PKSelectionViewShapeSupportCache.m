@interface PKSelectionViewShapeSupportCache
@end

@implementation PKSelectionViewShapeSupportCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalStrokes, 0);

  objc_storeStrong((id *)&self->_shapes, 0);
}

@end