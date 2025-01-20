@interface FISentinelNode
- (BOOL)isFolder;
- (FPItem)fpItem;
- (NSDate)doc_lastUsedDate;
- (NSDate)modificationDate;
- (NSNumber)childItemCount;
- (NSNumber)fileSize;
- (NSString)displayName;
- (NSString)filename;
- (NSString)typeIdentifier;
- (NSURL)fileURL;
- (UTType)contentType;
- (_TtC26DocumentManagerExecutables14FISentinelNode)init;
- (_TtC26DocumentManagerExecutables14FISentinelNode)initWithCoder:(id)a3;
- (id)identifier;
- (id)providerID;
@end

@implementation FISentinelNode

- (_TtC26DocumentManagerExecutables14FISentinelNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FISentinelNode();
  return [(FICustomNode *)&v3 init];
}

- (id)identifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22BE93928();

  return v2;
}

- (NSString)displayName
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (FPItem)fpItem
{
  return (FPItem *)0;
}

- (UTType)contentType
{
  uint64_t v2 = sub_22BE92568();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BE92478();
  v6 = (void *)sub_22BE92418();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (UTType *)v6;
}

- (NSString)typeIdentifier
{
  uint64_t v3 = sub_22BE92568();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  uint64_t v8 = [(FISentinelNode *)v7 contentType];
  sub_22BE92438();

  sub_22BE923A8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v9 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (NSNumber)fileSize
{
  return (NSNumber *)0;
}

- (NSNumber)childItemCount
{
  return (NSNumber *)0;
}

- (id)providerID
{
  swift_beginAccess();
  id v2 = a1;
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_22BE92C98();

  swift_bridgeObjectRelease();

  return v3;
}

- (NSDate)modificationDate
{
  return (NSDate *)0;
}

- (NSDate)doc_lastUsedDate
{
  return (NSDate *)0;
}

- (BOOL)isFolder
{
  return 0;
}

- (NSString)filename
{
  id v2 = (void *)sub_22BE92C98();

  return (NSString *)v2;
}

- (NSURL)fileURL
{
  return (NSURL *)0;
}

- (_TtC26DocumentManagerExecutables14FISentinelNode)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FISentinelNode();
  return [(FISentinelNode *)&v5 initWithCoder:a3];
}

@end