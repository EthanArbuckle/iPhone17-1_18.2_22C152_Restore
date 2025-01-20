@interface HDCodableSharingSetupMetadata
+ (Class)invitationTokenType;
- (BOOL)hasOwnerCloudKitEmailAddress;
- (BOOL)hasOwnerParticipant;
- (BOOL)hasShareParticipant;
- (BOOL)hasSourceProfileIdentifier;
- (BOOL)hasSyncCircleIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)ownerParticipant;
- (NSData)shareParticipant;
- (NSData)sourceProfileIdentifier;
- (NSMutableArray)invitationTokens;
- (NSString)ownerCloudKitEmailAddress;
- (NSString)syncCircleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)invitationTokenAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)invitationTokensCount;
- (void)addInvitationToken:(id)a3;
- (void)clearInvitationTokens;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInvitationTokens:(id)a3;
- (void)setOwnerCloudKitEmailAddress:(id)a3;
- (void)setOwnerParticipant:(id)a3;
- (void)setShareParticipant:(id)a3;
- (void)setSourceProfileIdentifier:(id)a3;
- (void)setSyncCircleIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSharingSetupMetadata

- (BOOL)hasSyncCircleIdentifier
{
  return self->_syncCircleIdentifier != 0;
}

- (BOOL)hasOwnerParticipant
{
  return self->_ownerParticipant != 0;
}

- (BOOL)hasSourceProfileIdentifier
{
  return self->_sourceProfileIdentifier != 0;
}

- (BOOL)hasShareParticipant
{
  return self->_shareParticipant != 0;
}

- (BOOL)hasOwnerCloudKitEmailAddress
{
  return self->_ownerCloudKitEmailAddress != 0;
}

- (void)clearInvitationTokens
{
}

- (void)addInvitationToken:(id)a3
{
  id v4 = a3;
  invitationTokens = self->_invitationTokens;
  id v8 = v4;
  if (!invitationTokens)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_invitationTokens;
    self->_invitationTokens = v6;

    id v4 = v8;
    invitationTokens = self->_invitationTokens;
  }
  [(NSMutableArray *)invitationTokens addObject:v4];
}

- (unint64_t)invitationTokensCount
{
  return [(NSMutableArray *)self->_invitationTokens count];
}

- (id)invitationTokenAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_invitationTokens objectAtIndex:a3];
}

+ (Class)invitationTokenType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSharingSetupMetadata;
  id v4 = [(HDCodableSharingSetupMetadata *)&v8 description];
  v5 = [(HDCodableSharingSetupMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  syncCircleIdentifier = self->_syncCircleIdentifier;
  if (syncCircleIdentifier) {
    [v3 setObject:syncCircleIdentifier forKey:@"syncCircleIdentifier"];
  }
  ownerParticipant = self->_ownerParticipant;
  if (ownerParticipant) {
    [v4 setObject:ownerParticipant forKey:@"ownerParticipant"];
  }
  sourceProfileIdentifier = self->_sourceProfileIdentifier;
  if (sourceProfileIdentifier) {
    [v4 setObject:sourceProfileIdentifier forKey:@"sourceProfileIdentifier"];
  }
  shareParticipant = self->_shareParticipant;
  if (shareParticipant) {
    [v4 setObject:shareParticipant forKey:@"shareParticipant"];
  }
  ownerCloudKitEmailAddress = self->_ownerCloudKitEmailAddress;
  if (ownerCloudKitEmailAddress) {
    [v4 setObject:ownerCloudKitEmailAddress forKey:@"ownerCloudKitEmailAddress"];
  }
  if ([(NSMutableArray *)self->_invitationTokens count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_invitationTokens, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = self->_invitationTokens;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"invitationToken"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSharingSetupMetadataReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_syncCircleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_ownerParticipant) {
    PBDataWriterWriteDataField();
  }
  if (self->_sourceProfileIdentifier) {
    PBDataWriterWriteDataField();
  }
  if (self->_shareParticipant) {
    PBDataWriterWriteDataField();
  }
  if (self->_ownerCloudKitEmailAddress) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_invitationTokens;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_syncCircleIdentifier) {
    objc_msgSend(v8, "setSyncCircleIdentifier:");
  }
  if (self->_ownerParticipant) {
    objc_msgSend(v8, "setOwnerParticipant:");
  }
  if (self->_sourceProfileIdentifier) {
    objc_msgSend(v8, "setSourceProfileIdentifier:");
  }
  if (self->_shareParticipant) {
    objc_msgSend(v8, "setShareParticipant:");
  }
  if (self->_ownerCloudKitEmailAddress) {
    objc_msgSend(v8, "setOwnerCloudKitEmailAddress:");
  }
  if ([(HDCodableSharingSetupMetadata *)self invitationTokensCount])
  {
    [v8 clearInvitationTokens];
    unint64_t v4 = [(HDCodableSharingSetupMetadata *)self invitationTokensCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableSharingSetupMetadata *)self invitationTokenAtIndex:i];
        [v8 addInvitationToken:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_syncCircleIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[6];
  v5[6] = v6;

  uint64_t v8 = [(NSData *)self->_ownerParticipant copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSData *)self->_sourceProfileIdentifier copyWithZone:a3];
  long long v11 = (void *)v5[5];
  v5[5] = v10;

  uint64_t v12 = [(NSData *)self->_shareParticipant copyWithZone:a3];
  long long v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_ownerCloudKitEmailAddress copyWithZone:a3];
  uint64_t v15 = (void *)v5[2];
  v5[2] = v14;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_invitationTokens;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (void)v23);
        [v5 addInvitationToken:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((syncCircleIdentifier = self->_syncCircleIdentifier, !((unint64_t)syncCircleIdentifier | v4[6]))
     || -[NSString isEqual:](syncCircleIdentifier, "isEqual:"))
    && ((ownerParticipant = self->_ownerParticipant, !((unint64_t)ownerParticipant | v4[3]))
     || -[NSData isEqual:](ownerParticipant, "isEqual:"))
    && ((sourceProfileIdentifier = self->_sourceProfileIdentifier, !((unint64_t)sourceProfileIdentifier | v4[5]))
     || -[NSData isEqual:](sourceProfileIdentifier, "isEqual:"))
    && ((shareParticipant = self->_shareParticipant, !((unint64_t)shareParticipant | v4[4]))
     || -[NSData isEqual:](shareParticipant, "isEqual:"))
    && ((ownerCloudKitEmailAddress = self->_ownerCloudKitEmailAddress,
         !((unint64_t)ownerCloudKitEmailAddress | v4[2]))
     || -[NSString isEqual:](ownerCloudKitEmailAddress, "isEqual:")))
  {
    invitationTokens = self->_invitationTokens;
    if ((unint64_t)invitationTokens | v4[1]) {
      char v11 = -[NSMutableArray isEqual:](invitationTokens, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_syncCircleIdentifier hash];
  uint64_t v4 = [(NSData *)self->_ownerParticipant hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_sourceProfileIdentifier hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_shareParticipant hash];
  NSUInteger v7 = [(NSString *)self->_ownerCloudKitEmailAddress hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_invitationTokens hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[HDCodableSharingSetupMetadata setSyncCircleIdentifier:](self, "setSyncCircleIdentifier:");
  }
  if (*((void *)v4 + 3)) {
    -[HDCodableSharingSetupMetadata setOwnerParticipant:](self, "setOwnerParticipant:");
  }
  if (*((void *)v4 + 5)) {
    -[HDCodableSharingSetupMetadata setSourceProfileIdentifier:](self, "setSourceProfileIdentifier:");
  }
  if (*((void *)v4 + 4)) {
    -[HDCodableSharingSetupMetadata setShareParticipant:](self, "setShareParticipant:");
  }
  if (*((void *)v4 + 2)) {
    -[HDCodableSharingSetupMetadata setOwnerCloudKitEmailAddress:](self, "setOwnerCloudKitEmailAddress:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HDCodableSharingSetupMetadata addInvitationToken:](self, "addInvitationToken:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)syncCircleIdentifier
{
  return self->_syncCircleIdentifier;
}

- (void)setSyncCircleIdentifier:(id)a3
{
}

- (NSData)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void)setOwnerParticipant:(id)a3
{
}

- (NSData)sourceProfileIdentifier
{
  return self->_sourceProfileIdentifier;
}

- (void)setSourceProfileIdentifier:(id)a3
{
}

- (NSData)shareParticipant
{
  return self->_shareParticipant;
}

- (void)setShareParticipant:(id)a3
{
}

- (NSString)ownerCloudKitEmailAddress
{
  return self->_ownerCloudKitEmailAddress;
}

- (void)setOwnerCloudKitEmailAddress:(id)a3
{
}

- (NSMutableArray)invitationTokens
{
  return self->_invitationTokens;
}

- (void)setInvitationTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncCircleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_shareParticipant, 0);
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_ownerCloudKitEmailAddress, 0);

  objc_storeStrong((id *)&self->_invitationTokens, 0);
}

@end