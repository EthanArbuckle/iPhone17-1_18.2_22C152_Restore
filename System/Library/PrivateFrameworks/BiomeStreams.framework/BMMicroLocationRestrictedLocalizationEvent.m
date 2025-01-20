@interface BMMicroLocationRestrictedLocalizationEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMMicroLocationRestrictedLocalizationEvent)initWithAbsoluteTimeStamp:(double)a3 clientBundleIdentifier:(id)a4 maxProbabilityLabelIdentifier:(id)a5 maxProbability:(double)a6 probabilityVector:(id)a7 numDevicesVector:(id)a8;
- (BMMicroLocationRestrictedLocalizationEvent)initWithProto:(id)a3;
- (BMMicroLocationRestrictedLocalizationEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)numDevicesVector;
- (NSArray)probabilityVector;
- (NSString)clientBundleIdentifier;
- (NSUUID)maxProbabilityLabelIdentifier;
- (double)absoluteTimestamp;
- (double)maxProbability;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
@end

@implementation BMMicroLocationRestrictedLocalizationEvent

- (BMMicroLocationRestrictedLocalizationEvent)initWithAbsoluteTimeStamp:(double)a3 clientBundleIdentifier:(id)a4 maxProbabilityLabelIdentifier:(id)a5 maxProbability:(double)a6 probabilityVector:(id)a7 numDevicesVector:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)BMMicroLocationRestrictedLocalizationEvent;
  v18 = [(BMMicroLocationRestrictedLocalizationEvent *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_absoluteTimestamp = a3;
    uint64_t v20 = [v14 copy];
    clientBundleIdentifier = v19->_clientBundleIdentifier;
    v19->_clientBundleIdentifier = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    maxProbabilityLabelIdentifier = v19->_maxProbabilityLabelIdentifier;
    v19->_maxProbabilityLabelIdentifier = (NSUUID *)v22;

    v19->_maxProbability = a6;
    objc_storeStrong((id *)&v19->_probabilityVector, a7);
    objc_storeStrong((id *)&v19->_numDevicesVector, a8);
  }

  return v19;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMMicroLocationRestrictedLocalizationEvent eventWithData:dataVersion:]();
    }

    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMMicroLocationRestrictedLocalizationEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMMicroLocationRestrictedLocalizationEvent)initWithProto:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v38 = v4;
      v5 = v4;
      id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v37 = v5;
      v7 = [v5 probabilityVectors];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v45 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            v13 = [BMMicroLocationProbabilityPerLabel alloc];
            id v14 = objc_alloc(MEMORY[0x1E4F29128]);
            id v15 = [v12 label];
            id v16 = (void *)[v14 initWithUUIDString:v15];
            [v12 probability];
            id v17 = -[BMMicroLocationProbabilityPerLabel initWithLabelIdentifier:probability:](v13, "initWithLabelIdentifier:probability:", v16);
            [v39 addObject:v17];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v9);
      }

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v18 = v37;
      v19 = [v37 numDevicesVectors];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v41 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v40 + 1) + 8 * j);
            objc_super v25 = [BMMicroLocationNumDevicesPerTechnology alloc];
            v26 = [v24 technologyString];
            v27 = -[BMMicroLocationNumDevicesPerTechnology initWithTechnology:numDevices:](v25, "initWithTechnology:numDevices:", v26, [v24 number]);
            [v6 addObject:v27];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v21);
      }

      [v37 absoluteTimeStamp];
      double v29 = v28;
      v30 = [v37 clientBundleId];
      id v31 = objc_alloc(MEMORY[0x1E4F29128]);
      v32 = [v37 maxProbabilityLabel];
      v33 = (void *)[v31 initWithUUIDString:v32];
      [v37 maxProbability];
      self = [(BMMicroLocationRestrictedLocalizationEvent *)self initWithAbsoluteTimeStamp:v30 clientBundleIdentifier:v33 maxProbabilityLabelIdentifier:v39 maxProbability:v6 probabilityVector:v29 numDevicesVector:v34];

      v35 = self;
      id v4 = v38;
    }
    else
    {
      v18 = __biome_log_for_category();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[BMMicroLocationRestrictedLocalizationEvent initWithProto:]((uint64_t)self, v18);
      }
      v35 = 0;
    }
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (BMMicroLocationRestrictedLocalizationEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[BMPBMicroLocationRestrictedLocalizationEvent alloc] initWithData:v4];

    self = [(BMMicroLocationRestrictedLocalizationEvent *)self initWithProto:v5];
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
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_probabilityVector, "count"));
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_numDevicesVector, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v5 = self->_probabilityVector;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v24 + 1) + 8 * i) proto];
        [v3 addObject:v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v11 = self->_numDevicesVector;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "proto", (void)v20);
        [v4 addObject:v16];
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v13);
  }

  id v17 = objc_opt_new();
  [v17 setAbsoluteTimeStamp:self->_absoluteTimestamp];
  [v17 setClientBundleId:self->_clientBundleIdentifier];
  v18 = [(NSUUID *)self->_maxProbabilityLabelIdentifier UUIDString];
  [v17 setMaxProbabilityLabel:v18];

  [v17 setMaxProbability:self->_maxProbability];
  [v17 setProbabilityVectors:v3];
  [v17 setNumDevicesVectors:v4];

  return v17;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_clientBundleIdentifier hash];
  uint64_t v6 = v5 ^ [(NSUUID *)self->_maxProbabilityLabelIdentifier hash] ^ v4;
  uint64_t v7 = [NSNumber numberWithDouble:self->_maxProbability];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSArray *)self->_probabilityVector hash];
  unint64_t v10 = v9 ^ [(NSArray *)self->_numDevicesVector hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v14 = 0;
    goto LABEL_37;
  }
  id v7 = v6;
  double absoluteTimestamp = self->_absoluteTimestamp;
  [v7 absoluteTimestamp];
  double v10 = v9;
  clientBundleIdentifier = self->_clientBundleIdentifier;
  uint64_t v12 = clientBundleIdentifier;
  if (clientBundleIdentifier)
  {
LABEL_5:
    uint64_t v4 = [v7 clientBundleIdentifier];
    char v13 = [(NSString *)v12 isEqual:v4];

    if (clientBundleIdentifier) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v3 = [v7 clientBundleIdentifier];
  if (v3)
  {
    uint64_t v12 = self->_clientBundleIdentifier;
    goto LABEL_5;
  }
  char v13 = 1;
LABEL_9:

LABEL_10:
  maxProbabilityLabelIdentifier = self->_maxProbabilityLabelIdentifier;
  id v16 = maxProbabilityLabelIdentifier;
  if (maxProbabilityLabelIdentifier) {
    goto LABEL_13;
  }
  uint64_t v4 = [v7 maxProbabilityLabelIdentifier];
  if (v4)
  {
    id v16 = self->_maxProbabilityLabelIdentifier;
LABEL_13:
    clientBundleIdentifier = [v7 maxProbabilityLabelIdentifier];
    char v17 = [(NSUUID *)v16 isEqual:clientBundleIdentifier];

    if (maxProbabilityLabelIdentifier) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  char v17 = 1;
LABEL_16:

LABEL_17:
  double maxProbability = self->_maxProbability;
  [v7 maxProbability];
  double v20 = v19;
  probabilityVector = self->_probabilityVector;
  long long v22 = probabilityVector;
  if (probabilityVector) {
    goto LABEL_20;
  }
  clientBundleIdentifier = [v7 probabilityVector];
  if (clientBundleIdentifier)
  {
    long long v22 = self->_probabilityVector;
LABEL_20:
    long long v23 = [v7 probabilityVector];
    char v24 = [(NSArray *)v22 isEqual:v23];

    if (probabilityVector) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  char v24 = 1;
LABEL_23:

LABEL_24:
  double v25 = vabdd_f64(absoluteTimestamp, v10);
  double v26 = vabdd_f64(maxProbability, v20);
  numDevicesVector = self->_numDevicesVector;
  double v28 = numDevicesVector;
  if (!numDevicesVector)
  {
    clientBundleIdentifier = [v7 numDevicesVector];
    if (!clientBundleIdentifier)
    {
      char v30 = 1;
LABEL_30:

      goto LABEL_31;
    }
    double v28 = self->_numDevicesVector;
  }
  double v29 = [v7 numDevicesVector];
  char v30 = [(NSArray *)v28 isEqual:v29];

  if (!numDevicesVector) {
    goto LABEL_30;
  }
LABEL_31:
  if (v25 < 2.22044605e-16) {
    char v31 = v13;
  }
  else {
    char v31 = 0;
  }
  char v32 = v31 & v17;
  if (v26 >= 2.22044605e-16) {
    char v32 = 0;
  }
  char v14 = v32 & v24 & v30;

LABEL_37:
  return v14;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (NSUUID)maxProbabilityLabelIdentifier
{
  return self->_maxProbabilityLabelIdentifier;
}

- (double)maxProbability
{
  return self->_maxProbability;
}

- (NSArray)probabilityVector
{
  return self->_probabilityVector;
}

- (NSArray)numDevicesVector
{
  return self->_numDevicesVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numDevicesVector, 0);
  objc_storeStrong((id *)&self->_probabilityVector, 0);
  objc_storeStrong((id *)&self->_maxProbabilityLabelIdentifier, 0);

  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "Mismatched BMMicroLocationRestrictedLocalizationEvent data versions, cannot deserialize", v1, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-MMicroLocationRestrictedLocalizationEvent proto", (uint8_t *)&v5, 0xCu);
}

@end