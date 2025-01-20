@interface DOCItemCollectionView
- (BOOL)_hasContentForBarInteractions;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC18DocumentAppIntents21DOCItemCollectionView)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntents21DOCItemCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)indexPathForItemAtPoint:(CGPoint)a3;
- (void)_backgroundTapGestureRecognized:(id)a3;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
@end

@implementation DOCItemCollectionView

- (_TtC18DocumentAppIntents21DOCItemCollectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003E4C78();
}

- (void)layoutSubviews
{
  v2 = self;
  DOCItemCollectionView.layoutSubviews()();
}

- (void)safeAreaInsetsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCItemCollectionView();
  id v2 = v5.receiver;
  [(DOCItemCollectionView *)&v5 safeAreaInsetsDidChange];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
    sub_10016A46C();

    id v2 = v4;
  }
}

- (BOOL)_hasContentForBarInteractions
{
  id v2 = self;
  if ([(DOCItemCollectionView *)v2 enclosedInUIPDocumentLanding])
  {
    char v3 = *((unsigned char *)&v2->super.super.super.super.super.isa
         + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionView_containerIsShowingNoContentUI);

    unsigned __int8 v4 = v3 ^ 1;
  }
  else
  {
    v6.receiver = v2;
    v6.super_class = (Class)type metadata accessor for DOCItemCollectionView();
    unsigned __int8 v4 = [(DOCItemCollectionView *)&v6 _hasContentForBarInteractions];
  }
  return v4 & 1;
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = sub_1000305BC(&qword_100657B80);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  DOCItemCollectionView.indexPathForItem(at:)((uint64_t)v8, x, y);

  uint64_t v10 = sub_1004F1860();
  uint64_t v11 = *(void *)(v10 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    Class isa = sub_1004F17B0().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }

  return isa;
}

- (_TtC18DocumentAppIntents21DOCItemCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4 = a4;
  result = (_TtC18DocumentAppIntents21DOCItemCollectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionView_configuration));
  sub_100037E24((uint64_t)self + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionView_displayDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionView__dragInteraction));
  sub_100037E24((uint64_t)self + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionView_focusableCollectionViewDelegate);
  swift_release();
  sub_100037E24((uint64_t)self + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionView_gestureDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionView_backgroundTapGestureRecognizer));

  swift_unknownObjectWeakDestroy();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  LOBYTE(self) = DOCItemCollectionView.gestureRecognizerShouldBegin(_:)((UIGestureRecognizer)v4);

  return self & 1;
}

- (void)_backgroundTapGestureRecognized:(id)a3
{
  objc_super v5 = (char *)self + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionView_gestureDelegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    uint64_t v7 = *(void (**)(void))(v6 + 32);
    id v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

@end