@interface VCCallInfoBlob
- (BOOL)hasAudioDeviceUID;
- (BOOL)hasDeviceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)audioDeviceUID;
- (NSString)deviceName;
- (NSString)deviceType;
- (NSString)frameworkVersion;
- (NSString)osVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stringForCheckpoint;
- (unint64_t)hash;
- (unsigned)callID;
- (unsigned)clientVersion;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAudioDeviceUID:(id)a3;
- (void)setCallID:(unsigned int)a3;
- (void)setClientVersion:(unsigned int)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setFrameworkVersion:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCCallInfoBlob

- (id)stringForCheckpoint
{
  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[VCCallInfoBlob formattedText](self, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @", "), "stringByReplacingOccurrencesOfString:withString:", @": ", @"="), "stringByReplacingOccurrencesOfString:withString:", @"\"", &stru_1F3D3E450);
  uint64_t v3 = [v2 length];

  return (id)[v2 stringByReplacingOccurrencesOfString:@", $", &stru_1F3D3E450, 1024, 0, v3 withString options range];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCCallInfoBlob *)self setDeviceType:0];
  [(VCCallInfoBlob *)self setFrameworkVersion:0];
  [(VCCallInfoBlob *)self setOsVersion:0];
  [(VCCallInfoBlob *)self setDeviceName:0];
  [(VCCallInfoBlob *)self setAudioDeviceUID:0];
  v3.receiver = self;
  v3.super_class = (Class)VCCallInfoBlob;
  [(VCCallInfoBlob *)&v3 dealloc];
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasAudioDeviceUID
{
  return self->_audioDeviceUID != 0;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCCallInfoBlob;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCCallInfoBlob description](&v3, sel_description), -[VCCallInfoBlob dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_callID), @"callID");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_clientVersion), @"clientVersion");
  deviceType = self->_deviceType;
  if (deviceType) {
    [v3 setObject:deviceType forKey:@"deviceType"];
  }
  frameworkVersion = self->_frameworkVersion;
  if (frameworkVersion) {
    [v3 setObject:frameworkVersion forKey:@"frameworkVersion"];
  }
  osVersion = self->_osVersion;
  if (osVersion) {
    [v3 setObject:osVersion forKey:@"osVersion"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"deviceName"];
  }
  audioDeviceUID = self->_audioDeviceUID;
  if (audioDeviceUID) {
    [v3 setObject:audioDeviceUID forKey:@"audioDeviceUID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCCallInfoBlobReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  if (self->_deviceName) {
    PBDataWriterWriteStringField();
  }
  if (self->_audioDeviceUID)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_callID;
  *((_DWORD *)a3 + 5) = self->_clientVersion;
  [a3 setDeviceType:self->_deviceType];
  [a3 setFrameworkVersion:self->_frameworkVersion];
  [a3 setOsVersion:self->_osVersion];
  if (self->_deviceName) {
    objc_msgSend(a3, "setDeviceName:");
  }
  if (self->_audioDeviceUID)
  {
    objc_msgSend(a3, "setAudioDeviceUID:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_callID;
  *(_DWORD *)(v5 + 20) = self->_clientVersion;

  *(void *)(v5 + 32) = [(NSString *)self->_deviceType copyWithZone:a3];
  *(void *)(v5 + 40) = [(NSString *)self->_frameworkVersion copyWithZone:a3];

  *(void *)(v5 + 48) = [(NSString *)self->_osVersion copyWithZone:a3];
  *(void *)(v5 + 24) = [(NSString *)self->_deviceName copyWithZone:a3];

  *(void *)(v5 + 8) = [(NSString *)self->_audioDeviceUID copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_callID == *((_DWORD *)a3 + 4) && self->_clientVersion == *((_DWORD *)a3 + 5))
    {
      deviceType = self->_deviceType;
      if (!((unint64_t)deviceType | *((void *)a3 + 4))
        || (int v5 = -[NSString isEqual:](deviceType, "isEqual:")) != 0)
      {
        frameworkVersion = self->_frameworkVersion;
        if (!((unint64_t)frameworkVersion | *((void *)a3 + 5))
          || (int v5 = -[NSString isEqual:](frameworkVersion, "isEqual:")) != 0)
        {
          osVersion = self->_osVersion;
          if (!((unint64_t)osVersion | *((void *)a3 + 6))
            || (int v5 = -[NSString isEqual:](osVersion, "isEqual:")) != 0)
          {
            deviceName = self->_deviceName;
            if (!((unint64_t)deviceName | *((void *)a3 + 3))
              || (int v5 = -[NSString isEqual:](deviceName, "isEqual:")) != 0)
            {
              audioDeviceUID = self->_audioDeviceUID;
              if ((unint64_t)audioDeviceUID | *((void *)a3 + 1))
              {
                LOBYTE(v5) = -[NSString isEqual:](audioDeviceUID, "isEqual:");
              }
              else
              {
                LOBYTE(v5) = 1;
              }
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = (2654435761 * self->_clientVersion) ^ (2654435761 * self->_callID);
  NSUInteger v4 = [(NSString *)self->_deviceType hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_frameworkVersion hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_osVersion hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_deviceName hash];
  return v3 ^ v7 ^ [(NSString *)self->_audioDeviceUID hash];
}

- (void)mergeFrom:(id)a3
{
  self->_callID = *((_DWORD *)a3 + 4);
  self->_clientVersion = *((_DWORD *)a3 + 5);
  if (*((void *)a3 + 4)) {
    -[VCCallInfoBlob setDeviceType:](self, "setDeviceType:");
  }
  if (*((void *)a3 + 5)) {
    -[VCCallInfoBlob setFrameworkVersion:](self, "setFrameworkVersion:");
  }
  if (*((void *)a3 + 6)) {
    -[VCCallInfoBlob setOsVersion:](self, "setOsVersion:");
  }
  if (*((void *)a3 + 3)) {
    -[VCCallInfoBlob setDeviceName:](self, "setDeviceName:");
  }
  if (*((void *)a3 + 1))
  {
    -[VCCallInfoBlob setAudioDeviceUID:](self, "setAudioDeviceUID:");
  }
}

- (unsigned)callID
{
  return self->_callID;
}

- (void)setCallID:(unsigned int)a3
{
  self->_callID = a3;
}

- (unsigned)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(unsigned int)a3
{
  self->_clientVersion = a3;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)frameworkVersion
{
  return self->_frameworkVersion;
}

- (void)setFrameworkVersion:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)audioDeviceUID
{
  return self->_audioDeviceUID;
}

- (void)setAudioDeviceUID:(id)a3
{
}

@end