@interface CachedApplicationRecord
- (LSApplicationRecord)record;
- (void)setRecord:(id)a3;
@end

@implementation CachedApplicationRecord

- (LSApplicationRecord)record
{
  return (LSApplicationRecord *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end