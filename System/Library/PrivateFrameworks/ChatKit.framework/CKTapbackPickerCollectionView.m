@interface CKTapbackPickerCollectionView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CGPoint)contentOffset;
- (CKTapbackPickerCollectionView)initWithCoder:(id)a3;
- (CKTapbackPickerCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)setContentOffset:(CGPoint)a3;
@end

@implementation CKTapbackPickerCollectionView

- (CKTapbackPickerCollectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F76FC5C();
}

- (CKTapbackPickerCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  return (CKTapbackPickerCollectionView *)sub_18F76F7A4(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18F7B97E0();
    v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
  }
  v7 = self;
  char v8 = sub_18F76F998(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (CGPoint)contentOffset
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TapbackPickerCollectionView();
  [(CKTapbackPickerCollectionView *)&v4 contentOffset];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TapbackPickerCollectionView();
  v5 = (char *)v9.receiver;
  -[CKTapbackPickerCollectionView setContentOffset:](&v9, sel_setContentOffset_, x, y);
  v6 = &v5[OBJC_IVAR___CKTapbackPickerCollectionView_scrollDelegate];
  if (MEMORY[0x192FBC390](&v5[OBJC_IVAR___CKTapbackPickerCollectionView_scrollDelegate]))
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t, double, double))(v7 + 8))(v5, ObjectType, v7, x, y);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void).cxx_destruct
{
}

@end