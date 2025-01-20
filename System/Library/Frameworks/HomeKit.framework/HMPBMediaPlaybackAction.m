@interface HMPBMediaPlaybackAction
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addMediaProfiles:(uint64_t)a1;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation HMPBMediaPlaybackAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_mediaProfiles, 0);

  objc_storeStrong((id *)&self->_actionUUID, 0);
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_actionUUID hash];
  uint64_t v4 = [(NSMutableArray *)self->_mediaProfiles hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_mediaPlaybackState;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSData *)self->_volume hash];
  return v6 ^ [(NSData *)self->_playbackArchive hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  actionUUID = self->_actionUUID;
  if ((unint64_t)actionUUID | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](actionUUID, "isEqual:")) {
      goto LABEL_15;
    }
  }
  mediaProfiles = self->_mediaProfiles;
  if ((unint64_t)mediaProfiles | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](mediaProfiles, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_mediaPlaybackState != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  volume = self->_volume;
  if ((unint64_t)volume | *((void *)v4 + 5) && !-[NSData isEqual:](volume, "isEqual:")) {
    goto LABEL_15;
  }
  playbackArchive = self->_playbackArchive;
  if ((unint64_t)playbackArchive | *((void *)v4 + 4)) {
    char v9 = -[NSData isEqual:](playbackArchive, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_actionUUID copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = self->_mediaProfiles;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (void)v19);
        -[HMPBMediaPlaybackAction addMediaProfiles:](v5, v13);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_mediaPlaybackState;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v14 = -[NSData copyWithZone:](self->_volume, "copyWithZone:", a3, (void)v19);
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  uint64_t v16 = [(NSData *)self->_playbackArchive copyWithZone:a3];
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  return (id)v5;
}

- (uint64_t)addMediaProfiles:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 24);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      uint64_t v5 = *(void **)(a1 + 24);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_actionUUID) {
    PBDataWriterWriteDataField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_mediaProfiles;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_volume) {
    PBDataWriterWriteDataField();
  }
  if (self->_playbackArchive) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMPBMediaPlaybackActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  actionUUID = self->_actionUUID;
  if (actionUUID) {
    [v3 setObject:actionUUID forKey:@"actionUUID"];
  }
  mediaProfiles = self->_mediaProfiles;
  if (mediaProfiles) {
    [v4 setObject:mediaProfiles forKey:@"mediaProfiles"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = [NSNumber numberWithInt:self->_mediaPlaybackState];
    [v4 setObject:v7 forKey:@"mediaPlaybackState"];
  }
  volume = self->_volume;
  if (volume) {
    [v4 setObject:volume forKey:@"volume"];
  }
  playbackArchive = self->_playbackArchive;
  if (playbackArchive) {
    [v4 setObject:playbackArchive forKey:@"playbackArchive"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMPBMediaPlaybackAction;
  id v4 = [(HMPBMediaPlaybackAction *)&v8 description];
  uint64_t v5 = [(HMPBMediaPlaybackAction *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end