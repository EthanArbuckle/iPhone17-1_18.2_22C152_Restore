@interface HSTContactFrameMetadataAccessor
- (SurfaceSize)surfaceSize;
- (void)setSurfaceSize:(SurfaceSize)a3;
@end

@implementation HSTContactFrameMetadataAccessor

- (SurfaceSize)surfaceSize
{
  p_metadata = &self->frame->metadata;
  uint64_t v4 = 0;
  if (!p_metadata->surfaceSize.__engaged_) {
    p_metadata = (HSTContactFrameMetadata *)&v4;
  }
  return p_metadata->surfaceSize.var0.__val_;
}

- (void)setSurfaceSize:(SurfaceSize)a3
{
  p_metadata = &self->frame->metadata;
  if (!self->frame->metadata.surfaceSize.__engaged_) {
    self->frame->metadata.surfaceSize.__engaged_ = 1;
  }
  p_metadata->surfaceSize.var0.__val_ = a3;
}

- (void).cxx_destruct
{
}

@end