@interface VNDetectionprintGenerator
+ (id)_inferenceNetworkDescriptorForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4;
+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3;
+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3;
+ (void)fullyPopulateConfigurationOptions:(id)a3;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNDetectionprintGenerator

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  v3 = [a1 _inferenceNetworkDescriptorForConfigurationOptions:a3 error:0];
  v4 = [v3 onlyInputImage];
  unsigned int v5 = [v4 pixelFormatType];

  return v5;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  v3 = [a1 _inferenceNetworkDescriptorForConfigurationOptions:a3 error:0];
  v4 = [v3 onlyInputImage];
  unsigned int v5 = [v4 name];

  return v5;
}

+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[VNValidationUtilities computeDeviceForKey:@"VNDetectorInternalOption_ModelComputeDevice" inOptions:v6 error:a4];
  if (v7)
  {
    v8 = [a1 _inferenceNetworkDescriptorForConfigurationOptions:v6 error:a4];
    v9 = v8;
    if (v8)
    {
      v10 = [v8 modelPathForComputeDevice:v7 error:a4];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)fullyPopulateConfigurationOptions:(id)a3
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___VNDetectionprintGenerator;
  objc_msgSendSuper2(&v8, sel_fullyPopulateConfigurationOptions_, v4);
  unsigned int v5 = [a1 _inferenceNetworkDescriptorForConfigurationOptions:v4 error:0];
  id v6 = [v5 allInputNames];
  [v4 setObject:v6 forKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_InputBlobNames"];

  v7 = [v5 allOutputNames];
  [v4 setObject:v7 forKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_OutputBlobNames"];
}

+ (id)_inferenceNetworkDescriptorForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v5 error:a4];
  if (!v6) {
    goto LABEL_7;
  }
  if ([v6 specifiesRequestClass:objc_opt_class()]
    && [v6 requestRevision] == 1)
  {
    v7 = +[VNDetectionprintInferenceNetworkDescriptor sceneNetV3BasedNetworkAndReturnError:a4];
    goto LABEL_8;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRequestSpecifier:v6];
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    v7 = 0;
  }
LABEL_8:

  return v7;
}

- (void).cxx_destruct
{
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v54 = a7;
  id v55 = a9;
  v53 = v13;
  v14 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v13 error:a8];
  if (v14)
  {
    v52 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
    [v52 network];
    v51 = [(VNDetectionprintInferenceNetworkDescriptor *)self->_inferenceNetworkDescriptor onlyInputImage];
    id v15 = [v51 name];
    [v15 UTF8String];
    uint64_t v16 = espresso_network_bind_input_cvpixelbuffer();

    if (v16)
    {
      if (a8)
      {
        +[VNError errorForEspressoReturnStatus:v16 localizedDescription:@"Could not bind input image buffer"];
        v17 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      [(VNDetectionprintInferenceNetworkDescriptor *)self->_inferenceNetworkDescriptor tensorKeyToPrintOutputName];
      memset(v78, 0, sizeof(v78));
      int v79 = 1065353216;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      v50 = long long v77 = 0u;
      v18 = [v50 allValues];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v74 objects:v82 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v75;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v75 != v20) {
              objc_enumerationMutation(v18);
            }
            v22 = *(void **)(*((void *)&v74 + 1) + 8 * i);
            uint64_t v73 = 0;
            long long v71 = 0u;
            long long v72 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            id v23 = v22;
            [v23 UTF8String];
            uint64_t v24 = espresso_network_bind_buffer();
            if (v24)
            {
              if (a8)
              {
                v35 = (void *)[[NSString alloc] initWithFormat:@"Could not bind output \"%@\"", v23];
                *a8 = +[VNError errorForEspressoReturnStatus:v24 localizedDescription:v35];
              }
              goto LABEL_21;
            }
            id v62 = v23;
            v25 = std::__hash_table<std::__hash_value_type<void *,espresso_buffer_t>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,espresso_buffer_t>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,espresso_buffer_t>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,espresso_buffer_t>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void *&&>,std::tuple<>>((float *)v78, (unint64_t)v23, &v62);
            uint64_t v26 = v73;
            long long v28 = v71;
            long long v27 = v72;
            long long v29 = v69;
            *(_OWORD *)(v25 + 136) = v70;
            *(_OWORD *)(v25 + 152) = v28;
            *(_OWORD *)(v25 + 168) = v27;
            long long v31 = v67;
            long long v30 = v68;
            long long v32 = v65;
            *(_OWORD *)(v25 + 72) = v66;
            *((void *)v25 + 23) = v26;
            *(_OWORD *)(v25 + 88) = v31;
            *(_OWORD *)(v25 + 104) = v30;
            *(_OWORD *)(v25 + 120) = v29;
            long long v33 = v64;
            *(_OWORD *)(v25 + 24) = v63;
            *(_OWORD *)(v25 + 40) = v33;
            *(_OWORD *)(v25 + 56) = v32;
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v74 objects:v82 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      [v52 plan];
      uint64_t v34 = espresso_plan_execute_sync();
      if (v34)
      {
        if (a8)
        {
          +[VNError errorForEspressoReturnStatus:v34 localizedDescription:@"Could not run network"];
          v17 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_21:
          v17 = 0;
        }
      }
      else
      {
        id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        v38 = v50;
        uint64_t v39 = [(VNDetectionprint *)v38 countByEnumeratingWithState:&v58 objects:v81 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v59;
          while (2)
          {
            for (uint64_t j = 0; j != v39; ++j)
            {
              if (*(void *)v59 != v40) {
                objc_enumerationMutation(v38);
              }
              uint64_t v42 = *(void *)(*((void *)&v58 + 1) + 8 * j);
              v43 = [(VNDetectionprint *)v38 objectForKeyedSubscript:v42];
              *(void *)&long long v63 = v43;
              v44 = std::__hash_table<std::__hash_value_type<void *,espresso_buffer_t>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,espresso_buffer_t>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,espresso_buffer_t>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,espresso_buffer_t>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void *&&>,std::tuple<>>((float *)v78, (unint64_t)v43, &v63);
              long long v45 = *(_OWORD *)(v44 + 152);
              v56[7] = *(_OWORD *)(v44 + 136);
              v56[8] = v45;
              v56[9] = *(_OWORD *)(v44 + 168);
              uint64_t v57 = *((void *)v44 + 23);
              long long v46 = *(_OWORD *)(v44 + 88);
              v56[3] = *(_OWORD *)(v44 + 72);
              v56[4] = v46;
              long long v47 = *(_OWORD *)(v44 + 120);
              v56[5] = *(_OWORD *)(v44 + 104);
              v56[6] = v47;
              long long v48 = *(_OWORD *)(v44 + 40);
              v56[0] = *(_OWORD *)(v44 + 24);
              v56[1] = v48;
              v56[2] = *(_OWORD *)(v44 + 56);
              v49 = +[VNDetectionprintTensor tensorFromEspressoBuffer:v56 originatingRequestSpecifier:v14 error:a8];
              if (!v49)
              {
                v17 = 0;
                goto LABEL_37;
              }
              [v37 setObject:v49 forKeyedSubscript:v42];
            }
            uint64_t v39 = [(VNDetectionprint *)v38 countByEnumeratingWithState:&v58 objects:v81 count:16];
            if (v39) {
              continue;
            }
            break;
          }
        }

        v38 = [[VNDetectionprint alloc] initWithTensorsDictionary:v37 originatingRequestSpecifier:v14];
        v43 = [[VNDetectionprintObservation alloc] initWithOriginatingRequestSpecifier:v14 detectionprint:v38];
        v80 = v43;
        v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
LABEL_37:
      }
      std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v78);
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a6;
  uint64_t v19 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a8];
  uint64_t v20 = v19;
  if (v19)
  {
    unint64_t v21 = [v19 width];
    unint64_t v22 = [v20 height];
    id v23 = [(VNDetectionprintInferenceNetworkDescriptor *)self->_inferenceNetworkDescriptor onlyInputImage];
    unint64_t v24 = [v23 pixelWidth];
    unint64_t v25 = [v23 pixelHeight];
    unint64_t v26 = v25;
    double v27 = width * (double)v21;
    double v28 = height * (double)v22;
    if (v27 >= v28) {
      double v29 = v28;
    }
    else {
      double v29 = v27;
    }
    if (v24 >= v25) {
      uint64_t v30 = v25;
    }
    else {
      uint64_t v30 = v24;
    }
    if (v29 < (double)(unint64_t)v30) {
      VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, v30);
    }
    [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
    long long v31 = (__CVBuffer *)objc_msgSend(v20, "croppedBufferWithWidth:height:format:cropRect:options:error:", v24, v26, objc_msgSend(v23, "pixelFormatType"), v17, a8, x * (double)v21, y * (double)v22, v27, v28);
    *a7 = v31;
    BOOL v32 = v31 != 0;
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)VNDetectionprintGenerator;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v11, sel_completeInitializationForSession_error_, a3))return 0; {
  id v6 = [(VNDetector *)self configurationOptions];
  }
  v7 = [(id)objc_opt_class() _inferenceNetworkDescriptorForConfigurationOptions:v6 error:a4];
  inferenceNetworkDescriptor = self->_inferenceNetworkDescriptor;
  self->_inferenceNetworkDescriptor = v7;

  BOOL v9 = self->_inferenceNetworkDescriptor != 0;
  return v9;
}

@end