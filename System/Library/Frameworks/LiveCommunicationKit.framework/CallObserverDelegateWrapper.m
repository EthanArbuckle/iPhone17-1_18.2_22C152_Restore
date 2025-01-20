@interface CallObserverDelegateWrapper
- (_TtC20LiveCommunicationKit27CallObserverDelegateWrapper)init;
- (void)callObserver:(id)a3 callChanged:(id)a4;
@end

@implementation CallObserverDelegateWrapper

- (_TtC20LiveCommunicationKit27CallObserverDelegateWrapper)init
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC20LiveCommunicationKit27CallObserverDelegateWrapper_onCallChanged);
  void *v2 = nullsub_1;
  v2[1] = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CallObserverDelegateWrapper();
  return [(CallObserverDelegateWrapper *)&v4 init];
}

- (void).cxx_destruct
{
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  v6 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtC20LiveCommunicationKit27CallObserverDelegateWrapper_onCallChanged);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  swift_retain();
  v6(v8);

  swift_release();
}

@end