@interface EDPBModelFeaturesImportant
- (BOOL)ccContainsContact;
- (BOOL)ccIsTopDirectAddressesBasedOnRespond;
- (BOOL)ccIsTopDirectAddressesBasedOnScroll;
- (BOOL)ccIsTopDirectAddressesBasedOnSend;
- (BOOL)ccIsTopDirectAddressesBasedOnView;
- (BOOL)ccIsTopIndirectAddressesBasedOnRespond;
- (BOOL)ccIsTopIndirectAddressesBasedOnScroll;
- (BOOL)ccIsTopIndirectAddressesBasedOnSend;
- (BOOL)ccIsTopIndirectAddressesBasedOnView;
- (BOOL)ccIsVip;
- (BOOL)fromListId;
- (BOOL)hasCcContainsContact;
- (BOOL)hasCcIsTopDirectAddressesBasedOnRespond;
- (BOOL)hasCcIsTopDirectAddressesBasedOnScroll;
- (BOOL)hasCcIsTopDirectAddressesBasedOnSend;
- (BOOL)hasCcIsTopDirectAddressesBasedOnView;
- (BOOL)hasCcIsTopIndirectAddressesBasedOnRespond;
- (BOOL)hasCcIsTopIndirectAddressesBasedOnScroll;
- (BOOL)hasCcIsTopIndirectAddressesBasedOnSend;
- (BOOL)hasCcIsTopIndirectAddressesBasedOnView;
- (BOOL)hasCcIsVip;
- (BOOL)hasFromListId;
- (BOOL)hasMessageIsForward;
- (BOOL)hasMessageIsReply;
- (BOOL)hasNumRecipients;
- (BOOL)hasSenderIsContact;
- (BOOL)hasSenderIsTopDirectAddressesBasedOnRespond;
- (BOOL)hasSenderIsTopDirectAddressesBasedOnScroll;
- (BOOL)hasSenderIsTopDirectAddressesBasedOnSend;
- (BOOL)hasSenderIsTopDirectAddressesBasedOnView;
- (BOOL)hasSenderIsTopIndirectAddressesBasedOnRespond;
- (BOOL)hasSenderIsTopIndirectAddressesBasedOnScroll;
- (BOOL)hasSenderIsTopIndirectAddressesBasedOnSend;
- (BOOL)hasSenderIsTopIndirectAddressesBasedOnView;
- (BOOL)hasSenderIsVip;
- (BOOL)hasSubjectIsTopWordsBasedOnRespond;
- (BOOL)hasSubjectIsTopWordsBasedOnScroll;
- (BOOL)hasSubjectIsTopWordsBasedOnSend;
- (BOOL)hasSubjectIsTopWordsBasedOnView;
- (BOOL)hasTimeReceived;
- (BOOL)hasToContainsContact;
- (BOOL)hasToIsTopDirectAddressesBasedOnRespond;
- (BOOL)hasToIsTopDirectAddressesBasedOnScroll;
- (BOOL)hasToIsTopDirectAddressesBasedOnSend;
- (BOOL)hasToIsTopDirectAddressesBasedOnView;
- (BOOL)hasToIsTopIndirectAddressesBasedOnRespond;
- (BOOL)hasToIsTopIndirectAddressesBasedOnScroll;
- (BOOL)hasToIsTopIndirectAddressesBasedOnSend;
- (BOOL)hasToIsTopIndirectAddressesBasedOnView;
- (BOOL)hasToIsVip;
- (BOOL)hasUnknownFeatureCount;
- (BOOL)hasUserIsBcc;
- (BOOL)hasUserIsCc;
- (BOOL)hasUserIsSender;
- (BOOL)hasUserIsTo;
- (BOOL)isEqual:(id)a3;
- (BOOL)messageIsForward;
- (BOOL)messageIsReply;
- (BOOL)readFrom:(id)a3;
- (BOOL)senderIsContact;
- (BOOL)senderIsTopDirectAddressesBasedOnRespond;
- (BOOL)senderIsTopDirectAddressesBasedOnScroll;
- (BOOL)senderIsTopDirectAddressesBasedOnSend;
- (BOOL)senderIsTopDirectAddressesBasedOnView;
- (BOOL)senderIsTopIndirectAddressesBasedOnRespond;
- (BOOL)senderIsTopIndirectAddressesBasedOnScroll;
- (BOOL)senderIsTopIndirectAddressesBasedOnSend;
- (BOOL)senderIsTopIndirectAddressesBasedOnView;
- (BOOL)senderIsVip;
- (BOOL)subjectIsTopWordsBasedOnRespond;
- (BOOL)subjectIsTopWordsBasedOnScroll;
- (BOOL)subjectIsTopWordsBasedOnSend;
- (BOOL)subjectIsTopWordsBasedOnView;
- (BOOL)toContainsContact;
- (BOOL)toIsTopDirectAddressesBasedOnRespond;
- (BOOL)toIsTopDirectAddressesBasedOnScroll;
- (BOOL)toIsTopDirectAddressesBasedOnSend;
- (BOOL)toIsTopDirectAddressesBasedOnView;
- (BOOL)toIsTopIndirectAddressesBasedOnRespond;
- (BOOL)toIsTopIndirectAddressesBasedOnScroll;
- (BOOL)toIsTopIndirectAddressesBasedOnSend;
- (BOOL)toIsTopIndirectAddressesBasedOnView;
- (BOOL)toIsVip;
- (BOOL)userIsBcc;
- (BOOL)userIsCc;
- (BOOL)userIsSender;
- (BOOL)userIsTo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)timeReceivedAsString:(int)a3;
- (int)StringAsTimeReceived:(id)a3;
- (int)timeReceived;
- (unint64_t)hash;
- (unsigned)numRecipients;
- (unsigned)unknownFeatureCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCcContainsContact:(BOOL)a3;
- (void)setCcIsTopDirectAddressesBasedOnRespond:(BOOL)a3;
- (void)setCcIsTopDirectAddressesBasedOnScroll:(BOOL)a3;
- (void)setCcIsTopDirectAddressesBasedOnSend:(BOOL)a3;
- (void)setCcIsTopDirectAddressesBasedOnView:(BOOL)a3;
- (void)setCcIsTopIndirectAddressesBasedOnRespond:(BOOL)a3;
- (void)setCcIsTopIndirectAddressesBasedOnScroll:(BOOL)a3;
- (void)setCcIsTopIndirectAddressesBasedOnSend:(BOOL)a3;
- (void)setCcIsTopIndirectAddressesBasedOnView:(BOOL)a3;
- (void)setCcIsVip:(BOOL)a3;
- (void)setFromListId:(BOOL)a3;
- (void)setHasCcContainsContact:(BOOL)a3;
- (void)setHasCcIsTopDirectAddressesBasedOnRespond:(BOOL)a3;
- (void)setHasCcIsTopDirectAddressesBasedOnScroll:(BOOL)a3;
- (void)setHasCcIsTopDirectAddressesBasedOnSend:(BOOL)a3;
- (void)setHasCcIsTopDirectAddressesBasedOnView:(BOOL)a3;
- (void)setHasCcIsTopIndirectAddressesBasedOnRespond:(BOOL)a3;
- (void)setHasCcIsTopIndirectAddressesBasedOnScroll:(BOOL)a3;
- (void)setHasCcIsTopIndirectAddressesBasedOnSend:(BOOL)a3;
- (void)setHasCcIsTopIndirectAddressesBasedOnView:(BOOL)a3;
- (void)setHasCcIsVip:(BOOL)a3;
- (void)setHasFromListId:(BOOL)a3;
- (void)setHasMessageIsForward:(BOOL)a3;
- (void)setHasMessageIsReply:(BOOL)a3;
- (void)setHasNumRecipients:(BOOL)a3;
- (void)setHasSenderIsContact:(BOOL)a3;
- (void)setHasSenderIsTopDirectAddressesBasedOnRespond:(BOOL)a3;
- (void)setHasSenderIsTopDirectAddressesBasedOnScroll:(BOOL)a3;
- (void)setHasSenderIsTopDirectAddressesBasedOnSend:(BOOL)a3;
- (void)setHasSenderIsTopDirectAddressesBasedOnView:(BOOL)a3;
- (void)setHasSenderIsTopIndirectAddressesBasedOnRespond:(BOOL)a3;
- (void)setHasSenderIsTopIndirectAddressesBasedOnScroll:(BOOL)a3;
- (void)setHasSenderIsTopIndirectAddressesBasedOnSend:(BOOL)a3;
- (void)setHasSenderIsTopIndirectAddressesBasedOnView:(BOOL)a3;
- (void)setHasSenderIsVip:(BOOL)a3;
- (void)setHasSubjectIsTopWordsBasedOnRespond:(BOOL)a3;
- (void)setHasSubjectIsTopWordsBasedOnScroll:(BOOL)a3;
- (void)setHasSubjectIsTopWordsBasedOnSend:(BOOL)a3;
- (void)setHasSubjectIsTopWordsBasedOnView:(BOOL)a3;
- (void)setHasTimeReceived:(BOOL)a3;
- (void)setHasToContainsContact:(BOOL)a3;
- (void)setHasToIsTopDirectAddressesBasedOnRespond:(BOOL)a3;
- (void)setHasToIsTopDirectAddressesBasedOnScroll:(BOOL)a3;
- (void)setHasToIsTopDirectAddressesBasedOnSend:(BOOL)a3;
- (void)setHasToIsTopDirectAddressesBasedOnView:(BOOL)a3;
- (void)setHasToIsTopIndirectAddressesBasedOnRespond:(BOOL)a3;
- (void)setHasToIsTopIndirectAddressesBasedOnScroll:(BOOL)a3;
- (void)setHasToIsTopIndirectAddressesBasedOnSend:(BOOL)a3;
- (void)setHasToIsTopIndirectAddressesBasedOnView:(BOOL)a3;
- (void)setHasToIsVip:(BOOL)a3;
- (void)setHasUnknownFeatureCount:(BOOL)a3;
- (void)setHasUserIsBcc:(BOOL)a3;
- (void)setHasUserIsCc:(BOOL)a3;
- (void)setHasUserIsSender:(BOOL)a3;
- (void)setHasUserIsTo:(BOOL)a3;
- (void)setMessageIsForward:(BOOL)a3;
- (void)setMessageIsReply:(BOOL)a3;
- (void)setNumRecipients:(unsigned int)a3;
- (void)setSenderIsContact:(BOOL)a3;
- (void)setSenderIsTopDirectAddressesBasedOnRespond:(BOOL)a3;
- (void)setSenderIsTopDirectAddressesBasedOnScroll:(BOOL)a3;
- (void)setSenderIsTopDirectAddressesBasedOnSend:(BOOL)a3;
- (void)setSenderIsTopDirectAddressesBasedOnView:(BOOL)a3;
- (void)setSenderIsTopIndirectAddressesBasedOnRespond:(BOOL)a3;
- (void)setSenderIsTopIndirectAddressesBasedOnScroll:(BOOL)a3;
- (void)setSenderIsTopIndirectAddressesBasedOnSend:(BOOL)a3;
- (void)setSenderIsTopIndirectAddressesBasedOnView:(BOOL)a3;
- (void)setSenderIsVip:(BOOL)a3;
- (void)setSubjectIsTopWordsBasedOnRespond:(BOOL)a3;
- (void)setSubjectIsTopWordsBasedOnScroll:(BOOL)a3;
- (void)setSubjectIsTopWordsBasedOnSend:(BOOL)a3;
- (void)setSubjectIsTopWordsBasedOnView:(BOOL)a3;
- (void)setTimeReceived:(int)a3;
- (void)setToContainsContact:(BOOL)a3;
- (void)setToIsTopDirectAddressesBasedOnRespond:(BOOL)a3;
- (void)setToIsTopDirectAddressesBasedOnScroll:(BOOL)a3;
- (void)setToIsTopDirectAddressesBasedOnSend:(BOOL)a3;
- (void)setToIsTopDirectAddressesBasedOnView:(BOOL)a3;
- (void)setToIsTopIndirectAddressesBasedOnRespond:(BOOL)a3;
- (void)setToIsTopIndirectAddressesBasedOnScroll:(BOOL)a3;
- (void)setToIsTopIndirectAddressesBasedOnSend:(BOOL)a3;
- (void)setToIsTopIndirectAddressesBasedOnView:(BOOL)a3;
- (void)setToIsVip:(BOOL)a3;
- (void)setUnknownFeatureCount:(unsigned int)a3;
- (void)setUserIsBcc:(BOOL)a3;
- (void)setUserIsCc:(BOOL)a3;
- (void)setUserIsSender:(BOOL)a3;
- (void)setUserIsTo:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation EDPBModelFeaturesImportant

- (void)setUnknownFeatureCount:(unsigned int)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_unknownFeatureCount = a3;
}

- (void)setHasUnknownFeatureCount:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasUnknownFeatureCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCcContainsContact:(BOOL)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_ccContainsContact = a3;
}

- (void)setHasCcContainsContact:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasCcContainsContact
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCcIsTopDirectAddressesBasedOnRespond:(BOOL)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_ccIsTopDirectAddressesBasedOnRespond = a3;
}

- (void)setHasCcIsTopDirectAddressesBasedOnRespond:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasCcIsTopDirectAddressesBasedOnRespond
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCcIsTopDirectAddressesBasedOnScroll:(BOOL)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_ccIsTopDirectAddressesBasedOnScroll = a3;
}

- (void)setHasCcIsTopDirectAddressesBasedOnScroll:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasCcIsTopDirectAddressesBasedOnScroll
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCcIsTopDirectAddressesBasedOnSend:(BOOL)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_ccIsTopDirectAddressesBasedOnSend = a3;
}

- (void)setHasCcIsTopDirectAddressesBasedOnSend:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasCcIsTopDirectAddressesBasedOnSend
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCcIsTopDirectAddressesBasedOnView:(BOOL)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_ccIsTopDirectAddressesBasedOnView = a3;
}

- (void)setHasCcIsTopDirectAddressesBasedOnView:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasCcIsTopDirectAddressesBasedOnView
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCcIsTopIndirectAddressesBasedOnRespond:(BOOL)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_ccIsTopIndirectAddressesBasedOnRespond = a3;
}

- (void)setHasCcIsTopIndirectAddressesBasedOnRespond:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasCcIsTopIndirectAddressesBasedOnRespond
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setCcIsTopIndirectAddressesBasedOnScroll:(BOOL)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_ccIsTopIndirectAddressesBasedOnScroll = a3;
}

- (void)setHasCcIsTopIndirectAddressesBasedOnScroll:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasCcIsTopIndirectAddressesBasedOnScroll
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCcIsTopIndirectAddressesBasedOnSend:(BOOL)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_ccIsTopIndirectAddressesBasedOnSend = a3;
}

- (void)setHasCcIsTopIndirectAddressesBasedOnSend:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCcIsTopIndirectAddressesBasedOnSend
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCcIsTopIndirectAddressesBasedOnView:(BOOL)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_ccIsTopIndirectAddressesBasedOnView = a3;
}

- (void)setHasCcIsTopIndirectAddressesBasedOnView:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCcIsTopIndirectAddressesBasedOnView
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCcIsVip:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_ccIsVip = a3;
}

- (void)setHasCcIsVip:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasCcIsVip
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setFromListId:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_fromListId = a3;
}

- (void)setHasFromListId:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasFromListId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMessageIsForward:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_messageIsForward = a3;
}

- (void)setHasMessageIsForward:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasMessageIsForward
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMessageIsReply:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_messageIsReply = a3;
}

- (void)setHasMessageIsReply:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasMessageIsReply
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNumRecipients:(unsigned int)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_numRecipients = a3;
}

- (void)setHasNumRecipients:(BOOL)a3
{
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasNumRecipients
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSenderIsContact:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_senderIsContact = a3;
}

- (void)setHasSenderIsContact:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasSenderIsContact
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setSenderIsTopDirectAddressesBasedOnRespond:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_senderIsTopDirectAddressesBasedOnRespond = a3;
}

- (void)setHasSenderIsTopDirectAddressesBasedOnRespond:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasSenderIsTopDirectAddressesBasedOnRespond
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSenderIsTopDirectAddressesBasedOnScroll:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_senderIsTopDirectAddressesBasedOnScroll = a3;
}

- (void)setHasSenderIsTopDirectAddressesBasedOnScroll:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSenderIsTopDirectAddressesBasedOnScroll
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSenderIsTopDirectAddressesBasedOnSend:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_senderIsTopDirectAddressesBasedOnSend = a3;
}

- (void)setHasSenderIsTopDirectAddressesBasedOnSend:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasSenderIsTopDirectAddressesBasedOnSend
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSenderIsTopDirectAddressesBasedOnView:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_senderIsTopDirectAddressesBasedOnView = a3;
}

- (void)setHasSenderIsTopDirectAddressesBasedOnView:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasSenderIsTopDirectAddressesBasedOnView
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSenderIsTopIndirectAddressesBasedOnRespond:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_senderIsTopIndirectAddressesBasedOnRespond = a3;
}

- (void)setHasSenderIsTopIndirectAddressesBasedOnRespond:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasSenderIsTopIndirectAddressesBasedOnRespond
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setSenderIsTopIndirectAddressesBasedOnScroll:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_senderIsTopIndirectAddressesBasedOnScroll = a3;
}

- (void)setHasSenderIsTopIndirectAddressesBasedOnScroll:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasSenderIsTopIndirectAddressesBasedOnScroll
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSenderIsTopIndirectAddressesBasedOnSend:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_senderIsTopIndirectAddressesBasedOnSend = a3;
}

- (void)setHasSenderIsTopIndirectAddressesBasedOnSend:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasSenderIsTopIndirectAddressesBasedOnSend
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSenderIsTopIndirectAddressesBasedOnView:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_senderIsTopIndirectAddressesBasedOnView = a3;
}

- (void)setHasSenderIsTopIndirectAddressesBasedOnView:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasSenderIsTopIndirectAddressesBasedOnView
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setSenderIsVip:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_senderIsVip = a3;
}

- (void)setHasSenderIsVip:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasSenderIsVip
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setSubjectIsTopWordsBasedOnRespond:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_subjectIsTopWordsBasedOnRespond = a3;
}

- (void)setHasSubjectIsTopWordsBasedOnRespond:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasSubjectIsTopWordsBasedOnRespond
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setSubjectIsTopWordsBasedOnScroll:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_subjectIsTopWordsBasedOnScroll = a3;
}

- (void)setHasSubjectIsTopWordsBasedOnScroll:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasSubjectIsTopWordsBasedOnScroll
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setSubjectIsTopWordsBasedOnSend:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_subjectIsTopWordsBasedOnSend = a3;
}

- (void)setHasSubjectIsTopWordsBasedOnSend:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasSubjectIsTopWordsBasedOnSend
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setSubjectIsTopWordsBasedOnView:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_subjectIsTopWordsBasedOnView = a3;
}

- (void)setHasSubjectIsTopWordsBasedOnView:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasSubjectIsTopWordsBasedOnView
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (int)timeReceived
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_timeReceived;
  }
  else {
    return 0;
  }
}

- (void)setTimeReceived:(int)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_timeReceived = a3;
}

- (void)setHasTimeReceived:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasTimeReceived
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)timeReceivedAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E6C04388[a3];
  }

  return v3;
}

- (int)StringAsTimeReceived:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NIGHT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MORNING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AFTERNOON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EVENING"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setToContainsContact:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_toContainsContact = a3;
}

- (void)setHasToContainsContact:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasToContainsContact
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setToIsTopDirectAddressesBasedOnRespond:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_toIsTopDirectAddressesBasedOnRespond = a3;
}

- (void)setHasToIsTopDirectAddressesBasedOnRespond:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasToIsTopDirectAddressesBasedOnRespond
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setToIsTopDirectAddressesBasedOnScroll:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_toIsTopDirectAddressesBasedOnScroll = a3;
}

- (void)setHasToIsTopDirectAddressesBasedOnScroll:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopDirectAddressesBasedOnScroll
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setToIsTopDirectAddressesBasedOnSend:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_toIsTopDirectAddressesBasedOnSend = a3;
}

- (void)setHasToIsTopDirectAddressesBasedOnSend:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopDirectAddressesBasedOnSend
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setToIsTopDirectAddressesBasedOnView:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_toIsTopDirectAddressesBasedOnView = a3;
}

- (void)setHasToIsTopDirectAddressesBasedOnView:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopDirectAddressesBasedOnView
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setToIsTopIndirectAddressesBasedOnRespond:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_toIsTopIndirectAddressesBasedOnRespond = a3;
}

- (void)setHasToIsTopIndirectAddressesBasedOnRespond:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopIndirectAddressesBasedOnRespond
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setToIsTopIndirectAddressesBasedOnScroll:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_toIsTopIndirectAddressesBasedOnScroll = a3;
}

- (void)setHasToIsTopIndirectAddressesBasedOnScroll:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopIndirectAddressesBasedOnScroll
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setToIsTopIndirectAddressesBasedOnSend:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_toIsTopIndirectAddressesBasedOnSend = a3;
}

- (void)setHasToIsTopIndirectAddressesBasedOnSend:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopIndirectAddressesBasedOnSend
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setToIsTopIndirectAddressesBasedOnView:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_toIsTopIndirectAddressesBasedOnView = a3;
}

- (void)setHasToIsTopIndirectAddressesBasedOnView:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopIndirectAddressesBasedOnView
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setToIsVip:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_toIsVip = a3;
}

- (void)setHasToIsVip:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasToIsVip
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setUserIsBcc:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_userIsBcc = a3;
}

- (void)setHasUserIsBcc:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasUserIsBcc
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setUserIsCc:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_userIsCc = a3;
}

- (void)setHasUserIsCc:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasUserIsCc
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setUserIsSender:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_userIsSender = a3;
}

- (void)setHasUserIsSender:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasUserIsSender
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setUserIsTo:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_userIsTo = a3;
}

- (void)setHasUserIsTo:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasUserIsTo
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EDPBModelFeaturesImportant;
  int v4 = [(EDPBModelFeaturesImportant *)&v8 description];
  v5 = [(EDPBModelFeaturesImportant *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    v5 = [NSNumber numberWithUnsignedInt:self->_unknownFeatureCount];
    [v3 setObject:v5 forKey:@"unknown_feature_count"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_ccContainsContact];
    [v3 setObject:v6 forKey:@"cc_contains_contact"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_ccIsTopDirectAddressesBasedOnRespond];
    [v3 setObject:v7 forKey:@"cc_is_top_direct_addresses_based_on_respond"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_ccIsTopDirectAddressesBasedOnScroll];
    [v3 setObject:v8 forKey:@"cc_is_top_direct_addresses_based_on_scroll"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_ccIsTopDirectAddressesBasedOnSend];
    [v3 setObject:v9 forKey:@"cc_is_top_direct_addresses_based_on_send"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_ccIsTopDirectAddressesBasedOnView];
    [v3 setObject:v10 forKey:@"cc_is_top_direct_addresses_based_on_view"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_ccIsTopIndirectAddressesBasedOnRespond];
    [v3 setObject:v11 forKey:@"cc_is_top_indirect_addresses_based_on_respond"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_ccIsTopIndirectAddressesBasedOnScroll];
    [v3 setObject:v12 forKey:@"cc_is_top_indirect_addresses_based_on_scroll"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    v13 = [NSNumber numberWithBool:self->_ccIsTopIndirectAddressesBasedOnSend];
    [v3 setObject:v13 forKey:@"cc_is_top_indirect_addresses_based_on_send"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_ccIsTopIndirectAddressesBasedOnView];
    [v3 setObject:v14 forKey:@"cc_is_top_indirect_addresses_based_on_view"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_ccIsVip];
    [v3 setObject:v15 forKey:@"cc_is_vip"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    v16 = [NSNumber numberWithBool:self->_fromListId];
    [v3 setObject:v16 forKey:@"from_list_id"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    v17 = [NSNumber numberWithBool:self->_messageIsForward];
    [v3 setObject:v17 forKey:@"message_is_forward"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    v18 = [NSNumber numberWithBool:self->_messageIsReply];
    [v3 setObject:v18 forKey:@"message_is_reply"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if (*(unsigned char *)&has)
  {
    v19 = [NSNumber numberWithUnsignedInt:self->_numRecipients];
    [v3 setObject:v19 forKey:@"num_recipients"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    v20 = [NSNumber numberWithBool:self->_senderIsContact];
    [v3 setObject:v20 forKey:@"sender_is_contact"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v21 = [NSNumber numberWithBool:self->_senderIsTopDirectAddressesBasedOnRespond];
    [v3 setObject:v21 forKey:@"sender_is_top_direct_addresses_based_on_respond"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v22 = [NSNumber numberWithBool:self->_senderIsTopDirectAddressesBasedOnScroll];
    [v3 setObject:v22 forKey:@"sender_is_top_direct_addresses_based_on_scroll"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    v23 = [NSNumber numberWithBool:self->_senderIsTopDirectAddressesBasedOnSend];
    [v3 setObject:v23 forKey:@"sender_is_top_direct_addresses_based_on_send"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    v24 = [NSNumber numberWithBool:self->_senderIsTopDirectAddressesBasedOnView];
    [v3 setObject:v24 forKey:@"sender_is_top_direct_addresses_based_on_view"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    v25 = [NSNumber numberWithBool:self->_senderIsTopIndirectAddressesBasedOnRespond];
    [v3 setObject:v25 forKey:@"sender_is_top_indirect_addresses_based_on_respond"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    v26 = [NSNumber numberWithBool:self->_senderIsTopIndirectAddressesBasedOnScroll];
    [v3 setObject:v26 forKey:@"sender_is_top_indirect_addresses_based_on_scroll"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    v27 = [NSNumber numberWithBool:self->_senderIsTopIndirectAddressesBasedOnSend];
    [v3 setObject:v27 forKey:@"sender_is_top_indirect_addresses_based_on_send"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    v28 = [NSNumber numberWithBool:self->_senderIsTopIndirectAddressesBasedOnView];
    [v3 setObject:v28 forKey:@"sender_is_top_indirect_addresses_based_on_view"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    v29 = [NSNumber numberWithBool:self->_senderIsVip];
    [v3 setObject:v29 forKey:@"sender_is_vip"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    v30 = [NSNumber numberWithBool:self->_subjectIsTopWordsBasedOnRespond];
    [v3 setObject:v30 forKey:@"subject_is_top_words_based_on_respond"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    v31 = [NSNumber numberWithBool:self->_subjectIsTopWordsBasedOnScroll];
    [v3 setObject:v31 forKey:@"subject_is_top_words_based_on_scroll"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    v32 = [NSNumber numberWithBool:self->_subjectIsTopWordsBasedOnSend];
    [v3 setObject:v32 forKey:@"subject_is_top_words_based_on_send"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    v33 = [NSNumber numberWithBool:self->_subjectIsTopWordsBasedOnView];
    [v3 setObject:v33 forKey:@"subject_is_top_words_based_on_view"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    uint64_t timeReceived = self->_timeReceived;
    if (timeReceived >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_timeReceived);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E6C04388[timeReceived];
    }
    [v3 setObject:v35 forKey:@"time_received"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    v36 = [NSNumber numberWithBool:self->_toContainsContact];
    [v3 setObject:v36 forKey:@"to_contains_contact"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    v37 = [NSNumber numberWithBool:self->_toIsTopDirectAddressesBasedOnRespond];
    [v3 setObject:v37 forKey:@"to_is_top_direct_addresses_based_on_respond"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    v38 = [NSNumber numberWithBool:self->_toIsTopDirectAddressesBasedOnScroll];
    [v3 setObject:v38 forKey:@"to_is_top_direct_addresses_based_on_scroll"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    v39 = [NSNumber numberWithBool:self->_toIsTopDirectAddressesBasedOnSend];
    [v3 setObject:v39 forKey:@"to_is_top_direct_addresses_based_on_send"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    v40 = [NSNumber numberWithBool:self->_toIsTopDirectAddressesBasedOnView];
    [v3 setObject:v40 forKey:@"to_is_top_direct_addresses_based_on_view"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x800000000) != 0)
  {
    v41 = [NSNumber numberWithBool:self->_toIsTopIndirectAddressesBasedOnRespond];
    [v3 setObject:v41 forKey:@"to_is_top_indirect_addresses_based_on_respond"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    v42 = [NSNumber numberWithBool:self->_toIsTopIndirectAddressesBasedOnScroll];
    [v3 setObject:v42 forKey:@"to_is_top_indirect_addresses_based_on_scroll"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x2000000000) != 0)
  {
    v43 = [NSNumber numberWithBool:self->_toIsTopIndirectAddressesBasedOnSend];
    [v3 setObject:v43 forKey:@"to_is_top_indirect_addresses_based_on_send"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    v44 = [NSNumber numberWithBool:self->_toIsTopIndirectAddressesBasedOnView];
    [v3 setObject:v44 forKey:@"to_is_top_indirect_addresses_based_on_view"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    v45 = [NSNumber numberWithBool:self->_toIsVip];
    [v3 setObject:v45 forKey:@"to_is_vip"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    v46 = [NSNumber numberWithBool:self->_userIsBcc];
    [v3 setObject:v46 forKey:@"user_is_bcc"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    v47 = [NSNumber numberWithBool:self->_userIsCc];
    [v3 setObject:v47 forKey:@"user_is_cc"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    v48 = [NSNumber numberWithBool:self->_userIsSender];
    [v3 setObject:v48 forKey:@"user_is_sender"];

    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x80000000000) != 0)
  {
    v49 = [NSNumber numberWithBool:self->_userIsTo];
    [v3 setObject:v49 forKey:@"user_is_to"];
  }
  id v50 = v3;

  return v50;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBModelFeaturesImportantReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint32Field();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x800000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x2000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
  }
  if ((*(void *)&has & 0x80000000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    v4[4] = self->_unknownFeatureCount;
    *((void *)v4 + 8) |= 4uLL;
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_51;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 20) = self->_ccContainsContact;
  *((void *)v4 + 8) |= 8uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((unsigned char *)v4 + 21) = self->_ccIsTopDirectAddressesBasedOnRespond;
  *((void *)v4 + 8) |= 0x10uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((unsigned char *)v4 + 22) = self->_ccIsTopDirectAddressesBasedOnScroll;
  *((void *)v4 + 8) |= 0x20uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((unsigned char *)v4 + 23) = self->_ccIsTopDirectAddressesBasedOnSend;
  *((void *)v4 + 8) |= 0x40uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((unsigned char *)v4 + 24) = self->_ccIsTopDirectAddressesBasedOnView;
  *((void *)v4 + 8) |= 0x80uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((unsigned char *)v4 + 25) = self->_ccIsTopIndirectAddressesBasedOnRespond;
  *((void *)v4 + 8) |= 0x100uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((unsigned char *)v4 + 26) = self->_ccIsTopIndirectAddressesBasedOnScroll;
  *((void *)v4 + 8) |= 0x200uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((unsigned char *)v4 + 27) = self->_ccIsTopIndirectAddressesBasedOnSend;
  *((void *)v4 + 8) |= 0x400uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((unsigned char *)v4 + 28) = self->_ccIsTopIndirectAddressesBasedOnView;
  *((void *)v4 + 8) |= 0x800uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((unsigned char *)v4 + 29) = self->_ccIsVip;
  *((void *)v4 + 8) |= 0x1000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((unsigned char *)v4 + 30) = self->_fromListId;
  *((void *)v4 + 8) |= 0x2000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((unsigned char *)v4 + 31) = self->_messageIsForward;
  *((void *)v4 + 8) |= 0x4000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((unsigned char *)v4 + 32) = self->_messageIsReply;
  *((void *)v4 + 8) |= 0x8000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_64;
  }
LABEL_63:
  v4[2] = self->_numRecipients;
  *((void *)v4 + 8) |= 1uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((unsigned char *)v4 + 33) = self->_senderIsContact;
  *((void *)v4 + 8) |= 0x10000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((unsigned char *)v4 + 34) = self->_senderIsTopDirectAddressesBasedOnRespond;
  *((void *)v4 + 8) |= 0x20000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((unsigned char *)v4 + 35) = self->_senderIsTopDirectAddressesBasedOnScroll;
  *((void *)v4 + 8) |= 0x40000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((unsigned char *)v4 + 36) = self->_senderIsTopDirectAddressesBasedOnSend;
  *((void *)v4 + 8) |= 0x80000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((unsigned char *)v4 + 37) = self->_senderIsTopDirectAddressesBasedOnView;
  *((void *)v4 + 8) |= 0x100000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((unsigned char *)v4 + 38) = self->_senderIsTopIndirectAddressesBasedOnRespond;
  *((void *)v4 + 8) |= 0x200000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((unsigned char *)v4 + 39) = self->_senderIsTopIndirectAddressesBasedOnScroll;
  *((void *)v4 + 8) |= 0x400000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((unsigned char *)v4 + 40) = self->_senderIsTopIndirectAddressesBasedOnSend;
  *((void *)v4 + 8) |= 0x800000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((unsigned char *)v4 + 41) = self->_senderIsTopIndirectAddressesBasedOnView;
  *((void *)v4 + 8) |= 0x1000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((unsigned char *)v4 + 42) = self->_senderIsVip;
  *((void *)v4 + 8) |= 0x2000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((unsigned char *)v4 + 43) = self->_subjectIsTopWordsBasedOnRespond;
  *((void *)v4 + 8) |= 0x4000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((unsigned char *)v4 + 44) = self->_subjectIsTopWordsBasedOnScroll;
  *((void *)v4 + 8) |= 0x8000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((unsigned char *)v4 + 45) = self->_subjectIsTopWordsBasedOnSend;
  *((void *)v4 + 8) |= 0x10000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((unsigned char *)v4 + 46) = self->_subjectIsTopWordsBasedOnView;
  *((void *)v4 + 8) |= 0x20000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_79;
  }
LABEL_78:
  v4[3] = self->_timeReceived;
  *((void *)v4 + 8) |= 2uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((unsigned char *)v4 + 47) = self->_toContainsContact;
  *((void *)v4 + 8) |= 0x40000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((unsigned char *)v4 + 48) = self->_toIsTopDirectAddressesBasedOnRespond;
  *((void *)v4 + 8) |= 0x80000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((unsigned char *)v4 + 49) = self->_toIsTopDirectAddressesBasedOnScroll;
  *((void *)v4 + 8) |= 0x100000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((unsigned char *)v4 + 50) = self->_toIsTopDirectAddressesBasedOnSend;
  *((void *)v4 + 8) |= 0x200000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_36:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((unsigned char *)v4 + 51) = self->_toIsTopDirectAddressesBasedOnView;
  *((void *)v4 + 8) |= 0x400000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((unsigned char *)v4 + 52) = self->_toIsTopIndirectAddressesBasedOnRespond;
  *((void *)v4 + 8) |= 0x800000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((unsigned char *)v4 + 53) = self->_toIsTopIndirectAddressesBasedOnScroll;
  *((void *)v4 + 8) |= 0x1000000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_39:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((unsigned char *)v4 + 54) = self->_toIsTopIndirectAddressesBasedOnSend;
  *((void *)v4 + 8) |= 0x2000000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((unsigned char *)v4 + 55) = self->_toIsTopIndirectAddressesBasedOnView;
  *((void *)v4 + 8) |= 0x4000000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((unsigned char *)v4 + 56) = self->_toIsVip;
  *((void *)v4 + 8) |= 0x8000000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_42:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((unsigned char *)v4 + 57) = self->_userIsBcc;
  *((void *)v4 + 8) |= 0x10000000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((unsigned char *)v4 + 58) = self->_userIsCc;
  *((void *)v4 + 8) |= 0x20000000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_44:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_91:
  *((unsigned char *)v4 + 59) = self->_userIsSender;
  *((void *)v4 + 8) |= 0x40000000000uLL;
  if ((*(void *)&self->_has & 0x80000000000) != 0)
  {
LABEL_45:
    *((unsigned char *)v4 + 60) = self->_userIsTo;
    *((void *)v4 + 8) |= 0x80000000000uLL;
  }
LABEL_46:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    *(_DWORD *)(v4 + 16) = self->_unknownFeatureCount;
    *(void *)(v4 + 64) |= 4uLL;
    $97E03A411929B79E081860F9A198F5DE has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v4 + 20) = self->_ccContainsContact;
  *(void *)(v4 + 64) |= 8uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(unsigned char *)(v4 + 21) = self->_ccIsTopDirectAddressesBasedOnRespond;
  *(void *)(v4 + 64) |= 0x10uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(unsigned char *)(v4 + 22) = self->_ccIsTopDirectAddressesBasedOnScroll;
  *(void *)(v4 + 64) |= 0x20uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(unsigned char *)(v4 + 23) = self->_ccIsTopDirectAddressesBasedOnSend;
  *(void *)(v4 + 64) |= 0x40uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(unsigned char *)(v4 + 24) = self->_ccIsTopDirectAddressesBasedOnView;
  *(void *)(v4 + 64) |= 0x80uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(unsigned char *)(v4 + 25) = self->_ccIsTopIndirectAddressesBasedOnRespond;
  *(void *)(v4 + 64) |= 0x100uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(unsigned char *)(v4 + 26) = self->_ccIsTopIndirectAddressesBasedOnScroll;
  *(void *)(v4 + 64) |= 0x200uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(unsigned char *)(v4 + 27) = self->_ccIsTopIndirectAddressesBasedOnSend;
  *(void *)(v4 + 64) |= 0x400uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(unsigned char *)(v4 + 28) = self->_ccIsTopIndirectAddressesBasedOnView;
  *(void *)(v4 + 64) |= 0x800uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(unsigned char *)(v4 + 29) = self->_ccIsVip;
  *(void *)(v4 + 64) |= 0x1000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(unsigned char *)(v4 + 30) = self->_fromListId;
  *(void *)(v4 + 64) |= 0x2000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(unsigned char *)(v4 + 31) = self->_messageIsForward;
  *(void *)(v4 + 64) |= 0x4000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(unsigned char *)(v4 + 32) = self->_messageIsReply;
  *(void *)(v4 + 64) |= 0x8000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v4 + 8) = self->_numRecipients;
  *(void *)(v4 + 64) |= 1uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(unsigned char *)(v4 + 33) = self->_senderIsContact;
  *(void *)(v4 + 64) |= 0x10000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(unsigned char *)(v4 + 34) = self->_senderIsTopDirectAddressesBasedOnRespond;
  *(void *)(v4 + 64) |= 0x20000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(unsigned char *)(v4 + 35) = self->_senderIsTopDirectAddressesBasedOnScroll;
  *(void *)(v4 + 64) |= 0x40000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(unsigned char *)(v4 + 36) = self->_senderIsTopDirectAddressesBasedOnSend;
  *(void *)(v4 + 64) |= 0x80000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(unsigned char *)(v4 + 37) = self->_senderIsTopDirectAddressesBasedOnView;
  *(void *)(v4 + 64) |= 0x100000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(unsigned char *)(v4 + 38) = self->_senderIsTopIndirectAddressesBasedOnRespond;
  *(void *)(v4 + 64) |= 0x200000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(unsigned char *)(v4 + 39) = self->_senderIsTopIndirectAddressesBasedOnScroll;
  *(void *)(v4 + 64) |= 0x400000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(unsigned char *)(v4 + 40) = self->_senderIsTopIndirectAddressesBasedOnSend;
  *(void *)(v4 + 64) |= 0x800000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(unsigned char *)(v4 + 41) = self->_senderIsTopIndirectAddressesBasedOnView;
  *(void *)(v4 + 64) |= 0x1000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(unsigned char *)(v4 + 42) = self->_senderIsVip;
  *(void *)(v4 + 64) |= 0x2000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(unsigned char *)(v4 + 43) = self->_subjectIsTopWordsBasedOnRespond;
  *(void *)(v4 + 64) |= 0x4000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(unsigned char *)(v4 + 44) = self->_subjectIsTopWordsBasedOnScroll;
  *(void *)(v4 + 64) |= 0x8000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(unsigned char *)(v4 + 45) = self->_subjectIsTopWordsBasedOnSend;
  *(void *)(v4 + 64) |= 0x10000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(unsigned char *)(v4 + 46) = self->_subjectIsTopWordsBasedOnView;
  *(void *)(v4 + 64) |= 0x20000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v4 + 12) = self->_timeReceived;
  *(void *)(v4 + 64) |= 2uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(unsigned char *)(v4 + 47) = self->_toContainsContact;
  *(void *)(v4 + 64) |= 0x40000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(unsigned char *)(v4 + 48) = self->_toIsTopDirectAddressesBasedOnRespond;
  *(void *)(v4 + 64) |= 0x80000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(unsigned char *)(v4 + 49) = self->_toIsTopDirectAddressesBasedOnScroll;
  *(void *)(v4 + 64) |= 0x100000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(unsigned char *)(v4 + 50) = self->_toIsTopDirectAddressesBasedOnSend;
  *(void *)(v4 + 64) |= 0x200000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_36:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(unsigned char *)(v4 + 51) = self->_toIsTopDirectAddressesBasedOnView;
  *(void *)(v4 + 64) |= 0x400000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(unsigned char *)(v4 + 52) = self->_toIsTopIndirectAddressesBasedOnRespond;
  *(void *)(v4 + 64) |= 0x800000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(unsigned char *)(v4 + 53) = self->_toIsTopIndirectAddressesBasedOnScroll;
  *(void *)(v4 + 64) |= 0x1000000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_39:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(unsigned char *)(v4 + 54) = self->_toIsTopIndirectAddressesBasedOnSend;
  *(void *)(v4 + 64) |= 0x2000000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_86;
  }
LABEL_85:
  *(unsigned char *)(v4 + 55) = self->_toIsTopIndirectAddressesBasedOnView;
  *(void *)(v4 + 64) |= 0x4000000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(unsigned char *)(v4 + 56) = self->_toIsVip;
  *(void *)(v4 + 64) |= 0x8000000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_42:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_88;
  }
LABEL_87:
  *(unsigned char *)(v4 + 57) = self->_userIsBcc;
  *(void *)(v4 + 64) |= 0x10000000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_44;
    }
LABEL_89:
    *(unsigned char *)(v4 + 59) = self->_userIsSender;
    *(void *)(v4 + 64) |= 0x40000000000uLL;
    if ((*(void *)&self->_has & 0x80000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_88:
  *(unsigned char *)(v4 + 58) = self->_userIsCc;
  *(void *)(v4 + 64) |= 0x20000000000uLL;
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(void *)&has & 0x40000000000) != 0) {
    goto LABEL_89;
  }
LABEL_44:
  if ((*(void *)&has & 0x80000000000) != 0)
  {
LABEL_45:
    *(unsigned char *)(v4 + 60) = self->_userIsTo;
    *(void *)(v4 + 64) |= 0x80000000000uLL;
  }
LABEL_46:
  id v6 = (id)v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_344;
  }
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  uint64_t v6 = *((void *)v4 + 8);
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_unknownFeatureCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_344;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0) {
      goto LABEL_344;
    }
    if (self->_ccContainsContact)
    {
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 20))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_344;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0) {
      goto LABEL_344;
    }
    if (self->_ccIsTopDirectAddressesBasedOnRespond)
    {
      if (!*((unsigned char *)v4 + 21)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 21))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_344;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0) {
      goto LABEL_344;
    }
    if (self->_ccIsTopDirectAddressesBasedOnScroll)
    {
      if (!*((unsigned char *)v4 + 22)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 22))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_344;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_344;
    }
    if (self->_ccIsTopDirectAddressesBasedOnSend)
    {
      if (!*((unsigned char *)v4 + 23)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 23))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_344;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0) {
      goto LABEL_344;
    }
    if (self->_ccIsTopDirectAddressesBasedOnView)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0) {
      goto LABEL_344;
    }
    if (self->_ccIsTopIndirectAddressesBasedOnRespond)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0) {
      goto LABEL_344;
    }
    if (self->_ccIsTopIndirectAddressesBasedOnScroll)
    {
      if (!*((unsigned char *)v4 + 26)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 26))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0) {
      goto LABEL_344;
    }
    if (self->_ccIsTopIndirectAddressesBasedOnSend)
    {
      if (!*((unsigned char *)v4 + 27)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 27))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0) {
      goto LABEL_344;
    }
    if (self->_ccIsTopIndirectAddressesBasedOnView)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0) {
      goto LABEL_344;
    }
    if (self->_ccIsVip)
    {
      if (!*((unsigned char *)v4 + 29)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 29))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0) {
      goto LABEL_344;
    }
    if (self->_fromListId)
    {
      if (!*((unsigned char *)v4 + 30)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 30))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0) {
      goto LABEL_344;
    }
    if (self->_messageIsForward)
    {
      if (!*((unsigned char *)v4 + 31)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 31))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0) {
      goto LABEL_344;
    }
    if (self->_messageIsReply)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_344;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_numRecipients != *((_DWORD *)v4 + 2)) {
      goto LABEL_344;
    }
  }
  else if (v6)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0) {
      goto LABEL_344;
    }
    if (self->_senderIsContact)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0) {
      goto LABEL_344;
    }
    if (self->_senderIsTopDirectAddressesBasedOnRespond)
    {
      if (!*((unsigned char *)v4 + 34)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 34))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0) {
      goto LABEL_344;
    }
    if (self->_senderIsTopDirectAddressesBasedOnScroll)
    {
      if (!*((unsigned char *)v4 + 35)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 35))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0) {
      goto LABEL_344;
    }
    if (self->_senderIsTopDirectAddressesBasedOnSend)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0) {
      goto LABEL_344;
    }
    if (self->_senderIsTopDirectAddressesBasedOnView)
    {
      if (!*((unsigned char *)v4 + 37)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 37))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0) {
      goto LABEL_344;
    }
    if (self->_senderIsTopIndirectAddressesBasedOnRespond)
    {
      if (!*((unsigned char *)v4 + 38)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 38))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0) {
      goto LABEL_344;
    }
    if (self->_senderIsTopIndirectAddressesBasedOnScroll)
    {
      if (!*((unsigned char *)v4 + 39)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 39))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0) {
      goto LABEL_344;
    }
    if (self->_senderIsTopIndirectAddressesBasedOnSend)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_344;
    }
    if (self->_senderIsTopIndirectAddressesBasedOnView)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_344;
    }
    if (self->_senderIsVip)
    {
      if (!*((unsigned char *)v4 + 42)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 42))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_344;
    }
    if (self->_subjectIsTopWordsBasedOnRespond)
    {
      if (!*((unsigned char *)v4 + 43)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 43))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0) {
      goto LABEL_344;
    }
    if (self->_subjectIsTopWordsBasedOnScroll)
    {
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 44))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0) {
      goto LABEL_344;
    }
    if (self->_subjectIsTopWordsBasedOnSend)
    {
      if (!*((unsigned char *)v4 + 45)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 45))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0) {
      goto LABEL_344;
    }
    if (self->_subjectIsTopWordsBasedOnView)
    {
      if (!*((unsigned char *)v4 + 46)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 46))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_timeReceived != *((_DWORD *)v4 + 3)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0) {
      goto LABEL_344;
    }
    if (self->_toContainsContact)
    {
      if (!*((unsigned char *)v4 + 47)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 47))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_344;
    }
    if (self->_toIsTopDirectAddressesBasedOnRespond)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x80000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v6 & 0x100000000) == 0) {
      goto LABEL_344;
    }
    if (self->_toIsTopDirectAddressesBasedOnScroll)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x100000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v6 & 0x200000000) == 0) {
      goto LABEL_344;
    }
    if (self->_toIsTopDirectAddressesBasedOnSend)
    {
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 50))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x200000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0) {
      goto LABEL_344;
    }
    if (self->_toIsTopDirectAddressesBasedOnView)
    {
      if (!*((unsigned char *)v4 + 51)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 51))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_344;
  }
  uint64_t v7 = *((void *)v4 + 8);
  if ((*(void *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0) {
      goto LABEL_344;
    }
    if (self->_toIsTopIndirectAddressesBasedOnRespond)
    {
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 52))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_toIsTopIndirectAddressesBasedOnScroll)
    {
      if (!*((unsigned char *)v4 + 53)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 53))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x2000000000) != 0)
  {
    if ((v7 & 0x2000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_toIsTopIndirectAddressesBasedOnSend)
    {
      if (!*((unsigned char *)v4 + 54)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 54))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x2000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_toIsTopIndirectAddressesBasedOnView)
    {
      if (!*((unsigned char *)v4 + 55)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 55))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_toIsVip)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_userIsBcc)
    {
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 57))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    if ((v7 & 0x20000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_userIsCc)
    {
      if (!*((unsigned char *)v4 + 58)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 58))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x20000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_userIsSender)
    {
      if (!*((unsigned char *)v4 + 59)) {
        goto LABEL_344;
      }
    }
    else if (*((unsigned char *)v4 + 59))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) != 0)
    {
      if (self->_userIsTo)
      {
        if (*((unsigned char *)v4 + 60))
        {
LABEL_342:
          BOOL v8 = 1;
          goto LABEL_345;
        }
      }
      else if (!*((unsigned char *)v4 + 60))
      {
        goto LABEL_342;
      }
    }
LABEL_344:
    BOOL v8 = 0;
    goto LABEL_345;
  }
  BOOL v8 = (v7 & 0x80000000000) == 0;
LABEL_345:

  return v8;
}

- (unint64_t)hash
{
  $97E03A411929B79E081860F9A198F5DE has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    uint64_t v47 = 2654435761 * self->_unknownFeatureCount;
    if ((*(unsigned char *)&has & 8) != 0)
    {
LABEL_3:
      uint64_t v46 = 2654435761 * self->_ccContainsContact;
      if ((*(unsigned char *)&has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_48;
    }
  }
  else
  {
    uint64_t v47 = 0;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v46 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v45 = 2654435761 * self->_ccIsTopDirectAddressesBasedOnRespond;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v45 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v44 = 2654435761 * self->_ccIsTopDirectAddressesBasedOnScroll;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v44 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v43 = 2654435761 * self->_ccIsTopDirectAddressesBasedOnSend;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v43 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_7:
    uint64_t v42 = 2654435761 * self->_ccIsTopDirectAddressesBasedOnView;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_8;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v42 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_8:
    uint64_t v41 = 2654435761 * self->_ccIsTopIndirectAddressesBasedOnRespond;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v41 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v40 = 2654435761 * self->_ccIsTopIndirectAddressesBasedOnScroll;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_10;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v40 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_10:
    uint64_t v39 = 2654435761 * self->_ccIsTopIndirectAddressesBasedOnSend;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_11;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v39 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_11:
    uint64_t v38 = 2654435761 * self->_ccIsTopIndirectAddressesBasedOnView;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v38 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_12:
    uint64_t v37 = 2654435761 * self->_ccIsVip;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v37 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_13:
    uint64_t v36 = 2654435761 * self->_fromListId;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v36 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_14:
    uint64_t v35 = 2654435761 * self->_messageIsForward;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v35 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_15:
    uint64_t v34 = 2654435761 * self->_messageIsReply;
    if (*(unsigned char *)&has) {
      goto LABEL_16;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v34 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_16:
    uint64_t v33 = 2654435761 * self->_numRecipients;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v33 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_17:
    uint64_t v32 = 2654435761 * self->_senderIsContact;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v32 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_18:
    uint64_t v31 = 2654435761 * self->_senderIsTopDirectAddressesBasedOnRespond;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_19:
    uint64_t v30 = 2654435761 * self->_senderIsTopDirectAddressesBasedOnScroll;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_20:
    uint64_t v3 = 2654435761 * self->_senderIsTopDirectAddressesBasedOnSend;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_65;
  }
LABEL_64:
  uint64_t v3 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_21:
    uint64_t v4 = 2654435761 * self->_senderIsTopDirectAddressesBasedOnView;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_66;
  }
LABEL_65:
  uint64_t v4 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_22:
    uint64_t v5 = 2654435761 * self->_senderIsTopIndirectAddressesBasedOnRespond;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v5 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_23:
    uint64_t v6 = 2654435761 * self->_senderIsTopIndirectAddressesBasedOnScroll;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_24:
    uint64_t v7 = 2654435761 * self->_senderIsTopIndirectAddressesBasedOnSend;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_25:
    uint64_t v8 = 2654435761 * self->_senderIsTopIndirectAddressesBasedOnView;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_26:
    uint64_t v9 = 2654435761 * self->_senderIsVip;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v9 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_27:
    uint64_t v10 = 2654435761 * self->_subjectIsTopWordsBasedOnRespond;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v10 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_28:
    uint64_t v11 = 2654435761 * self->_subjectIsTopWordsBasedOnScroll;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v11 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_29:
    uint64_t v12 = 2654435761 * self->_subjectIsTopWordsBasedOnSend;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_74;
  }
LABEL_73:
  uint64_t v12 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_30:
    uint64_t v13 = 2654435761 * self->_subjectIsTopWordsBasedOnView;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_31;
    }
    goto LABEL_75;
  }
LABEL_74:
  uint64_t v13 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_31:
    uint64_t v14 = 2654435761 * self->_timeReceived;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_76;
  }
LABEL_75:
  uint64_t v14 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_32:
    uint64_t v15 = 2654435761 * self->_toContainsContact;
    if ((*(_DWORD *)&has & 0x80000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_77;
  }
LABEL_76:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_33:
    uint64_t v16 = 2654435761 * self->_toIsTopDirectAddressesBasedOnRespond;
    if ((*(void *)&has & 0x100000000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_78;
  }
LABEL_77:
  uint64_t v16 = 0;
  if ((*(void *)&has & 0x100000000) != 0)
  {
LABEL_34:
    uint64_t v17 = 2654435761 * self->_toIsTopDirectAddressesBasedOnScroll;
    if ((*(void *)&has & 0x200000000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_79;
  }
LABEL_78:
  uint64_t v17 = 0;
  if ((*(void *)&has & 0x200000000) != 0)
  {
LABEL_35:
    uint64_t v18 = 2654435761 * self->_toIsTopDirectAddressesBasedOnSend;
    if ((*(void *)&has & 0x400000000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v18 = 0;
  if ((*(void *)&has & 0x400000000) != 0)
  {
LABEL_36:
    uint64_t v19 = 2654435761 * self->_toIsTopDirectAddressesBasedOnView;
    if ((*(void *)&has & 0x800000000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_81;
  }
LABEL_80:
  uint64_t v19 = 0;
  if ((*(void *)&has & 0x800000000) != 0)
  {
LABEL_37:
    uint64_t v20 = 2654435761 * self->_toIsTopIndirectAddressesBasedOnRespond;
    if ((*(void *)&has & 0x1000000000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_82;
  }
LABEL_81:
  uint64_t v20 = 0;
  if ((*(void *)&has & 0x1000000000) != 0)
  {
LABEL_38:
    uint64_t v21 = 2654435761 * self->_toIsTopIndirectAddressesBasedOnScroll;
    if ((*(void *)&has & 0x2000000000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v21 = 0;
  if ((*(void *)&has & 0x2000000000) != 0)
  {
LABEL_39:
    uint64_t v22 = 2654435761 * self->_toIsTopIndirectAddressesBasedOnSend;
    if ((*(void *)&has & 0x4000000000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_84;
  }
LABEL_83:
  uint64_t v22 = 0;
  if ((*(void *)&has & 0x4000000000) != 0)
  {
LABEL_40:
    uint64_t v23 = 2654435761 * self->_toIsTopIndirectAddressesBasedOnView;
    if ((*(void *)&has & 0x8000000000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_85;
  }
LABEL_84:
  uint64_t v23 = 0;
  if ((*(void *)&has & 0x8000000000) != 0)
  {
LABEL_41:
    uint64_t v24 = 2654435761 * self->_toIsVip;
    if ((*(void *)&has & 0x10000000000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_86;
  }
LABEL_85:
  uint64_t v24 = 0;
  if ((*(void *)&has & 0x10000000000) != 0)
  {
LABEL_42:
    uint64_t v25 = 2654435761 * self->_userIsBcc;
    if ((*(void *)&has & 0x20000000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_87;
  }
LABEL_86:
  uint64_t v25 = 0;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
LABEL_43:
    uint64_t v26 = 2654435761 * self->_userIsCc;
    if ((*(void *)&has & 0x40000000000) != 0) {
      goto LABEL_44;
    }
LABEL_88:
    uint64_t v27 = 0;
    if ((*(void *)&has & 0x80000000000) != 0) {
      goto LABEL_45;
    }
LABEL_89:
    uint64_t v28 = 0;
    return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_87:
  uint64_t v26 = 0;
  if ((*(void *)&has & 0x40000000000) == 0) {
    goto LABEL_88;
  }
LABEL_44:
  uint64_t v27 = 2654435761 * self->_userIsSender;
  if ((*(void *)&has & 0x80000000000) == 0) {
    goto LABEL_89;
  }
LABEL_45:
  uint64_t v28 = 2654435761 * self->_userIsTo;
  return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 4) != 0)
  {
    self->_unknownFeatureCount = *((_DWORD *)v4 + 4);
    *(void *)&self->_has |= 4uLL;
    uint64_t v5 = *((void *)v4 + 8);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_51;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_ccContainsContact = *((unsigned char *)v4 + 20);
  *(void *)&self->_has |= 8uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_ccIsTopDirectAddressesBasedOnRespond = *((unsigned char *)v4 + 21);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_ccIsTopDirectAddressesBasedOnScroll = *((unsigned char *)v4 + 22);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_ccIsTopDirectAddressesBasedOnSend = *((unsigned char *)v4 + 23);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_ccIsTopDirectAddressesBasedOnView = *((unsigned char *)v4 + 24);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_ccIsTopIndirectAddressesBasedOnRespond = *((unsigned char *)v4 + 25);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_ccIsTopIndirectAddressesBasedOnScroll = *((unsigned char *)v4 + 26);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_ccIsTopIndirectAddressesBasedOnSend = *((unsigned char *)v4 + 27);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_ccIsTopIndirectAddressesBasedOnView = *((unsigned char *)v4 + 28);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_ccIsVip = *((unsigned char *)v4 + 29);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x2000) == 0)
  {
LABEL_13:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_fromListId = *((unsigned char *)v4 + 30);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x4000) == 0)
  {
LABEL_14:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_messageIsForward = *((unsigned char *)v4 + 31);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x8000) == 0)
  {
LABEL_15:
    if ((v5 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_messageIsReply = *((unsigned char *)v4 + 32);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 1) == 0)
  {
LABEL_16:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_numRecipients = *((_DWORD *)v4 + 2);
  *(void *)&self->_has |= 1uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x10000) == 0)
  {
LABEL_17:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_senderIsContact = *((unsigned char *)v4 + 33);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x20000) == 0)
  {
LABEL_18:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_senderIsTopDirectAddressesBasedOnRespond = *((unsigned char *)v4 + 34);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x40000) == 0)
  {
LABEL_19:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_senderIsTopDirectAddressesBasedOnScroll = *((unsigned char *)v4 + 35);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x80000) == 0)
  {
LABEL_20:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_senderIsTopDirectAddressesBasedOnSend = *((unsigned char *)v4 + 36);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x100000) == 0)
  {
LABEL_21:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_senderIsTopDirectAddressesBasedOnView = *((unsigned char *)v4 + 37);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x200000) == 0)
  {
LABEL_22:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_senderIsTopIndirectAddressesBasedOnRespond = *((unsigned char *)v4 + 38);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x400000) == 0)
  {
LABEL_23:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_senderIsTopIndirectAddressesBasedOnScroll = *((unsigned char *)v4 + 39);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x800000) == 0)
  {
LABEL_24:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_senderIsTopIndirectAddressesBasedOnSend = *((unsigned char *)v4 + 40);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_25:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_senderIsTopIndirectAddressesBasedOnView = *((unsigned char *)v4 + 41);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_26:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_senderIsVip = *((unsigned char *)v4 + 42);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_subjectIsTopWordsBasedOnRespond = *((unsigned char *)v4 + 43);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_subjectIsTopWordsBasedOnScroll = *((unsigned char *)v4 + 44);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_subjectIsTopWordsBasedOnSend = *((unsigned char *)v4 + 45);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_30:
    if ((v5 & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_subjectIsTopWordsBasedOnView = *((unsigned char *)v4 + 46);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 2) == 0)
  {
LABEL_31:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_uint64_t timeReceived = *((_DWORD *)v4 + 3);
  *(void *)&self->_has |= 2uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_toContainsContact = *((unsigned char *)v4 + 47);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_toIsTopDirectAddressesBasedOnRespond = *((unsigned char *)v4 + 48);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_toIsTopDirectAddressesBasedOnScroll = *((unsigned char *)v4 + 49);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_35:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_toIsTopDirectAddressesBasedOnSend = *((unsigned char *)v4 + 50);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_36:
    if ((v5 & 0x800000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_toIsTopDirectAddressesBasedOnView = *((unsigned char *)v4 + 51);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_37:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_toIsTopIndirectAddressesBasedOnRespond = *((unsigned char *)v4 + 52);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x2000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_toIsTopIndirectAddressesBasedOnScroll = *((unsigned char *)v4 + 53);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x4000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_toIsTopIndirectAddressesBasedOnSend = *((unsigned char *)v4 + 54);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_40:
    if ((v5 & 0x8000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_toIsTopIndirectAddressesBasedOnView = *((unsigned char *)v4 + 55);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x10000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_toIsVip = *((unsigned char *)v4 + 56);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_42:
    if ((v5 & 0x20000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_userIsBcc = *((unsigned char *)v4 + 57);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((v5 & 0x40000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_userIsCc = *((unsigned char *)v4 + 58);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v5 = *((void *)v4 + 8);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((v5 & 0x80000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_91:
  self->_userIsSender = *((unsigned char *)v4 + 59);
  *(void *)&self->_has |= 0x40000000000uLL;
  if ((*((void *)v4 + 8) & 0x80000000000) != 0)
  {
LABEL_45:
    self->_userIsTo = *((unsigned char *)v4 + 60);
    *(void *)&self->_has |= 0x80000000000uLL;
  }
LABEL_46:
}

- (unsigned)unknownFeatureCount
{
  return self->_unknownFeatureCount;
}

- (BOOL)ccContainsContact
{
  return self->_ccContainsContact;
}

- (BOOL)ccIsTopDirectAddressesBasedOnRespond
{
  return self->_ccIsTopDirectAddressesBasedOnRespond;
}

- (BOOL)ccIsTopDirectAddressesBasedOnScroll
{
  return self->_ccIsTopDirectAddressesBasedOnScroll;
}

- (BOOL)ccIsTopDirectAddressesBasedOnSend
{
  return self->_ccIsTopDirectAddressesBasedOnSend;
}

- (BOOL)ccIsTopDirectAddressesBasedOnView
{
  return self->_ccIsTopDirectAddressesBasedOnView;
}

- (BOOL)ccIsTopIndirectAddressesBasedOnRespond
{
  return self->_ccIsTopIndirectAddressesBasedOnRespond;
}

- (BOOL)ccIsTopIndirectAddressesBasedOnScroll
{
  return self->_ccIsTopIndirectAddressesBasedOnScroll;
}

- (BOOL)ccIsTopIndirectAddressesBasedOnSend
{
  return self->_ccIsTopIndirectAddressesBasedOnSend;
}

- (BOOL)ccIsTopIndirectAddressesBasedOnView
{
  return self->_ccIsTopIndirectAddressesBasedOnView;
}

- (BOOL)ccIsVip
{
  return self->_ccIsVip;
}

- (BOOL)fromListId
{
  return self->_fromListId;
}

- (BOOL)messageIsForward
{
  return self->_messageIsForward;
}

- (BOOL)messageIsReply
{
  return self->_messageIsReply;
}

- (unsigned)numRecipients
{
  return self->_numRecipients;
}

- (BOOL)senderIsContact
{
  return self->_senderIsContact;
}

- (BOOL)senderIsTopDirectAddressesBasedOnRespond
{
  return self->_senderIsTopDirectAddressesBasedOnRespond;
}

- (BOOL)senderIsTopDirectAddressesBasedOnScroll
{
  return self->_senderIsTopDirectAddressesBasedOnScroll;
}

- (BOOL)senderIsTopDirectAddressesBasedOnSend
{
  return self->_senderIsTopDirectAddressesBasedOnSend;
}

- (BOOL)senderIsTopDirectAddressesBasedOnView
{
  return self->_senderIsTopDirectAddressesBasedOnView;
}

- (BOOL)senderIsTopIndirectAddressesBasedOnRespond
{
  return self->_senderIsTopIndirectAddressesBasedOnRespond;
}

- (BOOL)senderIsTopIndirectAddressesBasedOnScroll
{
  return self->_senderIsTopIndirectAddressesBasedOnScroll;
}

- (BOOL)senderIsTopIndirectAddressesBasedOnSend
{
  return self->_senderIsTopIndirectAddressesBasedOnSend;
}

- (BOOL)senderIsTopIndirectAddressesBasedOnView
{
  return self->_senderIsTopIndirectAddressesBasedOnView;
}

- (BOOL)senderIsVip
{
  return self->_senderIsVip;
}

- (BOOL)subjectIsTopWordsBasedOnRespond
{
  return self->_subjectIsTopWordsBasedOnRespond;
}

- (BOOL)subjectIsTopWordsBasedOnScroll
{
  return self->_subjectIsTopWordsBasedOnScroll;
}

- (BOOL)subjectIsTopWordsBasedOnSend
{
  return self->_subjectIsTopWordsBasedOnSend;
}

- (BOOL)subjectIsTopWordsBasedOnView
{
  return self->_subjectIsTopWordsBasedOnView;
}

- (BOOL)toContainsContact
{
  return self->_toContainsContact;
}

- (BOOL)toIsTopDirectAddressesBasedOnRespond
{
  return self->_toIsTopDirectAddressesBasedOnRespond;
}

- (BOOL)toIsTopDirectAddressesBasedOnScroll
{
  return self->_toIsTopDirectAddressesBasedOnScroll;
}

- (BOOL)toIsTopDirectAddressesBasedOnSend
{
  return self->_toIsTopDirectAddressesBasedOnSend;
}

- (BOOL)toIsTopDirectAddressesBasedOnView
{
  return self->_toIsTopDirectAddressesBasedOnView;
}

- (BOOL)toIsTopIndirectAddressesBasedOnRespond
{
  return self->_toIsTopIndirectAddressesBasedOnRespond;
}

- (BOOL)toIsTopIndirectAddressesBasedOnScroll
{
  return self->_toIsTopIndirectAddressesBasedOnScroll;
}

- (BOOL)toIsTopIndirectAddressesBasedOnSend
{
  return self->_toIsTopIndirectAddressesBasedOnSend;
}

- (BOOL)toIsTopIndirectAddressesBasedOnView
{
  return self->_toIsTopIndirectAddressesBasedOnView;
}

- (BOOL)toIsVip
{
  return self->_toIsVip;
}

- (BOOL)userIsBcc
{
  return self->_userIsBcc;
}

- (BOOL)userIsCc
{
  return self->_userIsCc;
}

- (BOOL)userIsSender
{
  return self->_userIsSender;
}

- (BOOL)userIsTo
{
  return self->_userIsTo;
}

@end