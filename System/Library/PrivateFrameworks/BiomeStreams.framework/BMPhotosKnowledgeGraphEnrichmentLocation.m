@interface BMPhotosKnowledgeGraphEnrichmentLocation
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMPhotosKnowledgeGraphEnrichmentLocation)initWithCoder:(id)a3;
- (BMPhotosKnowledgeGraphEnrichmentLocation)initWithProto:(id)a3;
- (BMPhotosKnowledgeGraphEnrichmentLocation)initWithProtoData:(id)a3;
- (BMPhotosKnowledgeGraphEnrichmentLocation)initWithStreet:(id)a3 city:(id)a4 state:(id)a5 country:(id)a6 encodedLocation:(id)a7;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSData)encodedLocation;
- (NSString)city;
- (NSString)country;
- (NSString)state;
- (NSString)street;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMPhotosKnowledgeGraphEnrichmentLocation

- (BMPhotosKnowledgeGraphEnrichmentLocation)initWithStreet:(id)a3 city:(id)a4 state:(id)a5 country:(id)a6 encodedLocation:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id obj = a7;
  id v16 = a7;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BMPhotosKnowledgeGraphEnrichmentEvent.m", 370, @"Invalid parameter not satisfying: %@", @"street" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"BMPhotosKnowledgeGraphEnrichmentEvent.m", 371, @"Invalid parameter not satisfying: %@", @"city" object file lineNumber description];

  if (v14)
  {
LABEL_4:
    if (v15) {
      goto LABEL_5;
    }
LABEL_12:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"BMPhotosKnowledgeGraphEnrichmentEvent.m", 373, @"Invalid parameter not satisfying: %@", @"country" object file lineNumber description];

    if (v16) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_11:
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"BMPhotosKnowledgeGraphEnrichmentEvent.m", 372, @"Invalid parameter not satisfying: %@", @"state" object file lineNumber description];

  if (!v15) {
    goto LABEL_12;
  }
LABEL_5:
  if (v16) {
    goto LABEL_6;
  }
LABEL_13:
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"BMPhotosKnowledgeGraphEnrichmentEvent.m", 374, @"Invalid parameter not satisfying: %@", @"encodedLocation" object file lineNumber description];

LABEL_6:
  v28.receiver = self;
  v28.super_class = (Class)BMPhotosKnowledgeGraphEnrichmentLocation;
  v17 = [(BMPhotosKnowledgeGraphEnrichmentLocation *)&v28 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_street, a3);
    objc_storeStrong((id *)&v18->_city, a4);
    objc_storeStrong((id *)&v18->_state, a5);
    objc_storeStrong((id *)&v18->_country, a6);
    objc_storeStrong((id *)&v18->_encodedLocation, obj);
  }

  return v18;
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
      +[BMPhotosKnowledgeGraphEnrichmentLocation eventWithData:dataVersion:]();
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  street = self->_street;
  v8[0] = @"street";
  v8[1] = @"city";
  long long v10 = *(_OWORD *)&self->_city;
  v8[2] = @"state";
  v8[3] = @"country";
  country = self->_country;
  encodedLocation = self->_encodedLocation;
  v11 = country;
  v8[4] = @"encodedLocation";
  v9 = street;
  v5 = [(NSData *)encodedLocation base64EncodedStringWithOptions:0];
  id v12 = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:v8 count:5];

  return v6;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMPhotosKnowledgeGraphEnrichmentLocation *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMPhotosKnowledgeGraphEnrichmentLocation json]();
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
  id v5 = [(BMPhotosKnowledgeGraphEnrichmentLocation *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMPhotosKnowledgeGraphEnrichmentLocation)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMPhotosKnowledgeGraphEnrichmentLocation *)self initWithProtoData:v6];
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
  v2 = [(BMPhotosKnowledgeGraphEnrichmentLocation *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMPhotosKnowledgeGraphEnrichmentLocation)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasStreet]
        && [v5 hasCity]
        && [v5 hasState]
        && ([v5 hasCountry] & 1) != 0)
      {
        id v6 = [v5 street];
        v7 = [v5 city];
        id v8 = [v5 state];
        v9 = [v5 country];
        long long v10 = [v5 encodedLocation];
        self = [(BMPhotosKnowledgeGraphEnrichmentLocation *)self initWithStreet:v6 city:v7 state:v8 country:v9 encodedLocation:v10];

        v11 = self;
LABEL_15:

        goto LABEL_16;
      }
      id v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BMPhotosKnowledgeGraphEnrichmentLocation initWithProto:]();
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMPhotosKnowledgeGraphEnrichmentLocation initWithProto:]();
      }
    }
    v11 = 0;
    goto LABEL_15;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (BMPhotosKnowledgeGraphEnrichmentLocation)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBPhotosKnowledgeGraphEnrichmentLocation alloc] initWithData:v4];

    self = [(BMPhotosKnowledgeGraphEnrichmentLocation *)self initWithProto:v5];
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
  id v4 = [(BMPhotosKnowledgeGraphEnrichmentLocation *)self street];
  [v3 setStreet:v4];

  id v5 = [(BMPhotosKnowledgeGraphEnrichmentLocation *)self city];
  [v3 setCity:v5];

  id v6 = [(BMPhotosKnowledgeGraphEnrichmentLocation *)self state];
  [v3 setState:v6];

  v7 = [(BMPhotosKnowledgeGraphEnrichmentLocation *)self country];
  [v3 setCountry:v7];

  id v8 = [(BMPhotosKnowledgeGraphEnrichmentLocation *)self encodedLocation];
  [v3 setEncodedLocation:v8];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_street hash];
  NSUInteger v4 = [(NSString *)self->_city hash] ^ v3;
  return v4 ^ [(NSString *)self->_state hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    street = self->_street;
    v7 = [v5 street];
    if ([(NSString *)street isEqualToString:v7])
    {
      city = self->_city;
      v9 = [v5 city];
      if ([(NSString *)city isEqualToString:v9])
      {
        state = self->_state;
        v11 = [v5 state];
        if ([(NSString *)state isEqualToString:v11])
        {
          country = self->_country;
          uint64_t v13 = [v5 country];
          if ([(NSString *)country isEqualToString:v13])
          {
            encodedLocation = self->_encodedLocation;
            id v15 = [v5 encodedLocation];
            char v16 = [(NSData *)encodedLocation isEqual:v15];
          }
          else
          {
            char v16 = 0;
          }
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_street && self->_city && self->_state && self->_country && self->_encodedLocation)
  {
    BOOL v7 = 1;
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)street
{
  return self->_street;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)country
{
  return self->_country;
}

- (NSData)encodedLocation
{
  return self->_encodedLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedLocation, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);

  objc_storeStrong((id *)&self->_street, 0);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(&dword_18E67D000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentLocation: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
}

- (void)json
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentLocation: Unable to create json from object: %@", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentLocation: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentLocation: tried to initialize with a non-BMPhotosKnowledgeGraphEnrichmentLocation proto", v2, v3, v4, v5, v6);
}

@end