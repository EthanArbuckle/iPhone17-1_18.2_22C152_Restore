@interface NCLocationUpdateDemoDelegate
- (id)currentAltitude;
- (id)currentLocation;
- (id)startLocationUpdatesWithHandler:(id)a3;
@end

@implementation NCLocationUpdateDemoDelegate

- (id)startLocationUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_tokenWithValue_(NCManagerLocationToken, v5, self->_locationToken, v6);
  ++self->_locationToken;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2375B4190;
  v10[3] = &unk_264CD58C8;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v10);

  return v7;
}

- (id)currentLocation
{
  return (id)objc_msgSend_idealizedLocation(NCLocation, a2, v2, v3);
}

- (id)currentAltitude
{
  return (id)objc_msgSend_idealizedAltitude(NCAltitude, a2, v2, v3);
}

@end