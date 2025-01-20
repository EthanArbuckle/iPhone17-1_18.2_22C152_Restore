@interface ATXSpotlightSessionMetadata
+ (BOOL)supportsSecureCoding;
- (ATXSpotlightSessionMetadata)initWithAppConsumerSubType:(unsigned __int8)a3 actionConsumerSubType:(unsigned __int8)a4;
- (ATXSpotlightSessionMetadata)initWithAppConsumerSubType:(unsigned __int8)a3 actionConsumerSubType:(unsigned __int8)a4 engagedAppString:(id)a5 didSearchDuringSession:(BOOL)a6;
- (ATXSpotlightSessionMetadata)initWithCoder:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)didSearchDuringSession;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXSpotlightSessionMetadata:(id)a3;
- (NSString)description;
- (NSString)engagedAppString;
- (unint64_t)hash;
- (unsigned)actionConsumerSubType;
- (unsigned)appConsumerSubType;
- (void)encodeWithCoder:(id)a3;
- (void)setActionConsumerSubType:(unsigned __int8)a3;
- (void)setAppConsumerSubType:(unsigned __int8)a3;
- (void)setDidSearchDuringSession:(BOOL)a3;
- (void)setEngagedAppString:(id)a3;
@end

@implementation ATXSpotlightSessionMetadata

- (ATXSpotlightSessionMetadata)initWithAppConsumerSubType:(unsigned __int8)a3 actionConsumerSubType:(unsigned __int8)a4
{
  return [(ATXSpotlightSessionMetadata *)self initWithAppConsumerSubType:a3 actionConsumerSubType:a4 engagedAppString:0 didSearchDuringSession:0];
}

- (ATXSpotlightSessionMetadata)initWithAppConsumerSubType:(unsigned __int8)a3 actionConsumerSubType:(unsigned __int8)a4 engagedAppString:(id)a5 didSearchDuringSession:(BOOL)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXSpotlightSessionMetadata;
  v12 = [(ATXSpotlightSessionMetadata *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_appConsumerSubType = a3;
    v12->_actionConsumerSubType = a4;
    objc_storeStrong((id *)&v12->_engagedAppString, a5);
    v13->_didSearchDuringSession = a6;
  }

  return v13;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1AD0D3C30](self, a2);
  id v4 = [NSString alloc];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_appConsumerSubType];
  uint64_t v8 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_actionConsumerSubType];
  v9 = (void *)v8;
  if (self->_didSearchDuringSession) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  id v11 = (void *)[v4 initWithFormat:@"%@: \napp consumersubtype: %@ \naction consumersubtype: %@ \nengaged app string: %@ \ndid search during session: %@ \n", v6, v7, v8, self->_engagedAppString, v10];

  return (NSString *)v11;
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
    objc_super v15 = [v12 error];

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

- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    objc_super v15 = [v12 error];

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
  id v4 = (void *)MEMORY[0x1E4F4B680];
  uint64_t appConsumerSubType = self->_appConsumerSubType;
  id v8 = a3;
  v6 = [v4 stringForConsumerSubtype:appConsumerSubType];
  [v8 encodeObject:v6 forKey:@"appConsumerSubType"];

  v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_actionConsumerSubType];
  [v8 encodeObject:v7 forKey:@"actionConsumerSubType"];

  [v8 encodeBool:self->_didSearchDuringSession forKey:@"didSearchDuringSession"];
  [v8 encodeObject:self->_engagedAppString forKey:@"engagedAppString"];
}

- (ATXSpotlightSessionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appConsumerSubType"];
  if (-[ATXSpotlightSessionMetadata checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v5, @"appConsumerSubType", v4, @"com.apple.ATXFeedbackSessionMetadata", -1)|| (v19 = 0, uint64_t v6 = [MEMORY[0x1E4F4B680] consumerSubtypeForString:v5 found:&v19], !v19))
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v7 = v6;
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionConsumerSubType"];
    if (-[ATXSpotlightSessionMetadata checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v8, @"actionConsumerSubType", v4, @"com.apple.ATXFeedbackSessionMetadata", -1)|| (v18 = 0, v9 = [MEMORY[0x1E4F4B680] consumerSubtypeForString:v8 found:&v18], !v18)|| (v10 = v9, uint64_t v11 = objc_msgSend(v4, "decodeBoolForKey:", @"didSearchDuringSession"), -[ATXSpotlightSessionMetadata checkAndReportDecodingFailureIfNeededForBOOL:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForBOOL:key:coder:errorDomain:errorCode:", v11, @"didSearchDuringSession", v4, @"com.apple.ATXFeedbackSessionMetadata", -1)))
    {
      id v12 = 0;
    }
    else
    {
      BOOL v14 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v15 = objc_opt_class();
      id v16 = __atxlog_handle_feedback();
      v17 = [v14 robustDecodeObjectOfClass:v15 forKey:@"engagedAppString" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.ATXFeedbackSessionMetadata" errorCode:-1 logHandle:v16];

      self = [(ATXSpotlightSessionMetadata *)self initWithAppConsumerSubType:v7 actionConsumerSubType:v10 engagedAppString:v17 didSearchDuringSession:v11];
      id v12 = self;
    }
  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXSpotlightSessionMetadata *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXSpotlightSessionMetadata *)self isEqualToATXSpotlightSessionMetadata:v5];

  return v6;
}

- (BOOL)isEqualToATXSpotlightSessionMetadata:(id)a3
{
  id v4 = a3;
  int appConsumerSubType = self->_appConsumerSubType;
  if (appConsumerSubType == [v4 appConsumerSubType]
    && (int actionConsumerSubType = self->_actionConsumerSubType,
        actionConsumerSubType == [v4 actionConsumerSubType])
    && (int didSearchDuringSession = self->_didSearchDuringSession,
        didSearchDuringSession == [v4 didSearchDuringSession]))
  {
    id v8 = self->_engagedAppString;
    uint64_t v9 = v8;
    if (v8 == (NSString *)v4[2]) {
      char v10 = 1;
    }
    else {
      char v10 = -[NSString isEqual:](v8, "isEqual:");
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_actionConsumerSubType - (unint64_t)self->_appConsumerSubType + 32 * self->_appConsumerSubType;
  uint64_t v3 = self->_didSearchDuringSession - v2 + 32 * v2;
  return (unint64_t)&self->_engagedAppString[4 * v3] - v3;
}

- (unsigned)appConsumerSubType
{
  return self->_appConsumerSubType;
}

- (void)setAppConsumerSubType:(unsigned __int8)a3
{
  self->_int appConsumerSubType = a3;
}

- (unsigned)actionConsumerSubType
{
  return self->_actionConsumerSubType;
}

- (void)setActionConsumerSubType:(unsigned __int8)a3
{
  self->_int actionConsumerSubType = a3;
}

- (NSString)engagedAppString
{
  return self->_engagedAppString;
}

- (void)setEngagedAppString:(id)a3
{
}

- (BOOL)didSearchDuringSession
{
  return self->_didSearchDuringSession;
}

- (void)setDidSearchDuringSession:(BOOL)a3
{
  self->_int didSearchDuringSession = a3;
}

- (void).cxx_destruct
{
}

@end