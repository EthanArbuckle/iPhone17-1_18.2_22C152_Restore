@interface GEOCountdownData
+ (BOOL)isValid:(id)a3;
+ (Class)alternateFormatStringType;
- (BOOL)hasSeparator;
- (BOOL)hasTimezone;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCountdownData)init;
- (GEOCountdownData)initWithData:(id)a3;
- (GEOCountdownData)initWithDictionary:(id)a3;
- (GEOCountdownData)initWithJSON:(id)a3;
- (NSArray)timestamps;
- (NSDictionary)alternativeFormatStringsByType;
- (NSMutableArray)alternateFormatStrings;
- (NSString)description;
- (NSString)separator;
- (NSString)timezone;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)alternateCountdownTypesAsString:(int)a3;
- (id)alternateFormatStringAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsAlternateCountdownTypes:(id)a3;
- (int)alternateCountdownTypeAtIndex:(unint64_t)a3;
- (int)alternateCountdownTypes;
- (int64_t)_convertFrom:(int)a3;
- (int64_t)countdownType;
- (unint64_t)alternateCountdownTypesCount;
- (unint64_t)alternateFormatStringsCount;
- (unint64_t)hash;
- (unint64_t)timestampValuesCount;
- (unsigned)timestampValueAtIndex:(unint64_t)a3;
- (unsigned)timestampValues;
- (void)_addNoFlagsAlternateFormatString:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAlternateCountdownTypes;
- (void)_readAlternateFormatStrings;
- (void)_readSeparator;
- (void)_readTimestampValues;
- (void)_readTimezone;
- (void)addAlternateCountdownType:(int)a3;
- (void)addAlternateFormatString:(id)a3;
- (void)addTimestampValue:(unsigned int)a3;
- (void)clearAlternateCountdownTypes;
- (void)clearAlternateFormatStrings;
- (void)clearTimestampValues;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAlternateCountdownTypes:(int *)a3 count:(unint64_t)a4;
- (void)setAlternateFormatStrings:(id)a3;
- (void)setSeparator:(id)a3;
- (void)setTimestampValues:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTimezone:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCountdownData

- (GEOCountdownData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCountdownData;
  v2 = [(GEOCountdownData *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCountdownData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCountdownData;
  v3 = [(GEOCountdownData *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOCountdownData;
  [(GEOCountdownData *)&v3 dealloc];
}

- (void)_readTimestampValues
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCountdownDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimestampValues_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)timestampValuesCount
{
  return self->_timestampValues.count;
}

- (unsigned)timestampValues
{
  return self->_timestampValues.list;
}

- (void)clearTimestampValues
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  PBRepeatedUInt32Clear();
}

- (void)addTimestampValue:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (unsigned)timestampValueAtIndex:(unint64_t)a3
{
  -[GEOCountdownData _readTimestampValues]((uint64_t)self);
  p_timestampValues = &self->_timestampValues;
  unint64_t count = self->_timestampValues.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_timestampValues->list[a3];
}

- (void)setTimestampValues:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  MEMORY[0x1F4147400](&self->_timestampValues, a3, a4);
}

- (void)_readAlternateFormatStrings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCountdownDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlternateFormatStrings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)alternateFormatStrings
{
  -[GEOCountdownData _readAlternateFormatStrings]((uint64_t)self);
  alternateFormatStrings = self->_alternateFormatStrings;

  return alternateFormatStrings;
}

- (void)setAlternateFormatStrings:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  alternateFormatStrings = self->_alternateFormatStrings;
  self->_alternateFormatStrings = v4;
}

- (void)clearAlternateFormatStrings
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  alternateFormatStrings = self->_alternateFormatStrings;

  [(NSMutableArray *)alternateFormatStrings removeAllObjects];
}

- (void)addAlternateFormatString:(id)a3
{
  id v4 = a3;
  -[GEOCountdownData _readAlternateFormatStrings]((uint64_t)self);
  -[GEOCountdownData _addNoFlagsAlternateFormatString:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsAlternateFormatString:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)alternateFormatStringsCount
{
  -[GEOCountdownData _readAlternateFormatStrings]((uint64_t)self);
  alternateFormatStrings = self->_alternateFormatStrings;

  return [(NSMutableArray *)alternateFormatStrings count];
}

- (id)alternateFormatStringAtIndex:(unint64_t)a3
{
  -[GEOCountdownData _readAlternateFormatStrings]((uint64_t)self);
  alternateFormatStrings = self->_alternateFormatStrings;

  return (id)[(NSMutableArray *)alternateFormatStrings objectAtIndex:a3];
}

+ (Class)alternateFormatStringType
{
  return (Class)objc_opt_class();
}

- (void)_readAlternateCountdownTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCountdownDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlternateCountdownTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)alternateCountdownTypesCount
{
  return self->_alternateCountdownTypes.count;
}

- (int)alternateCountdownTypes
{
  return self->_alternateCountdownTypes.list;
}

- (void)clearAlternateCountdownTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  PBRepeatedInt32Clear();
}

- (void)addAlternateCountdownType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (int)alternateCountdownTypeAtIndex:(unint64_t)a3
{
  -[GEOCountdownData _readAlternateCountdownTypes]((uint64_t)self);
  p_alternateCountdownTypes = &self->_alternateCountdownTypes;
  unint64_t count = self->_alternateCountdownTypes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_alternateCountdownTypes->list[a3];
}

- (void)setAlternateCountdownTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  MEMORY[0x1F4147390](&self->_alternateCountdownTypes, a3, a4);
}

- (id)alternateCountdownTypesAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DFFF0[a3];
  }

  return v3;
}

- (int)StringAsAlternateCountdownTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IMMINENT_ONLY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IMMINENT_AND_UPCOMING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UPCOMING_ONLY"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readSeparator
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCountdownDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSeparator_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasSeparator
{
  return self->_separator != 0;
}

- (NSString)separator
{
  -[GEOCountdownData _readSeparator]((uint64_t)self);
  separator = self->_separator;

  return separator;
}

- (void)setSeparator:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_separator, a3);
}

- (void)_readTimezone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCountdownDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimezone_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasTimezone
{
  return self->_timezone != 0;
}

- (NSString)timezone
{
  -[GEOCountdownData _readTimezone]((uint64_t)self);
  timezone = self->_timezone;

  return timezone;
}

- (void)setTimezone:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_timezone, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCountdownData;
  int v4 = [(GEOCountdownData *)&v8 description];
  id v5 = [(GEOCountdownData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCountdownData _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[7])
    {
      id v5 = PBRepeatedUInt32NSArray();
      if (a2) {
        objc_super v6 = @"timestampValue";
      }
      else {
        objc_super v6 = @"timestamp_value";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (a1[9])
    {
      id v7 = [a1 alternateFormatStrings];
      if (a2) {
        objc_super v8 = @"alternateFormatString";
      }
      else {
        objc_super v8 = @"alternate_format_string";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (a1[4])
    {
      v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v10 = a1 + 3;
      if (a1[4])
      {
        unint64_t v11 = 0;
        do
        {
          uint64_t v12 = *(int *)(*v10 + 4 * v11);
          if (v12 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = off_1E53DFFF0[v12];
          }
          [v9 addObject:v13];

          ++v11;
          v10 = a1 + 3;
        }
        while (v11 < a1[4]);
      }
      if (a2) {
        v14 = @"alternateCountdownType";
      }
      else {
        v14 = @"alternate_countdown_type";
      }
      [v4 setObject:v9 forKey:v14];
    }
    v15 = [a1 separator];
    if (v15) {
      [v4 setObject:v15 forKey:@"separator"];
    }

    v16 = [a1 timezone];
    if (v16) {
      [v4 setObject:v16 forKey:@"timezone"];
    }

    v17 = (void *)a1[2];
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __46__GEOCountdownData__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCountdownData _dictionaryRepresentation:](self, 1);
}

void __46__GEOCountdownData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOCountdownData)initWithDictionary:(id)a3
{
  return (GEOCountdownData *)-[GEOCountdownData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = (void *)[a1 init];
    if (v6)
    {
      if (a3) {
        id v7 = @"timestampValue";
      }
      else {
        id v7 = @"timestamp_value";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v50;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v50 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v49 + 1) + 8 * v13);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(v6, "addTimestampValue:", objc_msgSend(v14, "unsignedIntValue"));
              }
              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
          }
          while (v11);
        }
      }
      if (a3) {
        v15 = @"alternateFormatString";
      }
      else {
        v15 = @"alternate_format_string";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v46;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v46 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = *(void **)(*((void *)&v45 + 1) + 8 * v21);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = (void *)[v22 copy];
                [v6 addAlternateFormatString:v23];
              }
              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v54 count:16];
          }
          while (v19);
        }
      }
      if (a3) {
        v24 = @"alternateCountdownType";
      }
      else {
        v24 = @"alternate_countdown_type";
      }
      id v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v39 = v25;
        id v40 = v5;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v53 count:16];
        if (!v27) {
          goto LABEL_56;
        }
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v42;
        while (1)
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v42 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v41 + 1) + 8 * v30);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v32 = v31;
              if ([v32 isEqualToString:@"UNKNOWN"])
              {
                uint64_t v33 = 0;
              }
              else if ([v32 isEqualToString:@"IMMINENT_ONLY"])
              {
                uint64_t v33 = 1;
              }
              else if ([v32 isEqualToString:@"IMMINENT_AND_UPCOMING"])
              {
                uint64_t v33 = 2;
              }
              else if ([v32 isEqualToString:@"UPCOMING_ONLY"])
              {
                uint64_t v33 = 3;
              }
              else
              {
                uint64_t v33 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_54;
              }
              uint64_t v33 = [v31 intValue];
            }
            objc_msgSend(v6, "addAlternateCountdownType:", v33, v39, v40, (void)v41);
LABEL_54:
            ++v30;
          }
          while (v28 != v30);
          uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v53 count:16];
          if (!v28)
          {
LABEL_56:

            id v25 = v39;
            id v5 = v40;
            break;
          }
        }
      }

      v34 = [v5 objectForKeyedSubscript:@"separator"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = (void *)[v34 copy];
        [v6 setSeparator:v35];
      }
      v36 = [v5 objectForKeyedSubscript:@"timezone"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = (void *)[v36 copy];
        [v6 setTimezone:v37];
      }
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (GEOCountdownData)initWithJSON:(id)a3
{
  return (GEOCountdownData *)-[GEOCountdownData _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_1246;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1247;
    }
    GEOCountdownDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCountdownDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCountdownDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7E) == 0))
  {
    uint64_t v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOCountdownData *)self readAll:0];
    if (self->_timestampValues.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_timestampValues.count);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = self->_alternateFormatStrings;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    if (self->_alternateCountdownTypes.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < self->_alternateCountdownTypes.count);
    }
    if (self->_separator) {
      PBDataWriterWriteStringField();
    }
    if (self->_timezone) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }
}

- (void)copyTo:(id)a3
{
  long long v15 = (id *)a3;
  [(GEOCountdownData *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 24) = self->_readerMarkPos;
  *((_DWORD *)v15 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOCountdownData *)self timestampValuesCount])
  {
    [v15 clearTimestampValues];
    unint64_t v4 = [(GEOCountdownData *)self timestampValuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v15, "addTimestampValue:", -[GEOCountdownData timestampValueAtIndex:](self, "timestampValueAtIndex:", i));
    }
  }
  if ([(GEOCountdownData *)self alternateFormatStringsCount])
  {
    [v15 clearAlternateFormatStrings];
    unint64_t v7 = [(GEOCountdownData *)self alternateFormatStringsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(GEOCountdownData *)self alternateFormatStringAtIndex:j];
        [v15 addAlternateFormatString:v10];
      }
    }
  }
  if ([(GEOCountdownData *)self alternateCountdownTypesCount])
  {
    [v15 clearAlternateCountdownTypes];
    unint64_t v11 = [(GEOCountdownData *)self alternateCountdownTypesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        objc_msgSend(v15, "addAlternateCountdownType:", -[GEOCountdownData alternateCountdownTypeAtIndex:](self, "alternateCountdownTypeAtIndex:", k));
    }
  }
  if (self->_separator) {
    objc_msgSend(v15, "setSeparator:");
  }
  long long v14 = v15;
  if (self->_timezone)
  {
    objc_msgSend(v15, "setTimezone:");
    long long v14 = v15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOCountdownDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCountdownData *)self readAll:0];
  PBRepeatedUInt32Copy();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v8 = self->_alternateFormatStrings;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addAlternateFormatString:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  PBRepeatedInt32Copy();
  uint64_t v13 = [(NSString *)self->_separator copyWithZone:a3];
  long long v14 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v13;

  uint64_t v15 = [(NSString *)self->_timezone copyWithZone:a3];
  long long v16 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v15;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOCountdownData *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedUInt32IsEqual())
    && ((alternateFormatStrings = self->_alternateFormatStrings, !((unint64_t)alternateFormatStrings | v4[9]))
     || -[NSMutableArray isEqual:](alternateFormatStrings, "isEqual:"))
    && PBRepeatedInt32IsEqual()
    && ((separator = self->_separator, !((unint64_t)separator | v4[10]))
     || -[NSString isEqual:](separator, "isEqual:")))
  {
    timezone = self->_timezone;
    if ((unint64_t)timezone | v4[11]) {
      char v8 = -[NSString isEqual:](timezone, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEOCountdownData *)self readAll:1];
  uint64_t v3 = PBRepeatedUInt32Hash();
  uint64_t v4 = [(NSMutableArray *)self->_alternateFormatStrings hash];
  uint64_t v5 = v4 ^ v3 ^ PBRepeatedInt32Hash();
  NSUInteger v6 = [(NSString *)self->_separator hash];
  return v5 ^ v6 ^ [(NSString *)self->_timezone hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 timestampValuesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEOCountdownData addTimestampValue:](self, "addTimestampValue:", [v4 timestampValueAtIndex:i]);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v4[9];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOCountdownData addAlternateFormatString:](self, "addAlternateFormatString:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v13 = [v4 alternateCountdownTypesCount];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t k = 0; k != v14; ++k)
      -[GEOCountdownData addAlternateCountdownType:](self, "addAlternateCountdownType:", objc_msgSend(v4, "alternateCountdownTypeAtIndex:", k, (void)v16));
  }
  if (v4[10]) {
    -[GEOCountdownData setSeparator:](self, "setSeparator:");
  }
  if (v4[11]) {
    -[GEOCountdownData setTimezone:](self, "setTimezone:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOCountdownDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1251);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOCountdownData *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_alternateFormatStrings, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (NSArray)timestamps
{
  if ([(GEOCountdownData *)self timestampValuesCount])
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEOCountdownData timestampValuesCount](self, "timestampValuesCount"));
    if ([(GEOCountdownData *)self timestampValuesCount])
    {
      unint64_t v4 = 0;
      do
      {
        uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GEOCountdownData timestampValueAtIndex:](self, "timestampValueAtIndex:", v4));
        [v3 addObject:v5];

        ++v4;
      }
      while (v4 < [(GEOCountdownData *)self timestampValuesCount]);
    }
    uint64_t v6 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSArray *)v6;
}

- (int64_t)countdownType
{
  return 0;
}

- (NSDictionary)alternativeFormatStringsByType
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[GEOCountdownData alternateFormatStringsCount](self, "alternateFormatStringsCount"));
  unint64_t v4 = [(GEOCountdownData *)self alternateFormatStrings];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __69__GEOCountdownData_GEOServicesExtras__alternativeFormatStringsByType__block_invoke;
  uint64_t v11 = &unk_1E53E9900;
  unint64_t v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:&v8];

  uint64_t v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSDictionary *)v6;
}

void __69__GEOCountdownData_GEOServicesExtras__alternativeFormatStringsByType__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) alternateCountdownTypesCount] <= a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: idx < self.alternateCountdownTypesCount", v9, 2u);
    }
  }
  else
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_convertFrom:", objc_msgSend(*(id *)(a1 + 32), "alternateCountdownTypeAtIndex:", a3));
    unint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = [NSNumber numberWithInteger:v6];
    [v7 setObject:v5 forKeyedSubscript:v8];
  }
}

- (int64_t)_convertFrom:(int)a3
{
  uint64_t v3 = (a3 - 1);
  if (v3 < 3) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

@end