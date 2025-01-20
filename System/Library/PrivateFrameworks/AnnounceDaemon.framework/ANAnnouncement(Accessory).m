@interface ANAnnouncement(Accessory)
- (uint64_t)isAnnouncerInSameRoomAsAccessory:()Accessory;
@end

@implementation ANAnnouncement(Accessory)

- (uint64_t)isAnnouncerInSameRoomAsAccessory:()Accessory
{
  id v4 = a3;
  v5 = [a1 announcer];
  int v6 = [v5 isAccessory];

  if (v6)
  {
    v7 = +[ANHomeManager shared];
    v8 = [a1 location];
    v9 = [v8 homeUUID];
    v10 = [v7 homeForID:v9];

    id v11 = objc_alloc(MEMORY[0x1E4F29128]);
    v12 = [a1 announcer];
    v13 = [v12 homeKitID];
    v14 = (void *)[v11 initWithUUIDString:v13];

    v15 = [v10 accessoryWithUniqueIdentifier:v14];
    v16 = v15;
    if (v15)
    {
      v17 = [v15 room];
      v18 = [v17 uniqueIdentifier];
      v19 = [v4 room];
      v20 = [v19 uniqueIdentifier];
      uint64_t v21 = [v18 isEqual:v20];
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

@end