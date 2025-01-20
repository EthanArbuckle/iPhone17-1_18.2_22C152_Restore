@interface _INPBMediaDestination
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMediaDestinationType;
- (BOOL)hasPlaylistName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBMediaDestination)initWithCoder:(id)a3;
- (_INPBString)playlistName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)mediaDestinationTypeAsString:(int)a3;
- (int)StringAsMediaDestinationType:(id)a3;
- (int)mediaDestinationType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasMediaDestinationType:(BOOL)a3;
- (void)setMediaDestinationType:(int)a3;
- (void)setPlaylistName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBMediaDestination

- (void).cxx_destruct
{
}

- (_INPBString)playlistName
{
  return self->_playlistName;
}

- (int)mediaDestinationType
{
  return self->_mediaDestinationType;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBMediaDestination *)self hasMediaDestinationType])
  {
    uint64_t v4 = [(_INPBMediaDestination *)self mediaDestinationType];
    if (v4 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E551EEC8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"mediaDestinationType"];
  }
  v6 = [(_INPBMediaDestination *)self playlistName];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"playlistName"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBMediaDestination *)self hasMediaDestinationType]) {
    uint64_t v3 = 2654435761 * self->_mediaDestinationType;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(_INPBString *)self->_playlistName hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBMediaDestination *)self hasMediaDestinationType];
    if (v5 == [v4 hasMediaDestinationType])
    {
      if (![(_INPBMediaDestination *)self hasMediaDestinationType]
        || ![v4 hasMediaDestinationType]
        || (int mediaDestinationType = self->_mediaDestinationType,
            mediaDestinationType == [v4 mediaDestinationType]))
      {
        v7 = [(_INPBMediaDestination *)self playlistName];
        v8 = [v4 playlistName];
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_INPBMediaDestination *)self playlistName];
          if (!v10)
          {

LABEL_14:
            BOOL v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          v12 = [(_INPBMediaDestination *)self playlistName];
          v13 = [v4 playlistName];
          char v14 = [v12 isEqual:v13];

          if (v14) {
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBMediaDestination allocWithZone:](_INPBMediaDestination, "allocWithZone:") init];
  if ([(_INPBMediaDestination *)self hasMediaDestinationType]) {
    [(_INPBMediaDestination *)v5 setMediaDestinationType:[(_INPBMediaDestination *)self mediaDestinationType]];
  }
  id v6 = [(_INPBString *)self->_playlistName copyWithZone:a3];
  [(_INPBMediaDestination *)v5 setPlaylistName:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBMediaDestination *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBMediaDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBMediaDestination *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBMediaDestination *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBMediaDestination *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBMediaDestination *)self hasMediaDestinationType]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBMediaDestination *)self playlistName];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBMediaDestination *)self playlistName];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMediaDestinationReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasPlaylistName
{
  return self->_playlistName != 0;
}

- (void)setPlaylistName:(id)a3
{
}

- (int)StringAsMediaDestinationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_DESTINATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LIBRARY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLAYLIST"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)mediaDestinationTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551EEC8[a3];
  }

  return v3;
}

- (void)setHasMediaDestinationType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMediaDestinationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMediaDestinationType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int mediaDestinationType = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end