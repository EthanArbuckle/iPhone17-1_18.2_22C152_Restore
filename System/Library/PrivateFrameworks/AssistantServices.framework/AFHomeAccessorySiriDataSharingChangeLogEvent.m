@interface AFHomeAccessorySiriDataSharingChangeLogEvent
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFHomeAccessorySiriDataSharingChangeLogEvent)init;
- (AFHomeAccessorySiriDataSharingChangeLogEvent)initWithBuilder:(id)a3;
- (AFHomeAccessorySiriDataSharingChangeLogEvent)initWithCoder:(id)a3;
- (AFHomeAccessorySiriDataSharingChangeLogEvent)initWithDate:(id)a3 previousOptInStatus:(int64_t)a4 newOptInStatus:(int64_t)a5 changeSource:(int64_t)a6 changeReason:(id)a7 buildVersion:(id)a8 productVersion:(id)a9 schemaVersion:(id)a10 logEventIdentifier:(id)a11;
- (AFHomeAccessorySiriDataSharingChangeLogEvent)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)buildVersion;
- (NSString)changeReason;
- (NSString)description;
- (NSString)logEventIdentifier;
- (NSString)productVersion;
- (NSString)schemaVersion;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)changeSource;
- (int64_t)newOptInStatus;
- (int64_t)previousOptInStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFHomeAccessorySiriDataSharingChangeLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventIdentifier, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_changeReason, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (NSString)logEventIdentifier
{
  return self->_logEventIdentifier;
}

- (NSString)schemaVersion
{
  return self->_schemaVersion;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)changeReason
{
  return self->_changeReason;
}

- (int64_t)changeSource
{
  return self->_changeSource;
}

- (int64_t)newOptInStatus
{
  return self->_newOptInStatus;
}

- (int64_t)previousOptInStatus
{
  return self->_previousOptInStatus;
}

- (NSDate)date
{
  return self->_date;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  date = self->_date;
  if (date) {
    [v3 setObject:date forKey:@"date"];
  }
  unint64_t previousOptInStatus = self->_previousOptInStatus;
  if (previousOptInStatus > 3) {
    v7 = @"(unknown)";
  }
  else {
    v7 = off_1E592B870[previousOptInStatus];
  }
  v8 = v7;
  [v4 setObject:v8 forKey:@"previousOptInStatus"];

  unint64_t newOptInStatus = self->_newOptInStatus;
  if (newOptInStatus > 3) {
    v10 = @"(unknown)";
  }
  else {
    v10 = off_1E592B870[newOptInStatus];
  }
  v11 = v10;
  [v4 setObject:v11 forKey:@"newOptInStatus"];

  unint64_t changeSource = self->_changeSource;
  if (changeSource > 0xB) {
    v13 = @"(unknown)";
  }
  else {
    v13 = off_1E592B7A8[changeSource];
  }
  v14 = v13;
  [v4 setObject:v14 forKey:@"changeSource"];

  changeReason = self->_changeReason;
  if (changeReason) {
    [v4 setObject:changeReason forKey:@"changeReason"];
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v4 setObject:buildVersion forKey:@"buildVersion"];
  }
  productVersion = self->_productVersion;
  if (productVersion) {
    [v4 setObject:productVersion forKey:@"productVersion"];
  }
  schemaVersion = self->_schemaVersion;
  if (schemaVersion) {
    [v4 setObject:schemaVersion forKey:@"schemaVersion"];
  }
  logEventIdentifier = self->_logEventIdentifier;
  if (logEventIdentifier) {
    [v4 setObject:logEventIdentifier forKey:@"logEventIdentifier"];
  }
  v20 = (void *)[v4 copy];

  return v20;
}

- (AFHomeAccessorySiriDataSharingChangeLogEvent)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"date"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v25 = v6;
    }
    else {
      id v25 = 0;
    }

    v8 = [v5 objectForKey:@"previousOptInStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v24 = AFSiriDataSharingOptInStatusGetFromName(v8);
    }
    else {
      uint64_t v24 = 0;
    }

    v9 = [v5 objectForKey:@"newOptInStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v23 = AFSiriDataSharingOptInStatusGetFromName(v9);
    }
    else {
      uint64_t v23 = 0;
    }

    v10 = [v5 objectForKey:@"changeSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = AFSiriDataSharingOptInStatusChangeSourceGetFromName(v10);
    }
    else {
      uint64_t v11 = 0;
    }

    v12 = [v5 objectForKey:@"changeReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v14 = [v5 objectForKey:@"buildVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    v16 = [v5 objectForKey:@"productVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    v18 = [v5 objectForKey:@"schemaVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }

    v20 = [v5 objectForKey:@"logEventIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    self = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)self initWithDate:v25 previousOptInStatus:v24 newOptInStatus:v23 changeSource:v11 changeReason:v13 buildVersion:v15 productVersion:v17 schemaVersion:v19 logEventIdentifier:v21];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v8 = a3;
  [v8 encodeObject:date forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::date"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_previousOptInStatus];
  [v8 encodeObject:v5 forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::previousOptInStatus"];

  v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_newOptInStatus];
  [v8 encodeObject:v6 forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::newOptInStatus"];

  v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_changeSource];
  [v8 encodeObject:v7 forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::changeSource"];

  [v8 encodeObject:self->_changeReason forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::changeReason"];
  [v8 encodeObject:self->_buildVersion forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::buildVersion"];
  [v8 encodeObject:self->_productVersion forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::productVersion"];
  [v8 encodeObject:self->_schemaVersion forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::schemaVersion"];
  [v8 encodeObject:self->_logEventIdentifier forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::logEventIdentifier"];
}

- (AFHomeAccessorySiriDataSharingChangeLogEvent)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::date"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::previousOptInStatus"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::newOptInStatus"];
  uint64_t v8 = [v7 integerValue];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::changeSource"];
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::changeReason"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::buildVersion"];
  id v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::productVersion"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::schemaVersion"];
  id v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeAccessorySiriDataSharingChangeLogEvent::logEventIdentifier"];

  v16 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)self initWithDate:v4 previousOptInStatus:v6 newOptInStatus:v8 changeSource:v10 changeReason:v11 buildVersion:v12 productVersion:v13 schemaVersion:v14 logEventIdentifier:v15];
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFHomeAccessorySiriDataSharingChangeLogEvent *)a3;
  if (self == v4)
  {
    BOOL v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t previousOptInStatus = self->_previousOptInStatus;
      if (previousOptInStatus == [(AFHomeAccessorySiriDataSharingChangeLogEvent *)v5 previousOptInStatus]&& (int64_t newOptInStatus = self->_newOptInStatus, newOptInStatus == [(AFHomeAccessorySiriDataSharingChangeLogEvent *)v5 newOptInStatus])&& (changeSource = self->_changeSource, changeSource == [(AFHomeAccessorySiriDataSharingChangeLogEvent *)v5 changeSource]))
      {
        v9 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)v5 date];
        date = self->_date;
        if (date == v9 || [(NSDate *)date isEqual:v9])
        {
          uint64_t v11 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)v5 changeReason];
          changeReason = self->_changeReason;
          if (changeReason == v11 || [(NSString *)changeReason isEqual:v11])
          {
            id v13 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)v5 buildVersion];
            buildVersion = self->_buildVersion;
            if (buildVersion == v13 || [(NSString *)buildVersion isEqual:v13])
            {
              id v15 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)v5 productVersion];
              productVersion = self->_productVersion;
              if (productVersion == v15 || [(NSString *)productVersion isEqual:v15])
              {
                id v17 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)v5 schemaVersion];
                schemaVersion = self->_schemaVersion;
                if (schemaVersion == v17 || [(NSString *)schemaVersion isEqual:v17])
                {
                  id v19 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)v5 logEventIdentifier];
                  logEventIdentifier = self->_logEventIdentifier;
                  BOOL v21 = logEventIdentifier == v19
                     || [(NSString *)logEventIdentifier isEqual:v19];
                }
                else
                {
                  BOOL v21 = 0;
                }
              }
              else
              {
                BOOL v21 = 0;
              }
            }
            else
            {
              BOOL v21 = 0;
            }
          }
          else
          {
            BOOL v21 = 0;
          }
        }
        else
        {
          BOOL v21 = 0;
        }
      }
      else
      {
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
  }

  return v21;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_date hash];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_previousOptInStatus];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_newOptInStatus];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_changeSource];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  NSUInteger v10 = [(NSString *)self->_changeReason hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_buildVersion hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_productVersion hash];
  NSUInteger v13 = v12 ^ [(NSString *)self->_schemaVersion hash];
  NSUInteger v14 = v9 ^ v13 ^ [(NSString *)self->_logEventIdentifier hash];

  return v14;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v18.receiver = self;
  v18.super_class = (Class)AFHomeAccessorySiriDataSharingChangeLogEvent;
  uint64_t v5 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)&v18 description];
  unint64_t previousOptInStatus = self->_previousOptInStatus;
  if (previousOptInStatus > 3) {
    uint64_t v7 = @"(unknown)";
  }
  else {
    uint64_t v7 = off_1E592B870[previousOptInStatus];
  }
  date = self->_date;
  uint64_t v9 = v7;
  unint64_t newOptInStatus = self->_newOptInStatus;
  if (newOptInStatus > 3) {
    NSUInteger v11 = @"(unknown)";
  }
  else {
    NSUInteger v11 = off_1E592B870[newOptInStatus];
  }
  NSUInteger v12 = v11;
  unint64_t changeSource = self->_changeSource;
  if (changeSource > 0xB) {
    NSUInteger v14 = @"(unknown)";
  }
  else {
    NSUInteger v14 = off_1E592B7A8[changeSource];
  }
  id v15 = v14;
  v16 = (void *)[v4 initWithFormat:@"%@ {date = %@, unint64_t previousOptInStatus = %@, newOptInStatus = %@, changeSource = %@, changeReason = %@, buildVersion = %@, productVersion = %@, schemaVersion = %@, logEventIdentifier = %@}", v5, date, v9, v12, v15, self->_changeReason, self->_buildVersion, self->_productVersion, self->_schemaVersion, self->_logEventIdentifier];

  return v16;
}

- (NSString)description
{
  return (NSString *)[(AFHomeAccessorySiriDataSharingChangeLogEvent *)self _descriptionWithIndent:0];
}

- (AFHomeAccessorySiriDataSharingChangeLogEvent)initWithDate:(id)a3 previousOptInStatus:(int64_t)a4 newOptInStatus:(int64_t)a5 changeSource:(int64_t)a6 changeReason:(id)a7 buildVersion:(id)a8 productVersion:(id)a9 schemaVersion:(id)a10 logEventIdentifier:(id)a11
{
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __183__AFHomeAccessorySiriDataSharingChangeLogEvent_initWithDate_previousOptInStatus_newOptInStatus_changeSource_changeReason_buildVersion_productVersion_schemaVersion_logEventIdentifier___block_invoke;
  v31[3] = &unk_1E5924ED8;
  int64_t v38 = a4;
  int64_t v39 = a5;
  int64_t v40 = a6;
  id v32 = v16;
  id v33 = v17;
  id v34 = v18;
  id v35 = v19;
  id v36 = v20;
  id v37 = v21;
  id v22 = v21;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  v28 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)self initWithBuilder:v31];

  return v28;
}

void __183__AFHomeAccessorySiriDataSharingChangeLogEvent_initWithDate_previousOptInStatus_newOptInStatus_changeSource_changeReason_buildVersion_productVersion_schemaVersion_logEventIdentifier___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setDate:v3];
  [v4 setPreviousOptInStatus:a1[10]];
  [v4 setNewOptInStatus:a1[11]];
  [v4 setChangeSource:a1[12]];
  [v4 setChangeReason:a1[5]];
  [v4 setBuildVersion:a1[6]];
  [v4 setProductVersion:a1[7]];
  [v4 setSchemaVersion:a1[8]];
  [v4 setLogEventIdentifier:a1[9]];
}

- (AFHomeAccessorySiriDataSharingChangeLogEvent)init
{
  return [(AFHomeAccessorySiriDataSharingChangeLogEvent *)self initWithBuilder:0];
}

- (AFHomeAccessorySiriDataSharingChangeLogEvent)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFHomeAccessorySiriDataSharingChangeLogEventMutation *))a3;
  v27.receiver = self;
  v27.super_class = (Class)AFHomeAccessorySiriDataSharingChangeLogEvent;
  uint64_t v5 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)&v27 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_AFHomeAccessorySiriDataSharingChangeLogEventMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v7 isDirty])
    {
      uint64_t v8 = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v7 getDate];
      uint64_t v9 = [v8 copy];
      date = v6->_date;
      v6->_date = (NSDate *)v9;

      v6->_unint64_t previousOptInStatus = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v7 getPreviousOptInStatus];
      v6->_unint64_t newOptInStatus = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v7 getNewOptInStatus];
      v6->_unint64_t changeSource = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v7 getChangeSource];
      NSUInteger v11 = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v7 getChangeReason];
      uint64_t v12 = [v11 copy];
      changeReason = v6->_changeReason;
      v6->_changeReason = (NSString *)v12;

      NSUInteger v14 = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v7 getBuildVersion];
      uint64_t v15 = [v14 copy];
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = (NSString *)v15;

      id v17 = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v7 getProductVersion];
      uint64_t v18 = [v17 copy];
      productVersion = v6->_productVersion;
      v6->_productVersion = (NSString *)v18;

      id v20 = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v7 getSchemaVersion];
      uint64_t v21 = [v20 copy];
      schemaVersion = v6->_schemaVersion;
      v6->_schemaVersion = (NSString *)v21;

      id v23 = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v7 getLogEventIdentifier];
      uint64_t v24 = [v23 copy];
      logEventIdentifier = v6->_logEventIdentifier;
      v6->_logEventIdentifier = (NSString *)v24;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFHomeAccessorySiriDataSharingChangeLogEventMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFHomeAccessorySiriDataSharingChangeLogEventMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFHomeAccessorySiriDataSharingChangeLogEvent);
      uint64_t v7 = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v5 getDate];
      uint64_t v8 = [v7 copy];
      date = v6->_date;
      v6->_date = (NSDate *)v8;

      v6->_unint64_t previousOptInStatus = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v5 getPreviousOptInStatus];
      v6->_unint64_t newOptInStatus = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v5 getNewOptInStatus];
      v6->_unint64_t changeSource = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v5 getChangeSource];
      NSUInteger v10 = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v5 getChangeReason];
      uint64_t v11 = [v10 copy];
      changeReason = v6->_changeReason;
      v6->_changeReason = (NSString *)v11;

      NSUInteger v13 = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v5 getBuildVersion];
      uint64_t v14 = [v13 copy];
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = (NSString *)v14;

      id v16 = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v5 getProductVersion];
      uint64_t v17 = [v16 copy];
      productVersion = v6->_productVersion;
      v6->_productVersion = (NSString *)v17;

      id v19 = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v5 getSchemaVersion];
      uint64_t v20 = [v19 copy];
      schemaVersion = v6->_schemaVersion;
      v6->_schemaVersion = (NSString *)v20;

      id v22 = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)v5 getLogEventIdentifier];
      uint64_t v23 = [v22 copy];
      logEventIdentifier = v6->_logEventIdentifier;
      v6->_logEventIdentifier = (NSString *)v23;
    }
    else
    {
      uint64_t v6 = (AFHomeAccessorySiriDataSharingChangeLogEvent *)[(AFHomeAccessorySiriDataSharingChangeLogEvent *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFHomeAccessorySiriDataSharingChangeLogEvent *)[(AFHomeAccessorySiriDataSharingChangeLogEvent *)self copy];
  }

  return v6;
}

@end