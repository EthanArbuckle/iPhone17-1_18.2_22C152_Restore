@interface MUIHighlightedMessage
- (BOOL)isGeneratedSummary;
- (EMMessageListItem)messageListItem;
- (MUIHighlightedMessage)init;
- (MUIHighlightedMessage)initWithTopLine:(id)a3 isGeneratedSummary:(BOOL)a4 messageListItem:(id)a5;
- (NSAttributedString)topLine;
- (NSString)description;
- (NSString)sender;
- (int64_t)hash;
- (void)setSender:(id)a3;
@end

@implementation MUIHighlightedMessage

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1DDD31BC0();
}

- (NSAttributedString)topLine
{
  swift_getObjectType();
  v3 = self;
  id v6 = sub_1DDE3AC0C();

  return (NSAttributedString *)v6;
}

- (EMMessageListItem)messageListItem
{
  swift_getObjectType();
  v3 = self;
  id v6 = (id)sub_1DDE3ACB0();

  return (EMMessageListItem *)v6;
}

- (BOOL)isGeneratedSummary
{
  swift_getObjectType();
  v3 = self;
  sub_1DDE3AD50();

  return sub_1DDEECF48() & 1;
}

- (NSString)sender
{
  swift_getObjectType();
  v3 = self;
  sub_1DDE3ADFC();

  id v6 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)setSender:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_1DDEEEB78();
  sub_1DDE3AF90(v6, v7);
}

- (MUIHighlightedMessage)initWithTopLine:(id)a3 isGeneratedSummary:(BOOL)a4 messageListItem:(id)a5
{
  swift_getObjectType();
  id v5 = a3;
  swift_unknownObjectRetain();
  char v6 = sub_1DDEECF58();
  return (MUIHighlightedMessage *)sub_1DDE3B998(a3, v6 & 1, (uint64_t)a5);
}

- (int64_t)hash
{
  swift_getObjectType();
  v3 = self;
  id v6 = MUIHighlightedMessage.hash.getter();

  return (int64_t)v6;
}

- (NSString)description
{
  swift_getObjectType();
  v3 = self;
  MUIHighlightedMessage.description.getter();

  id v6 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (MUIHighlightedMessage)init
{
  return (MUIHighlightedMessage *)MUIHighlightedMessage.init()();
}

@end