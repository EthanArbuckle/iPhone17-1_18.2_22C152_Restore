@interface _INPBStartCallRequestMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)appInferred;
- (BOOL)hasAppInferred;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBStartCallRequestMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppInferred:(BOOL)a3;
- (void)setHasAppInferred:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBStartCallRequestMetadata

- (BOOL)appInferred
{
  return self->_appInferred;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBStartCallRequestMetadata *)self hasAppInferred])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBStartCallRequestMetadata appInferred](self, "appInferred"));
    [v3 setObject:v4 forKeyedSubscript:@"appInferred"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBStartCallRequestMetadata *)self hasAppInferred]) {
    return 2654435761 * self->_appInferred;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBStartCallRequestMetadata *)self hasAppInferred];
    if (v5 == [v4 hasAppInferred])
    {
      if (![(_INPBStartCallRequestMetadata *)self hasAppInferred]
        || ![v4 hasAppInferred]
        || (int appInferred = self->_appInferred, appInferred == [v4 appInferred]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBStartCallRequestMetadata allocWithZone:a3] init];
  if ([(_INPBStartCallRequestMetadata *)self hasAppInferred]) {
    [(_INPBStartCallRequestMetadata *)v4 setAppInferred:[(_INPBStartCallRequestMetadata *)self appInferred]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBStartCallRequestMetadata *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBStartCallRequestMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBStartCallRequestMetadata *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBStartCallRequestMetadata *)self hasAppInferred]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStartCallRequestMetadataReadFrom(self, (uint64_t)a3);
}

- (void)setHasAppInferred:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppInferred
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAppInferred:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int appInferred = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end