@interface MTLIOAccelIOHandleCompressed
- (MTLIOAccelIOHandleCompressed)initWithDevice:(id)a3 path:(const char *)a4 compressionType:(int64_t)a5 error:(id *)a6 uncached:(BOOL)a7;
- (void)setLabel:(id)a3;
@end

@implementation MTLIOAccelIOHandleCompressed

- (MTLIOAccelIOHandleCompressed)initWithDevice:(id)a3 path:(const char *)a4 compressionType:(int64_t)a5 error:(id *)a6 uncached:(BOOL)a7
{
  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelIOHandleCompressed;
  return [(_MTLIOHandleCompressed *)&v8 initWithDevice:a3 path:a4 compressionType:a5 error:a6 uncached:a7];
}

- (void)setLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelIOHandleCompressed;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(_MTLIOHandleCompressed *)self globalTraceObjectID];
    [a3 cStringUsingEncoding:1];
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

@end