@interface FTLocalMessageProperties
- (FTLocalMessageProperties)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation FTLocalMessageProperties

- (FTLocalMessageProperties)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (FTLocalMessageProperties *)FTLocalMessageProperties.init(entity:insertInto:)(v5, a4);
}

@end