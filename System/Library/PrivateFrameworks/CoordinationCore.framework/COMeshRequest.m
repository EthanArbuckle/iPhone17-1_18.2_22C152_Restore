@interface COMeshRequest
+ (id)acceptableResponses;
- (OS_nw_activity)activity;
- (double)responseTimeout;
- (void)setActivity:(id)a3;
@end

@implementation COMeshRequest

- (double)responseTimeout
{
  return 0.0;
}

+ (id)acceptableResponses
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  return v2;
}

- (OS_nw_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end