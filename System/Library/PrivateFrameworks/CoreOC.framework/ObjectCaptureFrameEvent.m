@interface ObjectCaptureFrameEvent
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC6CoreOC23ObjectCaptureFrameEvent)init;
- (_TtC6CoreOC23ObjectCaptureFrameEvent)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ObjectCaptureFrameEvent

- (NSString)description
{
  v2 = self;
  sub_24B588EB8();

  v3 = (void *)sub_24B6827A0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC6CoreOC23ObjectCaptureFrameEvent)initWithCoder:(id)a3
{
  return (_TtC6CoreOC23ObjectCaptureFrameEvent *)ObjectCaptureFrameEvent.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24B58A6B8(v4);
}

- (_TtC6CoreOC23ObjectCaptureFrameEvent)init
{
  result = (_TtC6CoreOC23ObjectCaptureFrameEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end