@interface MOVStreamMetalPixelBufferUtility
+ (id)sharedMetalPixelBufferUtility;
- (BOOL)enabled;
- (BOOL)joinCompandedWarholBuffer:(__CVBuffer *)a3 intoCompandedBayerBuffer:(__CVBuffer *)a4;
- (BOOL)joinWarholBuffer:(__CVBuffer *)a3 intoBayerBuffer:(__CVBuffer *)a4 shiftBitsRightBy:(int)a5 msbReplication:(BOOL)a6;
- (BOOL)joinYUVBuffer:(__CVBuffer *)a3 intoRawBayerPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5 msbReplication:(BOOL)a6;
- (BOOL)processBayerBuffer:(__CVBuffer *)a3 withWarholBuffer:(__CVBuffer *)a4 shiftCount:(int)a5 msbReplication:(BOOL)a6 operation:(int)a7 sampleSize:(int)a8;
- (BOOL)splitBayerBuffer:(__CVBuffer *)a3 intoWarholPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5;
- (BOOL)splitBayerBuffer:(__CVBuffer *)a3 intoYUVPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5;
- (BOOL)splitCompandedBayerBuffer:(__CVBuffer *)a3 intoCompandedWarholPixelBuffer:(__CVBuffer *)a4;
- (MOVStreamMetalPixelBufferUtility)init;
- (void)setEnabled:(BOOL)a3;
@end

@implementation MOVStreamMetalPixelBufferUtility

+ (id)sharedMetalPixelBufferUtility
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__MOVStreamMetalPixelBufferUtility_sharedMetalPixelBufferUtility__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMetalPixelBufferUtility_onceToken != -1) {
    dispatch_once(&sharedMetalPixelBufferUtility_onceToken, block);
  }
  v2 = (void *)sharedMetalPixelBufferUtility_sharedMetalPixelBufferUtility;

  return v2;
}

uint64_t __65__MOVStreamMetalPixelBufferUtility_sharedMetalPixelBufferUtility__block_invoke(uint64_t a1)
{
  sharedMetalPixelBufferUtility_sharedMetalPixelBufferUtility = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (BOOL)splitBayerBuffer:(__CVBuffer *)a3 intoWarholPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5
{
  return self->_enabled
      && [(MOVStreamMetalPixelBufferUtility *)self processBayerBuffer:a3 withWarholBuffer:a4 shiftCount:*(void *)&a5 msbReplication:0 operation:0 sampleSize:2];
}

- (BOOL)joinWarholBuffer:(__CVBuffer *)a3 intoBayerBuffer:(__CVBuffer *)a4 shiftBitsRightBy:(int)a5 msbReplication:(BOOL)a6
{
  return self->_enabled
      && [(MOVStreamMetalPixelBufferUtility *)self processBayerBuffer:a4 withWarholBuffer:a3 shiftCount:*(void *)&a5 msbReplication:a6 operation:1 sampleSize:2];
}

- (BOOL)splitCompandedBayerBuffer:(__CVBuffer *)a3 intoCompandedWarholPixelBuffer:(__CVBuffer *)a4
{
  return self->_enabled
      && [(MOVStreamMetalPixelBufferUtility *)self processBayerBuffer:a3 withWarholBuffer:a4 shiftCount:0 msbReplication:0 operation:2 sampleSize:1];
}

- (BOOL)joinCompandedWarholBuffer:(__CVBuffer *)a3 intoCompandedBayerBuffer:(__CVBuffer *)a4
{
  return self->_enabled
      && [(MOVStreamMetalPixelBufferUtility *)self processBayerBuffer:a4 withWarholBuffer:a3 shiftCount:0 msbReplication:0 operation:3 sampleSize:1];
}

- (BOOL)splitBayerBuffer:(__CVBuffer *)a3 intoYUVPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5
{
  return 0;
}

- (BOOL)joinYUVBuffer:(__CVBuffer *)a3 intoRawBayerPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5 msbReplication:(BOOL)a6
{
  return 0;
}

- (MOVStreamMetalPixelBufferUtility)init
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v54.receiver = self;
  v54.super_class = (Class)MOVStreamMetalPixelBufferUtility;
  v2 = [(MOVStreamMetalPixelBufferUtility *)&v54 init];
  if (!v2) {
    goto LABEL_69;
  }
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  metalDevice = v2->_metalDevice;
  v2->_metalDevice = v3;

  if (!v2->_metalDevice)
  {
    if (+[MIOLog debugEnabled])
    {
      v33 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v33, OS_LOG_TYPE_DEBUG, "Failed to create Metal Device.", buf, 2u);
      }
    }
    goto LABEL_68;
  }
  v5 = (void *)MEMORY[0x263F086E0];
  v6 = self;
  v7 = [v5 bundleForClass:v6];

  v8 = v2->_metalDevice;
  id v53 = 0;
  v9 = (void *)[(MTLDevice *)v8 newDefaultLibraryWithBundle:v7 error:&v53];
  id v10 = v53;
  if (v9)
  {
    v11 = [v9 newFunctionWithName:@"splitBayerIntoWarhol"];
    if (v11)
    {
      v12 = v2->_metalDevice;
      id v52 = 0;
      uint64_t v13 = [(MTLDevice *)v12 newComputePipelineStateWithFunction:v11 error:&v52];
      v14 = v52;
      v15 = v2->_pipeLineStates[0];
      v2->_pipeLineStates[0] = (MTLComputePipelineState *)v13;

      if (v2->_pipeLineStates[0])
      {
        v16 = [v9 newFunctionWithName:@"joinWarholIntoBayer"];
        if (v16)
        {
          v17 = v2->_metalDevice;
          v51 = v14;
          uint64_t v18 = [(MTLDevice *)v17 newComputePipelineStateWithFunction:v16 error:&v51];
          v19 = v51;

          v20 = v2->_pipeLineStates[1];
          v2->_pipeLineStates[1] = (MTLComputePipelineState *)v18;

          if (v2->_pipeLineStates[1])
          {
            v21 = [v9 newFunctionWithName:@"splitCompandedBayerIntoWarhol"];
            if (v21)
            {
              v22 = v2->_metalDevice;
              v50 = v19;
              uint64_t v23 = [(MTLDevice *)v22 newComputePipelineStateWithFunction:v21 error:&v50];
              v14 = v50;

              v24 = v2->_pipeLineStates[2];
              v2->_pipeLineStates[2] = (MTLComputePipelineState *)v23;

              if (v2->_pipeLineStates[2])
              {
                uint64_t v25 = [v9 newFunctionWithName:@"joinCompandedWarholIntoBayer"];
                v48 = (void *)v25;
                if (v25)
                {
                  uint64_t v26 = v25;
                  v27 = v2->_metalDevice;
                  v49 = v14;
                  uint64_t v28 = [(MTLDevice *)v27 newComputePipelineStateWithFunction:v26 error:&v49];
                  v47 = v49;

                  v29 = v2->_pipeLineStates[3];
                  v2->_pipeLineStates[3] = (MTLComputePipelineState *)v28;

                  if (v2->_pipeLineStates[3])
                  {
                    uint64_t v30 = [(MTLDevice *)v2->_metalDevice newCommandQueue];
                    metalCommandQueue = v2->_metalCommandQueue;
                    v2->_metalCommandQueue = (MTLCommandQueue *)v30;

                    if (v2->_metalCommandQueue)
                    {
                      [(MOVStreamMetalPixelBufferUtility *)v2 setEnabled:1];
                      int v32 = 0;
LABEL_61:
                      v14 = v47;
                      goto LABEL_62;
                    }
                    if (+[MIOLog debugEnabled])
                    {
                      v43 = +[MIOLog defaultLog];
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_21B5ED000, v43, OS_LOG_TYPE_DEBUG, "Failed to create the command queue.", buf, 2u);
                      }
LABEL_59:
                    }
                  }
                  else if (+[MIOLog debugEnabled])
                  {
                    v43 = +[MIOLog defaultLog];
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                    {
                      v44 = [v47 localizedDescription];
                      *(_DWORD *)buf = 138543362;
                      v56 = v44;
                      _os_log_impl(&dword_21B5ED000, v43, OS_LOG_TYPE_DEBUG, "Failed to created pipeline state object, error %{public}@.", buf, 0xCu);
                    }
                    goto LABEL_59;
                  }
                  int v32 = 1;
                  goto LABEL_61;
                }
                if (+[MIOLog debugEnabled])
                {
                  v39 = +[MIOLog defaultLog];
                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                  {
LABEL_51:

                    goto LABEL_52;
                  }
                  *(_WORD *)buf = 0;
                  v40 = "Failed to find the metal joinCompandedWarholIntoBayer function.";
                  v41 = v39;
                  uint32_t v42 = 2;
LABEL_50:
                  _os_log_impl(&dword_21B5ED000, v41, OS_LOG_TYPE_DEBUG, v40, buf, v42);
                  goto LABEL_51;
                }
                goto LABEL_52;
              }
              if (+[MIOLog debugEnabled])
              {
                v38 = +[MIOLog defaultLog];
                v48 = v38;
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  v39 = [v14 localizedDescription];
                  *(_DWORD *)buf = 138543362;
                  v56 = v39;
                  v40 = "Failed to created pipeline state object, error %{public}@.";
                  v41 = v38;
                  uint32_t v42 = 12;
                  goto LABEL_50;
                }
LABEL_52:
                int v32 = 1;
LABEL_62:

                goto LABEL_63;
              }
              goto LABEL_46;
            }
            if (+[MIOLog debugEnabled])
            {
              v37 = +[MIOLog defaultLog];
              v48 = v37;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21B5ED000, v37, OS_LOG_TYPE_DEBUG, "Failed to find the metal splitCompandedBayerIntoWarhol function.", buf, 2u);
              }
              int v32 = 1;
              v14 = v19;
              goto LABEL_62;
            }
LABEL_41:
            int v32 = 1;
            v14 = v19;
LABEL_63:

            goto LABEL_64;
          }
          if (+[MIOLog debugEnabled])
          {
            v21 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v36 = [v19 localizedDescription];
              *(_DWORD *)buf = 138543362;
              v56 = v36;
              _os_log_impl(&dword_21B5ED000, v21, OS_LOG_TYPE_DEBUG, "Failed to created pipeline state object, error %{public}@.", buf, 0xCu);
            }
            goto LABEL_41;
          }
          int v32 = 1;
          v14 = v19;
LABEL_64:

          goto LABEL_65;
        }
        if (+[MIOLog debugEnabled])
        {
          v21 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21B5ED000, v21, OS_LOG_TYPE_DEBUG, "Failed to find the metal joinWarholIntoBayer function.", buf, 2u);
          }
LABEL_46:
          int v32 = 1;
          goto LABEL_63;
        }
LABEL_33:
        int v32 = 1;
        goto LABEL_64;
      }
      if (+[MIOLog debugEnabled])
      {
        v16 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v35 = [v14 localizedDescription];
          *(_DWORD *)buf = 138543362;
          v56 = v35;
          _os_log_impl(&dword_21B5ED000, v16, OS_LOG_TYPE_DEBUG, "Failed to created pipeline state object, error %{public}@.", buf, 0xCu);
        }
        goto LABEL_33;
      }
LABEL_29:
      int v32 = 1;
LABEL_65:

      goto LABEL_66;
    }
    if (+[MIOLog debugEnabled])
    {
      v14 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v14, OS_LOG_TYPE_DEBUG, "Failed to find the metal splitBayerIntoWarhol function.", buf, 2u);
      }
      goto LABEL_29;
    }
  }
  else
  {
    if (!+[MIOLog debugEnabled])
    {
      int v32 = 1;
      goto LABEL_67;
    }
    v11 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v34 = [v10 localizedDescription];
      *(_DWORD *)buf = 138543362;
      v56 = v34;
      _os_log_impl(&dword_21B5ED000, v11, OS_LOG_TYPE_DEBUG, "Failed to find the default library. error: %{public}@", buf, 0xCu);
    }
  }
  int v32 = 1;
LABEL_66:

LABEL_67:
  if (!v32)
  {
LABEL_69:
    v45 = v2;
    goto LABEL_70;
  }
LABEL_68:
  v45 = 0;
LABEL_70:

  return v45;
}

- (BOOL)processBayerBuffer:(__CVBuffer *)a3 withWarholBuffer:(__CVBuffer *)a4 shiftCount:(int)a5 msbReplication:(BOOL)a6 operation:(int)a7 sampleSize:(int)a8
{
  BOOL v10 = a6;
  uint64_t v58 = *MEMORY[0x263EF8340];
  if (CVPixelBufferIsPlanar(a3)) {
    unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  }
  else {
    unsigned int WidthOfPlane = CVPixelBufferGetWidth(a3);
  }
  unsigned int v16 = WidthOfPlane;
  if (CVPixelBufferIsPlanar(a3)) {
    unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  }
  else {
    unsigned int HeightOfPlane = CVPixelBufferGetHeight(a3);
  }
  unsigned int v18 = HeightOfPlane;
  int v19 = v16 & 7;
  if ((v16 & 7) != 0)
  {
    if (+[MIOLog debugEnabled])
    {
      v20 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v20, OS_LOG_TYPE_DEBUG, "Bayer Buffer width is not a multiple of 8", buf, 2u);
      }
    }
  }
  else
  {
    unint64_t v42 = __PAIR64__(a7, a8);
    BOOL unlockFlags = (a7 & 0xFFFFFFFD) == 0;
    CVPixelBufferLockBaseAddress(a3, unlockFlags);
    CVPixelBufferLockFlags v44 = (a7 & 0xFFFFFFFD) != 0;
    CVPixelBufferLockBaseAddress(a4, v44);
    PixelBufferBaseAddress = GetPixelBufferBaseAddress(a3);
    v22 = GetPixelBufferBaseAddress(a4);
    int PixelBufferRowBytes = GetPixelBufferRowBytes(a3);
    int v55 = PixelBufferRowBytes;
    v45 = a4;
    int v24 = GetPixelBufferRowBytes(a4);
    unsigned int v53 = v16 >> 3;
    int v54 = v24;
    unsigned int v52 = (v16 >> 3) * v18;
    if (v16 % (v16 >> 3)) {
      -[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:]();
    }
    int v25 = v24;
    BOOL v50 = v10;
    int v51 = a5;
    int v26 = getpagesize();
    unint64_t v27 = ((unint64_t)(v25 * v18) + v26 - 1) / v26 * v26;
    uint64_t v28 = (void *)[(MTLDevice *)self->_metalDevice newBufferWithBytesNoCopy:PixelBufferBaseAddress length:((unint64_t)(PixelBufferRowBytes * v18) + v26 - 1) / v26 * v26 options:0 deallocator:0];
    v29 = (void *)[(MTLDevice *)self->_metalDevice newBufferWithBytesNoCopy:v22 length:v27 options:0 deallocator:0];
    uint64_t v30 = [(MTLCommandQueue *)self->_metalCommandQueue commandBuffer];
    if (!v30) {
      -[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:]();
    }
    v31 = v30;
    int v32 = [v30 computeCommandEncoder];
    if (!v32) {
      -[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:]();
    }
    v33 = v32;
    uint64_t v34 = v25 * (v18 >> 1);
    v35 = &self->super.isa + HIDWORD(v42);
    [v32 setComputePipelineState:v35[3]];
    [v33 setBuffer:v28 offset:0 atIndex:0];
    [v33 setBuffer:v29 offset:0 atIndex:1];
    [v33 setBuffer:v29 offset:(v16 * v42) >> 1 atIndex:2];
    [v33 setBuffer:v29 offset:v34 atIndex:3];
    [v33 setBuffer:v29 offset:v34 + ((v16 * v42) >> 1) atIndex:4];
    [v33 setBytes:&v55 length:4 atIndex:5];
    [v33 setBytes:&v54 length:4 atIndex:6];
    [v33 setBytes:&v52 length:4 atIndex:7];
    [v33 setBytes:&v53 length:4 atIndex:8];
    [v33 setBytes:&v51 length:4 atIndex:9];
    [v33 setBytes:&v50 length:4 atIndex:10];
    unsigned int v36 = [(objc_class *)v35[3] maxTotalThreadsPerThreadgroup];
    if (v52 >= v36) {
      uint64_t v37 = v36;
    }
    else {
      uint64_t v37 = v52;
    }
    uint64_t v48 = (v52 + v37 - 1) / v37;
    int64x2_t v49 = vdupq_n_s64(1uLL);
    uint64_t v46 = v37;
    int64x2_t v47 = v49;
    objc_msgSend(v33, "dispatchThreadgroups:threadsPerThreadgroup:", &v48, &v46, v42);
    [v33 endEncoding];
    [v31 commit];
    [v31 waitUntilCompleted];
    v38 = [v31 error];

    if (v38)
    {
      v39 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = [v31 error];
        *(_DWORD *)buf = 138543362;
        uint64_t v57 = v40;
        _os_log_impl(&dword_21B5ED000, v39, OS_LOG_TYPE_ERROR, "processBayerBuffer error recevied: %{public}@", buf, 0xCu);
      }
    }
    CVPixelBufferUnlockBaseAddress(a3, unlockFlags);
    CVPixelBufferUnlockBaseAddress(v45, v44);

    int v19 = 0;
  }
  return v19 == 0;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  for (uint64_t i = 56; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);

  objc_storeStrong((id *)&self->_metalDevice, 0);
}

- (void)processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:.cold.1()
{
  __assert_rtn("-[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:]", "MOVStreamMetalPixelBufferUtility.m", 372, "commandBuffer != nil");
}

- (void)processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:.cold.2()
{
  __assert_rtn("-[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:]", "MOVStreamMetalPixelBufferUtility.m", 375, "computeEncoder != nil");
}

- (void)processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:.cold.3()
{
  __assert_rtn("-[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:]", "MOVStreamMetalPixelBufferUtility.m", 345, "(width % vectorsPerLine) == 0");
}

@end