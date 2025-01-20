@interface MPContactsService
- (MPContactsService)init;
- (MPContactsService)initWithDataProvider:(id)a3;
@end

@implementation MPContactsService

- (MPContactsService)initWithDataProvider:(id)a3
{
  swift_getObjectType();
  uint64_t v4 = swift_unknownObjectRetain();

  return (MPContactsService *)specialized ContactsService.init(dataProvider:)(v4, (char *)self);
}

- (MPContactsService)init
{
  result = (MPContactsService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end