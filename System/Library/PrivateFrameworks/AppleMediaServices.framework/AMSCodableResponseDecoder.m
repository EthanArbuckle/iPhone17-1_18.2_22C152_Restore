@interface AMSCodableResponseDecoder
- (AMSCodableResponseDecoder)init;
- (AMSCodableResponseDecoder)initWithRootClass:(Class)a3;
- (id)resultFromResult:(id)a3 error:(id *)a4;
@end

@implementation AMSCodableResponseDecoder

- (AMSCodableResponseDecoder)initWithRootClass:(Class)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  return (AMSCodableResponseDecoder *)CodableResponseDecoder.init(rootClass:)(ObjCClassMetadata);
}

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_18D798E50(v5);

  return v5;
}

- (AMSCodableResponseDecoder)init
{
}

@end