@interface _MPCProtoRadioCreationProperties
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _MPCProtoRadioCreationProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seedContentReference, 0);
  objc_storeStrong((id *)&self->_radioStationURLString, 0);
  objc_storeStrong((id *)&self->_radioStationID, 0);
  objc_storeStrong((id *)&self->_playActivityQueueGroupingID, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);
  objc_storeStrong((id *)&self->_nowPlayingContentReference, 0);

  objc_storeStrong((id *)&self->_accountInfo, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_radioStationID hash];
  NSUInteger v4 = [(NSString *)self->_radioStationURLString hash] ^ v3;
  unint64_t v5 = [(_MPCProtoRadioContentReference *)self->_seedContentReference hash];
  unint64_t v6 = v4 ^ v5 ^ [(_MPCProtoRadioContentReference *)self->_nowPlayingContentReference hash];
  unint64_t v7 = [(_MPCProtoDelegateInfo *)self->_accountInfo hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_playActivityFeatureName hash];
  return v6 ^ v8 ^ [(NSString *)self->_playActivityQueueGroupingID hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((radioStationID = self->_radioStationID, !((unint64_t)radioStationID | v4[5]))
     || -[NSString isEqual:](radioStationID, "isEqual:"))
    && ((radioStationURLString = self->_radioStationURLString, !((unint64_t)radioStationURLString | v4[6]))
     || -[NSString isEqual:](radioStationURLString, "isEqual:"))
    && ((seedContentReference = self->_seedContentReference, !((unint64_t)seedContentReference | v4[7]))
     || -[_MPCProtoRadioContentReference isEqual:](seedContentReference, "isEqual:"))
    && ((nowPlayingContentReference = self->_nowPlayingContentReference,
         !((unint64_t)nowPlayingContentReference | v4[2]))
     || -[_MPCProtoRadioContentReference isEqual:](nowPlayingContentReference, "isEqual:"))
    && ((accountInfo = self->_accountInfo, !((unint64_t)accountInfo | v4[1]))
     || -[_MPCProtoDelegateInfo isEqual:](accountInfo, "isEqual:"))
    && ((playActivityFeatureName = self->_playActivityFeatureName, !((unint64_t)playActivityFeatureName | v4[3]))
     || -[NSString isEqual:](playActivityFeatureName, "isEqual:")))
  {
    playActivityQueueGroupingID = self->_playActivityQueueGroupingID;
    if ((unint64_t)playActivityQueueGroupingID | v4[4]) {
      char v12 = -[NSString isEqual:](playActivityQueueGroupingID, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_radioStationID copyWithZone:a3];
  unint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  uint64_t v8 = [(NSString *)self->_radioStationURLString copyWithZone:a3];
  v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = [(_MPCProtoRadioContentReference *)self->_seedContentReference copyWithZone:a3];
  v11 = (void *)v5[7];
  v5[7] = v10;

  id v12 = [(_MPCProtoRadioContentReference *)self->_nowPlayingContentReference copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  id v14 = [(_MPCProtoDelegateInfo *)self->_accountInfo copyWithZone:a3];
  v15 = (void *)v5[1];
  v5[1] = v14;

  uint64_t v16 = [(NSString *)self->_playActivityFeatureName copyWithZone:a3];
  v17 = (void *)v5[3];
  v5[3] = v16;

  uint64_t v18 = [(NSString *)self->_playActivityQueueGroupingID copyWithZone:a3];
  v19 = (void *)v5[4];
  v5[4] = v18;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_radioStationID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_radioStationURLString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_seedContentReference)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_nowPlayingContentReference)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_accountInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playActivityFeatureName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_playActivityQueueGroupingID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x263F62298];
  id v5 = (int *)MEMORY[0x263F62288];
  uint64_t v6 = (int *)MEMORY[0x263F62270];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x263F62298]) >= *(void *)((char *)a3 + (int)*MEMORY[0x263F62288])) {
    return *((unsigned char *)a3 + *v6) == 0;
  }
  uint64_t v8 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*((unsigned char *)a3 + *v6)) {
      return *((unsigned char *)a3 + *v6) == 0;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = *v4;
      unint64_t v13 = *(void *)((char *)a3 + v12);
      if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
      *(void *)((char *)a3 + v12) = v13 + 1;
      v11 |= (unint64_t)(v14 & 0x7F) << v9;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v9 += 7;
      if (v10++ >= 9)
      {
        unint64_t v11 = 0;
        int v16 = *((unsigned __int8 *)a3 + *v6);
        goto LABEL_14;
      }
    }
    *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
    int v16 = *((unsigned __int8 *)a3 + *v6);
    if (*((unsigned char *)a3 + *v6)) {
      unint64_t v11 = 0;
    }
LABEL_14:
    if (v16 || (v11 & 7) == 4) {
      return *((unsigned char *)a3 + *v6) == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        PBReaderReadString();
        uint64_t v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = 40;
        goto LABEL_33;
      case 2u:
        PBReaderReadString();
        uint64_t v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = 48;
        goto LABEL_33;
      case 3u:
        v20 = objc_alloc_init(_MPCProtoRadioContentReference);
        uint64_t v21 = 56;
        goto LABEL_25;
      case 4u:
        v20 = objc_alloc_init(_MPCProtoRadioContentReference);
        uint64_t v21 = 16;
LABEL_25:
        objc_storeStrong((id *)((char *)&self->super.super.isa + v21), v20);
        if (!PBReaderPlaceMark()
          || !_MPCProtoRadioContentReferenceReadFrom((id *)&v20->super.super.isa, (uint64_t)a3))
        {
          goto LABEL_38;
        }
        goto LABEL_30;
      case 5u:
        v20 = objc_alloc_init(_MPCProtoDelegateInfo);
        objc_storeStrong((id *)&self->_accountInfo, v20);
        if PBReaderPlaceMark() && (_MPCProtoDelegateInfoReadFrom((uint64_t)v20, (uint64_t)a3))
        {
LABEL_30:
          PBReaderRecallMark();
LABEL_34:

LABEL_35:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            return *((unsigned char *)a3 + *v6) == 0;
          }
          continue;
        }
LABEL_38:

        return 0;
      case 6u:
        PBReaderReadString();
        uint64_t v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = 24;
        goto LABEL_33;
      case 7u:
        PBReaderReadString();
        uint64_t v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = 32;
LABEL_33:
        v20 = *(_MPCProtoRadioContentReference **)((char *)&self->super.super.isa + v19);
        *(Class *)((char *)&self->super.super.isa + v19) = v18;
        goto LABEL_34;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_35;
    }
  }
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  radioStationID = self->_radioStationID;
  if (radioStationID) {
    [v3 setObject:radioStationID forKey:@"radioStationID"];
  }
  radioStationURLString = self->_radioStationURLString;
  if (radioStationURLString) {
    [v4 setObject:radioStationURLString forKey:@"radioStationURLString"];
  }
  seedContentReference = self->_seedContentReference;
  if (seedContentReference)
  {
    uint64_t v8 = [(_MPCProtoRadioContentReference *)seedContentReference dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"seedContentReference"];
  }
  nowPlayingContentReference = self->_nowPlayingContentReference;
  if (nowPlayingContentReference)
  {
    unsigned int v10 = [(_MPCProtoRadioContentReference *)nowPlayingContentReference dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"nowPlayingContentReference"];
  }
  accountInfo = self->_accountInfo;
  if (accountInfo)
  {
    uint64_t v12 = [(_MPCProtoDelegateInfo *)accountInfo dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"accountInfo"];
  }
  playActivityFeatureName = self->_playActivityFeatureName;
  if (playActivityFeatureName) {
    [v4 setObject:playActivityFeatureName forKey:@"playActivityFeatureName"];
  }
  playActivityQueueGroupingID = self->_playActivityQueueGroupingID;
  if (playActivityQueueGroupingID) {
    [v4 setObject:playActivityQueueGroupingID forKey:@"playActivityQueueGroupingID"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoRadioCreationProperties;
  id v4 = [(_MPCProtoRadioCreationProperties *)&v8 description];
  id v5 = [(_MPCProtoRadioCreationProperties *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end