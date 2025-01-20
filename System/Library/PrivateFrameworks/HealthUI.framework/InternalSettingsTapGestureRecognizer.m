@interface InternalSettingsTapGestureRecognizer
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC8HealthUI36InternalSettingsTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
@end

@implementation InternalSettingsTapGestureRecognizer

- (_TtC8HealthUI36InternalSettingsTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1E0ECD760();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC8HealthUI36InternalSettingsTapGestureRecognizer *)InternalSettingsTapGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = _s8HealthUI36InternalSettingsTapGestureRecognizerC07gestureG0_13shouldReceiveSbSo09UIGestureG0C_So7UITouchCtF_0(v6, v7);

  return v9;
}

@end