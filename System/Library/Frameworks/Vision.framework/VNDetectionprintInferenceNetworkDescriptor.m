@interface VNDetectionprintInferenceNetworkDescriptor
+ (id)URLForEspressoModelNamed:(id)a3 error:(id *)a4;
+ (id)_descriptorForNetworkFileName:(id)a3 networkSpecifier:(id)a4 imageInputName:(id)a5 tensorKeyToOutputNames:(id)a6 error:(id *)a7;
+ (id)sceneNetV3BasedNetworkAndReturnError:(id *)a3;
- (NSDictionary)tensorKeyToPrintOutputName;
@end

@implementation VNDetectionprintInferenceNetworkDescriptor

+ (id)URLForEspressoModelNamed:(id)a3 error:(id *)a4
{
  v4 = [MEMORY[0x1E4FB3EA0] URLForModelNamed:a3 error:a4];

  return v4;
}

+ (id)sceneNetV3BasedNetworkAndReturnError:(id *)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4FB3F00]);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB3F10]) initWithMajor:3 minor:0 micro:0];
  v7 = (void *)[v5 initWithIdentifier:@"VNDetectionprintInferenceNetworkIdentifier" version:v6];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __83__VNDetectionprintInferenceNetworkDescriptor_sceneNetV3BasedNetworkAndReturnError___block_invoke;
  v17 = &unk_1E5B20078;
  id v19 = a1;
  id v8 = v7;
  id v18 = v8;
  v9 = _Block_copy(&v14);
  v10 = +[VNFrameworkManager manager];
  v11 = [v10 detectorDescriptorsCache];
  v12 = [v11 objectForIdentifier:v8 creationBlock:v9 error:a3];

  return v12;
}

id __83__VNDetectionprintInferenceNetworkDescriptor_sceneNetV3BasedNetworkAndReturnError___block_invoke(uint64_t a1, uint64_t a2)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"VNDetectionprintTensorKeyMixed2";
  v7[1] = @"VNDetectionprintTensorKeyMixed6";
  v8[0] = @"classification/mixed_2/concat_channels";
  v8[1] = @"classification/mixed_6/concat_channels";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  id v5 = [*(id *)(a1 + 40) _descriptorForNetworkFileName:@"detector_print_mixed26.espresso" networkSpecifier:*(void *)(a1 + 32) imageInputName:@"data" tensorKeyToOutputNames:v4 error:a2];

  return v5;
}

+ (id)_descriptorForNetworkFileName:(id)a3 networkSpecifier:(id)a4 imageInputName:(id)a5 tensorKeyToOutputNames:(id)a6 error:(id *)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v28 = a4;
  id v29 = a5;
  id v12 = a6;
  v13 = [a1 URLForEspressoModelNamed:a3 error:a7];
  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v15 = [v12 allValues];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v15);
          }
          [v14 setObject:&unk_1EF7A7B80 forKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v16);
    }

    id v30 = 0;
    id v31 = 0;
    char v19 = [MEMORY[0x1E4FB3EA0] getInputImageTensorDescriptor:&v31 outputTensorDescriptors:&v30 forNetworkModelFileURL:v13 inputBlobName:v29 pixelFormatType:1111970369 outputBlobNamesWithTypes:v14 confidencesBlobNamesWithLabelsFiles:0 error:a7];
    id v20 = v31;
    id v21 = v30;
    if (v19)
    {
      id v22 = objc_alloc((Class)a1);
      v23 = [v21 allValues];
      v24 = (void *)[v22 initWithURL:v13 specifier:v28 networkHeadVersions:0 inputImage:v20 outputs:v23 confidencesOutput:0];

      uint64_t v25 = [v12 copy];
      v26 = (void *)v24[8];
      v24[8] = v25;
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void).cxx_destruct
{
}

- (NSDictionary)tensorKeyToPrintOutputName
{
  return self->_tensorKeyToPrintOutputName;
}

@end