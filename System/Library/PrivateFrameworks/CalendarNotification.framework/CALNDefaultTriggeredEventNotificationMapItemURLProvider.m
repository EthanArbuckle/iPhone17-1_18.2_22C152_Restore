@interface CALNDefaultTriggeredEventNotificationMapItemURLProvider
+ (CALNDefaultTriggeredEventNotificationMapItemURLProvider)sharedInstance;
+ (id)_directionsModeForHypothesis:(id)a3 routing:(id)a4;
+ (id)_directionsModeForLocationRoutingMode:(int64_t)a3;
+ (id)_directionsModeForRouting:(id)a3;
+ (id)_directionsModeForTransportType:(int)a3;
+ (id)_eventLocationFromStructuredLocation:(id)a3;
+ (id)_mapItemNameFromEventLocation:(id)a3;
+ (id)_mapItemURLForEventLocation:(id)a3 hypothesis:(id)a4;
+ (id)_mapItemURLLaunchOptionsForDirectionsMode:(id)a3 isFromTimeToLeaveNotification:(BOOL)a4;
+ (id)_mapItemURLLaunchOptionsForHypothesis:(id)a3 routing:(id)a4;
- (id)mapItemURLForOptionalEventLocation:(id)a3 hypothesis:(id)a4;
@end

@implementation CALNDefaultTriggeredEventNotificationMapItemURLProvider

+ (CALNDefaultTriggeredEventNotificationMapItemURLProvider)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__CALNDefaultTriggeredEventNotificationMapItemURLProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_10 != -1) {
    dispatch_once(&sharedInstance_onceToken_10, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_9;
  return (CALNDefaultTriggeredEventNotificationMapItemURLProvider *)v2;
}

uint64_t __73__CALNDefaultTriggeredEventNotificationMapItemURLProvider_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_9 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (id)mapItemURLForOptionalEventLocation:(id)a3 hypothesis:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    v7 = [(id)objc_opt_class() _mapItemURLForEventLocation:v6 hypothesis:v5];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)_mapItemURLForEventLocation:(id)a3 hypothesis:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 routing];
  v9 = [a1 _mapItemURLLaunchOptionsForHypothesis:v7 routing:v8];

  v10 = [v6 mapKitHandle];
  uint64_t v11 = [v6 geoLocation];
  v12 = (void *)v11;
  if (v10)
  {
    v13 = (void *)MEMORY[0x263F10960];
    v20[0] = v10;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    v15 = [v13 _urlForMapItemHandles:v14 options:v9];
LABEL_5:

    goto LABEL_6;
  }
  if (v11)
  {
    v14 = [a1 _eventLocationFromStructuredLocation:v6];
    v16 = [a1 _mapItemNameFromEventLocation:v14];
    v17 = (void *)MEMORY[0x263F10960];
    v18 = [v6 address];
    v15 = [v17 _urlForLocation:v12 address:v18 label:v16 options:v9];

    goto LABEL_5;
  }
  v15 = 0;
LABEL_6:

  return v15;
}

+ (id)_eventLocationFromStructuredLocation:(id)a3
{
  id v3 = a3;
  v4 = [v3 title];
  id v5 = [v3 address];

  if (![v4 length])
  {
    id v6 = v5;

    v4 = v6;
  }

  return v4;
}

+ (id)_mapItemNameFromEventLocation:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
}

+ (id)_mapItemURLLaunchOptionsForHypothesis:(id)a3 routing:(id)a4
{
  id v6 = [a1 _directionsModeForHypothesis:a3 routing:a4];
  id v7 = [a1 _mapItemURLLaunchOptionsForDirectionsMode:v6 isFromTimeToLeaveNotification:a3 != 0];

  return v7;
}

+ (id)_mapItemURLLaunchOptionsForDirectionsMode:(id)a3 isFromTimeToLeaveNotification:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = a3;
  id v7 = [v5 dictionary];
  [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x263F10818]];

  v8 = [NSNumber numberWithBool:v4];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263F10A90]];

  return v7;
}

+ (id)_directionsModeForHypothesis:(id)a3 routing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)*MEMORY[0x263F10808];
  if (v6)
  {
    uint64_t v9 = objc_msgSend(a1, "_directionsModeForTransportType:", objc_msgSend(v6, "transportType"));
  }
  else
  {
    if (!v7) {
      goto LABEL_6;
    }
    uint64_t v9 = [a1 _directionsModeForRouting:v7];
  }
  v10 = (void *)v9;

  id v8 = v10;
LABEL_6:

  return v8;
}

+ (id)_directionsModeForTransportType:(int)a3
{
  id v4 = (id)*MEMORY[0x263F10808];
  if (a3 <= 3)
  {
    id v5 = **((id **)&unk_2645C1330 + a3);

    id v4 = v5;
  }
  return v4;
}

+ (id)_directionsModeForRouting:(id)a3
{
  uint64_t v4 = [MEMORY[0x263F30040] routingModeEnumForCalRouteType:a3];
  return (id)[a1 _directionsModeForLocationRoutingMode:v4];
}

+ (id)_directionsModeForLocationRoutingMode:(int64_t)a3
{
  id v4 = (id)*MEMORY[0x263F10808];
  if ((unint64_t)(a3 - 1) <= 3)
  {
    id v5 = **((id **)&unk_2645C1350 + a3 - 1);

    id v4 = v5;
  }
  return v4;
}

@end