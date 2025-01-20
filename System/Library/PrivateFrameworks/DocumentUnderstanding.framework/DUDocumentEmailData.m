@interface DUDocumentEmailData
- (BOOL)isEqual:(id)a3;
- (NSArray)bccEmails;
- (NSArray)bccNames;
- (NSArray)ccEmails;
- (NSArray)ccNames;
- (NSArray)recipientEmails;
- (NSArray)recipientNames;
- (NSDate)dateReceived;
- (NSDictionary)headers;
- (NSString)senderDomain;
- (NSString)senderEmail;
- (NSString)senderName;
- (NSString)subject;
- (NSString)text;
- (_TtC21DocumentUnderstanding19DUDocumentEmailData)init;
- (_TtC21DocumentUnderstanding19DUDocumentEmailData)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBccEmails:(id)a3;
- (void)setBccNames:(id)a3;
- (void)setCcEmails:(id)a3;
- (void)setCcNames:(id)a3;
- (void)setDateReceived:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setRecipientEmails:(id)a3;
- (void)setRecipientNames:(id)a3;
- (void)setSenderDomain:(id)a3;
- (void)setSenderEmail:(id)a3;
- (void)setSenderName:(id)a3;
- (void)setSubject:(id)a3;
- (void)setText:(id)a3;
@end

@implementation DUDocumentEmailData

- (NSString)subject
{
  return (NSString *)sub_236821BC0((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocumentEmailData.subject.getter);
}

- (void)setSubject:(id)a3
{
}

- (NSString)senderName
{
  return (NSString *)sub_236821BC0((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocumentEmailData.senderName.getter);
}

- (void)setSenderName:(id)a3
{
}

- (NSString)senderEmail
{
  return (NSString *)sub_236821BC0((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocumentEmailData.senderEmail.getter);
}

- (void)setSenderEmail:(id)a3
{
}

- (NSString)senderDomain
{
  return (NSString *)sub_236821BC0((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocumentEmailData.senderDomain.getter);
}

- (void)setSenderDomain:(id)a3
{
}

- (NSArray)recipientNames
{
  return (NSArray *)sub_236821EE4((uint64_t)self, (uint64_t)a2, DUDocumentEmailData.recipientNames.getter);
}

- (void)setRecipientNames:(id)a3
{
}

- (NSArray)recipientEmails
{
  return (NSArray *)sub_236821EE4((uint64_t)self, (uint64_t)a2, DUDocumentEmailData.recipientEmails.getter);
}

- (void)setRecipientEmails:(id)a3
{
}

- (NSArray)ccNames
{
  return (NSArray *)sub_236821EE4((uint64_t)self, (uint64_t)a2, DUDocumentEmailData.ccNames.getter);
}

- (void)setCcNames:(id)a3
{
}

- (NSArray)ccEmails
{
  return (NSArray *)sub_236821EE4((uint64_t)self, (uint64_t)a2, DUDocumentEmailData.ccEmails.getter);
}

- (void)setCcEmails:(id)a3
{
}

- (NSArray)bccNames
{
  return (NSArray *)sub_236821EE4((uint64_t)self, (uint64_t)a2, DUDocumentEmailData.bccNames.getter);
}

- (void)setBccNames:(id)a3
{
}

- (NSArray)bccEmails
{
  return (NSArray *)sub_236821EE4((uint64_t)self, (uint64_t)a2, DUDocumentEmailData.bccEmails.getter);
}

- (void)setBccEmails:(id)a3
{
}

- (NSDate)dateReceived
{
  uint64_t v2 = sub_2367B7DBC((uint64_t *)&off_26AD89548);
  MEMORY[0x270FA5388](v2 - 8);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  DUDocumentEmailData.dateReceived.getter((uint64_t)v4);
  uint64_t v5 = sub_23697A2DC();
  v6 = 0;
  if (sub_2367B85F8((uint64_t)v4, 1, v5) != 1)
  {
    v6 = (void *)sub_23697A29C();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  return (NSDate *)v6;
}

- (void)setDateReceived:(id)a3
{
  uint64_t v5 = sub_2367B7DBC((uint64_t *)&off_26AD89548);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_23697A2BC();
    uint64_t v8 = sub_23697A2DC();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = sub_23697A2DC();
    uint64_t v9 = 1;
  }
  sub_2367B7028((uint64_t)v7, v9, 1, v8);
  v10 = self;
  DUDocumentEmailData.dateReceived.setter((uint64_t)v7);
}

- (NSDictionary)headers
{
  if (DUDocumentEmailData.headers.getter())
  {
    uint64_t v2 = (void *)sub_23697AE5C();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (void)setHeaders:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_23697AE7C();
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = self;
  DUDocumentEmailData.headers.setter(v4);
}

- (NSString)text
{
  return (NSString *)sub_236821BC0((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocumentEmailData.text.getter);
}

- (void)setText:(id)a3
{
}

- (_TtC21DocumentUnderstanding19DUDocumentEmailData)init
{
  return (_TtC21DocumentUnderstanding19DUDocumentEmailData *)DUDocumentEmailData.init()();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  DUDocumentEmailData.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding19DUDocumentEmailData)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding19DUDocumentEmailData *)DUDocumentEmailData.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  DUDocumentEmailData.copy(with:)(v6);

  sub_2367CBEE8(v6, v6[3]);
  id v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_23697B5DC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    uint64_t v5 = self;
  }
  DUDocumentEmailData.isEqual(_:)();
  char v7 = v6;

  sub_2367BAA28((uint64_t)v9, (uint64_t *)&unk_26AD8BC30);
  return v7 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2367BAA28((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_dateReceived, (uint64_t *)&off_26AD89548);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end