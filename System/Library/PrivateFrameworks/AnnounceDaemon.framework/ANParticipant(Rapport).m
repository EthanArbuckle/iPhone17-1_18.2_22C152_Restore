@interface ANParticipant(Rapport)
- (id)initWithDevice:()Rapport;
- (void)populateWithDevice:()Rapport;
@end

@implementation ANParticipant(Rapport)

- (id)initWithDevice:()Rapport
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&off_1F34BA4B0;
  id v5 = objc_msgSendSuper2(&v8, sel_init);
  id v6 = v5;
  if (v5) {
    [v5 populateWithDevice:v4];
  }

  return v6;
}

- (void)populateWithDevice:()Rapport
{
  id v4 = a3;
  objc_msgSend(a1, "setIsAccessory:", objc_msgSend(v4, "isAccessory"));
  id v5 = [v4 identifier];
  [a1 setRapportID:v5];

  id v6 = [v4 idsDeviceIdentifier];
  [a1 setIdsID:v6];

  v7 = [v4 homeKitIdentifier];
  objc_super v8 = [v7 UUIDString];
  [a1 setHomeKitID:v8];

  id v9 = [v4 name];

  [a1 setName:v9];
}

@end