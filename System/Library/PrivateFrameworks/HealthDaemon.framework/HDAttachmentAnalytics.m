@interface HDAttachmentAnalytics
- (int64_t)numberOfAttachments;
- (int64_t)numberOfAttachmentsCreatedLast24Hours;
- (int64_t)numberOfAttachmentsWithMultipleReferences;
- (int64_t)numberOfOrphanedAttachments;
- (int64_t)numberOfOrphanedReferences;
- (int64_t)numberOfReferences;
- (int64_t)numberOfReferencesCreatedLast24Hours;
- (int64_t)numberOfTombstones;
- (int64_t)numberOfTombstonesCreatedLast24Hours;
- (int64_t)numberOfUnconfirmedFiles;
- (int64_t)totalSizeOfFiles;
- (void)setNumberOfAttachments:(int64_t)a3;
- (void)setNumberOfAttachmentsCreatedLast24Hours:(int64_t)a3;
- (void)setNumberOfAttachmentsWithMultipleReferences:(int64_t)a3;
- (void)setNumberOfOrphanedAttachments:(int64_t)a3;
- (void)setNumberOfOrphanedReferences:(int64_t)a3;
- (void)setNumberOfReferences:(int64_t)a3;
- (void)setNumberOfReferencesCreatedLast24Hours:(int64_t)a3;
- (void)setNumberOfTombstones:(int64_t)a3;
- (void)setNumberOfTombstonesCreatedLast24Hours:(int64_t)a3;
- (void)setNumberOfUnconfirmedFiles:(int64_t)a3;
- (void)setTotalSizeOfFiles:(int64_t)a3;
@end

@implementation HDAttachmentAnalytics

- (int64_t)numberOfAttachments
{
  return self->_numberOfAttachments;
}

- (void)setNumberOfAttachments:(int64_t)a3
{
  self->_numberOfAttachments = a3;
}

- (int64_t)numberOfReferences
{
  return self->_numberOfReferences;
}

- (void)setNumberOfReferences:(int64_t)a3
{
  self->_numberOfReferences = a3;
}

- (int64_t)numberOfTombstones
{
  return self->_numberOfTombstones;
}

- (void)setNumberOfTombstones:(int64_t)a3
{
  self->_numberOfTombstones = a3;
}

- (int64_t)totalSizeOfFiles
{
  return self->_totalSizeOfFiles;
}

- (void)setTotalSizeOfFiles:(int64_t)a3
{
  self->_totalSizeOfFiles = a3;
}

- (int64_t)numberOfUnconfirmedFiles
{
  return self->_numberOfUnconfirmedFiles;
}

- (void)setNumberOfUnconfirmedFiles:(int64_t)a3
{
  self->_numberOfUnconfirmedFiles = a3;
}

- (int64_t)numberOfOrphanedAttachments
{
  return self->_numberOfOrphanedAttachments;
}

- (void)setNumberOfOrphanedAttachments:(int64_t)a3
{
  self->_numberOfOrphanedAttachments = a3;
}

- (int64_t)numberOfOrphanedReferences
{
  return self->_numberOfOrphanedReferences;
}

- (void)setNumberOfOrphanedReferences:(int64_t)a3
{
  self->_numberOfOrphanedReferences = a3;
}

- (int64_t)numberOfReferencesCreatedLast24Hours
{
  return self->_numberOfReferencesCreatedLast24Hours;
}

- (void)setNumberOfReferencesCreatedLast24Hours:(int64_t)a3
{
  self->_numberOfReferencesCreatedLast24Hours = a3;
}

- (int64_t)numberOfAttachmentsCreatedLast24Hours
{
  return self->_numberOfAttachmentsCreatedLast24Hours;
}

- (void)setNumberOfAttachmentsCreatedLast24Hours:(int64_t)a3
{
  self->_numberOfAttachmentsCreatedLast24Hours = a3;
}

- (int64_t)numberOfTombstonesCreatedLast24Hours
{
  return self->_numberOfTombstonesCreatedLast24Hours;
}

- (void)setNumberOfTombstonesCreatedLast24Hours:(int64_t)a3
{
  self->_numberOfTombstonesCreatedLast24Hours = a3;
}

- (int64_t)numberOfAttachmentsWithMultipleReferences
{
  return self->_numberOfAttachmentsWithMultipleReferences;
}

- (void)setNumberOfAttachmentsWithMultipleReferences:(int64_t)a3
{
  self->_numberOfAttachmentsWithMultipleReferences = a3;
}

@end