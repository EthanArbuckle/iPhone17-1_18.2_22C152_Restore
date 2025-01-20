@interface DUDisplayInfo
- (BOOL)isOnScreen;
- (CGPoint)absoluteOriginOnScreen;
- (CGRect)frameInWindow;
- (_TtC21DocumentUnderstanding13DUDisplayInfo)init;
- (_TtC21DocumentUnderstanding13DUDisplayInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAbsoluteOriginOnScreen:(CGPoint)a3;
- (void)setFrameInWindow:(CGRect)a3;
- (void)setIsOnScreen:(BOOL)a3;
@end

@implementation DUDisplayInfo

- (CGRect)frameInWindow
{
  double v2 = DUDisplayInfo.frameInWindow.getter();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrameInWindow:(CGRect)a3
{
}

- (CGPoint)absoluteOriginOnScreen
{
  double v2 = DUDisplayInfo.absoluteOriginOnScreen.getter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setAbsoluteOriginOnScreen:(CGPoint)a3
{
}

- (BOOL)isOnScreen
{
  return DUDisplayInfo.isOnScreen.getter() & 1;
}

- (void)setIsOnScreen:(BOOL)a3
{
}

- (id)copyWithZone:(void *)a3
{
  double v3 = self;
  DUDisplayInfo.copy(with:)(v6);

  sub_2367CBEE8(v6, (uint64_t)v6[3]);
  double v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = self;
  DUDisplayInfo.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding13DUDisplayInfo)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding13DUDisplayInfo *)DUDisplayInfo.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding13DUDisplayInfo)init
{
  return (_TtC21DocumentUnderstanding13DUDisplayInfo *)DUDisplayInfo.init()();
}

@end