@interface Analytics
- (_TtC8RoomPlan9Analytics)init;
@end

@implementation Analytics

- (_TtC8RoomPlan9Analytics)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan9Analytics_roomPlanStats) = (Class)MEMORY[0x263F8EE80];
  uint64_t v3 = OBJC_IVAR____TtC8RoomPlan9Analytics_bOptInApple;
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_sharedInstance);
  unsigned __int8 v7 = objc_msgSend(v6, sel_optInApple);

  *((unsigned char *)&self->super.isa + v3) = v7;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for Analytics();
  return [(Analytics *)&v9 init];
}

- (void).cxx_destruct
{
}

@end