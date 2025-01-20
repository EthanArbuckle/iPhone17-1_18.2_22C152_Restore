@interface AFMemoryInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFMemoryInfo)init;
- (AFMemoryInfo)initWithBuilder:(id)a3;
- (AFMemoryInfo)initWithCoder:(id)a3;
- (AFMemoryInfo)initWithVirtualMemorySizeInBytes:(unint64_t)a3 numberOfRegions:(int)a4 pageSizeInBytes:(int)a5 residentMemorySizeInBytes:(unint64_t)a6 peakResidentMemorySizeInBytes:(unint64_t)a7 physicalMemoryFootprintInBytes:(unint64_t)a8;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int)numberOfRegions;
- (int)pageSizeInBytes;
- (unint64_t)hash;
- (unint64_t)peakResidentMemorySizeInBytes;
- (unint64_t)physicalMemoryFootprintInBytes;
- (unint64_t)residentMemorySizeInBytes;
- (unint64_t)virtualMemorySizeInBytes;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFMemoryInfo

- (unint64_t)physicalMemoryFootprintInBytes
{
  return self->_physicalMemoryFootprintInBytes;
}

- (unint64_t)peakResidentMemorySizeInBytes
{
  return self->_peakResidentMemorySizeInBytes;
}

- (unint64_t)residentMemorySizeInBytes
{
  return self->_residentMemorySizeInBytes;
}

- (int)pageSizeInBytes
{
  return self->_pageSizeInBytes;
}

- (int)numberOfRegions
{
  return self->_numberOfRegions;
}

- (unint64_t)virtualMemorySizeInBytes
{
  return self->_virtualMemorySizeInBytes;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  unint64_t virtualMemorySizeInBytes = self->_virtualMemorySizeInBytes;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedLongLong:virtualMemorySizeInBytes];
  [v6 encodeObject:v7 forKey:@"AFMemoryInfo::virtualMemorySizeInBytes"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_numberOfRegions];
  [v6 encodeObject:v8 forKey:@"AFMemoryInfo::numberOfRegions"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_pageSizeInBytes];
  [v6 encodeObject:v9 forKey:@"AFMemoryInfo::pageSizeInBytes"];

  v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_residentMemorySizeInBytes];
  [v6 encodeObject:v10 forKey:@"AFMemoryInfo::residentMemorySizeInBytes"];

  v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_peakResidentMemorySizeInBytes];
  [v6 encodeObject:v11 forKey:@"AFMemoryInfo::peakResidentMemorySizeInBytes"];

  id v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_physicalMemoryFootprintInBytes];
  [v6 encodeObject:v12 forKey:@"AFMemoryInfo::physicalMemoryFootprintInBytes"];
}

- (AFMemoryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMemoryInfo::virtualMemorySizeInBytes"];
  uint64_t v6 = [v5 unsignedLongLongValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMemoryInfo::numberOfRegions"];
  uint64_t v8 = [v7 intValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMemoryInfo::pageSizeInBytes"];
  uint64_t v10 = [v9 intValue];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMemoryInfo::residentMemorySizeInBytes"];
  uint64_t v12 = [v11 unsignedLongLongValue];

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMemoryInfo::peakResidentMemorySizeInBytes"];
  uint64_t v14 = [v13 unsignedLongLongValue];

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMemoryInfo::physicalMemoryFootprintInBytes"];

  uint64_t v16 = [v15 unsignedLongLongValue];
  return [(AFMemoryInfo *)self initWithVirtualMemorySizeInBytes:v6 numberOfRegions:v8 pageSizeInBytes:v10 residentMemorySizeInBytes:v12 peakResidentMemorySizeInBytes:v14 physicalMemoryFootprintInBytes:v16];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFMemoryInfo *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t virtualMemorySizeInBytes = self->_virtualMemorySizeInBytes;
      if (virtualMemorySizeInBytes == [(AFMemoryInfo *)v5 virtualMemorySizeInBytes]
        && (int numberOfRegions = self->_numberOfRegions,
            numberOfRegions == [(AFMemoryInfo *)v5 numberOfRegions])
        && (int pageSizeInBytes = self->_pageSizeInBytes,
            pageSizeInBytes == [(AFMemoryInfo *)v5 pageSizeInBytes])
        && (unint64_t residentMemorySizeInBytes = self->_residentMemorySizeInBytes,
            residentMemorySizeInBytes == [(AFMemoryInfo *)v5 residentMemorySizeInBytes])
        && (unint64_t peakResidentMemorySizeInBytes = self->_peakResidentMemorySizeInBytes,
            peakResidentMemorySizeInBytes == [(AFMemoryInfo *)v5 peakResidentMemorySizeInBytes]))
      {
        unint64_t physicalMemoryFootprintInBytes = self->_physicalMemoryFootprintInBytes;
        BOOL v12 = physicalMemoryFootprintInBytes == [(AFMemoryInfo *)v5 physicalMemoryFootprintInBytes];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_virtualMemorySizeInBytes];
  uint64_t v4 = [v3 hash];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_numberOfRegions];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_pageSizeInBytes];
  uint64_t v8 = [v7 hash];
  v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_residentMemorySizeInBytes];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_peakResidentMemorySizeInBytes];
  uint64_t v12 = [v11 hash];
  v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_physicalMemoryFootprintInBytes];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFMemoryInfo;
  v5 = [(AFMemoryInfo *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {unint64_t virtualMemorySizeInBytes = %llu, numberOfRegions = %d, pageSizeInBytes = %d, residentMemorySizeInBytes = %llu, peakResidentMemorySizeInBytes = %llu, physicalMemoryFootprintInBytes = %llu}", v5, self->_virtualMemorySizeInBytes, self->_numberOfRegions, self->_pageSizeInBytes, self->_residentMemorySizeInBytes, self->_peakResidentMemorySizeInBytes, self->_physicalMemoryFootprintInBytes];

  return v6;
}

- (id)description
{
  return [(AFMemoryInfo *)self _descriptionWithIndent:0];
}

- (AFMemoryInfo)initWithVirtualMemorySizeInBytes:(unint64_t)a3 numberOfRegions:(int)a4 pageSizeInBytes:(int)a5 residentMemorySizeInBytes:(unint64_t)a6 peakResidentMemorySizeInBytes:(unint64_t)a7 physicalMemoryFootprintInBytes:(unint64_t)a8
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __168__AFMemoryInfo_initWithVirtualMemorySizeInBytes_numberOfRegions_pageSizeInBytes_residentMemorySizeInBytes_peakResidentMemorySizeInBytes_physicalMemoryFootprintInBytes___block_invoke;
  v9[3] = &__block_descriptor_72_e32_v16__0___AFMemoryInfoMutating__8l;
  int v10 = a4;
  int v11 = a5;
  v9[4] = a3;
  v9[5] = a6;
  v9[6] = a7;
  v9[7] = a8;
  return [(AFMemoryInfo *)self initWithBuilder:v9];
}

void __168__AFMemoryInfo_initWithVirtualMemorySizeInBytes_numberOfRegions_pageSizeInBytes_residentMemorySizeInBytes_peakResidentMemorySizeInBytes_physicalMemoryFootprintInBytes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setVirtualMemorySizeInBytes:v3];
  [v4 setNumberOfRegions:*(unsigned int *)(a1 + 64)];
  [v4 setPageSizeInBytes:*(unsigned int *)(a1 + 68)];
  [v4 setResidentMemorySizeInBytes:*(void *)(a1 + 40)];
  [v4 setPeakResidentMemorySizeInBytes:*(void *)(a1 + 48)];
  [v4 setPhysicalMemoryFootprintInBytes:*(void *)(a1 + 56)];
}

- (AFMemoryInfo)init
{
  return [(AFMemoryInfo *)self initWithBuilder:0];
}

- (AFMemoryInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFMemoryInfoMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFMemoryInfo;
  v5 = [(AFMemoryInfo *)&v9 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_AFMemoryInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFMemoryInfoMutation *)v7 isDirty])
    {
      v6->_unint64_t virtualMemorySizeInBytes = [(_AFMemoryInfoMutation *)v7 getVirtualMemorySizeInBytes];
      v6->_int numberOfRegions = [(_AFMemoryInfoMutation *)v7 getNumberOfRegions];
      v6->_int pageSizeInBytes = [(_AFMemoryInfoMutation *)v7 getPageSizeInBytes];
      v6->_unint64_t residentMemorySizeInBytes = [(_AFMemoryInfoMutation *)v7 getResidentMemorySizeInBytes];
      v6->_unint64_t peakResidentMemorySizeInBytes = [(_AFMemoryInfoMutation *)v7 getPeakResidentMemorySizeInBytes];
      v6->_unint64_t physicalMemoryFootprintInBytes = [(_AFMemoryInfoMutation *)v7 getPhysicalMemoryFootprintInBytes];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFMemoryInfoMutation *))a3;
  if (v4)
  {
    v5 = [[_AFMemoryInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFMemoryInfoMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFMemoryInfo);
      v6->_unint64_t virtualMemorySizeInBytes = [(_AFMemoryInfoMutation *)v5 getVirtualMemorySizeInBytes];
      v6->_int numberOfRegions = [(_AFMemoryInfoMutation *)v5 getNumberOfRegions];
      v6->_int pageSizeInBytes = [(_AFMemoryInfoMutation *)v5 getPageSizeInBytes];
      v6->_unint64_t residentMemorySizeInBytes = [(_AFMemoryInfoMutation *)v5 getResidentMemorySizeInBytes];
      v6->_unint64_t peakResidentMemorySizeInBytes = [(_AFMemoryInfoMutation *)v5 getPeakResidentMemorySizeInBytes];
      v6->_unint64_t physicalMemoryFootprintInBytes = [(_AFMemoryInfoMutation *)v5 getPhysicalMemoryFootprintInBytes];
    }
    else
    {
      uint64_t v6 = (AFMemoryInfo *)[(AFMemoryInfo *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFMemoryInfo *)[(AFMemoryInfo *)self copy];
  }

  return v6;
}

@end