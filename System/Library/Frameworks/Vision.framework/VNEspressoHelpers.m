@interface VNEspressoHelpers
+ (BOOL)createSingleNetworkPlanFromModelPath:(id)a3 forComputeDevice:(id)a4 lowPriorityMode:(BOOL)a5 priority:(int)a6 inputBlobNames:(id)a7 outputBlobNames:(id)a8 networkConfiguration:(id)a9 explicitNetworkLayersStorageType:(int)a10 memoryPoolId:(unint64_t)a11 espressoResources:(id *)a12 error:(id *)a13;
+ (BOOL)createSingleNetworkPlanFromModelPath:(id)a3 forComputeDevice:(id)a4 lowPriorityMode:(BOOL)a5 priority:(int)a6 inputBlobNames:(id)a7 outputBlobNames:(id)a8 networkConfiguration:(id)a9 memoryPoolId:(unint64_t)a10 espressoResources:(id *)a11 error:(id *)a12;
+ (BOOL)feedForwardEspressoBufferForNetwork:(id *)a3 fromBufferWithName:(id)a4 toBufferWithName:(id)a5 firstFrame:(BOOL)a6 error:(id *)a7;
+ (BOOL)getWidth:(unint64_t *)a3 height:(unint64_t *)a4 ofBlobNamed:(id)a5 forNetworkModelFileWithPath:(id)a6 error:(id *)a7;
+ (BOOL)renderEspressoBufferImage:(id *)a3 intoCVPixelBuffer:(__CVBuffer *)a4 error:(id *)a5;
+ (__CVBuffer)createCVPixelBufferWithPixelFormat:(unsigned int)a3 fromImageInEspressoBuffer:(id *)a4 error:(id *)a5;
+ (id)JSONDataFromNetworkFilePath:(id)a3 error:(id *)a4;
+ (id)_alternatePathForEspressoResource:(id)a3 ofType:(id)a4 error:(id *)a5;
+ (id)_locateFrameworkBundleForResourceWithName:(id)a3 resourceDirectory:(id *)a4 error:(id *)a5;
+ (id)pathForEspressoNetworkModelFileWithName:(id)a3 error:(id *)a4;
+ (id)pathForEspressoResource:(id)a3 ofType:(id)a4 error:(id *)a5;
+ (id)pathForEspressoResourceWithFilename:(id)a3 error:(id *)a4;
+ (id)weightsFilePathForEspressoNetworkModelFilePath:(id)a3 error:(id *)a4;
+ (int)espressoDeviceIDForComputeDevice:(id)a3;
+ (int)espressoEngineForComputeDevice:(id)a3;
+ (int)espressoStorageTypeForComputeDevice:(id)a3;
+ (unint64_t)pixelValueSizeInBytesForBuffer:(id *)a3 error:(id *)a4;
@end

@implementation VNEspressoHelpers

+ (id)pathForEspressoNetworkModelFileWithName:(id)a3 error:(id *)a4
{
  v4 = [a1 pathForEspressoResource:a3 ofType:@"net" error:a4];

  return v4;
}

+ (id)pathForEspressoResource:(id)a3 ofType:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[VNEspressoHelpers _alternatePathForEspressoResource:v8 ofType:v9 error:a5];
  v11 = (void *)v10;
  if (v10)
  {
    NSLog(&cfstr_UsingAlternate.isa, v10);
    id v12 = v11;
  }
  else
  {
    id v21 = 0;
    v13 = [a1 _locateFrameworkBundleForResourceWithName:v8 resourceDirectory:&v21 error:a5];
    id v14 = v21;
    if (v13)
    {
      v15 = [v13 pathForResource:v8 ofType:v9 inDirectory:v14];
      id v12 = v15;
      if (v15)
      {
        id v16 = v15;
      }
      else if (a5)
      {
        v17 = NSString;
        v18 = [v13 resourcePath];
        v19 = [v17 stringWithFormat:@"Unable to locate resource \"%@\" of type \"%@\" in %@", v8, v9, v18];

        *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v19];
      }
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

+ (id)_alternatePathForEspressoResource:(id)a3 ofType:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28F80] processInfo];
  id v9 = [v8 environment];

  uint64_t v10 = [v9 objectForKeyedSubscript:@"VN_ALTERNATE_MODEL_RESOURCE_PATH"];
  if ([v10 length])
  {
    v11 = [v6 stringByAppendingPathExtension:v7];
    id v12 = [v10 stringByAppendingPathComponent:v11];
    v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v14 = [v13 isReadableFileAtPath:v12];

    if ((v14 & 1) == 0)
    {

      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)_locateFrameworkBundleForResourceWithName:(id)a3 resourceDirectory:(id *)a4 error:(id *)a5
{
  id v7 = a3;
  +[VNError VNAssert:a4 != 0 log:@"resourceDirectory must point to a valid reference"];
  if (![v7 hasPrefix:@"model_opt.espresso"])
  {
    char v14 = VNFrameworkBundle();
    *a4 = &stru_1EF75C0C0;
    id v13 = v14;
    goto LABEL_13;
  }
  id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if (!v8)
  {
    if (!a5)
    {
      id v13 = 0;
      goto LABEL_12;
    }
    v11 = (void *)[[NSString alloc] initWithFormat:@"Unable to locate %@", v7];
    v15 = +[VNError errorForInternalErrorWithLocalizedDescription:v11];
LABEL_10:
    id v13 = 0;
    *a5 = v15;
    goto LABEL_11;
  }
  id v9 = [NSString alloc];
  uint64_t v10 = [v8 bundlePath];
  v11 = (void *)[v9 initWithFormat:@"%@/%@", v10, @"Frameworks/LoopKitGeneratedKernels.framework/"];

  id v12 = [MEMORY[0x1E4F28B50] bundleWithPath:v11];
  if (!v12)
  {
    if (!a5)
    {
      id v13 = 0;
      goto LABEL_11;
    }
    v15 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Unable to locate resource bundle"];
    goto LABEL_10;
  }
  *a4 = @"anod_v3_d3";
  id v13 = v12;
LABEL_11:

LABEL_12:
LABEL_13:

  return v13;
}

+ (id)weightsFilePathForEspressoNetworkModelFilePath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [a1 JSONDataFromNetworkFilePath:v6 error:a4];
  if (v7)
  {
    id v8 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"storage" inOptions:v7 error:a4];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 lastPathComponent];
      int v11 = [v10 isEqualToString:v9];

      if (v11)
      {
        id v12 = [v6 stringByDeletingLastPathComponent];
        uint64_t v13 = [v12 stringByAppendingPathComponent:v9];

        id v9 = (void *)v13;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)JSONDataFromNetworkFilePath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5 options:3 error:a4];
  if (!v6)
  {
    a4 = 0;
    goto LABEL_27;
  }
  id v7 = v6;
  if ((unint64_t)[v7 length] < 0x1C) {
    goto LABEL_17;
  }
  id v8 = v7;
  uint64_t v9 = [v8 bytes];
  if (*(unsigned char *)v9 != 112 || *(unsigned char *)(v9 + 1) != 98 || *(unsigned char *)(v9 + 2) != 122) {
    goto LABEL_17;
  }
  id v10 = 0;
  int v11 = *(char *)(v9 + 3);
  if (v11 > 119)
  {
    if (v11 == 122)
    {
      compression_algorithm v12 = COMPRESSION_ZLIB;
    }
    else
    {
      if (v11 != 120) {
        goto LABEL_18;
      }
      compression_algorithm v12 = COMPRESSION_LZMA;
    }
  }
  else
  {
    if (v11 != 52)
    {
      if (v11 == 101)
      {
        compression_algorithm v12 = COMPRESSION_LZFSE;
        goto LABEL_16;
      }
LABEL_18:
      id v13 = v7;
LABEL_19:

      id v14 = v10;
      goto LABEL_20;
    }
    compression_algorithm v12 = COMPRESSION_LZ4;
  }
LABEL_16:
  if (bswap64(*(void *)(v9 + 12)) > 0x80000000)
  {
LABEL_17:
    id v10 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  id v18 = objc_claimAutoreleasedReturnValue();
  v19 = (uint8_t *)[v18 mutableBytes];
  size_t v20 = [v18 length];
  id v13 = v8;
  size_t v21 = compression_decode_buffer(v19, v20, (const uint8_t *)([v13 bytes] + 28), objc_msgSend(v13, "length") - 28, 0, v12);
  if (v21 == [v18 length]) {
    id v14 = v18;
  }
  else {
    id v14 = 0;
  }

  if (v14)
  {
    id v10 = v14;
    id v7 = v13;
    id v13 = v10;
    goto LABEL_19;
  }
LABEL_20:
  v15 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v13 options:0 error:a4];
  if (!v15) {
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4) {
      goto LABEL_26;
    }
    id v16 = (void *)[[NSString alloc] initWithFormat:@"Could not interpret network %@", v5];
    *a4 = +[VNError errorForDataUnavailableWithLocalizedDescription:v16];

LABEL_25:
    a4 = 0;
    goto LABEL_26;
  }
  a4 = v15;
LABEL_26:

LABEL_27:

  return a4;
}

+ (BOOL)createSingleNetworkPlanFromModelPath:(id)a3 forComputeDevice:(id)a4 lowPriorityMode:(BOOL)a5 priority:(int)a6 inputBlobNames:(id)a7 outputBlobNames:(id)a8 networkConfiguration:(id)a9 memoryPoolId:(unint64_t)a10 espressoResources:(id *)a11 error:(id *)a12
{
  uint64_t v14 = *(void *)&a6;
  BOOL v15 = a5;
  id v18 = a3;
  id v19 = a4;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  LODWORD(v24) = [a1 espressoStorageTypeForComputeDevice:v19];
  LOBYTE(v14) = [a1 createSingleNetworkPlanFromModelPath:v18 forComputeDevice:v19 lowPriorityMode:v15 priority:v14 inputBlobNames:v20 outputBlobNames:v21 networkConfiguration:v22 explicitNetworkLayersStorageType:v24 memoryPoolId:a10 espressoResources:a11 error:a12];

  return v14;
}

+ (int)espressoStorageTypeForComputeDevice:(id)a3
{
  unint64_t v3 = +[VNComputeDeviceUtilities typeOfComputeDevice:a3];
  if (v3 - 1 > 3) {
    return 0;
  }
  else {
    return dword_1A410C4E0[v3 - 1];
  }
}

+ (BOOL)createSingleNetworkPlanFromModelPath:(id)a3 forComputeDevice:(id)a4 lowPriorityMode:(BOOL)a5 priority:(int)a6 inputBlobNames:(id)a7 outputBlobNames:(id)a8 networkConfiguration:(id)a9 explicitNetworkLayersStorageType:(int)a10 memoryPoolId:(unint64_t)a11 espressoResources:(id *)a12 error:(id *)a13
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v51 = a4;
  id v49 = a7;
  id v48 = a8;
  id v50 = a9;
  if (!v17 || !a12)
  {
    if (a13)
    {
      id v19 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Invalid inputs specified to inference plan builder"];
LABEL_9:
      BOOL v20 = 0;
      *a13 = v19;
      goto LABEL_19;
    }
LABEL_18:
    BOOL v20 = 0;
    goto LABEL_19;
  }
  [a1 espressoEngineForComputeDevice:v51];
  [a1 espressoDeviceIDForComputeDevice:v51];
  uint64_t context = espresso_create_context();
  if (!context)
  {
    if (a13)
    {
      id v19 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Could not create inference context"];
      goto LABEL_9;
    }
    goto LABEL_18;
  }
  uint64_t plan = espresso_create_plan();
  uint64_t v22 = plan;
  if (!plan)
  {
    if (a13)
    {
      *a13 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Could not create inference plan"];
    }
    espresso_context_destroy();
    goto LABEL_18;
  }
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  id v23 = v17;
  [v23 UTF8String];
  if (espresso_plan_add_network())
  {
    if (a13)
    {
      *a13 = +[VNError errorForFailedEspressoPlan:v22 localizedDescription:@"Could not create/add network to inference plan"];
    }
LABEL_14:
    espresso_plan_destroy();
    espresso_context_destroy();
    goto LABEL_18;
  }
  if (v50)
  {
    id v25 = v50;
    [v25 UTF8String];
    uint64_t v26 = espresso_network_select_configuration();
    if (v26)
    {
      if (a13)
      {
        v27 = (void *)[[NSString alloc] initWithFormat:@"Could not set network configuration: %@", v25];
        *a13 = +[VNError errorForEspressoReturnStatus:v26 localizedDescription:v27];
      }
      goto LABEL_14;
    }
  }
  if (a11)
  {
    uint64_t v28 = espresso_network_set_memory_pool_id();
    if (v28)
    {
      if (a13)
      {
        v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"Could not select memory pool %llu", a11);
        *a13 = +[VNError errorForEspressoReturnStatus:v28 localizedDescription:v29];
      }
      goto LABEL_18;
    }
  }
  if (!espresso_plan_get_phase())
  {
    uint64_t v43 = espresso_plan_set_priority();
    if (v43)
    {
      if (!a13) {
        goto LABEL_18;
      }
      id v19 = +[VNError errorForEspressoReturnStatus:v43 localizedDescription:@"unable to set client specified plan priority"];
      goto LABEL_9;
    }
  }
  v47 = -[VNEspressoResources initWithModelPath:networkConfigurationName:network:plan:context:]([VNEspressoResources alloc], "initWithModelPath:networkConfigurationName:network:plan:context:", v23, v50, v60, v61, v22, context);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v49;
  uint64_t v30 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v57;
    while (2)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v57 != v31) {
          objc_enumerationMutation(obj);
        }
        v33 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        [(VNEspressoResources *)v47 network];
        id v34 = v33;
        [v34 UTF8String];
        uint64_t v35 = espresso_network_declare_input();
        if (v35)
        {
          if (a13)
          {
            v42 = (void *)[[NSString alloc] initWithFormat:@"Could not declare network input buffer: %@", v34];
            *a13 = +[VNError errorForEspressoReturnStatus:v35 localizedDescription:v42];
          }
          goto LABEL_57;
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obja = v48;
  uint64_t v36 = [obja countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v53;
    while (2)
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v53 != v37) {
          objc_enumerationMutation(obja);
        }
        v39 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        [(VNEspressoResources *)v47 network];
        id v40 = v39;
        [v40 UTF8String];
        uint64_t v41 = espresso_network_declare_output();
        if (v41)
        {
          if (a13)
          {
            v44 = (void *)[[NSString alloc] initWithFormat:@"Could not declare network output buffer: %@", v40];
            *a13 = +[VNError errorForEspressoReturnStatus:v41 localizedDescription:v44];
          }
          goto LABEL_57;
        }
      }
      uint64_t v36 = [obja countByEnumeratingWithState:&v52 objects:v62 count:16];
      if (v36) {
        continue;
      }
      break;
    }
  }

  [(VNEspressoResources *)v47 plan];
  if (espresso_plan_build())
  {
    if (a13)
    {
      +[VNError errorForFailedEspressoPlan:[(VNEspressoResources *)v47 plan] localizedDescription:@"Could not build inference plan"];
      BOOL v20 = 0;
      *a13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_57:
      BOOL v20 = 0;
    }
  }
  else
  {
    *a12 = v47;
    BOOL v20 = 1;
  }

LABEL_19:
  return v20;
}

+ (int)espressoEngineForComputeDevice:(id)a3
{
  unint64_t v3 = +[VNComputeDeviceUtilities typeOfComputeDevice:a3];
  if (v3 == 2) {
    int v4 = 5;
  }
  else {
    int v4 = 0;
  }
  if (v3 == 4) {
    return 10007;
  }
  else {
    return v4;
  }
}

+ (int)espressoDeviceIDForComputeDevice:(id)a3
{
  unint64_t v3 = +[VNComputeDeviceUtilities metalDeviceForComputeDevice:a3];
  if (v3) {
    int v4 = espresso_device_id_for_metal_device();
  }
  else {
    int v4 = -1;
  }

  return v4;
}

+ (BOOL)feedForwardEspressoBufferForNetwork:(id *)a3 fromBufferWithName:(id)a4 toBufferWithName:(id)a5 firstFrame:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  if (!a3)
  {
    if (a7)
    {
      BOOL v15 = +[VNError errorWithCode:9 message:@"inference network cannot be nil"];
      goto LABEL_19;
    }
LABEL_20:
    BOOL v19 = 0;
    goto LABEL_21;
  }
  [v12 UTF8String];
  uint64_t v14 = espresso_network_bind_buffer();
  if (v14)
  {
    if (a7)
    {
      BOOL v15 = +[VNError errorForEspressoReturnStatus:v14 localizedDescription:@"Could not bind output buffer to network"];
LABEL_19:
      BOOL v19 = 0;
      *a7 = v15;
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  [v13 UTF8String];
  uint64_t v16 = espresso_network_bind_buffer();
  if (v16)
  {
    if (a7)
    {
      BOOL v15 = +[VNError errorForEspressoReturnStatus:v16 localizedDescription:@"Could not bind input buffer to network"];
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (v27 != v22 || v28 != v23 || v29 != v24 || v30 != v25)
  {
    if (a7)
    {
      BOOL v15 = +[VNError errorWithCode:9 message:@"Could not feed-forward buffer data because of compatibility of source and destination buffers"];
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  uint64_t v17 = [a1 pixelValueSizeInBytesForBuffer:&__src error:a7];
  if (!v17) {
    goto LABEL_20;
  }
  uint64_t v18 = v27 * v17 * v28 * v29;
  if (v8) {
    bzero(__dst, v18 * v30);
  }
  else {
    memcpy(__dst, __src, v18 * v30);
  }
  BOOL v19 = 1;
LABEL_21:

  return v19;
}

+ (unint64_t)pixelValueSizeInBytesForBuffer:(id *)a3 error:(id *)a4
{
  if (!a3) {
    goto LABEL_9;
  }
  int var14 = a3->var14;
  unint64_t result = 4;
  if (var14 > 131103)
  {
    if (var14 == 131104) {
      return result;
    }
    int v7 = 262152;
  }
  else
  {
    if (var14 == 65568) {
      return result;
    }
    int v7 = 131080;
  }
  if (var14 == v7) {
    return 1;
  }
LABEL_9:
  if (!a4) {
    return 0;
  }
  id v8 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Unknown inference buffer type"];
  unint64_t result = 0;
  *a4 = v8;
  return result;
}

+ (BOOL)renderEspressoBufferImage:(id *)a3 intoCVPixelBuffer:(__CVBuffer *)a4 error:(id *)a5
{
  if (a3->var14 == 65568)
  {
    if (a5)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported espresso storaget type %u", a4, 65568);
      *a5 = +[VNError errorForUnimplementedFunctionWithLocalizedDescription:v6];
    }
    return 0;
  }
  else
  {
    unint64_t var4 = a3->var4;
    var0 = (int *)a3->var0;
    unint64_t var5 = a3->var5;
    return +[VNCVPixelBufferHelper renderRawDataBufferWithWidth:height:pixelFormatType:rowBytes:dataBytes:intoCVPixelBuffer:error:]((uint64_t)VNCVPixelBufferHelper, var4, var5, 1278226534, var0, a4, a5);
  }
}

+ (__CVBuffer)createCVPixelBufferWithPixelFormat:(unsigned int)a3 fromImageInEspressoBuffer:(id *)a4 error:(id *)a5
{
  if (a3 != 1278226534 || a4->var14 != 65568)
  {
    if (a5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unsupported pixel format %lu; espresso storaget type %u",
        a3,
      id v8 = a4->var14);
      *a5 = +[VNError errorForUnimplementedFunctionWithLocalizedDescription:v8];
    }
    return 0;
  }
  int v7 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a4->var4, a4->var5, 1278226534, a5);
  if (v7
    && (+[VNCVPixelBufferHelper renderRawDataBufferWithWidth:height:pixelFormatType:rowBytes:dataBytes:intoCVPixelBuffer:error:]((uint64_t)VNCVPixelBufferHelper, a4->var4, a4->var5, 1278226534, (int *)a4->var0, v7, a5) & 1) == 0)
  {
    CVPixelBufferRelease(v7);
    return 0;
  }
  return v7;
}

+ (BOOL)getWidth:(unint64_t *)a3 height:(unint64_t *)a4 ofBlobNamed:(id)a5 forNetworkModelFileWithPath:(id)a6 error:(id *)a7
{
  v48[19] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = v11;
  uint64_t v14 = (char *)[v13 UTF8String];
  id v15 = v12;
  std::string::basic_string[abi:ne180100]<0>(&v45, (char *)[v15 UTF8String]);
  std::string::size_type size = HIBYTE(v45.__r_.__value_.__r.__words[2]);
  char v17 = HIBYTE(v45.__r_.__value_.__r.__words[2]);
  uint64_t v18 = (std::string *)v45.__r_.__value_.__r.__words[0];
  if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v45.__r_.__value_.__l.__size_;
  }
  else {
    uint64_t v18 = &v45;
  }
  long long v19 = 0uLL;
  if (size)
  {
    BOOL v20 = (std::string *)((char *)v18 + size);
    id v21 = v18;
    uint64_t v22 = v20;
    do
    {
      if (v21->__r_.__value_.__s.__data_[0] == 46)
      {
        uint64_t v23 = 1u;
        while (v23 != 13)
        {
          if ((std::string *)((char *)v21 + v23) == v20) {
            goto LABEL_15;
          }
          int v24 = v21->__r_.__value_.__s.__data_[v23];
          int v25 = aEspressoNet[v23++];
          if (v24 != v25) {
            goto LABEL_7;
          }
        }
        uint64_t v22 = v21;
      }
LABEL_7:
      id v21 = (std::string *)((char *)v21 + 1);
    }
    while (v21 != v20);
LABEL_15:
    char v26 = 0;
    uint64_t v27 = 4294967290;
    if (v22 != v20)
    {
      int64_t v28 = (char *)v22 - (char *)v18;
      if (v28 != -1)
      {
        std::string::replace(&v45, v28 + 10, 0xFFFFFFFFFFFFFFFFLL, "shape", 5uLL);
        std::ifstream::basic_ifstream(v46);
        std::string::basic_string[abi:ne180100]<0>(__p, "json");
        Espresso::load_network_shape();
        if (v40 < 0) {
          operator delete(__p[0]);
        }
        std::string::basic_string[abi:ne180100]<0>(__p, v14);
        uint64_t v29 = (char **)std::__tree<std::__value_type<std::string,std::vector<float>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<float>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<float>>>>::find<std::string>((uint64_t)v41, __p);
        if (&v42 == v29
          && (uint64_t v29 = (char **)std::__tree<std::__value_type<std::string,std::vector<float>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<float>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<float>>>>::find<std::string>((uint64_t)&v43, __p), &v44 == v29))
        {
          long long v32 = 0uLL;
        }
        else
        {
          uint64_t v30 = v29[7];
          *(void *)&long long v31 = (int)v30;
          *((void *)&v31 + 1) = SHIDWORD(v30);
          long long v32 = v31;
        }
        long long v37 = v32;
        if (v40 < 0) {
          operator delete(__p[0]);
        }
        std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(v44);
        std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(v42);
        v46[0] = *MEMORY[0x1E4FBA3F8];
        *(uint64_t *)((char *)v46 + *(void *)(v46[0] - 24)) = *(void *)(MEMORY[0x1E4FBA3F8] + 24);
        MEMORY[0x1A6256010](&v47);
        std::istream::~istream();
        MEMORY[0x1A6256200](v48);
        uint64_t v27 = 0;
        char v26 = 1;
        char v17 = HIBYTE(v45.__r_.__value_.__r.__words[2]);
        long long v19 = v37;
      }
    }
    if ((v17 & 0x80) == 0)
    {
LABEL_26:
      if ((v26 & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_31;
    }
  }
  else
  {
    char v26 = 0;
    uint64_t v27 = 4294967290;
    if ((*((unsigned char *)&v45.__r_.__value_.__s + 23) & 0x80) == 0) {
      goto LABEL_26;
    }
  }
  long long v38 = v19;
  operator delete(v45.__r_.__value_.__l.__data_);
  long long v19 = v38;
  if ((v26 & 1) == 0)
  {
LABEL_27:
    if (a7)
    {
      v33 = (void *)[[NSString alloc] initWithFormat:@"unable to introspect %@", v15];
      *a7 = +[VNError errorForEspressoReturnStatus:v27 localizedDescription:v33];
    }
LABEL_40:
    BOOL v34 = 0;
    goto LABEL_41;
  }
LABEL_31:
  if (!(void)v19 || !*((void *)&v19 + 1))
  {
    if (a7)
    {
      uint64_t v35 = (void *)[[NSString alloc] initWithFormat:@"blob \"%@\" was not found in %@", v13, v15];
      *a7 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v35];
    }
    goto LABEL_40;
  }
  if (a3) {
    *a3 = v19;
  }
  if (a4) {
    *a4 = *((void *)&v19 + 1);
  }
  BOOL v34 = 1;
LABEL_41:

  return v34;
}

+ (id)pathForEspressoResourceWithFilename:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [v6 stringByDeletingPathExtension];
  id v8 = [v6 pathExtension];
  uint64_t v9 = [a1 pathForEspressoResource:v7 ofType:v8 error:a4];

  return v9;
}

@end