@interface BMPhotosPhotoViewEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMPhotosPhotoViewEvent)initWithCoder:(id)a3;
- (BMPhotosPhotoViewEvent)initWithProto:(id)a3;
- (BMPhotosPhotoViewEvent)initWithProtoData:(id)a3;
- (BMPhotosPhotoViewEvent)initWithUniqueId:(id)a3 locations:(id)a4 absoluteTimestamp:(double)a5;
- (BMPhotosPhotoViewEvent)initWithUniqueId:(id)a3 locations:(id)a4 absoluteTimestamp:(double)a5 contentProtection:(id)a6;
- (BMPhotosPhotoViewEvent)initWithUniqueId:(id)a3 personaId:(id)a4 locations:(id)a5 absoluteTimestamp:(double)a6 contentProtection:(id)a7;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)locations;
- (NSString)contentProtection;
- (NSString)personaId;
- (NSString)uniqueId;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMPhotosPhotoViewEvent

- (BMPhotosPhotoViewEvent)initWithUniqueId:(id)a3 personaId:(id)a4 locations:(id)a5 absoluteTimestamp:(double)a6 contentProtection:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (v14)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"BMPhotosPhotoViewEvent.m", 31, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"BMPhotosPhotoViewEvent.m", 32, @"Invalid parameter not satisfying: %@", @"locations" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)BMPhotosPhotoViewEvent;
  v18 = [(BMPhotosPhotoViewEvent *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_locations, a5);
    v19->_absoluteTimestamp = a6;
    objc_storeStrong((id *)&v19->_uniqueId, a3);
    objc_storeStrong((id *)&v19->_personaId, a4);
    objc_storeStrong((id *)&v19->_contentProtection, a7);
  }

  return v19;
}

- (BMPhotosPhotoViewEvent)initWithUniqueId:(id)a3 locations:(id)a4 absoluteTimestamp:(double)a5 contentProtection:(id)a6
{
  return [(BMPhotosPhotoViewEvent *)self initWithUniqueId:a3 personaId:0 locations:a4 absoluteTimestamp:a6 contentProtection:a5];
}

- (BMPhotosPhotoViewEvent)initWithUniqueId:(id)a3 locations:(id)a4 absoluteTimestamp:(double)a5
{
  return [(BMPhotosPhotoViewEvent *)self initWithUniqueId:a3 locations:a4 absoluteTimestamp:0 contentProtection:a5];
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMPhotosPhotoViewEvent eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v2 = [(BMPhotosPhotoViewEvent *)self proto];
  v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMPhotosPhotoViewEvent *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMPhotosPhotoViewEvent *)(uint64_t)v5 json];
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMPhotosPhotoViewEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMPhotosPhotoViewEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMPhotosPhotoViewEvent *)self initWithProtoData:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMPhotosPhotoViewEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMPhotosPhotoViewEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasAbsoluteTimestamp]
        && ([v5 hasUniqueId] & 1) != 0)
      {
        id v6 = [v5 uniqueId];
        v7 = [v5 personaId];
        id v8 = [v5 locations];
        [v5 absoluteTimestamp];
        double v10 = v9;
        v11 = [v5 contentProtection];
        self = [(BMPhotosPhotoViewEvent *)self initWithUniqueId:v6 personaId:v7 locations:v8 absoluteTimestamp:v11 contentProtection:v10];

        v12 = self;
LABEL_13:

        goto LABEL_14;
      }
      v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[BMPhotosPhotoViewEvent initWithProto:](v13);
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMPhotosPhotoViewEvent initWithProto:](v5);
      }
    }
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (BMPhotosPhotoViewEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBPhotosPhotoViewEvent alloc] initWithData:v4];

    self = [(BMPhotosPhotoViewEvent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMPhotosPhotoViewEvent *)self locations];
  id v5 = (void *)[v4 mutableCopy];
  [v3 setLocations:v5];

  [(BMPhotosPhotoViewEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  id v6 = [(BMPhotosPhotoViewEvent *)self uniqueId];
  [v3 setUniqueId:v6];

  v7 = [(BMPhotosPhotoViewEvent *)self personaId];
  [v3 setPersonaId:v7];

  id v8 = [(BMPhotosPhotoViewEvent *)self contentProtection];
  [v3 setContentProtection:v8];

  return v3;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_uniqueId hash] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(BMPhotosPhotoViewEvent *)self proto];
    v7 = [v5 proto];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  if ([(NSArray *)self->_locations count] && self->_uniqueId) {
    return 1;
  }
  if (!a4) {
    return 0;
  }
  id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
  BOOL result = 0;
  *a4 = v7;
  return result;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSArray)locations
{
  return self->_locations;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_personaId, 0);

  objc_storeStrong((id *)&self->_uniqueId, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 2;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMPhotosPhotoViewEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMPhotosPhotoViewEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMPhotosPhotoViewEvent: tried to initialize with a proto missing required data.", v1, 2u);
}

- (void)initWithProto:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMPhotosPhotoViewEvent: tried to initialize with a non-BMPhotosPhotoViewEvent proto", v1, 2u);
}

@end