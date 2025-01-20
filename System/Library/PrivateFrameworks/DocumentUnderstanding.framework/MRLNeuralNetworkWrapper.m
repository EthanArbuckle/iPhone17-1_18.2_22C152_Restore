@interface MRLNeuralNetworkWrapper
- (BOOL)load:(id)a3;
- (id)lstmPredictions:(id)a3 embeddingDimension:(unint64_t)a4 classSize:(unint64_t)a5 seqLen:(unint64_t)a6;
@end

@implementation MRLNeuralNetworkWrapper

- (id)lstmPredictions:(id)a3 embeddingDimension:(unint64_t)a4 classSize:(unint64_t)a5 seqLen:(unint64_t)a6
{
  v64[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  v15 = v10;
  if (self->model)
  {
    uint64_t v16 = objc_msgSend_count(v10, v11, v12, v13, v14);
    v61[1] = v61;
    v17 = (char *)v61 - ((4 * v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v17, 4 * v16);
    if (objc_msgSend_count(v15, v18, v19, v20, v21))
    {
      unint64_t v25 = 0;
      do
      {
        v26 = objc_msgSend_objectAtIndexedSubscript_(v15, v22, v25, v23, v24);
        objc_msgSend_floatValue(v26, v27, v28, v29, v30);
        *(_DWORD *)&v17[4 * v25] = v31;

        ++v25;
      }
      while (v25 < objc_msgSend_count(v15, v32, v33, v34, v35));
    }
    uint64_t v36 = *MEMORY[0x263F56668];
    v64[0] = &unk_26E9D96B0;
    uint64_t v37 = *MEMORY[0x263F56658];
    v63[0] = v36;
    v63[1] = v37;
    v38 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v22, a4, v23, v24);
    v64[1] = v38;
    v63[2] = *MEMORY[0x263F56660];
    v42 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v39, a6, v40, v41);
    v64[2] = v42;
    v44 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v43, (uint64_t)v64, (uint64_t)v63, 3);

    v45 = (const void *)MRLNeuralNetworkTensorCreate();
    MRLNeuralNetworkTensorAppendData();
    v62 = 0;
    MRLNeuralNetworkSetInputTensor();
    MRLNeuralNetworkPredict();
    Output = (int *)MRLNeuralNetworkGetOutput();
    CFRelease(v45);
    v47 = v62;
    if (v62)
    {
      NSLog(&cfstr_MontrealInfere.isa, v62);
    }
    if (Output)
    {
      id v52 = objc_alloc_init(MEMORY[0x263EFF980]);
      for (unint64_t i = a6 * a5; i; --i)
      {
        int v55 = *Output++;
        LODWORD(v53) = v55;
        v56 = objc_msgSend_numberWithFloat_(NSNumber, v48, v49, v50, v51, v53);
        objc_msgSend_addObject_(v52, v57, (uint64_t)v56, v58, v59);
      }
      MRLNeuralNetworkClear();
    }
    else
    {
      id v52 = 0;
    }
  }
  else
  {
    NSLog(&cfstr_MontrealModelM.isa);
    id v52 = 0;
  }

  return v52;
}

- (BOOL)load:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v6 = objc_msgSend_fileURLWithPath_(NSURL, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = *MEMORY[0x263F56640];
  v12[0] = v6;
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v12, (uint64_t)&v11, 1);
  v9 = (MontrealNeuralNetwork *)MRLNeuralNetworkCreate();
  self->model = v9;
  if (!v9)
  {
    NSLog(&cfstr_MontrealModelF.isa, v6, 0);
  }
  return v9 != 0;
}

@end