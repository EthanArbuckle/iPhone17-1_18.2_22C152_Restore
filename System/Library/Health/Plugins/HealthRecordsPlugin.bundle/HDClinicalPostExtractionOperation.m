@interface HDClinicalPostExtractionOperation
- (HDClinicalPostExtractionOperation)init;
- (HDClinicalPostExtractionOperation)initWithExtractionResult:(id)a3;
- (HDExtractionResult)extractionResult;
@end

@implementation HDClinicalPostExtractionOperation

- (HDClinicalPostExtractionOperation)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDClinicalPostExtractionOperation)initWithExtractionResult:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDClinicalPostExtractionOperation;
  v5 = [(HDClinicalPostExtractionOperation *)&v9 init];
  if (v5)
  {
    v6 = (HDExtractionResult *)[v4 copy];
    extractionResult = v5->_extractionResult;
    v5->_extractionResult = v6;
  }
  return v5;
}

- (HDExtractionResult)extractionResult
{
  return self->_extractionResult;
}

- (void).cxx_destruct
{
}

@end