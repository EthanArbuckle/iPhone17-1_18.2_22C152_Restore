@interface _GEOConfigDBOperationBase
- (_GEOConfigDBOperationBase)init;
@end

@implementation _GEOConfigDBOperationBase

- (_GEOConfigDBOperationBase)init
{
  v8.receiver = self;
  v8.super_class = (Class)_GEOConfigDBOperationBase;
  v2 = [(_GEOConfigDBOperationBase *)&v8 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    [v4 UTF8String];
    uint64_t v5 = _GEOCreateTransaction();
    id transaction = v2->_transaction;
    v2->_id transaction = (id)v5;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end