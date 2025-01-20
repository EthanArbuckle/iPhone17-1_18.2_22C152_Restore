@interface CLKUIBezierPathStepper
- (CLKUIBezierPathStepper)init;
- (UIBezierPath)path;
- (double)totalLength;
- (id)mapOffsetsToPathPositions:(id)a3;
- (void)setPath:(id)a3;
- (void)updateSegmentsWithPath:(id)a3;
@end

@implementation CLKUIBezierPathStepper

- (UIBezierPath)path
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CLKUIBezierPathStepper_path);
  swift_beginAccess();
  return (UIBezierPath *)*v2;
}

- (void)setPath:(id)a3
{
  v5 = (id *)((char *)&self->super.isa + OBJC_IVAR___CLKUIBezierPathStepper_path);
  swift_beginAccess();
  id v6 = *v5;
  id *v5 = a3;
  v7 = (CLKUIBezierPathStepper *)a3;
  v8 = self;

  if (*v5)
  {
    v9 = (CLKUIBezierPathStepper *)*v5;
    CLKUIBezierPathStepper.updateSegments(path:)((UIBezierPath)v9);

    v8 = v7;
    v7 = v9;
  }
}

- (CLKUIBezierPathStepper)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___CLKUIBezierPathStepper_path);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLKUIBezierPathStepper_path) = 0;
  v5 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLKUIBezierPathStepper_segments) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLKUIBezierPathStepper_segmentLengthTables) = v5;
  swift_beginAccess();
  id v6 = *v4;
  *v4 = 0;

  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(CLKUIBezierPathStepper *)&v8 init];
}

- (void)updateSegmentsWithPath:(id)a3
{
  id v4 = a3;
  v5 = self;
  CLKUIBezierPathStepper.updateSegments(path:)((UIBezierPath)v4);
}

- (id)mapOffsetsToPathPositions:(id)a3
{
  sub_1D31AA6B8();
  id v4 = self;
  CLKUIBezierPathStepper.mapOffsetsToPathPositions(_:)();

  swift_bridgeObjectRelease();
  type metadata accessor for SlopedPoint();
  v5 = (void *)sub_1D31AA6A8();
  swift_bridgeObjectRelease();
  return v5;
}

- (double)totalLength
{
  CLKUIBezierPathStepper.totalLength()();
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end