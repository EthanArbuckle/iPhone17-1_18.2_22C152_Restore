@interface InteractiveGenerationListener
- (_TtC18HealthExperienceUI29InteractiveGenerationListener)init;
- (void)cancelInteractiveGenerationRequestNotificationWithNotification:(id)a3;
- (void)dealloc;
- (void)didBecomeActiveWithNotification:(id)a3;
- (void)didEnterBackgroundWithNotification:(id)a3;
- (void)generationRequestNotificationWithNotification:(id)a3;
@end

@implementation InteractiveGenerationListener

- (_TtC18HealthExperienceUI29InteractiveGenerationListener)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29InteractiveGenerationListener____lazy_storage___queue) = 0;
  *(void *)&self->$__lazy_storage_$_queue[OBJC_IVAR____TtC18HealthExperienceUI29InteractiveGenerationListener_applicationStateProvider] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for InteractiveGenerationListener();
  return [(InteractiveGenerationListener *)&v4 init];
}

- (void)didBecomeActiveWithNotification:(id)a3
{
}

- (void)dealloc
{
  v2 = self;
  sub_1AD570228();
  id v3 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v3, sel_removeObserver_, v2);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for InteractiveGenerationListener();
  [(InteractiveGenerationListener *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29InteractiveGenerationListener____lazy_storage___queue));
  id v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29InteractiveGenerationListener_applicationStateProvider;
  sub_1AD24D3D8((uint64_t)v3);
}

- (void)didEnterBackgroundWithNotification:(id)a3
{
}

- (void)generationRequestNotificationWithNotification:(id)a3
{
}

- (void)cancelInteractiveGenerationRequestNotificationWithNotification:(id)a3
{
}

@end