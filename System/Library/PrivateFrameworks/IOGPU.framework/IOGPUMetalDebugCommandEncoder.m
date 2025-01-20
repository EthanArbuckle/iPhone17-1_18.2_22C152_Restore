@interface IOGPUMetalDebugCommandEncoder
- (IOGPUMetalDebugCommandEncoder)initWithCommandBuffer:(id)a3;
- (unsigned)addDebugResourceListInfo:(IOGPUResourceInfo *)a3 flag:(unsigned int)a4;
- (void)IOLogBytes:(const char *)a3 length:(unint64_t)a4;
- (void)addAPIResource:(id)a3;
- (void)dealloc;
- (void)debugBytes:(const char *)a3 length:(unint64_t)a4 output_type:(unsigned int)a5;
- (void)endEncoding;
- (void)kprintfBytes:(const char *)a3 length:(unint64_t)a4;
- (void)reserveKernelCommandBufferSpace:(unint64_t)a3;
- (void)restartDebugPass;
@end

@implementation IOGPUMetalDebugCommandEncoder

- (IOGPUMetalDebugCommandEncoder)initWithCommandBuffer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IOGPUMetalDebugCommandEncoder;
  v4 = -[_MTLCommandEncoder initWithCommandBuffer:](&v6, sel_initWithCommandBuffer_);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[IOGPUMetalDebugCommandEncoder initWithCommandBuffer:]();
    }
    [a3 getCurrentKernelCommandBufferPointer:&v4->_kernelCommandBufferCurrent end:&v4->_kernelCommandBufferEnd];
    [a3 beginSegment:v4->_kernelCommandBufferCurrent];
    v4->_resourceList = (IOGPUResourceList *)[a3 ioGPUResourceList];
    v4->_api_resourceList = (MTLResourceList *)[a3 akResourceList];
    if (!v4->_resourceList) {
      -[IOGPUMetalDebugCommandEncoder initWithCommandBuffer:]();
    }
  }
  return v4;
}

- (void)dealloc
{
  self->_kernelCommandBufferEnd = 0;
  self->_kernelCommandBufferCurrent = 0;
  self->_resourceList = 0;
  self->_api_resourceList = 0;
  v2.receiver = self;
  v2.super_class = (Class)IOGPUMetalDebugCommandEncoder;
  [(_MTLCommandEncoder *)&v2 dealloc];
}

- (void)reserveKernelCommandBufferSpace:(unint64_t)a3
{
  p_kernelCommandBufferEnd = &self->_kernelCommandBufferEnd;
  kernelCommandBufferEnd = self->_kernelCommandBufferEnd;
  p_kernelCommandBufferCurrent = &self->_kernelCommandBufferCurrent;
  result = self->_kernelCommandBufferCurrent;
  if (kernelCommandBufferEnd - (unsigned char *)result < a3)
  {
    v9 = *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B70]);
    [v9 growKernelCommandBuffer:a3];
    [v9 getCurrentKernelCommandBufferPointer:p_kernelCommandBufferCurrent end:p_kernelCommandBufferEnd];
    result = *p_kernelCommandBufferCurrent;
    if ((unsigned char *)*p_kernelCommandBufferEnd - (unsigned char *)*p_kernelCommandBufferCurrent < a3) {
      -[IOGPUMetalDebugCommandEncoder reserveKernelCommandBufferSpace:]();
    }
  }
  *p_kernelCommandBufferCurrent = (char *)result + a3;
  return result;
}

- (void)restartDebugPass
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B70]);
  [v3 setCurrentKernelCommandBufferPointer:self->_kernelCommandBufferCurrent];
  [v3 endCurrentSegment];
  kernelCommandBufferCurrent = self->_kernelCommandBufferCurrent;
  [v3 beginSegment:kernelCommandBufferCurrent];
}

- (void)endEncoding
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B70]);
  [v3 setCurrentKernelCommandBufferPointer:self->_kernelCommandBufferCurrent];
  [v3 endCurrentSegment];
  self->_kernelCommandBufferEnd = 0;
  self->_kernelCommandBufferCurrent = 0;
  self->_resourceList = 0;
  self->_api_resourceList = 0;
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMetalDebugCommandEncoder;
  [(_MTLCommandEncoder *)&v4 endEncoding];
}

- (unsigned)addDebugResourceListInfo:(IOGPUResourceInfo *)a3 flag:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int result = IOGPUResourceListAddResource((uint64_t)self->_resourceList, (uint64_t)a3, *(uint64_t *)&a4);
  if (!*(void *)&self->_resourceList->var12)
  {
    [(IOGPUMetalDebugCommandEncoder *)self restartDebugPass];
    unsigned int result = IOGPUResourceListAddResource((uint64_t)self->_resourceList, (uint64_t)a3, v4);
    if (!*(void *)&self->_resourceList->var12) {
      -[IOGPUMetalDebugCommandEncoder addDebugResourceListInfo:flag:]();
    }
  }
  if (result == -1) {
    -[IOGPUMetalDebugCommandEncoder addDebugResourceListInfo:flag:]();
  }
  return result;
}

- (void)debugBytes:(const char *)a3 length:(unint64_t)a4 output_type:(unsigned int)a5
{
  int v8 = (a4 + 19) & 0xFFFFFFFC;
  v9 = [(IOGPUMetalDebugCommandEncoder *)self reserveKernelCommandBufferSpace:(a4 + 19) & 0xFFFFFFFFFFFFFFFCLL];
  _DWORD *v9 = 0;
  v9[1] = v8;
  v9[2] = a5;
  v9[3] = a4;
  v10 = v9 + 4;
  memcpy(v10, a3, a4);
}

- (void)addAPIResource:(id)a3
{
  if (self->_api_resourceList) {
    MTLResourceListAddResource();
  }
}

- (void)kprintfBytes:(const char *)a3 length:(unint64_t)a4
{
  if (!*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B70])) {
    -[IOGPUMetalDebugCommandEncoder kprintfBytes:length:]();
  }
  [(IOGPUMetalDebugCommandEncoder *)self debugBytes:a3 length:a4 output_type:0];
}

- (void)IOLogBytes:(const char *)a3 length:(unint64_t)a4
{
  if (!*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12B70])) {
    -[IOGPUMetalDebugCommandEncoder IOLogBytes:length:]();
  }
  [(IOGPUMetalDebugCommandEncoder *)self debugBytes:a3 length:a4 output_type:1];
}

- (void)initWithCommandBuffer:.cold.1()
{
}

- (void)initWithCommandBuffer:.cold.2()
{
}

- (void)reserveKernelCommandBufferSpace:.cold.1()
{
  __assert_rtn("-[IOGPUMetalDebugCommandEncoder reserveKernelCommandBufferSpace:]", "IOGPUMetalDebugCommandEncoder.m", 51, "((uintptr_t)_kernelCommandBufferEnd - (uintptr_t)_kernelCommandBufferCurrent) >= commandSize");
}

- (void)addDebugResourceListInfo:flag:.cold.1()
{
}

- (void)addDebugResourceListInfo:flag:.cold.2()
{
  __assert_rtn("-[IOGPUMetalDebugCommandEncoder addDebugResourceListInfo:flag:]", "IOGPUMetalDebugCommandEncoder.m", 87, "segment_resource_id != kIOGPUResourceListInvalidSegmentResourceIndex");
}

- (void)kprintfBytes:length:.cold.1()
{
}

- (void)IOLogBytes:length:.cold.1()
{
}

@end