@interface TransitLineMarker
- (_TtC6MapsUI17TransitLineMarker)init;
- (id)artwork;
- (id)labelText;
- (id)mapItemIdentifier;
@end

@implementation TransitLineMarker

- (_TtC6MapsUI17TransitLineMarker)init
{
  result = (_TtC6MapsUI17TransitLineMarker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (id)mapItemIdentifier
{
  v2 = self;
  id v3 = sub_1932686D8();

  return v3;
}

- (id)labelText
{
  v2 = self;
  sub_19326888C();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_193341380();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)artwork
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI17TransitLineMarker_transitLine), sel_artwork);
  return v2;
}

@end