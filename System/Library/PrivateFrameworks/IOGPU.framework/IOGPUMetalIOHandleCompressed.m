@interface IOGPUMetalIOHandleCompressed
- (IOGPUMetalIOHandleCompressed)initWithDevice:(id)a3 path:(const char *)a4 compressionType:(int64_t)a5 error:(id *)a6 uncached:(BOOL)a7;
- (unint64_t)globalTraceObjectID;
- (unsigned)vnioID;
- (void)dealloc;
- (void)setLabel:(id)a3;
@end

@implementation IOGPUMetalIOHandleCompressed

- (IOGPUMetalIOHandleCompressed)initWithDevice:(id)a3 path:(const char *)a4 compressionType:(int64_t)a5 error:(id *)a6 uncached:(BOOL)a7
{
  v17[1] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)IOGPUMetalIOHandleCompressed;
  v9 = -[_MTLIOHandleCompressed initWithDevice:path:compressionType:error:uncached:](&v15, sel_initWithDevice_path_compressionType_error_uncached_);
  if (v9)
  {
    v10 = (MTLDevice *)a3;
    v9->_dev = v10;
    v11 = (_DWORD *)[(MTLDevice *)v10 deviceRef];
    if (IOGPUDeviceCreateVNIODesc(v11, *(_DWORD *)((char *)&v9->super.super.super.isa + (int)*MEMORY[0x263F12C38]), &v9->_vnioID, &v9->_globalTraceObjectID))
    {
      if (a6)
      {
        id v12 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v13 = *MEMORY[0x263F126A0];
        uint64_t v16 = *MEMORY[0x263F08320];
        v17[0] = [NSString stringWithUTF8String:"Internal Error"];
        *a6 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 2, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, &v16, 1));
      }

      return 0;
    }
    else if (*(_DWORD *)__globalGPUCommPage)
    {
      IOGPUDeviceTraceObjectLabel([(MTLDevice *)v9->_dev deviceRef], 8, 26, v9->_globalTraceObjectID, 0);
    }
  }
  return v9;
}

- (void)dealloc
{
  if (self->_vnioID) {
    IOGPUDeviceDestroyVNIODesc((_DWORD *)[(MTLDevice *)self->_dev deviceRef], self->_vnioID);
  }

  self->_dev = 0;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalIOHandleCompressed;
  [(_MTLIOHandleCompressed *)&v3 dealloc];
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (void)setLabel:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalIOHandleCompressed;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    uint64_t v5 = [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C30]) deviceRef];
    unint64_t globalTraceObjectID = self->_globalTraceObjectID;
    uint64_t v7 = (int)*MEMORY[0x263F12C40];
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