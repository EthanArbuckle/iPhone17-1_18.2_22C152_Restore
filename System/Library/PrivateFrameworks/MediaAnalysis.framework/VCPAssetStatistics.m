@interface VCPAssetStatistics
- (unint64_t)analyzedDegraded;
- (unint64_t)analyzedUndegraded;
- (void)setAnalyzedDegraded:(unint64_t)a3;
- (void)setAnalyzedUndegraded:(unint64_t)a3;
@end

@implementation VCPAssetStatistics

- (unint64_t)analyzedDegraded
{
  return self->_analyzedDegraded;
}

- (void)setAnalyzedDegraded:(unint64_t)a3
{
  self->_analyzedDegraded = a3;
}

- (unint64_t)analyzedUndegraded
{
  return self->_analyzedUndegraded;
}

- (void)setAnalyzedUndegraded:(unint64_t)a3
{
  self->_analyzedUndegraded = a3;
}

@end