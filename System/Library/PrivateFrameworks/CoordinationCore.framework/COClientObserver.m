@interface COClientObserver
- (BOOL)isEqual:(id)a3;
- (COClientObserver)initWithConnection:(id)a3;
- (COClientObserver)initWithConnection:(id)a3 domain:(id)a4 cluster:(id)a5;
- (OS_os_transaction)transaction;
- (id)cluster;
@end

@implementation COClientObserver

- (COClientObserver)initWithConnection:(id)a3
{
  v4 = (void *)MEMORY[0x263F33F40];
  id v5 = a3;
  v6 = [v4 homeCluster];
  v7 = [(COClientObserver *)self initWithConnection:v5 domain:@"default" cluster:v6];

  return v7;
}

- (COClientObserver)initWithConnection:(id)a3 domain:(id)a4 cluster:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)COClientObserver;
  v11 = [(COCoordinationServiceClient *)&v18 initWithConnection:v8];
  if (v11)
  {
    int v12 = [v8 processIdentifier];
    memset(buffer, 0, sizeof(buffer));
    *((unsigned char *)buffer + proc_name(v12, buffer, 0x40u)) = 0;
    if (LOBYTE(buffer[0])) {
      v13 = (const char *)buffer;
    }
    else {
      v13 = "unknown";
    }
    id v14 = [NSString stringWithFormat:@"com.apple.CoordinationCore.%@.observing-%s", v9, v13];
    [v14 UTF8String];
    uint64_t v15 = os_transaction_create();
    transaction = v11->_transaction;
    v11->_transaction = (OS_os_transaction *)v15;

    objc_storeStrong(&v11->_cluster, a5);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COClientObserver;
  if ([(COCoordinationServiceClient *)&v9 isEqual:v4])
  {
    id v5 = [(COClientObserver *)self cluster];
    v6 = [v4 cluster];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (id)cluster
{
  return self->_cluster;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cluster, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end