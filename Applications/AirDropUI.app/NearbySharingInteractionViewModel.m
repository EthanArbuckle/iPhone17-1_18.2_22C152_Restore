@interface NearbySharingInteractionViewModel
- (_TtC9AirDropUI33NearbySharingInteractionViewModel)init;
- (id)collaborationItemsProvider:(id)a3 resolveActivityItem:(id)a4;
- (id)collaborationServiceForItemsProvider:(id)a3;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4;
@end

@implementation NearbySharingInteractionViewModel

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_contactDetailsResolvingTask))
  {
    v3 = self;
    swift_retain();
    Task.cancel()();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbySharingInteractionViewModel(0);
  [(NearbySharingInteractionViewModel *)&v5 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_super v5 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__interaction;
  uint64_t v6 = sub_10000AA4C((uint64_t *)&unk_100181D08);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__state;
  uint64_t v8 = sub_10000AA4C((uint64_t *)&unk_100183E50);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__shareableContent;
  uint64_t v10 = sub_10000AA4C(&qword_100181C28);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__collaborationItem;
  uint64_t v12 = sub_10000AA4C(&qword_100181C78);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__collaborationItemOptions;
  uint64_t v14 = sub_10000AA4C(&qword_100181C70);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__previewImage;
  uint64_t v16 = sub_10000AA4C(&qword_100181C68);
  (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  v17 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__resolvedRemotePerson;
  uint64_t v18 = sub_10000AA4C(&qword_100181C20);
  (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  v19 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__shareableContentActionBeginTime;
  uint64_t v20 = sub_10000AA4C(&qword_100181C60);
  (*(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
  swift_release();
  swift_release();
  sub_10000F394((uint64_t)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_interactionAssertionID, &qword_100180580);
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_collaborationService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_collaborationsItemProvider));
  uint64_t v21 = *(uint64_t *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel____lazy_storage___optionsChangedCallback);

  sub_100030180(v21);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4
{
  if (a4 == 4)
  {
    swift_unknownObjectRetain();
    uint64_t v6 = self;
    [a3 shareOptions];
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.setter();
    swift_unknownObjectRelease();
  }
}

- (id)collaborationItemsProvider:(id)a3 resolveActivityItem:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10000AA4C(&qword_1001800C0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10012A270;
  sub_100048600((uint64_t)v10, v7 + 32);

  sub_10000AB98((uint64_t)v10);
  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (id)collaborationServiceForItemsProvider:(id)a3
{
  id v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_collaborationService);
  if (v5)
  {
    id v6 = a3;
    uint64_t v7 = self;
    id v8 = v5;
  }
  else
  {
    id v9 = objc_allocWithZone((Class)type metadata accessor for PlaceholderSFCollaborationService());
    id v10 = a3;
    v11 = self;
    id v8 = [v9 init];
  }
  id v12 = v5;

  return v8;
}

- (_TtC9AirDropUI33NearbySharingInteractionViewModel)init
{
  result = (_TtC9AirDropUI33NearbySharingInteractionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end