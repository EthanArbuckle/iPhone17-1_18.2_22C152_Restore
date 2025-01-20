@interface DOCItemCollectionCell
- (BOOL)_allowsHorizontalFocusMovement;
- (BOOL)accessibilityIsRenaming;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (NSString)description;
- (_TtC18DocumentAppIntents21DOCItemCollectionCell)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntents21DOCItemCollectionCell)initWithFrame:(CGRect)a3;
- (_TtC18DocumentAppIntents28DOCItemCollectionCellContent)cellContent;
- (id)accessibilityCellManager;
- (id)accessibilityThumbnailView;
- (id)accessibilityTitleLabel;
- (id)accessibilityTitleString;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)didMoveToSuperview;
- (void)dragStateDidChange:(int64_t)a3;
- (void)prepareForReuse;
- (void)renameGesture:(id)a3;
- (void)setCellContent:(id)a3;
@end

@implementation DOCItemCollectionCell

- (_TtC18DocumentAppIntents28DOCItemCollectionCellContent)cellContent
{
  v2 = (id *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell_cellContent);
  swift_beginAccess();
  return (_TtC18DocumentAppIntents28DOCItemCollectionCellContent *)*v2;
}

- (void)setCellContent:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1000C26C4(a3);
}

- (NSString)description
{
  v2 = self;
  DOCItemCollectionCell.description.getter();

  NSString v3 = sub_1004F44D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCItemCollectionCell();
  v2 = v4.receiver;
  [(DOCItemCollectionCell *)&v4 prepareForReuse];
  sub_1000BDCDC(v2);
}

- (_TtC18DocumentAppIntents21DOCItemCollectionCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t ObjectType = swift_getObjectType();
  v8 = (_TtC18DocumentAppIntents21DOCItemCollectionCell *)(*(uint64_t (**)(void, double, double, double, double))(ObjectType + 600))(0, x, y, width, height);
  swift_deallocPartialClassInstance();
  return v8;
}

- (_TtC18DocumentAppIntents21DOCItemCollectionCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000C2AC0();
}

- (BOOL)_allowsHorizontalFocusMovement
{
  return 1;
}

- (void)dragStateDidChange:(int64_t)a3
{
  objc_super v4 = self;
  DOCItemCollectionCell.dragStateDidChange(_:)((UICollectionViewCellDragState)a3);
}

- (void)renameGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000BF2C0(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  sub_100032070(0, (unint64_t *)&qword_10065B200);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1000BD4FC();
  LOBYTE(a4) = sub_1004F5970();

  if ((a4 & 1) != 0
    && ([v8 locationInView:v9],
        CGFloat v12 = v11,
        CGFloat v14 = v13,
        sub_1000BFA50((uint64_t)v17),
        sub_100030704((uint64_t)v17, (uint64_t)&v18, &qword_10065A2C0),
        (v19 & 1) == 0))
  {
    v20.double x = v12;
    v20.double y = v14;
    BOOL v15 = CGRectContainsPoint(v18, v20);
  }
  else
  {

    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = DOCItemCollectionCell.gestureRecognizerShouldBegin(_:)((UIGestureRecognizer)v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  sub_100032070(0, (unint64_t *)&qword_10065B200);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1000BD4FC();
  LOBYTE(a3) = sub_1004F5970();

  if (a3)
  {
    sub_100032070(0, &qword_10065A2D0);
    unsigned __int8 v11 = [v8 isKindOfClass:swift_getObjCClassFromMetadata()];

    if (v11) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  sub_100032070(0, (unint64_t *)&qword_10065B200);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1000BD4FC();
  LOBYTE(a3) = sub_1004F5970();

  return a3 & 1;
}

- (void)didMoveToSuperview
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for DOCItemCollectionCell();
  [(DOCItemCollectionCell *)&v2 didMoveToSuperview];
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1004F34E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004F34A0();
  id v8 = self;
  DOCItemCollectionCell.updateConfiguration(using:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)accessibilityTitleLabel
{
  objc_super v2 = (void *)(*(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.super.isa) + 0x108))();

  return v2;
}

- (id)accessibilityTitleString
{
  objc_super v2 = self;
  id v3 = sub_1000C1FF8();

  return v3;
}

- (id)accessibilityCellManager
{
  objc_super v2 = (void *)(*(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.super.isa) + 0x1F8))();

  return v2;
}

- (id)accessibilityThumbnailView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell_thumbnailView));
}

- (BOOL)accessibilityIsRenaming
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell_isRenaming);
}

- (void).cxx_destruct
{
  sub_100037E24((uint64_t)self + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell_itemStatusBadgeConstraintX));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell_itemStatusBadgeConstraintY));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell_itemAccessStatusBadgeConstraintX));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell_itemAccessStatusBadgeConstraintY));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell____lazy_storage___itemStatusBadge));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell____lazy_storage___itemAccessStatusBadge));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell____lazy_storage___renameGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell_cellContent));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell_horizontalStopButton));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18DocumentAppIntents21DOCItemCollectionCell_renameTextView);
}

@end