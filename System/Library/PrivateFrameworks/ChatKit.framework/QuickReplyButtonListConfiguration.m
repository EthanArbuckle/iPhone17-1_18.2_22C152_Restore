@interface QuickReplyButtonListConfiguration
- (NSNumber)rowIndex;
- (_TtC7ChatKit33QuickReplyButtonListConfiguration)init;
- (void)setRowIndex:(id)a3;
@end

@implementation QuickReplyButtonListConfiguration

- (NSNumber)rowIndex
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit33QuickReplyButtonListConfiguration_rowIndex);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setRowIndex:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit33QuickReplyButtonListConfiguration_rowIndex);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC7ChatKit33QuickReplyButtonListConfiguration)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit33QuickReplyButtonListConfiguration_rowIndex) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QuickReplyButtonListConfiguration();
  return [(QuickReplyButtonListConfiguration *)&v3 init];
}

- (void).cxx_destruct
{
}

@end