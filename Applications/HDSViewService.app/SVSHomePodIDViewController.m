@interface SVSHomePodIDViewController
- (_TtC14HDSViewService26SVSHomePodIDViewController)init;
- (_TtC14HDSViewService26SVSHomePodIDViewController)initWithCoder:(id)a3;
- (_TtC14HDSViewService26SVSHomePodIDViewController)initWithDeviceModel:(unsigned __int8)a3;
- (_TtC14HDSViewService26SVSHomePodIDViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)handler;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)configureEngine;
- (void)dealloc;
- (void)preheatEngine;
- (void)setHandler:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SVSHomePodIDViewController

- (id)handler
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler))
  {
    uint64_t v2 = *(void *)&self->engine[OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler];
    v5[4] = *(Class *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100089B18;
    v5[3] = &unk_1000DD400;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1000932A8;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_1000647CC(v8);
}

- (_TtC14HDSViewService26SVSHomePodIDViewController)init
{
}

- (_TtC14HDSViewService26SVSHomePodIDViewController)initWithDeviceModel:(unsigned __int8)a3
{
  return (_TtC14HDSViewService26SVSHomePodIDViewController *)sub_1000913B0(a3);
}

- (_TtC14HDSViewService26SVSHomePodIDViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10009312C();
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  SVSHomePodIDViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  SVSHomePodIDViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  SVSHomePodIDViewController.viewDidDisappear(_:)(a3);
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for SVSHomePodIDViewController();
  uint64_t v2 = (char *)v14.receiver;
  [(SVSHomePodIDViewController *)&v14 viewDidLayoutSubviews];
  id v3 = [v2[OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_preView] layer];
  id v4 = [v2 view];
  if (v4)
  {
    uint64_t v5 = v4;
    [v4 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    [v3 setFrame:v7, v9, v11, v13];
  }
  else
  {
    __break(1u);
  }
}

- (void)configureEngine
{
  uint64_t v2 = self;
  SVSHomePodIDViewController.configureEngine()();
}

- (void)preheatEngine
{
}

- (void)dealloc
{
  uint64_t v2 = self;
  SVSHomePodIDViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_engine));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_preView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_session));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_feedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_output));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_videoDeviceInput));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController__videoDevice));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_handler);

  sub_1000647CC(v3);
}

- (_TtC14HDSViewService26SVSHomePodIDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC14HDSViewService26SVSHomePodIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  if (*((unsigned char *)&self->super.super.super.isa
       + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_startIngesting) == 1)
  {
    uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC14HDSViewService26SVSHomePodIDViewController_engine);
    if (v5) {
      [v5 ingestVideoFrame:a4];
    }
  }
}

@end