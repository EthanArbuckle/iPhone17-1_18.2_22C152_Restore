@interface LiveWidgetContentViewController
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (_TtC9ChronoKit31LiveWidgetContentViewController)initWithCoder:(id)a3;
- (void)dealloc;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation LiveWidgetContentViewController

- (_TtC9ChronoKit31LiveWidgetContentViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__isSnapshotting) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_hasAnimatableContent) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__areAnimationsPaused) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__animationsDisabledPreferenceObserver) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__cachedAnimationsDisabledPreference) = 0;
  id v4 = a3;

  result = (_TtC9ChronoKit31LiveWidgetContentViewController *)sub_1DA98CBB8();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  LiveWidgetContentViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_widget));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_metrics));
  swift_release();
  swift_release();

  swift_release();
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LiveWidgetContentViewController();
  id v4 = v5.receiver;
  [(LiveWidgetContentViewController *)&v5 viewWillAppear:v3];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1DA98A0D8();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LiveWidgetContentViewController();
  id v4 = v5.receiver;
  [(LiveWidgetContentViewController *)&v5 viewDidDisappear:v3];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1DA98A0D8();
}

@end