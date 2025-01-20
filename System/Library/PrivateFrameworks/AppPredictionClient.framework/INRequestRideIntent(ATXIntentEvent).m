@interface INRequestRideIntent(ATXIntentEvent)
- (void)atx_getArgsInto:()ATXIntentEvent;
@end

@implementation INRequestRideIntent(ATXIntentEvent)

- (void)atx_getArgsInto:()ATXIntentEvent
{
  id v4 = a3;
  v5 = [a1 pickupLocation];
  v6 = [v5 location];
  v7 = stringWithGeohash(objc_msgSend(v6, "atx_locationHash"));
  [v4 setArg1:v7];

  id v10 = [a1 dropOffLocation];
  v8 = [v10 location];
  v9 = stringWithGeohash(objc_msgSend(v8, "atx_locationHash"));
  [v4 setArg2:v9];
}

@end