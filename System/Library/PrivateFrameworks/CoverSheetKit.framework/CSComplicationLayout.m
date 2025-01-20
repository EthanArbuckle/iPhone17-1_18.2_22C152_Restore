@interface CSComplicationLayout
- (NSDictionary)framesByElement;
- (id)_initWithFramesByElement:(id)a3 draggedItemInsertionIndex:(int64_t)a4;
- (int64_t)draggedItemInsertionIndex;
@end

@implementation CSComplicationLayout

- (id)_initWithFramesByElement:(id)a3 draggedItemInsertionIndex:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSComplicationLayout;
  v8 = [(CSComplicationLayout *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_framesByElement, a3);
    v9->_draggedItemInsertionIndex = a4;
  }

  return v9;
}

- (NSDictionary)framesByElement
{
  return self->_framesByElement;
}

- (int64_t)draggedItemInsertionIndex
{
  return self->_draggedItemInsertionIndex;
}

- (void).cxx_destruct
{
}

@end