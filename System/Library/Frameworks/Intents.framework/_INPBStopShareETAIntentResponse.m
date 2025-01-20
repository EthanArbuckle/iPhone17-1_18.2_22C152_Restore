@interface _INPBStopShareETAIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)recipientType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)recipients;
- (_INPBStopShareETAIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)mediumsAsString:(int)a3;
- (id)recipientAtIndex:(unint64_t)a3;
- (int)StringAsMediums:(id)a3;
- (int)mediumAtIndex:(unint64_t)a3;
- (int)mediums;
- (unint64_t)hash;
- (unint64_t)mediumsCount;
- (unint64_t)recipientsCount;
- (void)addMedium:(int)a3;
- (void)addRecipient:(id)a3;
- (void)clearMediums;
- (void)clearRecipients;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMediums:(int *)a3 count:(unint64_t)a4;
- (void)setRecipients:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBStopShareETAIntentResponse

- (void).cxx_destruct
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_mediums.count)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBStopShareETAIntentResponse mediumsCount](self, "mediumsCount"));
    if ([(_INPBStopShareETAIntentResponse *)self mediumsCount])
    {
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = self->_mediums.list[v5];
        if (v6 >= 4)
        {
          v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mediums.list[v5]);
        }
        else
        {
          v7 = *(&off_1E551FF90 + v6);
        }
        [v4 addObject:v7];

        ++v5;
      }
      while (v5 < [(_INPBStopShareETAIntentResponse *)self mediumsCount]);
    }
    [v3 setObject:v4 forKeyedSubscript:@"medium"];
  }
  if ([(NSArray *)self->_recipients count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = self->_recipients;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"recipient"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedInt32Hash();
  return [(NSArray *)self->_recipients hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && PBRepeatedInt32IsEqual())
  {
    unint64_t v5 = [(_INPBStopShareETAIntentResponse *)self recipients];
    uint64_t v6 = [v4 recipients];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBStopShareETAIntentResponse *)self recipients];
      if (!v8)
      {

LABEL_11:
        BOOL v13 = 1;
        goto LABEL_9;
      }
      v9 = (void *)v8;
      uint64_t v10 = [(_INPBStopShareETAIntentResponse *)self recipients];
      uint64_t v11 = [v4 recipients];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_9:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBStopShareETAIntentResponse allocWithZone:](_INPBStopShareETAIntentResponse, "allocWithZone:") init];
  PBRepeatedInt32Copy();
  uint64_t v6 = (void *)[(NSArray *)self->_recipients copyWithZone:a3];
  [(_INPBStopShareETAIntentResponse *)v5 setRecipients:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBStopShareETAIntentResponse *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBStopShareETAIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBStopShareETAIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBStopShareETAIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBStopShareETAIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBStopShareETAIntentResponse *)self clearMediums];
  v3.receiver = self;
  v3.super_class = (Class)_INPBStopShareETAIntentResponse;
  [(_INPBStopShareETAIntentResponse *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_mediums.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_mediums.count);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_recipients;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStopShareETAIntentResponseReadFrom(self, (uint64_t)a3);
}

- (id)recipientAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_recipients objectAtIndexedSubscript:a3];
}

- (unint64_t)recipientsCount
{
  return [(NSArray *)self->_recipients count];
}

- (void)addRecipient:(id)a3
{
  id v4 = a3;
  recipients = self->_recipients;
  id v8 = v4;
  if (!recipients)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_recipients;
    self->_recipients = v6;

    id v4 = v8;
    recipients = self->_recipients;
  }
  [(NSArray *)recipients addObject:v4];
}

- (void)clearRecipients
{
}

- (void)setRecipients:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  recipients = self->_recipients;
  self->_recipients = v4;

  MEMORY[0x1F41817F8](v4, recipients);
}

- (int)StringAsMediums:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IDS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IMESSAGE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SMS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)mediumsAsString:(int)a3
{
  if (a3 >= 4)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551FF90 + a3);
  }

  return v3;
}

- (int)mediumAtIndex:(unint64_t)a3
{
  return self->_mediums.list[a3];
}

- (unint64_t)mediumsCount
{
  return self->_mediums.count;
}

- (void)addMedium:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearMediums
{
}

- (int)mediums
{
  return self->_mediums.list;
}

- (void)setMediums:(int *)a3 count:(unint64_t)a4
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)recipientType
{
  return (Class)objc_opt_class();
}

@end