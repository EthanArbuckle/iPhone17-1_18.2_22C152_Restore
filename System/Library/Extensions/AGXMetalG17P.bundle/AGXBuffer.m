@interface AGXBuffer
- (AGXBuffer)initWithDevice:(id)a3 addressRanges:(MTLAddressRange *)a4 addressRangeCount:(unint64_t)a5 length:(unint64_t)a6 alignment:(unsigned int)a7 options:(unint64_t)a8 pinnedGPUAddress:(unint64_t)a9;
- (AGXBuffer)initWithDevice:(id)a3 bytes:(void *)a4 length:(unint64_t)a5 alignment:(unsigned int)a6 options:(unint64_t)a7 deallocator:(id)a8 pinnedGPUAddress:(unint64_t)a9;
- (AGXBuffer)initWithDevice:(id)a3 bytes:(void *)a4 length:(unint64_t)a5 alignment:(unsigned int)a6 pointerTag:(unint64_t)a7 options:(unint64_t)a8 deallocator:(id)a9 pinnedGPUAddress:(unint64_t)a10;
- (AGXBuffer)initWithDevice:(id)a3 bytes:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 deallocator:(id)a7 pinnedGPUAddress:(unint64_t)a8;
- (AGXBuffer)initWithDevice:(id)a3 iosurface:(__IOSurface *)a4 pinnedGPUAddress:(unint64_t)a5;
- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 options:(unint64_t)a6 isSuballocDisabled:(BOOL)a7 pinnedGPULocation:(const GPUResourcePinningLocation *)a8;
- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 options:(unint64_t)a6 isSuballocDisabled:(BOOL)a7 resourceInArgs:(AGXNewTextureDataStruc *)a8 pinnedGPULocation:(const GPUResourcePinningLocation *)a9;
- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 pointerTag:(unint64_t)a6 options:(unint64_t)a7 isSuballocDisabled:(BOOL)a8 pinnedGPULocation:(const GPUResourcePinningLocation *)a9;
- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 pointerTag:(unint64_t)a6 options:(unint64_t)a7 isSuballocDisabled:(BOOL)a8 resourceInArgs:(AGXNewTextureDataStruc *)a9 pinnedGPULocation:(const GPUResourcePinningLocation *)a10;
- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 pinnedGPULocation:(const GPUResourcePinningLocation *)a7;
- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 resourceInArgs:(AGXNewTextureDataStruc *)a7 pinnedGPULocation:(const GPUResourcePinningLocation *)a8;
- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 options:(unint64_t)a6;
- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 options:(unint64_t)a6 atOffset:(unint64_t)a7;
- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 pointerTag:(unint64_t)a6 options:(unint64_t)a7;
- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 pointerTag:(unint64_t)a6 options:(unint64_t)a7 atOffset:(unint64_t)a8;
- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5;
- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5 atOffset:(unint64_t)a6;
- (id)initCounterSampleBufferWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5;
- (id)initImplWithHeap:(id)a3 resource:(id)a4 length:(unint64_t)a5 atOffset:(unint64_t)a6;
- (id)initImplWithHeap:(id)a3 resource:(id)a4 length:(unint64_t)a5 pointerTag:(unint64_t)a6 atOffset:(unint64_t)a7;
- (id)initInternalBufferWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5;
- (id)initUntrackedInternalBufferWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5;
- (unint64_t)parentGPUAddress;
- (unint64_t)parentGPUSize;
- (void)dealloc;
@end

@implementation AGXBuffer

- (unint64_t)parentGPUSize
{
  unint64_t result = *(unint64_t *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B150]);
  if (result) {
    return [(id)result length];
  }
  return result;
}

- (unint64_t)parentGPUAddress
{
  unint64_t result = *(unint64_t *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B150]);
  if (result) {
    return [(id)result gpuAddress];
  }
  return result;
}

- (AGXBuffer)initWithDevice:(id)a3 addressRanges:(MTLAddressRange *)a4 addressRangeCount:(unint64_t)a5 length:(unint64_t)a6 alignment:(unsigned int)a7 options:(unint64_t)a8 pinnedGPUAddress:(unint64_t)a9
{
  uint64_t v19 = 0;
  v17.receiver = self;
  v17.super_class = (Class)AGXBuffer;
  int v16 = 104;
  v9 = [(IOGPUMetalBuffer *)&v17 initWithDevice:a3 addressRanges:a4 addressRangeCount:a5 length:a6 options:a8 gpuAddress:a9 args:v18 argsSize:v16];
  v10 = v9;
  if (v9)
  {
    v11 = (Class *)((char *)&v9->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B188]);
    uint64_t v12 = v11[9];
    uint64_t v13 = v11[16];
    uint64_t v14 = v11[2] & 0x1F00000000000000 | [(IOGPUMetalBuffer *)v9 length] & 0xFFFFFFFFFFFFFFLL | 0x2000000000000000;
    v11[1] = v12;
    v11[2] = v14;
    v11[3] = v13;
  }
  return v10;
}

- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 pointerTag:(unint64_t)a6 options:(unint64_t)a7 atOffset:(unint64_t)a8
{
  if ([a3 type] == 1
    && (a5 <= 0x100 ? (uint64_t v14 = 256) : (uint64_t v14 = a5),
        (uint64_t v15 = [a3 newSubResourceAtOffset:a8 withLength:a4 alignment:v14 options:a7]) != 0))
  {
    return (AGXBuffer *)[(AGXBuffer *)self initImplWithHeap:a3 resource:v15 length:a4 atOffset:a8];
  }
  else
  {

    return 0;
  }
}

- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 options:(unint64_t)a6 atOffset:(unint64_t)a7
{
  return [(AGXBuffer *)self initWithHeap:a3 length:a4 alignment:*(void *)&a5 pointerTag:0 options:a6 atOffset:a7];
}

- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5 atOffset:(unint64_t)a6
{
  return [(AGXBuffer *)self initWithHeap:a3 length:a4 alignment:1 options:a5 atOffset:a6];
}

- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 pointerTag:(unint64_t)a6 options:(unint64_t)a7
{
  if (![a3 type])
  {
    uint64_t v13 = a5 <= 0x100 ? 256 : a5;
    uint64_t v16 = 0;
    uint64_t v14 = [a3 newSubResourceWithLength:a4 alignment:v13 options:a7 offset:&v16];
    if (v14) {
      return (AGXBuffer *)[(AGXBuffer *)self initImplWithHeap:a3 resource:v14 length:a4 pointerTag:a6 atOffset:v16];
    }
  }

  return 0;
}

- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 options:(unint64_t)a6
{
  return [(AGXBuffer *)self initWithHeap:a3 length:a4 alignment:*(void *)&a5 pointerTag:0 options:a6];
}

- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  return [(AGXBuffer *)self initWithHeap:a3 length:a4 alignment:1 options:a5];
}

- (AGXBuffer)initWithDevice:(id)a3 iosurface:(__IOSurface *)a4 pinnedGPUAddress:(unint64_t)a5
{
  uint64_t v14 = 0;
  v12.receiver = self;
  v12.super_class = (Class)AGXBuffer;
  v5 = [(IOGPUMetalBuffer *)&v12 initWithDevice:a3 iosurface:a4 gpuAddress:a5 args:v13 argsSize:104];
  v6 = v5;
  if (v5)
  {
    v7 = (Class *)((char *)&v5->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B188]);
    uint64_t v8 = v7[9];
    uint64_t v9 = v7[16];
    uint64_t v10 = v7[2] & 0x1F00000000000000 | [(IOGPUMetalBuffer *)v5 length] & 0xFFFFFFFFFFFFFFLL | 0x2000000000000000;
    v7[1] = v8;
    v7[2] = v10;
    v7[3] = v9;
  }
  return v6;
}

- (AGXBuffer)initWithDevice:(id)a3 bytes:(void *)a4 length:(unint64_t)a5 alignment:(unsigned int)a6 pointerTag:(unint64_t)a7 options:(unint64_t)a8 deallocator:(id)a9 pinnedGPUAddress:(unint64_t)a10
{
  uint64_t v20 = 0;
  v18.receiver = self;
  v18.super_class = (Class)AGXBuffer;
  int v17 = 104;
  uint64_t v10 = [(IOGPUMetalBuffer *)&v18 initWithDevice:a3 pointer:a4 length:a5 alignment:*(void *)&a6 options:a8 sysMemSize:a5 gpuAddress:a10 gpuTag:a7 args:v19 argsSize:v17 deallocator:a9];
  v11 = v10;
  if (v10)
  {
    objc_super v12 = (Class *)((char *)&v10->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B188]);
    uint64_t v13 = v12[9];
    uint64_t v14 = v12[16];
    uint64_t v15 = v12[2] & 0x1F00000000000000 | [(IOGPUMetalBuffer *)v10 length] & 0xFFFFFFFFFFFFFFLL | 0x2000000000000000;
    v12[1] = v13;
    v12[2] = v15;
    v12[3] = v14;
  }
  return v11;
}

- (AGXBuffer)initWithDevice:(id)a3 bytes:(void *)a4 length:(unint64_t)a5 alignment:(unsigned int)a6 options:(unint64_t)a7 deallocator:(id)a8 pinnedGPUAddress:(unint64_t)a9
{
  return [(AGXBuffer *)self initWithDevice:a3 bytes:a4 length:a5 alignment:*(void *)&a6 pointerTag:0 options:a7 deallocator:a8 pinnedGPUAddress:a9];
}

- (AGXBuffer)initWithDevice:(id)a3 bytes:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 deallocator:(id)a7 pinnedGPUAddress:(unint64_t)a8
{
  return [(AGXBuffer *)self initWithDevice:a3 bytes:a4 length:a5 alignment:1 options:a6 deallocator:a7 pinnedGPUAddress:a8];
}

- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 pointerTag:(unint64_t)a6 options:(unint64_t)a7 isSuballocDisabled:(BOOL)a8 pinnedGPULocation:(const GPUResourcePinningLocation *)a9
{
  uint64_t v11 = 0;
  return [(AGXBuffer *)self initWithDevice:a3 length:a4 alignment:*(void *)&a5 pointerTag:a6 options:a7 isSuballocDisabled:a8 resourceInArgs:v10 pinnedGPULocation:a9];
}

- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 options:(unint64_t)a6 isSuballocDisabled:(BOOL)a7 pinnedGPULocation:(const GPUResourcePinningLocation *)a8
{
  uint64_t v10 = 0;
  return [(AGXBuffer *)self initWithDevice:a3 length:a4 alignment:*(void *)&a5 options:a6 isSuballocDisabled:a7 resourceInArgs:v9 pinnedGPULocation:a8];
}

- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 pinnedGPULocation:(const GPUResourcePinningLocation *)a7
{
  uint64_t v9 = 0;
  return [(AGXBuffer *)self initWithDevice:a3 length:a4 options:a5 isSuballocDisabled:a6 resourceInArgs:v8 pinnedGPULocation:a7];
}

- (id)initCounterSampleBufferWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v7 = 0x1000000000;
  return [(AGXBuffer *)self initWithDevice:a3 length:a4 options:a5 isSuballocDisabled:1 resourceInArgs:v6 pinnedGPULocation:0];
}

- (id)initUntrackedInternalBufferWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v7 = 0xC00000000;
  return [(AGXBuffer *)self initWithDevice:a3 length:a4 options:a5 isSuballocDisabled:0 resourceInArgs:v6 pinnedGPULocation:0];
}

- (id)initInternalBufferWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v7 = 0x400000000;
  return [(AGXBuffer *)self initWithDevice:a3 length:a4 options:a5 isSuballocDisabled:1 resourceInArgs:v6 pinnedGPULocation:0];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AGXBuffer;
  [(IOGPUMetalBuffer *)&v2 dealloc];
}

- (id)initImplWithHeap:(id)a3 resource:(id)a4 length:(unint64_t)a5 pointerTag:(unint64_t)a6 atOffset:(unint64_t)a7
{
  v14.receiver = self;
  v14.super_class = (Class)AGXBuffer;
  uint64_t v7 = [(IOGPUMetalBuffer *)&v14 initWithHeap:a3 resource:a4 offset:a7 length:a5 gpuTag:a6];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = (Class *)((char *)&v7->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B188]);
    uint64_t v10 = v9[9];
    uint64_t v11 = v9[16];
    uint64_t v12 = v9[2] & 0x1F00000000000000 | [(IOGPUMetalBuffer *)v7 length] & 0xFFFFFFFFFFFFFFLL | 0x2000000000000000;
    v9[1] = v10;
    v9[2] = v12;
    v9[3] = v11;
  }
  return v8;
}

- (id)initImplWithHeap:(id)a3 resource:(id)a4 length:(unint64_t)a5 atOffset:(unint64_t)a6
{
  return [(AGXBuffer *)self initImplWithHeap:a3 resource:a4 length:a5 pointerTag:0 atOffset:a6];
}

- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 pointerTag:(unint64_t)a6 options:(unint64_t)a7 isSuballocDisabled:(BOOL)a8 resourceInArgs:(AGXNewTextureDataStruc *)a9 pinnedGPULocation:(const GPUResourcePinningLocation *)a10
{
  unint64_t v11 = (a4 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
  if (v11 < a4) {
    goto LABEL_2;
  }
  if (a5 <= 1) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = a5;
  }
  if (!a10)
  {
    unint64_t var0 = 0;
    if (*MEMORY[0x263EF8AF8] > a4 && !a8)
    {
      int v34 = 0;
      unint64_t v33 = 0;
      if (a5 <= 0x100) {
        *(void *)&a5 = 256;
      }
      else {
        uint64_t v29 = a5;
      }
      if ((a7 & 0xF0) == 0x20) {
        unint64_t v30 = a7 | 0x20000;
      }
      else {
        unint64_t v30 = a7;
      }
      uint64_t v22 = [a3 allocBufferSubDataWithLength:a4 options:v30 alignment:*(void *)&a5 heapIndex:(char *)&v34 + 2 bufferIndex:&v34 bufferOffset:&v33 parentAddress:0 parentLength:0];
      if (v22) {
        goto LABEL_30;
      }
      unint64_t var0 = 0;
    }
LABEL_18:
    LODWORD(v32) = 104;
    uint64_t v12 = [(IOGPUMetalBuffer *)self initWithDevice:a3 pointer:0 length:a4 alignment:v17 options:a7 sysMemSize:v11 gpuAddress:var0 gpuTag:a6 args:a9 argsSize:v32 deallocator:0];
    if (!v12) {
      return v12;
    }
LABEL_19:
    v24 = (Class *)((char *)&v12->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B188]);
    uint64_t v25 = v24[9];
    uint64_t v26 = v24[16];
    uint64_t v27 = v24[2] & 0x1F00000000000000 | [(IOGPUMetalBuffer *)v12 length] & 0xFFFFFFFFFFFFFFLL | 0x2000000000000000;
    v24[1] = v25;
    v24[2] = v27;
    v24[3] = v26;
    return v12;
  }
  unint64_t var1 = a10->var1;
  if (!var1)
  {
LABEL_17:
    unint64_t var0 = a10->var0;
    goto LABEL_18;
  }
  int v34 = 0;
  if (a10->var0 >= var1)
  {
    unint64_t var2 = a10->var2;
    if (a10->var0 + a4 <= var2 + var1)
    {
      unint64_t v33 = a10->var0 - var1;
      if (a5 <= 0x100) {
        *(void *)&a5 = 256;
      }
      else {
        uint64_t v20 = a5;
      }
      if ((a7 & 0xF0) == 0x20) {
        unint64_t v21 = a7 | 0x20000;
      }
      else {
        unint64_t v21 = a7;
      }
      uint64_t v22 = [a3 allocBufferSubDataWithLength:a4 options:v21 alignment:*(void *)&a5 heapIndex:(char *)&v34 + 2 bufferIndex:&v34 bufferOffset:&v33 parentAddress:var1 parentLength:var2];
      if (!v22) {
        goto LABEL_17;
      }
LABEL_30:
      LODWORD(v31) = 104;
      uint64_t v12 = [(IOGPUMetalBuffer *)self initWithPrimaryBuffer:v22 heapIndex:SHIWORD(v34) bufferIndex:(__int16)v34 bufferOffset:v33 length:a4 args:a9 argsSize:v31 gpuTag:a6];
      if (!v12) {
        return v12;
      }
      goto LABEL_19;
    }
  }
LABEL_2:

  return 0;
}

- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 options:(unint64_t)a6 isSuballocDisabled:(BOOL)a7 resourceInArgs:(AGXNewTextureDataStruc *)a8 pinnedGPULocation:(const GPUResourcePinningLocation *)a9
{
  return [(AGXBuffer *)self initWithDevice:a3 length:a4 alignment:*(void *)&a5 pointerTag:0 options:a6 isSuballocDisabled:a7 resourceInArgs:a8 pinnedGPULocation:a9];
}

- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 resourceInArgs:(AGXNewTextureDataStruc *)a7 pinnedGPULocation:(const GPUResourcePinningLocation *)a8
{
  return [(AGXBuffer *)self initWithDevice:a3 length:a4 alignment:1 options:a5 isSuballocDisabled:a6 resourceInArgs:a7 pinnedGPULocation:a8];
}

@end