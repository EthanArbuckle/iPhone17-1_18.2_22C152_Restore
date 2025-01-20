@interface SendMenuCollectionView
- (_TtC7ChatKit22SendMenuCollectionView)initWithCoder:(id)a3;
- (_TtC7ChatKit22SendMenuCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)safeAreaInsetsDidChange;
@end

@implementation SendMenuCollectionView

- (void)safeAreaInsetsDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SendMenuCollectionView();
  v2 = (char *)v6.receiver;
  [(SendMenuCollectionView *)&v6 safeAreaInsetsDidChange];
  v3 = &v2[OBJC_IVAR____TtC7ChatKit22SendMenuCollectionView_sendMenuCollectionViewDelegate];
  swift_beginAccess();
  if (MEMORY[0x192FBC390](v3))
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 8))(v2, ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC7ChatKit22SendMenuCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7ChatKit22SendMenuCollectionView_sendMenuCollectionViewDelegate) = 0;
  swift_unknownObjectWeakInit();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SendMenuCollectionView();
  return -[SendMenuCollectionView initWithFrame:collectionViewLayout:](&v11, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
}

- (_TtC7ChatKit22SendMenuCollectionView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7ChatKit22SendMenuCollectionView_sendMenuCollectionViewDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SendMenuCollectionView();
  return [(SendMenuCollectionView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end