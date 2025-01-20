@interface _MKFCharacteristic
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (HMDCharacteristicMetadata)pr_hapMetadata;
- (MKFCharacteristicDatabaseID)databaseID;
- (MKFHome)home;
- (NSArray)bulletinRegistrations;
- (NSArray)notificationRegistrations;
- (NSDictionary)pr_dictionaryRepresentation;
- (void)pr_updateWithDictionary:(id)a3;
- (void)pr_updateWithHAPMetadata:(id)a3;
@end

@implementation _MKFCharacteristic

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4EA688;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_117564 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_117564, &__block_literal_global_117565);
  }
  v2 = (void *)homeRelation__hmf_once_v1_117566;
  return (NSPredicate *)v2;
}

- (NSArray)notificationRegistrations
{
  v2 = [(_MKFCharacteristic *)self valueForKey:@"notificationRegistrations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)bulletinRegistrations
{
  v2 = [(_MKFCharacteristic *)self valueForKey:@"bulletinRegistrations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFHome)home
{
  v2 = [(_MKFCharacteristic *)self service];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFCharacteristicDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFCharacteristicDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (void)pr_updateWithHAPMetadata:(id)a3
{
  id v4 = a3;
  v5 = [v4 format];
  [(_MKFCharacteristic *)self setFormat:v5];

  v6 = [v4 units];
  [(_MKFCharacteristic *)self setUnits:v6];

  id v7 = [v4 manufacturerDescription];

  [(_MKFCharacteristic *)self setManufacturerDescription:v7];
}

- (void)pr_updateWithDictionary:(id)a3
{
  id v14 = a3;
  id v4 = [v14 objectForKeyedSubscript:@"characteristicInstanceID"];

  if (!v4)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v5 = [v14 objectForKeyedSubscript:@"characteristicType"];

  if (!v5)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  v6 = [v14 objectForKeyedSubscript:@"characteristicProperties"];

  if (!v6)
  {
LABEL_12:
    v12 = (_MKFCharacteristic *)_HMFPreconditionFailure();
    [(_MKFCharacteristic *)v12 pr_dictionaryRepresentation];
    return;
  }
  id v7 = objc_msgSend(v14, "hmf_UUIDForKey:", @"characteristicType");
  [(_MKFCharacteristic *)self setType:v7];

  v8 = objc_msgSend(v14, "hmf_numberForKey:", @"characteristicProperties");
  [(_MKFCharacteristic *)self setProperties:v8];

  v9 = objc_msgSend(v14, "hmf_dataForKey:", @"kCharacteristicAuthorizationDataCodingKey");
  [(_MKFCharacteristic *)self setAuthorizationData:v9];

  v10 = objc_msgSend(v14, "hmf_dictionaryForKey:", @"characteristicMetadata");
  v11 = +[HMDCharacteristicMetadata characteristicMetadataWithDictionary:v10];

  if (v11) {
    [(_MKFCharacteristic *)self pr_updateWithHAPMetadata:v11];
  }
  else {
    [(_MKFCharacteristic *)self setFormat:@"unknown"];
  }
}

- (NSDictionary)pr_dictionaryRepresentation
{
  v3 = [(_MKFCharacteristic *)self pr_hapMetadata];
  id v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
  v5 = [(_MKFCharacteristic *)self instanceID];
  v6 = HAPInstanceIDFromValue();
  [v4 setObject:v6 forKeyedSubscript:@"characteristicInstanceID"];

  id v7 = [(_MKFCharacteristic *)self type];
  v8 = [v7 UUIDString];
  [v4 setObject:v8 forKeyedSubscript:@"characteristicType"];

  v9 = [(_MKFCharacteristic *)self properties];
  [v4 setObject:v9 forKeyedSubscript:@"characteristicProperties"];

  v10 = [(_MKFCharacteristic *)self authorizationData];
  [v4 setObject:v10 forKeyedSubscript:@"kCharacteristicAuthorizationDataCodingKey"];

  v11 = [v3 dictionaryRepresentation];
  [v4 setObject:v11 forKeyedSubscript:@"characteristicMetadata"];

  v12 = (void *)[v4 copy];
  return (NSDictionary *)v12;
}

- (HMDCharacteristicMetadata)pr_hapMetadata
{
  v3 = [HMDCharacteristicMetadata alloc];
  id v4 = [(_MKFCharacteristic *)self format];
  v5 = [(_MKFCharacteristic *)self units];
  v6 = [(_MKFCharacteristic *)self manufacturerDescription];
  id v7 = [(HMDCharacteristicMetadata *)v3 initWithMinimumValue:0 maximumValue:0 stepValue:0 maxLength:0 validValues:0 format:v4 units:v5 manufacturerDescription:v6];

  return v7;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCharacteristic"];
}

@end