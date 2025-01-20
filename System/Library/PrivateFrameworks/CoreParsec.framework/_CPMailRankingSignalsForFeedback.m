@interface _CPMailRankingSignalsForFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)isFlagged;
- (BOOL)isRepliedTo;
- (BOOL)isSemanticMatch;
- (BOOL)isSyntacticMatch;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasReorderedByRecency;
- (_CPMailRankingSignalsForFeedback)initWithFacade:(id)a3;
- (float)l1Score;
- (float)l2Score;
- (float)semanticScore;
- (float)syntacticScore;
- (int)averageEngagementAgeLast14Days;
- (int)averageEngagementAgeLast21Days;
- (int)averageEngagementAgeLast30Days;
- (int)averageEngagementAgeLast7Days;
- (unint64_t)daysSinceReceipt;
- (unint64_t)hash;
- (unint64_t)numDaysEngagedLast30Days;
- (unint64_t)numEngagements;
- (unsigned)countBigramMatchInAttachmentNames;
- (unsigned)countBigramMatchInAttachmentTypes;
- (unsigned)countBigramMatchInAuthorEmailAddresses;
- (unsigned)countBigramMatchInAuthors;
- (unsigned)countBigramMatchInEmailAddresses;
- (unsigned)countBigramMatchInRecipientEmailAddresses;
- (unsigned)countBigramMatchInRecipients;
- (unsigned)countBigramMatchInSubject;
- (unsigned)countBigramMatchInTextContent;
- (unsigned)countBigramPrefixMatchInAttachmentNames;
- (unsigned)countBigramPrefixMatchInAttachmentTypes;
- (unsigned)countBigramPrefixMatchInAuthorEmailAddresses;
- (unsigned)countBigramPrefixMatchInAuthors;
- (unsigned)countBigramPrefixMatchInEmailAddresses;
- (unsigned)countBigramPrefixMatchInRecipientEmailAddresses;
- (unsigned)countBigramPrefixMatchInRecipients;
- (unsigned)countBigramPrefixMatchInSubject;
- (unsigned)countBigramPrefixMatchInTextContent;
- (unsigned)countNgramMatchInAttachmentNames;
- (unsigned)countNgramMatchInAttachmentTypes;
- (unsigned)countNgramMatchInAuthorEmailAddresses;
- (unsigned)countNgramMatchInAuthors;
- (unsigned)countNgramMatchInEmailAddresses;
- (unsigned)countNgramMatchInRecipientEmailAddresses;
- (unsigned)countNgramMatchInRecipients;
- (unsigned)countNgramMatchInSubject;
- (unsigned)countNgramMatchInTextContent;
- (unsigned)countNgramPrefixMatchInAttachmentNames;
- (unsigned)countNgramPrefixMatchInAttachmentTypes;
- (unsigned)countNgramPrefixMatchInAuthorEmailAddresses;
- (unsigned)countNgramPrefixMatchInAuthors;
- (unsigned)countNgramPrefixMatchInEmailAddresses;
- (unsigned)countNgramPrefixMatchInRecipientEmailAddresses;
- (unsigned)countNgramPrefixMatchInRecipients;
- (unsigned)countNgramPrefixMatchInSubject;
- (unsigned)countNgramPrefixMatchInTextContent;
- (unsigned)countUnigramMatchInAttachmentNames;
- (unsigned)countUnigramMatchInAttachmentTypes;
- (unsigned)countUnigramMatchInAuthorEmailAddresses;
- (unsigned)countUnigramMatchInAuthors;
- (unsigned)countUnigramMatchInEmailAddresses;
- (unsigned)countUnigramMatchInRecipientEmailAddresses;
- (unsigned)countUnigramMatchInRecipients;
- (unsigned)countUnigramMatchInSubject;
- (unsigned)countUnigramMatchInTextContent;
- (unsigned)countUnigramPrefixMatchInAttachmentNames;
- (unsigned)countUnigramPrefixMatchInAttachmentTypes;
- (unsigned)countUnigramPrefixMatchInAuthorEmailAddresses;
- (unsigned)countUnigramPrefixMatchInAuthors;
- (unsigned)countUnigramPrefixMatchInEmailAddresses;
- (unsigned)countUnigramPrefixMatchInRecipientEmailAddresses;
- (unsigned)countUnigramPrefixMatchInRecipients;
- (unsigned)countUnigramPrefixMatchInSubject;
- (unsigned)countUnigramPrefixMatchInTextContent;
- (void)setAverageEngagementAgeLast14Days:(int)a3;
- (void)setAverageEngagementAgeLast21Days:(int)a3;
- (void)setAverageEngagementAgeLast30Days:(int)a3;
- (void)setAverageEngagementAgeLast7Days:(int)a3;
- (void)setCountBigramMatchInAttachmentNames:(unsigned int)a3;
- (void)setCountBigramMatchInAttachmentTypes:(unsigned int)a3;
- (void)setCountBigramMatchInAuthorEmailAddresses:(unsigned int)a3;
- (void)setCountBigramMatchInAuthors:(unsigned int)a3;
- (void)setCountBigramMatchInEmailAddresses:(unsigned int)a3;
- (void)setCountBigramMatchInRecipientEmailAddresses:(unsigned int)a3;
- (void)setCountBigramMatchInRecipients:(unsigned int)a3;
- (void)setCountBigramMatchInSubject:(unsigned int)a3;
- (void)setCountBigramMatchInTextContent:(unsigned int)a3;
- (void)setCountBigramPrefixMatchInAttachmentNames:(unsigned int)a3;
- (void)setCountBigramPrefixMatchInAttachmentTypes:(unsigned int)a3;
- (void)setCountBigramPrefixMatchInAuthorEmailAddresses:(unsigned int)a3;
- (void)setCountBigramPrefixMatchInAuthors:(unsigned int)a3;
- (void)setCountBigramPrefixMatchInEmailAddresses:(unsigned int)a3;
- (void)setCountBigramPrefixMatchInRecipientEmailAddresses:(unsigned int)a3;
- (void)setCountBigramPrefixMatchInRecipients:(unsigned int)a3;
- (void)setCountBigramPrefixMatchInSubject:(unsigned int)a3;
- (void)setCountBigramPrefixMatchInTextContent:(unsigned int)a3;
- (void)setCountNgramMatchInAttachmentNames:(unsigned int)a3;
- (void)setCountNgramMatchInAttachmentTypes:(unsigned int)a3;
- (void)setCountNgramMatchInAuthorEmailAddresses:(unsigned int)a3;
- (void)setCountNgramMatchInAuthors:(unsigned int)a3;
- (void)setCountNgramMatchInEmailAddresses:(unsigned int)a3;
- (void)setCountNgramMatchInRecipientEmailAddresses:(unsigned int)a3;
- (void)setCountNgramMatchInRecipients:(unsigned int)a3;
- (void)setCountNgramMatchInSubject:(unsigned int)a3;
- (void)setCountNgramMatchInTextContent:(unsigned int)a3;
- (void)setCountNgramPrefixMatchInAttachmentNames:(unsigned int)a3;
- (void)setCountNgramPrefixMatchInAttachmentTypes:(unsigned int)a3;
- (void)setCountNgramPrefixMatchInAuthorEmailAddresses:(unsigned int)a3;
- (void)setCountNgramPrefixMatchInAuthors:(unsigned int)a3;
- (void)setCountNgramPrefixMatchInEmailAddresses:(unsigned int)a3;
- (void)setCountNgramPrefixMatchInRecipientEmailAddresses:(unsigned int)a3;
- (void)setCountNgramPrefixMatchInRecipients:(unsigned int)a3;
- (void)setCountNgramPrefixMatchInSubject:(unsigned int)a3;
- (void)setCountNgramPrefixMatchInTextContent:(unsigned int)a3;
- (void)setCountUnigramMatchInAttachmentNames:(unsigned int)a3;
- (void)setCountUnigramMatchInAttachmentTypes:(unsigned int)a3;
- (void)setCountUnigramMatchInAuthorEmailAddresses:(unsigned int)a3;
- (void)setCountUnigramMatchInAuthors:(unsigned int)a3;
- (void)setCountUnigramMatchInEmailAddresses:(unsigned int)a3;
- (void)setCountUnigramMatchInRecipientEmailAddresses:(unsigned int)a3;
- (void)setCountUnigramMatchInRecipients:(unsigned int)a3;
- (void)setCountUnigramMatchInSubject:(unsigned int)a3;
- (void)setCountUnigramMatchInTextContent:(unsigned int)a3;
- (void)setCountUnigramPrefixMatchInAttachmentNames:(unsigned int)a3;
- (void)setCountUnigramPrefixMatchInAttachmentTypes:(unsigned int)a3;
- (void)setCountUnigramPrefixMatchInAuthorEmailAddresses:(unsigned int)a3;
- (void)setCountUnigramPrefixMatchInAuthors:(unsigned int)a3;
- (void)setCountUnigramPrefixMatchInEmailAddresses:(unsigned int)a3;
- (void)setCountUnigramPrefixMatchInRecipientEmailAddresses:(unsigned int)a3;
- (void)setCountUnigramPrefixMatchInRecipients:(unsigned int)a3;
- (void)setCountUnigramPrefixMatchInSubject:(unsigned int)a3;
- (void)setCountUnigramPrefixMatchInTextContent:(unsigned int)a3;
- (void)setDaysSinceReceipt:(unint64_t)a3;
- (void)setIsFlagged:(BOOL)a3;
- (void)setIsRepliedTo:(BOOL)a3;
- (void)setIsSemanticMatch:(BOOL)a3;
- (void)setIsSyntacticMatch:(BOOL)a3;
- (void)setL1Score:(float)a3;
- (void)setL2Score:(float)a3;
- (void)setNumDaysEngagedLast30Days:(unint64_t)a3;
- (void)setNumEngagements:(unint64_t)a3;
- (void)setSemanticScore:(float)a3;
- (void)setSyntacticScore:(float)a3;
- (void)setWasReorderedByRecency:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPMailRankingSignalsForFeedback

- (void)setCountNgramPrefixMatchInAttachmentNames:(unsigned int)a3
{
  self->_countNgramPrefixMatchInAttachmentNames = a3;
}

- (unsigned)countNgramPrefixMatchInAttachmentNames
{
  return self->_countNgramPrefixMatchInAttachmentNames;
}

- (void)setCountBigramPrefixMatchInAttachmentNames:(unsigned int)a3
{
  self->_countBigramPrefixMatchInAttachmentNames = a3;
}

- (unsigned)countBigramPrefixMatchInAttachmentNames
{
  return self->_countBigramPrefixMatchInAttachmentNames;
}

- (void)setCountUnigramPrefixMatchInAttachmentNames:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInAttachmentNames = a3;
}

- (unsigned)countUnigramPrefixMatchInAttachmentNames
{
  return self->_countUnigramPrefixMatchInAttachmentNames;
}

- (void)setCountNgramMatchInAttachmentNames:(unsigned int)a3
{
  self->_countNgramMatchInAttachmentNames = a3;
}

- (unsigned)countNgramMatchInAttachmentNames
{
  return self->_countNgramMatchInAttachmentNames;
}

- (void)setCountBigramMatchInAttachmentNames:(unsigned int)a3
{
  self->_countBigramMatchInAttachmentNames = a3;
}

- (unsigned)countBigramMatchInAttachmentNames
{
  return self->_countBigramMatchInAttachmentNames;
}

- (void)setCountUnigramMatchInAttachmentNames:(unsigned int)a3
{
  self->_countUnigramMatchInAttachmentNames = a3;
}

- (unsigned)countUnigramMatchInAttachmentNames
{
  return self->_countUnigramMatchInAttachmentNames;
}

- (void)setCountNgramPrefixMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countNgramPrefixMatchInAttachmentTypes = a3;
}

- (unsigned)countNgramPrefixMatchInAttachmentTypes
{
  return self->_countNgramPrefixMatchInAttachmentTypes;
}

- (void)setCountBigramPrefixMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countBigramPrefixMatchInAttachmentTypes = a3;
}

- (unsigned)countBigramPrefixMatchInAttachmentTypes
{
  return self->_countBigramPrefixMatchInAttachmentTypes;
}

- (void)setCountUnigramPrefixMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInAttachmentTypes = a3;
}

- (unsigned)countUnigramPrefixMatchInAttachmentTypes
{
  return self->_countUnigramPrefixMatchInAttachmentTypes;
}

- (void)setCountNgramMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countNgramMatchInAttachmentTypes = a3;
}

- (unsigned)countNgramMatchInAttachmentTypes
{
  return self->_countNgramMatchInAttachmentTypes;
}

- (void)setCountBigramMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countBigramMatchInAttachmentTypes = a3;
}

- (unsigned)countBigramMatchInAttachmentTypes
{
  return self->_countBigramMatchInAttachmentTypes;
}

- (void)setCountUnigramMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countUnigramMatchInAttachmentTypes = a3;
}

- (unsigned)countUnigramMatchInAttachmentTypes
{
  return self->_countUnigramMatchInAttachmentTypes;
}

- (void)setCountNgramPrefixMatchInEmailAddresses:(unsigned int)a3
{
  self->_countNgramPrefixMatchInEmailAddresses = a3;
}

- (unsigned)countNgramPrefixMatchInEmailAddresses
{
  return self->_countNgramPrefixMatchInEmailAddresses;
}

- (void)setCountBigramPrefixMatchInEmailAddresses:(unsigned int)a3
{
  self->_countBigramPrefixMatchInEmailAddresses = a3;
}

- (unsigned)countBigramPrefixMatchInEmailAddresses
{
  return self->_countBigramPrefixMatchInEmailAddresses;
}

- (void)setCountUnigramPrefixMatchInEmailAddresses:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInEmailAddresses = a3;
}

- (unsigned)countUnigramPrefixMatchInEmailAddresses
{
  return self->_countUnigramPrefixMatchInEmailAddresses;
}

- (void)setCountNgramMatchInEmailAddresses:(unsigned int)a3
{
  self->_countNgramMatchInEmailAddresses = a3;
}

- (unsigned)countNgramMatchInEmailAddresses
{
  return self->_countNgramMatchInEmailAddresses;
}

- (void)setCountBigramMatchInEmailAddresses:(unsigned int)a3
{
  self->_countBigramMatchInEmailAddresses = a3;
}

- (unsigned)countBigramMatchInEmailAddresses
{
  return self->_countBigramMatchInEmailAddresses;
}

- (void)setCountUnigramMatchInEmailAddresses:(unsigned int)a3
{
  self->_countUnigramMatchInEmailAddresses = a3;
}

- (unsigned)countUnigramMatchInEmailAddresses
{
  return self->_countUnigramMatchInEmailAddresses;
}

- (void)setCountNgramPrefixMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countNgramPrefixMatchInRecipientEmailAddresses = a3;
}

- (unsigned)countNgramPrefixMatchInRecipientEmailAddresses
{
  return self->_countNgramPrefixMatchInRecipientEmailAddresses;
}

- (void)setCountBigramPrefixMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countBigramPrefixMatchInRecipientEmailAddresses = a3;
}

- (unsigned)countBigramPrefixMatchInRecipientEmailAddresses
{
  return self->_countBigramPrefixMatchInRecipientEmailAddresses;
}

- (void)setCountUnigramPrefixMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInRecipientEmailAddresses = a3;
}

- (unsigned)countUnigramPrefixMatchInRecipientEmailAddresses
{
  return self->_countUnigramPrefixMatchInRecipientEmailAddresses;
}

- (void)setCountNgramMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countNgramMatchInRecipientEmailAddresses = a3;
}

- (unsigned)countNgramMatchInRecipientEmailAddresses
{
  return self->_countNgramMatchInRecipientEmailAddresses;
}

- (void)setCountBigramMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countBigramMatchInRecipientEmailAddresses = a3;
}

- (unsigned)countBigramMatchInRecipientEmailAddresses
{
  return self->_countBigramMatchInRecipientEmailAddresses;
}

- (void)setCountUnigramMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countUnigramMatchInRecipientEmailAddresses = a3;
}

- (unsigned)countUnigramMatchInRecipientEmailAddresses
{
  return self->_countUnigramMatchInRecipientEmailAddresses;
}

- (void)setCountNgramPrefixMatchInRecipients:(unsigned int)a3
{
  self->_countNgramPrefixMatchInRecipients = a3;
}

- (unsigned)countNgramPrefixMatchInRecipients
{
  return self->_countNgramPrefixMatchInRecipients;
}

- (void)setCountBigramPrefixMatchInRecipients:(unsigned int)a3
{
  self->_countBigramPrefixMatchInRecipients = a3;
}

- (unsigned)countBigramPrefixMatchInRecipients
{
  return self->_countBigramPrefixMatchInRecipients;
}

- (void)setCountUnigramPrefixMatchInRecipients:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInRecipients = a3;
}

- (unsigned)countUnigramPrefixMatchInRecipients
{
  return self->_countUnigramPrefixMatchInRecipients;
}

- (void)setCountNgramMatchInRecipients:(unsigned int)a3
{
  self->_countNgramMatchInRecipients = a3;
}

- (unsigned)countNgramMatchInRecipients
{
  return self->_countNgramMatchInRecipients;
}

- (void)setCountBigramMatchInRecipients:(unsigned int)a3
{
  self->_countBigramMatchInRecipients = a3;
}

- (unsigned)countBigramMatchInRecipients
{
  return self->_countBigramMatchInRecipients;
}

- (void)setCountUnigramMatchInRecipients:(unsigned int)a3
{
  self->_countUnigramMatchInRecipients = a3;
}

- (unsigned)countUnigramMatchInRecipients
{
  return self->_countUnigramMatchInRecipients;
}

- (void)setCountNgramPrefixMatchInTextContent:(unsigned int)a3
{
  self->_countNgramPrefixMatchInTextContent = a3;
}

- (unsigned)countNgramPrefixMatchInTextContent
{
  return self->_countNgramPrefixMatchInTextContent;
}

- (void)setCountBigramPrefixMatchInTextContent:(unsigned int)a3
{
  self->_countBigramPrefixMatchInTextContent = a3;
}

- (unsigned)countBigramPrefixMatchInTextContent
{
  return self->_countBigramPrefixMatchInTextContent;
}

- (void)setCountUnigramPrefixMatchInTextContent:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInTextContent = a3;
}

- (unsigned)countUnigramPrefixMatchInTextContent
{
  return self->_countUnigramPrefixMatchInTextContent;
}

- (void)setCountNgramMatchInTextContent:(unsigned int)a3
{
  self->_countNgramMatchInTextContent = a3;
}

- (unsigned)countNgramMatchInTextContent
{
  return self->_countNgramMatchInTextContent;
}

- (void)setCountBigramMatchInTextContent:(unsigned int)a3
{
  self->_countBigramMatchInTextContent = a3;
}

- (unsigned)countBigramMatchInTextContent
{
  return self->_countBigramMatchInTextContent;
}

- (void)setCountUnigramMatchInTextContent:(unsigned int)a3
{
  self->_countUnigramMatchInTextContent = a3;
}

- (unsigned)countUnigramMatchInTextContent
{
  return self->_countUnigramMatchInTextContent;
}

- (void)setCountNgramPrefixMatchInSubject:(unsigned int)a3
{
  self->_countNgramPrefixMatchInSubject = a3;
}

- (unsigned)countNgramPrefixMatchInSubject
{
  return self->_countNgramPrefixMatchInSubject;
}

- (void)setCountBigramPrefixMatchInSubject:(unsigned int)a3
{
  self->_countBigramPrefixMatchInSubject = a3;
}

- (unsigned)countBigramPrefixMatchInSubject
{
  return self->_countBigramPrefixMatchInSubject;
}

- (void)setCountUnigramPrefixMatchInSubject:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInSubject = a3;
}

- (unsigned)countUnigramPrefixMatchInSubject
{
  return self->_countUnigramPrefixMatchInSubject;
}

- (void)setCountNgramMatchInSubject:(unsigned int)a3
{
  self->_countNgramMatchInSubject = a3;
}

- (unsigned)countNgramMatchInSubject
{
  return self->_countNgramMatchInSubject;
}

- (void)setCountBigramMatchInSubject:(unsigned int)a3
{
  self->_countBigramMatchInSubject = a3;
}

- (unsigned)countBigramMatchInSubject
{
  return self->_countBigramMatchInSubject;
}

- (void)setCountUnigramMatchInSubject:(unsigned int)a3
{
  self->_countUnigramMatchInSubject = a3;
}

- (unsigned)countUnigramMatchInSubject
{
  return self->_countUnigramMatchInSubject;
}

- (void)setCountNgramPrefixMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countNgramPrefixMatchInAuthorEmailAddresses = a3;
}

- (unsigned)countNgramPrefixMatchInAuthorEmailAddresses
{
  return self->_countNgramPrefixMatchInAuthorEmailAddresses;
}

- (void)setCountBigramPrefixMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countBigramPrefixMatchInAuthorEmailAddresses = a3;
}

- (unsigned)countBigramPrefixMatchInAuthorEmailAddresses
{
  return self->_countBigramPrefixMatchInAuthorEmailAddresses;
}

- (void)setCountUnigramPrefixMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInAuthorEmailAddresses = a3;
}

- (unsigned)countUnigramPrefixMatchInAuthorEmailAddresses
{
  return self->_countUnigramPrefixMatchInAuthorEmailAddresses;
}

- (void)setCountNgramMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countNgramMatchInAuthorEmailAddresses = a3;
}

- (unsigned)countNgramMatchInAuthorEmailAddresses
{
  return self->_countNgramMatchInAuthorEmailAddresses;
}

- (void)setCountBigramMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countBigramMatchInAuthorEmailAddresses = a3;
}

- (unsigned)countBigramMatchInAuthorEmailAddresses
{
  return self->_countBigramMatchInAuthorEmailAddresses;
}

- (void)setCountUnigramMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countUnigramMatchInAuthorEmailAddresses = a3;
}

- (unsigned)countUnigramMatchInAuthorEmailAddresses
{
  return self->_countUnigramMatchInAuthorEmailAddresses;
}

- (void)setCountNgramPrefixMatchInAuthors:(unsigned int)a3
{
  self->_countNgramPrefixMatchInAuthors = a3;
}

- (unsigned)countNgramPrefixMatchInAuthors
{
  return self->_countNgramPrefixMatchInAuthors;
}

- (void)setCountBigramPrefixMatchInAuthors:(unsigned int)a3
{
  self->_countBigramPrefixMatchInAuthors = a3;
}

- (unsigned)countBigramPrefixMatchInAuthors
{
  return self->_countBigramPrefixMatchInAuthors;
}

- (void)setCountUnigramPrefixMatchInAuthors:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInAuthors = a3;
}

- (unsigned)countUnigramPrefixMatchInAuthors
{
  return self->_countUnigramPrefixMatchInAuthors;
}

- (void)setCountNgramMatchInAuthors:(unsigned int)a3
{
  self->_countNgramMatchInAuthors = a3;
}

- (unsigned)countNgramMatchInAuthors
{
  return self->_countNgramMatchInAuthors;
}

- (void)setCountBigramMatchInAuthors:(unsigned int)a3
{
  self->_countBigramMatchInAuthors = a3;
}

- (unsigned)countBigramMatchInAuthors
{
  return self->_countBigramMatchInAuthors;
}

- (void)setCountUnigramMatchInAuthors:(unsigned int)a3
{
  self->_countUnigramMatchInAuthors = a3;
}

- (unsigned)countUnigramMatchInAuthors
{
  return self->_countUnigramMatchInAuthors;
}

- (void)setSyntacticScore:(float)a3
{
  self->_syntacticScore = a3;
}

- (float)syntacticScore
{
  return self->_syntacticScore;
}

- (void)setSemanticScore:(float)a3
{
  self->_semanticScore = a3;
}

- (float)semanticScore
{
  return self->_semanticScore;
}

- (void)setIsSyntacticMatch:(BOOL)a3
{
  self->_isSyntacticMatch = a3;
}

- (BOOL)isSyntacticMatch
{
  return self->_isSyntacticMatch;
}

- (void)setIsSemanticMatch:(BOOL)a3
{
  self->_isSemanticMatch = a3;
}

- (BOOL)isSemanticMatch
{
  return self->_isSemanticMatch;
}

- (void)setIsRepliedTo:(BOOL)a3
{
  self->_isRepliedTo = a3;
}

- (BOOL)isRepliedTo
{
  return self->_isRepliedTo;
}

- (void)setIsFlagged:(BOOL)a3
{
  self->_isFlagged = a3;
}

- (BOOL)isFlagged
{
  return self->_isFlagged;
}

- (void)setL2Score:(float)a3
{
  self->_l2Score = a3;
}

- (float)l2Score
{
  return self->_l2Score;
}

- (void)setL1Score:(float)a3
{
  self->_l1Score = a3;
}

- (float)l1Score
{
  return self->_l1Score;
}

- (void)setDaysSinceReceipt:(unint64_t)a3
{
  self->_daysSinceReceipt = a3;
}

- (unint64_t)daysSinceReceipt
{
  return self->_daysSinceReceipt;
}

- (void)setAverageEngagementAgeLast30Days:(int)a3
{
  self->_averageEngagementAgeLast30Days = a3;
}

- (int)averageEngagementAgeLast30Days
{
  return self->_averageEngagementAgeLast30Days;
}

- (void)setAverageEngagementAgeLast21Days:(int)a3
{
  self->_averageEngagementAgeLast21Days = a3;
}

- (int)averageEngagementAgeLast21Days
{
  return self->_averageEngagementAgeLast21Days;
}

- (void)setAverageEngagementAgeLast14Days:(int)a3
{
  self->_averageEngagementAgeLast14Days = a3;
}

- (int)averageEngagementAgeLast14Days
{
  return self->_averageEngagementAgeLast14Days;
}

- (void)setAverageEngagementAgeLast7Days:(int)a3
{
  self->_averageEngagementAgeLast7Days = a3;
}

- (int)averageEngagementAgeLast7Days
{
  return self->_averageEngagementAgeLast7Days;
}

- (void)setNumDaysEngagedLast30Days:(unint64_t)a3
{
  self->_numDaysEngagedLast30Days = a3;
}

- (unint64_t)numDaysEngagedLast30Days
{
  return self->_numDaysEngagedLast30Days;
}

- (void)setNumEngagements:(unint64_t)a3
{
  self->_numEngagements = a3;
}

- (unint64_t)numEngagements
{
  return self->_numEngagements;
}

- (void)setWasReorderedByRecency:(BOOL)a3
{
  self->_wasReorderedByRecency = a3;
}

- (BOOL)wasReorderedByRecency
{
  return self->_wasReorderedByRecency;
}

- (unint64_t)hash
{
  unint64_t v78 = (2654435761u * self->_numEngagements) ^ (2654435761 * self->_wasReorderedByRecency) ^ (2654435761u
                                                                                               * self->_numDaysEngagedLast30Days) ^ (2654435761 * self->_averageEngagementAgeLast7Days) ^ (2654435761 * self->_averageEngagementAgeLast14Days) ^ (2654435761 * self->_averageEngagementAgeLast21Days) ^ (2654435761 * self->_averageEngagementAgeLast30Days);
  unint64_t v77 = 2654435761u * self->_daysSinceReceipt;
  float l1Score = self->_l1Score;
  double v4 = l1Score;
  if (l1Score < 0.0) {
    double v4 = -l1Score;
  }
  long double v5 = round(v4);
  unint64_t v76 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  float l2Score = self->_l2Score;
  double v7 = l2Score;
  if (l2Score < 0.0) {
    double v7 = -l2Score;
  }
  long double v8 = round(v7);
  unint64_t v75 = (unint64_t)(fmod(v8, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v7 - v8, 0x40uLL);
  uint64_t v73 = 2654435761 * self->_isRepliedTo;
  uint64_t v74 = 2654435761 * self->_isFlagged;
  uint64_t v71 = 2654435761 * self->_isSyntacticMatch;
  uint64_t v72 = 2654435761 * self->_isSemanticMatch;
  float semanticScore = self->_semanticScore;
  double v10 = semanticScore;
  if (semanticScore < 0.0) {
    double v10 = -semanticScore;
  }
  long double v11 = round(v10);
  unint64_t v70 = (unint64_t)(fmod(v11, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v10 - v11, 0x40uLL);
  float syntacticScore = self->_syntacticScore;
  double v13 = syntacticScore;
  if (syntacticScore < 0.0) {
    double v13 = -syntacticScore;
  }
  long double v14 = round(v13);
  unint64_t v69 = (unint64_t)(fmod(v14, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v13 - v14, 0x40uLL);
  unsigned int countBigramMatchInTextContent = self->_countBigramMatchInTextContent;
  unsigned int countNgramMatchInTextContent = self->_countNgramMatchInTextContent;
  unsigned int countUnigramPrefixMatchInTextContent = self->_countUnigramPrefixMatchInTextContent;
  unsigned int countBigramPrefixMatchInTextContent = self->_countBigramPrefixMatchInTextContent;
  unsigned int countNgramPrefixMatchInTextContent = self->_countNgramPrefixMatchInTextContent;
  unsigned int countUnigramMatchInRecipients = self->_countUnigramMatchInRecipients;
  unsigned int countBigramMatchInRecipients = self->_countBigramMatchInRecipients;
  unsigned int countNgramMatchInRecipients = self->_countNgramMatchInRecipients;
  unsigned int countUnigramPrefixMatchInRecipients = self->_countUnigramPrefixMatchInRecipients;
  unsigned int countBigramPrefixMatchInRecipients = self->_countBigramPrefixMatchInRecipients;
  unsigned int countNgramPrefixMatchInRecipients = self->_countNgramPrefixMatchInRecipients;
  unsigned int countUnigramMatchInRecipientEmailAddresses = self->_countUnigramMatchInRecipientEmailAddresses;
  unsigned int countBigramMatchInRecipientEmailAddresses = self->_countBigramMatchInRecipientEmailAddresses;
  unsigned int countNgramMatchInRecipientEmailAddresses = self->_countNgramMatchInRecipientEmailAddresses;
  unsigned int countUnigramPrefixMatchInRecipientEmailAddresses = self->_countUnigramPrefixMatchInRecipientEmailAddresses;
  unsigned int countBigramPrefixMatchInRecipientEmailAddresses = self->_countBigramPrefixMatchInRecipientEmailAddresses;
  unsigned int countNgramPrefixMatchInRecipientEmailAddresses = self->_countNgramPrefixMatchInRecipientEmailAddresses;
  unsigned int countUnigramMatchInEmailAddresses = self->_countUnigramMatchInEmailAddresses;
  unsigned int countBigramMatchInEmailAddresses = self->_countBigramMatchInEmailAddresses;
  unsigned int countNgramMatchInEmailAddresses = self->_countNgramMatchInEmailAddresses;
  unsigned int countUnigramPrefixMatchInEmailAddresses = self->_countUnigramPrefixMatchInEmailAddresses;
  unsigned int countBigramPrefixMatchInEmailAddresses = self->_countBigramPrefixMatchInEmailAddresses;
  unsigned int countNgramPrefixMatchInEmailAddresses = self->_countNgramPrefixMatchInEmailAddresses;
  unsigned int countUnigramMatchInAttachmentTypes = self->_countUnigramMatchInAttachmentTypes;
  unsigned int countBigramMatchInAttachmentTypes = self->_countBigramMatchInAttachmentTypes;
  unsigned int countNgramMatchInAttachmentTypes = self->_countNgramMatchInAttachmentTypes;
  unsigned int countUnigramPrefixMatchInAttachmentTypes = self->_countUnigramPrefixMatchInAttachmentTypes;
  unsigned int countBigramPrefixMatchInAttachmentTypes = self->_countBigramPrefixMatchInAttachmentTypes;
  unsigned int countNgramPrefixMatchInAttachmentTypes = self->_countNgramPrefixMatchInAttachmentTypes;
  unsigned int countUnigramMatchInAttachmentNames = self->_countUnigramMatchInAttachmentNames;
  unsigned int countBigramMatchInAttachmentNames = self->_countBigramMatchInAttachmentNames;
  unsigned int countNgramMatchInAttachmentNames = self->_countNgramMatchInAttachmentNames;
  unsigned int countUnigramPrefixMatchInAttachmentNames = self->_countUnigramPrefixMatchInAttachmentNames;
  uint64_t v15 = 2654435761 * self->_countUnigramMatchInAuthors;
  uint64_t v16 = 2654435761 * self->_countBigramMatchInAuthors;
  uint64_t v35 = 2654435761 * self->_countNgramMatchInAuthors;
  uint64_t v17 = 2654435761 * self->_countUnigramPrefixMatchInAuthors;
  uint64_t v18 = 2654435761 * self->_countBigramPrefixMatchInAuthors;
  uint64_t v34 = 2654435761 * self->_countNgramPrefixMatchInAuthors;
  uint64_t v19 = 2654435761 * self->_countUnigramMatchInAuthorEmailAddresses;
  uint64_t v20 = 2654435761 * self->_countBigramMatchInAuthorEmailAddresses;
  uint64_t v21 = 2654435761 * self->_countNgramMatchInAuthorEmailAddresses;
  uint64_t v22 = 2654435761 * self->_countUnigramPrefixMatchInAuthorEmailAddresses;
  uint64_t v23 = 2654435761 * self->_countBigramPrefixMatchInAuthorEmailAddresses;
  uint64_t v24 = 2654435761 * self->_countNgramPrefixMatchInAuthorEmailAddresses;
  uint64_t v25 = 2654435761 * self->_countUnigramMatchInSubject;
  uint64_t v26 = 2654435761 * self->_countBigramMatchInSubject;
  uint64_t v27 = 2654435761 * self->_countNgramMatchInSubject;
  uint64_t v28 = 2654435761 * self->_countUnigramPrefixMatchInSubject;
  uint64_t v29 = 2654435761 * self->_countBigramPrefixMatchInSubject;
  uint64_t v30 = 2654435761 * self->_countNgramPrefixMatchInSubject;
  uint64_t v31 = 2654435761 * self->_countUnigramMatchInTextContent;
  uint64_t v32 = v78 ^ v77 ^ v74 ^ v73 ^ v76 ^ v75 ^ v72 ^ v71 ^ v15 ^ v70 ^ v16 ^ v69 ^ v35 ^ v17 ^ v18 ^ v34 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ (2654435761 * countBigramMatchInTextContent) ^ (2654435761 * countNgramMatchInTextContent) ^ (2654435761 * countUnigramPrefixMatchInTextContent) ^ (2654435761 * countBigramPrefixMatchInTextContent) ^ (2654435761 * countNgramPrefixMatchInTextContent) ^ (2654435761 * countUnigramMatchInRecipients) ^ (2654435761 * countBigramMatchInRecipients) ^ (2654435761 * countNgramMatchInRecipients) ^ (2654435761 * countUnigramPrefixMatchInRecipients) ^ (2654435761 * countBigramPrefixMatchInRecipients) ^ (2654435761 * countNgramPrefixMatchInRecipients) ^ (2654435761 * countUnigramMatchInRecipientEmailAddresses) ^ (2654435761 * countBigramMatchInRecipientEmailAddresses) ^ (2654435761 * countNgramMatchInRecipientEmailAddresses) ^ (2654435761 * countUnigramPrefixMatchInRecipientEmailAddresses) ^ (2654435761 * countBigramPrefixMatchInRecipientEmailAddresses) ^ (2654435761 * countNgramPrefixMatchInRecipientEmailAddresses) ^ (2654435761 * countUnigramMatchInEmailAddresses) ^ (2654435761 * countBigramMatchInEmailAddresses) ^ (2654435761 * countNgramMatchInEmailAddresses) ^ (2654435761 * countUnigramPrefixMatchInEmailAddresses) ^ (2654435761 * countBigramPrefixMatchInEmailAddresses) ^ (2654435761 * countNgramPrefixMatchInEmailAddresses) ^ (2654435761 * countUnigramMatchInAttachmentTypes) ^ (2654435761 * countBigramMatchInAttachmentTypes) ^ (2654435761 * countNgramMatchInAttachmentTypes) ^ (2654435761 * countUnigramPrefixMatchInAttachmentTypes) ^ (2654435761 * countBigramPrefixMatchInAttachmentTypes) ^ (2654435761 * countNgramPrefixMatchInAttachmentTypes) ^ (2654435761 * countUnigramMatchInAttachmentNames) ^ (2654435761 * countBigramMatchInAttachmentNames) ^ (2654435761 * countNgramMatchInAttachmentNames) ^ (2654435761 * countUnigramPrefixMatchInAttachmentNames);
  return v32 ^ (2654435761 * self->_countBigramPrefixMatchInAttachmentNames) ^ (2654435761
                                                                                * self->_countNgramPrefixMatchInAttachmentNames);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_72;
  }
  int wasReorderedByRecency = self->_wasReorderedByRecency;
  if (wasReorderedByRecency != [v4 wasReorderedByRecency]) {
    goto LABEL_72;
  }
  unint64_t numEngagements = self->_numEngagements;
  if (numEngagements != [v4 numEngagements]) {
    goto LABEL_72;
  }
  unint64_t numDaysEngagedLast30Days = self->_numDaysEngagedLast30Days;
  if (numDaysEngagedLast30Days != [v4 numDaysEngagedLast30Days]) {
    goto LABEL_72;
  }
  int averageEngagementAgeLast7Days = self->_averageEngagementAgeLast7Days;
  if (averageEngagementAgeLast7Days != [v4 averageEngagementAgeLast7Days]) {
    goto LABEL_72;
  }
  int averageEngagementAgeLast14Days = self->_averageEngagementAgeLast14Days;
  if (averageEngagementAgeLast14Days != [v4 averageEngagementAgeLast14Days]) {
    goto LABEL_72;
  }
  int averageEngagementAgeLast21Days = self->_averageEngagementAgeLast21Days;
  if (averageEngagementAgeLast21Days != [v4 averageEngagementAgeLast21Days]) {
    goto LABEL_72;
  }
  int averageEngagementAgeLast30Days = self->_averageEngagementAgeLast30Days;
  if (averageEngagementAgeLast30Days != [v4 averageEngagementAgeLast30Days]) {
    goto LABEL_72;
  }
  unint64_t daysSinceReceipt = self->_daysSinceReceipt;
  if (daysSinceReceipt != [v4 daysSinceReceipt]) {
    goto LABEL_72;
  }
  float l1Score = self->_l1Score;
  [v4 l1Score];
  if (l1Score != v14) {
    goto LABEL_72;
  }
  float l2Score = self->_l2Score;
  [v4 l2Score];
  if (l2Score != v16) {
    goto LABEL_72;
  }
  int isFlagged = self->_isFlagged;
  if (isFlagged != [v4 isFlagged]) {
    goto LABEL_72;
  }
  int isRepliedTo = self->_isRepliedTo;
  if (isRepliedTo != [v4 isRepliedTo]) {
    goto LABEL_72;
  }
  int isSemanticMatch = self->_isSemanticMatch;
  if (isSemanticMatch != [v4 isSemanticMatch]) {
    goto LABEL_72;
  }
  int isSyntacticMatch = self->_isSyntacticMatch;
  if (isSyntacticMatch != [v4 isSyntacticMatch]) {
    goto LABEL_72;
  }
  float semanticScore = self->_semanticScore;
  [v4 semanticScore];
  if (semanticScore != v22) {
    goto LABEL_72;
  }
  float syntacticScore = self->_syntacticScore;
  [v4 syntacticScore];
  if (syntacticScore != v24) {
    goto LABEL_72;
  }
  unsigned int countUnigramMatchInAuthors = self->_countUnigramMatchInAuthors;
  if (countUnigramMatchInAuthors != [v4 countUnigramMatchInAuthors]) {
    goto LABEL_72;
  }
  unsigned int countBigramMatchInAuthors = self->_countBigramMatchInAuthors;
  if (countBigramMatchInAuthors != [v4 countBigramMatchInAuthors]) {
    goto LABEL_72;
  }
  unsigned int countNgramMatchInAuthors = self->_countNgramMatchInAuthors;
  if (countNgramMatchInAuthors != [v4 countNgramMatchInAuthors]) {
    goto LABEL_72;
  }
  unsigned int countUnigramPrefixMatchInAuthors = self->_countUnigramPrefixMatchInAuthors;
  if (countUnigramPrefixMatchInAuthors != [v4 countUnigramPrefixMatchInAuthors]) {
    goto LABEL_72;
  }
  unsigned int countBigramPrefixMatchInAuthors = self->_countBigramPrefixMatchInAuthors;
  if (countBigramPrefixMatchInAuthors != [v4 countBigramPrefixMatchInAuthors]) {
    goto LABEL_72;
  }
  unsigned int countNgramPrefixMatchInAuthors = self->_countNgramPrefixMatchInAuthors;
  if (countNgramPrefixMatchInAuthors != [v4 countNgramPrefixMatchInAuthors]) {
    goto LABEL_72;
  }
  unsigned int countUnigramMatchInAuthorEmailAddresses = self->_countUnigramMatchInAuthorEmailAddresses;
  if (countUnigramMatchInAuthorEmailAddresses != [v4 countUnigramMatchInAuthorEmailAddresses])goto LABEL_72; {
  unsigned int countBigramMatchInAuthorEmailAddresses = self->_countBigramMatchInAuthorEmailAddresses;
  }
  if (countBigramMatchInAuthorEmailAddresses != [v4 countBigramMatchInAuthorEmailAddresses])goto LABEL_72; {
  unsigned int countNgramMatchInAuthorEmailAddresses = self->_countNgramMatchInAuthorEmailAddresses;
  }
  if (countNgramMatchInAuthorEmailAddresses != [v4 countNgramMatchInAuthorEmailAddresses]) {
    goto LABEL_72;
  }
  unsigned int countUnigramPrefixMatchInAuthorEmailAddresses = self->_countUnigramPrefixMatchInAuthorEmailAddresses;
  if (countUnigramPrefixMatchInAuthorEmailAddresses != [v4 countUnigramPrefixMatchInAuthorEmailAddresses])goto LABEL_72; {
  unsigned int countBigramPrefixMatchInAuthorEmailAddresses = self->_countBigramPrefixMatchInAuthorEmailAddresses;
  }
  if (countBigramPrefixMatchInAuthorEmailAddresses != [v4 countBigramPrefixMatchInAuthorEmailAddresses])goto LABEL_72; {
  unsigned int countNgramPrefixMatchInAuthorEmailAddresses = self->_countNgramPrefixMatchInAuthorEmailAddresses;
  }
  if (countNgramPrefixMatchInAuthorEmailAddresses != [v4 countNgramPrefixMatchInAuthorEmailAddresses])goto LABEL_72; {
  unsigned int countUnigramMatchInSubject = self->_countUnigramMatchInSubject;
  }
  if (countUnigramMatchInSubject != [v4 countUnigramMatchInSubject]) {
    goto LABEL_72;
  }
  unsigned int countBigramMatchInSubject = self->_countBigramMatchInSubject;
  if (countBigramMatchInSubject != [v4 countBigramMatchInSubject]) {
    goto LABEL_72;
  }
  unsigned int countNgramMatchInSubject = self->_countNgramMatchInSubject;
  if (countNgramMatchInSubject != [v4 countNgramMatchInSubject]) {
    goto LABEL_72;
  }
  unsigned int countUnigramPrefixMatchInSubject = self->_countUnigramPrefixMatchInSubject;
  if (countUnigramPrefixMatchInSubject != [v4 countUnigramPrefixMatchInSubject]) {
    goto LABEL_72;
  }
  unsigned int countBigramPrefixMatchInSubject = self->_countBigramPrefixMatchInSubject;
  if (countBigramPrefixMatchInSubject != [v4 countBigramPrefixMatchInSubject]) {
    goto LABEL_72;
  }
  unsigned int countNgramPrefixMatchInSubject = self->_countNgramPrefixMatchInSubject;
  if (countNgramPrefixMatchInSubject != [v4 countNgramPrefixMatchInSubject]) {
    goto LABEL_72;
  }
  unsigned int countUnigramMatchInTextContent = self->_countUnigramMatchInTextContent;
  if (countUnigramMatchInTextContent != [v4 countUnigramMatchInTextContent]) {
    goto LABEL_72;
  }
  unsigned int countBigramMatchInTextContent = self->_countBigramMatchInTextContent;
  if (countBigramMatchInTextContent != [v4 countBigramMatchInTextContent]) {
    goto LABEL_72;
  }
  unsigned int countNgramMatchInTextContent = self->_countNgramMatchInTextContent;
  if (countNgramMatchInTextContent != [v4 countNgramMatchInTextContent]) {
    goto LABEL_72;
  }
  unsigned int countUnigramPrefixMatchInTextContent = self->_countUnigramPrefixMatchInTextContent;
  if (countUnigramPrefixMatchInTextContent != [v4 countUnigramPrefixMatchInTextContent]) {
    goto LABEL_72;
  }
  unsigned int countBigramPrefixMatchInTextContent = self->_countBigramPrefixMatchInTextContent;
  if (countBigramPrefixMatchInTextContent != [v4 countBigramPrefixMatchInTextContent]) {
    goto LABEL_72;
  }
  unsigned int countNgramPrefixMatchInTextContent = self->_countNgramPrefixMatchInTextContent;
  if (countNgramPrefixMatchInTextContent != [v4 countNgramPrefixMatchInTextContent]) {
    goto LABEL_72;
  }
  unsigned int countUnigramMatchInRecipients = self->_countUnigramMatchInRecipients;
  if (countUnigramMatchInRecipients != [v4 countUnigramMatchInRecipients]) {
    goto LABEL_72;
  }
  unsigned int countBigramMatchInRecipients = self->_countBigramMatchInRecipients;
  if (countBigramMatchInRecipients != [v4 countBigramMatchInRecipients]) {
    goto LABEL_72;
  }
  unsigned int countNgramMatchInRecipients = self->_countNgramMatchInRecipients;
  if (countNgramMatchInRecipients != [v4 countNgramMatchInRecipients]) {
    goto LABEL_72;
  }
  unsigned int countUnigramPrefixMatchInRecipients = self->_countUnigramPrefixMatchInRecipients;
  if (countUnigramPrefixMatchInRecipients != [v4 countUnigramPrefixMatchInRecipients]) {
    goto LABEL_72;
  }
  unsigned int countBigramPrefixMatchInRecipients = self->_countBigramPrefixMatchInRecipients;
  if (countBigramPrefixMatchInRecipients != [v4 countBigramPrefixMatchInRecipients]) {
    goto LABEL_72;
  }
  unsigned int countNgramPrefixMatchInRecipients = self->_countNgramPrefixMatchInRecipients;
  if (countNgramPrefixMatchInRecipients != [v4 countNgramPrefixMatchInRecipients]) {
    goto LABEL_72;
  }
  unsigned int countUnigramMatchInRecipientEmailAddresses = self->_countUnigramMatchInRecipientEmailAddresses;
  if (countUnigramMatchInRecipientEmailAddresses != [v4 countUnigramMatchInRecipientEmailAddresses])goto LABEL_72; {
  unsigned int countBigramMatchInRecipientEmailAddresses = self->_countBigramMatchInRecipientEmailAddresses;
  }
  if (countBigramMatchInRecipientEmailAddresses != [v4 countBigramMatchInRecipientEmailAddresses])goto LABEL_72; {
  unsigned int countNgramMatchInRecipientEmailAddresses = self->_countNgramMatchInRecipientEmailAddresses;
  }
  if (countNgramMatchInRecipientEmailAddresses != [v4 countNgramMatchInRecipientEmailAddresses])goto LABEL_72; {
  unsigned int countUnigramPrefixMatchInRecipientEmailAddresses = self->_countUnigramPrefixMatchInRecipientEmailAddresses;
  }
  if (countUnigramPrefixMatchInRecipientEmailAddresses != [v4 countUnigramPrefixMatchInRecipientEmailAddresses])goto LABEL_72; {
  unsigned int countBigramPrefixMatchInRecipientEmailAddresses = self->_countBigramPrefixMatchInRecipientEmailAddresses;
  }
  if (countBigramPrefixMatchInRecipientEmailAddresses != [v4 countBigramPrefixMatchInRecipientEmailAddresses])goto LABEL_72; {
  unsigned int countNgramPrefixMatchInRecipientEmailAddresses = self->_countNgramPrefixMatchInRecipientEmailAddresses;
  }
  if (countNgramPrefixMatchInRecipientEmailAddresses != [v4 countNgramPrefixMatchInRecipientEmailAddresses])goto LABEL_72; {
  unsigned int countUnigramMatchInEmailAddresses = self->_countUnigramMatchInEmailAddresses;
  }
  if (countUnigramMatchInEmailAddresses != [v4 countUnigramMatchInEmailAddresses]) {
    goto LABEL_72;
  }
  unsigned int countBigramMatchInEmailAddresses = self->_countBigramMatchInEmailAddresses;
  if (countBigramMatchInEmailAddresses != [v4 countBigramMatchInEmailAddresses]) {
    goto LABEL_72;
  }
  unsigned int countNgramMatchInEmailAddresses = self->_countNgramMatchInEmailAddresses;
  if (countNgramMatchInEmailAddresses != [v4 countNgramMatchInEmailAddresses]) {
    goto LABEL_72;
  }
  unsigned int countUnigramPrefixMatchInEmailAddresses = self->_countUnigramPrefixMatchInEmailAddresses;
  if (countUnigramPrefixMatchInEmailAddresses != [v4 countUnigramPrefixMatchInEmailAddresses])goto LABEL_72; {
  unsigned int countBigramPrefixMatchInEmailAddresses = self->_countBigramPrefixMatchInEmailAddresses;
  }
  if (countBigramPrefixMatchInEmailAddresses != [v4 countBigramPrefixMatchInEmailAddresses])goto LABEL_72; {
  unsigned int countNgramPrefixMatchInEmailAddresses = self->_countNgramPrefixMatchInEmailAddresses;
  }
  if (countNgramPrefixMatchInEmailAddresses != [v4 countNgramPrefixMatchInEmailAddresses]) {
    goto LABEL_72;
  }
  unsigned int countUnigramMatchInAttachmentTypes = self->_countUnigramMatchInAttachmentTypes;
  if (countUnigramMatchInAttachmentTypes != [v4 countUnigramMatchInAttachmentTypes]) {
    goto LABEL_72;
  }
  unsigned int countBigramMatchInAttachmentTypes = self->_countBigramMatchInAttachmentTypes;
  if (countBigramMatchInAttachmentTypes != [v4 countBigramMatchInAttachmentTypes]) {
    goto LABEL_72;
  }
  unsigned int countNgramMatchInAttachmentTypes = self->_countNgramMatchInAttachmentTypes;
  if (countNgramMatchInAttachmentTypes != [v4 countNgramMatchInAttachmentTypes]) {
    goto LABEL_72;
  }
  unsigned int countUnigramPrefixMatchInAttachmentTypes = self->_countUnigramPrefixMatchInAttachmentTypes;
  if (countUnigramPrefixMatchInAttachmentTypes != [v4 countUnigramPrefixMatchInAttachmentTypes])goto LABEL_72; {
  unsigned int countBigramPrefixMatchInAttachmentTypes = self->_countBigramPrefixMatchInAttachmentTypes;
  }
  if (countBigramPrefixMatchInAttachmentTypes == [v4 countBigramPrefixMatchInAttachmentTypes]&& (countNgramPrefixMatchInAttachmentTypes = self->_countNgramPrefixMatchInAttachmentTypes, countNgramPrefixMatchInAttachmentTypes == objc_msgSend(v4, "countNgramPrefixMatchInAttachmentTypes"))&& (countUnigramMatchInAttachmentNames = self->_countUnigramMatchInAttachmentNames, countUnigramMatchInAttachmentNames == objc_msgSend(v4, "countUnigramMatchInAttachmentNames"))&& (countBigramMatchInAttachmentNames = self->_countBigramMatchInAttachmentNames, countBigramMatchInAttachmentNames == objc_msgSend(v4, "countBigramMatchInAttachmentNames"))&& (countNgramMatchInAttachmentNames = self->_countNgramMatchInAttachmentNames, countNgramMatchInAttachmentNames == objc_msgSend(v4, "countNgramMatchInAttachmentNames"))&& (unsigned int countUnigramPrefixMatchInAttachmentNames = self->_countUnigramPrefixMatchInAttachmentNames, countUnigramPrefixMatchInAttachmentNames == objc_msgSend(v4, "countUnigramPrefixMatchInAttachmentNames"))&& (countBigramPrefixMatchInAttachmentNames = self->_countBigramPrefixMatchInAttachmentNames, countBigramPrefixMatchInAttachmentNames == objc_msgSend(v4,
                                                                   "countBigramPrefixMatchInAttachmentNames")))
  {
    unsigned int countNgramPrefixMatchInAttachmentNames = self->_countNgramPrefixMatchInAttachmentNames;
    BOOL v79 = countNgramPrefixMatchInAttachmentNames == [v4 countNgramPrefixMatchInAttachmentNames];
  }
  else
  {
LABEL_72:
    BOOL v79 = 0;
  }

  return v79;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPMailRankingSignalsForFeedback *)self wasReorderedByRecency]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self numEngagements]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self numDaysEngagedLast30Days]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self averageEngagementAgeLast7Days]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self averageEngagementAgeLast14Days]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self averageEngagementAgeLast21Days]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self averageEngagementAgeLast30Days]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self daysSinceReceipt]) {
    PBDataWriterWriteUint64Field();
  }
  [(_CPMailRankingSignalsForFeedback *)self l1Score];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPMailRankingSignalsForFeedback *)self l2Score];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self isFlagged]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self isRepliedTo]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self isSemanticMatch]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self isSyntacticMatch]) {
    PBDataWriterWriteBOOLField();
  }
  [(_CPMailRankingSignalsForFeedback *)self semanticScore];
  if (v6 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPMailRankingSignalsForFeedback *)self syntacticScore];
  if (v7 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramMatchInAuthors]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramMatchInAuthors]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramMatchInAuthors]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramPrefixMatchInAuthors]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramPrefixMatchInAuthors]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramPrefixMatchInAuthors]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramMatchInAuthorEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramMatchInAuthorEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramMatchInAuthorEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramPrefixMatchInAuthorEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramPrefixMatchInAuthorEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramPrefixMatchInAuthorEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramMatchInSubject]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramMatchInSubject]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramMatchInSubject]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramPrefixMatchInSubject]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramPrefixMatchInSubject]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramPrefixMatchInSubject]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramMatchInTextContent]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramMatchInTextContent]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramMatchInTextContent]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramPrefixMatchInTextContent])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramPrefixMatchInTextContent])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramPrefixMatchInTextContent])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramMatchInRecipients]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramMatchInRecipients]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramMatchInRecipients]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramPrefixMatchInRecipients])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramPrefixMatchInRecipients])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramPrefixMatchInRecipients]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramMatchInRecipientEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramMatchInRecipientEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramMatchInRecipientEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramPrefixMatchInRecipientEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramPrefixMatchInRecipientEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramPrefixMatchInRecipientEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramMatchInEmailAddresses]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramMatchInEmailAddresses]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramMatchInEmailAddresses]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramPrefixMatchInEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramPrefixMatchInEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramPrefixMatchInEmailAddresses])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramMatchInAttachmentTypes])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramMatchInAttachmentTypes]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramMatchInAttachmentTypes]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramPrefixMatchInAttachmentTypes])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramPrefixMatchInAttachmentTypes])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramPrefixMatchInAttachmentTypes])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramMatchInAttachmentNames])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramMatchInAttachmentNames]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramMatchInAttachmentNames]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countUnigramPrefixMatchInAttachmentNames])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countBigramPrefixMatchInAttachmentNames])
  {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPMailRankingSignalsForFeedback *)self countNgramPrefixMatchInAttachmentNames])
  {
    PBDataWriterWriteUint32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPMailRankingSignalsForFeedbackReadFrom(self, (uint64_t)a3, v3);
}

- (_CPMailRankingSignalsForFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_CPMailRankingSignalsForFeedback;
  float v5 = [(_CPMailRankingSignalsForFeedback *)&v24 init];
  if (v5)
  {
    -[_CPMailRankingSignalsForFeedback setWasReorderedByRecency:](v5, "setWasReorderedByRecency:", [v4 wasReorderedByRecency]);
    -[_CPMailRankingSignalsForFeedback setNumEngagements:](v5, "setNumEngagements:", [v4 numEngagements]);
    -[_CPMailRankingSignalsForFeedback setNumDaysEngagedLast30Days:](v5, "setNumDaysEngagedLast30Days:", [v4 numDaysEngagedLast30Days]);
    float v6 = [v4 averageEngagementAgeLast7Days];

    if (v6)
    {
      float v7 = [v4 averageEngagementAgeLast7Days];
      -[_CPMailRankingSignalsForFeedback setAverageEngagementAgeLast7Days:](v5, "setAverageEngagementAgeLast7Days:", [v7 intValue]);
    }
    long double v8 = [v4 averageEngagementAgeLast14Days];

    if (v8)
    {
      v9 = [v4 averageEngagementAgeLast14Days];
      -[_CPMailRankingSignalsForFeedback setAverageEngagementAgeLast14Days:](v5, "setAverageEngagementAgeLast14Days:", [v9 intValue]);
    }
    double v10 = [v4 averageEngagementAgeLast21Days];

    if (v10)
    {
      long double v11 = [v4 averageEngagementAgeLast21Days];
      -[_CPMailRankingSignalsForFeedback setAverageEngagementAgeLast21Days:](v5, "setAverageEngagementAgeLast21Days:", [v11 intValue]);
    }
    v12 = [v4 averageEngagementAgeLast30Days];

    if (v12)
    {
      double v13 = [v4 averageEngagementAgeLast30Days];
      -[_CPMailRankingSignalsForFeedback setAverageEngagementAgeLast30Days:](v5, "setAverageEngagementAgeLast30Days:", [v13 intValue]);
    }
    -[_CPMailRankingSignalsForFeedback setDaysSinceReceipt:](v5, "setDaysSinceReceipt:", [v4 daysSinceReceipt]);
    float v14 = [v4 l1Score];

    if (v14)
    {
      uint64_t v15 = [v4 l1Score];
      [v15 floatValue];
      -[_CPMailRankingSignalsForFeedback setL1Score:](v5, "setL1Score:");
    }
    float v16 = [v4 l2Score];

    if (v16)
    {
      uint64_t v17 = [v4 l2Score];
      [v17 floatValue];
      -[_CPMailRankingSignalsForFeedback setL2Score:](v5, "setL2Score:");
    }
    -[_CPMailRankingSignalsForFeedback setIsFlagged:](v5, "setIsFlagged:", [v4 isFlagged]);
    -[_CPMailRankingSignalsForFeedback setIsRepliedTo:](v5, "setIsRepliedTo:", [v4 isRepliedTo]);
    -[_CPMailRankingSignalsForFeedback setIsSemanticMatch:](v5, "setIsSemanticMatch:", [v4 isSemanticMatch]);
    -[_CPMailRankingSignalsForFeedback setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", [v4 isSyntacticMatch]);
    uint64_t v18 = [v4 semanticScore];

    if (v18)
    {
      uint64_t v19 = [v4 semanticScore];
      [v19 floatValue];
      -[_CPMailRankingSignalsForFeedback setSemanticScore:](v5, "setSemanticScore:");
    }
    uint64_t v20 = [v4 syntacticScore];

    if (v20)
    {
      uint64_t v21 = [v4 syntacticScore];
      [v21 floatValue];
      -[_CPMailRankingSignalsForFeedback setSyntacticScore:](v5, "setSyntacticScore:");
    }
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInAuthors:](v5, "setCountUnigramMatchInAuthors:", [v4 countUnigramMatchInAuthors]);
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInAuthors:](v5, "setCountBigramMatchInAuthors:", [v4 countBigramMatchInAuthors]);
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInAuthors:](v5, "setCountNgramMatchInAuthors:", [v4 countNgramMatchInAuthors]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInAuthors:](v5, "setCountUnigramPrefixMatchInAuthors:", [v4 countUnigramPrefixMatchInAuthors]);
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInAuthors:](v5, "setCountBigramPrefixMatchInAuthors:", [v4 countBigramPrefixMatchInAuthors]);
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInAuthors:](v5, "setCountNgramPrefixMatchInAuthors:", [v4 countNgramPrefixMatchInAuthors]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInAuthorEmailAddresses:](v5, "setCountUnigramMatchInAuthorEmailAddresses:", [v4 countUnigramMatchInAuthorEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInAuthorEmailAddresses:](v5, "setCountBigramMatchInAuthorEmailAddresses:", [v4 countBigramMatchInAuthorEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInAuthorEmailAddresses:](v5, "setCountNgramMatchInAuthorEmailAddresses:", [v4 countNgramMatchInAuthorEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInAuthorEmailAddresses:](v5, "setCountUnigramPrefixMatchInAuthorEmailAddresses:", [v4 countUnigramPrefixMatchInAuthorEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInAuthorEmailAddresses:](v5, "setCountBigramPrefixMatchInAuthorEmailAddresses:", [v4 countBigramPrefixMatchInAuthorEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInAuthorEmailAddresses:](v5, "setCountNgramPrefixMatchInAuthorEmailAddresses:", [v4 countNgramPrefixMatchInAuthorEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInSubject:](v5, "setCountUnigramMatchInSubject:", [v4 countUnigramMatchInSubject]);
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInSubject:](v5, "setCountBigramMatchInSubject:", [v4 countBigramMatchInSubject]);
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInSubject:](v5, "setCountNgramMatchInSubject:", [v4 countNgramMatchInSubject]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInSubject:](v5, "setCountUnigramPrefixMatchInSubject:", [v4 countUnigramPrefixMatchInSubject]);
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInSubject:](v5, "setCountBigramPrefixMatchInSubject:", [v4 countBigramPrefixMatchInSubject]);
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInSubject:](v5, "setCountNgramPrefixMatchInSubject:", [v4 countNgramPrefixMatchInSubject]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInTextContent:](v5, "setCountUnigramMatchInTextContent:", [v4 countUnigramMatchInTextContent]);
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInTextContent:](v5, "setCountBigramMatchInTextContent:", [v4 countBigramMatchInTextContent]);
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInTextContent:](v5, "setCountNgramMatchInTextContent:", [v4 countNgramMatchInTextContent]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInTextContent:](v5, "setCountUnigramPrefixMatchInTextContent:", [v4 countUnigramPrefixMatchInTextContent]);
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInTextContent:](v5, "setCountBigramPrefixMatchInTextContent:", [v4 countBigramPrefixMatchInTextContent]);
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInTextContent:](v5, "setCountNgramPrefixMatchInTextContent:", [v4 countNgramPrefixMatchInTextContent]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInRecipients:](v5, "setCountUnigramMatchInRecipients:", [v4 countUnigramMatchInRecipients]);
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInRecipients:](v5, "setCountBigramMatchInRecipients:", [v4 countBigramMatchInRecipients]);
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInRecipients:](v5, "setCountNgramMatchInRecipients:", [v4 countNgramMatchInRecipients]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInRecipients:](v5, "setCountUnigramPrefixMatchInRecipients:", [v4 countUnigramPrefixMatchInRecipients]);
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInRecipients:](v5, "setCountBigramPrefixMatchInRecipients:", [v4 countBigramPrefixMatchInRecipients]);
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInRecipients:](v5, "setCountNgramPrefixMatchInRecipients:", [v4 countNgramPrefixMatchInRecipients]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInRecipientEmailAddresses:](v5, "setCountUnigramMatchInRecipientEmailAddresses:", [v4 countUnigramMatchInRecipientEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInRecipientEmailAddresses:](v5, "setCountBigramMatchInRecipientEmailAddresses:", [v4 countBigramMatchInRecipientEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInRecipientEmailAddresses:](v5, "setCountNgramMatchInRecipientEmailAddresses:", [v4 countNgramMatchInRecipientEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInRecipientEmailAddresses:](v5, "setCountUnigramPrefixMatchInRecipientEmailAddresses:", [v4 countUnigramPrefixMatchInRecipientEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInRecipientEmailAddresses:](v5, "setCountBigramPrefixMatchInRecipientEmailAddresses:", [v4 countBigramPrefixMatchInRecipientEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInRecipientEmailAddresses:](v5, "setCountNgramPrefixMatchInRecipientEmailAddresses:", [v4 countNgramPrefixMatchInRecipientEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInEmailAddresses:](v5, "setCountUnigramMatchInEmailAddresses:", [v4 countUnigramMatchInEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInEmailAddresses:](v5, "setCountBigramMatchInEmailAddresses:", [v4 countBigramMatchInEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInEmailAddresses:](v5, "setCountNgramMatchInEmailAddresses:", [v4 countNgramMatchInEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInEmailAddresses:](v5, "setCountUnigramPrefixMatchInEmailAddresses:", [v4 countUnigramPrefixMatchInEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInEmailAddresses:](v5, "setCountBigramPrefixMatchInEmailAddresses:", [v4 countBigramPrefixMatchInEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInEmailAddresses:](v5, "setCountNgramPrefixMatchInEmailAddresses:", [v4 countNgramPrefixMatchInEmailAddresses]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInAttachmentTypes:](v5, "setCountUnigramMatchInAttachmentTypes:", [v4 countUnigramMatchInAttachmentTypes]);
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInAttachmentTypes:](v5, "setCountBigramMatchInAttachmentTypes:", [v4 countBigramMatchInAttachmentTypes]);
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInAttachmentTypes:](v5, "setCountNgramMatchInAttachmentTypes:", [v4 countNgramMatchInAttachmentTypes]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInAttachmentTypes:](v5, "setCountUnigramPrefixMatchInAttachmentTypes:", [v4 countUnigramPrefixMatchInAttachmentTypes]);
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInAttachmentTypes:](v5, "setCountBigramPrefixMatchInAttachmentTypes:", [v4 countBigramPrefixMatchInAttachmentTypes]);
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInAttachmentTypes:](v5, "setCountNgramPrefixMatchInAttachmentTypes:", [v4 countNgramPrefixMatchInAttachmentTypes]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInAttachmentNames:](v5, "setCountUnigramMatchInAttachmentNames:", [v4 countUnigramMatchInAttachmentNames]);
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInAttachmentNames:](v5, "setCountBigramMatchInAttachmentNames:", [v4 countBigramMatchInAttachmentNames]);
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInAttachmentNames:](v5, "setCountNgramMatchInAttachmentNames:", [v4 countNgramMatchInAttachmentNames]);
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInAttachmentNames:](v5, "setCountUnigramPrefixMatchInAttachmentNames:", [v4 countUnigramPrefixMatchInAttachmentNames]);
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInAttachmentNames:](v5, "setCountBigramPrefixMatchInAttachmentNames:", [v4 countBigramPrefixMatchInAttachmentNames]);
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInAttachmentNames:](v5, "setCountNgramPrefixMatchInAttachmentNames:", [v4 countNgramPrefixMatchInAttachmentNames]);
    float v22 = v5;
  }

  return v5;
}

@end