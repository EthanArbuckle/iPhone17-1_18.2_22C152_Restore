@interface _INPBReportIncidentIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)supportedTypeType;
- (BOOL)hasLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)supportedTypes;
- (_INPBLocation)location;
- (_INPBReportIncidentIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)supportedTypeAtIndex:(unint64_t)a3;
- (id)transportTypesAsString:(int)a3;
- (int)StringAsTransportTypes:(id)a3;
- (int)transportTypeAtIndex:(unint64_t)a3;
- (int)transportTypes;
- (unint64_t)hash;
- (unint64_t)supportedTypesCount;
- (unint64_t)transportTypesCount;
- (void)addSupportedType:(id)a3;
- (void)addTransportType:(int)a3;
- (void)clearSupportedTypes;
- (void)clearTransportTypes;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLocation:(id)a3;
- (void)setSupportedTypes:(id)a3;
- (void)setTransportTypes:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation _INPBReportIncidentIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTypes, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (NSArray)supportedTypes
{
  return self->_supportedTypes;
}

- (_INPBLocation)location
{
  return self->_location;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBReportIncidentIntentResponse *)self location];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"location"];

  if ([(NSArray *)self->_supportedTypes count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v7 = self->_supportedTypes;
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

    [v3 setObject:v6 forKeyedSubscript:@"supportedType"];
  }
  if (self->_transportTypes.count)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBReportIncidentIntentResponse transportTypesCount](self, "transportTypesCount"));
    if ([(_INPBReportIncidentIntentResponse *)self transportTypesCount])
    {
      unint64_t v14 = 0;
      do
      {
        uint64_t v15 = self->_transportTypes.list[v14];
        if (v15 >= 6)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_transportTypes.list[v14]);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_1E5520CB8[v15];
        }
        [v13 addObject:v16];

        ++v14;
      }
      while (v14 < [(_INPBReportIncidentIntentResponse *)self transportTypesCount]);
    }
    [v3 setObject:v13 forKeyedSubscript:@"transportType"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBLocation *)self->_location hash];
  uint64_t v4 = [(NSArray *)self->_supportedTypes hash] ^ v3;
  return v4 ^ PBRepeatedInt32Hash();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBReportIncidentIntentResponse *)self location];
  v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBReportIncidentIntentResponse *)self location];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBReportIncidentIntentResponse *)self location];
    uint64_t v10 = [v4 location];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBReportIncidentIntentResponse *)self supportedTypes];
  v6 = [v4 supportedTypes];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBReportIncidentIntentResponse *)self supportedTypes];
    if (!v12)
    {

LABEL_15:
      char IsEqual = PBRepeatedInt32IsEqual();
      goto LABEL_13;
    }
    v13 = (void *)v12;
    unint64_t v14 = [(_INPBReportIncidentIntentResponse *)self supportedTypes];
    uint64_t v15 = [v4 supportedTypes];
    int v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  char IsEqual = 0;
LABEL_13:

  return IsEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBReportIncidentIntentResponse allocWithZone:](_INPBReportIncidentIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBLocation *)self->_location copyWithZone:a3];
  [(_INPBReportIncidentIntentResponse *)v5 setLocation:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_supportedTypes copyWithZone:a3];
  [(_INPBReportIncidentIntentResponse *)v5 setSupportedTypes:v7];

  PBRepeatedInt32Copy();
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBReportIncidentIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBReportIncidentIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBReportIncidentIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBReportIncidentIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBReportIncidentIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBReportIncidentIntentResponse *)self clearTransportTypes];
  v3.receiver = self;
  v3.super_class = (Class)_INPBReportIncidentIntentResponse;
  [(_INPBReportIncidentIntentResponse *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBReportIncidentIntentResponse *)self location];

  if (v5)
  {
    id v6 = [(_INPBReportIncidentIntentResponse *)self location];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_supportedTypes;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  p_transportTypes = &self->_transportTypes;
  if (p_transportTypes->count)
  {
    unint64_t v13 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v13;
    }
    while (v13 < p_transportTypes->count);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBReportIncidentIntentResponseReadFrom(self, (uint64_t)a3);
}

- (int)StringAsTransportTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DRIVING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CYCLING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)transportTypesAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5520CB8[a3];
  }

  return v3;
}

- (int)transportTypeAtIndex:(unint64_t)a3
{
  return self->_transportTypes.list[a3];
}

- (unint64_t)transportTypesCount
{
  return self->_transportTypes.count;
}

- (void)addTransportType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearTransportTypes
{
}

- (int)transportTypes
{
  return self->_transportTypes.list;
}

- (void)setTransportTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)supportedTypeAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_supportedTypes objectAtIndexedSubscript:a3];
}

- (unint64_t)supportedTypesCount
{
  return [(NSArray *)self->_supportedTypes count];
}

- (void)addSupportedType:(id)a3
{
  id v4 = a3;
  supportedTypes = self->_supportedTypes;
  id v8 = v4;
  if (!supportedTypes)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_supportedTypes;
    self->_supportedTypes = v6;

    id v4 = v8;
    supportedTypes = self->_supportedTypes;
  }
  [(NSArray *)supportedTypes addObject:v4];
}

- (void)clearSupportedTypes
{
}

- (void)setSupportedTypes:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  supportedTypes = self->_supportedTypes;
  self->_supportedTypes = v4;

  MEMORY[0x1F41817F8](v4, supportedTypes);
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setLocation:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)supportedTypeType
{
  return (Class)objc_opt_class();
}

@end