@interface MPCPlayerAudioRoute
+ (id)payloadValueFromJSONValue:(id)a3;
- (BOOL)canRenderSpatial;
- (BOOL)canStreamSpatial;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSpatializationEnabled;
- (BOOL)supportsSpatialization;
- (MPAVRoute)pickedRoute;
- (MPCPlayerAudioRoute)initWithDictionaryRepresentation:(id)a3;
- (MPCPlayerAudioRoute)initWithNowPlayingInfoAudioRoute:(id)a3;
- (MPCPlayerAudioRoute)initWithRoute:(id)a3 spatialIsAlwaysOn:(BOOL)a4;
- (MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat;
- (MPNowPlayingInfoAudioRoute)nowPlayingAudioRoute;
- (NSDictionary)dictionaryRepresentation;
- (NSString)description;
- (NSString)humanDescription;
- (NSString)name;
- (int64_t)multiChannelSupport;
- (int64_t)type;
@end

@implementation MPCPlayerAudioRoute

- (MPCPlayerAudioRoute)initWithRoute:(id)a3 spatialIsAlwaysOn:(BOOL)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPCPlayerAudioRoute;
  v8 = [(MPCPlayerAudioRoute *)&v17 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_32;
  }
  objc_storeStrong((id *)&v8->_pickedRoute, a3);
  v9->_multiChannelSupport = 0;
  if (![v7 isAirPlayRoute])
  {
    if (a4) {
      goto LABEL_18;
    }
    int v11 = ([v7 isB515Route] & 1) != 0 ? 1 : objc_msgSend(v7, "isB298Route");
    if ([v7 isW1Route] & 1) != 0 || (objc_msgSend(v7, "isH1Route"))
    {
      char v12 = 1;
      if (v11)
      {
LABEL_11:
        v9->_multiChannelSupport = 1;
        v9->_supportsSpatialization = [v7 supportsHeadTrackedSpatialAudio];
        int v10 = [v7 supportsHeadTrackedSpatialAudio];
        if (v10) {
          LOBYTE(v10) = [v7 headTrackedSpatialAudioEnabled];
        }
        v9->_isSpatializationEnabled = v10;
        if (!v9->_supportsSpatialization) {
          LOBYTE(v10) = 0;
        }
        goto LABEL_20;
      }
    }
    else
    {
      char v12 = [v7 isB507Route];
      if (v11) {
        goto LABEL_11;
      }
    }
    if (v12 & 1) != 0 || ([v7 isDeviceSpeakerRoute]) {
LABEL_18:
    }
      v9->_multiChannelSupport = 1;
    *(_WORD *)&v9->_supportsSpatialization = 257;
    LOBYTE(v10) = 1;
    goto LABEL_20;
  }
  LOBYTE(v10) = 0;
  v9->_multiChannelSupport = 2;
  *(_WORD *)&v9->_supportsSpatialization = 0;
LABEL_20:
  v9->_canRenderSpatial = v10;
  v9->_canStreamSpatial = v10;
  uint64_t v13 = [v7 routeName];
  name = v9->_name;
  v9->_name = (NSString *)v13;

  v9->_type = 0;
  if ([v7 isDeviceSpeakerRoute])
  {
    uint64_t v15 = 1;
  }
  else if ([v7 routeSubtype] == 5 || objc_msgSend(v7, "routeSubtype") == 6)
  {
    uint64_t v15 = 2;
  }
  else if ([v7 routeSubtype] == 2 || objc_msgSend(v7, "routeSubtype") == 3)
  {
    uint64_t v15 = 3;
  }
  else if ([v7 routeSubtype] == 11 || objc_msgSend(v7, "routeSubtype") == 12)
  {
    uint64_t v15 = 4;
  }
  else if ([v7 routeSubtype] == 21)
  {
    uint64_t v15 = 5;
  }
  else if ([v7 routeSubtype] == 7)
  {
    uint64_t v15 = 6;
  }
  else if (([v7 isCarplayRoute] & 1) != 0 {
         || [v7 routeSubtype] == 15
  }
         || [v7 routeSubtype] == 19)
  {
    uint64_t v15 = 7;
  }
  else if ([v7 routeSubtype] == 10)
  {
    uint64_t v15 = 8;
  }
  else
  {
    if (![v7 isAirPlayRoute]) {
      goto LABEL_32;
    }
    uint64_t v15 = 9;
  }
  v9->_type = v15;
LABEL_32:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingAudioFormat, 0);
  objc_storeStrong((id *)&self->_pickedRoute, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (int64_t)multiChannelSupport
{
  return self->_multiChannelSupport;
}

- (BOOL)canRenderSpatial
{
  return self->_canRenderSpatial;
}

- (BOOL)canStreamSpatial
{
  return self->_canStreamSpatial;
}

- (MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat
{
  return self->_nowPlayingAudioFormat;
}

- (MPAVRoute)pickedRoute
{
  return self->_pickedRoute;
}

- (BOOL)isSpatializationEnabled
{
  return self->_isSpatializationEnabled;
}

- (BOOL)supportsSpatialization
{
  return self->_supportsSpatialization;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (MPNowPlayingInfoAudioRoute)nowPlayingAudioRoute
{
  id v3 = objc_alloc_init(MEMORY[0x263F12110]);
  [v3 setType:self->_type];
  [v3 setName:self->_name];
  [v3 setSupportsSpatialization:self->_supportsSpatialization];
  [v3 setSpatializationEnabled:self->_isSpatializationEnabled];

  return (MPNowPlayingInfoAudioRoute *)v3;
}

- (NSString)humanDescription
{
  id v3 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  v4 = NSString;
  v5 = NSStringFromMPCPlayerAudioRouteType(self->_type);
  v6 = [v4 stringWithFormat:@"type: %@", v5];
  [v3 addObject:v6];

  id v7 = [NSString stringWithFormat:@"name: %@", self->_name];
  [v3 addObject:v7];

  int64_t multiChannelSupport = self->_multiChannelSupport;
  v9 = @"Unknown [CM-driven]";
  if (multiChannelSupport == 1) {
    v9 = @"Available";
  }
  if (multiChannelSupport == 2) {
    int v10 = @"Unavailable";
  }
  else {
    int v10 = v9;
  }
  int v11 = [NSString stringWithFormat:@"multichannel support: %@", v10];
  [v3 addObject:v11];

  if (self->_supportsSpatialization) {
    [v3 addObject:@"supportsSpatialization"];
  }
  if (self->_isSpatializationEnabled) {
    [v3 addObject:@"spatializationIsEnabled"];
  }
  if (self->_canRenderSpatial) {
    [v3 addObject:@"canRenderSpatialAudio"];
  }
  if (self->_canStreamSpatial) {
    [v3 addObject:@"canStreamSpatialAudio"];
  }
  char v12 = [v3 componentsJoinedByString:@"; "];

  return (NSString *)v12;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPCPlayerAudioRoute *)self humanDescription];
  v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSDictionary)dictionaryRepresentation
{
  v14[7] = *MEMORY[0x263EF8340];
  v13[0] = @"type";
  uint64_t v3 = [NSNumber numberWithInteger:self->_type];
  uint64_t v4 = (void *)v3;
  name = (__CFString *)self->_name;
  if (!name) {
    name = &stru_26CBCA930;
  }
  v14[0] = v3;
  v14[1] = name;
  v13[1] = @"name";
  v13[2] = @"rmcs";
  v6 = [NSNumber numberWithInteger:self->_multiChannelSupport];
  v14[2] = v6;
  v13[3] = @"spzs";
  id v7 = [NSNumber numberWithBool:self->_supportsSpatialization];
  v14[3] = v7;
  v13[4] = @"spze";
  v8 = [NSNumber numberWithBool:self->_isSpatializationEnabled];
  v14[4] = v8;
  v13[5] = @"spzcs";
  v9 = [NSNumber numberWithBool:self->_canStreamSpatial];
  v14[5] = v9;
  v13[6] = @"spzcr";
  int v10 = [NSNumber numberWithBool:self->_canRenderSpatial];
  v14[6] = v10;
  int v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:7];

  return (NSDictionary *)v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MPCPlayerAudioRoute *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (self->_type == v5->_type)
      {
        name = self->_name;
        v8 = v5->_name;
        if (name == v8)
        {
        }
        else
        {
          v9 = v8;
          int v10 = name;
          int v11 = [(NSString *)v10 isEqual:v9];

          if (!v11) {
            goto LABEL_15;
          }
        }
        if (self->_multiChannelSupport == v6->_multiChannelSupport
          && !self->_supportsSpatialization != v6->_supportsSpatialization
          && !self->_isSpatializationEnabled != v6->_isSpatializationEnabled
          && !self->_canStreamSpatial != v6->_canStreamSpatial)
        {
          BOOL v12 = !self->_canRenderSpatial ^ v6->_canRenderSpatial;
LABEL_16:

          goto LABEL_17;
        }
      }
LABEL_15:
      BOOL v12 = 0;
      goto LABEL_16;
    }
    BOOL v12 = 0;
  }
LABEL_17:

  return v12;
}

- (MPCPlayerAudioRoute)initWithNowPlayingInfoAudioRoute:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCPlayerAudioRoute;
  v5 = [(MPCPlayerAudioRoute *)&v9 init];
  if (v5)
  {
    v5->_type = [v4 type];
    uint64_t v6 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_supportsSpatialization = [v4 supportsSpatialization];
    v5->_isSpatializationEnabled = [v4 isSpatializationEnabled];
  }

  return v5;
}

- (MPCPlayerAudioRoute)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MPCPlayerAudioRoute;
  v5 = [(MPCPlayerAudioRoute *)&v16 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"type"];

  if (v6)
  {
    id v7 = [v4 objectForKeyedSubscript:@"type"];
    v5->_type = [v7 integerValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    int v10 = [v4 objectForKeyedSubscript:@"rmcs"];
    v5->_int64_t multiChannelSupport = [v10 integerValue];

    int v11 = [v4 objectForKeyedSubscript:@"spzs"];
    v5->_supportsSpatialization = [v11 BOOLValue];

    BOOL v12 = [v4 objectForKeyedSubscript:@"spze"];
    v5->_isSpatializationEnabled = [v12 BOOLValue];

    uint64_t v13 = [v4 objectForKeyedSubscript:@"spzcs"];
    v5->_canStreamSpatial = [v13 BOOLValue];

    v14 = [v4 objectForKeyedSubscript:@"spzcr"];
    v5->_canRenderSpatial = [v14 BOOLValue];

LABEL_4:
    uint64_t v6 = v5;
  }

  return v6;
}

+ (id)payloadValueFromJSONValue:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionaryRepresentation:v4];

  return v5;
}

@end