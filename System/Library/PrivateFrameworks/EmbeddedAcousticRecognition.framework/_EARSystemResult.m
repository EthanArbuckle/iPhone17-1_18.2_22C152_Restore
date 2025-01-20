@interface _EARSystemResult
- (NSArray)confidences;
- (NSArray)nBestIndexes;
- (NSArray)sausage;
- (void)setConfidences:(id)a3;
- (void)setNBestIndexes:(id)a3;
- (void)setSausage:(id)a3;
@end

@implementation _EARSystemResult

- (NSArray)sausage
{
  return self->_sausage;
}

- (void)setSausage:(id)a3
{
}

- (NSArray)nBestIndexes
{
  return self->_nBestIndexes;
}

- (void)setNBestIndexes:(id)a3
{
}

- (NSArray)confidences
{
  return self->_confidences;
}

- (void)setConfidences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidences, 0);
  objc_storeStrong((id *)&self->_nBestIndexes, 0);
  objc_storeStrong((id *)&self->_sausage, 0);
}

@end