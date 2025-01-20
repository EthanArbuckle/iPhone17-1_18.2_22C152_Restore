@interface INFindDeviceAndPlaySoundIntent
+ (BOOL)supportsSecureCoding;
- (INFindDeviceAndPlaySoundIntent)initWithDevices:(id)a3 isStopRequest:(id)a4;
- (NSArray)devices;
- (NSNumber)isStopRequest;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setDevices:(id)a3;
- (void)setIsStopRequest:(id)a3;
@end

@implementation INFindDeviceAndPlaySoundIntent

- (id)verb
{
  return @"FindDeviceAndPlaySound";
}

- (id)domain
{
  return @"FindDevice";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INFindDeviceAndPlaySoundIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"devices";
  v3 = [(INFindDeviceAndPlaySoundIntent *)self devices];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"isStopRequest";
  v10[0] = v4;
  v5 = [(INFindDeviceAndPlaySoundIntent *)self isStopRequest];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!v5) {

  }
  if (!v3) {

  }
  return v7;
}

- (void)setIsStopRequest:(id)a3
{
  id v5 = a3;
  v4 = [(INFindDeviceAndPlaySoundIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setIsStopRequest:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasIsStopRequest:0];
  }
}

- (NSNumber)isStopRequest
{
  v3 = [(INFindDeviceAndPlaySoundIntent *)self _typedBackingStore];
  if ([v3 hasIsStopRequest])
  {
    v4 = NSNumber;
    id v5 = [(INFindDeviceAndPlaySoundIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isStopRequest"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setDevices:(id)a3
{
  id v4 = a3;
  id v6 = [(INFindDeviceAndPlaySoundIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDeviceDetails(v4);

  [v6 setDevices:v5];
}

- (NSArray)devices
{
  v2 = [(INFindDeviceAndPlaySoundIntent *)self _typedBackingStore];
  v3 = [v2 devices];
  id v4 = INIntentSlotValueTransformFromDeviceDetails(v3);

  return (NSArray *)v4;
}

- (INFindDeviceAndPlaySoundIntent)initWithDevices:(id)a3 isStopRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INFindDeviceAndPlaySoundIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INFindDeviceAndPlaySoundIntent *)v8 setDevices:v6];
    [(INFindDeviceAndPlaySoundIntent *)v9 setIsStopRequest:v7];
  }

  return v9;
}

- (id)_categoryVerb
{
  return @"Find";
}

- (int64_t)_intentCategory
{
  return 9;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INFindDeviceAndPlaySoundIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INFindDeviceAndPlaySoundIntent *)self _typedBackingStore];
  v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end