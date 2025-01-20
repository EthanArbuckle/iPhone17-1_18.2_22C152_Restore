@interface ATXSpotlightEventMetadata
+ (BOOL)supportsSecureCoding;
- (ATXSpotlightEventMetadata)init;
- (ATXSpotlightEventMetadata)initWithCoder:(id)a3;
- (ATXSpotlightEventMetadata)initWithProto:(id)a3;
- (ATXSpotlightEventMetadata)initWithProtoData:(id)a3;
- (ATXSpotlightEventMetadata)initWithQueryAtEngagement:(id)a3 engagedAppString:(id)a4 didSearchDuringSession:(id)a5 searchEngagedBundleId:(id)a6 searchEngagedActionType:(id)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXSpotlightEventMetadata:(id)a3;
- (NSNumber)didSearchDuringSession;
- (NSNumber)searchEngagedActionType;
- (NSString)engagedAppString;
- (NSString)queryAtEngagement;
- (NSString)searchEngagedBundleId;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDidSearchDuringSession:(id)a3;
- (void)setEngagedAppString:(id)a3;
- (void)setQueryAtEngagement:(id)a3;
- (void)setSearchEngagedActionType:(id)a3;
- (void)setSearchEngagedBundleId:(id)a3;
@end

@implementation ATXSpotlightEventMetadata

- (ATXSpotlightEventMetadata)init
{
  return [(ATXSpotlightEventMetadata *)self initWithQueryAtEngagement:0 engagedAppString:0 didSearchDuringSession:0 searchEngagedBundleId:0 searchEngagedActionType:0];
}

- (ATXSpotlightEventMetadata)initWithQueryAtEngagement:(id)a3 engagedAppString:(id)a4 didSearchDuringSession:(id)a5 searchEngagedBundleId:(id)a6 searchEngagedActionType:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXSpotlightEventMetadata;
  v17 = [(ATXSpotlightEventMetadata *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queryAtEngagement, a3);
    objc_storeStrong((id *)&v18->_engagedAppString, a4);
    objc_storeStrong((id *)&v18->_didSearchDuringSession, a5);
    objc_storeStrong((id *)&v18->_searchEngagedBundleId, a6);
    objc_storeStrong((id *)&v18->_searchEngagedActionType, a7);
  }

  return v18;
}

- (ATXSpotlightEventMetadata)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[ATXPBSpotlightEventMetadata alloc] initWithData:v4];

    self = [(ATXSpotlightEventMetadata *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXSpotlightEventMetadata)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightEventMetadata initWithProto:]((uint64_t)self, v7);
    }

    goto LABEL_8;
  }
  id v5 = v4;
  if (-[ATXPBSpotlightEventMetadata hasDidSearchDuringSession]((uint64_t)v5))
  {
    v6 = [NSNumber numberWithBool:-[ATXPBSpotlightEventMetadata didSearchDuringSession]((BOOL)v5)];
  }
  else
  {
    v6 = 0;
  }
  if (-[ATXPBSpotlightEventMetadata hasSearchEngagedActionType]((uint64_t)v5))
  {
    v9 = [NSNumber numberWithUnsignedLongLong:-[ATXPBSpotlightEventMetadata searchEngagedActionType]((uint64_t)v5)];
  }
  else
  {
    v9 = 0;
  }
  v10 = -[ATXPBSpotlightEventMetadata queryAtEngagement]((uint64_t)v5);
  v11 = -[ATXPBSpotlightEventMetadata engagedAppString]((uint64_t)v5);
  v12 = -[ATXPBSpotlightEventMetadata searchEngagedBundleId]((uint64_t)v5);
  self = [(ATXSpotlightEventMetadata *)self initWithQueryAtEngagement:v10 engagedAppString:v11 didSearchDuringSession:v6 searchEngagedBundleId:v12 searchEngagedActionType:v9];

  v8 = self;
LABEL_14:

  return v8;
}

- (id)proto
{
  v3 = objc_opt_new();
  -[ATXPBSpotlightEventMetadata setQueryAtEngagement:]((uint64_t)v3, self->_queryAtEngagement);
  -[ATXPBSpotlightEventMetadata setEngagedAppString:]((uint64_t)v3, self->_engagedAppString);
  didSearchDuringSession = self->_didSearchDuringSession;
  if (didSearchDuringSession) {
    -[ATXPBSpotlightEventMetadata setDidSearchDuringSession:]((uint64_t)v3, [(NSNumber *)didSearchDuringSession BOOLValue]);
  }
  -[ATXPBSpotlightEventMetadata setSearchEngagedBundleId:]((uint64_t)v3, self->_searchEngagedBundleId);
  searchEngagedActionType = self->_searchEngagedActionType;
  if (searchEngagedActionType) {
    -[ATXPBSpotlightEventMetadata setSearchEngagedActionType:]((uint64_t)v3, [(NSNumber *)searchEngagedActionType unsignedIntegerValue]);
  }

  return v3;
}

- (id)encodeAsProto
{
  v2 = [(ATXSpotlightEventMetadata *)self proto];
  v3 = [v2 data];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    id v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXSpotlightEventMetadata *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXSpotlightEventMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXSpotlightEventMetadata *)self initWithProtoData:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXSpotlightEventMetadata *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXSpotlightEventMetadata *)self isEqualToATXSpotlightEventMetadata:v5];

  return v6;
}

- (BOOL)isEqualToATXSpotlightEventMetadata:(id)a3
{
  id v4 = (id *)a3;
  queryAtEngagement = self->_queryAtEngagement;
  BOOL v6 = (NSString *)v4[1];
  if (queryAtEngagement == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = queryAtEngagement;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_15;
    }
  }
  engagedAppString = self->_engagedAppString;
  id v11 = (NSString *)v4[2];
  if (engagedAppString == v11)
  {
  }
  else
  {
    id v12 = v11;
    id v13 = engagedAppString;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_15;
    }
  }
  didSearchDuringSession = self->_didSearchDuringSession;
  id v16 = (NSNumber *)v4[3];
  if (didSearchDuringSession == v16)
  {
  }
  else
  {
    v17 = v16;
    v18 = didSearchDuringSession;
    char v19 = [(NSNumber *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_15;
    }
  }
  searchEngagedBundleId = self->_searchEngagedBundleId;
  uint64_t v21 = (NSString *)v4[4];
  if (searchEngagedBundleId == v21)
  {
  }
  else
  {
    v22 = v21;
    v23 = searchEngagedBundleId;
    char v24 = [(NSString *)v23 isEqual:v22];

    if ((v24 & 1) == 0)
    {
LABEL_15:
      char v25 = 0;
      goto LABEL_21;
    }
  }
  v26 = self->_searchEngagedActionType;
  v27 = v26;
  if (v26 == v4[5]) {
    char v25 = 1;
  }
  else {
    char v25 = -[NSNumber isEqual:](v26, "isEqual:");
  }

LABEL_21:
  return v25;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_queryAtEngagement hash];
  NSUInteger v4 = [(NSString *)self->_engagedAppString hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSNumber *)self->_didSearchDuringSession hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_searchEngagedBundleId hash] - v5 + 32 * v5;
  return [(NSNumber *)self->_searchEngagedActionType hash] - v6 + 32 * v6;
}

- (NSString)queryAtEngagement
{
  return self->_queryAtEngagement;
}

- (void)setQueryAtEngagement:(id)a3
{
}

- (NSString)engagedAppString
{
  return self->_engagedAppString;
}

- (void)setEngagedAppString:(id)a3
{
}

- (NSNumber)didSearchDuringSession
{
  return self->_didSearchDuringSession;
}

- (void)setDidSearchDuringSession:(id)a3
{
}

- (NSString)searchEngagedBundleId
{
  return self->_searchEngagedBundleId;
}

- (void)setSearchEngagedBundleId:(id)a3
{
}

- (NSNumber)searchEngagedActionType
{
  return self->_searchEngagedActionType;
}

- (void)setSearchEngagedActionType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchEngagedActionType, 0);
  objc_storeStrong((id *)&self->_searchEngagedBundleId, 0);
  objc_storeStrong((id *)&self->_didSearchDuringSession, 0);
  objc_storeStrong((id *)&self->_engagedAppString, 0);

  objc_storeStrong((id *)&self->_queryAtEngagement, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = (objc_class *)objc_opt_class();
  NSUInteger v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  NSUInteger v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBSpotlightEventMetadata proto", (uint8_t *)&v5, 0xCu);
}

@end