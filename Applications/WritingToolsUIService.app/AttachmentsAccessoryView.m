@interface AttachmentsAccessoryView
- (CGSize)systemLayoutSizeFittingSize:(CGSize)result;
- (_TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView)initWithCoder:(id)a3;
- (_TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AttachmentsAccessoryView

- (_TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView_inset);
  _OWORD *v8 = xmmword_100190120;
  v8[1] = xmmword_100190130;
  uint64_t v9 = OBJC_IVAR____TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView_collectionView;
  id v10 = objc_allocWithZone((Class)type metadata accessor for AttachmentCollectionView());
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)[v10 init];

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for AttachmentsAccessoryView();
  v12 = -[AttachmentsAccessoryView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  [(AttachmentsAccessoryView *)v12 addSubview:*(Class *)((char *)&v12->super.super.super.isa+ OBJC_IVAR____TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView_collectionView)];
  return v12;
}

- (_TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView)initWithCoder:(id)a3
{
  v5 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView_inset);
  _OWORD *v5 = xmmword_100190120;
  v5[1] = xmmword_100190130;
  uint64_t v6 = OBJC_IVAR____TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView_collectionView;
  id v7 = objc_allocWithZone((Class)type metadata accessor for AttachmentCollectionView());
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)[v7 init];

  result = (_TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)result
{
  double v3 = 110.0;
  result.double height = v3;
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AttachmentsAccessoryView();
  v2 = (char *)v6.receiver;
  [(AttachmentsAccessoryView *)&v6 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView_collectionView];
  [v2 bounds];
  double Width = CGRectGetWidth(v7);
  [v2 bounds];
  double Height = CGRectGetHeight(v8);
  [v3 setFrame:sub_1000E9F84(0.0, 0.0, Width, Height, *(double *)&v2[OBJC_IVAR____TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView_inset], *(double *)&v2[OBJC_IVAR____TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView_inset+ 8])];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21WritingToolsUIServiceP33_C936B4EAF778CD52602455D3431E6E0E24AttachmentsAccessoryView_collectionView));
}

@end