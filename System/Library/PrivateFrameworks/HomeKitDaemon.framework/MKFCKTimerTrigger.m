@interface MKFCKTimerTrigger
+ (id)fetchRequest;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
@end

@implementation MKFCKTimerTrigger

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MKFCKTimerTrigger;
  return [(MKFCKTrigger *)&v6 exportFromLocalModel:a3 updatedProperties:a4 context:a5];
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MKFCKTimerTrigger;
  return [(MKFCKTrigger *)&v6 importIntoLocalModel:a3 updatedProperties:a4 context:a5];
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKTimerTrigger"];
}

@end