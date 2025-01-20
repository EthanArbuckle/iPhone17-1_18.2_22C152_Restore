@interface BCSaltVersionIdentifier
+ (id)fetchRequest;
- (id)initIntoManagedObjectContext:(id)a3;
@end

@implementation BCSaltVersionIdentifier

+ (id)fetchRequest
{
  return (id)objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], a2, @"BCSaltVersionIdentifier", v2, v3, v4, v5, v6);
}

- (id)initIntoManagedObjectContext:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFF240];
  id v5 = a3;
  v11 = objc_msgSend_entityForName_inManagedObjectContext_(v4, v6, @"BCSaltVersionIdentifier", (uint64_t)v5, v7, v8, v9, v10);
  v14.receiver = self;
  v14.super_class = (Class)BCSaltVersionIdentifier;
  v12 = [(BCSaltVersionIdentifier *)&v14 initWithEntity:v11 insertIntoManagedObjectContext:v5];

  return v12;
}

@end