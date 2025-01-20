@interface CRKConcreteNetworkPath
- (BOOL)isSatisfied;
- (CRKConcreteNetworkPath)initWithUnderlyingPath:(id)a3;
- (NSArray)interfaces;
- (OS_nw_path)underlyingPath;
@end

@implementation CRKConcreteNetworkPath

- (CRKConcreteNetworkPath)initWithUnderlyingPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteNetworkPath;
  v6 = [(CRKConcreteNetworkPath *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingPath, a3);
  }

  return v7;
}

- (BOOL)isSatisfied
{
  v2 = [(CRKConcreteNetworkPath *)self underlyingPath];
  nw_path_status_t status = nw_path_get_status(v2);

  return ((status - 1) & 0xFFFFFFFD) == 0;
}

- (NSArray)interfaces
{
  interfaces = self->_interfaces;
  if (!interfaces)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__CRKConcreteNetworkPath_interfaces__block_invoke;
    v7[3] = &unk_2646F5108;
    v7[4] = self;
    __36__CRKConcreteNetworkPath_interfaces__block_invoke((uint64_t)v7);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_interfaces;
    self->_interfaces = v4;

    interfaces = self->_interfaces;
  }

  return interfaces;
}

id __36__CRKConcreteNetworkPath_interfaces__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  v3 = [*(id *)(a1 + 32) underlyingPath];
  enumerate_block[0] = MEMORY[0x263EF8330];
  enumerate_block[1] = 3221225472;
  enumerate_block[2] = __36__CRKConcreteNetworkPath_interfaces__block_invoke_2;
  enumerate_block[3] = &unk_2646F50E0;
  id v8 = v2;
  id v4 = v2;
  nw_path_enumerate_interfaces(v3, enumerate_block);

  id v5 = (void *)[v4 copy];

  return v5;
}

uint64_t __36__CRKConcreteNetworkPath_interfaces__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[CRKConcreteNetworkInterface alloc] initWithUnderlyingInterface:v3];

  [*(id *)(a1 + 32) addObject:v4];
  return 0;
}

- (OS_nw_path)underlyingPath
{
  return self->_underlyingPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingPath, 0);

  objc_storeStrong((id *)&self->_interfaces, 0);
}

@end