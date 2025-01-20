@interface HKCodablePluginSharableModelData
- (BOOL)hasSourceLocaleIdentifier;
- (BOOL)hasSourceTimeZoneIdentifier;
- (BOOL)hasUserData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)userData;
- (NSString)sourceLocaleIdentifier;
- (NSString)sourceTimeZoneIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSourceLocaleIdentifier:(id)a3;
- (void)setSourceTimeZoneIdentifier:(id)a3;
- (void)setUserData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodablePluginSharableModelData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_sourceTimeZoneIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceLocaleIdentifier, 0);
}

- (BOOL)readFrom:(id)a3
{
  return HKCodablePluginSharableModelDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSData)userData
{
  return self->_userData;
}

- (NSString)sourceTimeZoneIdentifier
{
  return self->_sourceTimeZoneIdentifier;
}

- (NSString)sourceLocaleIdentifier
{
  return self->_sourceLocaleIdentifier;
}

- (void)setUserData:(id)a3
{
}

- (void)setSourceTimeZoneIdentifier:(id)a3
{
}

- (void)setSourceLocaleIdentifier:(id)a3
{
}

- (BOOL)hasUserData
{
  return self->_userData != 0;
}

- (BOOL)hasSourceTimeZoneIdentifier
{
  return self->_sourceTimeZoneIdentifier != 0;
}

- (BOOL)hasSourceLocaleIdentifier
{
  return self->_sourceLocaleIdentifier != 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_userData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_sourceTimeZoneIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sourceLocaleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodablePluginSharableModelData;
  id v4 = [(HKCodablePluginSharableModelData *)&v8 description];
  id v5 = [(HKCodablePluginSharableModelData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  userData = self->_userData;
  if (userData) {
    [v3 setObject:userData forKey:@"userData"];
  }
  sourceTimeZoneIdentifier = self->_sourceTimeZoneIdentifier;
  if (sourceTimeZoneIdentifier) {
    [v4 setObject:sourceTimeZoneIdentifier forKey:@"sourceTimeZoneIdentifier"];
  }
  sourceLocaleIdentifier = self->_sourceLocaleIdentifier;
  if (sourceLocaleIdentifier) {
    [v4 setObject:sourceLocaleIdentifier forKey:@"sourceLocaleIdentifier"];
  }
  return v4;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_userData)
  {
    objc_msgSend(v4, "setUserData:");
    id v4 = v5;
  }
  if (self->_sourceTimeZoneIdentifier)
  {
    objc_msgSend(v5, "setSourceTimeZoneIdentifier:");
    id v4 = v5;
  }
  if (self->_sourceLocaleIdentifier)
  {
    objc_msgSend(v5, "setSourceLocaleIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_userData copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_sourceTimeZoneIdentifier copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_sourceLocaleIdentifier copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((userData = self->_userData, !((unint64_t)userData | v4[3]))
     || -[NSData isEqual:](userData, "isEqual:"))
    && ((sourceTimeZoneIdentifier = self->_sourceTimeZoneIdentifier,
         !((unint64_t)sourceTimeZoneIdentifier | v4[2]))
     || -[NSString isEqual:](sourceTimeZoneIdentifier, "isEqual:")))
  {
    sourceLocaleIdentifier = self->_sourceLocaleIdentifier;
    if ((unint64_t)sourceLocaleIdentifier | v4[1]) {
      char v8 = -[NSString isEqual:](sourceLocaleIdentifier, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_userData hash];
  NSUInteger v4 = [(NSString *)self->_sourceTimeZoneIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_sourceLocaleIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[HKCodablePluginSharableModelData setUserData:](self, "setUserData:");
  }
  if (v4[2]) {
    -[HKCodablePluginSharableModelData setSourceTimeZoneIdentifier:](self, "setSourceTimeZoneIdentifier:");
  }
  if (v4[1]) {
    -[HKCodablePluginSharableModelData setSourceLocaleIdentifier:](self, "setSourceLocaleIdentifier:");
  }
}

@end