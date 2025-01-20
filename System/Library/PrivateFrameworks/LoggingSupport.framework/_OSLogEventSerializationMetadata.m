@interface _OSLogEventSerializationMetadata
- (NSDate)firstDate;
- (NSDate)lastDate;
- (NSMutableDictionary)indexToStringMapping;
- (NSMutableDictionary)stringToIndexMapping;
- (NSString)filterPredicateDescription;
- (_OSLogEventSerializationMetadata)init;
- (_OSLogEventSerializationMetadata)initWithDataRepresentation:(id)a3;
- (id)dataRepresentation;
- (id)indexForString:(id)a3;
- (id)stringForIndex:(id)a3;
- (unint64_t)flags;
- (unint64_t)maxLogEventBatchSize;
- (unint64_t)serializedEventCount;
- (void)setFilterPredicateDescription:(id)a3;
- (void)setFirstDate:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setLastDate:(id)a3;
- (void)setMaxLogEventBatchSize:(unint64_t)a3;
- (void)setSerializedEventCount:(unint64_t)a3;
@end

@implementation _OSLogEventSerializationMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDate, 0);
  objc_storeStrong((id *)&self->_firstDate, 0);
  objc_storeStrong((id *)&self->_filterPredicateDescription, 0);
  objc_storeStrong((id *)&self->_stringToIndexMapping, 0);
  objc_storeStrong((id *)&self->_indexToStringMapping, 0);
}

- (void)setLastDate:(id)a3
{
}

- (NSDate)lastDate
{
  return self->_lastDate;
}

- (void)setFirstDate:(id)a3
{
}

- (NSDate)firstDate
{
  return self->_firstDate;
}

- (void)setSerializedEventCount:(unint64_t)a3
{
  self->_serializedEventCount = a3;
}

- (unint64_t)serializedEventCount
{
  return self->_serializedEventCount;
}

- (void)setMaxLogEventBatchSize:(unint64_t)a3
{
  self->_maxLogEventBatchSize = a3;
}

- (unint64_t)maxLogEventBatchSize
{
  return self->_maxLogEventBatchSize;
}

- (void)setFilterPredicateDescription:(id)a3
{
}

- (NSString)filterPredicateDescription
{
  return self->_filterPredicateDescription;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSMutableDictionary)stringToIndexMapping
{
  return self->_stringToIndexMapping;
}

- (NSMutableDictionary)indexToStringMapping
{
  return self->_indexToStringMapping;
}

- (id)stringForIndex:(id)a3
{
  id v5 = a3;
  v6 = [(_OSLogEventSerializationMetadata *)self indexToStringMapping];
  v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:178 description:@"Invalid index-to-string mapping"];
  }
  return v7;
}

- (id)indexForString:(id)a3
{
  id v4 = a3;
  id v5 = [(_OSLogEventSerializationMetadata *)self stringToIndexMapping];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E4F28ED0];
    v8 = [(_OSLogEventSerializationMetadata *)self stringToIndexMapping];
    v6 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));

    v9 = [(_OSLogEventSerializationMetadata *)self stringToIndexMapping];
    [v9 setObject:v6 forKeyedSubscript:v4];
  }
  return v6;
}

- (id)dataRepresentation
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v24[0] = @"Version";
  v24[1] = @"StringIndex";
  v25[0] = &unk_1EF44AF58;
  v3 = [(_OSLogEventSerializationMetadata *)self stringToIndexMapping];
  v25[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  id v5 = (void *)[v4 mutableCopy];

  v6 = [(_OSLogEventSerializationMetadata *)self firstDate];

  if (v6)
  {
    v7 = [(_OSLogEventSerializationMetadata *)self firstDate];
    [v5 setObject:v7 forKeyedSubscript:@"FirstDate"];
  }
  v8 = [(_OSLogEventSerializationMetadata *)self lastDate];

  if (v8)
  {
    v9 = [(_OSLogEventSerializationMetadata *)self lastDate];
    [v5 setObject:v9 forKeyedSubscript:@"LastDate"];
  }
  v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[_OSLogEventSerializationMetadata flags](self, "flags"));
  [v5 setObject:v10 forKeyedSubscript:@"Flags"];

  v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[_OSLogEventSerializationMetadata maxLogEventBatchSize](self, "maxLogEventBatchSize"));
  [v5 setObject:v11 forKeyedSubscript:@"MaxLogEventBatchSize"];

  v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[_OSLogEventSerializationMetadata serializedEventCount](self, "serializedEventCount"));
  [v5 setObject:v12 forKeyedSubscript:@"SerializedEventCount"];

  v13 = [(_OSLogEventSerializationMetadata *)self filterPredicateDescription];

  if (v13)
  {
    v14 = [(_OSLogEventSerializationMetadata *)self filterPredicateDescription];
    [v5 setObject:v14 forKeyedSubscript:@"FilterPredicateDescription"];
  }
  id v21 = 0;
  v15 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:&v21];
  id v16 = v21;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    BOOL v18 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v16)
    {
      if (v18)
      {
        v19 = [v16 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v23 = v19;
        _os_log_error_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Serializing metadata failed with an error: %@", buf, 0xCu);
      }
    }
    else if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Serializing metadata failed without detailed error", buf, 2u);
    }
  }

  return v15;
}

- (_OSLogEventSerializationMetadata)initWithDataRepresentation:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_OSLogEventSerializationMetadata;
  id v5 = [(_OSLogEventSerializationMetadata *)&v32 init];
  if (v5)
  {
    id v31 = 0;
    v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v31];
    id v7 = v31;
    v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = v6;
      v11 = [v10 objectForKeyedSubscript:@"Version"];
      if (v11
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ![v11 unsignedIntValue])
      {
        v15 = [v10 objectForKeyedSubscript:@"Flags"];
        v5->_flags = (unint64_t)v15;

        id v16 = [v10 objectForKeyedSubscript:@"MaxLogEventBatchSize"];
        v5->_maxLogEventBatchSize = (unint64_t)v16;

        id v17 = [v10 objectForKeyedSubscript:@"SerializedEventCount"];
        v5->_serializedEventCount = (unint64_t)v17;

        BOOL v18 = [v10 objectForKeyedSubscript:@"FilterPredicateDescription"];
        if (v18)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeStrong((id *)&v5->_filterPredicateDescription, v18);
          }
        }
        v19 = [v10 objectForKeyedSubscript:@"FirstDate"];
        if (v19)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeStrong((id *)&v5->_firstDate, v19);
          }
        }
        v20 = [v10 objectForKeyedSubscript:@"LastDate"];
        if (v20)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeStrong((id *)&v5->_lastDate, v20);
          }
        }
        id v21 = [v10 objectForKeyedSubscript:@"StringIndex"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v27 = 0;
          v28 = &v27;
          uint64_t v29 = 0x2020000000;
          char v30 = 0;
          v22 = [MEMORY[0x1E4F1CA60] dictionary];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          void v24[2] = __63___OSLogEventSerializationMetadata_initWithDataRepresentation___block_invoke;
          v24[3] = &unk_1E5A431F0;
          v26 = &v27;
          id v23 = v22;
          id v25 = v23;
          [v21 enumerateKeysAndObjectsUsingBlock:v24];
          if (*((unsigned char *)v28 + 24))
          {
            int v12 = 1;
          }
          else
          {
            objc_storeStrong((id *)&v5->_indexToStringMapping, v22);
            int v12 = 0;
          }

          _Block_object_dispose(&v27, 8);
        }
        else
        {
          int v12 = 1;
        }
      }
      else
      {
        int v12 = 1;
      }

      if (!v12) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    v13 = 0;
    goto LABEL_16;
  }
LABEL_13:
  v13 = v5;
LABEL_16:

  return v13;
}

- (_OSLogEventSerializationMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)_OSLogEventSerializationMetadata;
  v2 = [(_OSLogEventSerializationMetadata *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    stringToIndexMapping = v2->_stringToIndexMapping;
    v2->_stringToIndexMapping = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end