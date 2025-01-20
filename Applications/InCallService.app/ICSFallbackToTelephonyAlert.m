@interface ICSFallbackToTelephonyAlert
- (ICSFallbackToTelephonyAlert)init;
- (ICSFallbackToTelephonyAlert)initWithDisconnectedCall:(id)a3;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)message;
- (NSString)title;
- (id)cancelAction;
- (void)alternateResponse;
- (void)defaultResponse;
- (void)setCancelAction:(id)a3;
- (void)show;
@end

@implementation ICSFallbackToTelephonyAlert

- (id)cancelAction
{
  uint64_t v2 = sub_100141E24();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_10012EDF4;
    v6[3] = &unk_1002D2310;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCancelAction:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_10011F72C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_100141F04((uint64_t)v4, v5);
}

- (ICSFallbackToTelephonyAlert)initWithDisconnectedCall:(id)a3
{
  return (ICSFallbackToTelephonyAlert *)sub_100141F24(a3);
}

- (NSString)title
{
  return (NSString *)sub_1001424F8(self, (uint64_t)a2, (void (*)(void))sub_100142310);
}

- (NSString)message
{
  return (NSString *)sub_1001424F8(self, (uint64_t)a2, (void (*)(void))sub_100142408);
}

- (NSString)defaultButtonTitle
{
  return (NSString *)sub_1001424F8(self, (uint64_t)a2, (void (*)(void))sub_100142578);
}

- (NSString)alternateButtonTitle
{
  uint64_t v2 = self;
  sub_1001426C0();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)defaultResponse
{
  uint64_t v2 = self;
  sub_10014273C();
}

- (void)alternateResponse
{
  uint64_t v2 = self;
  sub_100142A74();
}

- (void)show
{
  uint64_t v2 = self;
  sub_100142B28();
}

- (ICSFallbackToTelephonyAlert)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  uint64_t v3 = *(void *)&self->TPAlert_opaque[OBJC_IVAR___ICSFallbackToTelephonyAlert_cancelAction];

  sub_100142E2C(v3);
}

@end