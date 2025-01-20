@interface CHCBluetoothConnectionQueryingWrapper
- (BOOL)isApplicationConnectedToAnyPeripherals:(id)a3;
- (CHCBluetoothConnectionQuerying)querying;
- (CHCBluetoothConnectionQueryingWrapper)initWithQuerying:(id)a3;
- (void)setQuerying:(id)a3;
@end

@implementation CHCBluetoothConnectionQueryingWrapper

- (CHCBluetoothConnectionQueryingWrapper)initWithQuerying:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHCBluetoothConnectionQueryingWrapper;
  v6 = [(CHCBluetoothConnectionQueryingWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_querying, a3);
  }

  return v7;
}

- (BOOL)isApplicationConnectedToAnyPeripherals:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  querying = self->_querying;
  id v12 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v12 count:1];
  v7 = -[CHCBluetoothConnectionQuerying isApplicationConnectedToAnyPeripherals:](querying, "isApplicationConnectedToAnyPeripherals:", v6, v12, v13);

  v8 = [v7 objectForKeyedSubscript:v5];
  char v9 = objc_opt_respondsToSelector();

  if (v9) {
    char v10 = [v8 BOOLValue];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (CHCBluetoothConnectionQuerying)querying
{
  return self->_querying;
}

- (void)setQuerying:(id)a3
{
}

- (void).cxx_destruct
{
}

@end