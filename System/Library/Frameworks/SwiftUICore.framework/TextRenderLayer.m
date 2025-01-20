@interface TextRenderLayer
- (_TtC7SwiftUI15TextRenderLayer)init;
- (_TtC7SwiftUI15TextRenderLayer)initWithCoder:(id)a3;
- (_TtC7SwiftUI15TextRenderLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
- (void)setNeedsDisplay;
@end

@implementation TextRenderLayer

- (_TtC7SwiftUI15TextRenderLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized TextRenderLayer.init(coder:)();
}

- (_TtC7SwiftUI15TextRenderLayer)initWithLayer:(id)a3
{
  return (_TtC7SwiftUI15TextRenderLayer *)@objc TextLinesLayer.init(layer:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t *))TextRenderLayer.init(layer:));
}

- (void)layoutSublayers
{
  v2 = self;
  TextRenderLayer.layoutSublayers()();
}

- (void)setNeedsDisplay
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI15TextRenderLayer_updateFlags) |= 0x90u;
  [(TextRenderLayer *)self setNeedsLayout];
}

- (_TtC7SwiftUI15TextRenderLayer)init
{
  result = (_TtC7SwiftUI15TextRenderLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectWeakDestroy();

  _sypSgWObTm_1((uint64_t)self + OBJC_IVAR____TtC7SwiftUI15TextRenderLayer_layout, (uint64_t)v5, (unint64_t *)&lazy cache variable for type metadata for TextRenderLayer.Layout?, (uint64_t)&unk_26FA897A8);
  outlined release of TextRenderLayer.Layout?(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of TextRenderLayer.Layout?);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC7SwiftUI15TextRenderLayer_sharedDrawingSegments;
  type metadata accessor for RangeSet<Int>(0, &lazy cache variable for type metadata for RangeSet<Int>, MEMORY[0x263F8D6E0], MEMORY[0x263F8EDA0]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end