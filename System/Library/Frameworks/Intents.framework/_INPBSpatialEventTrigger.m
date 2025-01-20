@interface _INPBSpatialEventTrigger
+ (BOOL)supportsSecureCoding;
+ (Class)suggestedValuesType;
- (BOOL)hasEvent;
- (BOOL)hasLocation;
- (BOOL)hasMobileSpace;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)suggestedValues;
- (_INPBLocationValue)location;
- (_INPBSpatialEventTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)eventAsString:(int)a3;
- (id)mobileSpaceAsString:(int)a3;
- (id)suggestedValuesAtIndex:(unint64_t)a3;
- (int)StringAsEvent:(id)a3;
- (int)StringAsMobileSpace:(id)a3;
- (int)event;
- (int)mobileSpace;
- (unint64_t)hash;
- (unint64_t)suggestedValuesCount;
- (void)addSuggestedValues:(id)a3;
- (void)clearSuggestedValues;
- (void)encodeWithCoder:(id)a3;
- (void)setEvent:(int)a3;
- (void)setHasEvent:(BOOL)a3;
- (void)setHasMobileSpace:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMobileSpace:(int)a3;
- (void)setSuggestedValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSpatialEventTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedValues, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (NSArray)suggestedValues
{
  return self->_suggestedValues;
}

- (int)mobileSpace
{
  return self->_mobileSpace;
}

- (_INPBLocationValue)location
{
  return self->_location;
}

- (int)event
{
  return self->_event;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBSpatialEventTrigger *)self hasEvent])
  {
    uint64_t v4 = [(_INPBSpatialEventTrigger *)self event];
    if (v4)
    {
      if (v4 == 20)
      {
        v5 = @"DEPART";
      }
      else if (v4 == 10)
      {
        v5 = @"ARRIVE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"UNKNOWN_SPATIAL_EVENT";
    }
    [v3 setObject:v5 forKeyedSubscript:@"event"];
  }
  v6 = [(_INPBSpatialEventTrigger *)self location];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"location"];

  if ([(_INPBSpatialEventTrigger *)self hasMobileSpace])
  {
    uint64_t v8 = [(_INPBSpatialEventTrigger *)self mobileSpace];
    if (v8)
    {
      if (v8 == 1)
      {
        v9 = @"CAR";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = @"UNKNOWN_MOBILE_SPACE";
    }
    [v3 setObject:v9 forKeyedSubscript:@"mobileSpace"];
  }
  if ([(NSArray *)self->_suggestedValues count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = self->_suggestedValues;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"suggestedValues"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBSpatialEventTrigger *)self hasEvent]) {
    uint64_t v3 = 2654435761 * self->_event;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBLocationValue *)self->_location hash];
  if ([(_INPBSpatialEventTrigger *)self hasMobileSpace]) {
    uint64_t v5 = 2654435761 * self->_mobileSpace;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSArray *)self->_suggestedValues hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  int v5 = [(_INPBSpatialEventTrigger *)self hasEvent];
  if (v5 != [v4 hasEvent]) {
    goto LABEL_20;
  }
  if ([(_INPBSpatialEventTrigger *)self hasEvent])
  {
    if ([v4 hasEvent])
    {
      int event = self->_event;
      if (event != [v4 event]) {
        goto LABEL_20;
      }
    }
  }
  v7 = [(_INPBSpatialEventTrigger *)self location];
  uint64_t v8 = [v4 location];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_19;
  }
  uint64_t v9 = [(_INPBSpatialEventTrigger *)self location];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBSpatialEventTrigger *)self location];
    uint64_t v12 = [v4 location];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  int v14 = [(_INPBSpatialEventTrigger *)self hasMobileSpace];
  if (v14 != [v4 hasMobileSpace]) {
    goto LABEL_20;
  }
  if ([(_INPBSpatialEventTrigger *)self hasMobileSpace])
  {
    if ([v4 hasMobileSpace])
    {
      int mobileSpace = self->_mobileSpace;
      if (mobileSpace != [v4 mobileSpace]) {
        goto LABEL_20;
      }
    }
  }
  v7 = [(_INPBSpatialEventTrigger *)self suggestedValues];
  uint64_t v8 = [v4 suggestedValues];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v16 = [(_INPBSpatialEventTrigger *)self suggestedValues];
    if (!v16)
    {

LABEL_23:
      BOOL v21 = 1;
      goto LABEL_21;
    }
    v17 = (void *)v16;
    long long v18 = [(_INPBSpatialEventTrigger *)self suggestedValues];
    long long v19 = [v4 suggestedValues];
    char v20 = [v18 isEqual:v19];

    if (v20) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v21 = 0;
LABEL_21:

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBSpatialEventTrigger allocWithZone:](_INPBSpatialEventTrigger, "allocWithZone:") init];
  if ([(_INPBSpatialEventTrigger *)self hasEvent]) {
    [(_INPBSpatialEventTrigger *)v5 setEvent:[(_INPBSpatialEventTrigger *)self event]];
  }
  id v6 = [(_INPBLocationValue *)self->_location copyWithZone:a3];
  [(_INPBSpatialEventTrigger *)v5 setLocation:v6];

  if ([(_INPBSpatialEventTrigger *)self hasMobileSpace]) {
    [(_INPBSpatialEventTrigger *)v5 setMobileSpace:[(_INPBSpatialEventTrigger *)self mobileSpace]];
  }
  v7 = (void *)[(NSArray *)self->_suggestedValues copyWithZone:a3];
  [(_INPBSpatialEventTrigger *)v5 setSuggestedValues:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSpatialEventTrigger *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSpatialEventTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSpatialEventTrigger *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSpatialEventTrigger *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSpatialEventTrigger *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBSpatialEventTrigger *)self hasEvent]) {
    PBDataWriterWriteInt32Field();
  }
  int v5 = [(_INPBSpatialEventTrigger *)self location];

  if (v5)
  {
    id v6 = [(_INPBSpatialEventTrigger *)self location];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSpatialEventTrigger *)self hasMobileSpace]) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_suggestedValues;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSpatialEventTriggerReadFrom(self, (uint64_t)a3);
}

- (id)suggestedValuesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_suggestedValues objectAtIndexedSubscript:a3];
}

- (unint64_t)suggestedValuesCount
{
  return [(NSArray *)self->_suggestedValues count];
}

- (void)addSuggestedValues:(id)a3
{
  id v4 = a3;
  suggestedValues = self->_suggestedValues;
  id v8 = v4;
  if (!suggestedValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_suggestedValues;
    self->_suggestedValues = v6;

    id v4 = v8;
    suggestedValues = self->_suggestedValues;
  }
  [(NSArray *)suggestedValues addObject:v4];
}

- (void)clearSuggestedValues
{
}

- (void)setSuggestedValues:(id)a3
{
  self->_suggestedValues = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (int)StringAsMobileSpace:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MOBILE_SPACE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"CAR"];
  }

  return v4;
}

- (id)mobileSpaceAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"CAR";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN_MOBILE_SPACE";
  }
  return v4;
}

- (void)setHasMobileSpace:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMobileSpace
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMobileSpace:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int mobileSpace = a3;
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setLocation:(id)a3
{
}

- (int)StringAsEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SPATIAL_EVENT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ARRIVE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"DEPART"])
  {
    int v4 = 20;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)eventAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 20)
    {
      int v4 = @"DEPART";
    }
    else if (a3 == 10)
    {
      int v4 = @"ARRIVE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN_SPATIAL_EVENT";
  }
  return v4;
}

- (void)setHasEvent:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEvent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEvent:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int event = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)suggestedValuesType
{
  return (Class)objc_opt_class();
}

@end