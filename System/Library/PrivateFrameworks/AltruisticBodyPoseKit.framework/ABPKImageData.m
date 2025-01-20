@interface ABPKImageData
- (ABPKImageData)init;
- (ABPKImageData)initWithPixelBuffer:(__CVBuffer *)a3 timestamp:(double)a4;
- (__CVBuffer)pixelBuffer;
- (double)timestamp;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ABPKImageData

- (__CVBuffer)pixelBuffer
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ABPKImageData_pixelBuffer);
  swift_beginAccess();
  return (__CVBuffer *)*v2;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ABPKImageData_pixelBuffer);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;
}

- (double)timestamp
{
  v2 = (double *)((char *)self + OBJC_IVAR___ABPKImageData_timestamp);
  swift_beginAccess();
  return *v2;
}

- (void)setTimestamp:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___ABPKImageData_timestamp);
  swift_beginAccess();
  double *v4 = a3;
}

- (ABPKImageData)initWithPixelBuffer:(__CVBuffer *)a3 timestamp:(double)a4
{
  v7 = (void **)((char *)&self->super.isa + OBJC_IVAR___ABPKImageData_pixelBuffer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ABPKImageData_pixelBuffer) = 0;
  swift_beginAccess();
  v8 = *v7;
  *v7 = a3;
  v9 = a3;
  v10 = self;

  *(double *)((char *)&v10->super.isa + OBJC_IVAR___ABPKImageData_timestamp) = a4;
  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for ABPKImageData();
  v11 = [(ABPKImageData *)&v13 init];

  return v11;
}

- (ABPKImageData)init
{
  result = (ABPKImageData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end