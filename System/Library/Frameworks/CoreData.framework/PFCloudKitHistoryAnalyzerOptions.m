@interface PFCloudKitHistoryAnalyzerOptions
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
@end

@implementation PFCloudKitHistoryAnalyzerOptions

- (void)dealloc
{
  self->_request = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitHistoryAnalyzerOptions;
  [(PFCloudKitHistoryAnalyzerOptions *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFCloudKitHistoryAnalyzerOptions;
  v4 = [(PFHistoryAnalyzerOptions *)&v6 copyWithZone:a3];
  v4[25] = *(&self->_includePrivateTransactions + 1);
  *((void *)v4 + 4) = self->_request;
  return v4;
}

@end