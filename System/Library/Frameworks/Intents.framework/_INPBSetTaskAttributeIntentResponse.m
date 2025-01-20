@interface _INPBSetTaskAttributeIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasModifiedTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBSetTaskAttributeIntentResponse)initWithCoder:(id)a3;
- (_INPBTask)modifiedTask;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)warningsAsString:(int)a3;
- (int)StringAsWarnings:(id)a3;
- (int)warnings;
- (int)warningsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)warningsCount;
- (void)addWarnings:(int)a3;
- (void)clearWarnings;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setModifiedTask:(id)a3;
- (void)setWarnings:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetTaskAttributeIntentResponse

- (void).cxx_destruct
{
}

- (_INPBTask)modifiedTask
{
  return self->_modifiedTask;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSetTaskAttributeIntentResponse *)self modifiedTask];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"modifiedTask"];

  if (self->_warnings.count)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBSetTaskAttributeIntentResponse warningsCount](self, "warningsCount"));
    if ([(_INPBSetTaskAttributeIntentResponse *)self warningsCount])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = self->_warnings.list[v7];
        if (v8 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_warnings.list[v7]);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E5517E58[v8];
        }
        [v6 addObject:v9];

        ++v7;
      }
      while (v7 < [(_INPBSetTaskAttributeIntentResponse *)self warningsCount]);
    }
    [v3 setObject:v6 forKeyedSubscript:@"warnings"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v2 = [(_INPBTask *)self->_modifiedTask hash];
  return PBRepeatedInt32Hash() ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_INPBSetTaskAttributeIntentResponse *)self modifiedTask];
    v6 = [v4 modifiedTask];
    unint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBSetTaskAttributeIntentResponse *)self modifiedTask];
      if (!v8)
      {

LABEL_10:
        char IsEqual = PBRepeatedInt32IsEqual();
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_INPBSetTaskAttributeIntentResponse *)self modifiedTask];
      v11 = [v4 modifiedTask];
      int v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  char IsEqual = 0;
LABEL_8:

  return IsEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBSetTaskAttributeIntentResponse allocWithZone:](_INPBSetTaskAttributeIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBTask *)self->_modifiedTask copyWithZone:a3];
  [(_INPBSetTaskAttributeIntentResponse *)v5 setModifiedTask:v6];

  PBRepeatedInt32Copy();
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetTaskAttributeIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetTaskAttributeIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetTaskAttributeIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetTaskAttributeIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetTaskAttributeIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBSetTaskAttributeIntentResponse *)self clearWarnings];
  v3.receiver = self;
  v3.super_class = (Class)_INPBSetTaskAttributeIntentResponse;
  [(_INPBSetTaskAttributeIntentResponse *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBSetTaskAttributeIntentResponse *)self modifiedTask];

  if (v4)
  {
    v5 = [(_INPBSetTaskAttributeIntentResponse *)self modifiedTask];
    PBDataWriterWriteSubmessage();
  }
  p_warnings = &self->_warnings;
  if (p_warnings->count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < p_warnings->count);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetTaskAttributeIntentResponseReadFrom(self, (uint64_t)a3);
}

- (int)StringAsWarnings:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOCATION_SERVICES_DISABLED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FLAGGED_NOT_ALLOWED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONTACT_TRIGGER_NOT_ALLOWED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NOT_UPGRADED_TO_CLOUDKIT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)warningsAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5517E58[a3];
  }

  return v3;
}

- (int)warningsAtIndex:(unint64_t)a3
{
  return self->_warnings.list[a3];
}

- (unint64_t)warningsCount
{
  return self->_warnings.count;
}

- (void)addWarnings:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearWarnings
{
}

- (int)warnings
{
  return self->_warnings.list;
}

- (void)setWarnings:(int *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasModifiedTask
{
  return self->_modifiedTask != 0;
}

- (void)setModifiedTask:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end