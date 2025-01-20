@interface DTGPUPerformanceStateControlAGXKernel
- (BOOL)enable:(unint64_t)a3;
- (DTGPUPerformanceStateControlAGXKernel)initWithDevice:(id)a3;
- (id)currentState;
- (id)disable;
- (unsigned)getIOAccelerator;
- (void)close;
- (void)dealloc;
@end

@implementation DTGPUPerformanceStateControlAGXKernel

- (DTGPUPerformanceStateControlAGXKernel)initWithDevice:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DTGPUPerformanceStateControlAGXKernel;
  v5 = [(DTGPUPerformanceStateControlAGXKernel *)&v13 init];
  v6 = v5;
  if (v5)
  {
    io_service_t v7 = [(DTGPUPerformanceStateControlAGXKernel *)v5 getIOAccelerator];
    if (!IOServiceOpen(v7, *MEMORY[0x263EF8960], 1u, &v6->_connection))
    {
      uint64_t v12 = 258;
      mach_port_t connection = v6->_connection;
      if (!connection
        || ((size_t outputStructCnt = 8, !IOConnectCallStructMethod(connection, 0x41u, &v12, 8uLL, &v12, &outputStructCnt))
          ? (BOOL v11 = outputStructCnt == 8)
          : (BOOL v11 = 0),
            !v11))
      {
        [(DTGPUPerformanceStateControlAGXKernel *)v6 close];
        v8 = 0;
        goto LABEL_4;
      }
      v6->_acceleratorId = [v4 registryID:v12];
    }
  }
  v8 = v6;
LABEL_4:

  return v8;
}

- (void)dealloc
{
  [(DTGPUPerformanceStateControlAGXKernel *)self close];
  v3.receiver = self;
  v3.super_class = (Class)DTGPUPerformanceStateControlAGXKernel;
  [(DTGPUPerformanceStateControlAGXKernel *)&v3 dealloc];
}

- (void)close
{
  if (self->_holdingLock) {
    id v3 = [(DTGPUPerformanceStateControlAGXKernel *)self disable];
  }
  io_connect_t connection = self->_connection;
  if (connection) {
    IOServiceClose(connection);
  }
  self->_io_connect_t connection = 0;
}

- (unsigned)getIOAccelerator
{
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceMatching("IOAccelerator");
  unsigned int result = IOServiceGetMatchingService(v2, v3);
  if (!result)
  {
    CFDictionaryRef v5 = IOServiceMatching("IOAcceleratorES");
    return IOServiceGetMatchingService(v2, v5);
  }
  return result;
}

- (id)currentState
{
  v17[5] = *MEMORY[0x263EF8340];
  if (self->_connection)
  {
    CFDictionaryRef v3 = objc_opt_new();
    uint64_t outputStruct = 258;
    mach_port_t connection = self->_connection;
    if (connection
      && (size_t outputStructCnt = 8,
          !IOConnectCallStructMethod(connection, 0x41u, &outputStruct, 8uLL, &outputStruct, &outputStructCnt))
      && outputStructCnt == 8)
    {
      v16[0] = @"accelerator-id";
      CFDictionaryRef v5 = [NSNumber numberWithUnsignedLongLong:self->_acceleratorId];
      v17[0] = v5;
      v17[1] = MEMORY[0x263EFFA88];
      v16[1] = @"available";
      v16[2] = @"enabled";
      v6 = [NSNumber numberWithBool:BYTE2(outputStruct) == 1];
      v17[2] = v6;
      v16[3] = @"sustained";
      io_service_t v7 = [NSNumber numberWithBool:BYTE3(outputStruct) == 1];
      v17[3] = v7;
      v16[4] = @"level";
      v8 = [NSNumber numberWithUnsignedChar:BYTE4(outputStruct)];
      v17[4] = v8;
      v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
      [v3 addEntriesFromDictionary:v9];

      uint64_t outputStruct = 259;
      mach_port_t v10 = self->_connection;
      if (v10
        && (size_t outputStructCnt = 8,
            !IOConnectCallStructMethod(v10, 0x41u, &outputStruct, 8uLL, &outputStruct, &outputStructCnt))
        && outputStructCnt == 8)
      {
        BOOL v11 = [NSNumber numberWithUnsignedInt:(BYTE1(outputStruct) << 24) | (BYTE2(outputStruct) << 16) | (BYTE3(outputStruct) << 8)];
        [v3 setObject:v11 forKeyedSubscript:@"mapping"];

        id v12 = v3;
      }
      else
      {
        id v12 = &unk_26E534370;
      }
    }
    else
    {
      id v12 = &unk_26E534348;
    }
  }
  else
  {
    id v12 = &unk_26E534320;
  }
  return v12;
}

- (BOOL)enable:(unint64_t)a3
{
  unsigned int connection = self->_connection;
  if (connection)
  {
    char v5 = a3;
    uint64_t v9 = 256;
    size_t outputStructCnt = 8;
    if (IOConnectCallStructMethod(connection, 0x41u, &v9, 8uLL, &v9, &outputStructCnt)) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = outputStructCnt == 8;
    }
    if (v6)
    {
      uint64_t v9 = 1;
      BYTE1(v9) = v5;
      unsigned int connection = self->_connection;
      if (connection)
      {
        size_t outputStructCnt = 8;
        if (IOConnectCallStructMethod(connection, 0x41u, &v9, 8uLL, &v9, &outputStructCnt)) {
          BOOL v7 = 0;
        }
        else {
          BOOL v7 = outputStructCnt == 8;
        }
        LOBYTE(connection) = v7;
      }
    }
    else
    {
      LOBYTE(connection) = 0;
      self->_holdingLock = 1;
    }
  }
  return connection;
}

- (id)disable
{
  CFDictionaryRef v3 = [(DTGPUPerformanceStateControlAGXKernel *)self currentState];
  mach_port_t connection = self->_connection;
  if (connection)
  {
    if (self->_holdingLock)
    {
      uint64_t v6 = 0;
      size_t outputStructCnt = 8;
      if (IOConnectCallStructMethod(connection, 0x41u, &v6, 8uLL, &v6, &outputStructCnt) || outputStructCnt != 8) {
        self->_holdingLock = 0;
      }
    }
  }
  return v3;
}

@end