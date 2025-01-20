@interface DOCBarButtonItemGroup
- (BOOL)isHidden;
- (NSArray)barButtonItems;
- (_TtC18DocumentAppIntents21DOCBarButtonItemGroup)initWithBarButtonItems:(id)a3 representativeItem:(id)a4;
- (_TtC18DocumentAppIntents21DOCBarButtonItemGroup)initWithCoder:(id)a3;
- (void)setBarButtonItems:(id)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation DOCBarButtonItemGroup

- (_TtC18DocumentAppIntents21DOCBarButtonItemGroup)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC18DocumentAppIntents21DOCBarButtonItemGroup_autoHideIfItemsHidden) = 1;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC18DocumentAppIntents21DOCBarButtonItemGroup__isHiddenExternalClientSetting) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18DocumentAppIntents21DOCBarButtonItemGroup_itemObservances) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC18DocumentAppIntents21DOCBarButtonItemGroup_hasVisibleItems) = 0;
  id v4 = a3;

  result = (_TtC18DocumentAppIntents21DOCBarButtonItemGroup *)sub_1004F6110();
  __break(1u);
  return result;
}

- (_TtC18DocumentAppIntents21DOCBarButtonItemGroup)initWithBarButtonItems:(id)a3 representativeItem:(id)a4
{
  sub_1001E9938();
  sub_1004F47F0();
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC18DocumentAppIntents21DOCBarButtonItemGroup_autoHideIfItemsHidden) = 1;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC18DocumentAppIntents21DOCBarButtonItemGroup__isHiddenExternalClientSetting) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18DocumentAppIntents21DOCBarButtonItemGroup_itemObservances) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC18DocumentAppIntents21DOCBarButtonItemGroup_hasVisibleItems) = 0;
  id v6 = a4;
  Class isa = sub_1004F47D0().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DOCBarButtonItemGroup();
  v8 = [(DOCBarButtonItemGroup *)&v11 initWithBarButtonItems:isa representativeItem:v6];

  v9 = v8;
  sub_1003AC184();

  return v9;
}

- (NSArray)barButtonItems
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCBarButtonItemGroup();
  id v2 = v6.receiver;
  v3 = [(DOCBarButtonItemGroup *)&v6 barButtonItems];
  sub_1001E9938();
  sub_1004F47F0();

  v4.super.Class isa = sub_1004F47D0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (void)setBarButtonItems:(id)a3
{
  sub_1001E9938();
  sub_1004F47F0();
  NSArray v4 = self;
  Class isa = sub_1004F47D0().super.isa;
  swift_bridgeObjectRelease();
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for DOCBarButtonItemGroup();
  [(DOCBarButtonItemGroup *)&v6 setBarButtonItems:isa];

  sub_1003AC184();
}

- (BOOL)isHidden
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCBarButtonItemGroup();
  return [(DOCBarButtonItemGroup *)&v3 isHidden];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for DOCBarButtonItemGroup();
  v9.receiver = self;
  v9.super_class = v5;
  objc_super v6 = self;
  char v7 = [(DOCBarButtonItemGroup *)&v9 isHidden];
  v8.receiver = v6;
  v8.super_class = v5;
  [(DOCBarButtonItemGroup *)&v8 setHidden:v3];
  sub_1003AC0AC(v7);
}

- (void).cxx_destruct
{
}

@end