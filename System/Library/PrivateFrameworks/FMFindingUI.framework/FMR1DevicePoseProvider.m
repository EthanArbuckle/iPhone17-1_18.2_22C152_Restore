@interface FMR1DevicePoseProvider
- (_TtC11FMFindingUI22FMR1DevicePoseProvider)init;
- (_TtC11FMFindingUI22FMR1DevicePoseProvider)initWithARSession:(id)a3;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
@end

@implementation FMR1DevicePoseProvider

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D321000((uint64_t)v6, (uint64_t)v7);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_24D321348(v8);
}

- (_TtC11FMFindingUI22FMR1DevicePoseProvider)initWithARSession:(id)a3
{
  *(PRDevicePoseProviderDelegate **)((char *)&self->super.super._delegate
                                   + OBJC_IVAR____TtC11FMFindingUI22FMR1DevicePoseProvider_frameDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMR1DevicePoseProvider();
  return [(PRVIODevicePoseProvider *)&v6 initWithARSession:a3];
}

- (_TtC11FMFindingUI22FMR1DevicePoseProvider)init
{
  *(PRDevicePoseProviderDelegate **)((char *)&self->super.super._delegate
                                   + OBJC_IVAR____TtC11FMFindingUI22FMR1DevicePoseProvider_frameDelegate) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMR1DevicePoseProvider();
  return [(FMR1DevicePoseProvider *)&v4 init];
}

- (void).cxx_destruct
{
}

@end