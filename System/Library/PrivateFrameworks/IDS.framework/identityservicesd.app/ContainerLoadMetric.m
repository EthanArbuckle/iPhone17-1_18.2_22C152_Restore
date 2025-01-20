@interface ContainerLoadMetric
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (_TtC17identityservicesdP33_534A9A00092BF767A56A700BAD85BE0F19ContainerLoadMetric)init;
@end

@implementation ContainerLoadMetric

- (NSDictionary)dictionaryRepresentation
{
  v2 = self;
  sub_100571AC4();

  sub_100431F80(&qword_100A46CD8);
  v3.super.isa = sub_100726380().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3.super.isa;
}

- (NSString)name
{
  NSString v2 = sub_100726420();

  return (NSString *)v2;
}

- (_TtC17identityservicesdP33_534A9A00092BF767A56A700BAD85BE0F19ContainerLoadMetric)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC17identityservicesdP33_534A9A00092BF767A56A700BAD85BE0F19ContainerLoadMetric_containerType) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ContainerLoadMetric();
  return [(ContainerLoadMetric *)&v3 init];
}

@end