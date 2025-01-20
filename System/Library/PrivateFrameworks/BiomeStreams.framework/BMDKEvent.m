@interface BMDKEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithDKEvent:(id)a3;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMDKEvent)initWithCoder:(id)a3;
- (BMDKEvent)initWithDKEvent:(id)a3;
- (BMDKEvent)initWithData:(id)a3 dataVersion:(unsigned int)a4 decodeMetadata:(BOOL)a5;
- (BMDKEvent)initWithProto:(id)a3;
- (BMDKEvent)initWithProtoData:(id)a3;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (_DKEvent)dkEvent;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMDKEvent

- (unsigned)dataVersion
{
  return 2;
}

- (void).cxx_destruct
{
}

- (id)encodeAsProto
{
  v3 = +[BMDKEventCodec codecWithVersion:2];
  v4 = [v3 encodeAsProtoData:self];

  return v4;
}

- (_DKEvent)dkEvent
{
  return self->_dkEvent;
}

- (BMDKEvent)initWithDKEvent:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"BMDKEvent.m", 35, @"Invalid parameter not satisfying: %@", @"dkEvent != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)BMDKEvent;
  v7 = [(BMDKEvent *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_dkEvent, a3);
  }

  return v8;
}

+ (id)eventWithDKEvent:(id)a3
{
  id v3 = a3;
  v4 = [[BMDKEvent alloc] initWithDKEvent:v3];

  return v4;
}

- (BMDKEvent)initWithData:(id)a3 dataVersion:(unsigned int)a4 decodeMetadata:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = +[BMDKEventCodec codecWithVersion:v6];
  [v9 setDecodeMetadata:v5];
  v10 = [v9 decodeWithProtoData:v8];

  return v10;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  uint64_t v6 = +[BMDKEventCodec codecWithVersion:v4];
  v7 = [v6 decodeWithProtoData:v5];

  return v7;
}

- (id)jsonDict
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v4 = [(_DKEvent *)self->_dkEvent metadata];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v71 objects:v77 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v72 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        v10 = [(_DKEvent *)self->_dkEvent metadata];
        objc_super v11 = [v10 objectForKeyedSubscript:v9];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v12 = [v11 description];

            objc_super v11 = (void *)v12;
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v3 setObject:v11 forKeyedSubscript:v9];
        }
        else
        {
          v13 = [v9 description];
          [v3 setObject:v11 forKeyedSubscript:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v71 objects:v77 count:16];
    }
    while (v6);
  }

  v14 = objc_opt_new();
  v15 = [(_DKEvent *)self->_dkEvent source];

  if (v15)
  {
    v16 = [(_DKEvent *)self->_dkEvent source];
    v17 = [v16 sourceID];
    if (v17)
    {
      [v14 setObject:v17 forKeyedSubscript:@"sourceID"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v14 setObject:v18 forKeyedSubscript:@"sourceID"];
    }
    v19 = [(_DKEvent *)self->_dkEvent source];
    v20 = [v19 bundleID];
    if (v20)
    {
      [v14 setObject:v20 forKeyedSubscript:@"bundleID"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v14 setObject:v21 forKeyedSubscript:@"bundleID"];
    }
    v22 = [(_DKEvent *)self->_dkEvent source];
    v23 = [v22 itemID];
    if (v23)
    {
      [v14 setObject:v23 forKeyedSubscript:@"itemID"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v14 setObject:v24 forKeyedSubscript:@"itemID"];
    }
    v25 = [(_DKEvent *)self->_dkEvent source];
    v26 = [v25 groupID];
    if (v26)
    {
      [v14 setObject:v26 forKeyedSubscript:@"groupID"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v14 setObject:v27 forKeyedSubscript:@"groupID"];
    }
    v28 = [(_DKEvent *)self->_dkEvent source];
    v29 = [v28 deviceID];
    if (v29)
    {
      [v14 setObject:v29 forKeyedSubscript:@"deviceID"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v14 setObject:v30 forKeyedSubscript:@"deviceID"];
    }
    v31 = [(_DKEvent *)self->_dkEvent source];
    v32 = [v31 userID];
    if (v32)
    {
      [v14 setObject:v32 forKeyedSubscript:@"userID"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v14 setObject:v33 forKeyedSubscript:@"userID"];
    }
  }
  v34 = [(_DKEvent *)self->_dkEvent value];

  if (v34)
  {
    v35 = [(_DKEvent *)self->_dkEvent value];
    v36 = [v35 stringValue];
    v37 = v36;
    if (v36)
    {
      id v38 = v36;
    }
    else
    {
      id v38 = [(_DKEvent *)self->_dkEvent description];
    }
    id v39 = v38;
  }
  else
  {
    id v39 = 0;
  }
  v75[0] = @"UUID";
  v68 = [(_DKEvent *)self->_dkEvent UUID];
  uint64_t v40 = [v68 UUIDString];
  v41 = (void *)v40;
  if (!v40)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = (void *)v40;
  v76[0] = v40;
  v75[1] = @"startDate";
  v66 = [(_DKEvent *)self->_dkEvent startDate];
  uint64_t v42 = [v66 description];
  v65 = (void *)v42;
  if (!v42)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v60 = (void *)v42;
  v76[1] = v42;
  v75[2] = @"endDate";
  v64 = [(_DKEvent *)self->_dkEvent endDate];
  uint64_t v43 = [v64 description];
  v44 = (void *)v43;
  if (!v43)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v59 = (void *)v43;
  v76[2] = v43;
  v75[3] = @"timeZone";
  v63 = [(_DKEvent *)self->_dkEvent timeZone];
  uint64_t v45 = [v63 description];
  v46 = (void *)v45;
  if (!v45)
  {
    uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = (void *)v45;
  v76[3] = v45;
  v75[4] = @"value";
  uint64_t v47 = (uint64_t)v39;
  v69 = v39;
  if (!v39)
  {
    uint64_t v47 = [MEMORY[0x1E4F1CA98] null];
  }
  v67 = v41;
  v76[4] = v47;
  v76[5] = v3;
  v75[5] = @"metadata";
  v75[6] = @"confidence";
  v48 = NSNumber;
  [(_DKEvent *)self->_dkEvent confidence];
  v49 = objc_msgSend(v48, "numberWithDouble:");
  v76[6] = v49;
  v76[7] = v14;
  v70 = v14;
  v75[7] = @"source";
  v75[8] = @"creationDate";
  v50 = [(_DKEvent *)self->_dkEvent creationDate];
  v51 = [v50 description];
  v52 = v51;
  if (!v51)
  {
    v52 = [MEMORY[0x1E4F1CA98] null];
  }
  v76[8] = v52;
  v75[9] = @"localCreationDate";
  v53 = [(_DKEvent *)self->_dkEvent localCreationDate];
  v54 = [v53 description];
  v55 = v54;
  if (!v54)
  {
    v55 = [MEMORY[0x1E4F1CA98] null];
  }
  v76[9] = v55;
  id v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:10];
  if (!v54) {

  }
  if (!v51) {
  if (!v69)
  }

  if (!v46) {
  if (!v44)
  }

  if (!v65) {
  if (!v67)
  }

  return v62;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(BMDKEvent *)self jsonDict];
  id v8 = 0;
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:3 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    uint64_t v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMDKEvent *)(uint64_t)v5 json];
    }
  }

  return v4;
}

- (BMDKEvent)initWithProto:(id)a3
{
  id v4 = a3;
  id v5 = +[BMDKEventCodec codecWithVersion:2];
  uint64_t v6 = [v5 decodeWithProto:v4];

  return v6;
}

- (BMDKEvent)initWithProtoData:(id)a3
{
  id v4 = a3;
  id v5 = +[BMDKEventCodec codecWithVersion:2];
  uint64_t v6 = [v5 decodeWithProtoData:v4];

  return v6;
}

- (id)proto
{
  id v3 = +[BMDKEventCodec codecWithVersion:2];
  id v4 = [v3 encodeAsProto:self];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMDKEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMDKEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  uint64_t v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMDKEvent *)self initWithProtoData:v6];
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(_DKEvent *)self->_dkEvent hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(BMDKEvent *)self proto];
    uint64_t v7 = [v5 proto];

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
  dkEvent = self->_dkEvent;
  if (a4 && !dkEvent)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
  }
  return dkEvent != 0;
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMDKEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

@end