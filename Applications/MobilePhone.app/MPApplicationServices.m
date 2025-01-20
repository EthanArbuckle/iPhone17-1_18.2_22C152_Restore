@interface MPApplicationServices
- (MPApplicationServices)init;
- (MPVoicemailBadgeCalculator)badgeCalculator;
- (MPVoicemailManagerProtocol)voicemailManager;
- (TPFavoritesController)favoritesController;
- (VMVoicemailManager)accountManager;
- (id)voicemailController;
@end

@implementation MPApplicationServices

- (id)voicemailController
{
  uint64_t v2 = one-time initialization token for queue;
  v3 = self;
  v4 = v3;
  if (v2 != -1) {
    v3 = (MPApplicationServices *)swift_once();
  }
  __chkstk_darwin(v3);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MPVoicemailController);
  OS_dispatch_queue.sync<A>(execute:)();

  return v6;
}

- (VMVoicemailManager)accountManager
{
  uint64_t v2 = one-time initialization token for queue;
  v3 = self;
  v4 = v3;
  if (v2 != -1) {
    v3 = (MPApplicationServices *)swift_once();
  }
  __chkstk_darwin(v3);
  type metadata accessor for VMAccount(0, &lazy cache variable for type metadata for VMVoicemailManager);
  OS_dispatch_queue.sync<A>(execute:)();

  return (VMVoicemailManager *)v6;
}

- (MPApplicationServices)init
{
  return (MPApplicationServices *)ApplicationServices.init()();
}

- (TPFavoritesController)favoritesController
{
  uint64_t v2 = one-time initialization token for queue;
  v3 = self;
  v4 = v3;
  if (v2 != -1) {
    v3 = (MPApplicationServices *)swift_once();
  }
  __chkstk_darwin(v3);
  type metadata accessor for VMAccount(0, &lazy cache variable for type metadata for TPFavoritesController);
  OS_dispatch_queue.sync<A>(execute:)();

  return (TPFavoritesController *)v6;
}

- (MPVoicemailManagerProtocol)voicemailManager
{
  uint64_t v2 = one-time initialization token for queue;
  v3 = self;
  v4 = v3;
  if (v2 != -1) {
    v3 = (MPApplicationServices *)swift_once();
  }
  __chkstk_darwin(v3);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VoicemailManager);
  OS_dispatch_queue.sync<A>(execute:)();

  return (MPVoicemailManagerProtocol *)v6;
}

- (MPVoicemailBadgeCalculator)badgeCalculator
{
  uint64_t v2 = one-time initialization token for queue;
  v3 = self;
  v4 = v3;
  if (v2 != -1) {
    v3 = (MPApplicationServices *)swift_once();
  }
  __chkstk_darwin(v3);
  type metadata accessor for VoicemailBadgeCalculator();
  OS_dispatch_queue.sync<A>(execute:)();

  return (MPVoicemailBadgeCalculator *)v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___MPApplicationServices____lazy_storage___favoritesController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___MPApplicationServices____lazy_storage___voicemailController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___MPApplicationServices____lazy_storage___accountManager));
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MPApplicationServices____lazy_storage___badgeCalculator);
}

@end