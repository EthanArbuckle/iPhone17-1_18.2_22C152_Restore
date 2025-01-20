@interface _INPBPlatformSupport
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMinimumOsVersion;
- (BOOL)hasSupportedPlatform;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)minimumOsVersion;
- (_INPBPlatformSupport)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)supportedPlatformAsString:(int)a3;
- (int)StringAsSupportedPlatform:(id)a3;
- (int)supportedPlatform;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasSupportedPlatform:(BOOL)a3;
- (void)setMinimumOsVersion:(id)a3;
- (void)setSupportedPlatform:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPlatformSupport

- (void).cxx_destruct
{
}

- (int)supportedPlatform
{
  return self->_supportedPlatform;
}

- (NSString)minimumOsVersion
{
  return self->_minimumOsVersion;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_minimumOsVersion)
  {
    v4 = [(_INPBPlatformSupport *)self minimumOsVersion];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"minimum_os_version"];
  }
  if ([(_INPBPlatformSupport *)self hasSupportedPlatform])
  {
    uint64_t v6 = [(_INPBPlatformSupport *)self supportedPlatform];
    if ((v6 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E551DF60[(v6 - 1)];
    }
    [v3 setObject:v7 forKeyedSubscript:@"supported_platform"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_minimumOsVersion hash];
  if ([(_INPBPlatformSupport *)self hasSupportedPlatform]) {
    uint64_t v4 = 2654435761 * self->_supportedPlatform;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  v5 = [(_INPBPlatformSupport *)self minimumOsVersion];
  uint64_t v6 = [v4 minimumOsVersion];
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(_INPBPlatformSupport *)self minimumOsVersion];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(_INPBPlatformSupport *)self minimumOsVersion];
      v11 = [v4 minimumOsVersion];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    int v13 = [(_INPBPlatformSupport *)self hasSupportedPlatform];
    if (v13 == [v4 hasSupportedPlatform])
    {
      if (![(_INPBPlatformSupport *)self hasSupportedPlatform]
        || ![v4 hasSupportedPlatform]
        || (int supportedPlatform = self->_supportedPlatform,
            supportedPlatform == [v4 supportedPlatform]))
      {
        BOOL v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
  }
LABEL_9:
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBPlatformSupport allocWithZone:](_INPBPlatformSupport, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSString *)self->_minimumOsVersion copyWithZone:a3];
  [(_INPBPlatformSupport *)v5 setMinimumOsVersion:v6];

  if ([(_INPBPlatformSupport *)self hasSupportedPlatform]) {
    [(_INPBPlatformSupport *)v5 setSupportedPlatform:[(_INPBPlatformSupport *)self supportedPlatform]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPlatformSupport *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPlatformSupport)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPlatformSupport *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPlatformSupport *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPlatformSupport *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(_INPBPlatformSupport *)self minimumOsVersion];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBPlatformSupport *)self hasSupportedPlatform]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPlatformSupportReadFrom(self, (uint64_t)a3);
}

- (int)StringAsSupportedPlatform:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"IOS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TVOS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WATCHOS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)supportedPlatformAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551DF60[a3 - 1];
  }

  return v3;
}

- (void)setHasSupportedPlatform:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportedPlatform
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSupportedPlatform:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int supportedPlatform = a3;
  }
}

- (BOOL)hasMinimumOsVersion
{
  return self->_minimumOsVersion != 0;
}

- (void)setMinimumOsVersion:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  minimumOsVersion = self->_minimumOsVersion;
  self->_minimumOsVersion = v4;

  MEMORY[0x1F41817F8](v4, minimumOsVersion);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end