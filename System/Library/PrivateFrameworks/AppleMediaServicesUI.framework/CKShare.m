@interface CKShare
- (NSString)hashedDescription;
@end

@implementation CKShare

- (NSString)hashedDescription
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CKShare *)self identifier];
  v5 = AMSHashIfNeeded();
  v6 = +[NSString stringWithFormat:@"<%@: %p %@", v3, self, v5];

  return (NSString *)v6;
}

@end