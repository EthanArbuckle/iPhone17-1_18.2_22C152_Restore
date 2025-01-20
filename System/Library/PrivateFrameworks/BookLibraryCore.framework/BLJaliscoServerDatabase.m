@interface BLJaliscoServerDatabase
- (id)initIntoManagedObjectContext:(id)a3;
@end

@implementation BLJaliscoServerDatabase

- (id)initIntoManagedObjectContext:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF240];
  id v5 = a3;
  v7 = objc_msgSend_entityForName_inManagedObjectContext_(v4, v6, @"BLJaliscoServerDatabase", (uint64_t)v5);
  v10.receiver = self;
  v10.super_class = (Class)BLJaliscoServerDatabase;
  v8 = [(BLJaliscoServerDatabase *)&v10 initWithEntity:v7 insertIntoManagedObjectContext:v5];

  return v8;
}

@end