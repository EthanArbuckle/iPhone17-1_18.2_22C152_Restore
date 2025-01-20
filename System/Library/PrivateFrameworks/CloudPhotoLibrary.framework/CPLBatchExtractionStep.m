@interface CPLBatchExtractionStep
- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6;
- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3;
- (CPLBatchExtractionStep)initWithStorage:(id)a3 scopeIdentifier:(id)a4;
- (CPLBatchExtractionStrategyStorage)storage;
- (NSString)scopeIdentifier;
- (id)description;
- (id)shortDescription;
- (void)resetConditionallyFromNewIncomingChange:(id)a3;
@end

@implementation CPLBatchExtractionStep

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (CPLBatchExtractionStrategyStorage)storage
{
  return self->_storage;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CPLBatchExtractionStep *)self shortDescription];
  v6 = [v3 stringWithFormat:@"<%@ %@>", v4, v5];

  return v6;
}

- (id)shortDescription
{
  return @"none";
}

- (void)resetConditionallyFromNewIncomingChange:(id)a3
{
  if ([(CPLBatchExtractionStep *)self shouldResetFromThisStepWithIncomingChange:a3])
  {
    [(CPLBatchExtractionStep *)self reset];
  }
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  return 1;
}

- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6
{
  if (a6)
  {
    *a6 = +[CPLErrors notImplementedError];
  }
  return 0;
}

- (CPLBatchExtractionStep)initWithStorage:(id)a3 scopeIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLBatchExtractionStep;
  v9 = [(CPLBatchExtractionStep *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a3);
    uint64_t v11 = [v8 copy];
    scopeIdentifier = v10->_scopeIdentifier;
    v10->_scopeIdentifier = (NSString *)v11;
  }
  return v10;
}

@end