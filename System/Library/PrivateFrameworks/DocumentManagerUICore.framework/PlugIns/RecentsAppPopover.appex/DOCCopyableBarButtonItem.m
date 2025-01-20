@interface DOCCopyableBarButtonItem
- (_TtC17RecentsAppPopover24DOCCopyableBarButtonItem)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation DOCCopyableBarButtonItem

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_1002D8224(v6);

  sub_100032F0C(v6, v6[3]);
  v4 = (void *)sub_1004C0830();
  sub_10003D0C0((uint64_t)v6);
  return v4;
}

- (_TtC17RecentsAppPopover24DOCCopyableBarButtonItem)init
{
  v3 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC17RecentsAppPopover24DOCCopyableBarButtonItem_creator);
  v4 = (objc_class *)type metadata accessor for DOCCopyableBarButtonItem();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(DOCBarButtonItem *)&v6 init];
}

- (void).cxx_destruct
{
  sub_100035EB4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC17RecentsAppPopover24DOCCopyableBarButtonItem_creator));
}

@end