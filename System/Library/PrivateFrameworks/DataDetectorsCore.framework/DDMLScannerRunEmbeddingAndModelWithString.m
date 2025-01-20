@interface DDMLScannerRunEmbeddingAndModelWithString
@end

@implementation DDMLScannerRunEmbeddingAndModelWithString

uint64_t ___DDMLScannerRunEmbeddingAndModelWithString_block_invoke(uint64_t a1)
{
  uint64_t v2 = +[DDMLTaggerModel currentTaggerModel];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

void ___DDMLScannerRunEmbeddingAndModelWithString_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v7 = objc_opt_new();
  v8 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  [v7 setString:v8];

  objc_msgSend(v7, "setRange:", a3, a4);
  v40 = v7;
  [*(id *)(a1 + 40) addObject:v7];
  v9 = objc_opt_new();
  v10 = *(void **)(a1 + 48);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = ___DDMLScannerRunEmbeddingAndModelWithString_block_invoke_3;
  v57[3] = &unk_1E5985358;
  uint64_t v59 = *(void *)(a1 + 64);
  id v11 = v9;
  id v58 = v11;
  objc_msgSend(v10, "enumerateTokenVectorsInRange:usingBlock:", a3, a4, v57);
  uint64_t v12 = [v11 count];
  v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v12];
  if (*(void *)(a1 + 64))
  {
    unint64_t v14 = 0;
    do
    {
      [v13 addObject:&unk_1EF03BED8];
      ++v14;
    }
    while (v14 < *(void *)(a1 + 64));
  }
  uint64_t v39 = a1;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v11;
  uint64_t v43 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v54;
    float v15 = (float)v12;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v54 != v42) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v61 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          int v21 = 0;
          uint64_t v22 = *(void *)v50;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v50 != v22) {
                objc_enumerationMutation(v18);
              }
              objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * j), "floatValue", v39);
              float v25 = v24;
              v26 = [v13 objectAtIndexedSubscript:v21 + j];
              [v26 floatValue];
              float v28 = v27;

              *(float *)&double v29 = (float)(v25 / v15) + v28;
              v30 = [NSNumber numberWithFloat:v29];
              [v13 setObject:v30 atIndexedSubscript:v21 + j];
            }
            v21 += j;
            uint64_t v20 = [v18 countByEnumeratingWithState:&v49 objects:v61 count:16];
          }
          while (v20);
        }
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v43);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v31 = v13;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v60 count:16];
  uint64_t v33 = v39;
  if (v32)
  {
    uint64_t v34 = v32;
    uint64_t v35 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(v31);
        }
        v37 = *(void **)(*((void *)&v45 + 1) + 8 * k);
        int v44 = 0;
        objc_msgSend(v37, "floatValue", v39);
        int v44 = v38;
        [*(id *)(v33 + 56) appendBytes:&v44 length:4];
      }
      uint64_t v34 = [v31 countByEnumeratingWithState:&v45 objects:v60 count:16];
    }
    while (v34);
  }
}

void ___DDMLScannerRunEmbeddingAndModelWithString_block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 count] != *(void *)(a1 + 40))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<DDMLToken *> *_DDMLScannerRunEmbeddingAndModelWithString(NLContextualEmbedding *__strong, MRLNeuralNetworkRef, NSString *__strong)_block_invoke_3");
    [v3 handleFailureInFunction:v4 file:@"DDMLScanner.m" lineNumber:878 description:@"tokenVector has unexpected dimensions"];
  }
  [*(id *)(a1 + 32) addObject:v5];
}

@end