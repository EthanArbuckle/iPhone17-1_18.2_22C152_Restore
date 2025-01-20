@interface LocationServicesDisabledView.ViewModel
- (_TtCV12FindMyUICore28LocationServicesDisabledView9ViewModel)init;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationServicesDisabledView.ViewModel

- (_TtCV12FindMyUICore28LocationServicesDisabledView9ViewModel)init
{
  return (_TtCV12FindMyUICore28LocationServicesDisabledView9ViewModel *)sub_24E67886C();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_authorizationStatus);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24E862208();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12FindMyUICore28LocationServicesDisabledView9ViewModel_clLocationManager));
  v3 = (char *)self + OBJC_IVAR____TtCV12FindMyUICore28LocationServicesDisabledView9ViewModel__authorizationStatus;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F4560);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end