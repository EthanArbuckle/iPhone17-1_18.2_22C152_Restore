@interface CDRecentServiceInfo
+ (BOOL)supportsSecureCoding;
+ (id)CDRecentServiceInfo:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 info:(id)a7;
- (BOOL)isEmpty;
- (BOOL)updateAmount:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 deductFromCurrentAmount:(BOOL)a7 info:(id)a8;
- (BOOL)validate:(double)a3 atUrgency:(int)a4;
- (CDRecentServiceInfo)initWithAmount:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 info:(id)a7;
- (CDRecentServiceInfo)initWithCoder:(id)a3;
- (NSDictionary)serviceInfo;
- (id)amountAtUrgency:(int)a3 checkTimestamp:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nonPurgeableAmount;
- (id)serialize;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)log;
- (void)setServiceInfo:(id)a3;
- (void)updateInfo:(id)a3;
@end

@implementation CDRecentServiceInfo

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CDRecentServiceInfo);
  v4->recentinfo.urgencies[0] = self->recentinfo.urgencies[0];
  $C140E3A606D9645FEAC1A095AC7A3D5E v5 = self->recentinfo.urgencies[2];
  $C140E3A606D9645FEAC1A095AC7A3D5E v6 = self->recentinfo.urgencies[3];
  unint64_t non_purgeable_amount = self->recentinfo.non_purgeable_amount;
  v4->recentinfo.urgencies[1] = self->recentinfo.urgencies[1];
  v4->recentinfo.unint64_t non_purgeable_amount = non_purgeable_amount;
  v4->recentinfo.urgencies[3] = v6;
  v4->recentinfo.urgencies[2] = v5;
  v8 = [(CDRecentServiceInfo *)self serviceInfo];
  v9 = (void *)[v8 copy];
  [(CDRecentServiceInfo *)v4 setServiceInfo:v9];

  return v4;
}

- (void)setServiceInfo:(id)a3
{
}

- (id)serialize
{
  v3 = (void *)MEMORY[0x1E4F28F98];
  v4 = [(CDRecentServiceInfo *)self serviceInfo];
  uint64_t v10 = 0;
  $C140E3A606D9645FEAC1A095AC7A3D5E v5 = [v3 dataWithPropertyList:v4 format:200 options:0 error:&v10];

  $C140E3A606D9645FEAC1A095AC7A3D5E v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v5, "length") + 72);
  [v6 appendBytes:&self->recentinfo length:72];
  id v7 = v5;
  objc_msgSend(v6, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  v8 = (void *)[v6 copy];

  return v8;
}

- (NSDictionary)serviceInfo
{
  return self->_serviceInfo;
}

- (CDRecentServiceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CDRecentServiceInfo;
  $C140E3A606D9645FEAC1A095AC7A3D5E v5 = [(CDRecentServiceInfo *)&v16 init];
  if (v5)
  {
    $C140E3A606D9645FEAC1A095AC7A3D5E v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_SERVICE_INFO"];
    if ((unint64_t)[v6 length] >= 0x48)
    {
      id v7 = v6;
      uint64_t v8 = [v7 bytes];
      *(_OWORD *)(v5 + 8) = *(_OWORD *)v8;
      long long v10 = *(_OWORD *)(v8 + 32);
      long long v9 = *(_OWORD *)(v8 + 48);
      uint64_t v11 = *(void *)(v8 + 64);
      *(_OWORD *)(v5 + 24) = *(_OWORD *)(v8 + 16);
      *((void *)v5 + 9) = v11;
      *(_OWORD *)(v5 + 56) = v9;
      *(_OWORD *)(v5 + 40) = v10;
      if ((unint64_t)[v7 length] >= 0x49)
      {
        uint64_t v12 = [v7 length] - 72;
        v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v7, "bytes") + 72, v12);
        v14 = [MEMORY[0x1E4F28F98] propertyListWithData:v13 options:0 format:0 error:0];
        [v5 setServiceInfo:v14];
      }
    }
  }
  return (CDRecentServiceInfo *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CDRecentServiceInfo *)self serialize];
  [v4 encodeObject:v5 forKey:@"CACHE_DELETE_SERVICE_INFO"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)updateAmount:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 deductFromCurrentAmount:(BOOL)a7 info:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a6;
  [(CDRecentServiceInfo *)self updateInfo:a8];
  if ((a4 - 5) >= 0xFFFFFFFC) {
    int v16 = a4 - 1;
  }
  else {
    int v16 = 2;
  }
  uint64_t v17 = [v14 unsignedLongLongValue];
  if (v9)
  {
    BOOL v18 = v17 != 0;
    v19 = (char *)self + 16 * v16;
    uint64_t v20 = v16;
    unint64_t v22 = *((void *)v19 + 2);
    v21 = v19 + 16;
    if (v22 <= [v14 unsignedLongLongValue]) {
      void *v21 = 0;
    }
    else {
      *v21 -= [v14 unsignedLongLongValue];
    }
  }
  else
  {
    v23 = (char *)self + 16 * v16;
    uint64_t v20 = v16;
    uint64_t v25 = *((void *)v23 + 2);
    v24 = v23 + 16;
    if (v17 == v25)
    {
      BOOL v18 = 0;
    }
    else
    {
      void *v24 = [v14 unsignedLongLongValue];
      BOOL v18 = 1;
    }
  }
  self->recentinfo.urgencies[v20].timestamp = a5;
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->recentinfo.unint64_t non_purgeable_amount = [v15 unsignedLongLongValue];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = [(CDRecentServiceInfo *)self serviceInfo];
        v27 = (void *)[v26 mutableCopy];

        [v27 setObject:v15 forKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
        v28 = (NSDictionary *)[v27 copy];
        serviceInfo = self->_serviceInfo;
        self->_serviceInfo = v28;

        v30 = tallyDict(v15);
        self->recentinfo.unint64_t non_purgeable_amount = [v30 unsignedLongLongValue];
      }
    }
  }

  return v18;
}

- (void)updateInfo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CDRecentServiceInfo *)self serviceInfo];
    $C140E3A606D9645FEAC1A095AC7A3D5E v6 = (void *)[v5 mutableCopy];

    if (!v6) {
      $C140E3A606D9645FEAC1A095AC7A3D5E v6 = objc_opt_new();
    }
    id v7 = [(CDRecentServiceInfo *)self serviceInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
    if (v8)
    {
    }
    else
    {
      uint64_t v11 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];

      if (!v11)
      {
LABEL_7:
        BOOL v9 = [(CDRecentServiceInfo *)self serviceInfo];
        long long v10 = [v9 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
        if (v10)
        {
        }
        else
        {
          int v16 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];

          if (!v16) {
            goto LABEL_10;
          }
          uint64_t v17 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
          [v6 setObject:v17 forKeyedSubscript:@"CACHE_DELETE_PROCNAME"];

          BOOL v18 = (void *)[v6 copy];
          [(CDRecentServiceInfo *)self setServiceInfo:v18];

          BOOL v9 = CDGetLogHandle((uint64_t)"client");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v19 = [(CDRecentServiceInfo *)self serviceInfo];
            uint64_t v20 = [v19 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
            int v21 = 138412290;
            unint64_t v22 = v20;
            _os_log_impl(&dword_1A63D1000, v9, OS_LOG_TYPE_DEFAULT, "CDRecentServiceInfo updated procname: %@", (uint8_t *)&v21, 0xCu);
          }
        }

LABEL_10:
        goto LABEL_11;
      }
      uint64_t v12 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
      [v6 setObject:v12 forKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];

      v13 = (void *)[v6 copy];
      [(CDRecentServiceInfo *)self setServiceInfo:v13];

      id v7 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(CDRecentServiceInfo *)self serviceInfo];
        id v15 = [v14 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
        int v21 = 138412290;
        unint64_t v22 = v15;
        _os_log_impl(&dword_1A63D1000, v7, OS_LOG_TYPE_DEFAULT, "CDRecentServiceInfo updated signingID: %@", (uint8_t *)&v21, 0xCu);
      }
    }

    goto LABEL_7;
  }
LABEL_11:
}

- (id)amountAtUrgency:(int)a3 checkTimestamp:(BOOL)a4
{
  if ((a3 - 5) >= 0xFFFFFFFC) {
    int v4 = a3 - 1;
  }
  else {
    int v4 = 2;
  }
  p_recentinfo = &self->recentinfo;
  p_timestamp = &self->recentinfo.urgencies[v4].timestamp;
  if (*p_timestamp == 0.0) {
    goto LABEL_15;
  }
  int v7 = v4;
  uint64_t v8 = &p_recentinfo->urgencies[v4];
  unint64_t amount = v8->amount;
  p_unint64_t amount = &v8->amount;
  unint64_t v9 = amount;
  if (*p_timestamp == 1.0 && v9 == 0) {
    goto LABEL_15;
  }
  BOOL v13 = a4;
  id v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  if (v7 >= 2
    && v13
    && v14
    && *p_timestamp < p_recentinfo->urgencies[v7 - 1].timestamp
    && *p_amount < p_recentinfo->urgencies[v7 - 1].amount)
  {

LABEL_15:
    id v14 = 0;
  }
  return v14;
}

- (CDRecentServiceInfo)initWithAmount:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 info:(id)a7
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CDRecentServiceInfo;
  id v15 = [(CDRecentServiceInfo *)&v28 init];
  int v16 = v15;
  if (!v15)
  {
LABEL_19:
    int v21 = v16;
    goto LABEL_20;
  }
  if (v12 && a4)
  {
    *(_OWORD *)(v15 + 8) = 0u;
    uint64_t v17 = v15 + 8;
    *((void *)v15 + 9) = 0;
    *(_OWORD *)(v15 + 40) = 0u;
    *(_OWORD *)(v15 + 56) = 0u;
    if ((a4 - 5) >= 0xFFFFFFFC) {
      int v18 = a4 - 1;
    }
    else {
      int v18 = 2;
    }
    *(_OWORD *)(v15 + 24) = 0uLL;
    if ([v12 longLongValue] < 0) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = [v12 unsignedLongLongValue];
    }
    unint64_t v22 = &v17[16 * v18];
    *((void *)v22 + 1) = v19;
    *(double *)unint64_t v22 = a5;
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16[9] = [v13 unsignedLongLongValue];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v29 = @"CACHE_DELETE_ITEMIZED_NONPURGEABLE";
          v30[0] = v13;
          uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
          v24 = (void *)v16[10];
          v16[10] = v23;

          uint64_t v25 = tallyDict(v13);
          v16[9] = [v25 unsignedLongLongValue];
        }
      }
    }
    [v16 updateInfo:v14];
    goto LABEL_19;
  }
  uint64_t v20 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    __int16 v27 = 0;
    _os_log_error_impl(&dword_1A63D1000, v20, OS_LOG_TYPE_ERROR, "parameter error, must supply amount and urgency", (uint8_t *)&v27, 2u);
  }

  int v21 = 0;
LABEL_20:

  return v21;
}

+ (id)CDRecentServiceInfo:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 info:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  id v14 = [[CDRecentServiceInfo alloc] initWithAmount:v13 atUrgency:v9 withTimestamp:v12 nonPurgeableAmount:v11 info:a5];

  return v14;
}

- (BOOL)validate:(double)a3 atUrgency:(int)a4
{
  int v5 = a4 - 1;
  if ((a4 - 5) < 0xFFFFFFFC) {
    int v5 = 2;
  }
  $C140E3A606D9645FEAC1A095AC7A3D5E v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->recentinfo.urgencies[v5].timestamp];
  BOOL v7 = validateTimestamp(v6, a3);

  return v7;
}

- (id)nonPurgeableAmount
{
  return (id)[NSNumber numberWithUnsignedLongLong:self->recentinfo.non_purgeable_amount];
}

- (BOOL)isEmpty
{
  if (self->recentinfo.urgencies[0].timestamp > 0.0) {
    return 0;
  }
  unint64_t v3 = 0;
  int v4 = &self->recentinfo.urgencies[1];
  do
  {
    unint64_t v5 = v3;
    if (v3 == 3) {
      break;
    }
    double timestamp = v4->timestamp;
    ++v4;
    ++v3;
  }
  while (timestamp <= 0.0);
  return v5 > 2;
}

- (void)invalidate
{
  for (uint64_t i = 0; i != 4; ++i)
    self->recentinfo.urgencies[i].double timestamp = 1.0;
}

- (void)log
{
  uint64_t v2 = 0;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_unint64_t amount = &self->recentinfo.urgencies[0].amount;
  do
  {
    int v4 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = *p_amount;
      $C140E3A606D9645FEAC1A095AC7A3D5E v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*((double *)p_amount - 1)];
      *(_DWORD *)buf = 67109634;
      int v8 = v2;
      __int16 v9 = 2048;
      unint64_t v10 = v5;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1A63D1000, v4, OS_LOG_TYPE_DEFAULT, "     urgency %d, amount : %llu, timestamp: %@", buf, 0x1Cu);
    }
    ++v2;
    p_amount += 2;
  }
  while (v2 != 4);
}

- (id)description
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v4 = [MEMORY[0x1E4F1CA48] array];
  p_unint64_t amount = &self->recentinfo.urgencies[0].amount;
  uint64_t v6 = -4;
  do
  {
    BOOL v7 = NSString;
    unint64_t v8 = *p_amount;
    unint64_t v9 = (unint64_t)*((double *)p_amount - 1);
    if (v9)
    {
      uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      unint64_t v10 = v2;
    }
    else
    {
      unint64_t v10 = 0;
    }
    __int16 v11 = [v7 stringWithFormat:@"u:%d : %llu : %@", v6 + 5, v8, v10];
    [v4 addObject:v11];

    if (v9) {
    p_amount += 2;
    }
  }
  while (!__CFADD__(v6++, 1));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(CDRecentServiceInfo *)self serviceInfo];
  uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        int v18 = NSString;
        uint64_t v19 = [(CDRecentServiceInfo *)self serviceInfo];
        uint64_t v20 = [v19 objectForKeyedSubscript:v17];
        int v21 = [v18 stringWithFormat:@"%@ : %@", v17, v20];
        [v4 addObject:v21];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  unint64_t v22 = [v4 componentsJoinedByString:@", "];

  return v22;
}

@end