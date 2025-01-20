@interface IOGPUMetalIOHandleRaw
- (IOGPUMetalIOHandleRaw)initWithDevice:(id)a3 path:(const char *)a4 error:(id *)a5 uncached:(BOOL)a6;
- (unint64_t)globalTraceObjectID;
- (unsigned)vnioID;
- (void)dealloc;
- (void)setLabel:(id)a3;
@end

@implementation IOGPUMetalIOHandleRaw

- (IOGPUMetalIOHandleRaw)initWithDevice:(id)a3 path:(const char *)a4 error:(id *)a5 uncached:(BOOL)a6
{
  v16[1] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)IOGPUMetalIOHandleRaw;
  v8 = -[_MTLIOHandleRaw initWithDevice:path:error:uncached:](&v14, sel_initWithDevice_path_error_uncached_);
  if (v8)
  {
    v9 = (MTLDevice *)a3;
    v8->_dev = v9;
    v10 = (_DWORD *)[(MTLDevice *)v9 deviceRef];
    if (IOGPUDeviceCreateVNIODesc(v10, *(_DWORD *)((char *)&v8->super.super.super.isa + (int)*MEMORY[0x263F12C50]), &v8->_vnioID, &v8->_globalTraceObjectID))
    {
      if (a5)
      {
        id v11 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v12 = *MEMORY[0x263F126A0];
        uint64_t v15 = *MEMORY[0x263F08320];
        v16[0] = [NSString stringWithUTF8String:"Internal Error"];
        *a5 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 2, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1));
      }

      return 0;
    }
    else if (*(_DWORD *)__globalGPUCommPage)
    {
      IOGPUDeviceTraceObjectLabel([(MTLDevice *)v8->_dev deviceRef], 8, 26, v8->_globalTraceObjectID, 0);
    }
  }
  return v8;
}

- (void)dealloc
{
  if (self->_vnioID) {
    IOGPUDeviceDestroyVNIODesc((_DWORD *)[(MTLDevice *)self->_dev deviceRef], self->_vnioID);
  }

  self->_dev = 0;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalIOHandleRaw;
  [(_MTLIOHandleRaw *)&v3 dealloc];
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (void)setLabel:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalIOHandleRaw;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    uint64_t v5 = [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C48]) deviceRef];
    unint64_t globalTraceObjectID = self->_globalTraceObjectID;
    uint64_t v7 = (int)*MEMORY[0x263F12C58];
    uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    [a3 cStringUsingEncoding:1];
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)IOGPUDeviceTraceObjectLabel(v5, 8, 0, globalTraceObjectID, v8);
  }
}

- (unsigned)vnioID
{
  return self->_vnioID;
}

@end