@interface _INPBFileProperty
+ (BOOL)supportsSecureCoding;
- (BOOL)hasName;
- (BOOL)hasQualifier;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBFileProperty)initWithCoder:(id)a3;
- (_INPBFilePropertyValue)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)nameAsString:(int)a3;
- (id)qualifierAsString:(int)a3;
- (int)StringAsName:(id)a3;
- (int)StringAsQualifier:(id)a3;
- (int)name;
- (int)qualifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasName:(BOOL)a3;
- (void)setHasQualifier:(BOOL)a3;
- (void)setName:(int)a3;
- (void)setQualifier:(int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBFileProperty

- (void).cxx_destruct
{
}

- (_INPBFilePropertyValue)value
{
  return self->_value;
}

- (int)qualifier
{
  return self->_qualifier;
}

- (int)name
{
  return self->_name;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBFileProperty *)self hasName])
  {
    uint64_t v4 = [(_INPBFileProperty *)self name];
    if (v4 >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E55184D0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"name"];
  }
  if ([(_INPBFileProperty *)self hasQualifier])
  {
    uint64_t v6 = [(_INPBFileProperty *)self qualifier];
    if (v6 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5518530[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"qualifier"];
  }
  v8 = [(_INPBFileProperty *)self value];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"value"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBFileProperty *)self hasName]) {
    uint64_t v3 = 2654435761 * self->_name;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBFileProperty *)self hasQualifier]) {
    uint64_t v4 = 2654435761 * self->_qualifier;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(_INPBFilePropertyValue *)self->_value hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBFileProperty *)self hasName];
    if (v5 == [v4 hasName])
    {
      if (![(_INPBFileProperty *)self hasName]
        || ![v4 hasName]
        || (int name = self->_name, name == [v4 name]))
      {
        int v7 = [(_INPBFileProperty *)self hasQualifier];
        if (v7 == [v4 hasQualifier])
        {
          if (![(_INPBFileProperty *)self hasQualifier]
            || ![v4 hasQualifier]
            || (int qualifier = self->_qualifier, qualifier == [v4 qualifier]))
          {
            v9 = [(_INPBFileProperty *)self value];
            v10 = [v4 value];
            v11 = v10;
            if ((v9 == 0) != (v10 != 0))
            {
              uint64_t v12 = [(_INPBFileProperty *)self value];
              if (!v12)
              {

LABEL_18:
                BOOL v17 = 1;
                goto LABEL_16;
              }
              v13 = (void *)v12;
              v14 = [(_INPBFileProperty *)self value];
              v15 = [v4 value];
              char v16 = [v14 isEqual:v15];

              if (v16) {
                goto LABEL_18;
              }
            }
            else
            {
            }
          }
        }
      }
    }
  }
  BOOL v17 = 0;
LABEL_16:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBFileProperty allocWithZone:](_INPBFileProperty, "allocWithZone:") init];
  if ([(_INPBFileProperty *)self hasName]) {
    [(_INPBFileProperty *)v5 setName:[(_INPBFileProperty *)self name]];
  }
  if ([(_INPBFileProperty *)self hasQualifier]) {
    [(_INPBFileProperty *)v5 setQualifier:[(_INPBFileProperty *)self qualifier]];
  }
  id v6 = [(_INPBFilePropertyValue *)self->_value copyWithZone:a3];
  [(_INPBFileProperty *)v5 setValue:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBFileProperty *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBFileProperty)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBFileProperty *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBFileProperty *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBFileProperty *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBFileProperty *)self hasName]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBFileProperty *)self hasQualifier]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBFileProperty *)self value];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBFileProperty *)self value];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFilePropertyReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setValue:(id)a3
{
}

- (int)StringAsQualifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EQUAL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AT_LEAST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AT_MOST"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MIN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAX"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)qualifierAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5518530[a3];
  }

  return v3;
}

- (void)setHasQualifier:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasQualifier
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setQualifier:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int qualifier = a3;
  }
}

- (int)StringAsName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SIZE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONTENTS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTHOR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CREATION_TIME"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ACCESSED_TIME"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MODIFIED_TIME"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PRINTED_TIME"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SENDER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RECIPIENT"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PAGE_COUNT"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TAG"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"FILE_TYPE"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)nameAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55184D0[a3];
  }

  return v3;
}

- (void)setHasName:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasName
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setName:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int name = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end