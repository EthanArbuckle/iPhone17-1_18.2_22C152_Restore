@interface _DKEventAdapter
- (BOOL)BOOLValue;
- (BOOL)isEqual:(id)a3;
- (_DKEvent)dkEvent;
- (double)confidence;
- (double)doubleValue;
- (double)valueDouble;
- (id)UUID;
- (id)creationDate;
- (id)customMetadata;
- (id)endDate;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)localCreationDate;
- (id)metadata;
- (id)source;
- (id)startDate;
- (id)stream;
- (id)streamName;
- (id)stringValue;
- (id)structuredMetadata;
- (id)timeZone;
- (id)uuid;
- (id)uuidHash;
- (id)value;
- (id)valueString;
- (int64_t)compatibilityVersion;
- (int64_t)endDayOfWeek;
- (int64_t)endSecondOfDay;
- (int64_t)integerValue;
- (int64_t)secondsFromGMT;
- (int64_t)startDayOfWeek;
- (int64_t)startSecondOfDay;
- (int64_t)valueInteger;
- (int64_t)valueTypeCode;
- (signed)valueClass;
- (unint64_t)hash;
- (void)setDkEvent:(id)a3;
@end

@implementation _DKEventAdapter

- (id)localCreationDate
{
  return [(_DKObject *)self->_dkEvent localCreationDate];
}

- (id)creationDate
{
  return [(_DKObject *)self->_dkEvent creationDate];
}

- (id)uuid
{
  v2 = [(_DKObject *)self->_dkEvent UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)uuidHash
{
  v2 = NSNumber;
  v3 = [(_DKEventAdapter *)self uuid];
  v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "hash"));

  return v4;
}

- (id)source
{
  return [(_DKObject *)self->_dkEvent source];
}

- (id)streamName
{
  v2 = [(_DKEvent *)self->_dkEvent stream];
  v3 = [v2 name];

  return v3;
}

- (int64_t)secondsFromGMT
{
  v2 = [(_DKEvent *)self->_dkEvent timeZone];
  int64_t v3 = [v2 secondsFromGMT];

  return v3;
}

- (int64_t)startSecondOfDay
{
  v2 = [(_DKEvent *)self->_dkEvent startDate];
  [v2 timeIntervalSinceReferenceDate];
  int64_t v4 = (uint64_t)v3 % 86400;

  return v4;
}

- (int64_t)startDayOfWeek
{
  startDayOfWeek = self->_startDayOfWeek;
  if (startDayOfWeek)
  {
    return [(NSNumber *)startDayOfWeek longLongValue];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v6 = [(_DKEvent *)self->_dkEvent startDate];
    v7 = [v5 components:512 fromDate:v6];
    int64_t v8 = [v7 weekday];

    v9 = [NSNumber numberWithUnsignedLongLong:v8];
    v10 = self->_startDayOfWeek;
    self->_startDayOfWeek = v9;

    return v8;
  }
}

- (int64_t)endSecondOfDay
{
  v2 = [(_DKEvent *)self->_dkEvent endDate];
  [v2 timeIntervalSinceReferenceDate];
  int64_t v4 = (uint64_t)v3 % 86400;

  return v4;
}

- (int64_t)endDayOfWeek
{
  endDayOfWeek = self->_endDayOfWeek;
  if (endDayOfWeek)
  {
    return [(NSNumber *)endDayOfWeek longLongValue];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v6 = [(_DKEvent *)self->_dkEvent endDate];
    v7 = [v5 components:512 fromDate:v6];
    int64_t v8 = [v7 weekday];

    v9 = [NSNumber numberWithUnsignedLongLong:v8];
    v10 = self->_endDayOfWeek;
    self->_endDayOfWeek = v9;

    return v8;
  }
}

- (double)valueDouble
{
  v2 = [(_DKEvent *)self->_dkEvent value];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (int64_t)valueInteger
{
  v2 = [(_DKEvent *)self->_dkEvent value];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (id)valueString
{
  int64_t v3 = [(_DKEvent *)self->_dkEvent value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(_DKEvent *)self->_dkEvent value];
    v6 = [v5 stringValue];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (signed)valueClass
{
  int64_t v3 = [(_DKEvent *)self->_dkEvent value];
  double v4 = [v3 UUID];

  if (v4) {
    return 0;
  }
  v6 = [(_DKEvent *)self->_dkEvent value];
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 1;
  }
  int64_t v8 = [(_DKEvent *)self->_dkEvent value];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9) {
    return 2;
  }
  v10 = [(_DKEvent *)self->_dkEvent value];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if (v11) {
    return 3;
  }
  else {
    return 0;
  }
}

- (int64_t)valueTypeCode
{
  if (![(_DKEventAdapter *)self valueClass]) {
    return 0;
  }
  int64_t v3 = [(_DKEvent *)self->_dkEvent value];
  int64_t v4 = [v3 typeCode];

  return v4;
}

- (id)structuredMetadata
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  structuredMetadata = self->_structuredMetadata;
  if (structuredMetadata)
  {
    int64_t v3 = structuredMetadata;
  }
  else
  {
    v5 = objc_opt_new();
    v6 = (void *)MEMORY[0x192FB2F20]();
    v7 = [(_DKEvent *)self->_dkEvent metadata];
    int64_t v8 = +[_DKMetadataPersistenceLookupTable keyToAttribute]();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v15 = objc_msgSend(v8, "objectForKeyedSubscript:", v14, (void)v20);
          if (v15)
          {
            v16 = [v9 objectForKeyedSubscript:v14];
            [v5 setObject:v16 forKeyedSubscript:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    v17 = (NSDictionary *)[v5 copy];
    v18 = self->_structuredMetadata;
    self->_structuredMetadata = v17;

    int64_t v3 = v17;
  }
  return v3;
}

- (id)customMetadata
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  customMetadata = self->_customMetadata;
  if (customMetadata)
  {
    int64_t v3 = customMetadata;
    goto LABEL_36;
  }
  v5 = objc_opt_new();
  context = (void *)MEMORY[0x192FB2F20]();
  v40 = self;
  v6 = [(_DKEvent *)self->_dkEvent metadata];
  v7 = +[_DKMetadataPersistenceLookupTable keyToAttribute]();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (!v9) {
    goto LABEL_35;
  }
  uint64_t v10 = v9;
  unint64_t v11 = 0x1E4F29000uLL;
  uint64_t v12 = *(void *)v45;
  v41 = v5;
  v42 = v7;
  uint64_t v43 = *(void *)v45;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v45 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(void *)(*((void *)&v44 + 1) + 8 * v13);
      v15 = [v8 objectForKeyedSubscript:v14];
      v16 = [v7 objectForKeyedSubscript:v14];
      if (!v16)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = *(void **)(v11 + 24);
          id v18 = v15;
          CFNumberRef v19 = +[_CDHashUtilities md5ForString:v18];
          [v17 stringWithFormat:@"%@S", v19];
          goto LABEL_11;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CFNumberRef v19 = v15;
          int IsFloatType = CFNumberIsFloatType(v19);
          long long v22 = *(void **)(v11 + 24);
          if (IsFloatType)
          {
            uint64_t v23 = [v22 stringWithFormat:@"%@D", v19];
            long long v20 = (__CFString *)v23;
            if (v19)
            {
              v50[0] = @"name";
              v50[1] = @"doubleValue";
              v51[0] = v14;
              v51[1] = v19;
              v50[2] = @"valueHash";
              v24 = &stru_1EDDE58B8;
              if (v23) {
                v24 = (__CFString *)v23;
              }
              v51[2] = v24;
              uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];
              [v41 addObject:v25];

              v5 = v41;
              goto LABEL_28;
            }
LABEL_25:
            v48[0] = @"name";
            v48[1] = @"valueHash";
            v32 = &stru_1EDDE58B8;
            if (v20) {
              v32 = v20;
            }
            v49[0] = v14;
            v49[1] = v32;
            CFNumberRef v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
            [v5 addObject:v19];
LABEL_28:

            unint64_t v11 = 0x1E4F29000;
            uint64_t v12 = v43;
            goto LABEL_29;
          }
          [v22 stringWithFormat:@"%@I", v19];
LABEL_23:
          long long v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v26 = *(void **)(v11 + 24);
            CFNumberRef v19 = v15;
            [(__CFNumber *)v19 timeIntervalSinceReferenceDate];
            v27 = v26;
            v7 = v42;
            objc_msgSend(v27, "stringWithFormat:", @"%fT", v28);
            goto LABEL_23;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v29 = *(void **)(v11 + 24);
            id v30 = v15;
            CFNumberRef v19 = +[_CDHashUtilities md5ForData:v30];
            v31 = v29;
            v7 = v42;
            long long v20 = [v31 stringWithFormat:@"%@B", v19];

            v5 = v41;
          }
          else
          {
            if (![v15 conformsToProtocol:&unk_1EDE1F850])
            {
              long long v20 = 0;
              goto LABEL_25;
            }
            CFNumberRef v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v15];
            v33 = *(void **)(v11 + 24);
            id v18 = +[_CDHashUtilities md5ForData:v19];
            v34 = v33;
            v5 = v41;
            [v34 stringWithFormat:@"%@O", v18];
LABEL_11:
            long long v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v7 = v42;
          }
        }

        goto LABEL_25;
      }
LABEL_29:

      ++v13;
    }
    while (v10 != v13);
    uint64_t v35 = [v8 countByEnumeratingWithState:&v44 objects:v52 count:16];
    uint64_t v10 = v35;
  }
  while (v35);
LABEL_35:

  v36 = (NSArray *)[v5 copy];
  v37 = v40->_customMetadata;
  v40->_customMetadata = v36;

  int64_t v3 = v36;
LABEL_36:
  return v3;
}

- (id)UUID
{
  return [(_DKObject *)self->_dkEvent UUID];
}

- (id)stringValue
{
  return [(_DKEvent *)self->_dkEvent stringValue];
}

- (BOOL)BOOLValue
{
  return [(_DKEvent *)self->_dkEvent BOOLValue];
}

- (int64_t)integerValue
{
  return [(_DKEvent *)self->_dkEvent integerValue];
}

- (double)doubleValue
{
  [(_DKEvent *)self->_dkEvent doubleValue];
  return result;
}

- (id)stream
{
  return [(_DKEvent *)self->_dkEvent stream];
}

- (id)startDate
{
  return [(_DKEvent *)self->_dkEvent startDate];
}

- (id)endDate
{
  return [(_DKEvent *)self->_dkEvent endDate];
}

- (id)timeZone
{
  return [(_DKEvent *)self->_dkEvent timeZone];
}

- (id)value
{
  return [(_DKEvent *)self->_dkEvent value];
}

- (double)confidence
{
  [(_DKEvent *)self->_dkEvent confidence];
  return result;
}

- (int64_t)compatibilityVersion
{
  return [(_DKEvent *)self->_dkEvent compatibilityVersion];
}

- (id)metadata
{
  return [(_DKEvent *)self->_dkEvent metadata];
}

- (unint64_t)hash
{
  return [(_DKEvent *)self->_dkEvent hash];
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(_DKEvent *)self->_dkEvent isEqual:v4[5]];

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = self->_dkEvent;
  }
  else {
    int64_t v4 = 0;
  }
  return v4;
}

- (_DKEvent)dkEvent
{
  return self->_dkEvent;
}

- (void)setDkEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dkEvent, 0);
  objc_storeStrong((id *)&self->_endDayOfWeek, 0);
  objc_storeStrong((id *)&self->_startDayOfWeek, 0);
  objc_storeStrong((id *)&self->_customMetadata, 0);
  objc_storeStrong((id *)&self->_structuredMetadata, 0);
}

@end