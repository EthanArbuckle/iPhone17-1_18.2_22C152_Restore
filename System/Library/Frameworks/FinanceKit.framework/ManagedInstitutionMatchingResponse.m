@interface ManagedInstitutionMatchingResponse
- (NSString)description;
- (_TtC10FinanceKit34ManagedInstitutionMatchingResponse)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation ManagedInstitutionMatchingResponse

- (_TtC10FinanceKit34ManagedInstitutionMatchingResponse)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedInstitutionMatchingResponse *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (NSString)description
{
  v2 = self;
  ManagedInstitutionMatchingResponse.description.getter();

  v3 = (void *)sub_2439582A0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end