@interface CEMDeviceLostmodeLocationCommand_Status
+ (NSSet)allowedReasons;
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithLatitude:(id)a3 withLongitude:(id)a4 withHorizontalAccuracy:(id)a5 withVerticalAccuracy:(id)a6 withAltitude:(id)a7 withSpeed:(id)a8 withCourse:(id)a9 withTimestamp:(id)a10;
+ (id)buildWithLatitude:(id)a3 withLongitude:(id)a4 withHorizontalAccuracy:(id)a5 withVerticalAccuracy:(id)a6 withAltitude:(id)a7 withSpeed:(id)a8 withCourse:(id)a9 withTimestamp:(id)a10;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)statusAltitude;
- (NSNumber)statusCourse;
- (NSNumber)statusHorizontalAccuracy;
- (NSNumber)statusLatitude;
- (NSNumber)statusLongitude;
- (NSNumber)statusSpeed;
- (NSNumber)statusVerticalAccuracy;
- (NSString)statusTimestamp;
- (id)serializePayload;
- (void)setStatusAltitude:(id)a3;
- (void)setStatusCourse:(id)a3;
- (void)setStatusHorizontalAccuracy:(id)a3;
- (void)setStatusLatitude:(id)a3;
- (void)setStatusLongitude:(id)a3;
- (void)setStatusSpeed:(id)a3;
- (void)setStatusTimestamp:(id)a3;
- (void)setStatusVerticalAccuracy:(id)a3;
@end

@implementation CEMDeviceLostmodeLocationCommand_Status

+ (NSSet)allowedStatusKeys
{
  v6[8] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Latitude";
  v6[1] = @"Longitude";
  v6[2] = @"HorizontalAccuracy";
  v6[3] = @"VerticalAccuracy";
  v6[4] = @"Altitude";
  v6[5] = @"Speed";
  v6[6] = @"Course";
  v6[7] = @"Timestamp";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:8];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (NSSet)allowedReasons
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"NotInLostMode";
  v6[1] = @"CannotDetermineLocation";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithLatitude:(id)a3 withLongitude:(id)a4 withHorizontalAccuracy:(id)a5 withVerticalAccuracy:(id)a6 withAltitude:(id)a7 withSpeed:(id)a8 withCourse:(id)a9 withTimestamp:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = objc_opt_new();
  [v24 setStatusLatitude:v23];

  [v24 setStatusLongitude:v22];
  [v24 setStatusHorizontalAccuracy:v21];

  [v24 setStatusVerticalAccuracy:v20];
  [v24 setStatusAltitude:v19];

  [v24 setStatusSpeed:v18];
  [v24 setStatusCourse:v17];

  [v24 setStatusTimestamp:v16];

  return v24;
}

+ (id)buildRequiredOnlyWithLatitude:(id)a3 withLongitude:(id)a4 withHorizontalAccuracy:(id)a5 withVerticalAccuracy:(id)a6 withAltitude:(id)a7 withSpeed:(id)a8 withCourse:(id)a9 withTimestamp:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = objc_opt_new();
  [v24 setStatusLatitude:v23];

  [v24 setStatusLongitude:v22];
  [v24 setStatusHorizontalAccuracy:v21];

  [v24 setStatusVerticalAccuracy:v20];
  [v24 setStatusAltitude:v19];

  [v24 setStatusSpeed:v18];
  [v24 setStatusCourse:v17];

  [v24 setStatusTimestamp:v16];

  return v24;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceLostmodeLocationCommand_Status allowedStatusKeys];
  [v9 minusSet:v10];

  if ([v9 count])
  {
    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_17;
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = *MEMORY[0x263F08320];
    id v12 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v9];
    v41[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
    *a4 = [v11 errorWithDomain:@"error" code:1 userInfo:v13];

    BOOL v14 = 0;
  }
  else
  {
    id v39 = 0;
    v15 = [(CEMPayloadBase *)self loadFloatFromDictionary:v6 withKey:@"Latitude" isRequired:1 defaultValue:0 error:&v39];
    id v12 = v39;
    statusLatitude = self->_statusLatitude;
    self->_statusLatitude = v15;

    if (!v12)
    {
      id v38 = 0;
      id v17 = [(CEMPayloadBase *)self loadFloatFromDictionary:v6 withKey:@"Longitude" isRequired:1 defaultValue:0 error:&v38];
      id v12 = v38;
      statusLongitude = self->_statusLongitude;
      self->_statusLongitude = v17;

      if (!v12)
      {
        id v37 = 0;
        id v19 = [(CEMPayloadBase *)self loadFloatFromDictionary:v6 withKey:@"HorizontalAccuracy" isRequired:1 defaultValue:0 error:&v37];
        id v12 = v37;
        statusHorizontalAccuracy = self->_statusHorizontalAccuracy;
        self->_statusHorizontalAccuracy = v19;

        if (!v12)
        {
          id v36 = 0;
          id v21 = [(CEMPayloadBase *)self loadFloatFromDictionary:v6 withKey:@"VerticalAccuracy" isRequired:1 defaultValue:0 error:&v36];
          id v12 = v36;
          statusVerticalAccuracy = self->_statusVerticalAccuracy;
          self->_statusVerticalAccuracy = v21;

          if (!v12)
          {
            id v35 = 0;
            id v23 = [(CEMPayloadBase *)self loadFloatFromDictionary:v6 withKey:@"Altitude" isRequired:1 defaultValue:0 error:&v35];
            id v12 = v35;
            statusAltitude = self->_statusAltitude;
            self->_statusAltitude = v23;

            if (!v12)
            {
              id v34 = 0;
              v25 = [(CEMPayloadBase *)self loadFloatFromDictionary:v6 withKey:@"Speed" isRequired:1 defaultValue:0 error:&v34];
              id v12 = v34;
              statusSpeed = self->_statusSpeed;
              self->_statusSpeed = v25;

              if (!v12)
              {
                id v33 = 0;
                v27 = [(CEMPayloadBase *)self loadFloatFromDictionary:v6 withKey:@"Course" isRequired:1 defaultValue:0 error:&v33];
                id v12 = v33;
                statusCourse = self->_statusCourse;
                self->_statusCourse = v27;

                if (!v12)
                {
                  id v32 = 0;
                  v29 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Timestamp" isRequired:1 defaultValue:0 error:&v32];
                  id v12 = v32;
                  statusTimestamp = self->_statusTimestamp;
                  self->_statusTimestamp = v29;
                }
              }
            }
          }
        }
      }
    }
    BOOL v14 = v12 == 0;
    if (a4 && v12)
    {
      id v12 = v12;
      BOOL v14 = 0;
      *a4 = v12;
    }
  }

LABEL_17:
  return v14;
}

- (id)serializePayload
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeFloatIntoDictionary:v3 withKey:@"Latitude" withValue:self->_statusLatitude isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeFloatIntoDictionary:v3 withKey:@"Longitude" withValue:self->_statusLongitude isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeFloatIntoDictionary:v3 withKey:@"HorizontalAccuracy" withValue:self->_statusHorizontalAccuracy isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeFloatIntoDictionary:v3 withKey:@"VerticalAccuracy" withValue:self->_statusVerticalAccuracy isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeFloatIntoDictionary:v3 withKey:@"Altitude" withValue:self->_statusAltitude isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeFloatIntoDictionary:v3 withKey:@"Speed" withValue:self->_statusSpeed isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeFloatIntoDictionary:v3 withKey:@"Course" withValue:self->_statusCourse isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Timestamp" withValue:self->_statusTimestamp isRequired:1 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (NSNumber)statusLatitude
{
  return self->_statusLatitude;
}

- (void)setStatusLatitude:(id)a3
{
}

- (NSNumber)statusLongitude
{
  return self->_statusLongitude;
}

- (void)setStatusLongitude:(id)a3
{
}

- (NSNumber)statusHorizontalAccuracy
{
  return self->_statusHorizontalAccuracy;
}

- (void)setStatusHorizontalAccuracy:(id)a3
{
}

- (NSNumber)statusVerticalAccuracy
{
  return self->_statusVerticalAccuracy;
}

- (void)setStatusVerticalAccuracy:(id)a3
{
}

- (NSNumber)statusAltitude
{
  return self->_statusAltitude;
}

- (void)setStatusAltitude:(id)a3
{
}

- (NSNumber)statusSpeed
{
  return self->_statusSpeed;
}

- (void)setStatusSpeed:(id)a3
{
}

- (NSNumber)statusCourse
{
  return self->_statusCourse;
}

- (void)setStatusCourse:(id)a3
{
}

- (NSString)statusTimestamp
{
  return self->_statusTimestamp;
}

- (void)setStatusTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusTimestamp, 0);
  objc_storeStrong((id *)&self->_statusCourse, 0);
  objc_storeStrong((id *)&self->_statusSpeed, 0);
  objc_storeStrong((id *)&self->_statusAltitude, 0);
  objc_storeStrong((id *)&self->_statusVerticalAccuracy, 0);
  objc_storeStrong((id *)&self->_statusHorizontalAccuracy, 0);
  objc_storeStrong((id *)&self->_statusLongitude, 0);

  objc_storeStrong((id *)&self->_statusLatitude, 0);
}

@end