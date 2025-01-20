@interface MFPageViewController
- (BOOL)_canShowWhileLocked;
- (_TtC16MagnifierSupport20MFPageViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport20MFPageViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5;
@end

@implementation MFPageViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport20MFPageViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a5)
  {
    type metadata accessor for OptionsKey(0);
    sub_235669ED4(&qword_26880EE10, type metadata accessor for OptionsKey);
    sub_235949978();
    a5 = (id)sub_235949968();
    swift_bridgeObjectRelease();
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(MFPageViewController *)&v12 initWithTransitionStyle:a3 navigationOrientation:a4 options:a5];

  return v10;
}

- (_TtC16MagnifierSupport20MFPageViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(MFPageViewController *)&v5 initWithCoder:a3];
}

@end