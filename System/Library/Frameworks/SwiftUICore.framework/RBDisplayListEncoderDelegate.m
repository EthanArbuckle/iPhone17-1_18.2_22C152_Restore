@interface RBDisplayListEncoderDelegate
- (BOOL)shouldEncodeFontSubset:(CGFont *)a3;
- (RBEncoderSet)encoderSet;
- (_TtC7SwiftUI28RBDisplayListEncoderDelegate)init;
- (id)encodedCGFontData:(CGFont *)a3 error:(id *)a4;
- (id)encodedFontData:(id)a3 cgFont:(CGFont *)a4 error:(id *)a5;
- (id)encodedImageData:(id)a3 error:(id *)a4;
@end

@implementation RBDisplayListEncoderDelegate

- (RBEncoderSet)encoderSet
{
  v2 = (void *)ProtobufEncoder.rbEncoderSet.getter();

  return (RBEncoderSet *)v2;
}

- (id)encodedImageData:(id)a3 error:(id *)a4
{
  var1 = a3.var1;
  uint64_t v5 = *(void *)&a3.var0;
  v6 = self;
  uint64_t v7 = specialized static ProtobufEncoder.encoding(_:)((uint64_t)v6, v5, (uint64_t)var1);
  unint64_t v9 = v8;

  v10.super.isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v7, v9);

  return v10.super.isa;
}

- (id)encodedCGFontData:(CGFont *)a3 error:(id *)a4
{
  uint64_t v5 = self;
  v6 = a3;
  uint64_t v7 = specialized static ProtobufEncoder.encoding(_:)((uint64_t)v5, v6);
  unint64_t v9 = v8;

  v10.super.isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v7, v9);

  return v10.super.isa;
}

- (BOOL)shouldEncodeFontSubset:(CGFont *)a3
{
  ProtobufEncoder.archiveOptions.getter(v4);
  return (v4[0] & 0x14) != 4;
}

- (id)encodedFontData:(id)a3 cgFont:(CGFont *)a4 error:(id *)a5
{
  id v7 = a3;
  unint64_t v8 = a4;
  unint64_t v9 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  v13 = v9;
  outlined copy of Data._Representation(v10, v12);
  uint64_t v14 = specialized static ProtobufEncoder.encoding(_:)((uint64_t)v13, v10, v12);
  unint64_t v16 = v15;
  outlined consume of Data._Representation(v10, v12);

  outlined consume of Data._Representation(v10, v12);
  v17.super.isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v14, v16);

  return v17.super.isa;
}

- (_TtC7SwiftUI28RBDisplayListEncoderDelegate)init
{
  result = (_TtC7SwiftUI28RBDisplayListEncoderDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end