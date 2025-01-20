@interface BMPBDeviceMetadataEvent
- (BOOL)hasBuild;
- (BOOL)hasName;
- (BOOL)hasPlatform;
- (BOOL)hasRapidSecurityResponsePreReboot;
- (BOOL)hasSupplementalBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)rapidSecurityResponsePreReboot;
- (BOOL)readFrom:(id)a3;
- (NSString)build;
- (NSString)name;
- (NSString)supplementalBuild;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)platformAsString:(int)a3;
- (int)StringAsPlatform:(id)a3;
- (int)platform;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuild:(id)a3;
- (void)setHasPlatform:(BOOL)a3;
- (void)setHasRapidSecurityResponsePreReboot:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPlatform:(int)a3;
- (void)setRapidSecurityResponsePreReboot:(BOOL)a3;
- (void)setSupplementalBuild:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBDeviceMetadataEvent

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (int)platform
{
  if (*(unsigned char *)&self->_has) {
    return self->_platform;
  }
  else {
    return 0;
  }
}

- (void)setPlatform:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_platform = a3;
}

- (void)setHasPlatform:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlatform
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)platformAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E55D8430[a3];
  }

  return v3;
}

- (int)StringAsPlatform:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"iPad"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"iPhone"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MacDesktop"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MacPortable"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TV"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Watch"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"HomePod"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Vision"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSupplementalBuild
{
  return self->_supplementalBuild != 0;
}

- (void)setRapidSecurityResponsePreReboot:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rapidSecurityResponsePreReboot = a3;
}

- (void)setHasRapidSecurityResponsePreReboot:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRapidSecurityResponsePreReboot
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBDeviceMetadataEvent;
  int v4 = [(BMPBDeviceMetadataEvent *)&v8 description];
  v5 = [(BMPBDeviceMetadataEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  build = self->_build;
  if (build) {
    [v4 setObject:build forKey:@"build"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t platform = self->_platform;
    if (platform >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_platform);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E55D8430[platform];
    }
    [v4 setObject:v8 forKey:@"platform"];
  }
  supplementalBuild = self->_supplementalBuild;
  if (supplementalBuild) {
    [v4 setObject:supplementalBuild forKey:@"supplementalBuild"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_rapidSecurityResponsePreReboot];
    [v4 setObject:v10 forKey:@"rapidSecurityResponsePreReboot"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBDeviceMetadataEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_supplementalBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  if (self->_build)
  {
    objc_msgSend(v5, "setBuild:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_platform;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  if (self->_supplementalBuild)
  {
    objc_msgSend(v5, "setSupplementalBuild:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 40) = self->_rapidSecurityResponsePreReboot;
    *((unsigned char *)v4 + 44) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_build copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_platform;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_supplementalBuild copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 40) = self->_rapidSecurityResponsePreReboot;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_16;
    }
  }
  build = self->_build;
  if ((unint64_t)build | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](build, "isEqual:")) {
      goto LABEL_16;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_platform != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_16;
  }
  supplementalBuild = self->_supplementalBuild;
  if ((unint64_t)supplementalBuild | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](supplementalBuild, "isEqual:")) {
      goto LABEL_16;
    }
    char has = (char)self->_has;
  }
  BOOL v9 = (*((unsigned char *)v4 + 44) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_rapidSecurityResponsePreReboot)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_16;
        }
      }
      else if (*((unsigned char *)v4 + 40))
      {
        goto LABEL_16;
      }
      BOOL v9 = 1;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v9 = 0;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_build hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_platform;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_supplementalBuild hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_rapidSecurityResponsePreReboot;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[BMPBDeviceMetadataEvent setName:](self, "setName:");
    id v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[BMPBDeviceMetadataEvent setBuild:](self, "setBuild:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 44))
  {
    self->_uint64_t platform = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[BMPBDeviceMetadataEvent setSupplementalBuild:](self, "setSupplementalBuild:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    self->_rapidSecurityResponsePreReboot = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (NSString)supplementalBuild
{
  return self->_supplementalBuild;
}

- (void)setSupplementalBuild:(id)a3
{
}

- (BOOL)rapidSecurityResponsePreReboot
{
  return self->_rapidSecurityResponsePreReboot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalBuild, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_build, 0);
}

@end