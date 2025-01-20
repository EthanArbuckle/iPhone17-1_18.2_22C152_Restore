@interface RouteButton.Coordinator
- (_TtCV11MediaCoreUIP33_269E8A2553F691DD0D96A2E732A5863B11RouteButton11Coordinator)init;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)onTouchDown:(id)a3;
- (void)onTouchUpInside:(id)a3;
- (void)onTouchUpOutside:(id)a3;
@end

@implementation RouteButton.Coordinator

- (void)onTouchDown:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_255C47178();
  objc_msgSend(v6, sel_setSourceView_, v4);

  id v7 = sub_255C47178();
  objc_msgSend(v7, sel_startPrewarming);
}

- (void)onTouchUpOutside:(id)a3
{
}

- (void)onTouchUpInside:(id)a3
{
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_255C47F64(v6);

  return v9;
}

- (_TtCV11MediaCoreUIP33_269E8A2553F691DD0D96A2E732A5863B11RouteButton11Coordinator)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCV11MediaCoreUIP33_269E8A2553F691DD0D96A2E732A5863B11RouteButton11Coordinator____lazy_storage___mediaControls) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(RouteButton.Coordinator *)&v5 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV11MediaCoreUIP33_269E8A2553F691DD0D96A2E732A5863B11RouteButton11Coordinator____lazy_storage___mediaControls);
}

@end