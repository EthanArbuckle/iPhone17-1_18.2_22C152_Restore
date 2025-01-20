@interface _GCSyntheticXbox360Controller
+ (id)devicePropertiesWithDescription:(id)a3;
@end

@implementation _GCSyntheticXbox360Controller

+ (id)devicePropertiesWithDescription:(id)a3
{
  id v3 = a3;
  if (!devicePropertiesWithDescription__BaseProperties)
  {
    v11[0] = @"ReportDescriptor";
    v4 = +[NSData dataWithBytes:&Xbox360DeviceDescriptor length:188];
    v12[0] = v4;
    v12[1] = @"Microsoft";
    v11[1] = @"Manufacturer";
    v11[2] = @"Product";
    v12[2] = @"GamePad-1";
    v12[3] = &unk_26D2867B0;
    v11[3] = @"VendorID";
    v11[4] = @"ProductID";
    v11[5] = @"VersionNumber";
    v12[4] = &unk_26D2867C8;
    v12[5] = &unk_26D2867E0;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];
    v6 = (void *)devicePropertiesWithDescription__BaseProperties;
    devicePropertiesWithDescription__BaseProperties = v5;
  }
  id v7 = objc_alloc_init((Class)&off_26D2B4CF0);
  [v7 addEntriesFromDictionary:devicePropertiesWithDescription__BaseProperties];
  [v7 setObject:@"Xbox360Controller" forKey:@"_GCSyntheticDeviceType"];
  v8 = [v3 controllerIdentifier];
  v9 = [v8 description];
  [v7 setObject:v9 forKey:@"_GCSyntheticDeviceControllerIdentifier"];

  return v7;
}

@end