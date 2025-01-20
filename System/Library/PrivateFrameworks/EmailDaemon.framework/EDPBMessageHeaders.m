@interface EDPBMessageHeaders
- (BOOL)bccIsVipAtIndex:(unint64_t)a3;
- (BOOL)bccIsVips;
- (BOOL)ccIsVipAtIndex:(unint64_t)a3;
- (BOOL)ccIsVips;
- (BOOL)hasDateReceived;
- (BOOL)hasListId;
- (BOOL)hasMessageIsForwarded;
- (BOOL)hasMessageIsReply;
- (BOOL)hasSender;
- (BOOL)hasSenderContactId;
- (BOOL)hasSenderDomain;
- (BOOL)hasSenderIsVip;
- (BOOL)hasUserIsBcc;
- (BOOL)hasUserIsCc;
- (BOOL)hasUserIsSender;
- (BOOL)hasUserIsTo;
- (BOOL)isEqual:(id)a3;
- (BOOL)messageIsForwarded;
- (BOOL)messageIsReply;
- (BOOL)readFrom:(id)a3;
- (BOOL)senderIsVip;
- (BOOL)toIsVipAtIndex:(unint64_t)a3;
- (BOOL)toIsVips;
- (BOOL)userIsBcc;
- (BOOL)userIsCc;
- (BOOL)userIsSender;
- (BOOL)userIsTo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)bccAddress;
- (int64_t)bccAddressAtIndex:(unint64_t)a3;
- (int64_t)bccContactIdAtIndex:(unint64_t)a3;
- (int64_t)bccContactIds;
- (int64_t)bccDomainAtIndex:(unint64_t)a3;
- (int64_t)bccDomains;
- (int64_t)ccAddress;
- (int64_t)ccAddressAtIndex:(unint64_t)a3;
- (int64_t)ccContactIdAtIndex:(unint64_t)a3;
- (int64_t)ccContactIds;
- (int64_t)ccDomainAtIndex:(unint64_t)a3;
- (int64_t)ccDomains;
- (int64_t)listId;
- (int64_t)references;
- (int64_t)referencesAtIndex:(unint64_t)a3;
- (int64_t)sender;
- (int64_t)senderContactId;
- (int64_t)senderDomain;
- (int64_t)subjectWords;
- (int64_t)subjectWordsAtIndex:(unint64_t)a3;
- (int64_t)toAddress;
- (int64_t)toAddressAtIndex:(unint64_t)a3;
- (int64_t)toContactIdAtIndex:(unint64_t)a3;
- (int64_t)toContactIds;
- (int64_t)toDomainAtIndex:(unint64_t)a3;
- (int64_t)toDomains;
- (unint64_t)bccAddressCount;
- (unint64_t)bccContactIdsCount;
- (unint64_t)bccDomainsCount;
- (unint64_t)bccIsVipsCount;
- (unint64_t)ccAddressCount;
- (unint64_t)ccContactIdsCount;
- (unint64_t)ccDomainsCount;
- (unint64_t)ccIsVipsCount;
- (unint64_t)dateReceived;
- (unint64_t)hash;
- (unint64_t)referencesCount;
- (unint64_t)subjectWordsCount;
- (unint64_t)toAddressCount;
- (unint64_t)toContactIdsCount;
- (unint64_t)toDomainsCount;
- (unint64_t)toIsVipsCount;
- (void)addBccAddress:(int64_t)a3;
- (void)addBccContactId:(int64_t)a3;
- (void)addBccDomain:(int64_t)a3;
- (void)addBccIsVip:(BOOL)a3;
- (void)addCcAddress:(int64_t)a3;
- (void)addCcContactId:(int64_t)a3;
- (void)addCcDomain:(int64_t)a3;
- (void)addCcIsVip:(BOOL)a3;
- (void)addReferences:(int64_t)a3;
- (void)addSubjectWords:(int64_t)a3;
- (void)addToAddress:(int64_t)a3;
- (void)addToContactId:(int64_t)a3;
- (void)addToDomain:(int64_t)a3;
- (void)addToIsVip:(BOOL)a3;
- (void)clearBccAddress;
- (void)clearBccContactIds;
- (void)clearBccDomains;
- (void)clearBccIsVips;
- (void)clearCcAddress;
- (void)clearCcContactIds;
- (void)clearCcDomains;
- (void)clearCcIsVips;
- (void)clearReferences;
- (void)clearSubjectWords;
- (void)clearToAddress;
- (void)clearToContactIds;
- (void)clearToDomains;
- (void)clearToIsVips;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBccAddress:(int64_t *)a3 count:(unint64_t)a4;
- (void)setBccContactIds:(int64_t *)a3 count:(unint64_t)a4;
- (void)setBccDomains:(int64_t *)a3 count:(unint64_t)a4;
- (void)setBccIsVips:(BOOL *)a3 count:(unint64_t)a4;
- (void)setCcAddress:(int64_t *)a3 count:(unint64_t)a4;
- (void)setCcContactIds:(int64_t *)a3 count:(unint64_t)a4;
- (void)setCcDomains:(int64_t *)a3 count:(unint64_t)a4;
- (void)setCcIsVips:(BOOL *)a3 count:(unint64_t)a4;
- (void)setDateReceived:(unint64_t)a3;
- (void)setHasDateReceived:(BOOL)a3;
- (void)setHasListId:(BOOL)a3;
- (void)setHasMessageIsForwarded:(BOOL)a3;
- (void)setHasMessageIsReply:(BOOL)a3;
- (void)setHasSender:(BOOL)a3;
- (void)setHasSenderContactId:(BOOL)a3;
- (void)setHasSenderDomain:(BOOL)a3;
- (void)setHasSenderIsVip:(BOOL)a3;
- (void)setHasUserIsBcc:(BOOL)a3;
- (void)setHasUserIsCc:(BOOL)a3;
- (void)setHasUserIsSender:(BOOL)a3;
- (void)setHasUserIsTo:(BOOL)a3;
- (void)setListId:(int64_t)a3;
- (void)setMessageIsForwarded:(BOOL)a3;
- (void)setMessageIsReply:(BOOL)a3;
- (void)setReferences:(int64_t *)a3 count:(unint64_t)a4;
- (void)setSender:(int64_t)a3;
- (void)setSenderContactId:(int64_t)a3;
- (void)setSenderDomain:(int64_t)a3;
- (void)setSenderIsVip:(BOOL)a3;
- (void)setSubjectWords:(int64_t *)a3 count:(unint64_t)a4;
- (void)setToAddress:(int64_t *)a3 count:(unint64_t)a4;
- (void)setToContactIds:(int64_t *)a3 count:(unint64_t)a4;
- (void)setToDomains:(int64_t *)a3 count:(unint64_t)a4;
- (void)setToIsVips:(BOOL *)a3 count:(unint64_t)a4;
- (void)setUserIsBcc:(BOOL)a3;
- (void)setUserIsCc:(BOOL)a3;
- (void)setUserIsSender:(BOOL)a3;
- (void)setUserIsTo:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation EDPBMessageHeaders

- (void)dealloc
{
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedBOOLClear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedBOOLClear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedBOOLClear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)EDPBMessageHeaders;
  [(EDPBMessageHeaders *)&v3 dealloc];
}

- (void)setSender:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_sender = a3;
}

- (void)setHasSender:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSender
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSenderDomain:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_senderDomain = a3;
}

- (void)setHasSenderDomain:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSenderDomain
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSenderIsVip:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_senderIsVip = a3;
}

- (void)setHasSenderIsVip:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSenderIsVip
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSenderContactId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_senderContactId = a3;
}

- (void)setHasSenderContactId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSenderContactId
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setUserIsSender:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_userIsSender = a3;
}

- (void)setHasUserIsSender:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUserIsSender
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (unint64_t)subjectWordsCount
{
  return self->_subjectWords.count;
}

- (int64_t)subjectWords
{
  return self->_subjectWords.list;
}

- (void)clearSubjectWords
{
}

- (void)addSubjectWords:(int64_t)a3
{
}

- (int64_t)subjectWordsAtIndex:(unint64_t)a3
{
  p_subjectWords = &self->_subjectWords;
  unint64_t count = self->_subjectWords.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_subjectWords->list[a3];
}

- (void)setSubjectWords:(int64_t *)a3 count:(unint64_t)a4
{
}

- (void)setMessageIsReply:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_messageIsReply = a3;
}

- (void)setHasMessageIsReply:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMessageIsReply
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMessageIsForwarded:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_messageIsForwarded = a3;
}

- (void)setHasMessageIsForwarded:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMessageIsForwarded
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setUserIsTo:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_userIsTo = a3;
}

- (void)setHasUserIsTo:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUserIsTo
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setUserIsCc:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_userIsCc = a3;
}

- (void)setHasUserIsCc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasUserIsCc
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setUserIsBcc:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_userIsBcc = a3;
}

- (void)setHasUserIsBcc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUserIsBcc
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setDateReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_dateReceived = a3;
}

- (void)setHasDateReceived:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDateReceived
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setListId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_listId = a3;
}

- (void)setHasListId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasListId
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (unint64_t)referencesCount
{
  return self->_references.count;
}

- (int64_t)references
{
  return self->_references.list;
}

- (void)clearReferences
{
}

- (void)addReferences:(int64_t)a3
{
}

- (int64_t)referencesAtIndex:(unint64_t)a3
{
  p_references = &self->_references;
  unint64_t count = self->_references.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_references->list[a3];
}

- (void)setReferences:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)toAddressCount
{
  return self->_toAddress.count;
}

- (int64_t)toAddress
{
  return self->_toAddress.list;
}

- (void)clearToAddress
{
}

- (void)addToAddress:(int64_t)a3
{
}

- (int64_t)toAddressAtIndex:(unint64_t)a3
{
  p_toAddress = &self->_toAddress;
  unint64_t count = self->_toAddress.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_toAddress->list[a3];
}

- (void)setToAddress:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)toDomainsCount
{
  return self->_toDomains.count;
}

- (int64_t)toDomains
{
  return self->_toDomains.list;
}

- (void)clearToDomains
{
}

- (void)addToDomain:(int64_t)a3
{
}

- (int64_t)toDomainAtIndex:(unint64_t)a3
{
  p_toDomains = &self->_toDomains;
  unint64_t count = self->_toDomains.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_toDomains->list[a3];
}

- (void)setToDomains:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)toIsVipsCount
{
  return self->_toIsVips.count;
}

- (BOOL)toIsVips
{
  return self->_toIsVips.list;
}

- (void)clearToIsVips
{
}

- (void)addToIsVip:(BOOL)a3
{
}

- (BOOL)toIsVipAtIndex:(unint64_t)a3
{
  p_toIsVips = &self->_toIsVips;
  unint64_t count = self->_toIsVips.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_toIsVips->list[a3];
}

- (void)setToIsVips:(BOOL *)a3 count:(unint64_t)a4
{
}

- (unint64_t)toContactIdsCount
{
  return self->_toContactIds.count;
}

- (int64_t)toContactIds
{
  return self->_toContactIds.list;
}

- (void)clearToContactIds
{
}

- (void)addToContactId:(int64_t)a3
{
}

- (int64_t)toContactIdAtIndex:(unint64_t)a3
{
  p_toContactIds = &self->_toContactIds;
  unint64_t count = self->_toContactIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_toContactIds->list[a3];
}

- (void)setToContactIds:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)ccAddressCount
{
  return self->_ccAddress.count;
}

- (int64_t)ccAddress
{
  return self->_ccAddress.list;
}

- (void)clearCcAddress
{
}

- (void)addCcAddress:(int64_t)a3
{
}

- (int64_t)ccAddressAtIndex:(unint64_t)a3
{
  p_ccAddress = &self->_ccAddress;
  unint64_t count = self->_ccAddress.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_ccAddress->list[a3];
}

- (void)setCcAddress:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)ccDomainsCount
{
  return self->_ccDomains.count;
}

- (int64_t)ccDomains
{
  return self->_ccDomains.list;
}

- (void)clearCcDomains
{
}

- (void)addCcDomain:(int64_t)a3
{
}

- (int64_t)ccDomainAtIndex:(unint64_t)a3
{
  p_ccDomains = &self->_ccDomains;
  unint64_t count = self->_ccDomains.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_ccDomains->list[a3];
}

- (void)setCcDomains:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)ccIsVipsCount
{
  return self->_ccIsVips.count;
}

- (BOOL)ccIsVips
{
  return self->_ccIsVips.list;
}

- (void)clearCcIsVips
{
}

- (void)addCcIsVip:(BOOL)a3
{
}

- (BOOL)ccIsVipAtIndex:(unint64_t)a3
{
  p_ccIsVips = &self->_ccIsVips;
  unint64_t count = self->_ccIsVips.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_ccIsVips->list[a3];
}

- (void)setCcIsVips:(BOOL *)a3 count:(unint64_t)a4
{
}

- (unint64_t)ccContactIdsCount
{
  return self->_ccContactIds.count;
}

- (int64_t)ccContactIds
{
  return self->_ccContactIds.list;
}

- (void)clearCcContactIds
{
}

- (void)addCcContactId:(int64_t)a3
{
}

- (int64_t)ccContactIdAtIndex:(unint64_t)a3
{
  p_ccContactIds = &self->_ccContactIds;
  unint64_t count = self->_ccContactIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_ccContactIds->list[a3];
}

- (void)setCcContactIds:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)bccAddressCount
{
  return self->_bccAddress.count;
}

- (int64_t)bccAddress
{
  return self->_bccAddress.list;
}

- (void)clearBccAddress
{
}

- (void)addBccAddress:(int64_t)a3
{
}

- (int64_t)bccAddressAtIndex:(unint64_t)a3
{
  p_bccAddress = &self->_bccAddress;
  unint64_t count = self->_bccAddress.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_bccAddress->list[a3];
}

- (void)setBccAddress:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)bccDomainsCount
{
  return self->_bccDomains.count;
}

- (int64_t)bccDomains
{
  return self->_bccDomains.list;
}

- (void)clearBccDomains
{
}

- (void)addBccDomain:(int64_t)a3
{
}

- (int64_t)bccDomainAtIndex:(unint64_t)a3
{
  p_bccDomains = &self->_bccDomains;
  unint64_t count = self->_bccDomains.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_bccDomains->list[a3];
}

- (void)setBccDomains:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)bccIsVipsCount
{
  return self->_bccIsVips.count;
}

- (BOOL)bccIsVips
{
  return self->_bccIsVips.list;
}

- (void)clearBccIsVips
{
}

- (void)addBccIsVip:(BOOL)a3
{
}

- (BOOL)bccIsVipAtIndex:(unint64_t)a3
{
  p_bccIsVips = &self->_bccIsVips;
  unint64_t count = self->_bccIsVips.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_bccIsVips->list[a3];
}

- (void)setBccIsVips:(BOOL *)a3 count:(unint64_t)a4
{
}

- (unint64_t)bccContactIdsCount
{
  return self->_bccContactIds.count;
}

- (int64_t)bccContactIds
{
  return self->_bccContactIds.list;
}

- (void)clearBccContactIds
{
}

- (void)addBccContactId:(int64_t)a3
{
}

- (int64_t)bccContactIdAtIndex:(unint64_t)a3
{
  p_bccContactIds = &self->_bccContactIds;
  unint64_t count = self->_bccContactIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_bccContactIds->list[a3];
}

- (void)setBccContactIds:(int64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EDPBMessageHeaders;
  v4 = [(EDPBMessageHeaders *)&v8 description];
  v5 = [(EDPBMessageHeaders *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v5 = [NSNumber numberWithLongLong:self->_sender];
    [v3 setObject:v5 forKey:@"sender"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_senderDomain];
    [v3 setObject:v6 forKey:@"sender_domain"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    uint64_t v7 = [NSNumber numberWithBool:self->_senderIsVip];
    [v3 setObject:v7 forKey:@"sender_is_vip"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_senderContactId];
    [v3 setObject:v8 forKey:@"sender_contact_id"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_userIsSender];
    [v3 setObject:v9 forKey:@"user_is_sender"];
  }
  v10 = PBRepeatedInt64NSArray();
  [v3 setObject:v10 forKey:@"subject_words"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_messageIsReply];
    [v3 setObject:v12 forKey:@"message_is_reply"];

    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x20) != 0)
  {
    v13 = [NSNumber numberWithBool:self->_messageIsForwarded];
    [v3 setObject:v13 forKey:@"message_is_forwarded"];

    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x800) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_userIsTo];
    [v3 setObject:v14 forKey:@"user_is_to"];

    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x200) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_userIsCc];
    [v3 setObject:v15 forKey:@"user_is_cc"];

    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x100) != 0)
  {
    v16 = [NSNumber numberWithBool:self->_userIsBcc];
    [v3 setObject:v16 forKey:@"user_is_bcc"];

    __int16 v11 = (__int16)self->_has;
  }
  if (v11)
  {
    v17 = [NSNumber numberWithUnsignedLongLong:self->_dateReceived];
    [v3 setObject:v17 forKey:@"date_received"];

    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 2) != 0)
  {
    v18 = [NSNumber numberWithLongLong:self->_listId];
    [v3 setObject:v18 forKey:@"list_id"];
  }
  v19 = PBRepeatedInt64NSArray();
  [v3 setObject:v19 forKey:@"references"];

  v20 = PBRepeatedInt64NSArray();
  [v3 setObject:v20 forKey:@"to_address"];

  v21 = PBRepeatedInt64NSArray();
  [v3 setObject:v21 forKey:@"to_domain"];

  v22 = PBRepeatedBOOLNSArray();
  [v3 setObject:v22 forKey:@"to_is_vip"];

  v23 = PBRepeatedInt64NSArray();
  [v3 setObject:v23 forKey:@"to_contact_id"];

  v24 = PBRepeatedInt64NSArray();
  [v3 setObject:v24 forKey:@"cc_address"];

  v25 = PBRepeatedInt64NSArray();
  [v3 setObject:v25 forKey:@"cc_domain"];

  v26 = PBRepeatedBOOLNSArray();
  [v3 setObject:v26 forKey:@"cc_is_vip"];

  v27 = PBRepeatedInt64NSArray();
  [v3 setObject:v27 forKey:@"cc_contact_id"];

  v28 = PBRepeatedInt64NSArray();
  [v3 setObject:v28 forKey:@"bcc_address"];

  v29 = PBRepeatedInt64NSArray();
  [v3 setObject:v29 forKey:@"bcc_domain"];

  v30 = PBRepeatedBOOLNSArray();
  [v3 setObject:v30 forKey:@"bcc_is_vip"];

  v31 = PBRepeatedInt64NSArray();
  [v3 setObject:v31 forKey:@"bcc_contact_id"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBMessageHeadersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteSint64Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteSint64Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteSint64Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_subjectWords.count)
  {
    PBDataWriterPlaceMark();
    if (self->_subjectWords.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v6;
      }
      while (v6 < self->_subjectWords.count);
    }
    PBDataWriterRecallMark();
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v7 = (__int16)self->_has;
  }
  if (v7)
  {
    PBDataWriterWriteUint64Field();
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 2) != 0) {
    PBDataWriterWriteSint64Field();
  }
  if (self->_references.count)
  {
    PBDataWriterPlaceMark();
    if (self->_references.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v8;
      }
      while (v8 < self->_references.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_toAddress.count)
  {
    PBDataWriterPlaceMark();
    if (self->_toAddress.count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v9;
      }
      while (v9 < self->_toAddress.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_toDomains.count)
  {
    PBDataWriterPlaceMark();
    if (self->_toDomains.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v10;
      }
      while (v10 < self->_toDomains.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_toIsVips.count)
  {
    PBDataWriterPlaceMark();
    if (self->_toIsVips.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteBOOLField();
        ++v11;
      }
      while (v11 < self->_toIsVips.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_toContactIds.count)
  {
    PBDataWriterPlaceMark();
    if (self->_toContactIds.count)
    {
      unint64_t v12 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v12;
      }
      while (v12 < self->_toContactIds.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_ccAddress.count)
  {
    PBDataWriterPlaceMark();
    if (self->_ccAddress.count)
    {
      unint64_t v13 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v13;
      }
      while (v13 < self->_ccAddress.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_ccDomains.count)
  {
    PBDataWriterPlaceMark();
    if (self->_ccDomains.count)
    {
      unint64_t v14 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v14;
      }
      while (v14 < self->_ccDomains.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_ccIsVips.count)
  {
    PBDataWriterPlaceMark();
    if (self->_ccIsVips.count)
    {
      unint64_t v15 = 0;
      do
      {
        PBDataWriterWriteBOOLField();
        ++v15;
      }
      while (v15 < self->_ccIsVips.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_ccContactIds.count)
  {
    PBDataWriterPlaceMark();
    if (self->_ccContactIds.count)
    {
      unint64_t v16 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v16;
      }
      while (v16 < self->_ccContactIds.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_bccAddress.count)
  {
    PBDataWriterPlaceMark();
    if (self->_bccAddress.count)
    {
      unint64_t v17 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v17;
      }
      while (v17 < self->_bccAddress.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_bccDomains.count)
  {
    PBDataWriterPlaceMark();
    if (self->_bccDomains.count)
    {
      unint64_t v18 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v18;
      }
      while (v18 < self->_bccDomains.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_bccIsVips.count)
  {
    PBDataWriterPlaceMark();
    if (self->_bccIsVips.count)
    {
      unint64_t v19 = 0;
      do
      {
        PBDataWriterWriteBOOLField();
        ++v19;
      }
      while (v19 < self->_bccIsVips.count);
    }
    PBDataWriterRecallMark();
  }
  p_bccContactIds = &self->_bccContactIds;
  if (p_bccContactIds->count)
  {
    PBDataWriterPlaceMark();
    if (p_bccContactIds->count)
    {
      unint64_t v21 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v21;
      }
      while (v21 < p_bccContactIds->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  v34 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v34[45] = self->_sender;
    *((_WORD *)v34 + 196) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_76;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v34[47] = self->_senderDomain;
  *((_WORD *)v34 + 196) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_77:
    v34[46] = self->_senderContactId;
    *((_WORD *)v34 + 196) |= 8u;
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_76:
  *((unsigned char *)v34 + 386) = self->_senderIsVip;
  *((_WORD *)v34 + 196) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_77;
  }
LABEL_5:
  if ((has & 0x400) != 0)
  {
LABEL_6:
    *((unsigned char *)v34 + 389) = self->_userIsSender;
    *((_WORD *)v34 + 196) |= 0x400u;
  }
LABEL_7:
  if ([(EDPBMessageHeaders *)self subjectWordsCount])
  {
    [v34 clearSubjectWords];
    unint64_t v5 = [(EDPBMessageHeaders *)self subjectWordsCount];
    if (v5)
    {
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v34, "addSubjectWords:", -[EDPBMessageHeaders subjectWordsAtIndex:](self, "subjectWordsAtIndex:", i));
    }
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    *((unsigned char *)v34 + 385) = self->_messageIsReply;
    *((_WORD *)v34 + 196) |= 0x40u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x20) == 0)
    {
LABEL_13:
      if ((v7 & 0x800) == 0) {
        goto LABEL_14;
      }
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_13;
  }
  *((unsigned char *)v34 + 384) = self->_messageIsForwarded;
  *((_WORD *)v34 + 196) |= 0x20u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x800) == 0)
  {
LABEL_14:
    if ((v7 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((unsigned char *)v34 + 390) = self->_userIsTo;
  *((_WORD *)v34 + 196) |= 0x800u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) == 0)
  {
LABEL_15:
    if ((v7 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((unsigned char *)v34 + 388) = self->_userIsCc;
  *((_WORD *)v34 + 196) |= 0x200u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x100) == 0)
  {
LABEL_16:
    if ((v7 & 1) == 0) {
      goto LABEL_17;
    }
LABEL_84:
    v34[43] = self->_dateReceived;
    *((_WORD *)v34 + 196) |= 1u;
    if ((*(_WORD *)&self->_has & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_83:
  *((unsigned char *)v34 + 387) = self->_userIsBcc;
  *((_WORD *)v34 + 196) |= 0x100u;
  __int16 v7 = (__int16)self->_has;
  if (v7) {
    goto LABEL_84;
  }
LABEL_17:
  if ((v7 & 2) != 0)
  {
LABEL_18:
    v34[44] = self->_listId;
    *((_WORD *)v34 + 196) |= 2u;
  }
LABEL_19:
  if ([(EDPBMessageHeaders *)self referencesCount])
  {
    [v34 clearReferences];
    unint64_t v8 = [(EDPBMessageHeaders *)self referencesCount];
    if (v8)
    {
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v34, "addReferences:", -[EDPBMessageHeaders referencesAtIndex:](self, "referencesAtIndex:", j));
    }
  }
  if ([(EDPBMessageHeaders *)self toAddressCount])
  {
    [v34 clearToAddress];
    unint64_t v10 = [(EDPBMessageHeaders *)self toAddressCount];
    if (v10)
    {
      for (uint64_t k = 0; k != v10; ++k)
        objc_msgSend(v34, "addToAddress:", -[EDPBMessageHeaders toAddressAtIndex:](self, "toAddressAtIndex:", k));
    }
  }
  if ([(EDPBMessageHeaders *)self toDomainsCount])
  {
    [v34 clearToDomains];
    unint64_t v12 = [(EDPBMessageHeaders *)self toDomainsCount];
    if (v12)
    {
      for (uint64_t m = 0; m != v12; ++m)
        objc_msgSend(v34, "addToDomain:", -[EDPBMessageHeaders toDomainAtIndex:](self, "toDomainAtIndex:", m));
    }
  }
  if ([(EDPBMessageHeaders *)self toIsVipsCount])
  {
    [v34 clearToIsVips];
    unint64_t v14 = [(EDPBMessageHeaders *)self toIsVipsCount];
    if (v14)
    {
      for (uint64_t n = 0; n != v14; ++n)
        objc_msgSend(v34, "addToIsVip:", -[EDPBMessageHeaders toIsVipAtIndex:](self, "toIsVipAtIndex:", n));
    }
  }
  if ([(EDPBMessageHeaders *)self toContactIdsCount])
  {
    [v34 clearToContactIds];
    unint64_t v16 = [(EDPBMessageHeaders *)self toContactIdsCount];
    if (v16)
    {
      for (iuint64_t i = 0; ii != v16; ++ii)
        objc_msgSend(v34, "addToContactId:", -[EDPBMessageHeaders toContactIdAtIndex:](self, "toContactIdAtIndex:", ii));
    }
  }
  if ([(EDPBMessageHeaders *)self ccAddressCount])
  {
    [v34 clearCcAddress];
    unint64_t v18 = [(EDPBMessageHeaders *)self ccAddressCount];
    if (v18)
    {
      for (juint64_t j = 0; jj != v18; ++jj)
        objc_msgSend(v34, "addCcAddress:", -[EDPBMessageHeaders ccAddressAtIndex:](self, "ccAddressAtIndex:", jj));
    }
  }
  if ([(EDPBMessageHeaders *)self ccDomainsCount])
  {
    [v34 clearCcDomains];
    unint64_t v20 = [(EDPBMessageHeaders *)self ccDomainsCount];
    if (v20)
    {
      for (kuint64_t k = 0; kk != v20; ++kk)
        objc_msgSend(v34, "addCcDomain:", -[EDPBMessageHeaders ccDomainAtIndex:](self, "ccDomainAtIndex:", kk));
    }
  }
  if ([(EDPBMessageHeaders *)self ccIsVipsCount])
  {
    [v34 clearCcIsVips];
    unint64_t v22 = [(EDPBMessageHeaders *)self ccIsVipsCount];
    if (v22)
    {
      for (muint64_t m = 0; mm != v22; ++mm)
        objc_msgSend(v34, "addCcIsVip:", -[EDPBMessageHeaders ccIsVipAtIndex:](self, "ccIsVipAtIndex:", mm));
    }
  }
  if ([(EDPBMessageHeaders *)self ccContactIdsCount])
  {
    [v34 clearCcContactIds];
    unint64_t v24 = [(EDPBMessageHeaders *)self ccContactIdsCount];
    if (v24)
    {
      for (nuint64_t n = 0; nn != v24; ++nn)
        objc_msgSend(v34, "addCcContactId:", -[EDPBMessageHeaders ccContactIdAtIndex:](self, "ccContactIdAtIndex:", nn));
    }
  }
  if ([(EDPBMessageHeaders *)self bccAddressCount])
  {
    [v34 clearBccAddress];
    unint64_t v26 = [(EDPBMessageHeaders *)self bccAddressCount];
    if (v26)
    {
      for (uint64_t i1 = 0; i1 != v26; ++i1)
        objc_msgSend(v34, "addBccAddress:", -[EDPBMessageHeaders bccAddressAtIndex:](self, "bccAddressAtIndex:", i1));
    }
  }
  if ([(EDPBMessageHeaders *)self bccDomainsCount])
  {
    [v34 clearBccDomains];
    unint64_t v28 = [(EDPBMessageHeaders *)self bccDomainsCount];
    if (v28)
    {
      for (uint64_t i2 = 0; i2 != v28; ++i2)
        objc_msgSend(v34, "addBccDomain:", -[EDPBMessageHeaders bccDomainAtIndex:](self, "bccDomainAtIndex:", i2));
    }
  }
  if ([(EDPBMessageHeaders *)self bccIsVipsCount])
  {
    [v34 clearBccIsVips];
    unint64_t v30 = [(EDPBMessageHeaders *)self bccIsVipsCount];
    if (v30)
    {
      for (uint64_t i3 = 0; i3 != v30; ++i3)
        objc_msgSend(v34, "addBccIsVip:", -[EDPBMessageHeaders bccIsVipAtIndex:](self, "bccIsVipAtIndex:", i3));
    }
  }
  if ([(EDPBMessageHeaders *)self bccContactIdsCount])
  {
    [v34 clearBccContactIds];
    unint64_t v32 = [(EDPBMessageHeaders *)self bccContactIdsCount];
    if (v32)
    {
      for (uint64_t i4 = 0; i4 != v32; ++i4)
        objc_msgSend(v34, "addBccContactId:", -[EDPBMessageHeaders bccContactIdAtIndex:](self, "bccContactIdAtIndex:", i4));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v4 + 360) = self->_sender;
    *(_WORD *)(v4 + 392) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v4 + 376) = self->_senderDomain;
  *(_WORD *)(v4 + 392) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(unsigned char *)(v4 + 386) = self->_senderIsVip;
  *(_WORD *)(v4 + 392) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  *(void *)(v4 + 368) = self->_senderContactId;
  *(_WORD *)(v4 + 392) |= 8u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    *(unsigned char *)(v4 + 389) = self->_userIsSender;
    *(_WORD *)(v4 + 392) |= 0x400u;
  }
LABEL_7:
  PBRepeatedInt64Copy();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 385) = self->_messageIsReply;
    *(_WORD *)(v5 + 392) |= 0x40u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x20) == 0)
    {
LABEL_9:
      if ((v7 & 0x800) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  *(unsigned char *)(v5 + 384) = self->_messageIsForwarded;
  *(_WORD *)(v5 + 392) |= 0x20u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x800) == 0)
  {
LABEL_10:
    if ((v7 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(unsigned char *)(v5 + 390) = self->_userIsTo;
  *(_WORD *)(v5 + 392) |= 0x800u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) == 0)
  {
LABEL_11:
    if ((v7 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(unsigned char *)(v5 + 388) = self->_userIsCc;
  *(_WORD *)(v5 + 392) |= 0x200u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x100) == 0)
  {
LABEL_12:
    if ((v7 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_26:
    *(void *)(v5 + 344) = self->_dateReceived;
    *(_WORD *)(v5 + 392) |= 1u;
    if ((*(_WORD *)&self->_has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_25:
  *(unsigned char *)(v5 + 387) = self->_userIsBcc;
  *(_WORD *)(v5 + 392) |= 0x100u;
  __int16 v7 = (__int16)self->_has;
  if (v7) {
    goto LABEL_26;
  }
LABEL_13:
  if ((v7 & 2) != 0)
  {
LABEL_14:
    *(void *)(v5 + 352) = self->_listId;
    *(_WORD *)(v5 + 392) |= 2u;
  }
LABEL_15:
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  PBRepeatedBOOLCopy();
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  PBRepeatedBOOLCopy();
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  PBRepeatedBOOLCopy();
  PBRepeatedInt64Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_97;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 196);
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_sender != *((void *)v4 + 45)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_97;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_senderDomain != *((void *)v4 + 47)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_97;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0) {
      goto LABEL_97;
    }
    if (self->_senderIsVip)
    {
      if (!*((unsigned char *)v4 + 386)) {
        goto LABEL_97;
      }
    }
    else if (*((unsigned char *)v4 + 386))
    {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_97;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_senderContactId != *((void *)v4 + 46)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 196) & 0x400) == 0) {
      goto LABEL_97;
    }
    if (self->_userIsSender)
    {
      if (!*((unsigned char *)v4 + 389)) {
        goto LABEL_97;
      }
    }
    else if (*((unsigned char *)v4 + 389))
    {
      goto LABEL_97;
    }
  }
  else if ((*((_WORD *)v4 + 196) & 0x400) != 0)
  {
    goto LABEL_97;
  }
  if (!PBRepeatedInt64IsEqual()) {
    goto LABEL_97;
  }
  __int16 v7 = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 196);
  if ((v7 & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0) {
      goto LABEL_97;
    }
    if (self->_messageIsReply)
    {
      if (!*((unsigned char *)v4 + 385)) {
        goto LABEL_97;
      }
    }
    else if (*((unsigned char *)v4 + 385))
    {
      goto LABEL_97;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_97;
  }
  if ((v7 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0) {
      goto LABEL_97;
    }
    if (self->_messageIsForwarded)
    {
      if (!*((unsigned char *)v4 + 384)) {
        goto LABEL_97;
      }
    }
    else if (*((unsigned char *)v4 + 384))
    {
      goto LABEL_97;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 196) & 0x800) == 0) {
      goto LABEL_97;
    }
    if (self->_userIsTo)
    {
      if (!*((unsigned char *)v4 + 390)) {
        goto LABEL_97;
      }
    }
    else if (*((unsigned char *)v4 + 390))
    {
      goto LABEL_97;
    }
  }
  else if ((*((_WORD *)v4 + 196) & 0x800) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 196) & 0x200) == 0) {
      goto LABEL_97;
    }
    if (self->_userIsCc)
    {
      if (!*((unsigned char *)v4 + 388)) {
        goto LABEL_97;
      }
    }
    else if (*((unsigned char *)v4 + 388))
    {
      goto LABEL_97;
    }
  }
  else if ((*((_WORD *)v4 + 196) & 0x200) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 196) & 0x100) != 0)
    {
      if (self->_userIsBcc)
      {
        if (!*((unsigned char *)v4 + 387)) {
          goto LABEL_97;
        }
        goto LABEL_74;
      }
      if (!*((unsigned char *)v4 + 387)) {
        goto LABEL_74;
      }
    }
LABEL_97:
    char IsEqual = 0;
    goto LABEL_98;
  }
  if ((*((_WORD *)v4 + 196) & 0x100) != 0) {
    goto LABEL_97;
  }
LABEL_74:
  if (v7)
  {
    if ((v8 & 1) == 0 || self->_dateReceived != *((void *)v4 + 43)) {
      goto LABEL_97;
    }
  }
  else if (v8)
  {
    goto LABEL_97;
  }
  if ((v7 & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_listId != *((void *)v4 + 44)) {
      goto LABEL_97;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_97;
  }
  if (!PBRepeatedInt64IsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedBOOLIsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedBOOLIsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedBOOLIsEqual())
  {
    goto LABEL_97;
  }
  char IsEqual = PBRepeatedInt64IsEqual();
LABEL_98:

  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_sender;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_senderDomain;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_senderIsVip;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_senderContactId;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_userIsSender;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v8 = 0;
LABEL_12:
  uint64_t v9 = PBRepeatedInt64Hash();
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x40) != 0)
  {
    uint64_t v11 = 2654435761 * self->_messageIsReply;
    if ((v10 & 0x20) != 0)
    {
LABEL_14:
      uint64_t v12 = 2654435761 * self->_messageIsForwarded;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_15;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((v10 & 0x20) != 0) {
      goto LABEL_14;
    }
  }
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_15:
    uint64_t v13 = 2654435761 * self->_userIsTo;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_16:
    uint64_t v14 = 2654435761 * self->_userIsCc;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_17;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_17:
    uint64_t v15 = 2654435761 * self->_userIsBcc;
    if (v10) {
      goto LABEL_18;
    }
LABEL_25:
    unint64_t v16 = 0;
    if ((v10 & 2) != 0) {
      goto LABEL_19;
    }
LABEL_26:
    uint64_t v17 = 0;
    goto LABEL_27;
  }
LABEL_24:
  uint64_t v15 = 0;
  if ((v10 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_18:
  unint64_t v16 = 2654435761u * self->_dateReceived;
  if ((v10 & 2) == 0) {
    goto LABEL_26;
  }
LABEL_19:
  uint64_t v17 = 2654435761 * self->_listId;
LABEL_27:
  uint64_t v18 = v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v11 ^ v12 ^ v13 ^ v14 ^ v9 ^ v15 ^ v16 ^ v17 ^ PBRepeatedInt64Hash();
  uint64_t v19 = PBRepeatedInt64Hash();
  uint64_t v20 = v19 ^ PBRepeatedInt64Hash();
  uint64_t v21 = v18 ^ v20 ^ PBRepeatedBOOLHash();
  uint64_t v22 = PBRepeatedInt64Hash();
  uint64_t v23 = v22 ^ PBRepeatedInt64Hash();
  uint64_t v24 = v23 ^ PBRepeatedInt64Hash();
  uint64_t v25 = v21 ^ v24 ^ PBRepeatedBOOLHash();
  uint64_t v26 = PBRepeatedInt64Hash();
  uint64_t v27 = v26 ^ PBRepeatedInt64Hash();
  uint64_t v28 = v27 ^ PBRepeatedInt64Hash();
  uint64_t v29 = v28 ^ PBRepeatedBOOLHash();
  return v25 ^ v29 ^ PBRepeatedInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  id v34 = a3;
  __int16 v4 = *((_WORD *)v34 + 196);
  if ((v4 & 4) != 0)
  {
    self->_sender = *((void *)v34 + 45);
    *(_WORD *)&self->_has |= 4u;
    __int16 v4 = *((_WORD *)v34 + 196);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_62;
    }
  }
  else if ((v4 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_senderDomaiuint64_t n = *((void *)v34 + 47);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v4 = *((_WORD *)v34 + 196);
  if ((v4 & 0x80) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_senderIsVip = *((unsigned char *)v34 + 386);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v4 = *((_WORD *)v34 + 196);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_63:
  self->_senderContactId = *((void *)v34 + 46);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v34 + 196) & 0x400) != 0)
  {
LABEL_6:
    self->_userIsSender = *((unsigned char *)v34 + 389);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_7:
  uint64_t v5 = [v34 subjectWordsCount];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
      -[EDPBMessageHeaders addSubjectWords:](self, "addSubjectWords:", [v34 subjectWordsAtIndex:i]);
  }
  __int16 v7 = *((_WORD *)v34 + 196);
  if ((v7 & 0x40) != 0)
  {
    self->_messageIsReply = *((unsigned char *)v34 + 385);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v7 = *((_WORD *)v34 + 196);
    if ((v7 & 0x20) == 0)
    {
LABEL_12:
      if ((v7 & 0x800) == 0) {
        goto LABEL_13;
      }
      goto LABEL_67;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_12;
  }
  self->_messageIsForwarded = *((unsigned char *)v34 + 384);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v7 = *((_WORD *)v34 + 196);
  if ((v7 & 0x800) == 0)
  {
LABEL_13:
    if ((v7 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_userIsTo = *((unsigned char *)v34 + 390);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v7 = *((_WORD *)v34 + 196);
  if ((v7 & 0x200) == 0)
  {
LABEL_14:
    if ((v7 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_userIsCc = *((unsigned char *)v34 + 388);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v7 = *((_WORD *)v34 + 196);
  if ((v7 & 0x100) == 0)
  {
LABEL_15:
    if ((v7 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_userIsBcc = *((unsigned char *)v34 + 387);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v7 = *((_WORD *)v34 + 196);
  if ((v7 & 1) == 0)
  {
LABEL_16:
    if ((v7 & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_70:
  self->_dateReceived = *((void *)v34 + 43);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v34 + 196) & 2) != 0)
  {
LABEL_17:
    self->_listId = *((void *)v34 + 44);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_18:
  uint64_t v8 = [v34 referencesCount];
  if (v8)
  {
    for (uint64_t j = 0; j != v8; ++j)
      -[EDPBMessageHeaders addReferences:](self, "addReferences:", [v34 referencesAtIndex:j]);
  }
  uint64_t v10 = [v34 toAddressCount];
  if (v10)
  {
    for (uint64_t k = 0; k != v10; ++k)
      -[EDPBMessageHeaders addToAddress:](self, "addToAddress:", [v34 toAddressAtIndex:k]);
  }
  uint64_t v12 = [v34 toDomainsCount];
  if (v12)
  {
    for (uint64_t m = 0; m != v12; ++m)
      -[EDPBMessageHeaders addToDomain:](self, "addToDomain:", [v34 toDomainAtIndex:m]);
  }
  uint64_t v14 = [v34 toIsVipsCount];
  if (v14)
  {
    for (uint64_t n = 0; n != v14; ++n)
      -[EDPBMessageHeaders addToIsVip:](self, "addToIsVip:", [v34 toIsVipAtIndex:n]);
  }
  uint64_t v16 = [v34 toContactIdsCount];
  if (v16)
  {
    for (iuint64_t i = 0; ii != v16; ++ii)
      -[EDPBMessageHeaders addToContactId:](self, "addToContactId:", [v34 toContactIdAtIndex:ii]);
  }
  uint64_t v18 = [v34 ccAddressCount];
  if (v18)
  {
    for (juint64_t j = 0; jj != v18; ++jj)
      -[EDPBMessageHeaders addCcAddress:](self, "addCcAddress:", [v34 ccAddressAtIndex:jj]);
  }
  uint64_t v20 = [v34 ccDomainsCount];
  if (v20)
  {
    for (kuint64_t k = 0; kk != v20; ++kk)
      -[EDPBMessageHeaders addCcDomain:](self, "addCcDomain:", [v34 ccDomainAtIndex:kk]);
  }
  uint64_t v22 = [v34 ccIsVipsCount];
  if (v22)
  {
    for (muint64_t m = 0; mm != v22; ++mm)
      -[EDPBMessageHeaders addCcIsVip:](self, "addCcIsVip:", [v34 ccIsVipAtIndex:mm]);
  }
  uint64_t v24 = [v34 ccContactIdsCount];
  if (v24)
  {
    for (nuint64_t n = 0; nn != v24; ++nn)
      -[EDPBMessageHeaders addCcContactId:](self, "addCcContactId:", [v34 ccContactIdAtIndex:nn]);
  }
  uint64_t v26 = [v34 bccAddressCount];
  if (v26)
  {
    for (uint64_t i1 = 0; i1 != v26; ++i1)
      -[EDPBMessageHeaders addBccAddress:](self, "addBccAddress:", [v34 bccAddressAtIndex:i1]);
  }
  uint64_t v28 = [v34 bccDomainsCount];
  if (v28)
  {
    for (uint64_t i2 = 0; i2 != v28; ++i2)
      -[EDPBMessageHeaders addBccDomain:](self, "addBccDomain:", [v34 bccDomainAtIndex:i2]);
  }
  uint64_t v30 = [v34 bccIsVipsCount];
  if (v30)
  {
    for (uint64_t i3 = 0; i3 != v30; ++i3)
      -[EDPBMessageHeaders addBccIsVip:](self, "addBccIsVip:", [v34 bccIsVipAtIndex:i3]);
  }
  uint64_t v32 = [v34 bccContactIdsCount];
  if (v32)
  {
    for (uint64_t i4 = 0; i4 != v32; ++i4)
      -[EDPBMessageHeaders addBccContactId:](self, "addBccContactId:", [v34 bccContactIdAtIndex:i4]);
  }
}

- (int64_t)sender
{
  return self->_sender;
}

- (int64_t)senderDomain
{
  return self->_senderDomain;
}

- (BOOL)senderIsVip
{
  return self->_senderIsVip;
}

- (int64_t)senderContactId
{
  return self->_senderContactId;
}

- (BOOL)userIsSender
{
  return self->_userIsSender;
}

- (BOOL)messageIsReply
{
  return self->_messageIsReply;
}

- (BOOL)messageIsForwarded
{
  return self->_messageIsForwarded;
}

- (BOOL)userIsTo
{
  return self->_userIsTo;
}

- (BOOL)userIsCc
{
  return self->_userIsCc;
}

- (BOOL)userIsBcc
{
  return self->_userIsBcc;
}

- (unint64_t)dateReceived
{
  return self->_dateReceived;
}

- (int64_t)listId
{
  return self->_listId;
}

@end