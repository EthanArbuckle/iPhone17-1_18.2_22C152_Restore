@interface TextEffectsRenderer
- (BOOL)fragmentsValid;
- (CGPoint)convertPointFromRenderSpace:(CGPoint)a3;
- (CGPoint)convertPointToTextAnimationsCoordinateSpace:(CGPoint)a3;
- (CGRect)customTextBounds;
- (NSCustomTextRenderingDelegate)delegate;
- (_NSCustomTextRenderingDisplayLink)externalDisplayLink;
- (_TtC7SwiftUI19TextEffectsRenderer)init;
- (double)contentsScale;
- (id)animatorForTextAnimation:(id)a3;
- (id)animatorForTextAnimation:(id)a3 notify:(id)a4;
- (void)beginLayout;
- (void)didLayoutFragment:(id)a3;
- (void)endLayoutWithConsumer:(id)a3;
- (void)enumerateTextSegmentsInRange:(id)a3 type:(int64_t)a4 options:(unint64_t)a5 textLayoutManager:(id)a6 usingBlock:(id)a7;
- (void)invalidateTemporaryAttributesInRange:(id)a3;
- (void)postLayoutNotify;
- (void)preLayoutNotify;
- (void)setContentsScale:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalDisplayLink:(id)a3;
- (void)setNeedsDisplay;
@end

@implementation TextEffectsRenderer

- (NSCustomTextRenderingDelegate)delegate
{
  v2 = (void *)MEMORY[0x24C527E00]((char *)self + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_delegate, a2);

  return (NSCustomTextRenderingDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (double)contentsScale
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_contentsScale);
}

- (void)setContentsScale:(double)a3
{
  double v3 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_contentsScale);
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_contentsScale) = a3;
  v4 = self;
  TextEffectsRenderer.contentsScale.didset(v3);
}

- (_TtC7SwiftUI19TextEffectsRenderer)init
{
  return (_TtC7SwiftUI19TextEffectsRenderer *)TextEffectsRenderer.init()();
}

- (void).cxx_destruct
{
  outlined destroy of weak GestureGraphDelegate?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_delegate);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)preLayoutNotify
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_notifyFlags) = 1;
}

- (void)postLayoutNotify
{
  v2 = self;
  TextEffectsRenderer.postLayoutNotify()();
}

- (void)beginLayout
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_updatedFragments);
  swift_beginAccess();
  void *v2 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
}

- (void)didLayoutFragment:(id)a3
{
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19TextEffectsRenderer_updatedFragments);
  swift_beginAccess();
  id v6 = a3;
  v7 = self;
  MEMORY[0x24C522D60]();
  if (*(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
}

- (void)endLayoutWithConsumer:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  specialized TextEffectsRenderer.endLayout(with:)((char *)v5, v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)setNeedsDisplay
{
  v2 = self;
  TextEffectsRenderer.setNeedsDisplay()();
}

- (CGRect)customTextBounds
{
  v2 = self;
  double v3 = TextEffectsRenderer.customTextBounds.getter();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (_NSCustomTextRenderingDisplayLink)externalDisplayLink
{
  v2 = (void *)swift_unknownObjectRetain();

  return (_NSCustomTextRenderingDisplayLink *)v2;
}

- (void)setExternalDisplayLink:(id)a3
{
  swift_unknownObjectRetain();
  double v5 = self;
  specialized TextEffectsRenderer.externalDisplayLink.setter((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (BOOL)fragmentsValid
{
  v2 = self;
  BOOL v3 = TextEffectsRenderer.fragmentsValid.getter();

  return v3;
}

- (void)enumerateTextSegmentsInRange:(id)a3 type:(int64_t)a4 options:(unint64_t)a5 textLayoutManager:(id)a6 usingBlock:(id)a7
{
  double v12 = _Block_copy(a7);
  v16[2] = v12;
  id v13 = a3;
  id v14 = a6;
  v15 = self;
  TextEffectsRenderer.enumerateTextSegments(in:type:options:textLayoutManager:using:)(v13, a4, a5, v14, (uint64_t)partial apply for thunk for @callee_unowned @convention(block) (@unowned NSTextRange?, @unowned CGRect, @unowned CGFloat, @unowned NSTextContainer) -> (@unowned ObjCBool), (uint64_t)v16);
  _Block_release(v12);
}

- (void)invalidateTemporaryAttributesInRange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  TextEffectsRenderer.invalidateTemporaryAttributes(in:)((NSTextRange)v4);
}

- (CGPoint)convertPointFromRenderSpace:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v5 = self;
  CGPoint v6 = TextEffectsRenderer.convertFromRenderSpace(_:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

  double v7 = v6.x;
  double v8 = v6.y;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

- (CGPoint)convertPointToTextAnimationsCoordinateSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = self;
  TextEffectsRenderer._convertToRenderSpace(_:textRange:)(0, x, y);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (id)animatorForTextAnimation:(id)a3
{
  type metadata accessor for AnyTextAnimation();
  BOOL v3 = (void *)swift_dynamicCastClass();
  if (v3) {
    BOOL v3 = TextEffectsAnimationController.animator(for:)((uint64_t)v3);
  }

  return v3;
}

- (id)animatorForTextAnimation:(id)a3 notify:(id)a4
{
  double v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  type metadata accessor for AnyTextAnimation();
  uint64_t v7 = swift_dynamicCastClass();
  if (v7)
  {
    double v8 = (char *)v7;
    swift_unknownObjectRetain();
    double v9 = self;
    id v10 = TextEffectsAnimationController.animator(for:with:)(v8, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned _NSTextAnimator) -> (), v6);
  }
  else
  {
    swift_unknownObjectRetain();
    id v10 = 0;
  }
  swift_release();
  swift_unknownObjectRelease();

  return v10;
}

@end