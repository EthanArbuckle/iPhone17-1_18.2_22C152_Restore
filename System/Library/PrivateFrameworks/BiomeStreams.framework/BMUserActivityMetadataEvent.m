@interface BMUserActivityMetadataEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMUserActivityMetadataEvent)initWithAbsoluteTimestamp:(double)a3 userActivityData:(id)a4 title:(id)a5 activityType:(id)a6 associatedBundleId:(id)a7 associatedURLString:(id)a8 modeIdentifier:(id)a9 topics:(id)a10 hasAssociatedImageRepresentation:(BOOL)a11 uuid:(id)a12;
- (BMUserActivityMetadataEvent)initWithProto:(id)a3;
- (BMUserActivityMetadataEvent)initWithProtoData:(id)a3;
- (BOOL)hasAssociatedImageRepresentation;
- (BOOL)isEqual:(id)a3;
- (NSArray)topics;
- (NSData)userActivityData;
- (NSString)activityType;
- (NSString)associatedBundleId;
- (NSString)associatedURLString;
- (NSString)modeIdentifier;
- (NSString)title;
- (NSString)uuid;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)json;
@end

@implementation BMUserActivityMetadataEvent

- (BMUserActivityMetadataEvent)initWithAbsoluteTimestamp:(double)a3 userActivityData:(id)a4 title:(id)a5 activityType:(id)a6 associatedBundleId:(id)a7 associatedURLString:(id)a8 modeIdentifier:(id)a9 topics:(id)a10 hasAssociatedImageRepresentation:(BOOL)a11 uuid:(id)a12
{
  id v42 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a12;
  v43.receiver = self;
  v43.super_class = (Class)BMUserActivityMetadataEvent;
  v27 = [(BMUserActivityMetadataEvent *)&v43 init];
  v28 = v27;
  if (v27)
  {
    v27->_absoluteTimestamp = a3;
    objc_storeStrong((id *)&v27->_userActivityData, a4);
    uint64_t v29 = [v20 copy];
    title = v28->_title;
    v28->_title = (NSString *)v29;

    uint64_t v31 = [v21 copy];
    activityType = v28->_activityType;
    v28->_activityType = (NSString *)v31;

    uint64_t v33 = [v24 copy];
    modeIdentifier = v28->_modeIdentifier;
    v28->_modeIdentifier = (NSString *)v33;

    uint64_t v35 = [v22 copy];
    associatedBundleId = v28->_associatedBundleId;
    v28->_associatedBundleId = (NSString *)v35;

    uint64_t v37 = [v23 copy];
    associatedURLString = v28->_associatedURLString;
    v28->_associatedURLString = (NSString *)v37;

    objc_storeStrong((id *)&v28->_topics, a10);
    v28->_hasAssociatedImageRepresentation = a11;
    uint64_t v39 = [v26 copy];
    uuid = v28->_uuid;
    v28->_uuid = (NSString *)v39;
  }
  return v28;
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
      +[BMUserActivityMetadataTopic eventWithData:dataVersion:]();
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v16[10] = *MEMORY[0x1E4F143B8];
  v15[0] = @"absoluteTimestamp";
  v3 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  v16[0] = v3;
  v15[1] = @"userActivityDataLength";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSData length](self->_userActivityData, "length"));
  title = self->_title;
  activityType = self->_activityType;
  v16[1] = v4;
  v16[2] = title;
  v15[2] = @"title";
  v15[3] = @"activityType";
  v7 = @"nil";
  modeIdentifier = (__CFString *)self->_modeIdentifier;
  topics = self->_topics;
  if (!modeIdentifier) {
    modeIdentifier = @"nil";
  }
  v16[3] = activityType;
  v16[4] = modeIdentifier;
  v15[4] = @"modeIdentifier";
  v15[5] = @"associatedBundleId";
  associatedURLString = (__CFString *)self->_associatedURLString;
  if (!associatedURLString) {
    associatedURLString = @"nil";
  }
  v16[5] = self->_associatedBundleId;
  v16[6] = associatedURLString;
  v15[6] = @"associatedURLString";
  v15[7] = @"topicIdentifiers";
  if (topics)
  {
    v7 = [(NSArray *)topics _pas_mappedArrayWithTransform:&__block_literal_global_0];
  }
  v16[7] = v7;
  v15[8] = @"hasAssociatedImageRepresentation";
  v11 = [NSNumber numberWithBool:self->_hasAssociatedImageRepresentation];
  v15[9] = @"uuid";
  uuid = self->_uuid;
  v16[8] = v11;
  v16[9] = uuid;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:10];

  if (topics) {

  }
  return v13;
}

uint64_t __39__BMUserActivityMetadataEvent_jsonDict__block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonDict];
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMUserActivityMetadataEvent *)self jsonDict];
  uint64_t v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  uint64_t v5 = v8;

  if (v5)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMUserActivityMetadataEvent json]();
    }
  }

  return v4;
}

- (id)encodeAsProto
{
  v2 = [(BMUserActivityMetadataEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMUserActivityMetadataEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      if ([v5 hasAbsoluteTimestamp]
        && [v5 hasUserActivityData]
        && [v5 hasTitle]
        && [v5 hasActivityType]
        && [v5 hasAssociatedBundleId]
        && ([v5 hasUuid] & 1) != 0)
      {
        [v5 absoluteTimestamp];
        double v7 = v6;
        id v21 = [v5 userActivityData];
        v19 = [v5 title];
        uint64_t v8 = [v5 activityType];
        v18 = [v5 associatedBundleId];
        v9 = [v5 associatedURLString];
        v10 = [v5 modeIdentifier];
        id v20 = [v5 topics];
        v11 = objc_msgSend(v20, "_pas_mappedArrayWithTransform:", &__block_literal_global_148);
        char v12 = [v5 hasAssociatedImageRepresentation];
        v13 = [v5 uuid];
        LOBYTE(v17) = v12;
        self = [(BMUserActivityMetadataEvent *)self initWithAbsoluteTimestamp:v21 userActivityData:v19 title:v8 activityType:v18 associatedBundleId:v9 associatedURLString:v10 modeIdentifier:v7 topics:v11 hasAssociatedImageRepresentation:v17 uuid:v13];

        v14 = self;
LABEL_17:

        goto LABEL_18;
      }
      v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[BMUserActivityMetadataEvent initWithProto:]();
      }
    }
    else
    {
      uint64_t v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMUserActivityMetadataEvent initWithProto:]((uint64_t)self, v5);
      }
    }
    v14 = 0;
    goto LABEL_17;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

BMUserActivityMetadataTopic *__45__BMUserActivityMetadataEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BMUserActivityMetadataTopic alloc] initWithProto:v2];

  return v3;
}

- (BMUserActivityMetadataEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[BMPBUserActivityMetadataEvent alloc] initWithData:v4];

    self = [(BMUserActivityMetadataEvent *)self initWithProto:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_alloc_init(BMPBUserActivityMetadataEvent);
  [(BMPBUserActivityMetadataEvent *)v3 setAbsoluteTimestamp:self->_absoluteTimestamp];
  [(BMPBUserActivityMetadataEvent *)v3 setUserActivityData:self->_userActivityData];
  [(BMPBUserActivityMetadataEvent *)v3 setTitle:self->_title];
  [(BMPBUserActivityMetadataEvent *)v3 setActivityType:self->_activityType];
  [(BMPBUserActivityMetadataEvent *)v3 setAssociatedBundleId:self->_associatedBundleId];
  [(BMPBUserActivityMetadataEvent *)v3 setAssociatedURLString:self->_associatedURLString];
  [(BMPBUserActivityMetadataEvent *)v3 setModeIdentifier:self->_modeIdentifier];
  id v4 = [(NSArray *)self->_topics _pas_mappedArrayWithTransform:&__block_literal_global_150];
  uint64_t v5 = (void *)[v4 mutableCopy];
  [(BMPBUserActivityMetadataEvent *)v3 setTopics:v5];

  [(BMPBUserActivityMetadataEvent *)v3 setHasAssociatedImageRepresentation:self->_hasAssociatedImageRepresentation];
  [(BMPBUserActivityMetadataEvent *)v3 setUuid:self->_uuid];

  return v3;
}

uint64_t __36__BMUserActivityMetadataEvent_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_associatedBundleId hash] ^ v3;
  return v4 ^ [(NSString *)self->_associatedURLString hash];
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    double absoluteTimestamp = self->_absoluteTimestamp;
    [v7 absoluteTimestamp];
    if (absoluteTimestamp != v9)
    {
      char v14 = 0;
LABEL_77:

      goto LABEL_78;
    }
    userActivityData = self->_userActivityData;
    v11 = userActivityData;
    if (!userActivityData)
    {
      uint64_t v12 = [v7 userActivityData];
      if (!v12)
      {
        v60 = 0;
        int v13 = 0;
        goto LABEL_12;
      }
      v60 = (void *)v12;
      v11 = self->_userActivityData;
    }
    NSUInteger v3 = [v7 userActivityData];
    if (![(NSData *)v11 isEqualToData:v3])
    {

      char v14 = 0;
      goto LABEL_75;
    }
    int v13 = 1;
LABEL_12:
    title = self->_title;
    v16 = title;
    if (!title)
    {
      uint64_t v17 = [v7 title];
      if (!v17)
      {
        v57 = 0;
        int v59 = 0;
        goto LABEL_19;
      }
      v57 = (void *)v17;
      v16 = self->_title;
    }
    NSUInteger v4 = [v7 title];
    if (![(NSString *)v16 isEqualToString:v4])
    {
      char v14 = 0;
      goto LABEL_71;
    }
    int v59 = 1;
LABEL_19:
    activityType = self->_activityType;
    v19 = activityType;
    if (!activityType)
    {
      uint64_t v20 = [v7 activityType];
      if (!v20)
      {
        int v55 = v13;
        int v56 = 0;
        v53 = 0;
        goto LABEL_26;
      }
      v53 = (void *)v20;
      v19 = self->_activityType;
    }
    v58 = [v7 activityType];
    if (!-[NSString isEqualToString:](v19, "isEqualToString:"))
    {
      char v14 = 0;
      int v21 = v59;
      goto LABEL_69;
    }
    int v55 = v13;
    int v56 = 1;
LABEL_26:
    associatedBundleId = self->_associatedBundleId;
    id v23 = associatedBundleId;
    if (!associatedBundleId)
    {
      uint64_t v24 = [v7 associatedBundleId];
      if (!v24)
      {
        v49 = 0;
        int v52 = 0;
        goto LABEL_33;
      }
      v49 = (void *)v24;
      id v23 = self->_associatedBundleId;
    }
    v54 = [v7 associatedBundleId];
    if (!-[NSString isEqualToString:](v23, "isEqualToString:"))
    {
      char v14 = 0;
      int v21 = v59;
      goto LABEL_65;
    }
    int v52 = 1;
LABEL_33:
    associatedURLString = self->_associatedURLString;
    v51 = associatedURLString;
    if (!associatedURLString)
    {
      uint64_t v26 = [v7 associatedURLString];
      if (!v26)
      {
        v46 = 0;
        int v48 = 0;
        goto LABEL_40;
      }
      v46 = (void *)v26;
      associatedURLString = self->_associatedURLString;
    }
    v50 = [v7 associatedURLString];
    if (!-[NSString isEqualToString:](associatedURLString, "isEqualToString:"))
    {
      char v14 = 0;
      int v21 = v59;
      goto LABEL_62;
    }
    int v48 = 1;
LABEL_40:
    modeIdentifier = self->_modeIdentifier;
    v47 = modeIdentifier;
    if (!modeIdentifier)
    {
      uint64_t v28 = [v7 modeIdentifier];
      if (!v28)
      {
        v44 = 0;
        int v45 = 0;
        goto LABEL_47;
      }
      v44 = (void *)v28;
      modeIdentifier = self->_modeIdentifier;
    }
    uint64_t v29 = [v7 modeIdentifier];
    v30 = modeIdentifier;
    uint64_t v31 = (void *)v29;
    if (![(NSString *)v30 isEqualToString:v29])
    {

      char v14 = 0;
      int v21 = v59;
      goto LABEL_60;
    }
    objc_super v43 = v31;
    int v45 = 1;
LABEL_47:
    int hasAssociatedImageRepresentation = self->_hasAssociatedImageRepresentation;
    if (hasAssociatedImageRepresentation != [v7 hasAssociatedImageRepresentation])
    {
      char v14 = 0;
      int v21 = v59;
      goto LABEL_58;
    }
    uuid = self->_uuid;
    v34 = uuid;
    if (!uuid)
    {
      uint64_t v35 = [v7 uuid];
      if (!v35)
      {
        v38 = 0;
        char v14 = 1;
        int v21 = v59;
LABEL_57:

LABEL_58:
        if ((v45 & 1) == 0) {
          goto LABEL_60;
        }
        goto LABEL_59;
      }
      uint64_t v40 = v35;
      v34 = self->_uuid;
    }
    v36 = v34;
    objc_msgSend(v7, "uuid", v40);
    uint64_t v37 = v42 = uuid;
    char v14 = [(NSString *)v36 isEqual:v37];

    if (v42)
    {
      int v21 = v59;
      if (!v45)
      {
LABEL_60:
        if (v47)
        {
          if (!v48) {
            goto LABEL_63;
          }
        }
        else
        {

          if ((v48 & 1) == 0)
          {
LABEL_63:
            if (v51)
            {
              if (!v52) {
                goto LABEL_66;
              }
            }
            else
            {

              if ((v52 & 1) == 0)
              {
LABEL_66:
                if (associatedBundleId)
                {
                  if (v56)
                  {
LABEL_68:
                    int v13 = v55;
LABEL_69:

                    if (activityType) {
                      goto LABEL_70;
                    }
LABEL_83:

                    if ((v21 & 1) == 0)
                    {
LABEL_72:
                      if (title)
                      {
                        if (!v13) {
                          goto LABEL_75;
                        }
                      }
                      else
                      {

                        if ((v13 & 1) == 0)
                        {
LABEL_75:
                          if (!userActivityData) {

                          }
                          goto LABEL_77;
                        }
                      }

                      goto LABEL_75;
                    }
LABEL_71:

                    goto LABEL_72;
                  }
                }
                else
                {

                  if (v56) {
                    goto LABEL_68;
                  }
                }
                int v13 = v55;
                if (activityType)
                {
LABEL_70:
                  if (!v21) {
                    goto LABEL_72;
                  }
                  goto LABEL_71;
                }
                goto LABEL_83;
              }
            }
LABEL_65:

            goto LABEL_66;
          }
        }
LABEL_62:

        goto LABEL_63;
      }
LABEL_59:

      goto LABEL_60;
    }
    int v21 = v59;
    v38 = v41;
    goto LABEL_57;
  }
  char v14 = 0;
LABEL_78:

  return v14;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSString)associatedBundleId
{
  return self->_associatedBundleId;
}

- (NSString)associatedURLString
{
  return self->_associatedURLString;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (NSArray)topics
{
  return self->_topics;
}

- (BOOL)hasAssociatedImageRepresentation
{
  return self->_hasAssociatedImageRepresentation;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedURLString, 0);
  objc_storeStrong((id *)&self->_associatedBundleId, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_userActivityData, 0);
}

- (void)json
{
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "Unable to create JSON from object", v1, 2u);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMPBUserActivityMetadataEvent: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBInferredModeEvent proto", (uint8_t *)&v5, 0xCu);
}

@end