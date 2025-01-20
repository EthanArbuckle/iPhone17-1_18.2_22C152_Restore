@interface ARCoachingDotsRenderer
- (id)init:(id)a3 pixelFormat:(unint64_t)a4 metalLibrary:(id)a5 sampleCount:(int)a6;
- (void)encode:(__n128)a3 renderCommandEncoder:(__n128)a4 mvp:(__n128)a5 visibility:(float)a6 renderParams:(double)a7 time:(uint64_t)a8;
@end

@implementation ARCoachingDotsRenderer

- (id)init:(id)a3 pixelFormat:(unint64_t)a4 metalLibrary:(id)a5 sampleCount:(int)a6
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  v71.receiver = self;
  v71.super_class = (Class)ARCoachingDotsRenderer;
  v12 = [(ARCoachingDotsRenderer *)&v71 init];
  v13 = v12;
  if (v12)
  {
    unint64_t v67 = a4;
    v12->_pixelFormat = a4;
    id v14 = objc_alloc_init(MEMORY[0x263F129C0]);
    id v15 = objc_alloc_init(MEMORY[0x263F128B0]);
    id v70 = 0;
    v16 = (void *)[v11 newFunctionWithName:@"DotsVertex" constantValues:v15 error:&v70];
    id v17 = v70;
    [v14 setVertexFunction:v16];

    if (v17)
    {
      v18 = _ARLogCoaching_4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        id v62 = v10;
        v20 = id v64 = v15;
        [v17 localizedDescription];
        v22 = int v21 = a6;
        v23 = [v17 localizedFailureReason];
        v24 = [v17 localizedRecoverySuggestion];
        *(_DWORD *)buf = 138544386;
        v73 = v20;
        __int16 v74 = 2048;
        v75 = v13;
        __int16 v76 = 2112;
        v77 = v22;
        __int16 v78 = 2112;
        v79 = v23;
        __int16 v80 = 2112;
        v81 = v24;
        _os_log_impl(&dword_20B202000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to load vertex function for coaching animation\n\tError: %@\n\tReason: %@\n\tSuggestion: %@", buf, 0x34u);

        a6 = v21;
        id v10 = v62;
        id v15 = v64;
      }
    }
    id v69 = 0;
    v25 = (void *)[v11 newFunctionWithName:@"DotsFragment" constantValues:v15 error:&v69];
    id v26 = v69;
    [v14 setFragmentFunction:v25];

    if (v26)
    {
      v27 = _ARLogCoaching_4();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        id v63 = v10;
        v29 = id v65 = v15;
        v30 = [v26 localizedDescription];
        v31 = [v26 localizedFailureReason];
        [v26 localizedRecoverySuggestion];
        v33 = int v32 = a6;
        *(_DWORD *)buf = 138544386;
        v73 = v29;
        __int16 v74 = 2048;
        v75 = v13;
        __int16 v76 = 2112;
        v77 = v30;
        __int16 v78 = 2112;
        v79 = v31;
        __int16 v80 = 2112;
        v81 = v33;
        _os_log_impl(&dword_20B202000, v27, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to load fragment function for coaching animation\n\tError: %@\n\tReason: %@\n\tSuggestion: %@", buf, 0x34u);

        a6 = v32;
        id v10 = v63;
        id v15 = v65;
      }
    }
    v34 = [v14 colorAttachments];
    v35 = [v34 objectAtIndexedSubscript:0];
    [v35 setBlendingEnabled:1];

    v36 = [v14 colorAttachments];
    v37 = [v36 objectAtIndexedSubscript:0];
    [v37 setRgbBlendOperation:0];

    v38 = [v14 colorAttachments];
    v39 = [v38 objectAtIndexedSubscript:0];
    [v39 setAlphaBlendOperation:0];

    v40 = [v14 colorAttachments];
    v41 = [v40 objectAtIndexedSubscript:0];
    [v41 setSourceRGBBlendFactor:4];

    v42 = [v14 colorAttachments];
    v43 = [v42 objectAtIndexedSubscript:0];
    [v43 setDestinationRGBBlendFactor:5];

    v44 = [v14 colorAttachments];
    v45 = [v44 objectAtIndexedSubscript:0];
    [v45 setSourceAlphaBlendFactor:4];

    v46 = [v14 colorAttachments];
    v47 = [v46 objectAtIndexedSubscript:0];
    [v47 setDestinationAlphaBlendFactor:5];

    v48 = [v14 colorAttachments];
    v49 = [v48 objectAtIndexedSubscript:0];
    [v49 setPixelFormat:v67];

    [v14 setRasterSampleCount:a6];
    uint64_t v50 = [v14 vertexFunction];
    if (v50)
    {
      v51 = (void *)v50;
      v52 = [v14 fragmentFunction];

      if (v52)
      {

        id v68 = 0;
        uint64_t v53 = [v10 newRenderPipelineStateWithDescriptor:v14 error:&v68];
        id v26 = v68;
        pipelineState = v13->_pipelineState;
        v13->_pipelineState = (MTLRenderPipelineState *)v53;

        if (v26)
        {
          v55 = _ARLogCoaching_4();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            v56 = (objc_class *)objc_opt_class();
            NSStringFromClass(v56);
            v57 = id v66 = v15;
            v58 = [v26 localizedDescription];
            v59 = [v26 localizedFailureReason];
            v60 = [v26 localizedRecoverySuggestion];
            *(_DWORD *)buf = 138544386;
            v73 = v57;
            __int16 v74 = 2048;
            v75 = v13;
            __int16 v76 = 2112;
            v77 = v58;
            __int16 v78 = 2112;
            v79 = v59;
            __int16 v80 = 2112;
            v81 = v60;
            _os_log_impl(&dword_20B202000, v55, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create pipeline state for coaching animation\n\tError: %@\n\tReason: %@\n\tSuggestion: %@", buf, 0x34u);

            id v15 = v66;
          }
        }
      }
    }
  }
  return v13;
}

- (void)encode:(__n128)a3 renderCommandEncoder:(__n128)a4 mvp:(__n128)a5 visibility:(float)a6 renderParams:(double)a7 time:(uint64_t)a8
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v15 = *(void *)(a1 + 16);
  id v16 = a10;
  id v17 = a9;
  [v16 setRenderPipelineState:v15];
  v35[0] = a2;
  v35[1] = a3;
  v35[2] = a4;
  v35[3] = a5;
  v18 = (void *)[v17 newBufferWithBytes:v35 length:64 options:0];
  [v16 setVertexBuffer:v18 offset:0 atIndex:0];
  v36[4] = xmmword_20B232300;
  v36[5] = unk_20B232310;
  v36[6] = xmmword_20B232320;
  v36[7] = unk_20B232330;
  v36[0] = xmmword_20B2322C0;
  v36[1] = *(_OWORD *)algn_20B2322D0;
  v36[2] = xmmword_20B2322E0;
  v36[3] = unk_20B2322F0;
  v19 = (void *)[v17 newBufferWithBytes:v36 length:128 options:0];
  [v16 setVertexBuffer:v19 offset:0 atIndex:1];
  float v20 = a11[5] + a7;
  float v21 = cosf(v20);
  *(float *)&uint64_t v22 = a11[2];
  float v23 = (1.0 - (float)(a11[3] * v21)) * 0.5;
  *((float *)&v22 + 1) = v23;
  uint64_t v34 = 0;
  uint64_t v30 = *(void *)a11;
  int v31 = 1048576000;
  float v24 = fmax(a6, 0.0);
  float v32 = v24;
  uint64_t v33 = v22;
  *(float *)&uint64_t v34 = a11[4];
  v25 = (void *)[v17 newBufferWithBytes:&v30 length:32 options:0];

  [v16 setFragmentBuffer:v25 offset:0 atIndex:0];
  [v16 drawPrimitives:4 vertexStart:0 vertexCount:4];
}

- (void).cxx_destruct
{
}

@end