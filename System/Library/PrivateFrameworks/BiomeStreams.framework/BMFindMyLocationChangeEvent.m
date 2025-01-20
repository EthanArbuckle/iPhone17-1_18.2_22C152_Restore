@interface BMFindMyLocationChangeEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMFindMyLocationChangeEvent)initWithIDSHandle:(id)a3 locationChangeType:(unint64_t)a4;
- (BMFindMyLocationChangeEvent)initWithIDSHandle:(id)a3 locationChangeType:(unint64_t)a4 motionActivityState:(int64_t)a5 latitude:(id)a6 longitude:(id)a7 name:(id)a8;
- (BMFindMyLocationChangeEvent)initWithProto:(id)a3;
- (BMFindMyLocationChangeEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSString)description;
- (NSString)idsHandle;
- (NSString)name;
- (id)encodeAsProto;
- (id)proto;
- (int64_t)motionActivityState;
- (unint64_t)locationChangeType;
- (unsigned)dataVersion;
- (void)proto;
- (void)setIdsHandle:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLocationChangeType:(unint64_t)a3;
- (void)setLongitude:(id)a3;
- (void)setMotionActivityState:(int64_t)a3;
- (void)setName:(id)a3;
@end

@implementation BMFindMyLocationChangeEvent

- (BMFindMyLocationChangeEvent)initWithIDSHandle:(id)a3 locationChangeType:(unint64_t)a4
{
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithDouble:0.0];
  v9 = [NSNumber numberWithDouble:0.0];
  v10 = [(BMFindMyLocationChangeEvent *)self initWithIDSHandle:v7 locationChangeType:a4 motionActivityState:0 latitude:v8 longitude:v9 name:&stru_1EDD7E578];

  return v10;
}

- (BMFindMyLocationChangeEvent)initWithIDSHandle:(id)a3 locationChangeType:(unint64_t)a4 motionActivityState:(int64_t)a5 latitude:(id)a6 longitude:(id)a7 name:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BMFindMyLocationChangeEvent;
  v15 = [(BMEventBase *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_idsHandle, a3);
    v16->_locationChangeType = a4;
    v16->_motionActivityState = a5;
    v17 = [NSNumber numberWithDouble:0.0];
    longitude = v16->_longitude;
    v16->_longitude = v17;

    objc_storeStrong((id *)&v16->_latitude, v17);
    if (v14) {
      v19 = (__CFString *)v14;
    }
    else {
      v19 = &stru_1EDD7E578;
    }
    name = v16->_name;
    v16->_name = &v19->isa;
  }
  return v16;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  idsHandle = self->_idsHandle;
  v5 = [NSNumber numberWithUnsignedInteger:self->_locationChangeType];
  int64_t motionActivityState = self->_motionActivityState;
  [(NSNumber *)self->_latitude doubleValue];
  uint64_t v8 = v7;
  [(NSNumber *)self->_longitude doubleValue];
  v10 = (void *)[v3 initWithFormat:@"FindMyLocationChangeEvent event with idsHandle: %@ locationChangeType: %@ activity: %ld lat: %f lng: %f name:%@", idsHandle, v5, motionActivityState, v8, v9, self->_name];

  return (NSString *)v10;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1) {
    v4 = (objc_class *)BMFindMyLocationChangeEvent_v1;
  }
  else {
    v4 = (objc_class *)a1;
  }
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithProtoData:v5];

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(BMFindMyLocationChangeEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMFindMyLocationChangeEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [v5 idsHandle];
      uint64_t v7 = [v5 locationChangeType];
      uint64_t v8 = v7;
      if (v7 >= 3)
      {
        v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BMFindMyLocationChangeEvent initWithProto:](v8);
        }

        uint64_t v9 = 3;
      }
      else
      {
        uint64_t v9 = v7;
      }
      uint64_t v12 = activityTypeWithState([v5 activityState]);
      id v13 = NSNumber;
      [v5 latitude];
      id v14 = objc_msgSend(v13, "numberWithDouble:");
      v15 = NSNumber;
      [v5 longitude];
      v16 = objc_msgSend(v15, "numberWithDouble:");
      v17 = [v5 name];
      self = [(BMFindMyLocationChangeEvent *)self initWithIDSHandle:v6 locationChangeType:v9 motionActivityState:v12 latitude:v14 longitude:v16 name:v17];

      v10 = self;
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMFindMyLocationChangeEvent initWithProto:]();
      }
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BMFindMyLocationChangeEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBFindMyLocationChangeEvent alloc] initWithData:v4];

    self = [(BMFindMyLocationChangeEvent *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  id v3 = objc_opt_new();
  id v4 = [(BMFindMyLocationChangeEvent *)self idsHandle];
  [v3 setIdsHandle:v4];

  unint64_t v5 = [(BMFindMyLocationChangeEvent *)self locationChangeType];
  if (!v5)
  {
    uint64_t v8 = 0;
LABEL_7:
    int v7 = 1;
    goto LABEL_11;
  }
  uint64_t v6 = v5;
  if (v5 == 2)
  {
    uint64_t v8 = 2;
    goto LABEL_7;
  }
  if (v5 == 1)
  {
    int v7 = 1;
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMFindMyLocationChangeEvent proto](v6);
    }

    int v7 = 0;
    uint64_t v8 = 0xFFFFFFFFLL;
  }
LABEL_11:
  unint64_t motionActivityState = self->_motionActivityState;
  if (motionActivityState >= 6)
  {
    uint64_t v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BMFindMyLocationChangeEvent proto](motionActivityState);
    }
  }
  else if (v7)
  {
    [v3 setLocationChangeType:v8];
    [v3 setActivityState:motionActivityState];
    [(NSNumber *)self->_latitude doubleValue];
    objc_msgSend(v3, "setLatitude:");
    [(NSNumber *)self->_longitude doubleValue];
    objc_msgSend(v3, "setLongitude:");
    [v3 setName:self->_name];
    id v11 = v3;
    goto LABEL_18;
  }
  id v11 = 0;
LABEL_18:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    idsHandle = self->_idsHandle;
    int v7 = [v5 idsHandle];
    if ([(NSString *)idsHandle isEqualToString:v7]
      && (unint64_t locationChangeType = self->_locationChangeType, locationChangeType == [v5 locationChangeType])
      && (int64_t motionActivityState = self->_motionActivityState,
          motionActivityState == [v5 motionActivityState]))
    {
      latitude = self->_latitude;
      id v11 = [v5 latitude];
      if (latitude == v11)
      {
        longitude = self->_longitude;
        v15 = [v5 longitude];
        if (longitude == v15)
        {
          name = self->_name;
          v17 = [v5 name];
          BOOL v12 = [(NSString *)name isEqualToString:v17];
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (NSString)idsHandle
{
  return self->_idsHandle;
}

- (void)setIdsHandle:(id)a3
{
}

- (unint64_t)locationChangeType
{
  return self->_locationChangeType;
}

- (void)setLocationChangeType:(unint64_t)a3
{
  self->_unint64_t locationChangeType = a3;
}

- (int64_t)motionActivityState
{
  return self->_motionActivityState;
}

- (void)setMotionActivityState:(int64_t)a3
{
  self->_int64_t motionActivityState = a3;
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);

  objc_storeStrong((id *)&self->_idsHandle, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMFindMyLocationChangeEvent: unable to convert BMPBFindMyLocationChangeType enum value: %@", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBFindMyLocationChangeEvent proto", v4, v5, v6, v7, v8);
}

- (void)proto
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMFindMyLocationChangeEvent: unable to convert BMFindMyLocationChangeType enum value: %@", v4, v5, v6, v7, v8);
}

@end