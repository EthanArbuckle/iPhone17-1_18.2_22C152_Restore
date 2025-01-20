@interface HMPBActionContainer
- (BOOL)hasCharacteristicWriteAction;
- (BOOL)hasMatterCommandAction;
- (BOOL)hasMediaPlaybackAction;
- (BOOL)hasNaturalLightingAction;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMPBCharacteristicWriteAction)characteristicWriteAction;
- (HMPBMatterCommandAction)matterCommandAction;
- (HMPBMediaPlaybackAction)mediaPlaybackAction;
- (HMPBNaturalLightingAction)naturalLightingAction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCharacteristicWriteAction:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMatterCommandAction:(id)a3;
- (void)setMediaPlaybackAction:(id)a3;
- (void)setNaturalLightingAction:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMPBActionContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_naturalLightingAction, 0);
  objc_storeStrong((id *)&self->_matterCommandAction, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackAction, 0);

  objc_storeStrong((id *)&self->_characteristicWriteAction, 0);
}

- (void)setMatterCommandAction:(id)a3
{
}

- (HMPBMatterCommandAction)matterCommandAction
{
  return self->_matterCommandAction;
}

- (void)setNaturalLightingAction:(id)a3
{
}

- (HMPBNaturalLightingAction)naturalLightingAction
{
  return self->_naturalLightingAction;
}

- (void)setMediaPlaybackAction:(id)a3
{
}

- (HMPBMediaPlaybackAction)mediaPlaybackAction
{
  return self->_mediaPlaybackAction;
}

- (void)setCharacteristicWriteAction:(id)a3
{
}

- (HMPBCharacteristicWriteAction)characteristicWriteAction
{
  return self->_characteristicWriteAction;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (*((unsigned char *)v4 + 44))
  {
    self->_type = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  characteristicWriteAction = self->_characteristicWriteAction;
  uint64_t v7 = v5[1];
  v23 = v5;
  if (characteristicWriteAction)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[HMPBCharacteristicWriteAction mergeFrom:](characteristicWriteAction, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[HMPBActionContainer setCharacteristicWriteAction:](self, "setCharacteristicWriteAction:");
  }
  v5 = v23;
LABEL_9:
  mediaPlaybackAction = self->_mediaPlaybackAction;
  v9 = (void *)v5[2];
  if (mediaPlaybackAction)
  {
    if (!v9) {
      goto LABEL_30;
    }
    id v10 = v9;
    v11 = (void *)*((void *)v10 + 1);
    if (v11) {
      objc_storeStrong((id *)&mediaPlaybackAction->_actionUUID, v11);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = *((id *)v10 + 3);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          -[HMPBMediaPlaybackAction addMediaProfiles:]((uint64_t)mediaPlaybackAction, *(void **)(*((void *)&v24 + 1) + 8 * i));
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }

    if (*((unsigned char *)v10 + 48))
    {
      mediaPlaybackAction->_mediaPlaybackState = *((_DWORD *)v10 + 4);
      *(unsigned char *)&mediaPlaybackAction->_has |= 1u;
    }
    v17 = (void *)*((void *)v10 + 5);
    if (v17) {
      objc_storeStrong((id *)&mediaPlaybackAction->_volume, v17);
    }
    v18 = (void *)*((void *)v10 + 4);
    if (v18) {
      objc_storeStrong((id *)&mediaPlaybackAction->_playbackArchive, v18);
    }
  }
  else
  {
    if (!v9) {
      goto LABEL_30;
    }
    -[HMPBActionContainer setMediaPlaybackAction:](self, "setMediaPlaybackAction:");
  }
  v5 = v23;
LABEL_30:
  naturalLightingAction = self->_naturalLightingAction;
  uint64_t v20 = v5[4];
  if (naturalLightingAction)
  {
    if (!v20) {
      goto LABEL_36;
    }
    -[HMPBNaturalLightingAction mergeFrom:](naturalLightingAction, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_36;
    }
    -[HMPBActionContainer setNaturalLightingAction:](self, "setNaturalLightingAction:");
  }
  v5 = v23;
LABEL_36:
  matterCommandAction = self->_matterCommandAction;
  uint64_t v22 = v5[3];
  if (matterCommandAction)
  {
    if (!v22) {
      goto LABEL_42;
    }
    matterCommandAction = (HMPBMatterCommandAction *)-[HMPBMatterCommandAction mergeFrom:](matterCommandAction, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_42;
    }
    matterCommandAction = (HMPBMatterCommandAction *)-[HMPBActionContainer setMatterCommandAction:](self, "setMatterCommandAction:");
  }
  v5 = v23;
LABEL_42:

  MEMORY[0x1F41817F8](matterCommandAction, v5);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(HMPBCharacteristicWriteAction *)self->_characteristicWriteAction hash] ^ v3;
  unint64_t v5 = [(HMPBMediaPlaybackAction *)self->_mediaPlaybackAction hash];
  unint64_t v6 = v4 ^ v5 ^ [(HMPBNaturalLightingAction *)self->_naturalLightingAction hash];
  return v6 ^ [(HMPBMatterCommandAction *)self->_matterCommandAction hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  characteristicWriteAction = self->_characteristicWriteAction;
  if ((unint64_t)characteristicWriteAction | *((void *)v4 + 1)
    && !-[HMPBCharacteristicWriteAction isEqual:](characteristicWriteAction, "isEqual:"))
  {
    goto LABEL_15;
  }
  mediaPlaybackAction = self->_mediaPlaybackAction;
  if ((unint64_t)mediaPlaybackAction | *((void *)v4 + 2))
  {
    if (!-[HMPBMediaPlaybackAction isEqual:](mediaPlaybackAction, "isEqual:")) {
      goto LABEL_15;
    }
  }
  naturalLightingAction = self->_naturalLightingAction;
  if ((unint64_t)naturalLightingAction | *((void *)v4 + 4))
  {
    if (!-[HMPBNaturalLightingAction isEqual:](naturalLightingAction, "isEqual:")) {
      goto LABEL_15;
    }
  }
  matterCommandAction = self->_matterCommandAction;
  if ((unint64_t)matterCommandAction | *((void *)v4 + 3)) {
    char v9 = -[HMPBMatterCommandAction isEqual:](matterCommandAction, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_type;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  id v7 = [(HMPBCharacteristicWriteAction *)self->_characteristicWriteAction copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  id v9 = [(HMPBMediaPlaybackAction *)self->_mediaPlaybackAction copyWithZone:a3];
  id v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(HMPBNaturalLightingAction *)self->_naturalLightingAction copyWithZone:a3];
  id v12 = (void *)v6[4];
  v6[4] = v11;

  id v13 = [(HMPBMatterCommandAction *)self->_matterCommandAction copyWithZone:a3];
  uint64_t v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[10] = self->_type;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_characteristicWriteAction)
  {
    objc_msgSend(v4, "setCharacteristicWriteAction:");
    id v4 = v5;
  }
  if (self->_mediaPlaybackAction)
  {
    objc_msgSend(v5, "setMediaPlaybackAction:");
    id v4 = v5;
  }
  if (self->_naturalLightingAction)
  {
    objc_msgSend(v5, "setNaturalLightingAction:");
    id v4 = v5;
  }
  if (self->_matterCommandAction)
  {
    objc_msgSend(v5, "setMatterCommandAction:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_characteristicWriteAction)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mediaPlaybackAction)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_naturalLightingAction)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_matterCommandAction)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMPBActionContainerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = self->_type - 1;
    if (v4 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = off_1E5944F40[v4];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  characteristicWriteAction = self->_characteristicWriteAction;
  if (characteristicWriteAction)
  {
    id v7 = [(HMPBCharacteristicWriteAction *)characteristicWriteAction dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"characteristicWriteAction"];
  }
  mediaPlaybackAction = self->_mediaPlaybackAction;
  if (mediaPlaybackAction)
  {
    id v9 = [(HMPBMediaPlaybackAction *)mediaPlaybackAction dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"mediaPlaybackAction"];
  }
  naturalLightingAction = self->_naturalLightingAction;
  if (naturalLightingAction)
  {
    id v11 = [(HMPBNaturalLightingAction *)naturalLightingAction dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"naturalLightingAction"];
  }
  matterCommandAction = self->_matterCommandAction;
  if (matterCommandAction)
  {
    id v13 = [(HMPBMatterCommandAction *)matterCommandAction dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"matterCommandAction"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMPBActionContainer;
  unsigned int v4 = [(HMPBActionContainer *)&v8 description];
  id v5 = [(HMPBActionContainer *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMatterCommandAction
{
  return self->_matterCommandAction != 0;
}

- (BOOL)hasNaturalLightingAction
{
  return self->_naturalLightingAction != 0;
}

- (BOOL)hasMediaPlaybackAction
{
  return self->_mediaPlaybackAction != 0;
}

- (BOOL)hasCharacteristicWriteAction
{
  return self->_characteristicWriteAction != 0;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CharacteristicWriteAction"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MediaPlaybackAction"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NaturalLightingAction"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MatterCommandAction"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5944F40[a3 - 1];
  }

  return v3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 1;
  }
}

@end