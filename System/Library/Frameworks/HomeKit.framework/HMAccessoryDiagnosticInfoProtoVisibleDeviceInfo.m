@interface HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo
- (BOOL)hasIdsIdentifierString;
- (BOOL)hasMediaRouteIdString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)idsIdentifierString;
- (NSString)mediaRouteIdString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdsIdentifierString:(id)a3;
- (void)setMediaRouteIdString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRouteIdString, 0);

  objc_storeStrong((id *)&self->_idsIdentifierString, 0);
}

- (void)setMediaRouteIdString:(id)a3
{
}

- (NSString)mediaRouteIdString
{
  return self->_mediaRouteIdString;
}

- (void)setIdsIdentifierString:(id)a3
{
}

- (NSString)idsIdentifierString
{
  return self->_idsIdentifierString;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo setIdsIdentifierString:](self, "setIdsIdentifierString:");
    v4 = v5;
  }
  if (v4[2])
  {
    [(HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo *)self setMediaRouteIdString:"setMediaRouteIdString:"];
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_idsIdentifierString hash];
  return [(NSString *)self->_mediaRouteIdString hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((idsIdentifierString = self->_idsIdentifierString, !((unint64_t)idsIdentifierString | v4[1]))
     || -[NSString isEqual:](idsIdentifierString, "isEqual:")))
  {
    mediaRouteIdString = self->_mediaRouteIdString;
    if ((unint64_t)mediaRouteIdString | v4[2]) {
      char v7 = -[NSString isEqual:](mediaRouteIdString, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_idsIdentifierString copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_mediaRouteIdString copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_idsIdentifierString)
  {
    objc_msgSend(v4, "setIdsIdentifierString:");
    id v4 = v5;
  }
  if (self->_mediaRouteIdString)
  {
    objc_msgSend(v5, "setMediaRouteIdString:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_idsIdentifierString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_mediaRouteIdString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoVisibleDeviceInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  idsIdentifierString = self->_idsIdentifierString;
  if (idsIdentifierString) {
    [v3 setObject:idsIdentifierString forKey:@"idsIdentifierString"];
  }
  mediaRouteIdString = self->_mediaRouteIdString;
  if (mediaRouteIdString) {
    [v4 setObject:mediaRouteIdString forKey:@"mediaRouteIdString"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo;
  id v4 = [(HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo *)&v8 description];
  id v5 = [(HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMediaRouteIdString
{
  return self->_mediaRouteIdString != 0;
}

- (BOOL)hasIdsIdentifierString
{
  return self->_idsIdentifierString != 0;
}

@end