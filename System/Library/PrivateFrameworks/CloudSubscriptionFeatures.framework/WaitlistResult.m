@interface WaitlistResult
+ (BOOL)supportsSecureCoding;
- (NSArray)featureIDs;
- (NSString)ticket;
- (_TtC25CloudSubscriptionFeatures12TicketStatus)status;
- (_TtC25CloudSubscriptionFeatures14WaitlistResult)init;
- (_TtC25CloudSubscriptionFeatures14WaitlistResult)initWithCoder:(id)a3;
- (_TtC25CloudSubscriptionFeatures14WaitlistResult)initWithTicket:(id)a3 status:(id)a4 featureIDs:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WaitlistResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)ticket
{
  if (*(void *)&self->ticket[OBJC_IVAR____TtC25CloudSubscriptionFeatures14WaitlistResult_ticket])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A8D59BC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (_TtC25CloudSubscriptionFeatures12TicketStatus)status
{
  return (_TtC25CloudSubscriptionFeatures12TicketStatus *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                  + OBJC_IVAR____TtC25CloudSubscriptionFeatures14WaitlistResult_status));
}

- (NSArray)featureIDs
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A8D59D40();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC25CloudSubscriptionFeatures14WaitlistResult)initWithTicket:(id)a3 status:(id)a4 featureIDs:(id)a5
{
  if (a3)
  {
    uint64_t v7 = sub_1A8D59BF0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  v10 = (objc_class *)sub_1A8D59D50();
  v11 = (uint64_t *)((char *)self + OBJC_IVAR____TtC25CloudSubscriptionFeatures14WaitlistResult_ticket);
  uint64_t *v11 = v7;
  v11[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC25CloudSubscriptionFeatures14WaitlistResult_status) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC25CloudSubscriptionFeatures14WaitlistResult_featureIDs) = v10;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for WaitlistResult();
  id v12 = a4;
  return [(WaitlistResult *)&v14 init];
}

- (_TtC25CloudSubscriptionFeatures14WaitlistResult)initWithCoder:(id)a3
{
  return (_TtC25CloudSubscriptionFeatures14WaitlistResult *)WaitlistResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A8CB58C4(v4);
}

- (_TtC25CloudSubscriptionFeatures14WaitlistResult)init
{
  result = (_TtC25CloudSubscriptionFeatures14WaitlistResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end