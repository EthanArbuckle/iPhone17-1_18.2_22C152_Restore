@interface SRPPGSampleArray
- (SRPPGSampleArray)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
@end

@implementation SRPPGSampleArray

- (SRPPGSampleArray)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a3, "length", a5))
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    v8 = (void *)[objc_alloc(MEMORY[0x263F429C8]) initWithBinaryRepresentation:a3];
    if (v8)
    {
      v9 = v8;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v10 = objc_msgSend(v8, "frameEnumerator", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = [[SRPhotoplethysmogramSample alloc] initWithHAPPGFrame:*(void *)(*((void *)&v18 + 1) + 8 * v14)];
            [v7 addObject:v15];

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
      }
    }
    v16 = (SRPPGSampleArray *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v7];
  }
  else
  {

    return 0;
  }
  return v16;
}

@end