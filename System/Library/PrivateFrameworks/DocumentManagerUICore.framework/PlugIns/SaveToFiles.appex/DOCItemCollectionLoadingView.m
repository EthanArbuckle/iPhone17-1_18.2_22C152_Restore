@interface DOCItemCollectionLoadingView
- (_TtC11SaveToFiles28DOCItemCollectionLoadingView)initWithFrame:(CGRect)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
@end

@implementation DOCItemCollectionLoadingView

- (_TtC11SaveToFiles28DOCItemCollectionLoadingView)initWithFrame:(CGRect)a3
{
  return (_TtC11SaveToFiles28DOCItemCollectionLoadingView *)sub_1004843F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCItemCollectionLoadingView();
  id v4 = a3;
  id v5 = v7.receiver;
  [(DOCItemCollectionLoadingView *)&v7 effectiveAppearanceDidChange:v4];
  id v6 = objc_msgSend(v4, "backgroundColor", v7.receiver, v7.super_class);
  [v5 setBackgroundColor:v6];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionLoadingView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionLoadingView_label));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionLoadingView_activity);
}

@end