@interface AVDateRangeMetadataGroup
+ (id)_figMetadataArrayForMetadataItems:(id)a3;
+ (id)_metadataItemsForFigMetadataArray:(id)a3;
- (AVDateRangeMetadataGroup)init;
- (AVDateRangeMetadataGroup)initWithItems:(NSArray *)items startDate:(NSDate *)startDate endDate:(NSDate *)endDate;
- (AVDateRangeMetadataGroup)initWithPropertyList:(id)a3;
- (AVDateRangeMetadataGroupInternal)_dateRangeMetadataGroupInternal;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (NSDate)discoveryTimestamp;
- (NSDate)endDate;
- (NSDate)modificationTimestamp;
- (NSDate)startDate;
- (NSString)cueingOptions;
- (id)_initWithTaggedRangeMetadataDictionary:(id)a3 items:(id)a4;
- (id)_taggedRangeMetadataDictionary;
- (id)classifyingLabel;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)uniqueID;
- (unint64_t)hash;
- (void)_extractPropertiesFromTaggedRangeMetadataDictionary:(id)a3;
- (void)dealloc;
@end

@implementation AVDateRangeMetadataGroup

- (AVDateRangeMetadataGroup)init
{
  uint64_t v3 = [MEMORY[0x1E4F1C978] array];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  return [(AVDateRangeMetadataGroup *)self initWithItems:v3 startDate:v4 endDate:0];
}

- (AVDateRangeMetadataGroup)initWithItems:(NSArray *)items startDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  v11.receiver = self;
  v11.super_class = (Class)AVDateRangeMetadataGroup;
  v8 = [(AVDateRangeMetadataGroup *)&v11 init];
  if (v8)
  {
    v9 = objc_alloc_init(AVDateRangeMetadataGroupInternal);
    v8->_priv = v9;
    if (v9)
    {
      CFRetain(v9);
      v8->_priv->metadataItems = (NSArray *)[(NSArray *)items copy];
      v8->_priv->startDate = (NSDate *)[(NSDate *)startDate copy];
      v8->_priv->endDate = (NSDate *)[(NSDate *)endDate copy];
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {

    CFRelease(self->_priv);
    priv = self->_priv;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVDateRangeMetadataGroup;
  [(AVDateRangeMetadataGroup *)&v4 dealloc];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[AVMutableDateRangeMetadataGroup allocWithZone:a3];
  id v5 = [(AVDateRangeMetadataGroup *)self _taggedRangeMetadataDictionary];
  v6 = [(AVDateRangeMetadataGroup *)self items];
  return [(AVMutableDateRangeMetadataGroup *)v4 _initWithTaggedRangeMetadataDictionary:v5 items:v6];
}

- (id)description
{
  uint64_t v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, startDate=%@, endDate=%@ classifyingLabel=%@ uniqueID=%@ items=%@>", NSStringFromClass(v4), self, -[AVDateRangeMetadataGroup startDate](self, "startDate"), -[AVDateRangeMetadataGroup endDate](self, "endDate"), -[AVDateRangeMetadataGroup classifyingLabel](self, "classifyingLabel"), -[AVDateRangeMetadataGroup uniqueID](self, "uniqueID"), -[AVDateRangeMetadataGroup items](self, "items")];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_19;
  }
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v15) = 0;
    return v15;
  }
  id v5 = [(AVDateRangeMetadataGroup *)self startDate];
  uint64_t v6 = [a3 startDate];
  v7 = [(AVDateRangeMetadataGroup *)self endDate];
  uint64_t v8 = [a3 endDate];
  v9 = [(AVDateRangeMetadataGroup *)self items];
  uint64_t v10 = [a3 items];
  id v11 = [(AVDateRangeMetadataGroup *)self classifyingLabel];
  uint64_t v12 = [a3 classifyingLabel];
  id v18 = [(AVDateRangeMetadataGroup *)self uniqueID];
  uint64_t v17 = [a3 uniqueID];
  v13 = [(AVDateRangeMetadataGroup *)self cueingOptions];
  uint64_t v14 = [a3 cueingOptions];
  if ((v5 == (NSDate *)v6 || (int v15 = [(NSDate *)v5 isEqual:v6]) != 0)
    && (v7 == (NSDate *)v8 || (int v15 = [(NSDate *)v7 isEqual:v8]) != 0)
    && (v9 == (NSArray *)v10 || (int v15 = [(NSArray *)v9 isEqual:v10]) != 0)
    && (v11 == (id)v12 || (int v15 = [v11 isEqual:v12]) != 0)
    && (v18 == (id)v17 || (int v15 = objc_msgSend(v18, "isEqual:")) != 0))
  {
    if (v13 != (NSString *)v14)
    {
      LOBYTE(v15) = [(NSString *)v13 isEqual:v14];
      return v15;
    }
LABEL_19:
    LOBYTE(v15) = 1;
  }
  return v15;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)[(AVDateRangeMetadataGroup *)self startDate] hash];
  uint64_t v4 = [(NSDate *)[(AVDateRangeMetadataGroup *)self endDate] hash] ^ v3;
  uint64_t v5 = [(NSArray *)[(AVDateRangeMetadataGroup *)self items] hash];
  uint64_t v6 = v4 ^ v5 ^ objc_msgSend(-[AVDateRangeMetadataGroup classifyingLabel](self, "classifyingLabel"), "hash");
  return v6 ^ objc_msgSend(-[AVDateRangeMetadataGroup uniqueID](self, "uniqueID"), "hash");
}

- (NSDate)startDate
{
  return self->_priv->startDate;
}

- (NSDate)endDate
{
  return self->_priv->endDate;
}

- (NSArray)items
{
  return self->_priv->metadataItems;
}

- (id)classifyingLabel
{
  return self->_priv->classifyingLabel;
}

- (id)uniqueID
{
  return self->_priv->uniqueID;
}

- (AVDateRangeMetadataGroup)initWithPropertyList:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = self;
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v8, v9, v10, v11, v12, (uint64_t)"[propertyList isKindOfClass:[NSDictionary class]]"), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  return (AVDateRangeMetadataGroup *)[(AVDateRangeMetadataGroup *)self _initWithTaggedRangeMetadataDictionary:a3 items:0];
}

- (NSString)cueingOptions
{
  return self->_priv->cueingOptions;
}

- (id)_initWithTaggedRangeMetadataDictionary:(id)a3 items:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVDateRangeMetadataGroup;
  uint64_t v6 = [(AVDateRangeMetadataGroup *)&v9 init];
  if (v6)
  {
    v7 = objc_alloc_init(AVDateRangeMetadataGroupInternal);
    v6->_priv = v7;
    if (v7)
    {
      CFRetain(v7);
      if (a4) {
        v6->_priv->metadataItems = (NSArray *)[a4 copy];
      }
      [(AVDateRangeMetadataGroup *)v6 _extractPropertiesFromTaggedRangeMetadataDictionary:a3];
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (NSDate)discoveryTimestamp
{
  return self->_priv->discoveryTimestamp;
}

- (NSDate)modificationTimestamp
{
  return self->_priv->modificationTimestamp;
}

- (AVDateRangeMetadataGroupInternal)_dateRangeMetadataGroupInternal
{
  return self->_priv;
}

+ (id)_figMetadataArrayForMetadataItems:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (a3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "_figMetadataDictionary"));
        }
        while (v6 != v8);
        uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  return (id)[v4 copy];
}

+ (id)_metadataItemsForFigMetadataArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (a3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(v4, "addObject:", +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", *(void *)(*((void *)&v10 + 1) + 8 * v8++)));
        }
        while (v6 != v8);
        uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  return (id)[v4 copy];
}

- (id)_taggedRangeMetadataDictionary
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ([(AVDateRangeMetadataGroup *)self startDate])
  {
    uint64_t v4 = [(AVDateRangeMetadataGroup *)self startDate];
    [v3 setObject:v4 forKey:*MEMORY[0x1E4F33D58]];
  }
  if ([(AVDateRangeMetadataGroup *)self endDate])
  {
    uint64_t v5 = [(AVDateRangeMetadataGroup *)self endDate];
    [v3 setObject:v5 forKey:*MEMORY[0x1E4F33D38]];
  }
  if ([(AVDateRangeMetadataGroup *)self items])
  {
    id v6 = +[AVDateRangeMetadataGroup _figMetadataArrayForMetadataItems:[(AVDateRangeMetadataGroup *)self items]];
    [v3 setObject:v6 forKey:*MEMORY[0x1E4F33D48]];
  }
  if ([(AVDateRangeMetadataGroup *)self classifyingLabel])
  {
    id v7 = [(AVDateRangeMetadataGroup *)self classifyingLabel];
    [v3 setObject:v7 forKey:*MEMORY[0x1E4F33D18]];
  }
  if ([(AVDateRangeMetadataGroup *)self uniqueID])
  {
    id v8 = [(AVDateRangeMetadataGroup *)self uniqueID];
    [v3 setObject:v8 forKey:*MEMORY[0x1E4F33D40]];
  }
  if ([(AVDateRangeMetadataGroup *)self cueingOptions])
  {
    objc_super v9 = [(AVDateRangeMetadataGroup *)self cueingOptions];
    [v3 setObject:v9 forKey:*MEMORY[0x1E4F33D20]];
  }
  if ([(AVDateRangeMetadataGroup *)self discoveryTimestamp])
  {
    long long v10 = [(AVDateRangeMetadataGroup *)self discoveryTimestamp];
    [v3 setObject:v10 forKey:*MEMORY[0x1E4F33D28]];
  }
  if ([(AVDateRangeMetadataGroup *)self modificationTimestamp])
  {
    long long v11 = [(AVDateRangeMetadataGroup *)self modificationTimestamp];
    [v3 setObject:v11 forKey:*MEMORY[0x1E4F33D50]];
  }
  if (self->_priv->extraFigProperties) {
    objc_msgSend(v3, "addEntriesFromDictionary:");
  }
  long long v12 = (void *)MEMORY[0x1E4F1C9E8];
  return (id)[v12 dictionaryWithDictionary:v3];
}

- (void)_extractPropertiesFromTaggedRangeMetadataDictionary:(id)a3
{
  if (!a3 || self->_priv->extraFigProperties) {
    return;
  }
  uint64_t v29 = *MEMORY[0x1E4F33D58];
  uint64_t v5 = objc_msgSend(a3, "objectForKey:");
  uint64_t v28 = *MEMORY[0x1E4F33D38];
  v21 = objc_msgSend(a3, "objectForKey:");
  uint64_t v27 = *MEMORY[0x1E4F33D30];
  uint64_t v6 = objc_msgSend(a3, "objectForKey:");
  uint64_t v26 = *MEMORY[0x1E4F33D48];
  uint64_t v7 = objc_msgSend(a3, "objectForKey:");
  uint64_t v25 = *MEMORY[0x1E4F33D18];
  id v8 = objc_msgSend(a3, "objectForKey:");
  uint64_t v24 = *MEMORY[0x1E4F33D40];
  objc_super v9 = objc_msgSend(a3, "objectForKey:");
  uint64_t v30 = [a3 objectForKey:*MEMORY[0x1E4F33D20]];
  uint64_t v23 = *MEMORY[0x1E4F33D28];
  uint64_t v10 = objc_msgSend(a3, "objectForKey:");
  uint64_t v22 = *MEMORY[0x1E4F33D50];
  uint64_t v31 = objc_msgSend(a3, "objectForKey:");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      uint64_t v5 = 0;
    }
  }
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v11 = (void *)v6;
    }
    else {
      long long v11 = 0;
    }
  }
  else
  {
    long long v11 = 0;
  }
  v19 = v11;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v7;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v20 = v12;
  }
  else
  {
    uint64_t v20 = 0;
  }
  long long v13 = (void *)v10;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v8 = 0;
    }
  }
  uint64_t v14 = (void *)v30;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      objc_super v9 = 0;
    }
  }
  if (v30)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      uint64_t v14 = 0;
    }
  }
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      long long v13 = 0;
    }
  }
  if (v31)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = (void *)v31;
    }
    else {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  self->_priv->startDate = (NSDate *)[v5 copy];
  if (v21)
  {
    v16 = (NSDate *)[v21 copy];
LABEL_39:
    self->_priv->endDate = v16;
    goto LABEL_40;
  }
  startDate = self->_priv->startDate;
  if (startDate && v19)
  {
    [v19 doubleValue];
    v16 = -[NSDate dateByAddingTimeInterval:](startDate, "dateByAddingTimeInterval:");
    goto LABEL_39;
  }
LABEL_40:
  if (!self->_priv->metadataItems) {
    self->_priv->metadataItems = (NSArray *)+[AVDateRangeMetadataGroup _metadataItemsForFigMetadataArray:v20];
  }
  self->_priv->classifyingLabel = (NSString *)[v8 copy];
  self->_priv->uniqueID = (NSString *)[v9 copy];
  self->_priv->cueingOptions = (NSString *)[v14 copy];
  self->_priv->discoveryTimestamp = (NSDate *)[v13 copy];
  self->_priv->modificationTimestamp = (NSDate *)[v15 copy];
  id v18 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
  [v18 removeObjectForKey:v29];
  [v18 removeObjectForKey:v28];
  [v18 removeObjectForKey:v27];
  [v18 removeObjectForKey:v26];
  [v18 removeObjectForKey:v25];
  [v18 removeObjectForKey:v24];
  [v18 removeObjectForKey:v23];
  [v18 removeObjectForKey:v22];
  self->_priv->extraFigProperties = (NSDictionary *)[v18 copy];
}

@end