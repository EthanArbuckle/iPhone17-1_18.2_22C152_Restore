@interface CICoreMLModelFilter
+ (id)customAttributes;
- (CIImage)inputImage;
- (MLModel)inputModel;
- (NSNumber)inputHeadIndex;
- (NSNumber)inputSoftmaxNormalization;
- (NSString)_logName;
- (id)outputImage;
- (void)outputImage;
- (void)setInputHeadIndex:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputModel:(id)a3;
- (void)setInputSoftmaxNormalization:(id)a3;
- (void)set_logName:(id)a3;
@end

@implementation CICoreMLModelFilter

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryStillImage";
  v7[1] = @"CICategoryBuiltIn";
  v7[2] = @"CICategoryStylize";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  v9[1] = @"12";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.14";
  v8[3] = @"inputHeadIndex";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeMax";
  v6[0] = &unk_1EE4AA6B8;
  v6[1] = &unk_1EE4AA6D0;
  v5[2] = @"CIAttributeDefault";
  v5[3] = @"CIAttributeType";
  v6[2] = &unk_1EE4AA6B8;
  v6[3] = @"CIAttributeTypeInteger";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  v8[4] = @"inputSoftmaxNormalization";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeMax";
  v4[0] = MEMORY[0x1E4F1CC28];
  v4[1] = MEMORY[0x1E4F1CC38];
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeType";
  v4[2] = MEMORY[0x1E4F1CC28];
  v4[3] = @"CIAttributeTypeBoolean";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (id)outputImage
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v3 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v3 = [(CIImage *)self->inputImage count];
    }
    else {
      int v3 = 0;
    }
  }
  v4 = [(MLModelDescription *)[(MLModel *)self->inputModel modelDescription] inputDescriptionsByName];
  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[NSDictionary allKeys](v4, "allKeys"));
  if (v3 != [v5 count])
  {
    v17 = ci_logger_filter();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CICoreMLModelFilter outputImage].cold.7();
    }
    return 0;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        id v12 = [(NSDictionary *)[(MLModelDescription *)[(MLModel *)self->inputModel modelDescription] inputDescriptionsByName] objectForKey:v11];
        if (!v12 || (uint64_t v13 = [v12 type], (unint64_t)(v13 - 6) <= 0xFFFFFFFFFFFFFFFDLL))
        {
          v22 = ci_logger_filter();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[CICoreMLModelFilter outputImage]();
          }
          return 0;
        }
        uint64_t v14 = v13;
        unsigned int v15 = channelCountOfName(self->inputModel, v11, 0);
        if (v15 > 4 || ((1 << v15) & 0x1A) == 0)
        {
          v36 = ci_logger_filter();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            -[CICoreMLModelFilter outputImage].cold.4();
          }
          return 0;
        }
        if (v8)
        {
          if (v8 != v14)
          {
            v31 = ci_logger_filter();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              -[CICoreMLModelFilter outputImage].cold.6();
            }
            return 0;
          }
        }
        else
        {
          uint64_t v8 = v14;
        }
        if (v3 >= 2 && ![(CIImage *)self->inputImage objectForKey:v11])
        {
          v35 = ci_logger_filter();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            [(CICoreMLModelFilter *)(uint64_t)self outputImage];
          }
          return 0;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  int v18 = [(NSNumber *)self->inputHeadIndex intValue];
  v19 = [(MLModelDescription *)[(MLModel *)self->inputModel modelDescription] outputDescriptionsByName];
  if (v19 && (v20 = v19, [(NSDictionary *)v19 count] > v18)) {
    uint64_t v21 = [(NSArray *)[(NSDictionary *)v20 allKeys] objectAtIndex:v18];
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v23 = objc_msgSend(-[NSDictionary objectForKey:](-[MLModelDescription outputDescriptionsByName](-[MLModel modelDescription](self->inputModel, "modelDescription"), "outputDescriptionsByName"), "objectForKey:", v21), "type");
  unsigned int v24 = channelCountOfName(self->inputModel, v21, 1);
  if (v23 == 5) {
    goto LABEL_43;
  }
  if (v23 != 4)
  {
    v30 = ci_logger_filter();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[CICoreMLModelFilter outputImage]();
    }
    return 0;
  }
  if (v24 > 4 || ((1 << v24) & 0x1A) == 0)
  {
    v37 = ci_logger_filter();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[CICoreMLModelFilter outputImage]();
    }
    return 0;
  }
  if (v3 == 1 && v8 == 4)
  {
    v25 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    uint64_t v26 = [v5 anyObject];
    inputImage = self->inputImage;
    uint64_t v45 = v26;
    v46 = inputImage;
    v28 = process((void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1], self->inputModel, v21, (__CFString *)self->_logName, 0, (uint64_t)v25);
    CGColorSpaceRelease(v25);
    return v28;
  }
LABEL_43:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = self->inputImage;
  }
  else
  {
    uint64_t v33 = [v5 anyObject];
    v34 = self->inputImage;
    uint64_t v43 = v33;
    v44 = v34;
    v29 = (CIImage *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  }
  return process(v29, self->inputModel, v21, (__CFString *)self->_logName, [(NSNumber *)self->inputSoftmaxNormalization BOOLValue], 0);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (MLModel)inputModel
{
  return self->inputModel;
}

- (void)setInputModel:(id)a3
{
}

- (NSNumber)inputHeadIndex
{
  return self->inputHeadIndex;
}

- (void)setInputHeadIndex:(id)a3
{
}

- (NSNumber)inputSoftmaxNormalization
{
  return self->inputSoftmaxNormalization;
}

- (void)setInputSoftmaxNormalization:(id)a3
{
}

- (NSString)_logName
{
  return self->_logName;
}

- (void)set_logName:(id)a3
{
}

- (void)outputImage
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193671000, v0, v1, "%{public}@: Number of input CIImages does not match the inputModel input count.", v2, v3, v4, v5, v6);
}

@end