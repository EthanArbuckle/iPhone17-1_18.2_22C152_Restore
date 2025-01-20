@interface MTLIOAccelIOHandleRaw
- (MTLIOAccelIOHandleRaw)initWithDevice:(id)a3 path:(const char *)a4 error:(id *)a5 uncached:(BOOL)a6;
- (void)setLabel:(id)a3;
@end

@implementation MTLIOAccelIOHandleRaw

- (MTLIOAccelIOHandleRaw)initWithDevice:(id)a3 path:(const char *)a4 error:(id *)a5 uncached:(BOOL)a6
{
  v7.receiver = self;
  v7.super_class = (Class)MTLIOAccelIOHandleRaw;
  return [(_MTLIOHandleRaw *)&v7 initWithDevice:a3 path:a4 error:a5 uncached:a6];
}

- (void)setLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelIOHandleRaw;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(_MTLIOHandleRaw *)self globalTraceObjectID];
    [a3 cStringUsingEncoding:1];
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

@end