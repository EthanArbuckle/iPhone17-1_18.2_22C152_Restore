@interface ImageGenerationUIDiagnosticExtension
- (_TtC45com_apple_ImagePlayground_DiagnosticExtension36ImageGenerationUIDiagnosticExtension)init;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation ImageGenerationUIDiagnosticExtension

- (id)attachmentsForParameters:(id)a3
{
  if (a3) {
    sub_100003BD0();
  }
  sub_100003A10(&qword_100008140);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100003DB0;
  id v5 = objc_allocWithZone((Class)DEAttachmentItem);
  v6 = self;
  NSString v7 = sub_100003BE0();
  id v8 = [v5 initWithPath:v7];

  if (v8)
  {
    *(void *)(inited + 32) = v8;
    sub_100003C00();
    sub_1000035EC(inited);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    v10.super.isa = sub_100003BF0().super.isa;
    swift_bridgeObjectRelease();
    return v10.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC45com_apple_ImagePlayground_DiagnosticExtension36ImageGenerationUIDiagnosticExtension)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ImageGenerationUIDiagnosticExtension();
  return [(ImageGenerationUIDiagnosticExtension *)&v3 init];
}

@end