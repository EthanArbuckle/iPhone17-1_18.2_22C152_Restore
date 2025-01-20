@interface _INPBPlace
+ (BOOL)supportsSecureCoding;
+ (Class)placeDescriptorsType;
- (BOOL)hasPersonalPlaceType;
- (BOOL)hasPlaceSubType;
- (BOOL)hasPlaceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)placeDescriptors;
- (_INPBPlace)initWithCoder:(id)a3;
- (_INPBString)placeSubType;
- (_INPBString)placeType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)personalPlaceTypeAsString:(int)a3;
- (id)placeDescriptorsAtIndex:(unint64_t)a3;
- (int)StringAsPersonalPlaceType:(id)a3;
- (int)personalPlaceType;
- (unint64_t)hash;
- (unint64_t)placeDescriptorsCount;
- (void)addPlaceDescriptors:(id)a3;
- (void)clearPlaceDescriptors;
- (void)encodeWithCoder:(id)a3;
- (void)setHasPersonalPlaceType:(BOOL)a3;
- (void)setPersonalPlaceType:(int)a3;
- (void)setPlaceDescriptors:(id)a3;
- (void)setPlaceSubType:(id)a3;
- (void)setPlaceType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPlace

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeType, 0);
  objc_storeStrong((id *)&self->_placeSubType, 0);

  objc_storeStrong((id *)&self->_placeDescriptors, 0);
}

- (_INPBString)placeType
{
  return self->_placeType;
}

- (_INPBString)placeSubType
{
  return self->_placeSubType;
}

- (NSArray)placeDescriptors
{
  return self->_placeDescriptors;
}

- (int)personalPlaceType
{
  return self->_personalPlaceType;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBPlace *)self hasPersonalPlaceType])
  {
    uint64_t v4 = [(_INPBPlace *)self personalPlaceType];
    if (v4 == 2)
    {
      v5 = @"HOME";
    }
    else if (v4 == 3)
    {
      v5 = @"WORK";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKeyedSubscript:@"personalPlaceType"];
  }
  if ([(NSArray *)self->_placeDescriptors count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v7 = self->_placeDescriptors;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"placeDescriptors"];
  }
  v13 = [(_INPBPlace *)self placeSubType];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"placeSubType"];

  v15 = [(_INPBPlace *)self placeType];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"placeType"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBPlace *)self hasPersonalPlaceType]) {
    uint64_t v3 = 2654435761 * self->_personalPlaceType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_placeDescriptors hash] ^ v3;
  unint64_t v5 = [(_INPBString *)self->_placeSubType hash];
  return v4 ^ v5 ^ [(_INPBString *)self->_placeType hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  int v5 = [(_INPBPlace *)self hasPersonalPlaceType];
  if (v5 != [v4 hasPersonalPlaceType]) {
    goto LABEL_21;
  }
  if ([(_INPBPlace *)self hasPersonalPlaceType])
  {
    if ([v4 hasPersonalPlaceType])
    {
      int personalPlaceType = self->_personalPlaceType;
      if (personalPlaceType != [v4 personalPlaceType]) {
        goto LABEL_21;
      }
    }
  }
  v7 = [(_INPBPlace *)self placeDescriptors];
  uint64_t v8 = [v4 placeDescriptors];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v9 = [(_INPBPlace *)self placeDescriptors];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    v11 = [(_INPBPlace *)self placeDescriptors];
    v12 = [v4 placeDescriptors];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v7 = [(_INPBPlace *)self placeSubType];
  uint64_t v8 = [v4 placeSubType];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v14 = [(_INPBPlace *)self placeSubType];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBPlace *)self placeSubType];
    v17 = [v4 placeSubType];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v7 = [(_INPBPlace *)self placeType];
  uint64_t v8 = [v4 placeType];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v19 = [(_INPBPlace *)self placeType];
    if (!v19)
    {

LABEL_24:
      BOOL v24 = 1;
      goto LABEL_22;
    }
    long long v20 = (void *)v19;
    long long v21 = [(_INPBPlace *)self placeType];
    v22 = [v4 placeType];
    char v23 = [v21 isEqual:v22];

    if (v23) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_20:
  }
LABEL_21:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBPlace allocWithZone:](_INPBPlace, "allocWithZone:") init];
  if ([(_INPBPlace *)self hasPersonalPlaceType]) {
    [(_INPBPlace *)v5 setPersonalPlaceType:[(_INPBPlace *)self personalPlaceType]];
  }
  v6 = (void *)[(NSArray *)self->_placeDescriptors copyWithZone:a3];
  [(_INPBPlace *)v5 setPlaceDescriptors:v6];

  id v7 = [(_INPBString *)self->_placeSubType copyWithZone:a3];
  [(_INPBPlace *)v5 setPlaceSubType:v7];

  id v8 = [(_INPBString *)self->_placeType copyWithZone:a3];
  [(_INPBPlace *)v5 setPlaceType:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPlace *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPlace)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPlace *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPlace *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPlace *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBPlace *)self hasPersonalPlaceType]) {
    PBDataWriterWriteInt32Field();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v5 = self->_placeDescriptors;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(_INPBPlace *)self placeSubType];

  if (v10)
  {
    v11 = [(_INPBPlace *)self placeSubType];
    PBDataWriterWriteSubmessage();
  }
  v12 = [(_INPBPlace *)self placeType];

  if (v12)
  {
    int v13 = [(_INPBPlace *)self placeType];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPlaceReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasPlaceType
{
  return self->_placeType != 0;
}

- (void)setPlaceType:(id)a3
{
}

- (BOOL)hasPlaceSubType
{
  return self->_placeSubType != 0;
}

- (void)setPlaceSubType:(id)a3
{
}

- (id)placeDescriptorsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_placeDescriptors objectAtIndexedSubscript:a3];
}

- (unint64_t)placeDescriptorsCount
{
  return [(NSArray *)self->_placeDescriptors count];
}

- (void)addPlaceDescriptors:(id)a3
{
  id v4 = a3;
  placeDescriptors = self->_placeDescriptors;
  id v8 = v4;
  if (!placeDescriptors)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_placeDescriptors;
    self->_placeDescriptors = v6;

    id v4 = v8;
    placeDescriptors = self->_placeDescriptors;
  }
  [(NSArray *)placeDescriptors addObject:v4];
}

- (void)clearPlaceDescriptors
{
}

- (void)setPlaceDescriptors:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  placeDescriptors = self->_placeDescriptors;
  self->_placeDescriptors = v4;

  MEMORY[0x1F41817F8](v4, placeDescriptors);
}

- (int)StringAsPersonalPlaceType:(id)a3
{
  id v3 = a3;
  int v4 = 2;
  if (([v3 isEqualToString:@"HOME"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"WORK"]) {
      int v4 = 3;
    }
    else {
      int v4 = 2;
    }
  }

  return v4;
}

- (id)personalPlaceTypeAsString:(int)a3
{
  if (a3 == 2)
  {
    int v4 = @"HOME";
  }
  else if (a3 == 3)
  {
    int v4 = @"WORK";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasPersonalPlaceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPersonalPlaceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPersonalPlaceType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int personalPlaceType = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)placeDescriptorsType
{
  return (Class)objc_opt_class();
}

@end