@interface _GCNintendoJoyConProfile
+ (_GCPhysicalDeviceManager)deviceManager;
+ (int64_t)physicalDeviceGetIndicatedPlayerIndex:(id)a3;
+ (void)physicalDevice:(id)a3 getBatteryWithReply:(id)a4;
+ (void)physicalDevice:(id)a3 setIndicatedPlayerIndex:(int64_t)a4;
@end

@implementation _GCNintendoJoyConProfile

+ (_GCPhysicalDeviceManager)deviceManager
{
  if (deviceManager_onceToken != -1) {
    dispatch_once(&deviceManager_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)deviceManager_deviceManager;

  return (_GCPhysicalDeviceManager *)v2;
}

+ (int64_t)physicalDeviceGetIndicatedPlayerIndex:(id)a3
{
  v3 = [a3 serviceInfo];
  v4 = IOHIDServiceClientCopyProperty((IOHIDServiceClientRef)[v3 service], @"JoyConPlayerLights");

  int v17 = 0;
  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 objectForKey:@"LED"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v7 = [v6 count];
      uint64_t v8 = 4;
      if (v7 < 4) {
        uint64_t v8 = v7;
      }
      if (v8)
      {
        for (unint64_t i = 0; i < v13; ++i)
        {
          id v10 = [v6 objectAtIndexedSubscript:i];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v10 isEqualToString:@"OFF"])
            {
              char v11 = 0;
            }
            else if (([v10 isEqualToString:@"ON-SOLID"] & 1) != 0 {
                   || ([v10 isEqualToString:@"ON"] & 1) != 0)
            }
            {
              char v11 = 1;
            }
            else
            {
              if (![v10 isEqualToString:@"ON-FLASH"]) {
                goto LABEL_14;
              }
              char v11 = 2;
            }
            *((unsigned char *)&v17 + i) = v11;
          }
LABEL_14:

          unint64_t v12 = [v6 count];
          if (v12 >= 4) {
            unint64_t v13 = 4;
          }
          else {
            unint64_t v13 = v12;
          }
        }
      }
    }
  }
  int64_t v14 = 0;
  v15 = &PlayerLightsConfig;
  while (v17 != *v15)
  {
    ++v14;
    ++v15;
    if (v14 == 9)
    {
      int64_t v14 = -1;
      break;
    }
  }

  return v14;
}

+ (void)physicalDevice:(id)a3 setIndicatedPlayerIndex:(int64_t)a4
{
  int64_t v4 = a4 + 1;
  if ((unint64_t)(a4 + 1) <= 8)
  {
    id v5 = [a3 serviceInfo];
    v6 = (__IOHIDServiceClient *)[v5 service];
    unsigned int v7 = PlayerLightsConfig[v4];
    v19 = @"LED";
    if (v7 >= 3u)
    {
      v9 = +[NSNumber numberWithUnsignedChar:](&off_26D2B68C8, "numberWithUnsignedChar:");
      uint64_t v8 = [v9 description];
    }
    else
    {
      uint64_t v8 = off_26D22B868[(char)v7];
    }
    v18[0] = v8;
    if (BYTE1(v7) >= 3u)
    {
      char v11 = +[NSNumber numberWithUnsignedChar:](&off_26D2B68C8, "numberWithUnsignedChar:");
      id v10 = [v11 description];
    }
    else
    {
      id v10 = off_26D22B868[SBYTE1(v7)];
    }
    v18[1] = v10;
    if (BYTE2(v7) >= 3u)
    {
      unint64_t v13 = +[NSNumber numberWithUnsignedChar:](&off_26D2B68C8, "numberWithUnsignedChar:");
      unint64_t v12 = [v13 description];
    }
    else
    {
      unint64_t v12 = off_26D22B868[SBYTE2(v7)];
    }
    v18[2] = v12;
    if (HIBYTE(v7) >= 3u)
    {
      v15 = +[NSNumber numberWithUnsignedChar:](&off_26D2B68C8, "numberWithUnsignedChar:");
      int64_t v14 = [v15 description];
    }
    else
    {
      int64_t v14 = off_26D22B868[SHIBYTE(v7)];
    }
    v18[3] = v14;
    v16 = +[NSArray arrayWithObjects:v18 count:4];
    v20 = v16;
    int v17 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

    IOHIDServiceClientSetProperty(v6, @"JoyConPlayerLights", v17);
  }
}

+ (void)physicalDevice:(id)a3 getBatteryWithReply:(id)a4
{
  id v5 = a4;
  v6 = [a3 batteryServiceServer];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __63___GCNintendoJoyConProfile_physicalDevice_getBatteryWithReply___block_invoke;
  v8[3] = &unk_26D22B848;
  id v9 = v5;
  id v7 = v5;
  [v6 readBatteryWithReply:v8];
}

@end