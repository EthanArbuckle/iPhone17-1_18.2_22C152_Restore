@interface PFHistoryAnalyzerOptions
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation PFHistoryAnalyzerOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((unsigned char *)result + 8) = self->_automaticallyPruneTransientRecords;
  *((void *)result + 2) = self->_transactionLimit;
  return result;
}

@end