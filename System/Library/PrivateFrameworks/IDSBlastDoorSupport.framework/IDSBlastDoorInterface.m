@interface IDSBlastDoorInterface
- (IDSBlastDoorInterface)init;
- (IDSBlastDoorInterfaceInternal)interface;
- (void)setInterface:(id)a3;
- (void)unpackClientMessage:(id)a3 context:(id)a4 resultHandler:(id)a5;
- (void)unpackPayloadDictionary:(id)a3 resultHandler:(id)a4;
@end

@implementation IDSBlastDoorInterface

- (IDSBlastDoorInterface)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)IDSBlastDoorInterface;
  v2 = [(IDSBlastDoorInterface *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(IDSBlastDoorInterfaceInternal);
    interface = v2->_interface;
    v2->_interface = v3;
  }
  return v2;
}

- (void)unpackPayloadDictionary:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSBlastDoorInterface *)self interface];
  [v8 unpackPayloadDictionary:v7 resultHandler:v6];
}

- (void)unpackClientMessage:(id)a3 context:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(IDSBlastDoorInterface *)self interface];
  [v11 unpackClientMessage:v10 context:v9 resultHandler:v8];
}

- (IDSBlastDoorInterfaceInternal)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end