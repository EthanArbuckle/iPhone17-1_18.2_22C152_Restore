@interface UIKitAccessibilityLinkRotorBridge.LinkElement
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (NSString)accessibilityLabel;
- (_TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement)init;
- (_TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement)initWithAccessibilityContainer:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation UIKitAccessibilityLinkRotorBridge.LinkElement

- (CGRect)accessibilityFrame
{
  uint64_t v3 = MEMORY[0x18C119DF0]((char *)self+ OBJC_IVAR____TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement_node, a2);
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement_range);
    uint64_t v6 = *(void *)((char *)&self->super.super._responderFlags
                   + OBJC_IVAR____TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement_range);
    v7 = self;
    objc_msgSend(v4, sel__accessibilityBoundsForRange_, v5, v6);
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v13 = 0.0;
    double v15 = 0.0;
    double v9 = 0.0;
    double v11 = 0.0;
  }
  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4FB2568];
}

- (NSString)accessibilityLabel
{
  v2 = self;
  uint64_t v3 = UIKitAccessibilityLinkRotorBridge.LinkElement.accessibilityLabel.getter();
  uint64_t v5 = v4;

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C115780](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSString *)v6;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = self;
  double v3 = UIKitAccessibilityLinkRotorBridge.LinkElement.accessibilityActivationPoint.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (_TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement)initWithAccessibilityContainer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  CGPoint result = (_TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement)init
{
  CGPoint result = (_TtCC7SwiftUI33UIKitAccessibilityLinkRotorBridgeP33_1C25C4B203EEAC6A19839AC5BDB6A34511LinkElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end