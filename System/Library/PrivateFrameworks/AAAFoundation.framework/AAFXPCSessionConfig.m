@interface AAFXPCSessionConfig
- (AAFXPCSessionConfig)initWithServiceName:(id)a3 remoteProtocol:(id)a4 exportedProtocol:(id)a5 options:(unint64_t)a6;
- (AAFXPCSessionConfig)initWithServiceName:(id)a3 remoteProtocol:(id)a4 options:(unint64_t)a5;
- (NSString)serviceName;
- (NSXPCInterface)remoteObjectInterface;
- (Protocol)exportedProtocol;
- (Protocol)remoteProtocol;
- (unint64_t)options;
- (void)setExportedProtocol:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setRemoteObjectInterface:(id)a3;
- (void)setRemoteProtocol:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation AAFXPCSessionConfig

- (AAFXPCSessionConfig)initWithServiceName:(id)a3 remoteProtocol:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAFXPCSessionConfig;
  v11 = [(AAFXPCSessionConfig *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceName, a3);
    v12->_options = a5;
    objc_storeStrong((id *)&v12->_remoteProtocol, a4);
  }

  return v12;
}

- (AAFXPCSessionConfig)initWithServiceName:(id)a3 remoteProtocol:(id)a4 exportedProtocol:(id)a5 options:(unint64_t)a6
{
  id v11 = a5;
  v12 = [(AAFXPCSessionConfig *)self initWithServiceName:a3 remoteProtocol:a4 options:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_exportedProtocol, a5);
  }

  return v13;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (Protocol)remoteProtocol
{
  return self->_remoteProtocol;
}

- (void)setRemoteProtocol:(id)a3
{
}

- (Protocol)exportedProtocol
{
  return self->_exportedProtocol;
}

- (void)setExportedProtocol:(id)a3
{
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (void)setRemoteObjectInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_exportedProtocol, 0);
  objc_storeStrong((id *)&self->_remoteProtocol, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end