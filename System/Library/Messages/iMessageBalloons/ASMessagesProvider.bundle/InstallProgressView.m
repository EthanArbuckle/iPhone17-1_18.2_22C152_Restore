@interface InstallProgressView
- (_TtC18ASMessagesProvider19InstallProgressView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider19InstallProgressView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InstallProgressView

- (_TtC18ASMessagesProvider19InstallProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider19InstallProgressView *)sub_5ECE94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider19InstallProgressView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider19InstallProgressView_state;
  *(void *)v4 = 0;
  v4[8] = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider19InstallProgressView_progressLayer) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18ASMessagesProvider19InstallProgressView_completionHandler);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider19InstallProgressView_progress) = 0;
  id v6 = a3;

  result = (_TtC18ASMessagesProvider19InstallProgressView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for InstallProgressView();
  v2 = (char *)v14.receiver;
  [(InstallProgressView *)&v14 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider19InstallProgressView_progressLayer];
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(v2, "layer", v14.receiver, v14.super_class);
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v4, "setFrame:", v7, v9, v11, v13);
    v2 = v4;
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19InstallProgressView_progressLayer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider19InstallProgressView_completionHandler);

  sub_13308(v3);
}

@end