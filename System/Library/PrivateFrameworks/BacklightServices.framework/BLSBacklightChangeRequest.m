@interface BLSBacklightChangeRequest
+ (BOOL)supportsSecureCoding;
+ (id)validMetadataClasses;
- (BLSBacklightChangeRequest)initWithCoder:(id)a3;
- (BLSBacklightChangeRequest)initWithRequestedActivityState:(int64_t)a3 explanation:(id)a4 timestamp:(unint64_t)a5 sourceEvent:(int64_t)a6 sourceEventMetadata:(id)a7;
- (BLSBacklightChangeRequest)initWithXPCDictionary:(id)a3;
- (BLSBacklightChangeSourceEventMetadata)sourceEventMetadata;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)explanation;
- (int64_t)requestedActivityState;
- (int64_t)sourceEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSBacklightChangeRequest

- (BLSBacklightChangeRequest)initWithRequestedActivityState:(int64_t)a3 explanation:(id)a4 timestamp:(unint64_t)a5 sourceEvent:(int64_t)a6 sourceEventMetadata:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BLSBacklightChangeRequest;
  v14 = [(BLSBacklightChangeRequest *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_requestedActivityState = a3;
    v14->_timestamp = a5;
    uint64_t v16 = [v12 copy];
    explanation = v15->_explanation;
    v15->_explanation = (NSString *)v16;

    v15->_sourceEvent = a6;
    objc_storeStrong((id *)&v15->_sourceEventMetadata, a7);
  }

  return v15;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = v3;
  int64_t requestedActivityState = self->_requestedActivityState;
  v6 = @"Off/Inactive";
  if (requestedActivityState == 1) {
    v6 = @"On/Active";
  }
  if (requestedActivityState == 2) {
    v7 = @"Dimmed";
  }
  else {
    v7 = v6;
  }
  [v3 appendString:v7 withName:@"requestedState"];
  [v4 appendString:self->_explanation withName:@"explanation"];
  id v8 = (id)[v4 appendUInt64:self->_timestamp withName:@"timestamp"];
  v9 = NSStringFromBLSBacklightChangeSourceEvent(self->_sourceEvent);
  [v4 appendString:v9 withName:@"source"];

  id v10 = (id)[v4 appendObject:self->_sourceEventMetadata withName:@"metadata" skipIfNil:1];
  v11 = [v4 build];

  return (NSString *)v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_requestedActivityState];
  id v5 = (id)[v3 appendString:self->_explanation];
  id v6 = (id)[v3 appendUnsignedInteger:self->_timestamp];
  id v7 = (id)[v3 appendUnsignedInteger:HIDWORD(self->_timestamp)];
  id v8 = (id)[v3 appendInteger:self->_sourceEvent];
  id v9 = (id)[v3 appendObject:self->_sourceEventMetadata];
  unint64_t v10 = [v3 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BLSBacklightChangeRequest *)a3;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int64_t requestedActivityState = self->_requestedActivityState;
      if (requestedActivityState != [(BLSBacklightChangeRequest *)v5 requestedActivityState]
        || (unint64_t timestamp = self->_timestamp, timestamp != [(BLSBacklightChangeRequest *)v5 timestamp])
        || (int64_t sourceEvent = self->_sourceEvent, sourceEvent != [(BLSBacklightChangeRequest *)v5 sourceEvent]))
      {
        char v14 = 0;
LABEL_15:

        goto LABEL_16;
      }
      explanation = self->_explanation;
      unint64_t v10 = [(BLSBacklightChangeRequest *)v5 explanation];
      if ([explanation isEqual:v10])
      {
        sourceEventMetadata = self->_sourceEventMetadata;
        id v12 = sourceEventMetadata;
        if (!sourceEventMetadata)
        {
          explanation = [(BLSBacklightChangeRequest *)v5 sourceEventMetadata];
          if (!explanation)
          {
            char v14 = 1;
LABEL_19:

            goto LABEL_20;
          }
          id v12 = self->_sourceEventMetadata;
        }
        id v13 = [(BLSBacklightChangeRequest *)v5 sourceEventMetadata];
        char v14 = [(BLSBacklightChangeSourceEventMetadata *)v12 isEqual:v13];

        if (!sourceEventMetadata) {
          goto LABEL_19;
        }
      }
      else
      {
        char v14 = 0;
      }
LABEL_20:

      goto LABEL_15;
    }
    char v14 = 0;
  }
LABEL_16:

  return v14;
}

- (BLSBacklightChangeRequest)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (const char *)[@"requestedState" UTF8String];
  id v6 = (const char *)[@"explanation" UTF8String];
  id v7 = (const char *)[@"timestamp" UTF8String];
  id v8 = (const char *)[@"source" UTF8String];
  id v9 = (const char *)[@"metadata" UTF8String];
  int64_t int64 = xpc_dictionary_get_int64(v4, v5);
  string = xpc_dictionary_get_string(v4, v6);
  if (string)
  {
    id v12 = [NSString stringWithUTF8String:string];
  }
  else
  {
    id v13 = bls_backlight_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BLSBacklightChangeRequest initWithXPCDictionary:]((uint64_t)v4, v13);
    }

    id v12 = @"<NULL>";
  }
  int64_t v14 = xpc_dictionary_get_int64(v4, v7);
  int64_t v15 = xpc_dictionary_get_int64(v4, v8);
  uint64_t v16 = xpc_dictionary_get_string(v4, "metadataClass");
  if (v16)
  {
    v17 = v16;
    v18 = xpc_dictionary_get_dictionary(v4, v9);
    if (v18)
    {
      objc_super v19 = [NSString stringWithUTF8String:v17];
      Class v20 = NSClassFromString(v19);
      if (!v20) {
        goto LABEL_12;
      }
      v21 = v20;
      +[BLSBacklightChangeRequest validMetadataClasses]();
      int64_t v32 = v15;
      int64_t v22 = v14;
      v23 = v19;
      int64_t v24 = int64;
      v26 = v25 = self;
      int v27 = [v26 containsObject:v21];

      self = v25;
      int64_t int64 = v24;
      objc_super v19 = v23;
      int64_t v14 = v22;
      int64_t v15 = v32;
      if (v27)
      {
        v28 = (void *)[[v21 alloc] initWithXPCDictionary:v18];
      }
      else
      {
LABEL_12:
        v29 = bls_backlight_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          [(BLSBacklightChangeRequest *)(uint64_t)v19 initWithXPCDictionary:v29];
        }

        v28 = 0;
      }
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
    v28 = 0;
  }
  v30 = [(BLSBacklightChangeRequest *)self initWithRequestedActivityState:int64 explanation:v12 timestamp:v14 sourceEvent:v15 sourceEventMetadata:v28];

  return v30;
}

+ (id)validMetadataClasses
{
  self;
  if (validMetadataClasses_onceToken != -1) {
    dispatch_once(&validMetadataClasses_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)validMetadataClasses_metaDataClasses;

  return v0;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (const char *)[@"requestedState" UTF8String];
  id v6 = (const char *)[@"explanation" UTF8String];
  id v7 = (const char *)[@"timestamp" UTF8String];
  id v8 = (const char *)[@"source" UTF8String];
  id v9 = (const char *)[@"metadata" UTF8String];
  xpc_dictionary_set_int64(v4, v5, self->_requestedActivityState);
  xpc_dictionary_set_string(v4, v6, [(NSString *)self->_explanation UTF8String]);
  xpc_dictionary_set_int64(v4, v7, self->_timestamp);
  xpc_dictionary_set_int64(v4, v8, self->_sourceEvent);
  p_sourceEventMetadata = &self->_sourceEventMetadata;
  if (self->_sourceEventMetadata)
  {
    v11 = +[BLSBacklightChangeRequest validMetadataClasses]();
    int v12 = [v11 containsObject:objc_opt_class()];

    if (v12)
    {
      id v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      id v14 = objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_string(v4, "metadataClass", (const char *)[v14 UTF8String]);
      xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
      [(BLSBacklightChangeSourceEventMetadata *)*p_sourceEventMetadata encodeWithXPCDictionary:v15];
      xpc_dictionary_set_value(v4, v9, v15);
    }
    else
    {
      uint64_t v16 = bls_backlight_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        [(BLSBacklightChangeRequest *)(uint64_t)self encodeWithXPCDictionary:v16];
      }
    }
  }
}

void __49__BLSBacklightChangeRequest_validMetadataClasses__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)validMetadataClasses_metaDataClasses;
  validMetadataClasses_metaDataClasses = v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSBacklightChangeRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"requestedState"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"explanation"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"timestamp"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"source"];
  id v9 = +[BLSBacklightChangeRequest validMetadataClasses]();
  unint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"metadata"];

  v11 = [(BLSBacklightChangeRequest *)self initWithRequestedActivityState:v5 explanation:v6 timestamp:v7 sourceEvent:v8 sourceEventMetadata:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInteger:self->_requestedActivityState forKey:@"requestedState"];
  [v6 encodeObject:self->_explanation forKey:@"explanation"];
  [v6 encodeInt64:self->_timestamp forKey:@"timestamp"];
  [v6 encodeInteger:self->_sourceEvent forKey:@"source"];
  id v4 = +[BLSBacklightChangeRequest validMetadataClasses]();
  int v5 = [v4 containsObject:objc_opt_class()];

  if (v5) {
    [v6 encodeObject:self->_sourceEventMetadata forKey:@"metadata"];
  }
}

- (int64_t)requestedActivityState
{
  return self->_requestedActivityState;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)sourceEvent
{
  return self->_sourceEvent;
}

- (BLSBacklightChangeSourceEventMetadata)sourceEventMetadata
{
  return self->_sourceEventMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventMetadata, 0);

  objc_storeStrong((id *)&self->_explanation, 0);
}

- (void)initWithXPCDictionary:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1B55DE000, log, OS_LOG_TYPE_FAULT, "unknown %@ class cannot init with %@", (uint8_t *)&v3, 0x16u);
}

- (void)initWithXPCDictionary:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_FAULT, "failed to decode explanation from %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)encodeWithXPCDictionary:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = *a2;
  int v9 = 134218498;
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  int v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = v8;
  _os_log_fault_impl(&dword_1B55DE000, a3, OS_LOG_TYPE_FAULT, "%p unknown class:%{public}@ cannot encode %{public}@", (uint8_t *)&v9, 0x20u);
}

@end