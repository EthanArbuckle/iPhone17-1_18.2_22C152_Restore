@interface CIMetalWrapper
- (CIMetalWrapper)init;
- (NSMutableDictionary)_dict;
- (NSString)inputFilterName;
- (id)attributes;
- (id)dummyImagesForImages:(id)a3;
- (id)inputKeys;
- (id)outputImage;
- (void)dealloc;
- (void)outputImage;
- (void)setInputFilterName:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)set_dict:(id)a3;
@end

@implementation CIMetalWrapper

- (CIMetalWrapper)init
{
  v4.receiver = self;
  v4.super_class = (Class)CIMetalWrapper;
  v2 = [(CIMetalWrapper *)&v4 init];
  if (v2) {
    v2->_dict = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  return v2;
}

- (void)dealloc
{
  dict = self->_dict;
  if (dict) {

  }
  v4.receiver = self;
  v4.super_class = (Class)CIMetalWrapper;
  [(CIFilter *)&v4 dealloc];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (a3 && a4)
  {
    if ([a4 isEqualToString:@"inputFilterName"])
    {
      self->inputFilterName = (NSString *)a3;
    }
    else
    {
      dict = self->_dict;
      [(NSMutableDictionary *)dict setValue:a3 forKey:a4];
    }
  }
}

- (id)inputKeys
{
  if (!self->inputFilterName) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:");

  return [(CIFilter *)v2 inputKeys];
}

- (id)attributes
{
  if (!self->inputFilterName) {
    return (id)MEMORY[0x1E4F1CC08];
  }
  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:");

  return [(CIFilter *)v2 attributes];
}

- (id)dummyImagesForImages:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    v5 = +[CIColor whiteColor];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v32;
      CGFloat v9 = *MEMORY[0x1E4F1DB10];
      CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(a3);
          }
          v14 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
          v15 = +[CIImage imageWithColor:v5];
          [v14 extent];
          v41.origin.x = v9;
          v41.origin.y = v10;
          v41.size.width = v11;
          v41.size.height = v12;
          if (!CGRectEqualToRect(v38, v41))
          {
            [v14 extent];
            v15 = -[CIImage imageByCroppingToRect:](v15, "imageByCroppingToRect:");
          }
          uint64_t v16 = [v14 properties];
          [v14 extent];
          v42.origin.x = v9;
          v42.origin.y = v10;
          v42.size.width = v11;
          v42.size.height = v12;
          if (!CGRectEqualToRect(v39, v42))
          {
            [(CIImage *)v15 extent];
            CGFloat v18 = v17;
            CGFloat v20 = v19;
            CGFloat v22 = v21;
            CGFloat v24 = v23;
            [v14 extent];
            v43.origin.x = v25;
            v43.origin.y = v26;
            v43.size.width = v27;
            v43.size.height = v28;
            v40.origin.x = v18;
            v40.origin.y = v20;
            v40.size.width = v22;
            v40.size.height = v24;
            if (!CGRectEqualToRect(v40, v43))
            {
              [v14 extent];
              v15 = -[CIImage imageByCroppingToRect:](v15, "imageByCroppingToRect:");
            }
          }
          if (v16) {
            v15 = [(CIImage *)v15 imageBySettingPropertiesNoCopy:v16];
          }
          if ([v14 colorSpace])
          {
            if (CGColorSpaceGetModel((CGColorSpaceRef)[v14 colorSpace]) == kCGColorSpaceModelRGB) {
              v15 = -[CIImage imageByTaggingWithColorSpace:](v15, "imageByTaggingWithColorSpace:", [v14 colorSpace]);
            }
          }
          [v4 addObject:v15];
          ++v13;
        }
        while (v7 != v13);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v7);
    }
    return v4;
  }
  else
  {
    v30 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v30 array];
  }
}

- (id)outputImage
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  p_inputFilterName = (uint64_t *)&self->inputFilterName;
  inputFilterName = self->inputFilterName;
  if (inputFilterName)
  {
    v5 = +[CIFilter filterWithName:inputFilterName withInputParameters:self->_dict];
    if (v5)
    {
      uint64_t v6 = [(CIFilter *)v5 outputImage];
      if (v6)
      {
        long long v34 = (void *)v6;
        v35 = p_inputFilterName;
        uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
        uint64_t v36 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v8 = (void *)[(NSMutableDictionary *)self->_dict allKeys];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v49 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v43 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              uint64_t v14 = [(NSMutableDictionary *)self->_dict objectForKeyedSubscript:v13];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v7 addObject:v14];
                [v36 addObject:v13];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v49 count:16];
          }
          while (v10);
        }
        long long v33 = v7;
        v15 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v16 = (void *)[(NSMutableDictionary *)self->_dict allKeys];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v39 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v38 + 1) + 8 * j);
              uint64_t v22 = [(NSMutableDictionary *)self->_dict objectForKeyedSubscript:v21];
              if (v22)
              {
                uint64_t v23 = v22;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  [v15 setObject:v23 forKeyedSubscript:v21];
                }
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
          }
          while (v18);
        }
        uint64_t v24 = *v35;
        v46[0] = @"filterName";
        v46[1] = @"filterParameters";
        v47[0] = v24;
        v47[1] = v15;
        v46[2] = @"inputImages";
        id v25 = [(CIMetalWrapper *)self dummyImagesForImages:v33];
        v46[3] = @"inputImageKeys";
        v47[2] = v25;
        v47[3] = v36;
        uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:4];
        uint64_t v37 = 0;
        CGFloat v27 = v34;
        [v34 extent];
        CGFloat v28 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIMetalProcessor, "applyWithExtent:inputs:arguments:error:", v33, v26, &v37);
        if (!v28)
        {
          long long v32 = ci_logger_api();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            [(CIMetalWrapper *)v35 outputImage];
          }
          return v27;
        }
        return +[CIImage imageForRenderingWithMetal:v34 orNonMetal:v28];
      }
      else
      {
        long long v31 = ci_logger_api();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          [(CIMetalWrapper *)p_inputFilterName outputImage];
        }
        return +[CIImage emptyImage];
      }
    }
  }

  return +[CIImage emptyImage];
}

- (NSMutableDictionary)_dict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)set_dict:(id)a3
{
}

- (NSString)inputFilterName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputFilterName:(id)a3
{
}

- (void)outputImage
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "Unable to create Metal wrapper image for filter %{public}@; will not render on OpenGL/OpenCL based CIContexts.",
    (uint8_t *)&v3,
    0xCu);
}

@end