@interface RBDisplayListDecoderDelegate
- (CGFont)decodedCGFontWithData:(id)a3 error:(id *)a4;
- (_TtC7SwiftUI28RBDisplayListDecoderDelegate)init;
- (id)decodedImageContentsWithData:(id)a3 type:(int *)a4 error:(id *)a5;
@end

@implementation RBDisplayListDecoderDelegate

- (id)decodedImageContentsWithData:(id)a3 type:(int *)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  v12 = RBDisplayListDecoderDelegate.decodedImageContents(data:type:)(v9, v11, a4);
  outlined consume of Data._Representation(v9, v11);

  return v12;
}

- (CGFont)decodedCGFontWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  outlined copy of Data._Representation(v7, v9);
  ProtobufDecoder.init(_:)(v7, v9, v14);
  unint64_t v10 = *(objc_class **)&v6->decoder[OBJC_IVAR____TtC7SwiftUI28RBDisplayListDecoderDelegate_decoder + 40];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14[6] = v10;
  CGFontRef v11 = specialized CodableCGFont.init(from:)((id *)v14);
  v12 = v14[0];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  outlined consume of Data._Representation(v7, v9);

  return v11;
}

- (_TtC7SwiftUI28RBDisplayListDecoderDelegate)init
{
  result = (_TtC7SwiftUI28RBDisplayListDecoderDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI28RBDisplayListDecoderDelegate_decoder);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end