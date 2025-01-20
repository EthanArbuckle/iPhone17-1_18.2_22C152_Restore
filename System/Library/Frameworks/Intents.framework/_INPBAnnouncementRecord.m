@interface _INPBAnnouncementRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDuration;
- (BOOL)hasIdentifier;
- (BOOL)hasOriginator;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (_INPBAnnouncementRecord)initWithCoder:(id)a3;
- (_INPBHomeFilter)originator;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setOriginator:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAnnouncementRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originator, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (_INPBHomeFilter)originator
{
  return self->_originator;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)duration
{
  return self->_duration;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBAnnouncementRecord *)self hasDuration])
  {
    v4 = NSNumber;
    [(_INPBAnnouncementRecord *)self duration];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"duration"];
  }
  if (self->_identifier)
  {
    v6 = [(_INPBAnnouncementRecord *)self identifier];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"identifier"];
  }
  v8 = [(_INPBAnnouncementRecord *)self originator];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"originator"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBAnnouncementRecord *)self hasDuration])
  {
    double duration = self->_duration;
    double v4 = -duration;
    if (duration >= 0.0) {
      double v4 = self->_duration;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0) {
        v7 += (unint64_t)v6;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_identifier hash] ^ v7;
  return v8 ^ [(_INPBHomeFilter *)self->_originator hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  int v5 = [(_INPBAnnouncementRecord *)self hasDuration];
  if (v5 != [v4 hasDuration]) {
    goto LABEL_16;
  }
  if ([(_INPBAnnouncementRecord *)self hasDuration])
  {
    if ([v4 hasDuration])
    {
      double duration = self->_duration;
      [v4 duration];
      if (duration != v7) {
        goto LABEL_16;
      }
    }
  }
  NSUInteger v8 = [(_INPBAnnouncementRecord *)self identifier];
  v9 = [v4 identifier];
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_15;
  }
  uint64_t v10 = [(_INPBAnnouncementRecord *)self identifier];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = [(_INPBAnnouncementRecord *)self identifier];
    v13 = [v4 identifier];
    int v14 = [v12 isEqual:v13];

    if (!v14) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  NSUInteger v8 = [(_INPBAnnouncementRecord *)self originator];
  v9 = [v4 originator];
  if ((v8 == 0) != (v9 != 0))
  {
    uint64_t v15 = [(_INPBAnnouncementRecord *)self originator];
    if (!v15)
    {

LABEL_19:
      BOOL v20 = 1;
      goto LABEL_17;
    }
    v16 = (void *)v15;
    v17 = [(_INPBAnnouncementRecord *)self originator];
    v18 = [v4 originator];
    char v19 = [v17 isEqual:v18];

    if (v19) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_15:
  }
LABEL_16:
  BOOL v20 = 0;
LABEL_17:

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBAnnouncementRecord allocWithZone:](_INPBAnnouncementRecord, "allocWithZone:") init];
  if ([(_INPBAnnouncementRecord *)self hasDuration])
  {
    [(_INPBAnnouncementRecord *)self duration];
    -[_INPBAnnouncementRecord setDuration:](v5, "setDuration:");
  }
  double v6 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBAnnouncementRecord *)v5 setIdentifier:v6];

  id v7 = [(_INPBHomeFilter *)self->_originator copyWithZone:a3];
  [(_INPBAnnouncementRecord *)v5 setOriginator:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAnnouncementRecord *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAnnouncementRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAnnouncementRecord *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAnnouncementRecord *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAnnouncementRecord *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if ([(_INPBAnnouncementRecord *)self hasDuration]) {
    PBDataWriterWriteDoubleField();
  }
  id v4 = [(_INPBAnnouncementRecord *)self identifier];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  int v5 = [(_INPBAnnouncementRecord *)self originator];

  id v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(_INPBAnnouncementRecord *)self originator];
    PBDataWriterWriteSubmessage();

    id v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAnnouncementRecordReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasOriginator
{
  return self->_originator != 0;
}

- (void)setOriginator:(id)a3
{
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  MEMORY[0x1F41817F8](v4, identifier);
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double duration = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end