@interface NSError(IOGPUMetalErrors)
- (uint64_t)initWithIOGPUError:()IOGPUMetalErrors;
@end

@implementation NSError(IOGPUMetalErrors)

- (uint64_t)initWithIOGPUError:()IOGPUMetalErrors
{
  if (a3 > 0x12)
  {
    v5 = "Internal Error";
    uint64_t v7 = 1;
    v6 = "Internal Error";
  }
  else
  {
    v5 = off_26441A610[a3];
    v6 = off_26441A6A8[a3];
    uint64_t v7 = qword_21C736E18[a3];
  }
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s (%08x:%s)", v6, a3, v5);
  v9 = NSDictionary;
  uint64_t v10 = *MEMORY[0x263F08320];
  uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:@"IOGPUCommandQueueErrorDomain" code:a3 userInfo:0];
  uint64_t v12 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v8, v10, v11, *MEMORY[0x263F08608], 0);
  uint64_t v13 = *MEMORY[0x263F125F8];
  return [a1 initWithDomain:v13 code:v7 userInfo:v12];
}

@end