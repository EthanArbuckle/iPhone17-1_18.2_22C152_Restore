@interface PriorityMessageListHeaderFooterIdentifier
- (_TtC6MailUIP33_07A1850E5F3C7E70BBD82C37C425483041PriorityMessageListHeaderFooterIdentifier)initWithCoder:(id)a3;
- (_TtC6MailUIP33_07A1850E5F3C7E70BBD82C37C425483041PriorityMessageListHeaderFooterIdentifier)initWithRepresentedObjectID:(id)a3;
- (id)initAsEphemeralID:(BOOL)a3;
- (id)initAsEphemeralID:(BOOL)a3 representedObjectID:(id)a4;
@end

@implementation PriorityMessageListHeaderFooterIdentifier

- (_TtC6MailUIP33_07A1850E5F3C7E70BBD82C37C425483041PriorityMessageListHeaderFooterIdentifier)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DDEB5268();
}

- (id)initAsEphemeralID:(BOOL)a3
{
  return (id)sub_1DDEB533C();
}

- (_TtC6MailUIP33_07A1850E5F3C7E70BBD82C37C425483041PriorityMessageListHeaderFooterIdentifier)initWithRepresentedObjectID:(id)a3
{
  return (_TtC6MailUIP33_07A1850E5F3C7E70BBD82C37C425483041PriorityMessageListHeaderFooterIdentifier *)sub_1DDEB5490();
}

- (id)initAsEphemeralID:(BOOL)a3 representedObjectID:(id)a4
{
  return (id)sub_1DDEB55E8();
}

- (void).cxx_destruct
{
  uint64_t v3 = OBJC_IVAR____TtC6MailUIP33_07A1850E5F3C7E70BBD82C37C425483041PriorityMessageListHeaderFooterIdentifier_identifier;
  uint64_t v2 = sub_1DDEECE78();
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v3);
}

@end