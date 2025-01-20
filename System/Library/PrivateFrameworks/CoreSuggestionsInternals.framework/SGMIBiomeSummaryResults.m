@interface SGMIBiomeSummaryResults
- (NSDictionary)biomeMessageIdByPersistentId;
- (NSDictionary)biomeSummaryByMessage;
- (SGMIBiomeSummaryResults)initWithBiomeSummaryByMessage:(id)a3 biomeMessageIdByPersistentId:(id)a4;
@end

@implementation SGMIBiomeSummaryResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeMessageIdByPersistentId, 0);
  objc_storeStrong((id *)&self->_biomeSummaryByMessage, 0);
}

- (NSDictionary)biomeMessageIdByPersistentId
{
  return self->_biomeMessageIdByPersistentId;
}

- (NSDictionary)biomeSummaryByMessage
{
  return self->_biomeSummaryByMessage;
}

- (SGMIBiomeSummaryResults)initWithBiomeSummaryByMessage:(id)a3 biomeMessageIdByPersistentId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGMIBiomeSummaryResults;
  v9 = [(SGMIBiomeSummaryResults *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_biomeSummaryByMessage, a3);
    objc_storeStrong((id *)&v10->_biomeMessageIdByPersistentId, a4);
  }

  return v10;
}

@end