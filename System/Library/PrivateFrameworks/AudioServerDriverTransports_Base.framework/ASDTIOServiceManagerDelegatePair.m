@interface ASDTIOServiceManagerDelegatePair
+ (id)forDelegate:(id)a3 andIOService:(id)a4;
- (ASDTIOService)ioService;
- (ASDTIOServiceManagerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setIoService:(id)a3;
@end

@implementation ASDTIOServiceManagerDelegatePair

+ (id)forDelegate:(id)a3 andIOService:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(ASDTIOServiceManagerDelegatePair);
  [(ASDTIOServiceManagerDelegatePair *)v7 setDelegate:v6];

  [(ASDTIOServiceManagerDelegatePair *)v7 setIoService:v5];
  return v7;
}

- (ASDTIOServiceManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (ASDTIOService)ioService
{
  return self->_ioService;
}

- (void)setIoService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioService, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end