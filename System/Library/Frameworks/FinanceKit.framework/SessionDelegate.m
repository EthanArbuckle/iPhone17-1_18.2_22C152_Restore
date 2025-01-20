@interface SessionDelegate
- (_TtC10FinanceKitP33_82FCA57B9514272BE863607579F9568E15SessionDelegate)init;
- (_TtC10FinanceKitP33_BBE0122A3E1307DE2D47D62BE8CA3C6615SessionDelegate)init;
- (_TtC10FinanceKitP33_D792C1975BCD83E251CC308B2A7B211715SessionDelegate)init;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
@end

@implementation SessionDelegate

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_2438DC7E8(a4);
}

- (_TtC10FinanceKitP33_82FCA57B9514272BE863607579F9568E15SessionDelegate)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC10FinanceKitP33_82FCA57B9514272BE863607579F9568E15SessionDelegate_sessionDidBecomeInvalid) = 0;
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC10FinanceKitP33_82FCA57B9514272BE863607579F9568E15SessionDelegate_sessionDidBecomeInvalidHandler);
  v4 = (objc_class *)type metadata accessor for SessionDelegate();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(SessionDelegate *)&v6 init];
}

- (void).cxx_destruct
{
  sub_243379EA8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10FinanceKitP33_D792C1975BCD83E251CC308B2A7B211715SessionDelegate_sessionDidBecomeInvalidHandler));
}

- (_TtC10FinanceKitP33_BBE0122A3E1307DE2D47D62BE8CA3C6615SessionDelegate)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC10FinanceKitP33_BBE0122A3E1307DE2D47D62BE8CA3C6615SessionDelegate_sessionDidBecomeInvalid) = 0;
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC10FinanceKitP33_BBE0122A3E1307DE2D47D62BE8CA3C6615SessionDelegate_sessionDidBecomeInvalidHandler);
  v4 = (objc_class *)_s10FinanceKit15SessionDelegateCMa_0();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(SessionDelegate *)&v6 init];
}

- (_TtC10FinanceKitP33_D792C1975BCD83E251CC308B2A7B211715SessionDelegate)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC10FinanceKitP33_D792C1975BCD83E251CC308B2A7B211715SessionDelegate_sessionDidBecomeInvalid) = 0;
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC10FinanceKitP33_D792C1975BCD83E251CC308B2A7B211715SessionDelegate_sessionDidBecomeInvalidHandler);
  v4 = (objc_class *)_s10FinanceKit15SessionDelegateCMa_1();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(SessionDelegate *)&v6 init];
}

@end