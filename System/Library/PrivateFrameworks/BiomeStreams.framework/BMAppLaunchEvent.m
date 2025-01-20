@interface BMAppLaunchEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMAppLaunchEvent)initWithCoder:(id)a3;
- (BMAppLaunchEvent)initWithProto:(id)a3;
- (BMAppLaunchEvent)initWithProtoData:(id)a3;
- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleID:(id)a4 absoluteTimeStamp:(double)a5 duration:(double)a6 launchReason:(id)a7 launchType:(unint64_t)a8 parentBundleID:(id)a9 extensionHostID:(id)a10;
- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleID:(id)a4 absoluteTimeStamp:(double)a5 duration:(double)a6 launchReason:(id)a7 launchType:(unint64_t)a8 parentBundleID:(id)a9 extensionHostID:(id)a10 shortVersionString:(id)a11 exactBundleVersion:(id)a12;
- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleID:(id)a4 absoluteTimeStamp:(double)a5 launchReason:(id)a6 launchType:(unint64_t)a7 parentBundleID:(id)a8 extensionHostID:(id)a9;
- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleID:(id)a4 absoluteTimeStamp:(double)a5 launchReason:(id)a6 launchType:(unint64_t)a7 parentBundleID:(id)a8 extensionHostID:(id)a9 shortVersionString:(id)a10 exactBundleVersion:(id)a11;
- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleId:(id)a4 absoluteTimeStamp:(double)a5 launchReason:(id)a6 launchType:(unint64_t)a7;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)exactVersionString;
- (NSString)extensionHostID;
- (NSString)launchReason;
- (NSString)parentBundleID;
- (NSString)shortVersionString;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unint64_t)launchType;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)proto;
- (void)setExactVersionString:(id)a3;
- (void)setExtensionHostID:(id)a3;
- (void)setLaunchReason:(id)a3;
- (void)setLaunchType:(unint64_t)a3;
- (void)setParentBundleID:(id)a3;
- (void)setShortVersionString:(id)a3;
@end

@implementation BMAppLaunchEvent

- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleId:(id)a4 absoluteTimeStamp:(double)a5 launchReason:(id)a6 launchType:(unint64_t)a7
{
  return [(BMAppLaunchEvent *)self initWithStarting:a3 bundleID:a4 absoluteTimeStamp:a6 launchReason:a7 launchType:0 parentBundleID:0 extensionHostID:a5];
}

- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleID:(id)a4 absoluteTimeStamp:(double)a5 launchReason:(id)a6 launchType:(unint64_t)a7 parentBundleID:(id)a8 extensionHostID:(id)a9
{
  return [(BMAppLaunchEvent *)self initWithStarting:a3 bundleID:a4 absoluteTimeStamp:a6 duration:a7 launchReason:a8 launchType:a9 parentBundleID:a5 extensionHostID:0.0];
}

- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleID:(id)a4 absoluteTimeStamp:(double)a5 duration:(double)a6 launchReason:(id)a7 launchType:(unint64_t)a8 parentBundleID:(id)a9 extensionHostID:(id)a10
{
  return [(BMAppLaunchEvent *)self initWithStarting:a3 bundleID:a4 absoluteTimeStamp:a7 duration:a8 launchReason:a9 launchType:a10 parentBundleID:a5 extensionHostID:0.0 shortVersionString:0 exactBundleVersion:0];
}

- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleID:(id)a4 absoluteTimeStamp:(double)a5 launchReason:(id)a6 launchType:(unint64_t)a7 parentBundleID:(id)a8 extensionHostID:(id)a9 shortVersionString:(id)a10 exactBundleVersion:(id)a11
{
  return -[BMAppLaunchEvent initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:shortVersionString:exactBundleVersion:](self, "initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:shortVersionString:exactBundleVersion:", a3, a4, a6, a7, a8, a9, a5, 0.0);
}

- (BMAppLaunchEvent)initWithStarting:(BOOL)a3 bundleID:(id)a4 absoluteTimeStamp:(double)a5 duration:(double)a6 launchReason:(id)a7 launchType:(unint64_t)a8 parentBundleID:(id)a9 extensionHostID:(id)a10 shortVersionString:(id)a11 exactBundleVersion:(id)a12
{
  BOOL v18 = a3;
  v41[3] = *MEMORY[0x1E4F143B8];
  id v20 = a4;
  id v21 = a7;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v40.receiver = self;
  v40.super_class = (Class)BMAppLaunchEvent;
  v26 = [(BMEventBase *)&v40 init];
  if (v26)
  {
    v27 = objc_alloc_init(BMEventTimeElapsingImplementor);
    v41[0] = v27;
    id v39 = v24;
    v28 = objc_alloc_init(BMEventBinarySteppingImplementor);
    v41[1] = v28;
    unint64_t v38 = a8;
    id v29 = v23;
    id v30 = v22;
    id v31 = v21;
    id v32 = v20;
    v33 = objc_alloc_init(BMEventAppAssociatingImplementor);
    v41[2] = v33;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];
    BOOL v37 = v18;
    v35 = id v34 = v25;
    [(BMEventBase *)v26 set_validators:v35];

    id v25 = v34;
    id v20 = v32;
    id v21 = v31;
    id v22 = v30;
    id v23 = v29;

    id v24 = v39;
    [(BMAppLaunchEvent *)v26 setAbsoluteTimestamp:a5];
    [(BMAppLaunchEvent *)v26 setStarting:v37];
    [(BMAppLaunchEvent *)v26 setBundleID:v20];
    [(BMAppLaunchEvent *)v26 setDuration:a6];
    [(BMAppLaunchEvent *)v26 setLaunchReason:v21];
    [(BMAppLaunchEvent *)v26 setLaunchType:v38];
    [(BMAppLaunchEvent *)v26 setParentBundleID:v22];
    [(BMAppLaunchEvent *)v26 setExtensionHostID:v29];
    [(BMAppLaunchEvent *)v26 setShortVersionString:v39];
    [(BMAppLaunchEvent *)v26 setExactVersionString:v34];
  }

  return v26;
}

- (unsigned)dataVersion
{
  return 10;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 != 9)
  {
    if (a4 == 10)
    {
      v7 = (objc_class *)a1;
      goto LABEL_6;
    }
    if (a4 == 11)
    {
      v7 = (objc_class *)BMAppLaunchEvent_v11;
LABEL_6:
      v8 = (void *)[[v7 alloc] initWithProtoData:v6];
      goto LABEL_11;
    }
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[BMAppClipLaunchEvent eventWithData:dataVersion:](v9);
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)jsonDict
{
  v24[9] = *MEMORY[0x1E4F143B8];
  v23[0] = @"bundleId";
  uint64_t v3 = [(BMAppLaunchEvent *)self bundleID];
  id v22 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  BOOL v18 = (void *)v3;
  v24[0] = v3;
  v23[1] = @"isStart";
  id v21 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppLaunchEvent isStarting](self, "isStarting"));
  v24[1] = v21;
  v23[2] = @"time";
  v4 = NSNumber;
  [(BMAppLaunchEvent *)self absoluteTimestamp];
  id v20 = objc_msgSend(v4, "numberWithDouble:");
  v24[2] = v20;
  v23[3] = @"launchReason";
  uint64_t v5 = [(BMAppLaunchEvent *)self launchReason];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[3] = v5;
  v23[4] = @"launchType";
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMAppLaunchEvent launchType](self, "launchType", v5));
  v24[4] = v19;
  v23[5] = @"parentBundleID";
  v7 = [(BMAppLaunchEvent *)self parentBundleID];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[5] = v8;
  v23[6] = @"extensionHostID";
  v9 = [(BMAppLaunchEvent *)self extensionHostID];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[6] = v10;
  v23[7] = @"shortVersionString";
  v11 = [(BMAppLaunchEvent *)self shortVersionString];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[7] = v12;
  v23[8] = @"exactVersionString";
  v13 = [(BMAppLaunchEvent *)self exactVersionString];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[8] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:9];
  if (!v13) {

  }
  if (!v11) {
  if (!v9)
  }

  if (!v7) {
  if (!v6)
  }

  if (!v22) {

  }
  return v15;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v3 = [(BMAppLaunchEvent *)self jsonDict];
  uint64_t v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  uint64_t v5 = v8;

  if (v5)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMPOICategoryEvent json](v6);
    }
  }

  return v4;
}

- (NSString)description
{
  v2 = [(BMAppLaunchEvent *)self jsonDict];
  uint64_t v3 = [v2 description];

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMAppLaunchEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protoData"];
  if (v5)
  {
    id v6 = [(BMAppLaunchEvent *)self initWithProtoData:v5];
  }
  else
  {
    unint64_t v7 = [v4 decodeInt64ForKey:@"launchType"];
    if (v7 >= 4) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = v7;
    }
    unint64_t v21 = v8;
    uint64_t v9 = [v4 decodeBoolForKey:@"starting"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    [v4 decodeDoubleForKey:@"absoluteTimestamp"];
    double v12 = v11;
    [v4 decodeDoubleForKey:@"duration"];
    double v14 = v13;
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launchReason"];
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentBundleID"];
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionHostID"];
    BOOL v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortVersionString"];
    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exactVersionString"];
    id v6 = [(BMAppLaunchEvent *)self initWithStarting:v9 bundleID:v10 absoluteTimeStamp:v15 duration:v21 launchReason:v16 launchType:v17 parentBundleID:v12 extensionHostID:v14 shortVersionString:v18 exactBundleVersion:v19];
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMAppLaunchEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protoData"];
}

- (unint64_t)hash
{
  id v25 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppLaunchEvent isStarting](self, "isStarting"));
  uint64_t v3 = [v25 hash];
  id v24 = [(BMAppLaunchEvent *)self bundleID];
  uint64_t v4 = [v24 hash] ^ v3;
  id v5 = NSNumber;
  [(BMAppLaunchEvent *)self absoluteTimestamp];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v7 = [v6 hash];
  unint64_t v8 = NSNumber;
  [(BMAppLaunchEvent *)self duration];
  uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v10 = v4 ^ v7 ^ [v9 hash];
  double v11 = [(BMAppLaunchEvent *)self launchReason];
  uint64_t v12 = [v11 hash];
  double v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMAppLaunchEvent launchType](self, "launchType"));
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(BMAppLaunchEvent *)self parentBundleID];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  v17 = [(BMAppLaunchEvent *)self extensionHostID];
  uint64_t v18 = [v17 hash];
  v19 = [(BMAppLaunchEvent *)self shortVersionString];
  uint64_t v20 = v18 ^ [v19 hash];
  unint64_t v21 = [(BMAppLaunchEvent *)self exactVersionString];
  unint64_t v22 = v16 ^ v20 ^ [v21 hash];

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v13 = 0;
    goto LABEL_46;
  }
  id v8 = v7;
  char v9 = [(BMAppLaunchEvent *)self isStarting];
  char v10 = [v8 isStarting];
  double v11 = [(BMAppLaunchEvent *)self bundleID];
  if (!v11)
  {
    uint64_t v3 = [v8 bundleID];
    if (!v3)
    {
      char v45 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  uint64_t v4 = [(BMAppLaunchEvent *)self bundleID];
  uint64_t v12 = [v8 bundleID];
  char v45 = [v4 isEqual:v12];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_9:

  [(BMAppLaunchEvent *)self absoluteTimestamp];
  double v15 = v14;
  [v8 absoluteTimestamp];
  double v17 = v16;
  [(BMAppLaunchEvent *)self duration];
  double v19 = v18;
  [v8 duration];
  double v21 = v20;
  unint64_t v22 = [(BMAppLaunchEvent *)self launchReason];
  if (!v22)
  {
    uint64_t v3 = [v8 launchReason];
    if (!v3)
    {
      char v44 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  uint64_t v4 = [(BMAppLaunchEvent *)self launchReason];
  id v23 = [v8 launchReason];
  char v44 = [v4 isEqual:v23];

  if (!v22) {
    goto LABEL_14;
  }
LABEL_15:

  unint64_t v43 = [(BMAppLaunchEvent *)self launchType];
  uint64_t v42 = [v8 launchType];
  id v24 = [(BMAppLaunchEvent *)self parentBundleID];
  if (!v24)
  {
    uint64_t v3 = [v8 parentBundleID];
    if (!v3)
    {
      char v41 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  uint64_t v4 = [(BMAppLaunchEvent *)self parentBundleID];
  id v5 = [v8 parentBundleID];
  char v41 = [v4 isEqual:v5];

  if (!v24) {
    goto LABEL_20;
  }
LABEL_21:

  id v25 = [(BMAppLaunchEvent *)self extensionHostID];
  if (!v25)
  {
    uint64_t v4 = [v8 extensionHostID];
    if (!v4)
    {
      char v27 = 1;
LABEL_26:

      goto LABEL_27;
    }
  }
  id v5 = [(BMAppLaunchEvent *)self extensionHostID];
  v26 = [v8 extensionHostID];
  char v27 = [v5 isEqual:v26];

  if (!v25) {
    goto LABEL_26;
  }
LABEL_27:
  char v28 = v9 ^ v10;

  id v29 = [(BMAppLaunchEvent *)self shortVersionString];
  if (!v29)
  {
    id v5 = [v8 shortVersionString];
    if (!v5)
    {
      char v32 = 1;
LABEL_32:

      goto LABEL_33;
    }
  }
  id v30 = [(BMAppLaunchEvent *)self shortVersionString];
  id v31 = [v8 shortVersionString];
  char v32 = [v30 isEqual:v31];

  if (!v29) {
    goto LABEL_32;
  }
LABEL_33:
  char v33 = v28 ^ 1;

  id v34 = [(BMAppLaunchEvent *)self exactVersionString];
  if (!v34)
  {
    id v5 = [v8 exactVersionString];
    if (!v5)
    {
      char v37 = 1;
LABEL_38:

      goto LABEL_39;
    }
  }
  v35 = [(BMAppLaunchEvent *)self exactVersionString];
  v36 = [v8 exactVersionString];
  char v37 = [v35 isEqual:v36];

  if (!v34) {
    goto LABEL_38;
  }
LABEL_39:

  char v38 = v33 & v45;
  if (v15 != v17) {
    char v38 = 0;
  }
  if (v19 != v21) {
    char v38 = 0;
  }
  char v39 = v38 & v44;
  if (v43 != v42) {
    char v39 = 0;
  }
  char v13 = v39 & v41 & v27 & v32 & v37;

LABEL_46:
  return v13;
}

- (id)encodeAsProto
{
  v2 = [(BMAppLaunchEvent *)self proto];
  uint64_t v3 = [v2 data];

  return v3;
}

- (BMAppLaunchEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [v5 launchType];
      uint64_t v7 = v6;
      if (v6 >= 4)
      {
        char v10 = __biome_log_for_category();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[BMAppLaunchEvent initWithProto:](v7);
        }

        uint64_t v22 = 0;
      }
      else
      {
        uint64_t v22 = v6;
      }
      uint64_t v11 = [v5 starting];
      char v9 = [v5 bundleID];
      [v5 absoluteTimestamp];
      double v13 = v12;
      [v5 duration];
      double v15 = v14;
      double v16 = [v5 launchReason];
      double v17 = [v5 parentBundleID];
      double v18 = [v5 extensionHostID];
      double v19 = [v5 shortVersionString];
      double v20 = [v5 exactVersionString];

      self = [(BMAppLaunchEvent *)self initWithStarting:v11 bundleID:v9 absoluteTimeStamp:v16 duration:v22 launchReason:v17 launchType:v18 parentBundleID:v13 extensionHostID:v15 shortVersionString:v19 exactBundleVersion:v20];
      id v8 = self;
    }
    else
    {
      char v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BMAppLaunchEvent initWithProto:]();
      }
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BMAppLaunchEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBAppLaunchEvent alloc] initWithData:v4];

    self = [(BMAppLaunchEvent *)self initWithProto:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v3 = objc_opt_new();
  objc_msgSend(v3, "setStarting:", -[BMAppLaunchEvent isStarting](self, "isStarting"));
  id v4 = [(BMAppLaunchEvent *)self bundleID];
  [v3 setBundleID:v4];

  [(BMAppLaunchEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  [(BMAppLaunchEvent *)self duration];
  objc_msgSend(v3, "setDuration:");
  id v5 = [(BMAppLaunchEvent *)self launchReason];
  [v3 setLaunchReason:v5];

  uint64_t v6 = [(BMAppLaunchEvent *)self parentBundleID];
  [v3 setParentBundleID:v6];

  uint64_t v7 = [(BMAppLaunchEvent *)self extensionHostID];
  [v3 setExtensionHostID:v7];

  id v8 = [(BMAppLaunchEvent *)self shortVersionString];
  [v3 setShortVersionString:v8];

  char v9 = [(BMAppLaunchEvent *)self exactVersionString];
  [v3 setExactVersionString:v9];

  unint64_t v10 = [(BMAppLaunchEvent *)self launchType];
  if (v10 >= 4)
  {
    double v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BMAppLaunchEvent proto](v10);
    }

    id v11 = 0;
  }
  else
  {
    [v3 setLaunchType:v10];
    id v11 = v3;
  }

  return v11;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(id)a3
{
}

- (unint64_t)launchType
{
  return self->_launchType;
}

- (void)setLaunchType:(unint64_t)a3
{
  self->_launchType = a3;
}

- (NSString)parentBundleID
{
  return self->_parentBundleID;
}

- (void)setParentBundleID:(id)a3
{
}

- (NSString)extensionHostID
{
  return self->_extensionHostID;
}

- (void)setExtensionHostID:(id)a3
{
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (void)setShortVersionString:(id)a3
{
}

- (NSString)exactVersionString
{
  return self->_exactVersionString;
}

- (void)setExactVersionString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exactVersionString, 0);
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_extensionHostID, 0);
  objc_storeStrong((id *)&self->_parentBundleID, 0);

  objc_storeStrong((id *)&self->_launchReason, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMAppLaunchEvent: unable to convert BMPBAppLaunchType enum value: %@", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBAppLaunchEvent proto", v4, v5, v6, v7, v8);
}

- (void)proto
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMAppLaunchEvent: unable to convert BMAppLaunchType enum value: %@", v4, v5, v6, v7, v8);
}

@end