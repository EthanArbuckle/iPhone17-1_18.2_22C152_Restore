@interface ADNormals
+ (int64_t)normalsFromDepth:(__CVBuffer *)a3 focalLength:(float)a4 principalPoint:(CGPoint)a5 normalsOutput:(__CVBuffer *)a6;
+ (int64_t)normalsFromDepth:(__CVBuffer *)a3 focalLength:(float)a4 principalPoint:(CGPoint)a5 normalsOutput:(__CVBuffer *)a6 withHelperBuffer:(id)a7;
@end

@implementation ADNormals

+ (int64_t)normalsFromDepth:(__CVBuffer *)a3 focalLength:(float)a4 principalPoint:(CGPoint)a5 normalsOutput:(__CVBuffer *)a6
{
  return +[ADNormals normalsFromDepth:focalLength:principalPoint:normalsOutput:withHelperBuffer:](ADNormals, "normalsFromDepth:focalLength:principalPoint:normalsOutput:withHelperBuffer:", a3, a6, 0);
}

+ (int64_t)normalsFromDepth:(__CVBuffer *)a3 focalLength:(float)a4 principalPoint:(CGPoint)a5 normalsOutput:(__CVBuffer *)a6 withHelperBuffer:(id)a7
{
  double y = a5.y;
  double x = a5.x;
  int32x2_t v76 = *(int32x2_t *)&a4;
  v11 = (char *)a7;
  int64_t v12 = -22953;
  if (a3 && a6)
  {
    if (CVPixelBufferGetPixelFormatType(a6) == 1380410945)
    {
      size_t Width = CVPixelBufferGetWidth(a3);
      size_t Height = CVPixelBufferGetHeight(a3);
      size_t v15 = CVPixelBufferGetWidth(a6);
      size_t v16 = CVPixelBufferGetHeight(a6);
      if (Width == v15 && Height == v16)
      {
        if (!v11) {
          operator new();
        }
        v17 = (void **)(v11 + 8);
        v18 = (char *)*((void *)v11 + 1);
        unint64_t v19 = Height * Width;
        v20 = (unsigned char *)*((void *)v11 + 2);
        unint64_t v21 = (v20 - v18) >> 4;
        unint64_t v22 = Height * Width - v21;
        if (Height * Width <= v21)
        {
          if (Height * Width >= v21) {
            goto LABEL_27;
          }
          v32 = &v18[16 * v19];
        }
        else
        {
          uint64_t v23 = *((void *)v11 + 3);
          if (v22 > (v23 - (uint64_t)v20) >> 4)
          {
            if (v19 >> 60) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v24 = v23 - (void)v18;
            if (v24 >> 3 > v19) {
              unint64_t v19 = v24 >> 3;
            }
            BOOL v25 = (unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0;
            unint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
            if (!v25) {
              unint64_t v26 = v19;
            }
            if (v26 >> 60) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            unint64_t v74 = v26;
            v27 = (char *)operator new(16 * v26);
            v28 = &v27[16 * v21];
            size_t v29 = 16 * v22;
            v75 = &v27[16 * v74];
            bzero(v28, v29);
            v30 = &v28[v29];
            if (v20 != v18)
            {
              do
              {
                long long v31 = *((_OWORD *)v20 - 1);
                v20 -= 16;
                *((_OWORD *)v28 - 1) = v31;
                v28 -= 16;
              }
              while (v20 != v18);
              v18 = (char *)*v17;
            }
            *v17 = v28;
            *((void *)v11 + 2) = v30;
            *((void *)v11 + 3) = v75;
            if (v18) {
              operator delete(v18);
            }
LABEL_27:
            CVPixelBufferLockBaseAddress(a3, 1uLL);
            CVPixelBufferLockBaseAddress(a6, 0);
            size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
            size_t v34 = CVPixelBufferGetBytesPerRow(a6);
            BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
            v36 = (char *)CVPixelBufferGetBaseAddress(a6);
            size_t DataSize = CVPixelBufferGetDataSize(a6);
            bzero(v36, DataSize);
            if (Height)
            {
              if (Width)
              {
                unint64_t v39 = 0;
                LODWORD(v40) = 0;
                float32x2_t v41 = (float32x2_t)vdup_lane_s32(v76, 0);
                do
                {
                  unint64_t v42 = 0;
                  uint64_t v40 = (int)v40;
                  do
                  {
                    *(float *)&long long v38 = (double)v42 - x;
                    float v43 = (double)v39 - y;
                    *((float *)&v38 + 1) = v43;
                    *(float32x2_t *)&long long v38 = vdiv_f32(vmul_n_f32(*(float32x2_t *)&v38, BaseAddress[v42]), v41);
                    *((float *)&v38 + 2) = BaseAddress[v42];
                    *((_OWORD *)*v17 + v40) = v38;
                    ++v42;
                    ++v40;
                  }
                  while (Width != v42);
                  ++v39;
                  BaseAddress += BytesPerRow >> 2;
                }
                while (v39 != Height);
              }
              uint64_t v44 = Height - 1;
              if (Height - 1 < 2) {
                goto LABEL_41;
              }
            }
            else
            {
              uint64_t v44 = -1;
            }
            if (Width - 1 >= 2)
            {
              uint64_t v45 = 16 * (v34 >> 4);
              uint64_t v46 = Width;
              size_t v47 = Width - 2;
              uint64_t v48 = 0xFFFFFFFFFFFFFFFLL * Width;
              int v49 = Width - 3;
              uint64_t v50 = 1;
              v51.i64[0] = 0xC0000000C0000000;
              v51.i64[1] = 0xC0000000C0000000;
              v52.i64[0] = 0x4000000040000000;
              v52.i64[1] = 0x4000000040000000;
              v53.i64[0] = 0x3E0000003E000000;
              v53.i64[1] = 0x3E0000003E000000;
              do
              {
                uint64_t v54 = (int)Width + 1;
                uint64_t v55 = 16 * v54 + 16;
                int v56 = v49 + v54;
                size_t v57 = v47;
                uint64_t v58 = v45 + 16;
                do
                {
                  v59 = (float32x4_t *)((char *)*v17 + v55);
                  v60 = &v59[v48];
                  float32x4_t v62 = v59[v48 - 1];
                  float32x4_t v61 = v59[v48];
                  float32x4_t v63 = v59[-2];
                  float32x4_t v64 = *v59;
                  v65 = &v59[v46];
                  float32x4_t v66 = v65[-2];
                  float32x4_t v67 = v60[-2];
                  float32x4_t v68 = vmulq_f32(vaddq_f32(vsubq_f32(vmlaq_f32(vmlaq_f32(vsubq_f32(v61, v67), v51, v63), v52, v64), v66), *v65), v53);
                  float32x4_t v69 = vmulq_f32(vaddq_f32(*v65, vsubq_f32(vmlaq_f32(vmlaq_f32(vsubq_f32(v66, v67), v51, v62), v52, v65[-1]), v61)), v53);
                  float32x4_t v70 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v69, (int32x4_t)v69), (int8x16_t)v69, 0xCuLL), vnegq_f32(v68)), v69, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v68, (int32x4_t)v68), (int8x16_t)v68, 0xCuLL));
                  int32x4_t v71 = (int32x4_t)vmulq_f32(v70, v70);
                  v71.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v71.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v71, 2), *(float32x2_t *)v71.i8)).u32[0];
                  *(float32x2_t *)v66.f32 = vrsqrte_f32((float32x2_t)v71.u32[0]);
                  *(float32x2_t *)v66.f32 = vmul_f32(*(float32x2_t *)v66.f32, vrsqrts_f32((float32x2_t)v71.u32[0], vmul_f32(*(float32x2_t *)v66.f32, *(float32x2_t *)v66.f32)));
                  float32x4_t v72 = vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v70, (int32x4_t)v70), (int8x16_t)v70, 0xCuLL), vmul_f32(*(float32x2_t *)v66.f32, vrsqrts_f32((float32x2_t)v71.u32[0], vmul_f32(*(float32x2_t *)v66.f32, *(float32x2_t *)v66.f32))).f32[0]);
                  v72.i32[3] = 1.0;
                  *(float32x4_t *)&v36[v58] = v72;
                  v58 += 16;
                  v55 += 16;
                  --v57;
                }
                while (v57);
                LODWORD(Width) = v56 + 2;
                ++v50;
                v36 += v45;
              }
              while (v50 != v44);
            }
LABEL_41:
            CVPixelBufferUnlockBaseAddress(a3, 1uLL);
            CVPixelBufferUnlockBaseAddress(a6, 0);
            int64_t v12 = 0;
            goto LABEL_42;
          }
          bzero(*((void **)v11 + 2), 16 * v22);
          v32 = &v20[16 * v22];
        }
        *((void *)v11 + 2) = v32;
        goto LABEL_27;
      }
    }
    else
    {
      int64_t v12 = -22956;
    }
  }
LABEL_42:

  return v12;
}

@end