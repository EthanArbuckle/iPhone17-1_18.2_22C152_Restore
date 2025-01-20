@interface _HMNetworkPath
- (OS_nw_path)nwPath;
- (_HMNetworkPath)initWithNwPath:(id)a3;
- (int)status;
- (void)setNwPath:(id)a3;
@end

@implementation _HMNetworkPath

- (void).cxx_destruct
{
}

- (void)setNwPath:(id)a3
{
}

- (OS_nw_path)nwPath
{
  return self->_nwPath;
}

- (int)status
{
  v2 = [(_HMNetworkPath *)self nwPath];
  nw_path_status_t status = nw_path_get_status(v2);

  return status;
}

- (_HMNetworkPath)initWithNwPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HMNetworkPath;
  v6 = [(_HMNetworkPath *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_nwPath, a3);
  }

  return v7;
}

@end