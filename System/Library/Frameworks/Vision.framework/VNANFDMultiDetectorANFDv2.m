@interface VNANFDMultiDetectorANFDv2
+ (Class)detectorClass;
- (id)splitDetectedClassResultsIntoSubclasses:(id)a3;
@end

@implementation VNANFDMultiDetectorANFDv2

+ (Class)detectorClass
{
  return (Class)objc_opt_class();
}

- (id)splitDetectedClassResultsIntoSubclasses:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v17 = v4;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          BOOL v12 = [(VNANFDMultiDetector *)self isDetectedObject:v11 ofAGivenObjectSubClass:@"Dog"];
          v13 = v5;
          if (!v12)
          {
            BOOL v14 = [(VNANFDMultiDetector *)self isDetectedObject:v11 ofAGivenObjectSubClass:@"Cat"];
            v13 = v6;
            if (!v14)
            {
              v18.receiver = self;
              v18.super_class = (Class)VNANFDMultiDetectorANFDv2;
              v15 = [(VNANFDMultiDetector *)&v18 splitDetectedClassResultsIntoSubclasses:v7];

              id v4 = v17;
              goto LABEL_14;
            }
          }
          [v13 addObject:v11];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v4 = v17;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, v6, 0);
LABEL_14:
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)VNANFDMultiDetectorANFDv2;
    v15 = [(VNANFDMultiDetector *)&v23 splitDetectedClassResultsIntoSubclasses:v4];
  }

  return v15;
}

@end