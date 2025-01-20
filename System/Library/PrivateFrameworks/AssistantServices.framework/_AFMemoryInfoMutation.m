@interface _AFMemoryInfoMutation
- (BOOL)isDirty;
- (_AFMemoryInfoMutation)initWithBase:(id)a3;
- (int)getNumberOfRegions;
- (int)getPageSizeInBytes;
- (unint64_t)getPeakResidentMemorySizeInBytes;
- (unint64_t)getPhysicalMemoryFootprintInBytes;
- (unint64_t)getResidentMemorySizeInBytes;
- (unint64_t)getVirtualMemorySizeInBytes;
- (void)setNumberOfRegions:(int)a3;
- (void)setPageSizeInBytes:(int)a3;
- (void)setPeakResidentMemorySizeInBytes:(unint64_t)a3;
- (void)setPhysicalMemoryFootprintInBytes:(unint64_t)a3;
- (void)setResidentMemorySizeInBytes:(unint64_t)a3;
- (void)setVirtualMemorySizeInBytes:(unint64_t)a3;
@end

@implementation _AFMemoryInfoMutation

- (void).cxx_destruct
{
}

- (void)setPhysicalMemoryFootprintInBytes:(unint64_t)a3
{
  self->_physicalMemoryFootprintInBytes = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x41u;
}

- (unint64_t)getPhysicalMemoryFootprintInBytes
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0) {
    return self->_physicalMemoryFootprintInBytes;
  }
  else {
    return [(AFMemoryInfo *)self->_base physicalMemoryFootprintInBytes];
  }
}

- (void)setPeakResidentMemorySizeInBytes:(unint64_t)a3
{
  self->_peakResidentMemorySizeInBytes = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (unint64_t)getPeakResidentMemorySizeInBytes
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0) {
    return self->_peakResidentMemorySizeInBytes;
  }
  else {
    return [(AFMemoryInfo *)self->_base peakResidentMemorySizeInBytes];
  }
}

- (void)setResidentMemorySizeInBytes:(unint64_t)a3
{
  self->_residentMemorySizeInBytes = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (unint64_t)getResidentMemorySizeInBytes
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
    return self->_residentMemorySizeInBytes;
  }
  else {
    return [(AFMemoryInfo *)self->_base residentMemorySizeInBytes];
  }
}

- (void)setPageSizeInBytes:(int)a3
{
  self->_pageSizeInBytes = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (int)getPageSizeInBytes
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_pageSizeInBytes;
  }
  else {
    return [(AFMemoryInfo *)self->_base pageSizeInBytes];
  }
}

- (void)setNumberOfRegions:(int)a3
{
  self->_numberOfRegions = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (int)getNumberOfRegions
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_numberOfRegions;
  }
  else {
    return [(AFMemoryInfo *)self->_base numberOfRegions];
  }
}

- (void)setVirtualMemorySizeInBytes:(unint64_t)a3
{
  self->_virtualMemorySizeInBytes = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getVirtualMemorySizeInBytes
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_virtualMemorySizeInBytes;
  }
  else {
    return [(AFMemoryInfo *)self->_base virtualMemorySizeInBytes];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFMemoryInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFMemoryInfoMutation;
  v6 = [(_AFMemoryInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end