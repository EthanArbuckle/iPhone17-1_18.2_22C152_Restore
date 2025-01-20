@interface AGXG17FamilyHeap
- (AGXG17FamilyHeap)initWithDevice:(id)a3 descriptor:(id)a4;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newBufferWithDescriptor:(id)a3;
- (id)newBufferWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 atOffset:(unint64_t)a5;
- (id)newTextureWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 atOffset:(unint64_t)a4;
@end

@implementation AGXG17FamilyHeap

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  if ([(_MTLHeap *)self storageMode] != 2) {
    return 0;
  }
  v9 = [(IOGPUMetalHeap *)self device];
  [(MTLDevice *)v9 heapAccelerationStructureSizeAndAlignWithSize:a3];
  v11 = [(AGXBuffer *)[AGXG17FamilyBuffer alloc] initWithHeap:self length:a3 alignment:v10 options:[(_MTLHeap *)self resourceOptions] atOffset:a4];
  if (!v11) {
    return 0;
  }
  v12 = v11;
  if ([(MTLDevice *)v9 buildBVHForRIA]) {
    v13 = [[AGXG17FamilyRayTracingAccelerationStructure alloc] initWithBuffer:v12 device:v9 length:a3 resourceIndex:a5];
  }
  else {
    v13 = [[AGXG17FamilyRayTracingAccelerationStructureSW alloc] initWithBuffer:v12 offset:0 device:v9 resourceIndex:a5];
  }
  v14 = v13;

  return v14;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  v7 = [(IOGPUMetalHeap *)self device];
  if (v7) {
    [(MTLDevice *)v7 accelerationStructureSizesWithDescriptor:a3];
  }
  return [(AGXG17FamilyHeap *)self newAccelerationStructureWithSize:0 offset:a4 resourceIndex:0];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  return [(AGXG17FamilyHeap *)self newAccelerationStructureWithSize:a3 offset:a4 resourceIndex:0];
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  v5 = [(IOGPUMetalHeap *)self device];
  if (v5) {
    [(MTLDevice *)v5 accelerationStructureSizesWithDescriptor:a3];
  }
  return [(AGXG17FamilyHeap *)self newAccelerationStructureWithSize:0 resourceIndex:0];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  if ([(_MTLHeap *)self storageMode] != 2) {
    return 0;
  }
  v7 = [(IOGPUMetalHeap *)self device];
  [(MTLDevice *)v7 heapAccelerationStructureSizeAndAlignWithSize:a3];
  v9 = [(AGXBuffer *)[AGXG17FamilyBuffer alloc] initWithHeap:self length:a3 alignment:v8 options:[(_MTLHeap *)self resourceOptions]];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  if ([(MTLDevice *)v7 buildBVHForRIA]) {
    v11 = [[AGXG17FamilyRayTracingAccelerationStructure alloc] initWithBuffer:v10 device:v7 length:a3 resourceIndex:a4];
  }
  else {
    v11 = [[AGXG17FamilyRayTracingAccelerationStructureSW alloc] initWithBuffer:v10 offset:0 device:v7 resourceIndex:a4];
  }
  v12 = v11;

  return v12;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  return [(AGXG17FamilyHeap *)self newAccelerationStructureWithSize:a3 resourceIndex:0];
}

- (id)newBufferWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  uint64_t v7 = [a3 length];
  uint64_t v8 = [a3 alignment];
  uint64_t v9 = [a3 pointerTag];
  uint64_t v10 = [AGXG17FamilyBuffer alloc];
  unint64_t v11 = [(_MTLHeap *)self resourceOptions];

  return [(AGXBuffer *)v10 initWithHeap:self length:v7 alignment:v8 pointerTag:v9 options:v11 atOffset:a4];
}

- (id)newBufferWithDescriptor:(id)a3
{
  uint64_t v5 = [a3 length];
  uint64_t v6 = [a3 alignment];
  uint64_t v7 = [a3 pointerTag];
  uint64_t v8 = [AGXG17FamilyBuffer alloc];
  unint64_t v9 = [(_MTLHeap *)self resourceOptions];

  return [(AGXBuffer *)v8 initWithHeap:self length:v5 alignment:v6 pointerTag:v7 options:v9];
}

- (id)newTextureWithDescriptor:(id)a3 atOffset:(unint64_t)a4
{
  uint64_t v7 = [AGXG17FamilyTexture alloc];

  return [(AGXTexture *)v7 initWithHeap:self desc:a3 atOffset:a4];
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 atOffset:(unint64_t)a5
{
  unint64_t v9 = [AGXG17FamilyBuffer alloc];

  return [(AGXBuffer *)v9 initWithHeap:self length:a3 options:a4 atOffset:a5];
}

- (id)newTextureWithDescriptor:(id)a3
{
  uint64_t v5 = [AGXG17FamilyTexture alloc];

  return [(AGXTexture *)v5 initWithHeap:self desc:a3];
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v7 = [AGXG17FamilyBuffer alloc];

  return [(AGXBuffer *)v7 initWithHeap:self length:a3 options:a4];
}

- (AGXG17FamilyHeap)initWithDevice:(id)a3 descriptor:(id)a4
{
  if (objc_msgSend(a4, "validateWithDevice:"))
  {
    uint64_t v7 = (uint64_t *)[a4 descriptorPrivate];
    uint64_t v8 = *v7;
    v20[0] = 0;
    HIDWORD(v20[0]) = (v7[2] != 0) << 10;
    v20[1] = 0x100010001;
    uint64_t v9 = *MEMORY[0x263EF8AF8];
    unint64_t v10 = (unint64_t)(v8 + *MEMORY[0x263EF8AF8] - 1) / *MEMORY[0x263EF8AF8];
    int v21 = 16777473;
    unint64_t v11 = v10 * v9;
    int v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = [a4 pinnedGPUAddress];
    uint64_t v25 = [a4 size];
    uint64_t v27 = 0;
    long long v26 = 0u;
    unint64_t v28 = v11;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    BOOL v12 = v7[1] == 2;
    BOOL v13 = v7[2] != 0;
    uint64_t v14 = ([a4 hazardTrackingMode] & 3) << 8;
    if ((*(unsigned char *)(*((void *)a3 + 101) + 7288) & 0x10) != 0) {
      uint64_t v14 = 512;
    }
    uint64_t v15 = (v13 || 32 * v12) | (unint64_t)v14;
    uint64_t v16 = v7[6];
    if ((v16 & 0x600000) != 0)
    {
      if ((v16 & 0x200000) != 0) {
        int v17 = 393216;
      }
      else {
        int v17 = 0x40000;
      }
      if ((v16 & 0x400000) == 0) {
        int v17 = 0x20000;
      }
      int v22 = v17;
    }
    v19.receiver = self;
    v19.super_class = (Class)AGXG17FamilyHeap;
    return [(IOGPUMetalHeap *)&v19 initWithDevice:a3 size:v11 options:v15 | v16 & 0x1600000 args:v20 argsSize:104 desc:a4];
  }
  else
  {
    [(IOGPUMetalHeap *)self dealloc];
    return 0;
  }
}

@end