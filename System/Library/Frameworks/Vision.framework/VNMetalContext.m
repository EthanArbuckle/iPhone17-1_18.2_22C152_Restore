@interface VNMetalContext
+ (void)metalContextForDevice:(void *)a3 error:;
- (BOOL)upsampleTextures:(void *)a3 referenceTexture:(void *)a4 constraintsTextures:(void *)a5 upsampledTextures:(void *)a6 filter:(int)a7 waitForCompletion:(void *)a8 error:;
- (id)bindIOSurfaceToMTL2DTexture:(uint64_t)a1 pixelFormat:(uint64_t)a2 width:(uint64_t)a3 height:(uint64_t)a4 plane:(uint64_t)a5 error:(void *)a6;
- (id)bindPixelBufferToMTL2DTexture:(uint64_t)a3 pixelFormat:(void *)a4 textureSize:(double)a5 plane:(double)a6 error:;
- (id)bindPixelBufferToMTL2DTexture:(void *)a1 pixelFormat:(CVPixelBufferRef)pixelBuffer plane:(uint64_t)a3 error:(void *)a4;
- (id)bindPixelBufferToMTL2DTexture:(void *)a3 error:;
- (id)bindPixelBuffersToTextures:(void *)a3 error:;
- (id)computePipelineStateForFunctionWithName:(uint64_t)a3 error:;
- (os_unfair_lock_s)commandQueueReturnError:(os_unfair_lock_s *)a1;
- (os_unfair_lock_s)libraryReturnError:(os_unfair_lock_s *)a1;
- (void)createGuidedFilterForTextures:(void *)a3 referenceTexture:(void *)a4 error:;
- (void)encodeCommandsForBuffer:(void *)a3 state:(uint64_t)a4 label:(uint64_t)a5 width:(void *)a6 height:(void *)a7 textures:buffers:block:;
@end

@implementation VNMetalContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wisdomParams, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

+ (void)metalContextForDevice:(void *)a3 error:
{
  id v4 = a2;
  v5 = (objc_class *)self;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = MTLCreateSystemDefaultDevice();
    if (!v6)
    {
      if (a3)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot create MTLDevice"];
        v16 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_13;
    }
  }
  v7 = +[VNFrameworkManager manager];
  v8 = [v7 wisdomParameterForMTLDevice:v6 error:0];

  id v9 = [v5 alloc];
  id v10 = v6;
  id v11 = v8;
  if (v9
    && (v18.receiver = v9,
        v18.super_class = (Class)VNMetalContext,
        id v12 = objc_msgSendSuper2(&v18, sel_init),
        (v13 = v12) != 0))
  {
    *((_DWORD *)v12 + 4) = 0;
    objc_storeStrong((id *)v12 + 1, v6);
    uint64_t v14 = [v11 copy];
    v15 = (void *)v13[5];
    v13[5] = v14;

    v16 = v13;
  }
  else
  {

    if (a3)
    {
      +[VNError errorForMemoryAllocationFailure];
      v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }

LABEL_13:

  return v16;
}

- (os_unfair_lock_s)commandQueueReturnError:(os_unfair_lock_s *)a1
{
  v2 = a1;
  if (a1)
  {
    id v4 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v5 = *(void **)&v2[6]._os_unfair_lock_opaque;
    if (!v5)
    {
      uint64_t v6 = [*(id *)&v2[2]._os_unfair_lock_opaque newCommandQueue];
      v7 = *(void **)&v2[6]._os_unfair_lock_opaque;
      *(void *)&v2[6]._os_unfair_lock_opaque = v6;

      v8 = *(void **)&v2[6]._os_unfair_lock_opaque;
      if (!v8)
      {
        if (a2)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:@"Failed to create MTLCommandQueue"];
          v2 = 0;
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v2 = 0;
        }
        goto LABEL_6;
      }
      [v8 setBackgroundGPUPriority:2];
      v5 = *(void **)&v2[6]._os_unfair_lock_opaque;
    }
    v2 = v5;
LABEL_6:
    os_unfair_lock_unlock(v4);
  }

  return v2;
}

- (os_unfair_lock_s)libraryReturnError:(os_unfair_lock_s *)a1
{
  v2 = a1;
  if (a1)
  {
    id v4 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v5 = *(void **)&v2[8]._os_unfair_lock_opaque;
    if (!v5)
    {
      uint64_t v6 = *(void **)&v2[2]._os_unfair_lock_opaque;
      v7 = VNFrameworkBundle();
      uint64_t v8 = [v6 newDefaultLibraryWithBundle:v7 error:a2];
      id v9 = *(void **)&v2[8]._os_unfair_lock_opaque;
      *(void *)&v2[8]._os_unfair_lock_opaque = v8;

      v5 = *(void **)&v2[8]._os_unfair_lock_opaque;
    }
    v2 = v5;
    os_unfair_lock_unlock(v4);
  }

  return v2;
}

- (id)bindPixelBufferToMTL2DTexture:(void *)a3 error:
{
  if (a1)
  {
    uint64_t v6 = a1;
    signed int PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
    self;
    if (PixelFormatType > 1278226533)
    {
      if (PixelFormatType == 1278226536)
      {
        uint64_t v8 = 25;
        goto LABEL_11;
      }
      if (PixelFormatType == 1278226534)
      {
        uint64_t v8 = 55;
        goto LABEL_11;
      }
    }
    else
    {
      if (PixelFormatType == 1111970369)
      {
        uint64_t v8 = 80;
        goto LABEL_11;
      }
      if (PixelFormatType == 1278226488)
      {
        uint64_t v8 = 10;
LABEL_11:
        a1 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v6, pixelBuffer, v8, a3);
LABEL_12:
        uint64_t v3 = vars8;
        goto LABEL_13;
      }
    }
    if (a3)
    {
      id v10 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Unimplemented conversion"];
      a1 = 0;
      *a3 = v10;
    }
    else
    {
      a1 = 0;
    }
    goto LABEL_12;
  }
LABEL_13:
  return a1;
}

- (id)bindPixelBufferToMTL2DTexture:(void *)a1 pixelFormat:(CVPixelBufferRef)pixelBuffer plane:(uint64_t)a3 error:(void *)a4
{
  if (a1)
  {
    uint64_t v7 = (uint64_t)a1;
    IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
    if (IOSurface)
    {
      id v9 = IOSurface;
      size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(IOSurface, 0);
      size_t HeightOfPlane = IOSurfaceGetHeightOfPlane(v9, 0);
      a1 = -[VNMetalContext bindIOSurfaceToMTL2DTexture:pixelFormat:width:height:plane:error:](v7, (uint64_t)v9, a3, WidthOfPlane, HeightOfPlane, a4);
    }
    else if (a4)
    {
      id v12 = +[VNError errorForInternalErrorWithLocalizedDescription:@"pixel buffer does not have an IOSurface"];
      a1 = 0;
      *a4 = v12;
    }
    else
    {
      a1 = 0;
    }
    uint64_t v4 = vars8;
  }
  return a1;
}

- (id)bindIOSurfaceToMTL2DTexture:(uint64_t)a1 pixelFormat:(uint64_t)a2 width:(uint64_t)a3 height:(uint64_t)a4 plane:(uint64_t)a5 error:(void *)a6
{
  id v9 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a3 width:a4 height:a5 mipmapped:0];
  id v10 = v9;
  if (v9)
  {
    [v9 setUsage:23];
    id v11 = (void *)[*(id *)(a1 + 8) newTextureWithDescriptor:v10 iosurface:a2 plane:0];
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else if (a6)
    {
      *a6 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Failed to create MTLTexture"];
    }
  }
  else if (a6)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"Failed to create MTLTextureDescriptor"];
    id v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)bindPixelBufferToMTL2DTexture:(uint64_t)a3 pixelFormat:(void *)a4 textureSize:(double)a5 plane:(double)a6 error:
{
  if (a1)
  {
    uint64_t v11 = (uint64_t)a1;
    IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
    if (IOSurface)
    {
      id v13 = IOSurface;
      if (IOSurfaceGetWidthOfPlane(IOSurface, 0) >= (unint64_t)a5)
      {
        if (IOSurfaceGetHeightOfPlane(v13, 0) >= (unint64_t)a6)
        {
          a1 = -[VNMetalContext bindIOSurfaceToMTL2DTexture:pixelFormat:width:height:plane:error:](v11, (uint64_t)v13, a3, (unint64_t)a5, (unint64_t)a6, a4);
          goto LABEL_14;
        }
        if (a4)
        {
          uint64_t v14 = @"IOsurface height is smaller than texture height";
          goto LABEL_11;
        }
      }
      else if (a4)
      {
        uint64_t v14 = @"IOsurface width is smaller than texture width";
LABEL_11:
        id v15 = +[VNError errorForInternalErrorWithLocalizedDescription:v14];
        a1 = 0;
        *a4 = v15;
LABEL_14:
        uint64_t v6 = vars8;
        goto LABEL_15;
      }
    }
    else if (a4)
    {
      uint64_t v14 = @"Pixel buffer does not have an IOSurface";
      goto LABEL_11;
    }
    a1 = 0;
    goto LABEL_14;
  }
LABEL_15:
  return a1;
}

- (id)bindPixelBuffersToTextures:(void *)a3 error:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = -[VNMetalContext bindPixelBufferToMTL2DTexture:error:](a1, *(CVPixelBufferRef *)(*((void *)&v14 + 1) + 8 * i), a3);
          if (!v11)
          {

            id v12 = 0;
            goto LABEL_12;
          }
          objc_msgSend(v6, "addObject:", v11, (void)v14);
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v12 = (void *)[v6 copy];
LABEL_12:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)computePipelineStateForFunctionWithName:(uint64_t)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = -[VNMetalContext libraryReturnError:]((os_unfair_lock_s *)a1, a3);
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = (void *)[v6 newFunctionWithName:v5];
      uint64_t v9 = (void *)[*(id *)(a1 + 8) newComputePipelineStateWithFunction:v8 error:a3];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)encodeCommandsForBuffer:(void *)a3 state:(uint64_t)a4 label:(uint64_t)a5 width:(void *)a6 height:(void *)a7 textures:buffers:block:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a6;
  long long v16 = a7;
  if (a1)
  {
    long long v17 = [v13 computeCommandEncoder];
    [v17 setComputePipelineState:v14];
    if (v15)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __90__VNMetalContext_encodeCommandsForBuffer_state_label_width_height_textures_buffers_block___block_invoke;
      v25[3] = &unk_1E5B1D700;
      id v26 = v17;
      [v15 enumerateObjectsUsingBlock:v25];
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __90__VNMetalContext_encodeCommandsForBuffer_state_label_width_height_textures_buffers_block___block_invoke_2;
    v23[3] = &unk_1E5B1D728;
    id v18 = v17;
    id v24 = v18;
    [0 enumerateObjectsUsingBlock:v23];
    if (v16) {
      v16[2](v16, v18);
    }
    unint64_t v19 = [v14 threadExecutionWidth];
    unint64_t v20 = [v14 maxTotalThreadsPerThreadgroup];
    v22[0] = (a4 + v19 - 1) / v19;
    v22[1] = (a5 + v20 / v19 - 1) / (v20 / v19);
    v22[2] = 1;
    v21[0] = v19;
    v21[1] = v20 / v19;
    v21[2] = 1;
    [v18 dispatchThreadgroups:v22 threadsPerThreadgroup:v21];
    [v18 endEncoding];
  }
}

uint64_t __90__VNMetalContext_encodeCommandsForBuffer_state_label_width_height_textures_buffers_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setTexture:a2 atIndex:a3];
}

uint64_t __90__VNMetalContext_encodeCommandsForBuffer_state_label_width_height_textures_buffers_block___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setBuffer:a2 offset:0 atIndex:a3];
}

- (void)createGuidedFilterForTextures:(void *)a3 referenceTexture:(void *)a4 error:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v27 = a3;
  if (!a1) {
    goto LABEL_30;
  }
  if ([v6 count])
  {
    id v7 = [v6 objectAtIndexedSubscript:0];
    uint64_t v8 = [v7 pixelFormat];

    uint64_t v9 = [v6 objectAtIndexedSubscript:0];
    uint64_t v10 = [v9 width];

    uint64_t v11 = [v6 objectAtIndexedSubscript:0];
    uint64_t v12 = [v11 height];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (!v14) {
      goto LABEL_13;
    }
    uint64_t v15 = *(void *)v30;
LABEL_5:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v30 != v15) {
        objc_enumerationMutation(v13);
      }
      long long v17 = *(void **)(*((void *)&v29 + 1) + 8 * v16);
      if (v10 != [v17 width] || v12 != objc_msgSend(v17, "height")) {
        break;
      }
      if (v8 != [v17 pixelFormat])
      {
        if (a4)
        {
          unint64_t v20 = @"Texture pixel formats do not match";
LABEL_23:
          *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v20];
        }
        goto LABEL_24;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v14) {
          goto LABEL_5;
        }
LABEL_13:

        uint64_t v18 = [v27 pixelFormat];
        if (v18 > 69)
        {
          if (v18 != 80 && v18 != 70) {
            goto LABEL_33;
          }
          uint64_t v19 = 3;
        }
        else
        {
          uint64_t v19 = 1;
          if (v18 != 10 && v18 != 55)
          {
LABEL_33:
            if (a4)
            {
              id v26 = (void *)[[NSString alloc] initWithFormat:@"Unimplemented format for guided upsampling"];
              *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v26];
            }
LABEL_25:
            a1 = 0;
            goto LABEL_30;
          }
        }
        v21 = (void *)MEMORY[0x1E4F355D8];
        uint64_t v22 = [v13 count];
        LODWORD(v23) = 953267991;
        id v24 = [v21 filterDescriptorWithWidth:v10 height:v12 arrayLength:1 kernelSpatialDiameter:3 kernelTemporalDiameter:1 epsilon:v22 sourceChannels:v23 guideChannels:v19];
        a1 = (void *)[objc_alloc(MEMORY[0x1E4F355D0]) initWithDevice:a1[1] filterDescriptor:v24];

        goto LABEL_30;
      }
    }
    if (a4)
    {
      unint64_t v20 = @"Texture sizes do not match";
      goto LABEL_23;
    }
LABEL_24:

    goto LABEL_25;
  }
  if (!a4) {
    goto LABEL_25;
  }
  +[VNError errorForInternalErrorWithLocalizedDescription:@"Texture array cannot be empty"];
  a1 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return a1;
}

- (BOOL)upsampleTextures:(void *)a3 referenceTexture:(void *)a4 constraintsTextures:(void *)a5 upsampledTextures:(void *)a6 filter:(int)a7 waitForCompletion:(void *)a8 error:
{
  id v14 = a2;
  id v32 = a3;
  id v31 = a4;
  id v33 = a5;
  id v30 = a6;
  if (!a1) {
    goto LABEL_23;
  }
  unint64_t v15 = [v14 count];
  if (!v15)
  {
    if (!a8) {
      goto LABEL_22;
    }
    id v27 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Invalid texture count of 0"];
LABEL_21:
    a1 = 0;
    *a8 = v27;
    goto LABEL_23;
  }
  if (v15 != [v33 count])
  {
    if (!a8) {
      goto LABEL_22;
    }
    id v27 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Texture count mismatch between input and output textures"];
    goto LABEL_21;
  }
  uint64_t v16 = [v14 objectAtIndexedSubscript:0];
  uint64_t v17 = [v16 width];

  uint64_t v18 = [v14 objectAtIndexedSubscript:0];
  uint64_t v19 = [v18 height];

  if (v15 >= 2)
  {
    uint64_t v20 = 1;
    while (1)
    {
      v21 = [v14 objectAtIndexedSubscript:v20];
      if ([v21 width] != v17) {
        break;
      }
      uint64_t v22 = [v14 objectAtIndexedSubscript:v20];
      uint64_t v23 = [v22 height];

      if (v23 != v19) {
        goto LABEL_19;
      }
      if (v15 == ++v20) {
        goto LABEL_9;
      }
    }

LABEL_19:
    if (a8)
    {
      id v27 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Texture size mismatch"];
      goto LABEL_21;
    }
LABEL_22:
    a1 = 0;
    goto LABEL_23;
  }
LABEL_9:
  id v24 = -[VNMetalContext commandQueueReturnError:]((os_unfair_lock_s *)a1, a8);
  v25 = v24;
  a1 = v24 != 0;
  if (v24)
  {
    id v26 = [v24 commandBuffer];
    [v30 encodeToCommandBuffer:v26 sourceTextureArray:v14 guidanceTexture:v32 constraintsTextureArray:v31 numberOfIterations:20 destinationTextureArray:v33];
    [v26 commit];
    if (a7) {
      [v26 waitUntilCompleted];
    }
  }
LABEL_23:

  return a1;
}

@end