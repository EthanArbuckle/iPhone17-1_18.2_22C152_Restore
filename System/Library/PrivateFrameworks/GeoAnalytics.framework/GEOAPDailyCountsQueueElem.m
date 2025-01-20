@interface GEOAPDailyCountsQueueElem
- (BOOL)isEqual:(id)a3;
- (GEOAPDailyCountsQueueElem)initWithType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 createTime:(id)a7;
- (NSNumber)usageBool;
- (NSString)appId;
- (NSString)usageString;
- (id)copy;
- (int)countType;
- (unint64_t)hash;
@end

@implementation GEOAPDailyCountsQueueElem

- (GEOAPDailyCountsQueueElem)initWithType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 createTime:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)GEOAPDailyCountsQueueElem;
  v17 = [(GEOAPQueueElem *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->super._createTime, a7);
    v18->_countType = a3;
    objc_storeStrong((id *)&v18->_usageString, a4);
    objc_storeStrong((id *)&v18->_usageBool, a5);
    objc_storeStrong((id *)&v18->_appId, a6);
  }

  return v18;
}

- (id)copy
{
  v3 = [GEOAPDailyCountsQueueElem alloc];
  uint64_t countType = self->_countType;
  usageString = self->_usageString;
  usageBool = self->_usageBool;
  appId = self->_appId;
  createTime = self->super._createTime;
  return [(GEOAPDailyCountsQueueElem *)v3 initWithType:countType usageString:usageString usageBool:usageBool appId:appId createTime:createTime];
}

- (unint64_t)hash
{
  uint64_t countType = self->_countType;
  unint64_t v4 = [(NSString *)self->_usageString hash] ^ countType;
  unint64_t v5 = (unint64_t)[(NSNumber *)self->_usageBool hash];
  return v4 ^ v5 ^ [(NSString *)self->_appId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(GEOAPDailyCountsQueueElem *)self usageString];
    v7 = [v5 usageString];
    char v8 = (v6 != 0) ^ (v7 != 0);

    if (v8) {
      goto LABEL_18;
    }
    v9 = [(GEOAPDailyCountsQueueElem *)self usageBool];
    v10 = [v5 usageBool];
    char v11 = (v9 != 0) ^ (v10 != 0);

    if (v11) {
      goto LABEL_18;
    }
    uint64_t v12 = [(GEOAPDailyCountsQueueElem *)self usageString];
    if (v12)
    {
      id v13 = (void *)v12;
      id v14 = [v5 usageString];

      if (v14)
      {
        id v15 = [(GEOAPDailyCountsQueueElem *)self usageString];
        id v16 = [v5 usageString];
        unsigned int v17 = [v15 isEqualToString:v16];

        if (!v17) {
          goto LABEL_18;
        }
      }
    }
    uint64_t v18 = [(GEOAPDailyCountsQueueElem *)self usageBool];
    if (v18)
    {
      v19 = (void *)v18;
      objc_super v20 = [v5 usageBool];

      if (v20)
      {
        v21 = [(GEOAPDailyCountsQueueElem *)self usageBool];
        unsigned int v22 = [v21 BOOLValue];
        v23 = [v5 usageBool];
        unsigned int v24 = [v23 BOOLValue];

        if (v22 != v24) {
          goto LABEL_18;
        }
      }
    }
    v25 = [v5 createTime];
    v26 = [(GEOAPQueueElem *)self createTime];
    [v25 timeIntervalSinceDate:v26];
    double v28 = v27;

    LODWORD(v25) = [(GEOAPDailyCountsQueueElem *)self countType];
    if (v25 != [v5 countType])
    {
LABEL_18:
      BOOL v32 = 0;
    }
    else
    {
      if (v28 < 0.0) {
        double v28 = -v28;
      }
      v29 = [(GEOAPDailyCountsQueueElem *)self appId];
      v30 = [v5 appId];
      unsigned __int8 v31 = [v29 isEqualToString:v30];
      if (v28 < 1.0) {
        BOOL v32 = v31;
      }
      else {
        BOOL v32 = 0;
      }
    }
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (int)countType
{
  return self->_countType;
}

- (NSString)usageString
{
  return self->_usageString;
}

- (NSNumber)usageBool
{
  return self->_usageBool;
}

- (NSString)appId
{
  return self->_appId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_usageBool, 0);
  objc_storeStrong((id *)&self->_usageString, 0);
}

@end