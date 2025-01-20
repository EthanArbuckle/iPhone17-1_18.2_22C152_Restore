@interface LocalPlayerAuthenticationPresenter
- (_TtC12GameCenterUI34LocalPlayerAuthenticationPresenter)init;
- (void)authenticationShowGreenBuddyUIForLocalPlayer:(id)a3 withCompletionHandler:(id)a4;
- (void)authenticationShowSignInUIForLocalPlayer:(id)a3 origin:(unint64_t)a4 dismiss:(id)a5;
@end

@implementation LocalPlayerAuthenticationPresenter

- (_TtC12GameCenterUI34LocalPlayerAuthenticationPresenter)init
{
  return (_TtC12GameCenterUI34LocalPlayerAuthenticationPresenter *)sub_1AF647ADC();
}

- (void)authenticationShowGreenBuddyUIForLocalPlayer:(id)a3 withCompletionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = sub_1AF64C380;
  }
  id v7 = a3;
  v8 = self;
  sub_1AF64B3B4(v7);
  sub_1AF368930((uint64_t)v6);
}

- (void)authenticationShowSignInUIForLocalPlayer:(id)a3 origin:(unint64_t)a4 dismiss:(id)a5
{
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_1AF388384;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  sub_1AF64B590((uint64_t)v10, a4, v8, v9);
  sub_1AF368930((uint64_t)v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12GameCenterUI34LocalPlayerAuthenticationPresenter_localPlayer));
  swift_release();
  swift_release();

  swift_release();
}

@end