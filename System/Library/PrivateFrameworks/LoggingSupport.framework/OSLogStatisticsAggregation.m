@interface OSLogStatisticsAggregation
+ (id)_labelFromProxy:(id)a3 forTier:(unsigned __int8)a4;
+ (id)_stringForTier:(unsigned __int8)a3;
- (NSMutableDictionary)labelToChildTiers;
- (NSNumber)senderOffset;
- (NSString)formatString;
- (NSString)label;
- (NSString)tierString;
- (NSUUID)senderUUID;
- (OSLogStatisticsAggregation)initWithLabel:(id)a3 tier:(unsigned __int8)a4;
- (OSLogStatisticsAggregation)initWithOSLogProxy:(id)a3 tier:(unsigned __int8)a4;
- (id)_descendingChildren;
- (id)_descriptionTierCap:(unsigned __int8)a3 withDepth:(unint64_t)a4;
- (id)_dictRepresentation:(unsigned __int8)a3;
- (id)_tracePointSizeString;
- (id)aggregationForTier:(unsigned __int8)a3 withLabel:(id)a4;
- (id)aggregationsForTier:(unsigned __int8)a3;
- (id)descriptionWithTierCap:(unsigned __int8)a3;
- (id)jsonDescription:(unint64_t)a3;
- (id)jsonDescription:(unint64_t)a3 tierCap:(unsigned __int8)a4;
- (unint64_t)eventBytes;
- (unint64_t)eventCount;
- (unsigned)_childTier;
- (unsigned)tier;
- (void)_addToChildren:(id)a3;
- (void)_addTraceEvent:(id)a3;
- (void)setEventBytes:(unint64_t)a3;
- (void)setEventCount:(unint64_t)a3;
@end

@implementation OSLogStatisticsAggregation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderOffset, 0);
  objc_storeStrong((id *)&self->_senderUUID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
  objc_storeStrong((id *)&self->_labelToChildTiers, 0);
}

- (NSNumber)senderOffset
{
  return self->_senderOffset;
}

- (NSUUID)senderUUID
{
  return self->_senderUUID;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (unsigned)tier
{
  return self->_tier;
}

- (void)setEventBytes:(unint64_t)a3
{
  self->_eventBytes = a3;
}

- (unint64_t)eventBytes
{
  return self->_eventBytes;
}

- (void)setEventCount:(unint64_t)a3
{
  self->_eventCount = a3;
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (NSMutableDictionary)labelToChildTiers
{
  return self->_labelToChildTiers;
}

- (id)aggregationForTier:(unsigned __int8)a3 withLabel:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(OSLogStatisticsAggregation *)self aggregationsForTier:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "label", (void)v15);
        char v13 = [v12 isEqualToString:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)aggregationsForTier:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v20[1] = *MEMORY[0x1E4F143B8];
  if ([(OSLogStatisticsAggregation *)self tier] <= a3)
  {
    if ([(OSLogStatisticsAggregation *)self tier] == v3)
    {
      v20[0] = self;
      v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1CA48] array];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = [(OSLogStatisticsAggregation *)self labelToChildTiers];
      id v8 = [v7 allValues];

      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            char v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) aggregationsForTier:v3];
            if (v13) {
              [v6 addObjectsFromArray:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }

      v5 = (void *)[v6 copy];
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)descriptionWithTierCap:(unsigned __int8)a3
{
  return [(OSLogStatisticsAggregation *)self _descriptionTierCap:a3 withDepth:0];
}

- (id)_descriptionTierCap:(unsigned __int8)a3 withDepth:(unint64_t)a4
{
  uint64_t v5 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = &stru_1EF440710;
  if ([(OSLogStatisticsAggregation *)self tier] <= a3)
  {
    id v7 = [MEMORY[0x1E4F28E78] string];
    if (a4)
    {
      unsigned int v8 = 1;
      do
      {
        [(__CFString *)v7 appendString:@"  "];
        unint64_t v9 = v8++;
      }
      while (v9 < a4);
    }
    uint64_t v10 = [(OSLogStatisticsAggregation *)self label];
    uint64_t v11 = [(OSLogStatisticsAggregation *)self _tracePointSizeString];
    unint64_t v12 = [(OSLogStatisticsAggregation *)self eventCount];
    unint64_t v13 = [(OSLogStatisticsAggregation *)self eventCount];
    v14 = @"s";
    if (v13 <= 1) {
      v14 = &stru_1EF440710;
    }
    [(__CFString *)v7 appendFormat:@"%@: %@ (%llu event%@)\n", v10, v11, v12, v14];

    if ([(OSLogStatisticsAggregation *)self _childTier] <= v5)
    {
      long long v15 = [(OSLogStatisticsAggregation *)self _descendingChildren];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v24;
        unint64_t v19 = a4 + 1;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            v21 = [*(id *)(*((void *)&v23 + 1) + 8 * i) _descriptionTierCap:v5 withDepth:v19];
            [(__CFString *)v7 appendString:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v17);
      }
    }
  }
  return v7;
}

- (id)_tracePointSizeString
{
  v2 = (void *)MEMORY[0x1E4F28B68];
  unint64_t v3 = [(OSLogStatisticsAggregation *)self eventBytes];
  return (id)[v2 stringFromByteCount:v3 countStyle:0];
}

- (id)jsonDescription:(unint64_t)a3
{
  return [(OSLogStatisticsAggregation *)self jsonDescription:a3 tierCap:8];
}

- (id)jsonDescription:(unint64_t)a3 tierCap:(unsigned __int8)a4
{
  uint64_t v5 = [(OSLogStatisticsAggregation *)self _dictRepresentation:a4];
  if (v5)
  {
    uint64_t v9 = 0;
    id v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:a3 error:&v9];
    if (v6) {
      id v7 = (__CFString *)[[NSString alloc] initWithData:v6 encoding:4];
    }
    else {
      id v7 = &stru_1EF440710;
    }
  }
  else
  {
    id v7 = &stru_1EF440710;
  }

  return v7;
}

- (id)_dictRepresentation:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v33[4] = *MEMORY[0x1E4F143B8];
  if ([(OSLogStatisticsAggregation *)self tier] <= a3)
  {
    v32[0] = @"eventCount";
    id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[OSLogStatisticsAggregation eventCount](self, "eventCount"));
    v33[0] = v6;
    v32[1] = @"eventBytes";
    id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[OSLogStatisticsAggregation eventBytes](self, "eventBytes"));
    v33[1] = v7;
    v32[2] = @"tier";
    unsigned int v8 = [(OSLogStatisticsAggregation *)self tierString];
    v33[2] = v8;
    v32[3] = @"label";
    uint64_t v9 = [(OSLogStatisticsAggregation *)self label];
    v33[3] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:4];
    uint64_t v11 = (void *)[v10 mutableCopy];

    unint64_t v12 = [(OSLogStatisticsAggregation *)self senderUUID];

    if (v12)
    {
      unint64_t v13 = [(OSLogStatisticsAggregation *)self senderUUID];
      v14 = [v13 UUIDString];
      [v11 setObject:v14 forKeyedSubscript:@"senderUUID"];

      long long v15 = [(OSLogStatisticsAggregation *)self senderOffset];
      [v11 setObject:v15 forKeyedSubscript:@"senderOffset"];
    }
    uint64_t v16 = [(OSLogStatisticsAggregation *)self formatString];

    if (v16)
    {
      uint64_t v17 = [(OSLogStatisticsAggregation *)self formatString];
      [v11 setObject:v17 forKeyedSubscript:@"formatString"];
    }
    if ([(OSLogStatisticsAggregation *)self _childTier] <= v3)
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
      unint64_t v19 = [(OSLogStatisticsAggregation *)self _descendingChildren];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v28 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = [*(id *)(*((void *)&v27 + 1) + 8 * i) _dictRepresentation:v3];
            if (v24) {
              [v18 addObject:v24];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v21);
      }
      long long v25 = (void *)[v18 copy];
      [v11 setObject:v25 forKeyedSubscript:@"childAggregations"];
    }
    uint64_t v5 = (void *)[v11 copy];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)_descendingChildren
{
  v2 = [(OSLogStatisticsAggregation *)self labelToChildTiers];
  uint64_t v3 = [v2 allValues];
  uint64_t v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_1960];

  return v4;
}

uint64_t __49__OSLogStatisticsAggregation__descendingChildren__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 eventBytes];
  if (v6 <= [v5 eventBytes])
  {
    uint64_t v8 = [v4 eventBytes];
    uint64_t v7 = v8 != [v5 eventBytes];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (void)_addTraceEvent:(id)a3
{
  id v4 = a3;
  if ([(OSLogStatisticsAggregation *)self tier] >= 9)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  else
  {
    [(OSLogStatisticsAggregation *)self setEventCount:[(OSLogStatisticsAggregation *)self eventCount] + 1];
    -[OSLogStatisticsAggregation setEventBytes:](self, "setEventBytes:", -[OSLogStatisticsAggregation eventBytes](self, "eventBytes") + [v4 size]);
    if ([(OSLogStatisticsAggregation *)self tier] != 8) {
      [(OSLogStatisticsAggregation *)self _addToChildren:v4];
    }
  }
}

- (void)_addToChildren:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(OSLogStatisticsAggregation *)self _childTier];
  id v5 = [(id)objc_opt_class() _labelFromProxy:v12 forTier:v4];
  unint64_t v6 = [(OSLogStatisticsAggregation *)self labelToChildTiers];

  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    labelToChildTiers = self->_labelToChildTiers;
    self->_labelToChildTiers = v7;
  }
  uint64_t v9 = [(OSLogStatisticsAggregation *)self labelToChildTiers];
  uint64_t v10 = [v9 objectForKeyedSubscript:v5];

  if (!v10)
  {
    uint64_t v10 = [[OSLogStatisticsAggregation alloc] initWithOSLogProxy:v12 tier:v4];
    uint64_t v11 = [(OSLogStatisticsAggregation *)self labelToChildTiers];
    [v11 setObject:v10 forKeyedSubscript:v5];
  }
  [(OSLogStatisticsAggregation *)v10 _addTraceEvent:v12];
}

- (OSLogStatisticsAggregation)initWithOSLogProxy:(id)a3 tier:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() _labelFromProxy:v6 forTier:v4];
  uint64_t v8 = [(OSLogStatisticsAggregation *)self initWithLabel:v7 tier:v4];
  if (!v8) {
    goto LABEL_10;
  }
  switch(v4)
  {
    case 3:
      uint64_t v17 = [v6 processImageUUID];
LABEL_8:
      v14 = v17;
      uint64_t v18 = [v17 copy];
      senderUUID = v8->_senderUUID;
      v8->_senderUUID = (NSUUID *)v18;
      goto LABEL_9;
    case 4:
      uint64_t v17 = [v6 senderImageUUID];
      goto LABEL_8;
    case 8:
      uint64_t v9 = [v6 senderImageUUID];
      uint64_t v10 = [v9 copy];
      uint64_t v11 = v8->_senderUUID;
      v8->_senderUUID = (NSUUID *)v10;

      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "senderImageOffset"));
      senderOffset = v8->_senderOffset;
      v8->_senderOffset = (NSNumber *)v12;

      v14 = [v6 formatString];
      uint64_t v15 = [v14 copy];
      senderUUID = (NSUUID *)v8->_formatString;
      v8->_formatString = (NSString *)v15;
LABEL_9:

      break;
  }
LABEL_10:

  return v8;
}

- (OSLogStatisticsAggregation)initWithLabel:(id)a3 tier:(unsigned __int8)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OSLogStatisticsAggregation;
  uint64_t v8 = [(OSLogStatisticsAggregation *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_label, a3);
    v9->_tier = a4;
  }

  return v9;
}

- (NSString)tierString
{
  uint64_t v3 = objc_opt_class();
  uint64_t tier = self->_tier;
  return (NSString *)[v3 _stringForTier:tier];
}

- (unsigned)_childTier
{
  return self->_tier + 1;
}

+ (id)_labelFromProxy:(id)a3 forTier:(unsigned __int8)a4
{
  int v4 = a4;
  id v5 = a3;
  id v6 = v5;
  id v7 = 0;
  switch(v4)
  {
    case 0:
      goto LABEL_14;
    case 1:
      id v7 = @"All";
      goto LABEL_14;
    case 2:
      if ([v5 type] == 1536)
      {
        id v7 = @"os_signpost";
      }
      else if ([v6 type] == 1024)
      {
        id v7 = @"os_log";
      }
      else
      {
        id v7 = @"Unexpected";
      }
      goto LABEL_14;
    case 3:
      uint64_t v8 = [v5 process];
      goto LABEL_10;
    case 4:
      uint64_t v8 = [v5 sender];
      goto LABEL_10;
    case 5:
      uint64_t v8 = [v5 subsystem];
      goto LABEL_10;
    case 6:
      uint64_t v8 = [v5 category];
LABEL_10:
      uint64_t v9 = (void *)v8;
      uint64_t v10 = @"Unknown";
      if (v8) {
        uint64_t v10 = (__CFString *)v8;
      }
      id v7 = v10;
      goto LABEL_13;
    case 7:
      if ([v5 type] == 1536)
      {
        unint64_t v12 = [v6 signpostType];
        if (v12 <= 2)
        {
          id v7 = (__CFString *)*((void *)&off_1E5A42C90 + v12);
          goto LABEL_14;
        }
        goto LABEL_35;
      }
      if ([v6 type] != 1024)
      {
LABEL_35:
        id v7 = @"Unexpected";
        goto LABEL_14;
      }
      uint64_t v18 = [v6 logType];
      if (v18 <= 1)
      {
        if (v18)
        {
          if (v18 == 1)
          {
            id v7 = @"Info";
            goto LABEL_14;
          }
          goto LABEL_35;
        }
        id v7 = @"Default";
      }
      else
      {
        switch(v18)
        {
          case 2:
            id v7 = @"Debug";
            break;
          case 16:
            id v7 = @"Error";
            break;
          case 17:
            id v7 = @"Fault";
            break;
          default:
            goto LABEL_35;
        }
      }
LABEL_14:

      return v7;
    case 8:
      unint64_t v13 = [v5 senderImageUUID];
      uint64_t v9 = (void *)[v13 copy];

      if (v9)
      {
        v14 = NSString;
        uint64_t v15 = [v9 UUIDString];
        uint64_t v16 = [v6 senderImageOffset];
        uint64_t v17 = [v6 formatString];
        id v7 = [v14 stringWithFormat:@"%@ + %llu : %@", v15, v16, v17];
      }
      else
      {
        id v7 = @"<Unknown>";
      }
LABEL_13:

      goto LABEL_14;
    default:
      id v7 = &stru_1EF440710;
      goto LABEL_14;
  }
}

+ (id)_stringForTier:(unsigned __int8)a3
{
  if (a3 > 8u) {
    return @"Unexpected";
  }
  else {
    return (id)*((void *)&off_1E5A42C48 + a3);
  }
}

@end