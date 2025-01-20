@interface MCMXPCMessageOperationDelete
- (BOOL)waitForDiskSpaceReclaim;
- (MCMXPCMessageOperationDelete)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
@end

@implementation MCMXPCMessageOperationDelete

- (BOOL)waitForDiskSpaceReclaim
{
  return self->_waitForDiskSpaceReclaim;
}

- (MCMXPCMessageOperationDelete)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMXPCMessageOperationDelete;
  v9 = [(MCMXPCMessageWithConcreteContainersArrayBase *)&v11 initWithXPCObject:v8 context:a4 error:a5];
  if (v9) {
    v9->_waitForDiskSpaceReclaim = xpc_dictionary_get_uint64(v8, "Flags") & 1;
  }

  return v9;
}

@end