@interface CNAvatarPosterPairCollectionViewCell
- (_TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell)initWithCoder:(id)a3;
- (_TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation CNAvatarPosterPairCollectionViewCell

- (void)layoutSubviews
{
  v2 = self;
  sub_18B68728C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_18B6873E4();
}

- (_TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell *)sub_18B6874D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell *)sub_18B6875E4(a3);
}

- (void).cxx_destruct
{
  sub_18B66EA04((uint64_t)self + OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_scrollView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_scrollableContentView);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18B687E00(v4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  id v8 = a3;
  v10 = self;
  sub_18B688348(v8, (uint64_t)a5, v9, y);
}

@end