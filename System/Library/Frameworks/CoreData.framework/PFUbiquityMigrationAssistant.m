@interface PFUbiquityMigrationAssistant
- (PFUbiquityMigrationAssistant)initWithUbiquityRootLocation:(id)a3 peerID:(id)a4 ubiquityName:(id)a5 modelVersionHash:(id)a6;
- (void)dealloc;
@end

@implementation PFUbiquityMigrationAssistant

- (PFUbiquityMigrationAssistant)initWithUbiquityRootLocation:(id)a3 peerID:(id)a4 ubiquityName:(id)a5 modelVersionHash:(id)a6
{
  v10 = [(PFUbiquityMigrationAssistant *)self init];
  if (v10)
  {
    v10->_ubiquityName = (NSString *)a5;
    v10->_localPeerID = (NSString *)a4;
    v10->_ubiquityRootLocation = (PFUbiquityLocation *)a3;
    v10->_currentModelVersionHash = (NSString *)a6;
  }
  return v10;
}

- (void)dealloc
{
  self->_ubiquityName = 0;
  self->_localPeerID = 0;

  self->_ubiquityRootLocation = 0;
  self->_baselineLocationsByVersionHash = 0;

  self->_receiptLocations = 0;
  self->_logLocationsByVersionHash = 0;

  self->_orderedReceipts = 0;
  self->_previousModelVersionHash = 0;

  self->_currentModelVersionHash = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMigrationAssistant;
  [(PFUbiquityMigrationAssistant *)&v3 dealloc];
}

@end