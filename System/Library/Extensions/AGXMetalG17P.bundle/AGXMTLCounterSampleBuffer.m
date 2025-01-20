@interface AGXMTLCounterSampleBuffer
- (AGXMTLCounterSampleBuffer)initWithDevice:(id)a3 descriptor:(id)a4 error:(id *)a5;
- (AGXMTLCounterSampleBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 label:(id)a5 options:(unint64_t)a6 error:(id *)a7;
- (IOGPUMetalBuffer)buffer;
- (MTLDevice)device;
- (NSString)label;
- (id)resolveCounterRange:(_NSRange)a3;
- (unint64_t)sampleCount;
- (unint64_t)sampleSize;
- (void)dealloc;
@end

@implementation AGXMTLCounterSampleBuffer

- (id)resolveCounterRange:(_NSRange)a3
{
  if (!a3.length) {
    return 0;
  }
  NSUInteger location = a3.location;
  if (a3.location + a3.length > self->_sampleCount) {
    return 0;
  }
  size_t v6 = 8 * a3.length;
  v7 = (void *)[MEMORY[0x263EFF990] dataWithLength:8 * a3.length];
  v5 = v7;
  if (v7) {
    memcpy((void *)[v7 mutableBytes], -[IOGPUMetalBuffer contents](self->_buffer, "contents") + 8 * location, v6);
  }
  return v5;
}

- (IOGPUMetalBuffer)buffer
{
  return &self->_buffer->super;
}

- (unint64_t)sampleSize
{
  return 8;
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (NSString)label
{
  return self->_label;
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_device;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AGXMTLCounterSampleBuffer;
  [(AGXMTLCounterSampleBuffer *)&v3 dealloc];
}

- (AGXMTLCounterSampleBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 label:(id)a5 options:(unint64_t)a6 error:(id *)a7
{
  if (a7) {
    *a7 = 0;
  }
  v26.receiver = self;
  v26.super_class = (Class)AGXMTLCounterSampleBuffer;
  v12 = [(AGXMTLCounterSampleBuffer *)&v26 init];
  if (v12)
  {
    v13 = v12;
    if (a4 - 32769 > 0xFFFFFFFFFFFF7FFFLL)
    {
      if ((a4 & 7) == 0)
      {
        v25 = [[AGXBuffer alloc] initCounterSampleBufferWithDevice:a3 length:a4 options:a6];
        v13->_buffer = v25;
        if (v25)
        {
          v13->_device = (IOGPUMetalDevice *)a3;
          v13->_label = (NSString *)[a5 copy];
          v13->_sampleCount = a4 >> 3;
          return v13;
        }
        if (!a7) {
          goto LABEL_16;
        }
        uint64_t v16 = [NSDictionary dictionaryWithObject:@"Cannot allocate sample buffer" forKey:*MEMORY[0x263F08320]];
        id v21 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v22 = *MEMORY[0x263F12690];
        uint64_t v23 = 0;
        goto LABEL_15;
      }
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid sample buffer length: %llu B. Length must be aligned to %zu B", a4, 8);
      if (a7)
      {
        uint64_t v15 = v20;
        if (v20) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid sample buffer length: %llu B. Expected range: %zu -> %u", a4, 8, 0x8000);
      if (a7)
      {
        uint64_t v15 = v14;
        if (v14)
        {
LABEL_7:
          uint64_t v16 = [NSDictionary dictionaryWithObject:v15 forKey:*MEMORY[0x263F08320]];
LABEL_14:
          id v21 = objc_alloc(MEMORY[0x263F087E8]);
          uint64_t v22 = *MEMORY[0x263F12690];
          uint64_t v23 = 1;
LABEL_15:
          *a7 = (id)[v21 initWithDomain:v22 code:v23 userInfo:v16];
          goto LABEL_16;
        }
LABEL_13:
        uint64_t v16 = 0;
        goto LABEL_14;
      }
    }
LABEL_16:

    return 0;
  }
  if (!a7) {
    return 0;
  }
  uint64_t v17 = [NSDictionary dictionaryWithObject:@"Internal error" forKey:*MEMORY[0x263F08320]];
  id v18 = objc_alloc(MEMORY[0x263F087E8]);
  id v19 = (id)[v18 initWithDomain:*MEMORY[0x263F12690] code:2 userInfo:v17];
  v13 = 0;
  *a7 = v19;
  return v13;
}

- (AGXMTLCounterSampleBuffer)initWithDevice:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "counterSet"), "counters"), "count") != 1)
  {
    if (a5)
    {
      uint64_t v17 = NSDictionary;
      uint64_t v18 = *MEMORY[0x263F08320];
      id v19 = @"Invalid counter set size. Expecting 1 counter";
LABEL_14:
      uint64_t v21 = [v17 dictionaryWithObject:v19 forKey:v18];
LABEL_15:
      id v22 = objc_alloc(MEMORY[0x263F087E8]);
      *a5 = (id)[v22 initWithDomain:*MEMORY[0x263F12690] code:1 userInfo:v21];
      return 0;
    }
    return 0;
  }
  v9 = objc_msgSend((id)objc_msgSend(a4, "counterSet"), "name");
  uint64_t v10 = *MEMORY[0x263F12620];
  if (([v9 isEqualToString:*MEMORY[0x263F12620]] & 1) == 0)
  {
    uint64_t v20 = [NSString stringWithFormat:@"Invalid counter set name. Expecting: %@. Found: %@", v10, v9];
    if (a5)
    {
      id v19 = (__CFString *)v20;
      if (!v20)
      {
LABEL_19:
        uint64_t v21 = 0;
        goto LABEL_15;
      }
      goto LABEL_13;
    }
    return 0;
  }
  v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "counterSet"), "counters"), "objectAtIndexedSubscript:", 0), "name");
  uint64_t v12 = *MEMORY[0x263F12628];
  if (([v11 isEqualToString:*MEMORY[0x263F12628]] & 1) == 0)
  {
    uint64_t v23 = [NSString stringWithFormat:@"Invalid counter name. Expecting: %@. Found: %@", v12, v11];
    if (!a5) {
      return 0;
    }
    id v19 = (__CFString *)v23;
    if (!v23) {
      goto LABEL_19;
    }
LABEL_13:
    uint64_t v17 = NSDictionary;
    uint64_t v18 = *MEMORY[0x263F08320];
    goto LABEL_14;
  }
  uint64_t v13 = 8 * [a4 sampleCount];
  uint64_t v14 = 16 * ([a4 storageMode] & 0xF);
  uint64_t v15 = [a4 label];

  return [(AGXMTLCounterSampleBuffer *)self initWithDevice:a3 length:v13 label:v15 options:v14 error:a5];
}

@end