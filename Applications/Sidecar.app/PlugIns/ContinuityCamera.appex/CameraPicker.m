@interface CameraPicker
- (BOOL)_canShowWhileLocked;
- (_TtC16ContinuityCamera12CameraPicker)init;
- (_TtC16ContinuityCamera12CameraPicker)initWithCoder:(id)a3;
- (int64_t)sourceType;
- (void)_setValue:(id)a3 forProperty:(id)a4;
- (void)setSourceType:(int64_t)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CameraPicker

- (_TtC16ContinuityCamera12CameraPicker)init
{
  return (_TtC16ContinuityCamera12CameraPicker *)sub_1000073EC();
}

- (_TtC16ContinuityCamera12CameraPicker)initWithCoder:(id)a3
{
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  if (!a3)
  {
    memset(v13, 0, sizeof(v13));
    id v11 = a4;
    v12 = self;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  id v6 = a4;
  v7 = self;
  swift_unknownObjectRetain();
  sub_100009640();
  swift_unknownObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = sub_100009500();
  v10 = v9;

LABEL_6:
  sub_100007754((uint64_t)v13, v8, v10);

  swift_bridgeObjectRelease();
  sub_1000084E8((uint64_t)v13);
}

- (int64_t)sourceType
{
  return 1;
}

- (void)setSourceType:(int64_t)a3
{
  v3 = self;
  sub_100007A44();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100007A84(a3);
}

@end