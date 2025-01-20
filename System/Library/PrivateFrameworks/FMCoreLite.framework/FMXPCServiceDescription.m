@interface FMXPCServiceDescription
- (FMXPCServiceDescription)initWithMachServiceName:(id)a3 options:(unint64_t)a4 exportedObject:(id)a5 exportedInterface:(id)a6 remoteObjectInterface:(id)a7 interruptionHandler:(id)a8 invalidationHandler:(id)a9;
- (FMXPCServiceDescription)initWithMachServiceName:(id)a3 options:(unint64_t)a4 remoteObjectInterface:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7;
- (NSObject)exportedObject;
- (NSString)machService;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (id)initInternalWithMachServiceName:(id)a3 options:(unint64_t)a4 exportedObject:(id)a5 exportedInterface:(id)a6 remoteObjectInterface:(id)a7 interruptionHandler:(id)a8 invalidationHandler:(id)a9;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (unint64_t)options;
- (void)setExportedInterface:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMachService:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setRemoteObjectInterface:(id)a3;
@end

@implementation FMXPCServiceDescription

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_machService, 0);
}

- (FMXPCServiceDescription)initWithMachServiceName:(id)a3 options:(unint64_t)a4 remoteObjectInterface:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7
{
  return (FMXPCServiceDescription *)[(FMXPCServiceDescription *)self initInternalWithMachServiceName:a3 options:a4 exportedObject:0 exportedInterface:0 remoteObjectInterface:a5 interruptionHandler:a6 invalidationHandler:a7];
}

- (FMXPCServiceDescription)initWithMachServiceName:(id)a3 options:(unint64_t)a4 exportedObject:(id)a5 exportedInterface:(id)a6 remoteObjectInterface:(id)a7 interruptionHandler:(id)a8 invalidationHandler:(id)a9
{
  return (FMXPCServiceDescription *)-[FMXPCServiceDescription initInternalWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:](self, "initInternalWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", a3, a4, a5, a6, a7, a8);
}

- (id)initInternalWithMachServiceName:(id)a3 options:(unint64_t)a4 exportedObject:(id)a5 exportedInterface:(id)a6 remoteObjectInterface:(id)a7 interruptionHandler:(id)a8 invalidationHandler:(id)a9
{
  id v30 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v31.receiver = self;
  v31.super_class = (Class)FMXPCServiceDescription;
  v21 = [(FMXPCServiceDescription *)&v31 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_machService, a3);
    v22->_options = a4;
    v23 = [[FMWeakForwardingContainer alloc] initWithTarget:v16];
    exportedObject = v22->_exportedObject;
    v22->_exportedObject = &v23->super;

    objc_storeStrong((id *)&v22->_exportedInterface, a6);
    objc_storeStrong((id *)&v22->_remoteObjectInterface, a7);
    uint64_t v25 = MEMORY[0x1B3EB3F00](v19);
    id interruptionHandler = v22->_interruptionHandler;
    v22->_id interruptionHandler = (id)v25;

    uint64_t v27 = MEMORY[0x1B3EB3F00](v20);
    id invalidationHandler = v22->_invalidationHandler;
    v22->_id invalidationHandler = (id)v27;
  }
  return v22;
}

- (NSString)machService
{
  return self->_machService;
}

- (void)setMachService:(id)a3
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

- (NSObject)exportedObject
{
  return self->_exportedObject;
}

- (void)setExportedObject:(id)a3
{
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (void)setExportedInterface:(id)a3
{
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (void)setRemoteObjectInterface:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

@end