@interface MDMRequestDeviceLocationCommand
+ (id)request;
+ (id)requestType;
+ (unint64_t)requiredAccessRights;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)processRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation MDMRequestDeviceLocationCommand

+ (id)requestType
{
  return @"DeviceLocation";
}

+ (unint64_t)requiredAccessRights
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestDeviceLocationCommand;
  return (unint64_t)objc_msgSendSuper2(&v3, sel_requiredAccessRights);
}

+ (id)request
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  objc_super v3 = objc_opt_new();
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MDMRequestDeviceLocationCommand;
  return [(RMModelPayloadBase *)&v4 copyWithZone:a3];
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [MEMORY[0x263F3CC60] sharedInstance];
  char v7 = [v6 isManagedLostModeActive];

  if (v7)
  {
    v8 = objc_alloc_init(MDMLostDeviceLocationManager);
    v9 = [(MDMRequestBase *)self delegate];
    v10 = [v9 originator];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __77__MDMRequestDeviceLocationCommand_Handler__processRequest_completionHandler___block_invoke;
    v18[3] = &unk_264B9E130;
    id v19 = v5;
    [(MDMLostDeviceLocationManager *)v8 getCurrentLocationForOriginator:v10 completion:v18];

    v11 = v19;
  }
  else
  {
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F38B10];
    v14 = DMCErrorArray();
    objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, 12067, v14, *MEMORY[0x263F38A40], 0);
    v8 = (MDMLostDeviceLocationManager *)objc_claimAutoreleasedReturnValue();

    v15 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      v17 = [(MDMLostDeviceLocationManager *)v8 DMCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      v21 = v17;
      _os_log_impl(&dword_230A49000, v16, OS_LOG_TYPE_ERROR, "Could not determine device current location: %{public}@", buf, 0xCu);
    }
    v11 = +[MDMAbstractTunnelParser responseWithError:v8];
    (*((void (**)(id, void *))v5 + 2))(v5, v11);
  }
}

void __77__MDMRequestDeviceLocationCommand_Handler__processRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v29 = a2;
  id v5 = a3;
  if (v5)
  {
    v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F38B10];
    v8 = DMCErrorArray();
    v9 = objc_msgSend(v6, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v7, 12068, v8, v5, *MEMORY[0x263F38A40], 0);

    v10 = +[MDMAbstractTunnelParser responseWithError:v9];
    v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    v9 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
    v12 = NSNumber;
    [v29 coordinate];
    uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
    [v9 setObject:v13 forKeyedSubscript:@"Latitude"];

    v14 = NSNumber;
    [v29 coordinate];
    v16 = [v14 numberWithDouble:v15];
    [v9 setObject:v16 forKeyedSubscript:@"Longitude"];

    v17 = NSNumber;
    [v29 horizontalAccuracy];
    v18 = objc_msgSend(v17, "numberWithDouble:");
    [v9 setObject:v18 forKeyedSubscript:@"HorizontalAccuracy"];

    id v19 = NSNumber;
    [v29 verticalAccuracy];
    v20 = objc_msgSend(v19, "numberWithDouble:");
    [v9 setObject:v20 forKeyedSubscript:@"VerticalAccuracy"];

    v21 = NSNumber;
    [v29 altitude];
    uint64_t v22 = objc_msgSend(v21, "numberWithDouble:");
    [v9 setObject:v22 forKeyedSubscript:@"Altitude"];

    v23 = NSNumber;
    [v29 course];
    v24 = objc_msgSend(v23, "numberWithDouble:");
    [v9 setObject:v24 forKeyedSubscript:@"Course"];

    v25 = NSNumber;
    [v29 speed];
    v26 = objc_msgSend(v25, "numberWithDouble:");
    [v9 setObject:v26 forKeyedSubscript:@"Speed"];

    v10 = [v29 timestamp];
    if (v10)
    {
      v27 = [MEMORY[0x263F38B50] isoDateFormatter];
      v28 = [v27 stringFromDate:v10];
      [v9 setObject:v28 forKeyedSubscript:@"Timestamp"];
    }
    v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v11();
}

@end