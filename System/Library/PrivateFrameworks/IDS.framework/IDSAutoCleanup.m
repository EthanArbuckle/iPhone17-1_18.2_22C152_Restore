@interface IDSAutoCleanup
- (IDSAutoCleanup)initWithBlock:(id)a3;
- (void)dealloc;
- (void)incrementAccessCount;
@end

@implementation IDSAutoCleanup

- (IDSAutoCleanup)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSAutoCleanup;
  v5 = [(IDSAutoCleanup *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id cleanupBlock = v5->_cleanupBlock;
    v5->_id cleanupBlock = (id)v6;
  }
  return v5;
}

- (void)incrementAccessCount
{
}

- (void)dealloc
{
  (*((void (**)(void))self->_cleanupBlock + 2))();
  v3.receiver = self;
  v3.super_class = (Class)IDSAutoCleanup;
  [(IDSAutoCleanup *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end