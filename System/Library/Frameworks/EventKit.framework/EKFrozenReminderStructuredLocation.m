@interface EKFrozenReminderStructuredLocation
+ (BOOL)canCommitSelf;
+ (Class)meltedClass;
+ (id)uniqueIdentifierForREMObject:(id)a3;
- (EKFrozenReminderStructuredLocation)initWithAlternateUniverseObject:(id)a3 inEventStore:(id)a4 withUpdatedChildObjects:(id)a5;
- (NSString)uniqueIdentifier;
- (double)latitude;
- (double)longitude;
- (double)radius;
- (id)_structuredLocation;
- (id)address;
- (id)mapKitHandle;
- (id)remObjectID;
- (id)title;
- (id)updateParentToCommitSelf:(id)a3;
- (id)updatedStructuredLocation;
- (int)referenceFrame;
- (void)setLatitudeAndLongitudeFromAlternateUniverseObject:(id)a3 inChangeSet:(id)a4;
@end

@implementation EKFrozenReminderStructuredLocation

- (EKFrozenReminderStructuredLocation)initWithAlternateUniverseObject:(id)a3 inEventStore:(id)a4 withUpdatedChildObjects:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(EKChangeSet);
  [(EKChangeSet *)v9 setSkipsPersistentObjectCopy:1];
  v10 = [v8 valueForKey:@"title"];
  [(EKChangeSet *)v9 changeSingleValue:v10 forKey:@"title" basedOn:0];

  v11 = [v8 valueForKey:@"radius"];
  [(EKChangeSet *)v9 changeSingleValue:v11 forKey:@"radius" basedOn:0];

  v12 = [v8 valueForKey:@"address"];
  [(EKChangeSet *)v9 changeSingleValue:v12 forKey:@"address" basedOn:0];

  v13 = [MEMORY[0x1E4F29128] UUID];
  v14 = [v13 UUIDString];
  [(EKChangeSet *)v9 changeSingleValue:v14 forKey:@"uniqueIdentifier" basedOn:0];

  [(EKFrozenReminderStructuredLocation *)self setLatitudeAndLongitudeFromAlternateUniverseObject:v8 inChangeSet:v9];
  v15 = [v7 reminderStore];

  v16 = [(EKFrozenReminderObject *)self initWithREMObject:0 inStore:v15 withChanges:v9];
  return v16;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (NSString)uniqueIdentifier
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__EKFrozenReminderStructuredLocation_uniqueIdentifier__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"uniqueIdentifier" backingValue:v4];

  return (NSString *)v2;
}

id __54__EKFrozenReminderStructuredLocation_uniqueIdentifier__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _structuredLocation];
  v2 = [v1 locationUID];

  return v2;
}

- (id)remObjectID
{
  return 0;
}

- (id)_structuredLocation
{
  return self->super._remObject;
}

- (id)updatedStructuredLocation
{
  v3 = [(EKFrozenReminderStructuredLocation *)self title];
  v4 = [(EKFrozenReminderStructuredLocation *)self uniqueIdentifier];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v5 = (void *)getREMStructuredLocationClass_softClass_0;
  uint64_t v15 = getREMStructuredLocationClass_softClass_0;
  if (!getREMStructuredLocationClass_softClass_0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getREMStructuredLocationClass_block_invoke_0;
    v11[3] = &unk_1E5B969D8;
    v11[4] = &v12;
    __getREMStructuredLocationClass_block_invoke_0((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = v5;
  _Block_object_dispose(&v12, 8);
  id v7 = (void *)[[v6 alloc] initWithTitle:v3 locationUID:v4];
  [(EKFrozenReminderStructuredLocation *)self latitude];
  objc_msgSend(v7, "setLatitude:");
  [(EKFrozenReminderStructuredLocation *)self longitude];
  objc_msgSend(v7, "setLongitude:");
  [(EKFrozenReminderStructuredLocation *)self radius];
  objc_msgSend(v7, "setRadius:");
  id v8 = [(EKFrozenReminderStructuredLocation *)self address];
  [v7 setAddress:v8];

  v9 = [(EKFrozenReminderStructuredLocation *)self mapKitHandle];
  [v7 setMapKitHandle:v9];

  return v7;
}

- (id)title
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__EKFrozenReminderStructuredLocation_title__block_invoke;
  v4[3] = &unk_1E5B96988;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"title" backingValue:v4];

  return v2;
}

id __43__EKFrozenReminderStructuredLocation_title__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _structuredLocation];
  v2 = [v1 title];

  return v2;
}

+ (BOOL)canCommitSelf
{
  return 0;
}

+ (id)uniqueIdentifierForREMObject:(id)a3
{
  return (id)[a3 locationUID];
}

- (id)updateParentToCommitSelf:(id)a3
{
  return (id)[a3 updatedAlarmWithLocation:self];
}

- (id)mapKitHandle
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__EKFrozenReminderStructuredLocation_mapKitHandle__block_invoke;
  v4[3] = &unk_1E5B97638;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"mapKitHandle" backingValue:v4];

  return v2;
}

id __50__EKFrozenReminderStructuredLocation_mapKitHandle__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _structuredLocation];
  v2 = [v1 mapKitHandle];

  return v2;
}

- (id)address
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__EKFrozenReminderStructuredLocation_address__block_invoke;
  v4[3] = &unk_1E5B96988;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"address" backingValue:v4];

  return v2;
}

id __45__EKFrozenReminderStructuredLocation_address__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _structuredLocation];
  v2 = [v1 address];

  return v2;
}

- (double)latitude
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__EKFrozenReminderStructuredLocation_latitude__block_invoke;
  v6[3] = &unk_1E5B96AB8;
  v6[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"latitude" backingValue:v6];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

id __46__EKFrozenReminderStructuredLocation_latitude__block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  v2 = [*(id *)(a1 + 32) _structuredLocation];
  [v2 latitude];
  double v3 = objc_msgSend(v1, "numberWithDouble:");

  return v3;
}

- (double)longitude
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__EKFrozenReminderStructuredLocation_longitude__block_invoke;
  v6[3] = &unk_1E5B96AB8;
  v6[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"longitude" backingValue:v6];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

id __47__EKFrozenReminderStructuredLocation_longitude__block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  v2 = [*(id *)(a1 + 32) _structuredLocation];
  [v2 longitude];
  double v3 = objc_msgSend(v1, "numberWithDouble:");

  return v3;
}

- (int)referenceFrame
{
  return 0;
}

- (double)radius
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__EKFrozenReminderStructuredLocation_radius__block_invoke;
  v6[3] = &unk_1E5B96AB8;
  v6[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"radius" backingValue:v6];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

id __44__EKFrozenReminderStructuredLocation_radius__block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  v2 = [*(id *)(a1 + 32) _structuredLocation];
  [v2 radius];
  double v3 = objc_msgSend(v1, "numberWithDouble:");

  return v3;
}

- (void)setLatitudeAndLongitudeFromAlternateUniverseObject:(id)a3 inChangeSet:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 valueForKey:@"latitude"];
  [v5 changeSingleValue:v7 forKey:@"latitude" basedOn:0];

  id v8 = [v6 valueForKey:@"latitude"];

  [v5 changeSingleValue:v8 forKey:@"latitude" basedOn:0];
}

@end