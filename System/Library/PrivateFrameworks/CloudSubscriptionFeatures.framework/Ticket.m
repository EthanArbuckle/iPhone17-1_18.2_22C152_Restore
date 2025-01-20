@interface Ticket
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (NSString)ticket;
- (_TtC25CloudSubscriptionFeatures12TicketStatus)status;
- (_TtC25CloudSubscriptionFeatures6Ticket)init;
- (_TtC25CloudSubscriptionFeatures6Ticket)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation Ticket

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v2 = self;
  sub_1A8D062B0();

  v3 = (void *)sub_1A8D59BC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)ticket
{
  if (*(void *)&self->ticket[OBJC_IVAR____TtC25CloudSubscriptionFeatures6Ticket_ticket])
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
                                                                                                  + OBJC_IVAR____TtC25CloudSubscriptionFeatures6Ticket_status));
}

- (_TtC25CloudSubscriptionFeatures6Ticket)initWithCoder:(id)a3
{
  return (_TtC25CloudSubscriptionFeatures6Ticket *)Ticket.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A8D06AB4(v4);
}

- (_TtC25CloudSubscriptionFeatures6Ticket)init
{
  result = (_TtC25CloudSubscriptionFeatures6Ticket *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC25CloudSubscriptionFeatures6Ticket_status);
}

@end