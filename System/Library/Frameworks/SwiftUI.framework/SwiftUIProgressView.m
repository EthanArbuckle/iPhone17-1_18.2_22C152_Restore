@interface SwiftUIProgressView
- (SwiftUIProgressView)initWithCoder:(id)a3;
- (SwiftUIProgressView)initWithFrame:(CGRect)a3;
@end

@implementation SwiftUIProgressView

- (SwiftUIProgressView)initWithFrame:(CGRect)a3
{
  return (SwiftUIProgressView *)@objc LinearUIKitProgressView.Base.SwiftUIProgressView.init(frame:)(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for LinearUIKitProgressView.Base.SwiftUIProgressView);
}

- (SwiftUIProgressView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LinearUIKitProgressView.Base.SwiftUIProgressView();
  return [(SwiftUIProgressView *)&v5 initWithCoder:a3];
}

@end