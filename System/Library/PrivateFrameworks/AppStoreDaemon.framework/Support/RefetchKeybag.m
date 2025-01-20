@interface RefetchKeybag
- (RefetchKeybag)init;
@end

@implementation RefetchKeybag

- (RefetchKeybag)init
{
  v8.receiver = self;
  v8.super_class = (Class)RefetchKeybag;
  v2 = [(RefetchKeybag *)&v8 init];
  if (v2)
  {
    uint64_t v3 = sub_1000169A4();
    clientInfo = v2->_clientInfo;
    v2->_clientInfo = (AMSProcessInfo *)v3;

    v5 = [[_TtC9appstored6LogKey alloc] initWithCategory:@"RK"];
    logKey = v2->_logKey;
    v2->_logKey = v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end