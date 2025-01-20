@interface PFUbiquityTransactionEntryLight
- (NSDate)transactionDate;
- (NSNumber)transactionNumber;
- (PFUbiquityTransactionEntryLight)init;
- (PFUbiquityTransactionEntryLight)initWithTransactionEntry:(id)a3 ubiquityRootLocation:(id)a4 andGlobalIDCache:(id)a5;
- (id)description;
- (void)dealloc;
- (void)setTransactionDate:(id)a3;
- (void)setTransactionNumber:(id)a3;
@end

@implementation PFUbiquityTransactionEntryLight

- (PFUbiquityTransactionEntryLight)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionEntryLight;
  result = [(PFUbiquityTransactionEntryLight *)&v3 init];
  if (result)
  {
    result->_globalID = 0;
    result->_transactionType = 0;
    result->_actingPeerID = 0;
    *(_OWORD *)&result->_transactionNumber = 0u;
    *(_OWORD *)&result->_kv = 0u;
  }
  return result;
}

- (PFUbiquityTransactionEntryLight)initWithTransactionEntry:(id)a3 ubiquityRootLocation:(id)a4 andGlobalIDCache:(id)a5
{
  v8 = [(PFUbiquityTransactionEntryLight *)self init];
  if (v8)
  {
    if (a3)
    {
      int v9 = objc_msgSend((id)objc_msgSend(a3, "transactionTypeNum"), "intValue");
      if ((v9 - 1) >= 3) {
        int v10 = 0;
      }
      else {
        int v10 = v9;
      }
    }
    else
    {
      int v10 = 0;
    }
    v8->_transactionType = v10;
    v8->_transactionNumber = (NSNumber *)(id)[a3 transactionNumber];
    if (v8->_transactionType == 3)
    {
      v11 = @"Baseline";
      uint64_t v12 = 24;
    }
    else
    {
      v8->_actingPeerID = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "actingPeer"), "peerKey");
      v11 = (__CFString *)+[PFUbiquityLocation createTransactionLogLocationForPeerID:storeName:modelVersionHash:logFilename:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, objc_msgSend((id)objc_msgSend(a3, "actingPeer"), "peerKey"), objc_msgSend((id)objc_msgSend(a3, "storeMetadata"), "ubiquityName"), objc_msgSend((id)objc_msgSend(a3, "storeMetadata"), "modelVersionHashString"), objc_msgSend(a3, "transactionLogFilename"), a4);
      uint64_t v12 = 48;
    }
    *(Class *)((char *)&v8->super.isa + v12) = (Class)v11;
    v8->_kv = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorString:", [a3 knowledgeVectorString]);
    v8->_storeName = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "storeMetadata"), "ubiquityName");
    v8->_transactionDate = (NSDate *)(id)[a3 transactionDate];
    v13 = -[PFUbiquityGlobalObjectIDCache createGlobalIDForGlobalIDString:]((uint64_t)a5, (void *)[a3 globalIDStr]);
    v8->_globalID = v13;
    if (!v13) {
      v8->_globalID = -[PFUbiquityGlobalObjectID initWithString:]([PFUbiquityGlobalObjectID alloc], "initWithString:", [a3 globalIDStr]);
    }
  }
  return v8;
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 24);
    [(PFUbiquityTransactionEntryLight *)self setTransactionNumber:0];
    objc_setProperty_nonatomic(self, v4, 0, 48);
    objc_setProperty_nonatomic(self, v5, 0, 56);
    objc_setProperty_nonatomic(self, v6, 0, 32);
  }
  else
  {
    [0 setTransactionNumber:0];
  }
  [(PFUbiquityTransactionEntryLight *)self setTransactionDate:0];
  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityTransactionEntryLight;
  [(PFUbiquityTransactionEntryLight *)&v7 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionEntryLight;
  return (id)[NSString stringWithFormat:@"%@\n\tstoreName: %@\n\tactingPeerID: %@\n\ttransactionNumber: %@\n\ttransactionDate: %@\n\ttransactionType: %d\n\tglobalID: %@\n\tknowledgeVector: %@\n\ttransactionLogLocation: %@\n", -[PFUbiquityTransactionEntryLight description](&v3, sel_description), self->_storeName, self->_actingPeerID, self->_transactionNumber, self->_transactionDate, self->_transactionType, self->_globalID, self->_kv, self->_transactionLogLocation];
}

- (NSNumber)transactionNumber
{
  return self->_transactionNumber;
}

- (void)setTransactionNumber:(id)a3
{
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

@end