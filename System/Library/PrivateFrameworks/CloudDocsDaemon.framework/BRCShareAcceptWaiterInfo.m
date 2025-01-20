@interface BRCShareAcceptWaiterInfo
- (BRCShareAcceptWaiterInfo)init;
- (NSMutableArray)waiterBlocks;
@end

@implementation BRCShareAcceptWaiterInfo

- (BRCShareAcceptWaiterInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)BRCShareAcceptWaiterInfo;
  v2 = [(BRCShareAcceptWaiterInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    waiterBlocks = v2->_waiterBlocks;
    v2->_waiterBlocks = (NSMutableArray *)v3;
  }
  return v2;
}

- (NSMutableArray)waiterBlocks
{
  return self->_waiterBlocks;
}

- (void).cxx_destruct
{
}

@end