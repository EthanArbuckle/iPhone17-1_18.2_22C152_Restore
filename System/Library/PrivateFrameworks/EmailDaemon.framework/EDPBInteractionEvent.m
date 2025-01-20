@interface EDPBInteractionEvent
- (BOOL)hasAppBackground;
- (BOOL)hasAppLaunch;
- (BOOL)hasAppResume;
- (BOOL)hasCategoryInferred;
- (BOOL)hasCategoryMarked;
- (BOOL)hasEventName;
- (BOOL)hasFlagChanged;
- (BOOL)hasForwardDraftStarted;
- (BOOL)hasForwardSent;
- (BOOL)hasLinkClicked;
- (BOOL)hasMarkedMuteThread;
- (BOOL)hasMessageCopied;
- (BOOL)hasMessageFetched;
- (BOOL)hasMessageMoved;
- (BOOL)hasMessageSent;
- (BOOL)hasMessageViewEnd;
- (BOOL)hasMessageViewStart;
- (BOOL)hasReadChanged;
- (BOOL)hasReplyDraftStarted;
- (BOOL)hasReplySent;
- (BOOL)hasSequenceNumber;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (EDPBInteractionEventAppBackground)appBackground;
- (EDPBInteractionEventAppLaunch)appLaunch;
- (EDPBInteractionEventAppResume)appResume;
- (EDPBInteractionEventCategoryInferred)categoryInferred;
- (EDPBInteractionEventCategoryMarked)categoryMarked;
- (EDPBInteractionEventFlagChanged)flagChanged;
- (EDPBInteractionEventForwardDraftStarted)forwardDraftStarted;
- (EDPBInteractionEventForwardSent)forwardSent;
- (EDPBInteractionEventLinkClicked)linkClicked;
- (EDPBInteractionEventMarkedMuteThread)markedMuteThread;
- (EDPBInteractionEventMessageCopied)messageCopied;
- (EDPBInteractionEventMessageFetched)messageFetched;
- (EDPBInteractionEventMessageMoved)messageMoved;
- (EDPBInteractionEventMessageSent)messageSent;
- (EDPBInteractionEventMessageViewEnd)messageViewEnd;
- (EDPBInteractionEventMessageViewStart)messageViewStart;
- (EDPBInteractionEventReadChanged)readChanged;
- (EDPBInteractionEventReplyDraftStarted)replyDraftStarted;
- (EDPBInteractionEventReplySent)replySent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ed_oneOfConcreteEvent;
- (id)eventNameAsString:(int)a3;
- (int)StringAsEventName:(id)a3;
- (int)eventName;
- (int)messageFrameType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)sequenceNumber;
- (void)copyTo:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppBackground:(id)a3;
- (void)setAppLaunch:(id)a3;
- (void)setAppResume:(id)a3;
- (void)setCategoryInferred:(id)a3;
- (void)setCategoryMarked:(id)a3;
- (void)setEventName:(int)a3;
- (void)setFlagChanged:(id)a3;
- (void)setForwardDraftStarted:(id)a3;
- (void)setForwardSent:(id)a3;
- (void)setHasEventName:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLinkClicked:(id)a3;
- (void)setMarkedMuteThread:(id)a3;
- (void)setMessageCopied:(id)a3;
- (void)setMessageFetched:(id)a3;
- (void)setMessageMoved:(id)a3;
- (void)setMessageSent:(id)a3;
- (void)setMessageViewEnd:(id)a3;
- (void)setMessageViewStart:(id)a3;
- (void)setReadChanged:(id)a3;
- (void)setReplyDraftStarted:(id)a3;
- (void)setReplySent:(id)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation EDPBInteractionEvent

- (int)messageFrameType
{
  return 1;
}

- (id)ed_oneOfConcreteEvent
{
  uint64_t v4 = [(EDPBInteractionEvent *)self eventName];
  switch((int)v4)
  {
    case 0:
    case 1:
    case 3:
    case 4:
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2, self, @"EDPBGeneratedExtensions.m", 232, @"INVALID event, we should not have reached this point" object file lineNumber description];

      uint64_t v4 = 0;
      break;
    case 2:
      uint64_t v4 = [(EDPBInteractionEvent *)self messageSent];
      break;
    case 5:
      uint64_t v4 = [(EDPBInteractionEvent *)self messageMoved];
      break;
    case 6:
      uint64_t v4 = [(EDPBInteractionEvent *)self messageCopied];
      break;
    case 7:
      uint64_t v4 = [(EDPBInteractionEvent *)self linkClicked];
      break;
    case 8:
      uint64_t v4 = [(EDPBInteractionEvent *)self appLaunch];
      break;
    case 9:
      uint64_t v4 = [(EDPBInteractionEvent *)self appBackground];
      break;
    case 10:
      uint64_t v4 = [(EDPBInteractionEvent *)self appResume];
      break;
    case 11:
      uint64_t v4 = [(EDPBInteractionEvent *)self flagChanged];
      break;
    case 12:
      uint64_t v4 = [(EDPBInteractionEvent *)self readChanged];
      break;
    case 13:
      uint64_t v4 = [(EDPBInteractionEvent *)self messageViewStart];
      break;
    case 14:
      uint64_t v4 = [(EDPBInteractionEvent *)self messageViewEnd];
      break;
    case 15:
      uint64_t v4 = [(EDPBInteractionEvent *)self replyDraftStarted];
      break;
    case 16:
      uint64_t v4 = [(EDPBInteractionEvent *)self forwardDraftStarted];
      break;
    case 17:
      uint64_t v4 = [(EDPBInteractionEvent *)self replySent];
      break;
    case 18:
      uint64_t v4 = [(EDPBInteractionEvent *)self forwardSent];
      break;
    case 19:
      uint64_t v4 = [(EDPBInteractionEvent *)self markedMuteThread];
      break;
    case 20:
      uint64_t v4 = [(EDPBInteractionEvent *)self categoryMarked];
      break;
    case 21:
      uint64_t v4 = [(EDPBInteractionEvent *)self categoryInferred];
      break;
    default:
      break;
  }

  return (id)v4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (_EDPBDataSettersDefinesMethod((char *)a3))
  {
    v5 = [(EDPBInteractionEvent *)self ed_oneOfConcreteEvent];
    unsigned __int8 v6 = objc_opt_respondsToSelector();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EDPBInteractionEvent;
    unsigned __int8 v6 = [(EDPBInteractionEvent *)&v8 respondsToSelector:a3];
  }
  return v6 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (_EDPBDataSettersDefinesMethod((char *)[v4 selector]))
  {
    v5 = [(EDPBInteractionEvent *)self ed_oneOfConcreteEvent];
    [v4 invokeWithTarget:v5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)EDPBInteractionEvent;
    [(EDPBInteractionEvent *)&v6 forwardInvocation:v4];
  }
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSequenceNumber
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)eventName
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_eventName;
  }
  else {
    return 0;
  }
}

- (void)setEventName:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventName = a3;
}

- (void)setHasEventName:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventName
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)eventNameAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C03E50[a3];
  }

  return v3;
}

- (int)StringAsEventName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"INVALID"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MESSAGE_FETCHED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MESSAGE_SENT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MESSAGE_LIST_DISPLAY_STARTED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MESSAGE_LIST_DISPLAY_ENDED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MESSAGE_MOVED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MESSAGE_COPIED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LINK_CLICKED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"APP_LAUNCH"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"APP_BACKGROUND"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"APP_RESUME"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"FLAG_CHANGED"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"READ_CHANGED"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MESSAGE_VIEW_START"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"MESSAGE_VIEW_END"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"REPLY_DRAFT_STARTED"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"FORWARD_DRAFT_STARTED"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"REPLY_SENT"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"FORWARD_SENT"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"MARKED_MUTE_THREAD"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"CATEGORY_MARKED"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"CATEGORY_INFERRED"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasMessageFetched
{
  return self->_messageFetched != 0;
}

- (BOOL)hasMessageSent
{
  return self->_messageSent != 0;
}

- (BOOL)hasMessageMoved
{
  return self->_messageMoved != 0;
}

- (BOOL)hasMessageCopied
{
  return self->_messageCopied != 0;
}

- (BOOL)hasLinkClicked
{
  return self->_linkClicked != 0;
}

- (BOOL)hasAppLaunch
{
  return self->_appLaunch != 0;
}

- (BOOL)hasAppBackground
{
  return self->_appBackground != 0;
}

- (BOOL)hasAppResume
{
  return self->_appResume != 0;
}

- (BOOL)hasFlagChanged
{
  return self->_flagChanged != 0;
}

- (BOOL)hasReadChanged
{
  return self->_readChanged != 0;
}

- (BOOL)hasMessageViewStart
{
  return self->_messageViewStart != 0;
}

- (BOOL)hasMessageViewEnd
{
  return self->_messageViewEnd != 0;
}

- (BOOL)hasReplyDraftStarted
{
  return self->_replyDraftStarted != 0;
}

- (BOOL)hasForwardDraftStarted
{
  return self->_forwardDraftStarted != 0;
}

- (BOOL)hasReplySent
{
  return self->_replySent != 0;
}

- (BOOL)hasForwardSent
{
  return self->_forwardSent != 0;
}

- (BOOL)hasMarkedMuteThread
{
  return self->_markedMuteThread != 0;
}

- (BOOL)hasCategoryMarked
{
  return self->_categoryMarked != 0;
}

- (BOOL)hasCategoryInferred
{
  return self->_categoryInferred != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EDPBInteractionEvent;
  int v4 = [(EDPBInteractionEvent *)&v8 description];
  v5 = [(EDPBInteractionEvent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = [NSNumber numberWithUnsignedInt:self->_sequenceNumber];
    [v3 setObject:v5 forKey:@"sequence_number"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v6 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v6 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t eventName = self->_eventName;
    if (eventName >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventName);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E6C03E50[eventName];
    }
    [v3 setObject:v8 forKey:@"event_name"];
  }
  messageFetched = self->_messageFetched;
  if (messageFetched)
  {
    v10 = [(EDPBInteractionEventMessageFetched *)messageFetched dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"message_fetched"];
  }
  messageSent = self->_messageSent;
  if (messageSent)
  {
    v12 = [(EDPBInteractionEventMessageSent *)messageSent dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"message_sent"];
  }
  messageMoved = self->_messageMoved;
  if (messageMoved)
  {
    v14 = [(EDPBInteractionEventMessageMoved *)messageMoved dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"message_moved"];
  }
  messageCopied = self->_messageCopied;
  if (messageCopied)
  {
    v16 = [(EDPBInteractionEventMessageCopied *)messageCopied dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"message_copied"];
  }
  linkClicked = self->_linkClicked;
  if (linkClicked)
  {
    v18 = [(EDPBInteractionEventLinkClicked *)linkClicked dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"link_clicked"];
  }
  appLaunch = self->_appLaunch;
  if (appLaunch)
  {
    v20 = [(EDPBInteractionEventAppLaunch *)appLaunch dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"app_launch"];
  }
  appBackground = self->_appBackground;
  if (appBackground)
  {
    v22 = [(EDPBInteractionEventAppBackground *)appBackground dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"app_background"];
  }
  appResume = self->_appResume;
  if (appResume)
  {
    v24 = [(EDPBInteractionEventAppResume *)appResume dictionaryRepresentation];
    [v3 setObject:v24 forKey:@"app_resume"];
  }
  flagChanged = self->_flagChanged;
  if (flagChanged)
  {
    v26 = [(EDPBInteractionEventFlagChanged *)flagChanged dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"flag_changed"];
  }
  readChanged = self->_readChanged;
  if (readChanged)
  {
    v28 = [(EDPBInteractionEventReadChanged *)readChanged dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"read_changed"];
  }
  messageViewStart = self->_messageViewStart;
  if (messageViewStart)
  {
    v30 = [(EDPBInteractionEventMessageViewStart *)messageViewStart dictionaryRepresentation];
    [v3 setObject:v30 forKey:@"message_view_start"];
  }
  messageViewEnd = self->_messageViewEnd;
  if (messageViewEnd)
  {
    v32 = [(EDPBInteractionEventMessageViewEnd *)messageViewEnd dictionaryRepresentation];
    [v3 setObject:v32 forKey:@"message_view_end"];
  }
  replyDraftStarted = self->_replyDraftStarted;
  if (replyDraftStarted)
  {
    v34 = [(EDPBInteractionEventReplyDraftStarted *)replyDraftStarted dictionaryRepresentation];
    [v3 setObject:v34 forKey:@"reply_draft_started"];
  }
  forwardDraftStarted = self->_forwardDraftStarted;
  if (forwardDraftStarted)
  {
    v36 = [(EDPBInteractionEventForwardDraftStarted *)forwardDraftStarted dictionaryRepresentation];
    [v3 setObject:v36 forKey:@"forward_draft_started"];
  }
  replySent = self->_replySent;
  if (replySent)
  {
    v38 = [(EDPBInteractionEventReplySent *)replySent dictionaryRepresentation];
    [v3 setObject:v38 forKey:@"reply_sent"];
  }
  forwardSent = self->_forwardSent;
  if (forwardSent)
  {
    v40 = [(EDPBInteractionEventForwardSent *)forwardSent dictionaryRepresentation];
    [v3 setObject:v40 forKey:@"forward_sent"];
  }
  markedMuteThread = self->_markedMuteThread;
  if (markedMuteThread)
  {
    v42 = [(EDPBInteractionEventMarkedMuteThread *)markedMuteThread dictionaryRepresentation];
    [v3 setObject:v42 forKey:@"marked_mute_thread"];
  }
  categoryMarked = self->_categoryMarked;
  if (categoryMarked)
  {
    v44 = [(EDPBInteractionEventCategoryMarked *)categoryMarked dictionaryRepresentation];
    [v3 setObject:v44 forKey:@"category_marked"];
  }
  categoryInferred = self->_categoryInferred;
  if (categoryInferred)
  {
    v46 = [(EDPBInteractionEventCategoryInferred *)categoryInferred dictionaryRepresentation];
    [v3 setObject:v46 forKey:@"category_inferred"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_messageFetched) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_messageSent) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_messageMoved) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_messageCopied) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkClicked) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appLaunch) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appBackground) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appResume) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_flagChanged) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_readChanged) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_messageViewStart) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_messageViewEnd) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_replyDraftStarted) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_forwardDraftStarted) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_replySent) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_forwardSent) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_markedMuteThread) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_categoryMarked) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_categoryInferred) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[44] = self->_sequenceNumber;
    *((unsigned char *)v5 + 180) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v5 + 1) = self->_timestamp;
  *((unsigned char *)v5 + 180) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5[14] = self->_eventName;
    *((unsigned char *)v5 + 180) |= 2u;
  }
LABEL_5:
  if (self->_messageFetched) {
    objc_msgSend(v5, "setMessageFetched:");
  }
  if (self->_messageSent) {
    objc_msgSend(v5, "setMessageSent:");
  }
  if (self->_messageMoved) {
    objc_msgSend(v5, "setMessageMoved:");
  }
  if (self->_messageCopied) {
    objc_msgSend(v5, "setMessageCopied:");
  }
  if (self->_linkClicked) {
    objc_msgSend(v5, "setLinkClicked:");
  }
  if (self->_appLaunch) {
    objc_msgSend(v5, "setAppLaunch:");
  }
  if (self->_appBackground) {
    objc_msgSend(v5, "setAppBackground:");
  }
  if (self->_appResume) {
    objc_msgSend(v5, "setAppResume:");
  }
  if (self->_flagChanged) {
    objc_msgSend(v5, "setFlagChanged:");
  }
  if (self->_readChanged) {
    objc_msgSend(v5, "setReadChanged:");
  }
  if (self->_messageViewStart) {
    objc_msgSend(v5, "setMessageViewStart:");
  }
  if (self->_messageViewEnd) {
    objc_msgSend(v5, "setMessageViewEnd:");
  }
  if (self->_replyDraftStarted) {
    objc_msgSend(v5, "setReplyDraftStarted:");
  }
  if (self->_forwardDraftStarted) {
    objc_msgSend(v5, "setForwardDraftStarted:");
  }
  if (self->_replySent) {
    objc_msgSend(v5, "setReplySent:");
  }
  if (self->_forwardSent) {
    objc_msgSend(v5, "setForwardSent:");
  }
  if (self->_markedMuteThread) {
    objc_msgSend(v5, "setMarkedMuteThread:");
  }
  if (self->_categoryMarked) {
    objc_msgSend(v5, "setCategoryMarked:");
  }
  if (self->_categoryInferred) {
    objc_msgSend(v5, "setCategoryInferred:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_super v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 180) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 176) = self->_sequenceNumber;
  *(unsigned char *)(v5 + 180) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 56) = self->_eventName;
    *(unsigned char *)(v5 + 180) |= 2u;
  }
LABEL_5:
  id v8 = [(EDPBInteractionEventMessageFetched *)self->_messageFetched copyWithZone:a3];
  v9 = (void *)v6[14];
  v6[14] = v8;

  id v10 = [(EDPBInteractionEventMessageSent *)self->_messageSent copyWithZone:a3];
  v11 = (void *)v6[16];
  v6[16] = v10;

  id v12 = [(EDPBInteractionEventMessageMoved *)self->_messageMoved copyWithZone:a3];
  v13 = (void *)v6[15];
  v6[15] = v12;

  id v14 = [(EDPBInteractionEventMessageCopied *)self->_messageCopied copyWithZone:a3];
  v15 = (void *)v6[13];
  v6[13] = v14;

  id v16 = [(EDPBInteractionEventLinkClicked *)self->_linkClicked copyWithZone:a3];
  v17 = (void *)v6[11];
  v6[11] = v16;

  id v18 = [(EDPBInteractionEventAppLaunch *)self->_appLaunch copyWithZone:a3];
  v19 = (void *)v6[3];
  v6[3] = v18;

  id v20 = [(EDPBInteractionEventAppBackground *)self->_appBackground copyWithZone:a3];
  v21 = (void *)v6[2];
  v6[2] = v20;

  id v22 = [(EDPBInteractionEventAppResume *)self->_appResume copyWithZone:a3];
  v23 = (void *)v6[4];
  v6[4] = v22;

  id v24 = [(EDPBInteractionEventFlagChanged *)self->_flagChanged copyWithZone:a3];
  v25 = (void *)v6[8];
  v6[8] = v24;

  id v26 = [(EDPBInteractionEventReadChanged *)self->_readChanged copyWithZone:a3];
  v27 = (void *)v6[19];
  v6[19] = v26;

  id v28 = [(EDPBInteractionEventMessageViewStart *)self->_messageViewStart copyWithZone:a3];
  v29 = (void *)v6[18];
  v6[18] = v28;

  id v30 = [(EDPBInteractionEventMessageViewEnd *)self->_messageViewEnd copyWithZone:a3];
  v31 = (void *)v6[17];
  v6[17] = v30;

  id v32 = [(EDPBInteractionEventReplyDraftStarted *)self->_replyDraftStarted copyWithZone:a3];
  v33 = (void *)v6[20];
  v6[20] = v32;

  id v34 = [(EDPBInteractionEventForwardDraftStarted *)self->_forwardDraftStarted copyWithZone:a3];
  v35 = (void *)v6[9];
  v6[9] = v34;

  id v36 = [(EDPBInteractionEventReplySent *)self->_replySent copyWithZone:a3];
  v37 = (void *)v6[21];
  v6[21] = v36;

  id v38 = [(EDPBInteractionEventForwardSent *)self->_forwardSent copyWithZone:a3];
  v39 = (void *)v6[10];
  v6[10] = v38;

  id v40 = [(EDPBInteractionEventMarkedMuteThread *)self->_markedMuteThread copyWithZone:a3];
  v41 = (void *)v6[12];
  v6[12] = v40;

  id v42 = [(EDPBInteractionEventCategoryMarked *)self->_categoryMarked copyWithZone:a3];
  v43 = (void *)v6[6];
  v6[6] = v42;

  id v44 = [(EDPBInteractionEventCategoryInferred *)self->_categoryInferred copyWithZone:a3];
  v45 = (void *)v6[5];
  v6[5] = v44;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_55;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 180) & 4) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 44)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 180) & 4) != 0)
  {
LABEL_55:
    char v24 = 0;
    goto LABEL_56;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 180) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_55;
    }
  }
  else if (*((unsigned char *)v4 + 180))
  {
    goto LABEL_55;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 180) & 2) == 0 || self->_eventName != *((_DWORD *)v4 + 14)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 180) & 2) != 0)
  {
    goto LABEL_55;
  }
  messageFetched = self->_messageFetched;
  if ((unint64_t)messageFetched | *((void *)v4 + 14)
    && !-[EDPBInteractionEventMessageFetched isEqual:](messageFetched, "isEqual:"))
  {
    goto LABEL_55;
  }
  messageSent = self->_messageSent;
  if ((unint64_t)messageSent | *((void *)v4 + 16))
  {
    if (!-[EDPBInteractionEventMessageSent isEqual:](messageSent, "isEqual:")) {
      goto LABEL_55;
    }
  }
  messageMoved = self->_messageMoved;
  if ((unint64_t)messageMoved | *((void *)v4 + 15))
  {
    if (!-[EDPBInteractionEventMessageMoved isEqual:](messageMoved, "isEqual:")) {
      goto LABEL_55;
    }
  }
  messageCopied = self->_messageCopied;
  if ((unint64_t)messageCopied | *((void *)v4 + 13))
  {
    if (!-[EDPBInteractionEventMessageCopied isEqual:](messageCopied, "isEqual:")) {
      goto LABEL_55;
    }
  }
  linkClicked = self->_linkClicked;
  if ((unint64_t)linkClicked | *((void *)v4 + 11))
  {
    if (!-[EDPBInteractionEventLinkClicked isEqual:](linkClicked, "isEqual:")) {
      goto LABEL_55;
    }
  }
  appLaunch = self->_appLaunch;
  if ((unint64_t)appLaunch | *((void *)v4 + 3))
  {
    if (!-[EDPBInteractionEventAppLaunch isEqual:](appLaunch, "isEqual:")) {
      goto LABEL_55;
    }
  }
  appBackground = self->_appBackground;
  if ((unint64_t)appBackground | *((void *)v4 + 2))
  {
    if (!-[EDPBInteractionEventAppBackground isEqual:](appBackground, "isEqual:")) {
      goto LABEL_55;
    }
  }
  appResume = self->_appResume;
  if ((unint64_t)appResume | *((void *)v4 + 4))
  {
    if (!-[EDPBInteractionEventAppResume isEqual:](appResume, "isEqual:")) {
      goto LABEL_55;
    }
  }
  flagChanged = self->_flagChanged;
  if ((unint64_t)flagChanged | *((void *)v4 + 8))
  {
    if (!-[EDPBInteractionEventFlagChanged isEqual:](flagChanged, "isEqual:")) {
      goto LABEL_55;
    }
  }
  readChanged = self->_readChanged;
  if ((unint64_t)readChanged | *((void *)v4 + 19))
  {
    if (!-[EDPBInteractionEventReadChanged isEqual:](readChanged, "isEqual:")) {
      goto LABEL_55;
    }
  }
  messageViewStart = self->_messageViewStart;
  if ((unint64_t)messageViewStart | *((void *)v4 + 18))
  {
    if (!-[EDPBInteractionEventMessageViewStart isEqual:](messageViewStart, "isEqual:")) {
      goto LABEL_55;
    }
  }
  messageViewEnd = self->_messageViewEnd;
  if ((unint64_t)messageViewEnd | *((void *)v4 + 17))
  {
    if (!-[EDPBInteractionEventMessageViewEnd isEqual:](messageViewEnd, "isEqual:")) {
      goto LABEL_55;
    }
  }
  replyDraftStarted = self->_replyDraftStarted;
  if ((unint64_t)replyDraftStarted | *((void *)v4 + 20))
  {
    if (!-[EDPBInteractionEventReplyDraftStarted isEqual:](replyDraftStarted, "isEqual:")) {
      goto LABEL_55;
    }
  }
  forwardDraftStarted = self->_forwardDraftStarted;
  if ((unint64_t)forwardDraftStarted | *((void *)v4 + 9))
  {
    if (!-[EDPBInteractionEventForwardDraftStarted isEqual:](forwardDraftStarted, "isEqual:")) {
      goto LABEL_55;
    }
  }
  replySent = self->_replySent;
  if ((unint64_t)replySent | *((void *)v4 + 21))
  {
    if (!-[EDPBInteractionEventReplySent isEqual:](replySent, "isEqual:")) {
      goto LABEL_55;
    }
  }
  forwardSent = self->_forwardSent;
  if ((unint64_t)forwardSent | *((void *)v4 + 10))
  {
    if (!-[EDPBInteractionEventForwardSent isEqual:](forwardSent, "isEqual:")) {
      goto LABEL_55;
    }
  }
  markedMuteThread = self->_markedMuteThread;
  if ((unint64_t)markedMuteThread | *((void *)v4 + 12))
  {
    if (!-[EDPBInteractionEventMarkedMuteThread isEqual:](markedMuteThread, "isEqual:")) {
      goto LABEL_55;
    }
  }
  categoryMarked = self->_categoryMarked;
  if ((unint64_t)categoryMarked | *((void *)v4 + 6))
  {
    if (!-[EDPBInteractionEventCategoryMarked isEqual:](categoryMarked, "isEqual:")) {
      goto LABEL_55;
    }
  }
  categoryInferred = self->_categoryInferred;
  if ((unint64_t)categoryInferred | *((void *)v4 + 5)) {
    char v24 = -[EDPBInteractionEventCategoryInferred isEqual:](categoryInferred, "isEqual:");
  }
  else {
    char v24 = 1;
  }
LABEL_56:

  return v24;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_sequenceNumber;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_eventName;
LABEL_8:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(EDPBInteractionEventMessageFetched *)self->_messageFetched hash];
  unint64_t v7 = [(EDPBInteractionEventMessageSent *)self->_messageSent hash];
  unint64_t v8 = v6 ^ v7 ^ [(EDPBInteractionEventMessageMoved *)self->_messageMoved hash];
  unint64_t v9 = [(EDPBInteractionEventMessageCopied *)self->_messageCopied hash];
  unint64_t v10 = v9 ^ [(EDPBInteractionEventLinkClicked *)self->_linkClicked hash];
  unint64_t v11 = v8 ^ v10 ^ [(EDPBInteractionEventAppLaunch *)self->_appLaunch hash];
  unint64_t v12 = [(EDPBInteractionEventAppBackground *)self->_appBackground hash];
  unint64_t v13 = v12 ^ [(EDPBInteractionEventAppResume *)self->_appResume hash];
  unint64_t v14 = v13 ^ [(EDPBInteractionEventFlagChanged *)self->_flagChanged hash];
  unint64_t v15 = v11 ^ v14 ^ [(EDPBInteractionEventReadChanged *)self->_readChanged hash];
  unint64_t v16 = [(EDPBInteractionEventMessageViewStart *)self->_messageViewStart hash];
  unint64_t v17 = v16 ^ [(EDPBInteractionEventMessageViewEnd *)self->_messageViewEnd hash];
  unint64_t v18 = v17 ^ [(EDPBInteractionEventReplyDraftStarted *)self->_replyDraftStarted hash];
  unint64_t v19 = v18 ^ [(EDPBInteractionEventForwardDraftStarted *)self->_forwardDraftStarted hash];
  unint64_t v20 = v15 ^ v19 ^ [(EDPBInteractionEventReplySent *)self->_replySent hash];
  unint64_t v21 = [(EDPBInteractionEventForwardSent *)self->_forwardSent hash];
  unint64_t v22 = v21 ^ [(EDPBInteractionEventMarkedMuteThread *)self->_markedMuteThread hash];
  unint64_t v23 = v22 ^ [(EDPBInteractionEventCategoryMarked *)self->_categoryMarked hash];
  return v20 ^ v23 ^ [(EDPBInteractionEventCategoryInferred *)self->_categoryInferred hash];
}

- (void)mergeFrom:(id)a3
{
  id v43 = a3;
  char v4 = *((unsigned char *)v43 + 180);
  if ((v4 & 4) != 0)
  {
    self->_sequenceNumber = *((_DWORD *)v43 + 44);
    *(unsigned char *)&self->_has |= 4u;
    char v4 = *((unsigned char *)v43 + 180);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v43 + 180) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_timestamp = *((void *)v43 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v43 + 180) & 2) != 0)
  {
LABEL_4:
    self->_uint64_t eventName = *((_DWORD *)v43 + 14);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  messageFetched = self->_messageFetched;
  uint64_t v6 = *((void *)v43 + 14);
  if (messageFetched)
  {
    if (v6) {
      -[EDPBInteractionEventMessageFetched mergeFrom:](messageFetched, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[EDPBInteractionEvent setMessageFetched:](self, "setMessageFetched:");
  }
  messageSent = self->_messageSent;
  uint64_t v8 = *((void *)v43 + 16);
  if (messageSent)
  {
    if (v8) {
      -[EDPBInteractionEventMessageSent mergeFrom:](messageSent, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[EDPBInteractionEvent setMessageSent:](self, "setMessageSent:");
  }
  messageMoved = self->_messageMoved;
  uint64_t v10 = *((void *)v43 + 15);
  if (messageMoved)
  {
    if (v10) {
      -[EDPBInteractionEventMessageMoved mergeFrom:](messageMoved, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[EDPBInteractionEvent setMessageMoved:](self, "setMessageMoved:");
  }
  messageCopied = self->_messageCopied;
  uint64_t v12 = *((void *)v43 + 13);
  if (messageCopied)
  {
    if (v12) {
      -[EDPBInteractionEventMessageCopied mergeFrom:](messageCopied, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[EDPBInteractionEvent setMessageCopied:](self, "setMessageCopied:");
  }
  linkClicked = self->_linkClicked;
  uint64_t v14 = *((void *)v43 + 11);
  if (linkClicked)
  {
    if (v14) {
      -[EDPBInteractionEventLinkClicked mergeFrom:](linkClicked, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[EDPBInteractionEvent setLinkClicked:](self, "setLinkClicked:");
  }
  appLaunch = self->_appLaunch;
  uint64_t v16 = *((void *)v43 + 3);
  if (appLaunch)
  {
    if (v16) {
      -[EDPBInteractionEventAppLaunch mergeFrom:](appLaunch, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[EDPBInteractionEvent setAppLaunch:](self, "setAppLaunch:");
  }
  appBackground = self->_appBackground;
  uint64_t v18 = *((void *)v43 + 2);
  if (appBackground)
  {
    if (v18) {
      -[EDPBInteractionEventAppBackground mergeFrom:](appBackground, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[EDPBInteractionEvent setAppBackground:](self, "setAppBackground:");
  }
  appResume = self->_appResume;
  uint64_t v20 = *((void *)v43 + 4);
  if (appResume)
  {
    if (v20) {
      -[EDPBInteractionEventAppResume mergeFrom:](appResume, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[EDPBInteractionEvent setAppResume:](self, "setAppResume:");
  }
  flagChanged = self->_flagChanged;
  uint64_t v22 = *((void *)v43 + 8);
  if (flagChanged)
  {
    if (v22) {
      -[EDPBInteractionEventFlagChanged mergeFrom:](flagChanged, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[EDPBInteractionEvent setFlagChanged:](self, "setFlagChanged:");
  }
  readChanged = self->_readChanged;
  uint64_t v24 = *((void *)v43 + 19);
  if (readChanged)
  {
    if (v24) {
      -[EDPBInteractionEventReadChanged mergeFrom:](readChanged, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[EDPBInteractionEvent setReadChanged:](self, "setReadChanged:");
  }
  messageViewStart = self->_messageViewStart;
  uint64_t v26 = *((void *)v43 + 18);
  if (messageViewStart)
  {
    if (v26) {
      -[EDPBInteractionEventMessageViewStart mergeFrom:](messageViewStart, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[EDPBInteractionEvent setMessageViewStart:](self, "setMessageViewStart:");
  }
  messageViewEnd = self->_messageViewEnd;
  uint64_t v28 = *((void *)v43 + 17);
  if (messageViewEnd)
  {
    if (v28) {
      -[EDPBInteractionEventMessageViewEnd mergeFrom:](messageViewEnd, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[EDPBInteractionEvent setMessageViewEnd:](self, "setMessageViewEnd:");
  }
  replyDraftStarted = self->_replyDraftStarted;
  uint64_t v30 = *((void *)v43 + 20);
  if (replyDraftStarted)
  {
    if (v30) {
      -[EDPBInteractionEventReplyDraftStarted mergeFrom:](replyDraftStarted, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[EDPBInteractionEvent setReplyDraftStarted:](self, "setReplyDraftStarted:");
  }
  forwardDraftStarted = self->_forwardDraftStarted;
  uint64_t v32 = *((void *)v43 + 9);
  if (forwardDraftStarted)
  {
    if (v32) {
      -[EDPBInteractionEventForwardDraftStarted mergeFrom:](forwardDraftStarted, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[EDPBInteractionEvent setForwardDraftStarted:](self, "setForwardDraftStarted:");
  }
  replySent = self->_replySent;
  uint64_t v34 = *((void *)v43 + 21);
  if (replySent)
  {
    if (v34) {
      -[EDPBInteractionEventReplySent mergeFrom:](replySent, "mergeFrom:");
    }
  }
  else if (v34)
  {
    -[EDPBInteractionEvent setReplySent:](self, "setReplySent:");
  }
  forwardSent = self->_forwardSent;
  uint64_t v36 = *((void *)v43 + 10);
  if (forwardSent)
  {
    if (v36) {
      -[EDPBInteractionEventForwardSent mergeFrom:](forwardSent, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[EDPBInteractionEvent setForwardSent:](self, "setForwardSent:");
  }
  markedMuteThread = self->_markedMuteThread;
  uint64_t v38 = *((void *)v43 + 12);
  if (markedMuteThread)
  {
    if (v38) {
      -[EDPBInteractionEventMarkedMuteThread mergeFrom:](markedMuteThread, "mergeFrom:");
    }
  }
  else if (v38)
  {
    -[EDPBInteractionEvent setMarkedMuteThread:](self, "setMarkedMuteThread:");
  }
  categoryMarked = self->_categoryMarked;
  uint64_t v40 = *((void *)v43 + 6);
  if (categoryMarked)
  {
    if (v40) {
      -[EDPBInteractionEventCategoryMarked mergeFrom:](categoryMarked, "mergeFrom:");
    }
  }
  else if (v40)
  {
    -[EDPBInteractionEvent setCategoryMarked:](self, "setCategoryMarked:");
  }
  categoryInferred = self->_categoryInferred;
  uint64_t v42 = *((void *)v43 + 5);
  if (categoryInferred)
  {
    if (v42) {
      -[EDPBInteractionEventCategoryInferred mergeFrom:](categoryInferred, "mergeFrom:");
    }
  }
  else if (v42)
  {
    -[EDPBInteractionEvent setCategoryInferred:](self, "setCategoryInferred:");
  }
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (EDPBInteractionEventMessageFetched)messageFetched
{
  return self->_messageFetched;
}

- (void)setMessageFetched:(id)a3
{
}

- (EDPBInteractionEventMessageSent)messageSent
{
  return self->_messageSent;
}

- (void)setMessageSent:(id)a3
{
}

- (EDPBInteractionEventMessageMoved)messageMoved
{
  return self->_messageMoved;
}

- (void)setMessageMoved:(id)a3
{
}

- (EDPBInteractionEventMessageCopied)messageCopied
{
  return self->_messageCopied;
}

- (void)setMessageCopied:(id)a3
{
}

- (EDPBInteractionEventLinkClicked)linkClicked
{
  return self->_linkClicked;
}

- (void)setLinkClicked:(id)a3
{
}

- (EDPBInteractionEventAppLaunch)appLaunch
{
  return self->_appLaunch;
}

- (void)setAppLaunch:(id)a3
{
}

- (EDPBInteractionEventAppBackground)appBackground
{
  return self->_appBackground;
}

- (void)setAppBackground:(id)a3
{
}

- (EDPBInteractionEventAppResume)appResume
{
  return self->_appResume;
}

- (void)setAppResume:(id)a3
{
}

- (EDPBInteractionEventFlagChanged)flagChanged
{
  return self->_flagChanged;
}

- (void)setFlagChanged:(id)a3
{
}

- (EDPBInteractionEventReadChanged)readChanged
{
  return self->_readChanged;
}

- (void)setReadChanged:(id)a3
{
}

- (EDPBInteractionEventMessageViewStart)messageViewStart
{
  return self->_messageViewStart;
}

- (void)setMessageViewStart:(id)a3
{
}

- (EDPBInteractionEventMessageViewEnd)messageViewEnd
{
  return self->_messageViewEnd;
}

- (void)setMessageViewEnd:(id)a3
{
}

- (EDPBInteractionEventReplyDraftStarted)replyDraftStarted
{
  return self->_replyDraftStarted;
}

- (void)setReplyDraftStarted:(id)a3
{
}

- (EDPBInteractionEventForwardDraftStarted)forwardDraftStarted
{
  return self->_forwardDraftStarted;
}

- (void)setForwardDraftStarted:(id)a3
{
}

- (EDPBInteractionEventReplySent)replySent
{
  return self->_replySent;
}

- (void)setReplySent:(id)a3
{
}

- (EDPBInteractionEventForwardSent)forwardSent
{
  return self->_forwardSent;
}

- (void)setForwardSent:(id)a3
{
}

- (EDPBInteractionEventMarkedMuteThread)markedMuteThread
{
  return self->_markedMuteThread;
}

- (void)setMarkedMuteThread:(id)a3
{
}

- (EDPBInteractionEventCategoryMarked)categoryMarked
{
  return self->_categoryMarked;
}

- (void)setCategoryMarked:(id)a3
{
}

- (EDPBInteractionEventCategoryInferred)categoryInferred
{
  return self->_categoryInferred;
}

- (void)setCategoryInferred:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replySent, 0);
  objc_storeStrong((id *)&self->_replyDraftStarted, 0);
  objc_storeStrong((id *)&self->_readChanged, 0);
  objc_storeStrong((id *)&self->_messageViewStart, 0);
  objc_storeStrong((id *)&self->_messageViewEnd, 0);
  objc_storeStrong((id *)&self->_messageSent, 0);
  objc_storeStrong((id *)&self->_messageMoved, 0);
  objc_storeStrong((id *)&self->_messageFetched, 0);
  objc_storeStrong((id *)&self->_messageCopied, 0);
  objc_storeStrong((id *)&self->_markedMuteThread, 0);
  objc_storeStrong((id *)&self->_linkClicked, 0);
  objc_storeStrong((id *)&self->_forwardSent, 0);
  objc_storeStrong((id *)&self->_forwardDraftStarted, 0);
  objc_storeStrong((id *)&self->_flagChanged, 0);
  objc_storeStrong((id *)&self->_categoryMarked, 0);
  objc_storeStrong((id *)&self->_categoryInferred, 0);
  objc_storeStrong((id *)&self->_appResume, 0);
  objc_storeStrong((id *)&self->_appLaunch, 0);

  objc_storeStrong((id *)&self->_appBackground, 0);
}

@end