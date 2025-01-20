@interface MLComputeDataSource
- (MLComputeDataSource)initWithFeatureProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6;
- (NSDictionary)dataDictionary;
- (id)dataCHWFromChanneledPixelType:(__CVBuffer *)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5;
- (id)dataCHWFromPixelBuffer:(__CVBuffer *)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5;
- (id)dataCHWFromPixelTypeGray8:(__CVBuffer *)a3 error:(id *)a4;
- (id)oneHotEncodedDataFromFeatureValue:(id)a3 withNNEngine:(id)a4 error:(id *)a5;
@end

@implementation MLComputeDataSource

- (void).cxx_destruct
{
}

- (NSDictionary)dataDictionary
{
  return self->_dataDictionary;
}

- (id)oneHotEncodedDataFromFeatureValue:(id)a3 withNNEngine:(id)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 classLabels];
  v10 = v9;
  if (!v9 || ![v9 count])
  {
    if (a5)
    {
      id v16 = +[MLModelErrorUtils errorWithCode:6 format:@"Failed to derive valid training input from class label"];
LABEL_8:
      v17 = 0;
      *a5 = v16;
      goto LABEL_31;
    }
LABEL_24:
    v17 = 0;
    goto LABEL_31;
  }
  v11 = [v10 objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v13 = [v8 classLabelToIndexMap];
    v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "int64Value"));
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];
    goto LABEL_10;
  }
  if ([v7 type] != 3)
  {
    if (a5)
    {
      id v16 = +[MLModelErrorUtils errorWithCode:6 format:@"Predicted class is not in expected format"];
      goto LABEL_8;
    }
    goto LABEL_24;
  }
  v13 = [v8 classLabelToIndexMap];
  v14 = [v7 stringValue];
  uint64_t v15 = [v13 objectForKeyedSubscript:v14];
LABEL_10:
  v18 = (void *)v15;

  if (v18)
  {
    uint64_t v19 = [v10 count];
    if ([v8 classifierOutputIsSigmoidOutput]) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v19;
    }
    v21 = [MLMultiArray alloc];
    v22 = [NSNumber numberWithUnsignedInteger:v20];
    v28[0] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    v17 = [(MLMultiArray *)v21 initWithShape:v23 dataType:65568 error:a5];

    if (v17)
    {
      if (v20 >= 1)
      {
        for (uint64_t i = 0; i != v20; ++i)
          [(MLMultiArray *)v17 setObject:&unk_1EF119E90 atIndexedSubscript:i];
      }
      if ([v8 classifierOutputIsSigmoidOutput])
      {
        v25 = objc_msgSend(NSNumber, "numberWithInt:", 1 - objc_msgSend(v18, "intValue"));
        [(MLMultiArray *)v17 setObject:v25 atIndexedSubscript:0];
      }
      else
      {
        -[MLMultiArray setObject:atIndexedSubscript:](v17, "setObject:atIndexedSubscript:", &unk_1EF119EA0, (int)[v18 intValue]);
      }
      v26 = v17;
    }
    else if (a5)
    {
      *a5 = +[MLModelErrorUtils errorWithCode:6 format:@"Failed to copy over input multi array"];
    }
  }
  else if (a5)
  {
    +[MLModelErrorUtils errorWithCode:6, @"Invalid class label %@ provided as input", v7 format];
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

LABEL_31:

  return v17;
}

- (id)dataCHWFromChanneledPixelType:(__CVBuffer *)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  minFloat[2] = *MEMORY[0x1E4F143B8];
  vImagePixelCount Width = CVPixelBufferGetWidth(a3);
  src.height = CVPixelBufferGetHeight(a3);
  src.width = Width;
  src.data = CVPixelBufferGetBaseAddress(a3);
  src.rowBytes = CVPixelBufferGetBytesPerRow(a3);
  size_t v9 = 3 * 4 * Width * src.height;
  v10 = (char *)malloc_type_malloc(v9, 0x78DF4184uLL);
  v11 = malloc_type_malloc(4 * Width * src.height, 0x990100E6uLL);
  alpha.data = v10;
  alpha.height = src.height;
  alpha.width = Width;
  alpha.rowBytes = 4 * Width;
  red.data = &v10[4 * src.height * Width];
  red.height = src.height;
  red.width = Width;
  red.rowBytes = 4 * Width;
  green.data = &v10[8 * src.height * Width];
  green.height = src.height;
  green.width = Width;
  green.rowBytes = 4 * Width;
  blue.data = v11;
  blue.height = src.height;
  blue.width = Width;
  blue.rowBytes = 4 * Width;
  minFloat[0] = 0;
  minFloat[1] = 0;
  long long maxFloat = xmmword_19EC7B950;
  if (v6) {
    vImage_Error v12 = vImageConvert_ARGB8888toPlanarF(&src, &alpha, &red, &green, &blue, (const float *)&maxFloat, (const float *)minFloat, 0);
  }
  else {
    vImage_Error v12 = vImageConvert_ARGB8888toPlanarF(&src, &blue, &alpha, &red, &green, (const float *)&maxFloat, (const float *)minFloat, 0);
  }
  if (v12)
  {
    if (a5)
    {
      v13 = [NSNumber numberWithLong:v12];
      +[MLModelErrorUtils genericErrorWithFormat:@"Failed to convert ARGB8888 to PlanarF: Code=%@", v13];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    free(v11);
    free(v10);
    v14 = 0;
  }
  else
  {
    free(v11);
    v14 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v10 length:v9 freeWhenDone:1];
  }

  return v14;
}

- (id)dataCHWFromPixelTypeGray8:(__CVBuffer *)a3 error:(id *)a4
{
  vImagePixelCount Width = CVPixelBufferGetWidth(a3);
  vImagePixelCount Height = CVPixelBufferGetHeight(a3);
  src.height = Height;
  src.width = Width;
  src.data = CVPixelBufferGetBaseAddress(a3);
  src.rowBytes = CVPixelBufferGetBytesPerRow(a3);
  id v8 = malloc_type_malloc(4 * Width * Height, 0xC819E1EuLL);
  dest.data = v8;
  dest.height = Height;
  dest.width = Width;
  dest.rowBytes = 4 * Width;
  vImage_Error v9 = vImageConvert_Planar8toPlanarF(&src, &dest, 255.0, 0.0, 0);
  if (v9)
  {
    if (a4)
    {
      v10 = [NSNumber numberWithLong:v9];
      +[MLModelErrorUtils genericErrorWithFormat:@"Failed to convert planar8 to planarF: Code=%@", v10];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    free(v8);
    v11 = 0;
  }
  else
  {
    v11 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v8 length:4 * Width * Height freeWhenDone:1];
  }

  return v11;
}

- (id)dataCHWFromPixelBuffer:(__CVBuffer *)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (CVPixelBufferLockBaseAddress(a3, 1uLL))
  {
    if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:@"Failed to lock pixel buffer"];
      vImage_Error v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      vImage_Error v9 = 0;
    }
  }
  else
  {
    if (CVPixelBufferGetPixelFormatType(a3) == 1278226488) {
      [(MLComputeDataSource *)self dataCHWFromPixelTypeGray8:a3 error:a5];
    }
    else {
    vImage_Error v9 = [(MLComputeDataSource *)self dataCHWFromChanneledPixelType:a3 channelOrderIsBGR:v6 error:a5];
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }

  return v9;
}

- (MLComputeDataSource)initWithFeatureProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v10 = a5;
  v47.receiver = self;
  v47.super_class = (Class)MLComputeDataSource;
  v38 = [(MLComputeDataSource *)&v47 init];
  if (v38)
  {
    v37 = [MEMORY[0x1E4F1CA60] dictionary];
    v39 = a6;
    [v10 modelDescription];
    if (v8) {
      v11 = {;
    }
      [v11 inputDescriptionsByName];
    }
    else {
      v11 = {;
    }
      [v11 trainingInputDescriptionsByName];
    v13 = };

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v13;
    uint64_t v14 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v14)
    {
      uint64_t v40 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v44 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          v17 = [obj objectForKeyedSubscript:v16];
          v18 = [v41 featureValueForName:v16];
          if (!v18)
          {
            if (v39)
            {
              id v32 = +[MLModelErrorUtils updateErrorWithFormat:@"Data provided in input: %@ is missing feature value for training input: %@", v41, v16];
              v18 = 0;
              goto LABEL_38;
            }
            v18 = 0;
            goto LABEL_55;
          }
          uint64_t v19 = [v10 modelDescription];
          uint64_t v20 = [v19 predictedFeatureName];
          int v21 = [v20 isEqualToString:v16];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v22 = [v10 lossTargetName];
            int v23 = [v22 isEqualToString:v16];
          }
          else
          {
            int v23 = 0;
          }
          if (((v21 | v23) & 1) != 0 || v17)
          {
            uint64_t v24 = [v18 type];
            if (v24 == 4)
            {
              v25 = [v17 imageConstraint];
              if (([v25 isAllowedValue:v18 error:v39] & 1) == 0)
              {
                if (v39)
                {
                  v34 = [v17 imageConstraint];
                  id *v39 = +[MLModelErrorUtils updateErrorWithFormat:@"Image value for %@ does not comply with constraint: %@", v16, v34];
                }
                goto LABEL_54;
              }
              v31 = -[MLComputeDataSource dataCHWFromPixelBuffer:channelOrderIsBGR:error:](v38, "dataCHWFromPixelBuffer:channelOrderIsBGR:error:", [v18 imageBufferValue], objc_msgSend(v25, "pixelType") == 30, v39);
              if (!v31)
              {
                if (v39)
                {
                  id *v39 = +[MLModelErrorUtils updateErrorWithFormat:@"Cannot extract data for image feature: %@", v16];
                }
                goto LABEL_54;
              }
              [v37 setObject:v31 forKeyedSubscript:v16];
            }
            else
            {
              if (v24 == 5)
              {
                v25 = [v18 multiArrayValue];
                v26 = [v25 shape];
                if (!v26
                  || ([v25 shape],
                      v27 = objc_claimAutoreleasedReturnValue(),
                      BOOL v28 = [v27 count] == 0,
                      v27,
                      v26,
                      v28))
                {
                  if (v39)
                  {
                    id *v39 = +[MLModelErrorUtils updateErrorWithFormat:@"Data provided for %@ has insufficient shape", v16];
                  }
                  goto LABEL_54;
                }
                v29 = [v17 multiArrayConstraint];
                char v30 = objc_msgSend(v29, "isAllowedValue:isNeuralNetworkInputOrOutput:usingRank5Mapping:featureName:error:", v18, 1, objc_msgSend(v10, "ndArrayInterpretation") ^ 1, v16, v39);

                if ((v30 & 1) == 0)
                {
                  if (v39)
                  {
                    v35 = [v17 multiArrayConstraint];
                    id *v39 = +[MLModelErrorUtils updateErrorWithFormat:@"MLMultiArray value for %@ does not comply with constraint: %@", v16, v35];
                  }
LABEL_54:

                  goto LABEL_55;
                }
              }
              else
              {
                if ((v21 & 1) == 0)
                {
                  if (v39)
                  {
                    v33 = [obj objectForKeyedSubscript:v16];
                    id *v39 = +[MLModelErrorUtils updateErrorWithFormat:@"Input %@ is not in the expected format, expected: %@", v16, v33];
                  }
                  goto LABEL_55;
                }
                if ([v18 type] != 1 && objc_msgSend(v18, "type") != 3
                  || ([v17 isAllowedValue:v18 error:v39] & 1) == 0)
                {
                  if (v39)
                  {
                    id v32 = +[MLModelErrorUtils updateErrorWithFormat:@"Value for %@ does not comply with constraint in description: %@ (%@)", v16, v17, *v39];
                    goto LABEL_38;
                  }
LABEL_55:

                  vImage_Error v12 = 0;
                  goto LABEL_56;
                }
                v25 = [(MLComputeDataSource *)v38 oneHotEncodedDataFromFeatureValue:v18 withNNEngine:v10 error:v39];
                if (!v25)
                {
                  if (v39)
                  {
                    id v32 = +[MLModelErrorUtils errorWithCode:6, *v39, @"Cannot transform the %@ feature value to one hot encoded format.", v18 underlyingError format];
LABEL_38:
                    id *v39 = v32;
                  }
                  goto LABEL_55;
                }
              }
              [v37 setObject:v25 forKeyedSubscript:v16];
            }
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    objc_storeStrong((id *)&v38->_dataDictionary, v37);
    vImage_Error v12 = v38;
LABEL_56:
  }
  else
  {
    vImage_Error v12 = 0;
  }

  return v12;
}

@end