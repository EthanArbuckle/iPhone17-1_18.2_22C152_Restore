@interface DOCCopyableBarButtonItem
- (_TtC18DocumentAppIntents24DOCCopyableBarButtonItem)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation DOCCopyableBarButtonItem

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_1000379A4(v6);

  sub_100031D28(v6, v6[3]);
  v4 = (void *)sub_1004F62D0();
  sub_100037DD4((uint64_t)v6);
  return v4;
}

- (_TtC18DocumentAppIntents24DOCCopyableBarButtonItem)init
{
  v3 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18DocumentAppIntents24DOCCopyableBarButtonItem_creator);
  v4 = (objc_class *)type metadata accessor for DOCCopyableBarButtonItem();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(DOCBarButtonItem *)&v6 init];
}

- (void).cxx_destruct
{
  sub_100037540(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC18DocumentAppIntents24DOCCopyableBarButtonItem_creator));
}

@end