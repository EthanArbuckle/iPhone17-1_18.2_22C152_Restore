@interface _HKGraphTileDelayedRendererEntry
- (BOOL)expiredAtTime:(double)a3;
- (_HKGraphTileDelayedRendererEntry)initWithImageRenderer:(id)a3 lastAssignmentTime:(double)a4;
- (_HKGraphTileRenderToImage)imageRenderer;
- (double)lastAssignmentTime;
@end

@implementation _HKGraphTileDelayedRendererEntry

- (_HKGraphTileDelayedRendererEntry)initWithImageRenderer:(id)a3 lastAssignmentTime:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HKGraphTileDelayedRendererEntry;
  v8 = [(_HKGraphTileDelayedRendererEntry *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_imageRenderer, a3);
    v9->_lastAssignmentTime = a4;
  }

  return v9;
}

- (BOOL)expiredAtTime:(double)a3
{
  [(_HKGraphTileDelayedRendererEntry *)self lastAssignmentTime];
  return a3 - v4 > 3.0;
}

- (_HKGraphTileRenderToImage)imageRenderer
{
  return self->_imageRenderer;
}

- (double)lastAssignmentTime
{
  return self->_lastAssignmentTime;
}

- (void).cxx_destruct
{
}

@end