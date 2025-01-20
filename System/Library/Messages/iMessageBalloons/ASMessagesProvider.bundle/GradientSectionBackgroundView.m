@interface GradientSectionBackgroundView
- (_TtC18ASMessagesProvider29GradientSectionBackgroundView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider29GradientSectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation GradientSectionBackgroundView

- (_TtC18ASMessagesProvider29GradientSectionBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC18ASMessagesProvider29GradientSectionBackgroundView_gradientView;
  id v9 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)[v9 init];

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for GradientSectionBackgroundView();
  v11 = -[GradientSectionBackgroundView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  [(GradientSectionBackgroundView *)v11 addSubview:*(Class *)((char *)&v11->super.super.super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider29GradientSectionBackgroundView_gradientView)];
  return v11;
}

- (_TtC18ASMessagesProvider29GradientSectionBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider29GradientSectionBackgroundView_gradientView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC18ASMessagesProvider29GradientSectionBackgroundView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GradientSectionBackgroundView();
  v2 = (char *)v4.receiver;
  [(GradientSectionBackgroundView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider29GradientSectionBackgroundView_gradientView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GradientSectionBackgroundView();
  id v2 = v4.receiver;
  [(GradientSectionBackgroundView *)&v4 prepareForReuse];
  sub_14A6C();
  v3 = (void *)sub_77E350();
  objc_msgSend(v2, "setBackgroundColor:", v3, v4.receiver, v4.super_class);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29GradientSectionBackgroundView_gradientView));
}

@end