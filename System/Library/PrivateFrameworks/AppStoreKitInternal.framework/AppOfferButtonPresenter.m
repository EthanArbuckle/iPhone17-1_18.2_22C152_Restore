@interface AppOfferButtonPresenter
- (void)isEnabledDidChange:(id)a3;
- (void)offerButtonTapped;
@end

@implementation AppOfferButtonPresenter

- (void)offerButtonTapped
{
  swift_retain();
  sub_1E16E7A38();
  swift_release();
}

- (void)isEnabledDidChange:(id)a3
{
  uint64_t v3 = sub_1E1D56898();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E1D56848();
  uint64_t v7 = qword_1EAD81F38;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1E1D5B958();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EBF349C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36930);
  sub_1E1D59A58();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1E1D666B0;
  sub_1E1D59998();
  sub_1E1D5B508();
  swift_bridgeObjectRelease();
  _s19AppStoreKitInternal0A20OfferButtonPresenterC6update13ignoringCacheySb_tF_0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end