@interface DOCCopyableBarButtonItem
- (_TtC14RecentsAvocado24DOCCopyableBarButtonItem)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation DOCCopyableBarButtonItem

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_100038D54(v6);

  sub_100032FD8(v6, v6[3]);
  v4 = (void *)sub_1004CF870();
  sub_100039184((uint64_t)v6);
  return v4;
}

- (_TtC14RecentsAvocado24DOCCopyableBarButtonItem)init
{
  v3 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC14RecentsAvocado24DOCCopyableBarButtonItem_creator);
  v4 = (objc_class *)type metadata accessor for DOCCopyableBarButtonItem();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(DOCBarButtonItem *)&v6 init];
}

- (void).cxx_destruct
{
  sub_1000388F0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC14RecentsAvocado24DOCCopyableBarButtonItem_creator));
}

@end