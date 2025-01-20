@interface SoundsSettings
+ (_TtC23SoundAndHapticsControls14SoundsSettings)defaultState;
- (BOOL)showInStatusBar;
- (BOOL)silentMode;
- (_TtC23SoundAndHapticsControls14SoundsSettings)init;
- (int64_t)hapticsOption;
- (void)setHapticsOption:(int64_t)a3;
- (void)setShowInStatusBar:(BOOL)a3;
- (void)setSilentMode:(BOOL)a3;
@end

@implementation SoundsSettings

+ (_TtC23SoundAndHapticsControls14SoundsSettings)defaultState
{
  if (qword_100020320 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100020CE0;

  return (_TtC23SoundAndHapticsControls14SoundsSettings *)v2;
}

- (BOOL)silentMode
{
  swift_getKeyPath();
  sub_10000B35C();
  v3 = self;
  sub_100015230();
  swift_release();
  id v4 = [self sharedInstance];
  if (v4)
  {
    v5 = v4;
    unsigned __int8 v6 = [v4 getSilentMode];

    LOBYTE(v4) = v6;
  }
  else
  {
    __break(1u);
  }
  return (char)v4;
}

- (void)setSilentMode:(BOOL)a3
{
  swift_getKeyPath();
  sub_10000B35C();
  id v4 = self;
  sub_100015220();

  swift_release();
}

- (BOOL)showInStatusBar
{
  v2 = self;
  BOOL v3 = sub_100013D98();

  return v3;
}

- (void)setShowInStatusBar:(BOOL)a3
{
  swift_getObjectType();
  swift_getKeyPath();
  sub_10000B35C();
  id v4 = self;
  sub_100015220();

  swift_release();
}

- (int64_t)hapticsOption
{
  v2 = self;
  int64_t v3 = sub_100013BA8();

  return v3;
}

- (void)setHapticsOption:(int64_t)a3
{
  swift_getObjectType();
  swift_getKeyPath();
  sub_10000B35C();
  id v4 = self;
  sub_100015220();

  swift_release();
}

- (_TtC23SoundAndHapticsControls14SoundsSettings)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_100015240();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(SoundsSettings *)&v5 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC23SoundAndHapticsControls14SoundsSettings___observationRegistrar;
  uint64_t v3 = sub_100015250();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end