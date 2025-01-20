@interface VCMediaNegotiationBlobMomentsSettings
+ (unsigned)avcMomentsCapabilitiesForMultiwayMomentsCapabilities:(int)a3;
+ (unsigned)capabilitiesBitmapWithCapabilities:(unsigned __int8)a3;
- (BOOL)hasMultiwayCapabilities;
- (BOOL)hasSupportedImageTypes;
- (BOOL)hasSupportedVideoCodecs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCMediaNegotiationBlobMomentsSettings)initWithVideoCodecs:(id)a3 imageTypes:(id)a4 capabilities:(unsigned __int8)a5 multiwayCapabilities:(unsigned __int8)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)newImageTypeSet;
- (id)newVideoCodecSet;
- (unint64_t)hash;
- (unsigned)capabilities;
- (unsigned)multiwayCapabilities;
- (unsigned)supportedImageTypes;
- (unsigned)supportedVideoCodecs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCapabilities:(unsigned int)a3;
- (void)setHasMultiwayCapabilities:(BOOL)a3;
- (void)setHasSupportedImageTypes:(BOOL)a3;
- (void)setHasSupportedVideoCodecs:(BOOL)a3;
- (void)setMultiwayCapabilities:(unsigned int)a3;
- (void)setSupportedImageTypes:(unsigned int)a3;
- (void)setSupportedVideoCodecs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobMomentsSettings

- (void)setSupportedVideoCodecs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportedVideoCodecs = a3;
}

- (void)setHasSupportedVideoCodecs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportedVideoCodecs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSupportedImageTypes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_supportedImageTypes = a3;
}

- (void)setHasSupportedImageTypes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSupportedImageTypes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMultiwayCapabilities:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_multiwayCapabilities = a3;
}

- (void)setHasMultiwayCapabilities:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMultiwayCapabilities
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobMomentsSettings;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobMomentsSettings description](&v3, sel_description), -[VCMediaNegotiationBlobMomentsSettings dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_capabilities), @"capabilities");
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_supportedImageTypes), @"supportedImageTypes");
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_4;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_supportedVideoCodecs), @"supportedVideoCodecs");
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has) {
LABEL_4:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_multiwayCapabilities), @"multiwayCapabilities");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobMomentsSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 1) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_capabilities;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_supportedVideoCodecs;
    *((unsigned char *)a3 + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return;
      }
LABEL_7:
      *((_DWORD *)a3 + 3) = self->_multiwayCapabilities;
      *((unsigned char *)a3 + 24) |= 1u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_supportedImageTypes;
  *((unsigned char *)a3 + 24) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_capabilities;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 5) = self->_supportedVideoCodecs;
    *((unsigned char *)result + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_supportedImageTypes;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 3) = self->_multiwayCapabilities;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_capabilities != *((_DWORD *)a3 + 2))
    {
LABEL_17:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 4) == 0 || self->_supportedVideoCodecs != *((_DWORD *)a3 + 5)) {
        goto LABEL_17;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 4) != 0)
    {
      goto LABEL_17;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_supportedImageTypes != *((_DWORD *)a3 + 4)) {
        goto LABEL_17;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 2) != 0)
    {
      goto LABEL_17;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_multiwayCapabilities != *((_DWORD *)a3 + 3)) {
        goto LABEL_17;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v2 = 2654435761 * self->_supportedVideoCodecs;
  }
  else {
    uint64_t v2 = 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_supportedImageTypes;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v4 = 0;
    return v2 ^ v3 ^ v4 ^ (2654435761 * self->_capabilities);
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v4 = 2654435761 * self->_multiwayCapabilities;
  return v2 ^ v3 ^ v4 ^ (2654435761 * self->_capabilities);
}

- (void)mergeFrom:(id)a3
{
  self->_capabilities = *((_DWORD *)a3 + 2);
  char v3 = *((unsigned char *)a3 + 24);
  if ((v3 & 4) != 0)
  {
    self->_supportedVideoCodecs = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 24);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        return;
      }
LABEL_7:
      self->_multiwayCapabilities = *((_DWORD *)a3 + 3);
      *(unsigned char *)&self->_has |= 1u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_supportedImageTypes = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 24)) {
    goto LABEL_7;
  }
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unsigned int)a3
{
  self->_capabilities = a3;
}

- (unsigned)supportedVideoCodecs
{
  return self->_supportedVideoCodecs;
}

- (unsigned)supportedImageTypes
{
  return self->_supportedImageTypes;
}

- (unsigned)multiwayCapabilities
{
  return self->_multiwayCapabilities;
}

+ (unsigned)avcMomentsCapabilitiesForMultiwayMomentsCapabilities:(int)a3
{
  if ((a3 & 4) != 0) {
    return 7;
  }
  else {
    return (a3 >> 1) & 1;
  }
}

- (VCMediaNegotiationBlobMomentsSettings)initWithVideoCodecs:(id)a3 imageTypes:(id)a4 capabilities:(unsigned __int8)a5 multiwayCapabilities:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)VCMediaNegotiationBlobMomentsSettings;
  v10 = [(VCMediaNegotiationBlobMomentsSettings *)&v24 init];
  if (v10)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v11 = [a3 countByEnumeratingWithState:&v31 objects:v30 count:16];
    if (!v11) {
      goto LABEL_14;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    while (1)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(a3);
        }
        int v15 = [*(id *)(*((void *)&v31 + 1) + 8 * i) intValue];
        if (v15 == 123)
        {
          int v16 = 1;
        }
        else
        {
          if (v15 != 100) {
            continue;
          }
          int v16 = 2;
        }
        v10->_supportedVideoCodecs |= v16;
        *(unsigned char *)&v10->_has |= 4u;
      }
      uint64_t v12 = [a3 countByEnumeratingWithState:&v31 objects:v30 count:16];
      if (!v12)
      {
LABEL_14:
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v17 = [a4 countByEnumeratingWithState:&v26 objects:v25 count:16];
        if (!v17) {
          goto LABEL_26;
        }
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v27;
        while (1)
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v27 != v19) {
              objc_enumerationMutation(a4);
            }
            int v21 = [*(id *)(*((void *)&v26 + 1) + 8 * j) intValue];
            if (v21)
            {
              if (v21 != 1) {
                continue;
              }
              int v22 = 2;
            }
            else
            {
              int v22 = 1;
            }
            v10->_supportedImageTypes |= v22;
            *(unsigned char *)&v10->_has |= 2u;
          }
          uint64_t v18 = [a4 countByEnumeratingWithState:&v26 objects:v25 count:16];
          if (!v18)
          {
LABEL_26:
            [(VCMediaNegotiationBlobMomentsSettings *)v10 setCapabilities:+[VCMediaNegotiationBlobMomentsSettings capabilitiesBitmapWithCapabilities:v7]];
            [(VCMediaNegotiationBlobMomentsSettings *)v10 setMultiwayCapabilities:+[VCMediaNegotiationBlobMomentsSettings capabilitiesBitmapWithCapabilities:v6]];
            return v10;
          }
        }
      }
    }
  }
  return v10;
}

- (id)newVideoCodecSet
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  int v4 = 1;
  while (1)
  {
    int v5 = v4;
    if ((self->_supportedVideoCodecs & v4) != 0)
    {
      if (v4 == 1)
      {
        [v3 addObject:&unk_1F3DC5FA0];
        goto LABEL_7;
      }
      if (v4 == 2) {
        break;
      }
    }
LABEL_7:
    int v4 = 2 * v5;
    if ((v5 & 1) == 0) {
      return v3;
    }
  }
  [v3 addObject:&unk_1F3DC5FB8];
  return v3;
}

- (id)newImageTypeSet
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  int v4 = 1;
  while (1)
  {
    int v5 = v4;
    if ((self->_supportedImageTypes & v4) != 0)
    {
      if (v4 == 1)
      {
        [v3 addObject:&unk_1F3DC5FD0];
        goto LABEL_7;
      }
      if (v4 == 2) {
        break;
      }
    }
LABEL_7:
    int v4 = 2 * v5;
    if ((v5 & 1) == 0) {
      return v3;
    }
  }
  [v3 addObject:&unk_1F3DC5FE8];
  return v3;
}

+ (unsigned)capabilitiesBitmapWithCapabilities:(unsigned __int8)a3
{
  if (a3 == 1) {
    unsigned int v3 = 2;
  }
  else {
    unsigned int v3 = 1;
  }
  if (a3 == 2) {
    return 4;
  }
  else {
    return v3;
  }
}

@end