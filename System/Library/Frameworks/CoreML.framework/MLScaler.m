@interface MLScaler
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLFeatureValue)scaleValue;
- (MLFeatureValue)shiftValue;
- (MLScaler)initWithShiftValue:(id)a3 scaleValue:(id)a4 description:(id)a5 configuration:(id)a6;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)predictionTypeForKTrace;
@end

@implementation MLScaler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleValue, 0);

  objc_storeStrong((id *)&self->_shiftValue, 0);
}

- (MLFeatureValue)scaleValue
{
  return self->_scaleValue;
}

- (MLFeatureValue)shiftValue
{
  return self->_shiftValue;
}

- (unint64_t)predictionTypeForKTrace
{
  return 19;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v62 = a4;
  unint64_t v8 = [(MLModelEngine *)self signpostID];
  uint64_t v9 = [v62 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__MLScaler_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v8;
  aBlock[5] = v9;
  v10 = (void (**)(void))_Block_copy(aBlock);
  v11 = [(MLModelEngine *)self modelDescription];
  v12 = [v11 inputFeatureNames];
  v13 = [v12 objectAtIndexedSubscript:0];

  v14 = [(MLModelEngine *)self modelDescription];
  v15 = [v14 outputFeatureNames];
  v16 = [v15 objectAtIndexedSubscript:0];

  v17 = [v63 featureValueForName:v13];
  uint64_t v18 = [v17 type];
  if (v18 == 1)
  {
    v33 = +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", (double)[v17 int64Value]);

    if (self->_shiftValue)
    {
      [v33 doubleValue];
      double v35 = v34;
      [(MLFeatureValue *)self->_shiftValue doubleValue];
      uint64_t v37 = +[MLFeatureValue featureValueWithDouble:v35 + v36];

      v17 = (void *)v37;
    }
    else
    {
      v17 = v33;
    }
    if (!self->_scaleValue) {
      goto LABEL_38;
    }
    goto LABEL_21;
  }
  if (v18 == 2)
  {
    if (self->_shiftValue)
    {
      [v17 doubleValue];
      double v39 = v38;
      [(MLFeatureValue *)self->_shiftValue doubleValue];
      uint64_t v41 = +[MLFeatureValue featureValueWithDouble:v39 + v40];

      v17 = (void *)v41;
    }
    if (!self->_scaleValue) {
      goto LABEL_38;
    }
LABEL_21:
    [v17 doubleValue];
    double v44 = v43;
    [(MLFeatureValue *)self->_scaleValue doubleValue];
    uint64_t v46 = +[MLFeatureValue featureValueWithDouble:v44 * v45];
LABEL_37:

    v17 = (void *)v46;
LABEL_38:
    v59 = [MLDictionaryFeatureProvider alloc];
    v65 = v16;
    v66 = v17;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    v42 = [(MLDictionaryFeatureProvider *)v59 initWithDictionary:v24 error:a5];
    goto LABEL_39;
  }
  if (v18 != 5)
  {
    v42 = 0;
    goto LABEL_40;
  }
  v19 = [v17 multiArrayValue];
  uint64_t v20 = [v19 count];

  v21 = [MLMultiArray alloc];
  v22 = [NSNumber numberWithUnsignedLong:v20];
  v67[0] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
  v24 = [(MLMultiArray *)v21 initWithShape:v23 dataType:65600 error:a5];

  v25 = [v17 multiArrayValue];
  LOBYTE(v23) = [v25 copyIntoMultiArray:v24 error:a5];

  if (v23)
  {
    v61 = v24;
    v26 = [(MLMultiArray *)v61 mutableBytes];
    shiftValue = self->_shiftValue;
    if (shiftValue)
    {
      uint64_t v28 = [(MLFeatureValue *)shiftValue type];
      v29 = self->_shiftValue;
      if (v28 == 2)
      {
        [(MLFeatureValue *)v29 doubleValue];
        if (v20)
        {
          v31 = v26;
          uint64_t v32 = v20;
          do
          {
            double *v31 = v30 + *v31;
            ++v31;
            --v32;
          }
          while (v32);
        }
      }
      else if ([(MLFeatureValue *)v29 type] == MLFeatureTypeMultiArray)
      {
        id v47 = [(MLFeatureValue *)self->_shiftValue multiArrayValue];
        v48 = (double *)[v47 bytes];
        if (v20)
        {
          v49 = v26;
          uint64_t v50 = v20;
          do
          {
            double v51 = *v48++;
            double *v49 = v51 + *v49;
            ++v49;
            --v50;
          }
          while (v50);
        }
      }
    }
    scaleValue = self->_scaleValue;
    if (scaleValue)
    {
      uint64_t v53 = [(MLFeatureValue *)scaleValue type];
      v54 = self->_scaleValue;
      if (v53 == 2)
      {
        [(MLFeatureValue *)v54 doubleValue];
        for (; v20; --v20)
        {
          double *v26 = v55 * *v26;
          ++v26;
        }
      }
      else if ([(MLFeatureValue *)v54 type] == MLFeatureTypeMultiArray)
      {
        id v56 = [(MLFeatureValue *)self->_scaleValue multiArrayValue];
        for (i = (double *)[v56 bytes]; v20; --v20)
        {
          double v58 = *i++;
          double *v26 = v58 * *v26;
          ++v26;
        }
      }
    }
    uint64_t v46 = +[MLFeatureValue featureValueWithMultiArray:v61];

    v17 = v61;
    goto LABEL_37;
  }
  v42 = 0;
LABEL_39:

LABEL_40:
  v10[2](v10);

  return v42;
}

uint64_t __49__MLScaler_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLScaler)initWithShiftValue:(id)a3 scaleValue:(id)a4 description:(id)a5 configuration:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MLScaler;
  v13 = [(MLModelEngine *)&v16 initWithDescription:a5 configuration:a6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_shiftValue, a3);
    objc_storeStrong((id *)&v14->_scaleValue, a4);
  }

  return v14;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  v6 = (CoreML::Specification::protobuf_Scaler_2eproto *)a4;
  v7 = v6;
  if (*(_DWORD *)(*(void *)a3 + 44) == 604)
  {
    unint64_t v8 = *(uint64_t **)(*(void *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_Scaler_2eproto::InitDefaults(v6);
    unint64_t v8 = &CoreML::Specification::_Scaler_default_instance_;
  }
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  v27 = &unk_1EF0D9658;
  unint64_t v28 = 0;
  int v9 = *((_DWORD *)v8 + 4);
  if (v9)
  {
    google::protobuf::RepeatedField<double>::Reserve((unsigned int *)&v29, v9);
    memcpy((void *)(v30 + 8), (const void *)(v8[3] + 8), 8 * *((int *)v8 + 4));
    LODWORD(v29) = *((_DWORD *)v8 + 4);
  }
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  int v10 = *((_DWORD *)v8 + 10);
  if (v10)
  {
    google::protobuf::RepeatedField<double>::Reserve((unsigned int *)&v31, v10);
    memcpy((void *)(v32 + 8), (const void *)(v8[6] + 8), 8 * *((int *)v8 + 10));
    LODWORD(v31) = *((_DWORD *)v8 + 10);
  }
  int v33 = 0;
  uint64_t v11 = v8[1];
  if (v11) {
    google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v28, v11 & 0xFFFFFFFFFFFFFFFELL);
  }
  if (v29)
  {
    if (v29 == 1)
    {
      id v12 = +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", *(double *)(v30 + 8), v27, v28);
    }
    else
    {
      uint64_t v13 = (int)v29;
      v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", (int)v29, v27, v28);
      uint64_t v15 = 0;
      do
      {
        objc_super v16 = [NSNumber numberWithDouble:*(double *)(v30 + (v15 >> 29) + 8)];
        [v14 addObject:v16];

        v15 += 0x100000000;
        --v13;
      }
      while (v13);
      v17 = +[MLMultiArray doubleVectorWithValues:v14];
      id v12 = +[MLFeatureValue featureValueWithMultiArray:v17];
    }
  }
  else
  {
    id v12 = 0;
  }
  if (v31)
  {
    if (v31 == 1)
    {
      uint64_t v18 = +[MLFeatureValue featureValueWithDouble:*(double *)(v32 + 8)];
    }
    else
    {
      uint64_t v19 = (int)v31;
      uint64_t v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(int)v31];
      uint64_t v21 = 0;
      do
      {
        v22 = objc_msgSend(NSNumber, "numberWithDouble:", *(double *)(v32 + (v21 >> 29) + 8), v27, v28);
        [v20 addObject:v22];

        v21 += 0x100000000;
        --v19;
      }
      while (v19);
      uint64_t v23 = +[MLMultiArray doubleVectorWithValues:v20];
      uint64_t v18 = +[MLFeatureValue featureValueWithMultiArray:v23];
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v24 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
  v25 = [[MLScaler alloc] initWithShiftValue:v12 scaleValue:v18 description:v24 configuration:v7];

  CoreML::Specification::Scaler::~Scaler((CoreML::Specification::Scaler *)&v27);

  return v25;
}

@end