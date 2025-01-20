@interface QuickReplyContent
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSArray)rowHeights;
- (NSArray)rows;
- (NSArray)strings;
- (NSDictionary)indicesForReply;
- (NSString)debugDescription;
- (_TtC7ChatKit17QuickReplyContent)init;
- (_TtC7ChatKit17QuickReplyContent)initWithReplies:(id)a3 maxWidth:(double)a4 transcriptHeight:(double)a5;
- (double)transcriptHeight;
- (int64_t)indexForReply:(id)a3;
- (int64_t)numReplies;
@end

@implementation QuickReplyContent

- (CGSize)size
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit17QuickReplyContent_size);
  double v3 = *(double *)&self->size[OBJC_IVAR____TtC7ChatKit17QuickReplyContent_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSArray)rows
{
  sub_18F7B6CA0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E922B5E8);
  double v2 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (NSArray)rowHeights
{
  sub_18F7B6CA0();
  double v2 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (NSDictionary)indicesForReply
{
  sub_18F7B6CA0();
  double v2 = (void *)sub_18F7B9640();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (int64_t)numReplies
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit17QuickReplyContent_numReplies);
}

- (double)transcriptHeight
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit17QuickReplyContent_transcriptHeight);
}

- (NSString)debugDescription
{
  double v2 = self;
  sub_18F4E7054();

  double v3 = (void *)sub_18F7B97A0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC7ChatKit17QuickReplyContent)initWithReplies:(id)a3 maxWidth:(double)a4 transcriptHeight:(double)a5
{
  uint64_t v7 = sub_18F7B99C0();
  return (_TtC7ChatKit17QuickReplyContent *)QuickReplyContent.init(replies:maxWidth:transcriptHeight:)(v7, a4, a5);
}

- (int64_t)indexForReply:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18F7B97E0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  int64_t v8 = sub_18F4E7C84(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (NSArray)strings
{
  double v2 = self;
  sub_18F4E7DD4();

  double v3 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_18F7BA320();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_18F4E7E60((uint64_t)v8);

  sub_18EF27FE8((uint64_t)v8, (uint64_t *)&unk_1E922C090);
  return v6 & 1;
}

- (_TtC7ChatKit17QuickReplyContent)init
{
  CGSize result = (_TtC7ChatKit17QuickReplyContent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end