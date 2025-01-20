@interface IRMiLoServiceMO
+ (id)fetchRequest;
+ (void)setPropertiesOfMiLoServiceMO:(id)a3 withMiLoServiceUuidString:(id)a4;
@end

@implementation IRMiLoServiceMO

+ (void)setPropertiesOfMiLoServiceMO:(id)a3 withMiLoServiceUuidString:(id)a4
{
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"IRMiLoServiceMO"];
}

@end