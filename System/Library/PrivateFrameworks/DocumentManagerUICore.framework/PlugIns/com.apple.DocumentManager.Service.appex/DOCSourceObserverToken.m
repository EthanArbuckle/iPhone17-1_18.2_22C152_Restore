@interface DOCSourceObserverToken
- (DOCSourceObserverToken)init;
- (NSUUID)identifier;
@end

@implementation DOCSourceObserverToken

- (DOCSourceObserverToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)DOCSourceObserverToken;
  v2 = [(DOCSourceObserverToken *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSUUID UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;
  }
  return v2;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end