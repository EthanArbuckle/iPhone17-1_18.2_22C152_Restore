@interface DOCSidebarCollectionView
- (BOOL)canBecomeFocused;
- (BOOL)selectionFollowsFocus;
- (_TtC14RecentsAvocado24DOCSidebarCollectionView)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado24DOCSidebarCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4;
- (void)setSelectionFollowsFocus:(BOOL)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation DOCSidebarCollectionView

- (_TtC14RecentsAvocado24DOCSidebarCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado24DOCSidebarCollectionView_isHandlingTouchesEndedCount) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC14RecentsAvocado24DOCSidebarCollectionView_requireCanBecomeFocusedTrue) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCSidebarCollectionView();
  id v9 = a4;
  v10 = -[DOCSidebarCollectionView initWithFrame:collectionViewLayout:](&v12, "initWithFrame:collectionViewLayout:", v9, x, y, width, height);
  -[DOCSidebarCollectionView _setAdjustsContentInsetWhenScrollDisabled:](v10, "_setAdjustsContentInsetWhenScrollDisabled:", 1, v12.receiver, v12.super_class);

  return v10;
}

- (_TtC14RecentsAvocado24DOCSidebarCollectionView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado24DOCSidebarCollectionView_isHandlingTouchesEndedCount) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC14RecentsAvocado24DOCSidebarCollectionView_requireCanBecomeFocusedTrue) = 0;
  id v4 = a3;

  result = (_TtC14RecentsAvocado24DOCSidebarCollectionView *)sub_1004CF6B0();
  __break(1u);
  return result;
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4
{
  uint64_t v5 = sub_1004CAF60();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1004CDB50();
  uint64_t v11 = v10;
  sub_1004CAEF0();
  objc_super v12 = self;
  v13 = (void *)sub_1004A5AC4(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1004A6184();
  sub_1003F506C();
  sub_1004CE120();
  uint64_t v6 = OBJC_IVAR____TtC14RecentsAvocado24DOCSidebarCollectionView_isHandlingTouchesEndedCount;
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC14RecentsAvocado24DOCSidebarCollectionView_isHandlingTouchesEndedCount);
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = (objc_class *)(v7 + 1);
  if (v8)
  {
    __break(1u);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC14RecentsAvocado24DOCSidebarCollectionView_isHandlingTouchesEndedCount) = v9;
    id v10 = a4;
    uint64_t v11 = self;
    Class isa = sub_1004CE110().super.isa;
    v15.receiver = v11;
    v15.super_class = (Class)type metadata accessor for DOCSidebarCollectionView();
    [(DOCSidebarCollectionView *)&v15 touchesEnded:isa withEvent:v10];

    uint64_t v13 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v6);
    BOOL v8 = __OFSUB__(v13, 1);
    v14 = (objc_class *)(v13 - 1);
    if (!v8)
    {
      *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = v14;

      swift_bridgeObjectRelease();
      return;
    }
  }
  __break(1u);
}

- (BOOL)selectionFollowsFocus
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCSidebarCollectionView();
  return [(DOCSidebarCollectionView *)&v3 selectionFollowsFocus];
}

- (void)setSelectionFollowsFocus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (objc_class *)type metadata accessor for DOCSidebarCollectionView();
  v9.receiver = self;
  v9.super_class = v5;
  uint64_t v6 = self;
  unsigned int v7 = [(DOCSidebarCollectionView *)&v9 selectionFollowsFocus];
  v8.receiver = v6;
  v8.super_class = v5;
  [(DOCSidebarCollectionView *)&v8 setSelectionFollowsFocus:v3];
  if (v7 != [(DOCSidebarCollectionView *)v6 selectionFollowsFocus]
    && [(DOCSidebarCollectionView *)v6 selectionFollowsFocus])
  {
    [(DOCSidebarCollectionView *)v6 setNeedsFocusUpdate];
  }
}

- (BOOL)canBecomeFocused
{
  if ((*((unsigned char *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC14RecentsAvocado24DOCSidebarCollectionView_requireCanBecomeFocusedTrue) & 1) != 0)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCSidebarCollectionView();
  return [(DOCSidebarCollectionView *)&v3 canBecomeFocused];
}

@end