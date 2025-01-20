@interface UIHostingKeyboardTrackingElement
- (_TtC7SwiftUI32UIHostingKeyboardTrackingElement)init;
- (void)keyboardIsChangingOffset:(UIOffset)a3;
- (void)keyboardIsChangingSize:(CGSize)a3;
@end

@implementation UIHostingKeyboardTrackingElement

- (void)keyboardIsChangingSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  UIHostingKeyboardTrackingElement.keyboardIsChanging(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));
}

- (void)keyboardIsChangingOffset:(UIOffset)a3
{
  CGFloat vertical = a3.vertical;
  CGFloat horizontal = a3.horizontal;
  v5 = self;
  UIHostingKeyboardTrackingElement.keyboardIsChanging(_:)((UIOffset)__PAIR128__(*(unint64_t *)&vertical, *(unint64_t *)&horizontal));
}

- (_TtC7SwiftUI32UIHostingKeyboardTrackingElement)init
{
  result = (_TtC7SwiftUI32UIHostingKeyboardTrackingElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end