@interface SwiftUIActivityIndicatorView
- (SwiftUIActivityIndicatorView)initWithActivityIndicatorStyle:(int64_t)a3;
- (SwiftUIActivityIndicatorView)initWithCoder:(id)a3;
- (SwiftUIActivityIndicatorView)initWithFrame:(CGRect)a3;
@end

@implementation SwiftUIActivityIndicatorView

- (SwiftUIActivityIndicatorView)initWithFrame:(CGRect)a3
{
  return (SwiftUIActivityIndicatorView *)@objc LinearUIKitProgressView.Base.SwiftUIProgressView.init(frame:)(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for CircularUIKitProgressView.SwiftUIActivityIndicatorView);
}

- (SwiftUIActivityIndicatorView)initWithActivityIndicatorStyle:(int64_t)a3
{
  return (SwiftUIActivityIndicatorView *)@objc CircularUIKitProgressView.SwiftUIActivityIndicatorView.init(style:)(self, (uint64_t)a2, a3, (SEL *)&selRef_initWithActivityIndicatorStyle_);
}

- (SwiftUIActivityIndicatorView)initWithCoder:(id)a3
{
  return (SwiftUIActivityIndicatorView *)@objc CircularUIKitProgressView.SwiftUIActivityIndicatorView.init(style:)(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end