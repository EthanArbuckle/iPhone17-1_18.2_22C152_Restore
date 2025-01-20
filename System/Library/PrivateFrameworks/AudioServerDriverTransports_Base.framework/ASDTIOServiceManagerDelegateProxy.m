@interface ASDTIOServiceManagerDelegateProxy
+ (id)forDelegate:(id)a3 andIDValues:(id)a4;
- (ASDTIOServiceManagerDelegate)delegate;
- (NSSet)idValues;
- (void)setDelegate:(id)a3;
- (void)setIdValues:(id)a3;
@end

@implementation ASDTIOServiceManagerDelegateProxy

+ (id)forDelegate:(id)a3 andIDValues:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(ASDTIOServiceManagerDelegateProxy);
  [(ASDTIOServiceManagerDelegateProxy *)v7 setDelegate:v6];

  v8 = [MEMORY[0x263EFFA08] setWithArray:v5];

  [(ASDTIOServiceManagerDelegateProxy *)v7 setIdValues:v8];
  return v7;
}

- (ASDTIOServiceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASDTIOServiceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)idValues
{
  return self->_idValues;
}

- (void)setIdValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idValues, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end