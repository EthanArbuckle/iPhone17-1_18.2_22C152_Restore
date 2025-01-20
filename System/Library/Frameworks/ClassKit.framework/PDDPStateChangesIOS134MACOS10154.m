@interface PDDPStateChangesIOS134MACOS10154
- (BOOL)hasActivityState;
- (BOOL)hasHandoutState;
- (BOOL)hasMessageState;
- (BOOL)hasPersonalState;
- (BOOL)hasProgressState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDDPStateChangesIOS134MACOS10154ActivityDomainState)activityState;
- (PDDPStateChangesIOS134MACOS10154HandoutDomainState)handoutState;
- (PDDPStateChangesIOS134MACOS10154MessageDomainState)messageState;
- (PDDPStateChangesIOS134MACOS10154PersonalDomainState)personalState;
- (PDDPStateChangesIOS134MACOS10154ProgressDomainState)progressState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityState:(id)a3;
- (void)setHandoutState:(id)a3;
- (void)setMessageState:(id)a3;
- (void)setPersonalState:(id)a3;
- (void)setProgressState:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPStateChangesIOS134MACOS10154

- (BOOL)hasActivityState
{
  return self->_activityState != 0;
}

- (BOOL)hasProgressState
{
  return self->_progressState != 0;
}

- (BOOL)hasPersonalState
{
  return self->_personalState != 0;
}

- (BOOL)hasMessageState
{
  return self->_messageState != 0;
}

- (BOOL)hasHandoutState
{
  return self->_handoutState != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPStateChangesIOS134MACOS10154;
  v3 = [(PDDPStateChangesIOS134MACOS10154 *)&v7 description];
  v4 = [(PDDPStateChangesIOS134MACOS10154 *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  activityState = self->_activityState;
  if (activityState)
  {
    v5 = [(PDDPStateChangesIOS134MACOS10154ActivityDomainState *)activityState dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"activity_state"];
  }
  progressState = self->_progressState;
  if (progressState)
  {
    objc_super v7 = [(PDDPStateChangesIOS134MACOS10154ProgressDomainState *)progressState dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"progress_state"];
  }
  personalState = self->_personalState;
  if (personalState)
  {
    v9 = [(PDDPStateChangesIOS134MACOS10154PersonalDomainState *)personalState dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"personal_state"];
  }
  messageState = self->_messageState;
  if (messageState)
  {
    v11 = [(PDDPStateChangesIOS134MACOS10154MessageDomainState *)messageState dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"message_state"];
  }
  handoutState = self->_handoutState;
  if (handoutState)
  {
    v13 = [(PDDPStateChangesIOS134MACOS10154HandoutDomainState *)handoutState dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"handout_state"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                            + OBJC_IVAR___PBDataReader__length))
    return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  while (2)
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      if (v6++ >= 9)
      {
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v7 >> 3))
    {
      case 1u:
        v13 = objc_alloc_init(PDDPStateChangesIOS134MACOS10154ActivityDomainState);
        objc_storeStrong((id *)&self->_activityState, v13);
        if (PBReaderPlaceMark() && sub_1001314F8((uint64_t)v13, (uint64_t)a3)) {
          goto LABEL_34;
        }
        goto LABEL_37;
      case 2u:
        v13 = objc_alloc_init(PDDPStateChangesIOS134MACOS10154ProgressDomainState);
        objc_storeStrong((id *)&self->_progressState, v13);
        if (!PBReaderPlaceMark() || (sub_100154ECC((uint64_t)v13, (uint64_t)a3) & 1) == 0) {
          goto LABEL_37;
        }
        goto LABEL_34;
      case 3u:
        v13 = objc_alloc_init(PDDPStateChangesIOS134MACOS10154PersonalDomainState);
        objc_storeStrong((id *)&self->_personalState, v13);
        if (!PBReaderPlaceMark() || (sub_100168520((uint64_t)v13, (uint64_t)a3) & 1) == 0) {
          goto LABEL_37;
        }
        goto LABEL_34;
      case 4u:
        v13 = objc_alloc_init(PDDPStateChangesIOS134MACOS10154MessageDomainState);
        objc_storeStrong((id *)&self->_messageState, v13);
        if (!PBReaderPlaceMark() || (sub_100108588((uint64_t)v13, (uint64_t)a3) & 1) == 0) {
          goto LABEL_37;
        }
        goto LABEL_34;
      case 5u:
        v13 = objc_alloc_init(PDDPStateChangesIOS134MACOS10154HandoutDomainState);
        objc_storeStrong((id *)&self->_handoutState, v13);
        if (PBReaderPlaceMark() && sub_1000854C4((uint64_t)v13, (uint64_t)a3))
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_35:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
          continue;
        }
LABEL_37:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_35;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_activityState)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_progressState)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_personalState)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_messageState)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_handoutState)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_activityState)
  {
    objc_msgSend(v4, "setActivityState:");
    id v4 = v5;
  }
  if (self->_progressState)
  {
    objc_msgSend(v5, "setProgressState:");
    id v4 = v5;
  }
  if (self->_personalState)
  {
    objc_msgSend(v5, "setPersonalState:");
    id v4 = v5;
  }
  if (self->_messageState)
  {
    objc_msgSend(v5, "setMessageState:");
    id v4 = v5;
  }
  if (self->_handoutState)
  {
    objc_msgSend(v5, "setHandoutState:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PDDPStateChangesIOS134MACOS10154ActivityDomainState *)self->_activityState copyWithZone:a3];
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(PDDPStateChangesIOS134MACOS10154ProgressDomainState *)self->_progressState copyWithZone:a3];
  char v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = [(PDDPStateChangesIOS134MACOS10154PersonalDomainState *)self->_personalState copyWithZone:a3];
  int v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(PDDPStateChangesIOS134MACOS10154MessageDomainState *)self->_messageState copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  id v14 = [(PDDPStateChangesIOS134MACOS10154HandoutDomainState *)self->_handoutState copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((activityState = self->_activityState, !((unint64_t)activityState | v4[1]))
     || -[PDDPStateChangesIOS134MACOS10154ActivityDomainState isEqual:](activityState, "isEqual:"))
    && ((progressState = self->_progressState, !((unint64_t)progressState | v4[5]))
     || -[PDDPStateChangesIOS134MACOS10154ProgressDomainState isEqual:](progressState, "isEqual:"))
    && ((personalState = self->_personalState, !((unint64_t)personalState | v4[4]))
     || -[PDDPStateChangesIOS134MACOS10154PersonalDomainState isEqual:](personalState, "isEqual:"))
    && ((messageState = self->_messageState, !((unint64_t)messageState | v4[3]))
     || -[PDDPStateChangesIOS134MACOS10154MessageDomainState isEqual:](messageState, "isEqual:")))
  {
    handoutState = self->_handoutState;
    if ((unint64_t)handoutState | v4[2]) {
      unsigned __int8 v10 = -[PDDPStateChangesIOS134MACOS10154HandoutDomainState isEqual:](handoutState, "isEqual:");
    }
    else {
      unsigned __int8 v10 = 1;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDDPStateChangesIOS134MACOS10154ActivityDomainState *)self->_activityState hash];
  unint64_t v4 = [(PDDPStateChangesIOS134MACOS10154ProgressDomainState *)self->_progressState hash] ^ v3;
  unint64_t v5 = [(PDDPStateChangesIOS134MACOS10154PersonalDomainState *)self->_personalState hash];
  unint64_t v6 = v4 ^ v5 ^ [(PDDPStateChangesIOS134MACOS10154MessageDomainState *)self->_messageState hash];
  return v6 ^ [(PDDPStateChangesIOS134MACOS10154HandoutDomainState *)self->_handoutState hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  activityState = self->_activityState;
  v15 = v4;
  uint64_t v6 = v4[1];
  if (activityState)
  {
    if (v6) {
      -[PDDPStateChangesIOS134MACOS10154ActivityDomainState mergeFrom:](activityState, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPStateChangesIOS134MACOS10154 setActivityState:](self, "setActivityState:");
  }
  progressState = self->_progressState;
  uint64_t v8 = v15[5];
  if (progressState)
  {
    if (v8) {
      -[PDDPStateChangesIOS134MACOS10154ProgressDomainState mergeFrom:](progressState, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPStateChangesIOS134MACOS10154 setProgressState:](self, "setProgressState:");
  }
  personalState = self->_personalState;
  uint64_t v10 = v15[4];
  if (personalState)
  {
    if (v10) {
      -[PDDPStateChangesIOS134MACOS10154PersonalDomainState mergeFrom:](personalState, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[PDDPStateChangesIOS134MACOS10154 setPersonalState:](self, "setPersonalState:");
  }
  messageState = self->_messageState;
  uint64_t v12 = v15[3];
  if (messageState)
  {
    if (v12) {
      -[PDDPStateChangesIOS134MACOS10154MessageDomainState mergeFrom:](messageState, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[PDDPStateChangesIOS134MACOS10154 setMessageState:](self, "setMessageState:");
  }
  handoutState = self->_handoutState;
  uint64_t v14 = v15[2];
  if (handoutState)
  {
    if (v14) {
      -[PDDPStateChangesIOS134MACOS10154HandoutDomainState mergeFrom:](handoutState, "mergeFrom:");
    }
  }
  else if (v14)
  {
    [(PDDPStateChangesIOS134MACOS10154 *)self setHandoutState:"setHandoutState:"];
  }
}

- (PDDPStateChangesIOS134MACOS10154ActivityDomainState)activityState
{
  return self->_activityState;
}

- (void)setActivityState:(id)a3
{
}

- (PDDPStateChangesIOS134MACOS10154ProgressDomainState)progressState
{
  return self->_progressState;
}

- (void)setProgressState:(id)a3
{
}

- (PDDPStateChangesIOS134MACOS10154PersonalDomainState)personalState
{
  return self->_personalState;
}

- (void)setPersonalState:(id)a3
{
}

- (PDDPStateChangesIOS134MACOS10154MessageDomainState)messageState
{
  return self->_messageState;
}

- (void)setMessageState:(id)a3
{
}

- (PDDPStateChangesIOS134MACOS10154HandoutDomainState)handoutState
{
  return self->_handoutState;
}

- (void)setHandoutState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressState, 0);
  objc_storeStrong((id *)&self->_personalState, 0);
  objc_storeStrong((id *)&self->_messageState, 0);
  objc_storeStrong((id *)&self->_handoutState, 0);

  objc_storeStrong((id *)&self->_activityState, 0);
}

@end