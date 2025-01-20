@interface DOCConcreteSelectionLocation
- (_TtC17RecentsAppPopover28DOCConcreteSelectionLocation)init;
- (_TtC17RecentsAppPopover28DOCConcreteSelectionLocation)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover28DOCConcreteSelectionLocation)initWithSourceIdentifier:(id)a3 node:(id)a4;
- (_TtC17RecentsAppPopover28DOCConcreteSelectionLocation)initWithSourceIdentifier:(id)a3 title:(id)a4;
- (_TtC17RecentsAppPopover28DOCConcreteSelectionLocation)initWithTaggedItemsSourceRepresentedTag:(id)a3;
@end

@implementation DOCConcreteSelectionLocation

- (_TtC17RecentsAppPopover28DOCConcreteSelectionLocation)initWithSourceIdentifier:(id)a3 node:(id)a4
{
  *(void *)&self->DOCConcreteLocation_opaque[OBJC_IVAR____TtC17RecentsAppPopover28DOCConcreteSelectionLocation_selectedNodes] = _swiftEmptyArrayStorage;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCConcreteSelectionLocation();
  return [(DOCConcreteSelectionLocation *)&v7 initWithSourceIdentifier:a3 node:a4];
}

- (_TtC17RecentsAppPopover28DOCConcreteSelectionLocation)initWithSourceIdentifier:(id)a3 title:(id)a4
{
  sub_1004BEB10();
  *(void *)&self->DOCConcreteLocation_opaque[OBJC_IVAR____TtC17RecentsAppPopover28DOCConcreteSelectionLocation_selectedNodes] = _swiftEmptyArrayStorage;
  id v6 = a3;
  NSString v7 = sub_1004BEAD0();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DOCConcreteSelectionLocation();
  v8 = [(DOCConcreteSelectionLocation *)&v10 initWithSourceIdentifier:v6 title:v7];

  return v8;
}

- (_TtC17RecentsAppPopover28DOCConcreteSelectionLocation)initWithTaggedItemsSourceRepresentedTag:(id)a3
{
  *(void *)&self->DOCConcreteLocation_opaque[OBJC_IVAR____TtC17RecentsAppPopover28DOCConcreteSelectionLocation_selectedNodes] = _swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCConcreteSelectionLocation();
  return [(DOCConcreteSelectionLocation *)&v5 initWithTaggedItemsSourceRepresentedTag:a3];
}

- (_TtC17RecentsAppPopover28DOCConcreteSelectionLocation)init
{
  *(void *)&self->DOCConcreteLocation_opaque[OBJC_IVAR____TtC17RecentsAppPopover28DOCConcreteSelectionLocation_selectedNodes] = _swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCConcreteSelectionLocation();
  return [(DOCConcreteSelectionLocation *)&v3 init];
}

- (_TtC17RecentsAppPopover28DOCConcreteSelectionLocation)initWithCoder:(id)a3
{
  *(void *)&self->DOCConcreteLocation_opaque[OBJC_IVAR____TtC17RecentsAppPopover28DOCConcreteSelectionLocation_selectedNodes] = _swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCConcreteSelectionLocation();
  return [(DOCConcreteSelectionLocation *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end