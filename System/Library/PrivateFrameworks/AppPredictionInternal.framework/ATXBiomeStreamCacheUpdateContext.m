@interface ATXBiomeStreamCacheUpdateContext
+ (BOOL)supportsSecureCoding;
- (ATXBiomeStreamCacheUpdateContext)init;
- (ATXBiomeStreamCacheUpdateContext)initWithCoder:(id)a3;
- (ATXBiomeStreamCacheUpdateContext)initWithCurrentClientModelCacheCreationDates:(id)a3 previousClientModelCacheAges:(id)a4 currentBlendingModelCacheCreationDates:(id)a5 previousBlendingModelCacheAges:(id)a6;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXBiomeStreamCacheUpdateContext:(id)a3;
- (NSMutableDictionary)currentBlendingModelCacheCreationDatesByConsumerSubType;
- (NSMutableDictionary)currentClientModelCacheCreationDatesByClientModelId;
- (NSMutableDictionary)previousBlendingModelCacheAgesByConsumerSubType;
- (NSMutableDictionary)previousClientModelCacheAgesByClientModelId;
- (id)cacheAgeForPreviousBlendingUICacheUpdateForConsumerSubType:(unsigned __int8)a3;
- (id)cacheAgeForPreviousClientModelCacheWithClientModelId:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentBlendingModelCacheCreationDatesByConsumerSubType:(id)a3;
- (void)setCurrentClientModelCacheCreationDatesByClientModelId:(id)a3;
- (void)setPreviousBlendingModelCacheAgesByConsumerSubType:(id)a3;
- (void)setPreviousClientModelCacheAgesByClientModelId:(id)a3;
- (void)updateWithBlendingUICacheUpdate:(id)a3;
- (void)updateWithClientModelCacheUpdate:(id)a3;
@end

@implementation ATXBiomeStreamCacheUpdateContext

- (ATXBiomeStreamCacheUpdateContext)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [(ATXBiomeStreamCacheUpdateContext *)self initWithCurrentClientModelCacheCreationDates:v3 previousClientModelCacheAges:v4 currentBlendingModelCacheCreationDates:v5 previousBlendingModelCacheAges:v6];

  return v7;
}

- (ATXBiomeStreamCacheUpdateContext)initWithCurrentClientModelCacheCreationDates:(id)a3 previousClientModelCacheAges:(id)a4 currentBlendingModelCacheCreationDates:(id)a5 previousBlendingModelCacheAges:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXBiomeStreamCacheUpdateContext;
  v15 = [(ATXBiomeStreamCacheUpdateContext *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_currentClientModelCacheCreationDatesByClientModelId, a3);
    objc_storeStrong((id *)&v16->_previousClientModelCacheAgesByClientModelId, a4);
    objc_storeStrong((id *)&v16->_currentBlendingModelCacheCreationDatesByConsumerSubType, a5);
    objc_storeStrong((id *)&v16->_previousBlendingModelCacheAgesByConsumerSubType, a6);
  }

  return v16;
}

- (id)cacheAgeForPreviousClientModelCacheWithClientModelId:(id)a3
{
  if (a3)
  {
    v4 = -[NSMutableDictionary valueForKey:](self->_previousClientModelCacheAgesByClientModelId, "valueForKey:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)cacheAgeForPreviousBlendingUICacheUpdateForConsumerSubType:(unsigned __int8)a3
{
  v4 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a3];
  v5 = [(NSMutableDictionary *)self->_previousBlendingModelCacheAgesByConsumerSubType valueForKey:v4];

  return v5;
}

- (void)updateWithClientModelCacheUpdate:(id)a3
{
  id v11 = a3;
  v4 = [v11 clientModelId];
  currentClientModelCacheCreationDatesByClientModelId = self->_currentClientModelCacheCreationDatesByClientModelId;
  if (v4)
  {
    v6 = [(NSMutableDictionary *)currentClientModelCacheCreationDatesByClientModelId objectForKey:v4];
    v7 = [v11 cacheCreationDate];
    v8 = v7;
    if (v6)
    {
      [v7 timeIntervalSinceDate:v6];
      previousClientModelCacheAgesByClientModelId = self->_previousClientModelCacheAgesByClientModelId;
      v10 = objc_msgSend(NSNumber, "numberWithDouble:");
      [(NSMutableDictionary *)previousClientModelCacheAgesByClientModelId setValue:v10 forKey:v4];
    }
    [(NSMutableDictionary *)self->_currentClientModelCacheCreationDatesByClientModelId setValue:v8 forKey:v4];
  }
  else
  {
    [(NSMutableDictionary *)currentClientModelCacheCreationDatesByClientModelId removeAllObjects];
    [(NSMutableDictionary *)self->_previousClientModelCacheAgesByClientModelId removeAllObjects];
  }
}

- (void)updateWithBlendingUICacheUpdate:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F4B680];
  id v5 = a3;
  objc_msgSend(v4, "stringForConsumerSubtype:", objc_msgSend(v5, "consumerSubType"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableDictionary objectForKey:](self->_currentBlendingModelCacheCreationDatesByConsumerSubType, "objectForKey:");
  v7 = [v5 cacheCreationDate];

  if (v6)
  {
    [v7 timeIntervalSinceDate:v6];
    previousBlendingModelCacheAgesByConsumerSubType = self->_previousBlendingModelCacheAgesByConsumerSubType;
    v9 = objc_msgSend(NSNumber, "numberWithDouble:");
    [(NSMutableDictionary *)previousBlendingModelCacheAgesByConsumerSubType setValue:v9 forKey:v10];
  }
  [(NSMutableDictionary *)self->_currentBlendingModelCacheCreationDatesByConsumerSubType setValue:v7 forKey:v10];
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
    v15 = [v12 error];

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
      objc_super v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
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
  currentClientModelCacheCreationDatesByClientModelId = self->_currentClientModelCacheCreationDatesByClientModelId;
  id v5 = a3;
  [v5 encodeObject:currentClientModelCacheCreationDatesByClientModelId forKey:@"codingKeyForClientModelCacheCreationDate"];
  [v5 encodeObject:self->_previousClientModelCacheAgesByClientModelId forKey:@"codingKeyForPreviousClientModelCacheAge"];
  [v5 encodeObject:self->_currentBlendingModelCacheCreationDatesByConsumerSubType forKey:@"codingKeyForBlendingModelCacheCreationDate"];
  [v5 encodeObject:self->_previousBlendingModelCacheAgesByConsumerSubType forKey:@"codingKeyForPreviousBlendingModelCacheAge"];
}

- (ATXBiomeStreamCacheUpdateContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D25F6CC0]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"codingKeyForClientModelCacheCreationDate"];
  if ([(ATXBiomeStreamCacheUpdateContext *)self checkAndReportDecodingFailureIfNeededForid:v10 key:@"codingKeyForClientModelCacheCreationDate" coder:v4 errorDomain:@"com.apple.duetexpertd.ATXBiomeStreamCacheUpdateContext" errorCode:-1])
  {
    id v11 = 0;
  }
  else
  {
    id v12 = (void *)MEMORY[0x1D25F6CC0]();
    id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    id v16 = objc_msgSend(v13, "initWithObjects:", v14, v15, objc_opt_class(), 0);
    v17 = [v4 decodeObjectOfClasses:v16 forKey:@"codingKeyForPreviousClientModelCacheAge"];
    if ([(ATXBiomeStreamCacheUpdateContext *)self checkAndReportDecodingFailureIfNeededForid:v17 key:@"codingKeyForPreviousClientModelCacheAge" coder:v4 errorDomain:@"com.apple.duetexpertd.ATXBiomeStreamCacheUpdateContext" errorCode:-1])
    {
      id v11 = 0;
    }
    else
    {
      objc_super v18 = [v4 decodeObjectOfClasses:v9 forKey:@"codingKeyForBlendingModelCacheCreationDate"];
      if ([(ATXBiomeStreamCacheUpdateContext *)self checkAndReportDecodingFailureIfNeededForid:v18 key:@"codingKeyForBlendingModelCacheCreationDate" coder:v4 errorDomain:@"com.apple.duetexpertd.ATXBiomeStreamCacheUpdateContext" errorCode:-1])
      {
        id v11 = 0;
      }
      else
      {
        v19 = [v4 decodeObjectOfClasses:v16 forKey:@"codingKeyForPreviousBlendingModelCacheAge"];
        if ([(ATXBiomeStreamCacheUpdateContext *)self checkAndReportDecodingFailureIfNeededForid:v19 key:@"codingKeyForPreviousBlendingModelCacheAge" coder:v4 errorDomain:@"com.apple.duetexpertd.ATXBiomeStreamCacheUpdateContext" errorCode:-1])
        {
          id v11 = 0;
        }
        else
        {
          self = [(ATXBiomeStreamCacheUpdateContext *)self initWithCurrentClientModelCacheCreationDates:v10 previousClientModelCacheAges:v17 currentBlendingModelCacheCreationDates:v18 previousBlendingModelCacheAges:v19];
          id v11 = self;
        }
      }
    }
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXBiomeStreamCacheUpdateContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXBiomeStreamCacheUpdateContext *)self isEqualToATXBiomeStreamCacheUpdateContext:v5];

  return v6;
}

- (BOOL)isEqualToATXBiomeStreamCacheUpdateContext:(id)a3
{
  id v4 = (id *)a3;
  currentClientModelCacheCreationDatesByClientModelId = self->_currentClientModelCacheCreationDatesByClientModelId;
  BOOL v6 = (NSMutableDictionary *)v4[1];
  if (currentClientModelCacheCreationDatesByClientModelId == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = currentClientModelCacheCreationDatesByClientModelId;
    char v9 = [(NSMutableDictionary *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_11;
    }
  }
  previousClientModelCacheAgesByClientModelId = self->_previousClientModelCacheAgesByClientModelId;
  id v11 = (NSMutableDictionary *)v4[2];
  if (previousClientModelCacheAgesByClientModelId == v11)
  {
  }
  else
  {
    id v12 = v11;
    id v13 = previousClientModelCacheAgesByClientModelId;
    char v14 = [(NSMutableDictionary *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_11;
    }
  }
  currentBlendingModelCacheCreationDatesByConsumerSubType = self->_currentBlendingModelCacheCreationDatesByConsumerSubType;
  id v16 = (NSMutableDictionary *)v4[3];
  if (currentBlendingModelCacheCreationDatesByConsumerSubType == v16)
  {
  }
  else
  {
    v17 = v16;
    objc_super v18 = currentBlendingModelCacheCreationDatesByConsumerSubType;
    char v19 = [(NSMutableDictionary *)v18 isEqual:v17];

    if ((v19 & 1) == 0)
    {
LABEL_11:
      char v20 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v21 = self->_previousBlendingModelCacheAgesByConsumerSubType;
  v22 = v21;
  if (v21 == v4[4]) {
    char v20 = 1;
  }
  else {
    char v20 = -[NSMutableDictionary isEqual:](v21, "isEqual:");
  }

LABEL_17:
  return v20;
}

- (unint64_t)hash
{
  int64_t v2 = (char *)self->_previousClientModelCacheAgesByClientModelId
     - (char *)self->_currentClientModelCacheCreationDatesByClientModelId
     + 32 * (uint64_t)self->_currentClientModelCacheCreationDatesByClientModelId;
  uint64_t v3 = (char *)&self->_currentBlendingModelCacheCreationDatesByConsumerSubType[4 * v2] - v2;
  return (char *)self->_previousBlendingModelCacheAgesByConsumerSubType - v3 + 32 * (void)v3;
}

- (NSMutableDictionary)currentClientModelCacheCreationDatesByClientModelId
{
  return self->_currentClientModelCacheCreationDatesByClientModelId;
}

- (void)setCurrentClientModelCacheCreationDatesByClientModelId:(id)a3
{
}

- (NSMutableDictionary)previousClientModelCacheAgesByClientModelId
{
  return self->_previousClientModelCacheAgesByClientModelId;
}

- (void)setPreviousClientModelCacheAgesByClientModelId:(id)a3
{
}

- (NSMutableDictionary)currentBlendingModelCacheCreationDatesByConsumerSubType
{
  return self->_currentBlendingModelCacheCreationDatesByConsumerSubType;
}

- (void)setCurrentBlendingModelCacheCreationDatesByConsumerSubType:(id)a3
{
}

- (NSMutableDictionary)previousBlendingModelCacheAgesByConsumerSubType
{
  return self->_previousBlendingModelCacheAgesByConsumerSubType;
}

- (void)setPreviousBlendingModelCacheAgesByConsumerSubType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousBlendingModelCacheAgesByConsumerSubType, 0);
  objc_storeStrong((id *)&self->_currentBlendingModelCacheCreationDatesByConsumerSubType, 0);
  objc_storeStrong((id *)&self->_previousClientModelCacheAgesByClientModelId, 0);
  objc_storeStrong((id *)&self->_currentClientModelCacheCreationDatesByClientModelId, 0);
}

@end