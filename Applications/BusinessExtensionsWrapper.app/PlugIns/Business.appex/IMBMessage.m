@interface IMBMessage
- (_TtC8Business10IMBMessage)initWithData:(id)a3 url:(id)a4 messageGUID:(id)a5 isFromMe:(BOOL)a6;
- (id)initFromOriginalMessage:(id)a3 rootKey:(id)a4 rootObject:(id)a5 receivedMessage:(id)a6 replyMessage:(id)a7;
- (id)makeRootObjectWithMessageData:(id)a3 dictionary:(id)a4 imageDictionary:(id)a5 version:(int64_t)a6;
@end

@implementation IMBMessage

- (id)makeRootObjectWithMessageData:(id)a3 dictionary:(id)a4 imageDictionary:(id)a5 version:(int64_t)a6
{
  uint64_t v10 = sub_1000BBA28();
  if (a5)
  {
    sub_10004103C();
    a5 = (id)sub_1000BBA28();
  }
  id v11 = a3;
  v12 = self;
  v13 = (void *)sub_1000403A0(v11, v10, (uint64_t)a5, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

- (_TtC8Business10IMBMessage)initWithData:(id)a3 url:(id)a4 messageGUID:(id)a5 isFromMe:(BOOL)a6
{
  uint64_t v10 = sub_100005D74((uint64_t *)&unk_1000FD480);
  __chkstk_darwin(v10 - 8, v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    id v14 = a4;
    id v15 = a5;
    id v16 = a3;
    a3 = (id)sub_1000BB188();
    unint64_t v18 = v17;

    if (a4)
    {
LABEL_3:
      sub_1000BB0F8();

      uint64_t v19 = sub_1000BB138();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v13, 0, 1, v19);
      goto LABEL_6;
    }
  }
  else
  {
    id v20 = a4;
    id v21 = a5;
    unint64_t v18 = 0xF000000000000000;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = sub_1000BB138();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v13, 1, 1, v22);
LABEL_6:
  if (a5)
  {
    uint64_t v23 = sub_1000BBAC8();
    uint64_t v25 = v24;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
  }
  return (_TtC8Business10IMBMessage *)sub_100040B08((uint64_t)a3, v18, (uint64_t)v13, v23, v25, a6);
}

- (id)initFromOriginalMessage:(id)a3 rootKey:(id)a4 rootObject:(id)a5 receivedMessage:(id)a6 replyMessage:(id)a7
{
  sub_1000BBAC8();
  id v12 = a3;
  swift_unknownObjectRetain();
  id v13 = a6;
  id v14 = a7;
  NSString v15 = sub_1000BBA88();
  swift_bridgeObjectRelease();
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for IMBMessage();
  id v16 = [(IMBMessage *)&v18 initFromOriginalMessage:v12 rootKey:v15 rootObject:a5 receivedMessage:v13 replyMessage:v14];

  swift_unknownObjectRelease();
  return v16;
}

@end