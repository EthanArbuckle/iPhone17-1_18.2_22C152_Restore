@interface HDRImageConverter_SIMD
- (BOOL)computeLumaGainHistogram:(id *)a3 scale:(__CVBuffer *)a4 image:(id *)a5 transform:(__CVBuffer *)a6 gainMap:(id *)a7 transform:;
- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 gainMap:(__CVBuffer *)a6 transform:(id *)a7 alternate:(id *)a8 toImage:(__CVBuffer *)a9 transform:(id *)a10 gainMap:(__CVBuffer *)a11 transform:(id *)a12;
- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 toImage:(__CVBuffer *)a6 transform:(id *)a7 gainMap:(__CVBuffer *)a8 transform:(id *)a9;
- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 gainMap:(__CVBuffer *)a5 transform:(id *)a6 toImage:(__CVBuffer *)a7 transform:(id *)a8;
- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 toImage:(__CVBuffer *)a5 transform:(id *)a6;
- (BOOL)isPixelFormatSupported:(unsigned int)a3;
- (id)description;
@end

@implementation HDRImageConverter_SIMD

- (id)description
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  size_t v6 = 256;
  memset(v7, 0, sizeof(v7));
  sysctlbyname("machdep.cpu.brand_string", v7, &v6, 0, 0);
  v2 = NSString;
  v3 = [(id)objc_opt_class() description];
  v4 = [v2 stringWithFormat:@"%@[%s]", v3, v7];

  return v4;
}

- (BOOL)isPixelFormatSupported:(unsigned int)a3
{
  return xdr::PixelFormat::choosePixelFormat(a3, 0, 0);
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 toImage:(__CVBuffer *)a5 transform:(id *)a6
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  long long v76 = 0u;
  long long v77 = 0u;
  _ZN3xdr8ImageBoxI19HDRPixelTransformInLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE0EEC2EP10__CVBufferRKS1_(&v76, (uint64_t)a3, &a4->var0.var0);
  long long v74 = 0u;
  long long v75 = 0u;
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EEC2EP10__CVBufferRKS1_(&v74, (uint64_t)a5, (int *)&a6[2].var0.var1.var1.var5);
  v73[0] = v77;
  long long v9 = *(_OWORD *)(*((void *)&v76 + 1) + 48);
  long long v11 = **((_OWORD **)&v76 + 1);
  long long v10 = *(_OWORD *)(*((void *)&v76 + 1) + 16);
  v73[3] = *(_OWORD *)(*((void *)&v76 + 1) + 32);
  v73[4] = v9;
  v73[1] = v11;
  v73[2] = v10;
  long long v12 = *(_OWORD *)(*((void *)&v76 + 1) + 112);
  long long v14 = *(_OWORD *)(*((void *)&v76 + 1) + 64);
  long long v13 = *(_OWORD *)(*((void *)&v76 + 1) + 80);
  v73[7] = *(_OWORD *)(*((void *)&v76 + 1) + 96);
  v73[8] = v12;
  v73[5] = v14;
  v73[6] = v13;
  v72[0] = v75;
  long long v15 = *(_OWORD *)(*((void *)&v74 + 1) + 32);
  long long v16 = **((_OWORD **)&v74 + 1);
  v72[2] = *(_OWORD *)(*((void *)&v74 + 1) + 16);
  v72[3] = v15;
  v72[1] = v16;
  long long v18 = *(_OWORD *)(*((void *)&v74 + 1) + 48);
  long long v17 = *(_OWORD *)(*((void *)&v74 + 1) + 64);
  long long v19 = *(_OWORD *)(*((void *)&v74 + 1) + 96);
  v72[6] = *(_OWORD *)(*((void *)&v74 + 1) + 80);
  v72[7] = v19;
  v72[4] = v18;
  v72[5] = v17;
  if ((void)v75)
  {
    LOWORD(v17) = *(_WORD *)(v75 + 12);
    WORD2(v17) = *(_WORD *)(v75 + 14);
  }
  else
  {
    *(void *)&long long v17 = 0;
  }
  int32x2_t v65 = (int32x2_t)v17;
  uint64_t v71 = 0;
  long long v69 = 0uLL;
  long long v70 = 0uLL;
  xdr::ColorBox<HDRColorTransformIn>::ColorBox((uint64_t)&v69, &a4->var1.var1.var4.var1.var3);
  uint64_t v68 = 0;
  long long v66 = 0u;
  long long v67 = 0u;
  xdr::ColorBox<HDRColorTransformOut>::ColorBox((uint64_t)&v66, a6);
  v109[0] = *(_DWORD *)v69;
  long long v20 = *(_OWORD *)(v69 + 16);
  long long v21 = *(_OWORD *)(v69 + 48);
  long long v111 = *(_OWORD *)(v69 + 32);
  long long v112 = v21;
  long long v110 = v20;
  uint64_t v113 = *((void *)&v69 + 1);
  int v114 = *(_DWORD *)(v69 + 80);
  long long v22 = *(_OWORD *)(v69 + 96);
  long long v23 = *(_OWORD *)(v69 + 128);
  long long v116 = *(_OWORD *)(v69 + 112);
  long long v115 = v22;
  long long v24 = *(_OWORD *)(v69 + 160);
  long long v25 = *(_OWORD *)(v69 + 176);
  long long v117 = v23;
  long long v118 = v24;
  long long v26 = *(_OWORD *)(v69 + 192);
  long long v27 = *(_OWORD *)(v69 + 208);
  long long v119 = v25;
  long long v120 = v26;
  long long v121 = v27;
  long long v122 = v70;
  int v123 = *(_DWORD *)(v69 + 224);
  long long v28 = *(_OWORD *)(v69 + 240);
  long long v29 = *(_OWORD *)(v69 + 256);
  long long v126 = *(_OWORD *)(v69 + 272);
  long long v125 = v29;
  long long v124 = v28;
  uint64_t v127 = v71;
  long long v30 = *(_OWORD *)(v69 + 304);
  long long v31 = *(_OWORD *)(v69 + 320);
  long long v32 = *(_OWORD *)(v69 + 336);
  long long v131 = *(_OWORD *)(v69 + 352);
  long long v130 = v32;
  long long v129 = v31;
  long long v128 = v30;
  long long v33 = *(_OWORD *)v66;
  long long v34 = *(_OWORD *)(v66 + 16);
  long long v35 = *(_OWORD *)(v66 + 48);
  v89[2] = *(_OWORD *)(v66 + 32);
  v89[3] = v35;
  v89[0] = v33;
  v89[1] = v34;
  int v90 = *(_DWORD *)(v66 + 64);
  long long v36 = *(_OWORD *)(v66 + 96);
  long long v37 = *(_OWORD *)(v66 + 112);
  long long v91 = *(_OWORD *)(v66 + 80);
  long long v92 = v36;
  long long v38 = *(_OWORD *)(v66 + 144);
  long long v39 = *(_OWORD *)(v66 + 160);
  long long v93 = v37;
  long long v94 = v38;
  long long v40 = *(_OWORD *)(v66 + 176);
  long long v41 = *(_OWORD *)(v66 + 192);
  int v99 = *(_DWORD *)(v66 + 208);
  long long v42 = *(_OWORD *)(v66 + 224);
  long long v43 = *(_OWORD *)(v66 + 240);
  long long v44 = *(_OWORD *)(v66 + 256);
  uint64_t v103 = v68;
  int v104 = *(_DWORD *)(v66 + 288);
  long long v95 = v39;
  long long v96 = v40;
  long long v97 = v41;
  long long v98 = v67;
  long long v101 = v43;
  long long v102 = v44;
  long long v100 = v42;
  long long v45 = *(_OWORD *)(v66 + 304);
  long long v46 = *(_OWORD *)(v66 + 336);
  long long v106 = *(_OWORD *)(v66 + 320);
  long long v107 = v46;
  long long v105 = v45;
  uint64_t v108 = *((void *)&v66 + 1);
  unsigned __int32 v47 = vmax_u16((uint16x4_t)vdup_lane_s16(*(int16x4_t *)&a6[2].var0.var2.var1.var3, 0).u32[0], (uint16x4_t)vext_s8(*(int8x8_t *)&a6[2].var0.var2.var1.var3, *(int8x8_t *)&a6[2].var0.var2.var1.var3, 2uLL).u32[0]).u32[0];
  if ((unsigned __int16)v47 == 1 && HIWORD(v47) == 1)
  {
    float32x2_t v48 = vadd_f32((float32x2_t)vorr_s8(vand_s8((int8x8_t)v65, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V1.2S, #1.0 }
    *(float32x2_t *)&long long v54 = vdiv_f32(_D1, v48);
    *((float32x2_t *)&v54 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v48);
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v79 = 3221225472;
    v80 = ___ZN3xdr36dispatch_convert_image_to_image_loopILt1ELt1EEEvRKNS_7imageInERKNS_8imageOutERKNS_16colorTransformInERKNS_17colorTransformOutEDv2_t_block_invoke;
    v81 = &__block_descriptor_84_e8_v16__0Q8l;
    __int16 v88 = v65.i16[2];
    __int16 v87 = v65.i16[0];
    size_t v55 = v65.u16[2];
    v83 = v73;
    v84 = v72;
    v85 = v109;
    v86 = v89;
    long long v82 = v54;
  }
  else
  {
    if ((unsigned __int16)v47 == 2 && HIWORD(v47) == 1)
    {
      uint32x2_t v56 = vshl_u32((uint32x2_t)vand_s8((int8x8_t)vadd_s32(v65, (int32x2_t)1), (int8x8_t)0xFFFF0000FFFFLL), (uint32x2_t)0xFFFFFFFFLL);
      float32x2_t v57 = vadd_f32((float32x2_t)vorr_s8(vand_s8((int8x8_t)v65, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
      __asm { FMOV            V2.2S, #1.0 }
      *(float32x2_t *)&long long v59 = vdiv_f32(_D2, v57);
      *((float32x2_t *)&v59 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v57);
      size_t v55 = v56.u32[1];
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v79 = 3221225472;
      v60 = (void (*)(uint64_t, __int16, double, uint16x4_t))___ZN3xdr36dispatch_convert_image_to_image_loopILt2ELt1EEEvRKNS_7imageInERKNS_8imageOutERKNS_16colorTransformInERKNS_17colorTransformOutEDv2_t_block_invoke;
    }
    else
    {
      if ((unsigned __int16)v47 != 2 || HIWORD(v47) != 2)
      {
        LogError("-[HDRImageConverter_SIMD convertImage:transform:toImage:transform:]", 835, "Unupported subsample factors (%d,%d)", (unsigned __int16)v47, HIWORD(v47));
        BOOL v63 = 0;
        goto LABEL_15;
      }
      uint32x2_t v56 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)vadd_s32(v65, (int32x2_t)0x100000001), (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
      float32x2_t v61 = vadd_f32((float32x2_t)vorr_s8(vand_s8((int8x8_t)v65, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
      __asm { FMOV            V2.2S, #1.0 }
      *(float32x2_t *)&long long v59 = vdiv_f32(_D2, v61);
      *((float32x2_t *)&v59 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v61);
      size_t v55 = v56.u32[1];
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v79 = 3221225472;
      v60 = (void (*)(uint64_t, __int16, double, uint16x4_t))___ZN3xdr36dispatch_convert_image_to_image_loopILt2ELt2EEEvRKNS_7imageInERKNS_8imageOutERKNS_16colorTransformInERKNS_17colorTransformOutEDv2_t_block_invoke;
    }
    v80 = v60;
    v81 = &__block_descriptor_84_e8_v16__0Q8l;
    __int16 v88 = v55;
    __int16 v87 = v56.i16[0];
    v83 = v73;
    v84 = v72;
    v85 = v109;
    v86 = v89;
    long long v82 = v59;
  }
  dispatch_apply(v55, 0, &block);
  BOOL v63 = 1;
LABEL_15:
  xdr::ColorBox<HDRColorTransformOut>::~ColorBox(&v66);
  xdr::ColorBox<HDRColorTransformOut>::~ColorBox(&v69);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v74);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v76);
  return v63;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 gainMap:(__CVBuffer *)a5 transform:(id *)a6 toImage:(__CVBuffer *)a7 transform:(id *)a8
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  long long v109 = 0u;
  long long v110 = 0u;
  _ZN3xdr8ImageBoxI19HDRPixelTransformInLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE0EEC2EP10__CVBufferRKS1_(&v109, (uint64_t)a3, &a4->var0.var0);
  long long v107 = 0u;
  long long v108 = 0u;
  _ZN3xdr8ImageBoxI19HDRPixelTransformInLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE0EEC2EP10__CVBufferRKS1_(&v107, (uint64_t)a5, &a6->var0.var0);
  long long v105 = 0u;
  long long v106 = 0u;
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EEC2EP10__CVBufferRKS1_(&v105, (uint64_t)a7, (int *)&a8[2].var0.var1.var1.var5);
  v104[0] = v110;
  long long v13 = *(_OWORD *)(*((void *)&v109 + 1) + 48);
  long long v15 = **((_OWORD **)&v109 + 1);
  long long v14 = *(_OWORD *)(*((void *)&v109 + 1) + 16);
  v104[3] = *(_OWORD *)(*((void *)&v109 + 1) + 32);
  v104[4] = v13;
  v104[1] = v15;
  v104[2] = v14;
  long long v16 = *(_OWORD *)(*((void *)&v109 + 1) + 112);
  long long v18 = *(_OWORD *)(*((void *)&v109 + 1) + 64);
  long long v17 = *(_OWORD *)(*((void *)&v109 + 1) + 80);
  v104[7] = *(_OWORD *)(*((void *)&v109 + 1) + 96);
  v104[8] = v16;
  v104[5] = v18;
  v104[6] = v17;
  v103[0] = v108;
  long long v19 = *(_OWORD *)(*((void *)&v107 + 1) + 48);
  long long v21 = **((_OWORD **)&v107 + 1);
  long long v20 = *(_OWORD *)(*((void *)&v107 + 1) + 16);
  v103[3] = *(_OWORD *)(*((void *)&v107 + 1) + 32);
  v103[4] = v19;
  v103[1] = v21;
  v103[2] = v20;
  long long v23 = *(_OWORD *)(*((void *)&v107 + 1) + 64);
  long long v22 = *(_OWORD *)(*((void *)&v107 + 1) + 80);
  long long v24 = *(_OWORD *)(*((void *)&v107 + 1) + 112);
  v103[7] = *(_OWORD *)(*((void *)&v107 + 1) + 96);
  v103[8] = v24;
  v103[5] = v23;
  v103[6] = v22;
  v102[0] = v106;
  long long v25 = *(_OWORD *)(*((void *)&v105 + 1) + 32);
  long long v26 = **((_OWORD **)&v105 + 1);
  v102[2] = *(_OWORD *)(*((void *)&v105 + 1) + 16);
  v102[3] = v25;
  v102[1] = v26;
  long long v28 = *(_OWORD *)(*((void *)&v105 + 1) + 48);
  long long v27 = *(_OWORD *)(*((void *)&v105 + 1) + 64);
  long long v29 = *(_OWORD *)(*((void *)&v105 + 1) + 96);
  v102[6] = *(_OWORD *)(*((void *)&v105 + 1) + 80);
  v102[7] = v29;
  v102[4] = v28;
  v102[5] = v27;
  uint64_t v101 = 0;
  long long v99 = 0u;
  long long v100 = 0u;
  xdr::ColorBox<HDRColorTransformIn>::ColorBox((uint64_t)&v99, &a4->var1.var1.var4.var1.var3);
  long long v30 = *(_OWORD *)&a6[22].var1.var1.var1;
  long long v96 = *(_OWORD *)&a6[21].var1.var0.var0;
  long long v97 = v30;
  long long v98 = *(_OWORD *)&a6[24].var0.var0;
  long long v31 = *(_OWORD *)&a6[17].var1.var0.var0;
  long long v92 = *(_OWORD *)&a6[16].var0.var0;
  long long v93 = v31;
  long long v32 = *(_OWORD *)&a6[20].var0.var0;
  long long v94 = *(_OWORD *)&a6[18].var1.var1.var1;
  long long v95 = v32;
  long long v33 = *(_OWORD *)&a6[12].var0.var0;
  long long v88 = *(_OWORD *)&a6[10].var1.var1.var1;
  long long v89 = v33;
  long long v34 = *(_OWORD *)&a6[14].var1.var1.var1;
  long long v90 = *(_OWORD *)&a6[13].var1.var0.var0;
  long long v91 = v34;
  uint64_t v87 = 0;
  long long v85 = 0u;
  long long v86 = 0u;
  xdr::ColorBox<HDRColorTransformOut>::ColorBox((uint64_t)&v85, a8);
  int v144 = *(_DWORD *)v99;
  long long v35 = *(_OWORD *)(v99 + 16);
  long long v36 = *(_OWORD *)(v99 + 32);
  long long v147 = *(_OWORD *)(v99 + 48);
  long long v146 = v36;
  long long v145 = v35;
  uint64_t v148 = *((void *)&v99 + 1);
  int v149 = *(_DWORD *)(v99 + 80);
  long long v37 = *(_OWORD *)(v99 + 96);
  long long v38 = *(_OWORD *)(v99 + 128);
  long long v151 = *(_OWORD *)(v99 + 112);
  long long v150 = v37;
  long long v39 = *(_OWORD *)(v99 + 160);
  long long v40 = *(_OWORD *)(v99 + 176);
  long long v152 = v38;
  long long v153 = v39;
  long long v41 = *(_OWORD *)(v99 + 192);
  long long v42 = *(_OWORD *)(v99 + 208);
  long long v154 = v40;
  long long v155 = v41;
  long long v156 = v42;
  long long v157 = v100;
  int v158 = *(_DWORD *)(v99 + 224);
  long long v43 = *(_OWORD *)(v99 + 240);
  long long v44 = *(_OWORD *)(v99 + 256);
  long long v161 = *(_OWORD *)(v99 + 272);
  long long v160 = v44;
  long long v159 = v43;
  uint64_t v162 = v101;
  long long v45 = *(_OWORD *)(v99 + 304);
  long long v46 = *(_OWORD *)(v99 + 320);
  long long v47 = *(_OWORD *)(v99 + 336);
  long long v166 = *(_OWORD *)(v99 + 352);
  long long v165 = v47;
  long long v164 = v46;
  long long v163 = v45;
  v84[4] = v92;
  v84[5] = v93;
  v84[0] = v88;
  v84[1] = v89;
  v84[2] = v90;
  v84[3] = v91;
  v84[9] = v97;
  v84[10] = v98;
  v84[7] = v95;
  v84[8] = v96;
  v84[6] = v94;
  long long v48 = *(_OWORD *)v85;
  long long v49 = *(_OWORD *)(v85 + 16);
  long long v50 = *(_OWORD *)(v85 + 32);
  v124[3] = *(_OWORD *)(v85 + 48);
  v124[2] = v50;
  v124[1] = v49;
  v124[0] = v48;
  int v125 = *(_DWORD *)(v85 + 64);
  long long v51 = *(_OWORD *)(v85 + 80);
  long long v52 = *(_OWORD *)(v85 + 112);
  long long v127 = *(_OWORD *)(v85 + 96);
  long long v126 = v51;
  long long v53 = *(_OWORD *)(v85 + 144);
  long long v54 = *(_OWORD *)(v85 + 160);
  long long v128 = v52;
  long long v129 = v53;
  long long v55 = *(_OWORD *)(v85 + 176);
  long long v56 = *(_OWORD *)(v85 + 192);
  int v134 = *(_DWORD *)(v85 + 208);
  long long v57 = *(_OWORD *)(v85 + 224);
  long long v58 = *(_OWORD *)(v85 + 240);
  long long v59 = *(_OWORD *)(v85 + 256);
  uint64_t v138 = v87;
  int v139 = *(_DWORD *)(v85 + 288);
  long long v130 = v54;
  long long v131 = v55;
  long long v132 = v56;
  long long v133 = v86;
  long long v137 = v59;
  long long v136 = v58;
  long long v135 = v57;
  long long v60 = *(_OWORD *)(v85 + 304);
  long long v61 = *(_OWORD *)(v85 + 320);
  long long v142 = *(_OWORD *)(v85 + 336);
  long long v141 = v61;
  long long v140 = v60;
  uint64_t v143 = *((void *)&v85 + 1);
  if ((void)v106)
  {
    LOWORD(v60) = *(_WORD *)(v106 + 12);
    WORD2(v60) = *(_WORD *)(v106 + 14);
  }
  else
  {
    *(void *)&long long v60 = 0;
  }
  uint16x4_t v62 = vmax_u16((uint16x4_t)vdup_lane_s16(*(int16x4_t *)&a8[2].var0.var2.var1.var3, 0).u32[0], (uint16x4_t)vext_s8(*(int8x8_t *)&a8[2].var0.var2.var1.var3, *(int8x8_t *)&v60, 2uLL).u32[0]);
  int8x8_t v63 = (int8x8_t)vmovl_u16(v62).u64[0];
  int32x2_t v64 = (int32x2_t)vand_s8(v63, (int8x8_t)0xFFFF0000FFFFLL);
  int16x4_t v65 = (int16x4_t)vceq_s32(v64, (int32x2_t)0x100000001);
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v65, v65)) & 0x8000) != 0)
  {
    float32x2_t v69 = vadd_f32((float32x2_t)vorr_s8(vand_s8(*(int8x8_t *)&v60, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V2.2S, #1.0 }
    *(float32x2_t *)&long long v75 = vdiv_f32(_D2, v69);
    *((float32x2_t *)&v75 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v69);
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v112 = 3221225472;
    uint64_t v113 = ___ZN3xdr44dispatch_convert_gainmap_image_to_image_loopILt1ELt1EEEvRKNS_7imageInES3_RKNS_8imageOutERKNS_16colorTransformInERKNS_15gainTransformInERKNS_17colorTransformOutEDv2_t_block_invoke;
    int v114 = &__block_descriptor_100_e8_v16__0Q8l;
    __int16 v123 = WORD2(v60);
    __int16 v122 = v60;
    long long v116 = v104;
    long long v117 = v103;
    size_t v76 = WORD2(v60);
LABEL_12:
    long long v118 = v102;
    long long v119 = &v144;
    long long v120 = v84;
    long long v121 = v124;
    long long v115 = v75;
    dispatch_apply(v76, 0, &block);
    BOOL v68 = 1;
    goto LABEL_13;
  }
  int16x4_t v66 = (int16x4_t)vceq_s32(v64, (int32x2_t)0x100000002);
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v66, v66)) & 0x8000) != 0)
  {
    uint32x2_t v77 = vshl_u32((uint32x2_t)vand_s8((int8x8_t)vadd_s32(*(int32x2_t *)&v60, (int32x2_t)1), (int8x8_t)0xFFFF0000FFFFLL), (uint32x2_t)0xFFFFFFFFLL);
    float32x2_t v78 = vadd_f32((float32x2_t)vorr_s8(vand_s8(*(int8x8_t *)&v60, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V2.2S, #1.0 }
    *(float32x2_t *)&long long v75 = vdiv_f32(_D2, v78);
    *((float32x2_t *)&v75 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v78);
    size_t v76 = v77.u32[1];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v112 = 3221225472;
    v80 = (void (*)(uint64_t, __int16, double, uint16x4_t))___ZN3xdr44dispatch_convert_gainmap_image_to_image_loopILt2ELt1EEEvRKNS_7imageInES3_RKNS_8imageOutERKNS_16colorTransformInERKNS_15gainTransformInERKNS_17colorTransformOutEDv2_t_block_invoke;
LABEL_11:
    uint64_t v113 = v80;
    int v114 = &__block_descriptor_100_e8_v16__0Q8l;
    __int16 v123 = v76;
    __int16 v122 = v77.i16[0];
    long long v116 = v104;
    long long v117 = v103;
    goto LABEL_12;
  }
  int16x4_t v67 = (int16x4_t)vceq_s32((int32x2_t)vand_s8(v63, (int8x8_t)0xFFFF0000FFFFLL), (int32x2_t)0x200000002);
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v67, v67)) & 0x8000) != 0)
  {
    uint32x2_t v77 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)vadd_s32(*(int32x2_t *)&v60, (int32x2_t)0x100000001), (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    float32x2_t v81 = vadd_f32((float32x2_t)vorr_s8(vand_s8(*(int8x8_t *)&v60, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V2.2S, #1.0 }
    *(float32x2_t *)&long long v75 = vdiv_f32(_D2, v81);
    *((float32x2_t *)&v75 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v81);
    size_t v76 = v77.u32[1];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v112 = 3221225472;
    v80 = (void (*)(uint64_t, __int16, double, uint16x4_t))___ZN3xdr44dispatch_convert_gainmap_image_to_image_loopILt2ELt2EEEvRKNS_7imageInES3_RKNS_8imageOutERKNS_16colorTransformInERKNS_15gainTransformInERKNS_17colorTransformOutEDv2_t_block_invoke;
    goto LABEL_11;
  }
  LogError("-[HDRImageConverter_SIMD convertImage:transform:gainMap:transform:toImage:transform:]", 879, "Unupported subsample factors (%d,%d)", v62.u16[0], v62.u16[1]);
  BOOL v68 = 0;
LABEL_13:
  xdr::ColorBox<HDRColorTransformOut>::~ColorBox(&v85);
  xdr::ColorBox<HDRColorTransformOut>::~ColorBox(&v99);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v105);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v107);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v109);
  return v68;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 toImage:(__CVBuffer *)a6 transform:(id *)a7 gainMap:(__CVBuffer *)a8 transform:(id *)a9
{
  uint64_t v234 = *MEMORY[0x1E4F143B8];
  long long v153 = 0u;
  long long v152 = 0u;
  _ZN3xdr8ImageBoxI19HDRPixelTransformInLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE0EEC2EP10__CVBufferRKS1_(&v152, (uint64_t)a3, &a4->var0.var0);
  long long v150 = 0u;
  long long v151 = 0u;
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EEC2EP10__CVBufferRKS1_(&v150, (uint64_t)a6, (int *)&a7[2].var0.var1.var1.var5);
  long long v148 = 0u;
  long long v149 = 0u;
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EEC2EP10__CVBufferRKS1_(&v148, (uint64_t)a8, &a9[18].var1.var0);
  v147[0] = v153;
  long long v14 = *(_OWORD *)(*((void *)&v152 + 1) + 48);
  long long v16 = **((_OWORD **)&v152 + 1);
  long long v15 = *(_OWORD *)(*((void *)&v152 + 1) + 16);
  v147[3] = *(_OWORD *)(*((void *)&v152 + 1) + 32);
  v147[4] = v14;
  v147[1] = v16;
  v147[2] = v15;
  long long v17 = *(_OWORD *)(*((void *)&v152 + 1) + 112);
  long long v19 = *(_OWORD *)(*((void *)&v152 + 1) + 64);
  long long v18 = *(_OWORD *)(*((void *)&v152 + 1) + 80);
  v147[7] = *(_OWORD *)(*((void *)&v152 + 1) + 96);
  v147[8] = v17;
  v147[5] = v19;
  v147[6] = v18;
  v146[0] = v151;
  long long v20 = *(_OWORD *)(*((void *)&v150 + 1) + 32);
  long long v21 = **((_OWORD **)&v150 + 1);
  v146[2] = *(_OWORD *)(*((void *)&v150 + 1) + 16);
  v146[3] = v20;
  v146[1] = v21;
  long long v23 = *(_OWORD *)(*((void *)&v150 + 1) + 48);
  long long v22 = *(_OWORD *)(*((void *)&v150 + 1) + 64);
  long long v24 = *(_OWORD *)(*((void *)&v150 + 1) + 96);
  v146[6] = *(_OWORD *)(*((void *)&v150 + 1) + 80);
  v146[7] = v24;
  v146[4] = v23;
  v146[5] = v22;
  v145[0] = v149;
  long long v25 = *(_OWORD *)(*((void *)&v148 + 1) + 32);
  long long v26 = **((_OWORD **)&v148 + 1);
  v145[2] = *(_OWORD *)(*((void *)&v148 + 1) + 16);
  v145[3] = v25;
  v145[1] = v26;
  long long v28 = *(_OWORD *)(*((void *)&v148 + 1) + 48);
  long long v27 = *(_OWORD *)(*((void *)&v148 + 1) + 64);
  long long v29 = *(_OWORD *)(*((void *)&v148 + 1) + 96);
  v145[6] = *(_OWORD *)(*((void *)&v148 + 1) + 80);
  v145[7] = v29;
  v145[4] = v28;
  v145[5] = v27;
  uint64_t v144 = 0;
  long long v142 = 0u;
  long long v143 = 0u;
  xdr::ColorBox<HDRColorTransformIn>::ColorBox((uint64_t)&v142, &a4->var1.var1.var4.var1.var3);
  uint64_t v141 = 0;
  long long v139 = 0u;
  long long v140 = 0u;
  xdr::ColorBox<HDRColorTransformIn>::ColorBox((uint64_t)&v139, &a5->var1.var1.var4.var1.var3);
  uint64_t v138 = 0;
  long long v136 = 0u;
  long long v137 = 0u;
  xdr::ColorBox<HDRColorTransformOut>::ColorBox((uint64_t)&v136, a7);
  long long v30 = *(_OWORD *)&a9[12].var0.var0.var0;
  long long v133 = *(_OWORD *)&a9[10].var1.var0;
  long long v134 = v30;
  long long v135 = *(_OWORD *)&a9[13].var0.var1.var1;
  long long v31 = *(_OWORD *)&a9[4].var0.var0.var0;
  long long v32 = *(_OWORD *)&a9[6].var1.var0;
  long long v129 = *(_OWORD *)&a9[5].var0.var1.var1;
  long long v130 = v32;
  long long v33 = *(_OWORD *)&a9[6].var1.var0;
  long long v35 = *(_OWORD *)&a9[9].var0.var1.var1;
  long long v131 = *(_OWORD *)&a9[8].var0.var0.var0;
  int32x2_t v34 = (int32x2_t)v131;
  long long v132 = v35;
  long long v36 = *(_OWORD *)&a9[1].var0.var1.var1;
  long long v125 = *(_OWORD *)&a9->var0.var0.var0;
  long long v126 = v36;
  long long v37 = *(_OWORD *)&a9[4].var0.var0.var0;
  long long v38 = *(_OWORD *)&a9->var0.var0.var0;
  long long v39 = *(_OWORD *)&a9[1].var0.var1.var1;
  long long v127 = *(_OWORD *)&a9[2].var1.var0;
  long long v128 = v37;
  v211[0] = *(_DWORD *)v142;
  long long v40 = *(_OWORD *)(v142 + 16);
  long long v41 = *(_OWORD *)(v142 + 32);
  long long v214 = *(_OWORD *)(v142 + 48);
  long long v213 = v41;
  long long v212 = v40;
  uint64_t v215 = *((void *)&v142 + 1);
  int v216 = *(_DWORD *)(v142 + 80);
  long long v42 = *(_OWORD *)(v142 + 96);
  long long v43 = *(_OWORD *)(v142 + 128);
  long long v218 = *(_OWORD *)(v142 + 112);
  long long v217 = v42;
  long long v44 = *(_OWORD *)(v142 + 160);
  long long v45 = *(_OWORD *)(v142 + 176);
  long long v219 = v43;
  long long v220 = v44;
  long long v46 = *(_OWORD *)(v142 + 192);
  long long v47 = *(_OWORD *)(v142 + 208);
  long long v221 = v45;
  long long v222 = v46;
  long long v223 = v47;
  long long v224 = v143;
  int v225 = *(_DWORD *)(v142 + 224);
  long long v48 = *(_OWORD *)(v142 + 240);
  long long v49 = *(_OWORD *)(v142 + 256);
  long long v228 = *(_OWORD *)(v142 + 272);
  long long v227 = v49;
  long long v226 = v48;
  uint64_t v229 = v144;
  long long v50 = *(_OWORD *)(v142 + 304);
  long long v51 = *(_OWORD *)(v142 + 320);
  long long v52 = *(_OWORD *)(v142 + 336);
  long long v233 = *(_OWORD *)(v142 + 352);
  long long v232 = v52;
  long long v231 = v51;
  long long v230 = v50;
  v188[0] = *(_DWORD *)v139;
  long long v53 = *(_OWORD *)(v139 + 16);
  long long v54 = *(_OWORD *)(v139 + 32);
  long long v191 = *(_OWORD *)(v139 + 48);
  long long v190 = v54;
  long long v189 = v53;
  uint64_t v192 = *((void *)&v139 + 1);
  int v193 = *(_DWORD *)(v139 + 80);
  long long v56 = *(_OWORD *)(v139 + 112);
  long long v55 = *(_OWORD *)(v139 + 128);
  long long v194 = *(_OWORD *)(v139 + 96);
  long long v195 = v56;
  long long v57 = *(_OWORD *)(v139 + 160);
  long long v58 = *(_OWORD *)(v139 + 176);
  long long v196 = v55;
  long long v197 = v57;
  long long v59 = *(_OWORD *)(v139 + 192);
  long long v60 = *(_OWORD *)(v139 + 208);
  long long v198 = v58;
  long long v199 = v59;
  long long v200 = v60;
  long long v201 = v140;
  int v202 = *(_DWORD *)(v139 + 224);
  long long v61 = *(_OWORD *)(v139 + 240);
  long long v62 = *(_OWORD *)(v139 + 256);
  long long v205 = *(_OWORD *)(v139 + 272);
  long long v204 = v62;
  long long v203 = v61;
  uint64_t v206 = v141;
  long long v63 = *(_OWORD *)(v139 + 304);
  long long v64 = *(_OWORD *)(v139 + 320);
  long long v65 = *(_OWORD *)(v139 + 336);
  long long v210 = *(_OWORD *)(v139 + 352);
  long long v209 = v65;
  long long v208 = v64;
  long long v207 = v63;
  long long v66 = *(_OWORD *)v136;
  long long v67 = *(_OWORD *)(v136 + 16);
  long long v68 = *(_OWORD *)(v136 + 32);
  v168[3] = *(_OWORD *)(v136 + 48);
  v168[2] = v68;
  v168[1] = v67;
  v168[0] = v66;
  int v69 = *(_DWORD *)(v136 + 64);
  long long v70 = *(_OWORD *)(v136 + 80);
  long long v71 = *(_OWORD *)(v136 + 112);
  long long v171 = *(_OWORD *)(v136 + 96);
  long long v170 = v70;
  long long v72 = *(_OWORD *)(v136 + 144);
  long long v73 = *(_OWORD *)(v136 + 160);
  long long v172 = v71;
  long long v173 = v72;
  long long v74 = *(_OWORD *)(v136 + 176);
  long long v75 = *(_OWORD *)(v136 + 192);
  long long v174 = v73;
  long long v175 = v74;
  long long v176 = v75;
  long long v177 = v137;
  int v76 = *(_DWORD *)(v136 + 208);
  long long v77 = *(_OWORD *)(v136 + 224);
  long long v78 = *(_OWORD *)(v136 + 240);
  long long v181 = *(_OWORD *)(v136 + 256);
  long long v180 = v78;
  long long v179 = v77;
  long long v79 = *(_OWORD *)(v136 + 304);
  long long v80 = *(_OWORD *)(v136 + 320);
  int v81 = *(_DWORD *)(v136 + 288);
  long long v186 = *(_OWORD *)(v136 + 336);
  int v169 = v69;
  long long v185 = v80;
  long long v184 = v79;
  *(void *)&long long v79 = *(void *)&a9[14].var1.var0;
  v121[4] = v129;
  v121[5] = v33;
  long long v82 = *(_OWORD *)&a9[16].var0.var0.var0;
  int v178 = v76;
  uint64_t v182 = v138;
  LOBYTE(v69) = a9[17].var0.var1.var1;
  int v183 = v81;
  uint64_t v187 = *((void *)&v136 + 1);
  v121[0] = v38;
  v121[1] = v39;
  v121[2] = v127;
  v121[3] = v31;
  v121[9] = v134;
  v121[10] = v135;
  v121[7] = v132;
  v121[8] = v133;
  v121[6] = v131;
  uint64_t v122 = v79;
  long long v123 = v82;
  char v124 = v69;
  if ((void)v151)
  {
    v34.i16[0] = *(_WORD *)(v151 + 12);
    v34.i16[2] = *(_WORD *)(v151 + 14);
  }
  else
  {
    int32x2_t v34 = 0;
  }
  uint16x4_t v83 = *(uint16x4_t *)&a7[2].var0.var2.var1.var3;
  uint16x4_t v84 = *(uint16x4_t *)&a9[26].var1.var0;
  v83.i16[3] = 0;
  v84.i16[3] = 0;
  int16x4_t v85 = (int16x4_t)vmax_u16(v83, v84);
  uint16x4_t v86 = vmax_u16((uint16x4_t)vdup_lane_s16(v85, 0).u32[0], (uint16x4_t)vext_s8((int8x8_t)v85, (int8x8_t)v34, 2uLL).u32[0]);
  int8x8_t v87 = (int8x8_t)vmovl_u16(v86).u64[0];
  int32x2_t v88 = (int32x2_t)vand_s8(v87, (int8x8_t)0xFFFF0000FFFFLL);
  int16x4_t v89 = (int16x4_t)vceq_s32(v88, (int32x2_t)0x100000001);
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v89, v89)) & 0x8000) != 0)
  {
    float32x2_t v96 = vadd_f32((float32x2_t)vorr_s8(vand_s8((int8x8_t)v34, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V2.2S, #1.0 }
    *(float32x2_t *)&long long v102 = vdiv_f32(_D2, v96);
    *((float32x2_t *)&v102 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v96);
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v155 = 3221225472;
    long long v156 = ___ZN3xdr44dispatch_convert_image_to_gainmap_image_loopILt1ELt1EEEvRKNS_7imageInERKNS_8imageOutES6_RKNS_16colorTransformInES9_RKNS_17colorTransformOutERKNS_16gainTransformOutEDv2_t_block_invoke;
    long long v157 = &__block_descriptor_108_e8_v16__0Q8l;
    __int16 v167 = v34.i16[2];
    __int16 v166 = v34.i16[0];
    long long v159 = v147;
    long long v160 = v146;
    size_t v103 = v34.u16[2];
LABEL_14:
    long long v161 = v145;
    uint64_t v162 = v211;
    long long v163 = v188;
    long long v164 = v168;
    long long v165 = v121;
    long long v158 = v102;
LABEL_15:
    dispatch_apply(v103, 0, &block);
    BOOL v95 = 1;
    goto LABEL_16;
  }
  int16x4_t v90 = (int16x4_t)vceq_s32(v88, (int32x2_t)0x100000002);
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v90, v90)) & 0x8000) != 0)
  {
    uint32x2_t v104 = (uint32x2_t)vand_s8((int8x8_t)vadd_s32(v34, (int32x2_t)1), (int8x8_t)0xFFFF0000FFFFLL);
    float32x2_t v105 = vadd_f32((float32x2_t)vorr_s8(vand_s8((int8x8_t)v34, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V2.2S, #1.0 }
    *(float32x2_t *)&long long v102 = vdiv_f32(_D2, v105);
    *((float32x2_t *)&v102 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v105);
    uint32x2_t v107 = vshl_u32(v104, (uint32x2_t)0xFFFFFFFFLL);
    size_t v103 = v107.u32[1];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v155 = 3221225472;
    long long v108 = ___ZN3xdr44dispatch_convert_image_to_gainmap_image_loopILt2ELt1EEEvRKNS_7imageInERKNS_8imageOutES6_RKNS_16colorTransformInES9_RKNS_17colorTransformOutERKNS_16gainTransformOutEDv2_t_block_invoke;
LABEL_13:
    long long v156 = v108;
    long long v157 = &__block_descriptor_108_e8_v16__0Q8l;
    __int16 v167 = v103;
    __int16 v166 = v107.i16[0];
    long long v159 = v147;
    long long v160 = v146;
    goto LABEL_14;
  }
  int32x2_t v91 = (int32x2_t)vand_s8(v87, (int8x8_t)0xFFFF0000FFFFLL);
  int16x4_t v92 = (int16x4_t)vceq_s32(v91, (int32x2_t)0x200000002);
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v92, v92)) & 0x8000) != 0)
  {
    int8x8_t v109 = (int8x8_t)vadd_s32(v34, (int32x2_t)0x100000001);
    float32x2_t v110 = vadd_f32((float32x2_t)vorr_s8(vand_s8((int8x8_t)v34, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V2.2S, #1.0 }
    *(float32x2_t *)&long long v102 = vdiv_f32(_D2, v110);
    *((float32x2_t *)&v102 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v110);
    uint32x2_t v107 = vshr_n_u32((uint32x2_t)vand_s8(v109, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    size_t v103 = v107.u32[1];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v155 = 3221225472;
    long long v108 = ___ZN3xdr44dispatch_convert_image_to_gainmap_image_loopILt2ELt2EEEvRKNS_7imageInERKNS_8imageOutES6_RKNS_16colorTransformInES9_RKNS_17colorTransformOutERKNS_16gainTransformOutEDv2_t_block_invoke;
    goto LABEL_13;
  }
  int16x4_t v93 = (int16x4_t)vceq_s32(v91, (int32x2_t)0x200000004);
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v93, v93)) & 0x8000) != 0)
  {
    int8x8_t v113 = (int8x8_t)vadd_s32(v34, (int32x2_t)0x100000003);
    float32x2_t v114 = vadd_f32((float32x2_t)vorr_s8(vand_s8((int8x8_t)v34, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V3.2S, #1.0 }
    *(float32x2_t *)&long long v116 = vdiv_f32(_D3, v114);
    *((float32x2_t *)&v116 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v114);
    uint32x2_t v117 = vshl_u32((uint32x2_t)vand_s8(v113, (int8x8_t)0xFFFF0000FFFFLL), (uint32x2_t)-2);
    size_t v103 = v117.u32[1];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v155 = 3221225472;
    long long v156 = ___ZN3xdr44dispatch_convert_image_to_gainmap_image_loopILt4ELt2EEEvRKNS_7imageInERKNS_8imageOutES6_RKNS_16colorTransformInES9_RKNS_17colorTransformOutERKNS_16gainTransformOutEDv2_t_block_invoke;
    long long v157 = &__block_descriptor_108_e8_v16__0Q8l;
    __int16 v167 = v117.i16[2];
    __int16 v166 = v117.i16[0];
    long long v159 = v147;
    long long v160 = v146;
    long long v161 = v145;
    uint64_t v162 = v211;
    long long v163 = v188;
    long long v164 = v168;
    long long v165 = v121;
    long long v158 = v116;
    goto LABEL_15;
  }
  int16x4_t v94 = (int16x4_t)vceq_s32((int32x2_t)vand_s8(v87, (int8x8_t)0xFFFF0000FFFFLL), (int32x2_t)0x400000004);
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v94, v94)) & 0x8000) != 0)
  {
    int8x8_t v118 = (int8x8_t)vadd_s32(v34, (int32x2_t)0x300000003);
    float32x2_t v119 = vadd_f32((float32x2_t)vorr_s8(vand_s8((int8x8_t)v34, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V2.2S, #1.0 }
    *(float32x2_t *)&long long v102 = vdiv_f32(_D2, v119);
    *((float32x2_t *)&v102 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v119);
    uint32x2_t v107 = vshr_n_u32((uint32x2_t)vand_s8(v118, (int8x8_t)0xFFFF0000FFFFLL), 2uLL);
    size_t v103 = v107.u32[1];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v155 = 3221225472;
    long long v108 = ___ZN3xdr44dispatch_convert_image_to_gainmap_image_loopILt4ELt4EEEvRKNS_7imageInERKNS_8imageOutES6_RKNS_16colorTransformInES9_RKNS_17colorTransformOutERKNS_16gainTransformOutEDv2_t_block_invoke;
    goto LABEL_13;
  }
  LogError("-[HDRImageConverter_SIMD convertImage:transform:alternate:toImage:transform:gainMap:transform:]", 931, "Unupported subsample factors (%d,%d)", v86.u16[0], v86.u16[1]);
  BOOL v95 = 0;
LABEL_16:
  xdr::ColorBox<HDRColorTransformOut>::~ColorBox(&v136);
  xdr::ColorBox<HDRColorTransformOut>::~ColorBox(&v139);
  xdr::ColorBox<HDRColorTransformOut>::~ColorBox(&v142);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v148);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v150);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v152);
  return v95;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 gainMap:(__CVBuffer *)a6 transform:(id *)a7 alternate:(id *)a8 toImage:(__CVBuffer *)a9 transform:(id *)a10 gainMap:(__CVBuffer *)a11 transform:(id *)a12
{
  uint64_t v282 = *MEMORY[0x1E4F143B8];
  long long v198 = 0u;
  long long v197 = 0u;
  _ZN3xdr8ImageBoxI19HDRPixelTransformInLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE0EEC2EP10__CVBufferRKS1_(&v197, (uint64_t)a3, &a4->var0.var0);
  long long v196 = 0u;
  long long v195 = 0u;
  if (a7->var0.var0) {
    long long v17 = ($7F5F757F935EFDA1B622558C1678222D *)a7;
  }
  else {
    long long v17 = ($7F5F757F935EFDA1B622558C1678222D *)a8;
  }
  _ZN3xdr8ImageBoxI19HDRPixelTransformInLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE0EEC2EP10__CVBufferRKS1_(&v195, (uint64_t)a6, &v17->var0.var0);
  long long v194 = 0u;
  long long v193 = 0u;
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EEC2EP10__CVBufferRKS1_(&v193, (uint64_t)a9, (int *)&a10[2].var0.var1.var1.var5);
  long long v192 = 0u;
  long long v191 = 0u;
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EEC2EP10__CVBufferRKS1_(&v191, (uint64_t)a11, &a12[18].var1.var0);
  v190[0] = v198;
  long long v18 = *(_OWORD *)(*((void *)&v197 + 1) + 32);
  long long v20 = **((_OWORD **)&v197 + 1);
  long long v19 = *(_OWORD *)(*((void *)&v197 + 1) + 16);
  v190[4] = *(_OWORD *)(*((void *)&v197 + 1) + 48);
  v190[3] = v18;
  v190[1] = v20;
  v190[2] = v19;
  long long v21 = *(_OWORD *)(*((void *)&v197 + 1) + 96);
  long long v23 = *(_OWORD *)(*((void *)&v197 + 1) + 64);
  long long v22 = *(_OWORD *)(*((void *)&v197 + 1) + 80);
  v190[8] = *(_OWORD *)(*((void *)&v197 + 1) + 112);
  v190[7] = v21;
  v190[5] = v23;
  v190[6] = v22;
  v189[0] = v196;
  long long v24 = *(_OWORD *)(*((void *)&v195 + 1) + 32);
  long long v26 = **((_OWORD **)&v195 + 1);
  long long v25 = *(_OWORD *)(*((void *)&v195 + 1) + 16);
  v189[4] = *(_OWORD *)(*((void *)&v195 + 1) + 48);
  v189[3] = v24;
  v189[1] = v26;
  v189[2] = v25;
  long long v28 = *(_OWORD *)(*((void *)&v195 + 1) + 64);
  long long v27 = *(_OWORD *)(*((void *)&v195 + 1) + 80);
  long long v29 = *(_OWORD *)(*((void *)&v195 + 1) + 96);
  v189[8] = *(_OWORD *)(*((void *)&v195 + 1) + 112);
  v189[7] = v29;
  v189[5] = v28;
  v189[6] = v27;
  v188[0] = v194;
  long long v30 = *(_OWORD *)(*((void *)&v193 + 1) + 16);
  long long v31 = **((_OWORD **)&v193 + 1);
  v188[3] = *(_OWORD *)(*((void *)&v193 + 1) + 32);
  v188[1] = v31;
  v188[2] = v30;
  long long v33 = *(_OWORD *)(*((void *)&v193 + 1) + 48);
  long long v32 = *(_OWORD *)(*((void *)&v193 + 1) + 64);
  long long v34 = *(_OWORD *)(*((void *)&v193 + 1) + 80);
  v188[7] = *(_OWORD *)(*((void *)&v193 + 1) + 96);
  v188[6] = v34;
  _DWORD v188[4] = v33;
  v188[5] = v32;
  v187[0] = v192;
  long long v35 = *(_OWORD *)(*((void *)&v191 + 1) + 16);
  long long v36 = **((_OWORD **)&v191 + 1);
  v187[3] = *(_OWORD *)(*((void *)&v191 + 1) + 32);
  v187[1] = v36;
  v187[2] = v35;
  long long v38 = *(_OWORD *)(*((void *)&v191 + 1) + 48);
  long long v37 = *(_OWORD *)(*((void *)&v191 + 1) + 64);
  long long v39 = *(_OWORD *)(*((void *)&v191 + 1) + 80);
  v187[7] = *(_OWORD *)(*((void *)&v191 + 1) + 96);
  v187[6] = v39;
  v187[4] = v38;
  v187[5] = v37;
  uint64_t v186 = 0;
  long long v185 = 0u;
  long long v184 = 0u;
  xdr::ColorBox<HDRColorTransformIn>::ColorBox((uint64_t)&v184, &a4->var1.var1.var4.var1.var3);
  long long v40 = *(_OWORD *)&a7[22].var1.var1.var1;
  long long v181 = *(_OWORD *)&a7[21].var1.var0.var0;
  long long v182 = v40;
  long long v183 = *(_OWORD *)&a7[24].var0.var0;
  long long v41 = *(_OWORD *)&a7[17].var1.var0.var0;
  long long v177 = *(_OWORD *)&a7[16].var0.var0;
  long long v178 = v41;
  long long v42 = *(_OWORD *)&a7[18].var1.var1.var1;
  long long v180 = *(_OWORD *)&a7[20].var0.var0;
  long long v179 = v42;
  long long v43 = *(_OWORD *)&a7[12].var0.var0;
  long long v173 = *(_OWORD *)&a7[10].var1.var1.var1;
  long long v174 = v43;
  long long v44 = *(_OWORD *)&a7[13].var1.var0.var0;
  long long v176 = *(_OWORD *)&a7[14].var1.var1.var1;
  long long v175 = v44;
  uint64_t v172 = 0;
  long long v170 = 0u;
  long long v171 = 0u;
  xdr::ColorBox<HDRColorTransformIn>::ColorBox((uint64_t)&v170, &a5->var1.var1.var4.var1.var3);
  long long v45 = *(_OWORD *)&a8[22].var1.var1.var1;
  long long v167 = *(_OWORD *)&a8[21].var1.var0.var0;
  long long v168 = v45;
  long long v169 = *(_OWORD *)&a8[24].var0.var0;
  long long v46 = *(_OWORD *)&a8[17].var1.var0.var0;
  long long v163 = *(_OWORD *)&a8[16].var0.var0;
  long long v164 = v46;
  long long v47 = *(_OWORD *)&a8[20].var0.var0;
  long long v165 = *(_OWORD *)&a8[18].var1.var1.var1;
  long long v166 = v47;
  long long v48 = *(_OWORD *)&a8[12].var0.var0;
  long long v159 = *(_OWORD *)&a8[10].var1.var1.var1;
  long long v160 = v48;
  long long v49 = *(_OWORD *)&a8[14].var1.var1.var1;
  long long v161 = *(_OWORD *)&a8[13].var1.var0.var0;
  long long v162 = v49;
  uint64_t v158 = 0;
  long long v156 = 0u;
  long long v157 = 0u;
  xdr::ColorBox<HDRColorTransformOut>::ColorBox((uint64_t)&v156, a10);
  long long v50 = *(_OWORD *)&a12[12].var0.var0.var0;
  long long v153 = *(_OWORD *)&a12[10].var1.var0;
  long long v154 = v50;
  long long v155 = *(_OWORD *)&a12[13].var0.var1.var1;
  long long v51 = *(_OWORD *)&a12[4].var0.var0.var0;
  long long v52 = *(_OWORD *)&a12[6].var1.var0;
  long long v149 = *(_OWORD *)&a12[5].var0.var1.var1;
  long long v150 = v52;
  long long v53 = *(_OWORD *)&a12[6].var1.var0;
  long long v55 = *(_OWORD *)&a12[9].var0.var1.var1;
  long long v151 = *(_OWORD *)&a12[8].var0.var0.var0;
  int32x2_t v54 = (int32x2_t)v151;
  long long v152 = v55;
  long long v56 = *(_OWORD *)&a12[1].var0.var1.var1;
  v146[11] = *(_OWORD *)&a12->var0.var0.var0;
  v146[12] = v56;
  long long v57 = *(_OWORD *)&a12[4].var0.var0.var0;
  long long v58 = *(_OWORD *)&a12->var0.var0.var0;
  long long v59 = *(_OWORD *)&a12[1].var0.var1.var1;
  long long v147 = *(_OWORD *)&a12[2].var1.var0;
  long long v148 = v57;
  v259[0] = *(_DWORD *)v184;
  long long v60 = *(_OWORD *)(v184 + 16);
  long long v61 = *(_OWORD *)(v184 + 32);
  long long v262 = *(_OWORD *)(v184 + 48);
  long long v261 = v61;
  long long v260 = v60;
  uint64_t v263 = *((void *)&v184 + 1);
  int v264 = *(_DWORD *)(v184 + 80);
  long long v62 = *(_OWORD *)(v184 + 96);
  long long v63 = *(_OWORD *)(v184 + 128);
  long long v266 = *(_OWORD *)(v184 + 112);
  long long v265 = v62;
  long long v64 = *(_OWORD *)(v184 + 160);
  long long v65 = *(_OWORD *)(v184 + 176);
  long long v267 = v63;
  long long v268 = v64;
  long long v66 = *(_OWORD *)(v184 + 192);
  long long v67 = *(_OWORD *)(v184 + 208);
  long long v269 = v65;
  long long v270 = v66;
  long long v271 = v67;
  long long v272 = v185;
  int v273 = *(_DWORD *)(v184 + 224);
  long long v68 = *(_OWORD *)(v184 + 240);
  long long v69 = *(_OWORD *)(v184 + 256);
  long long v276 = *(_OWORD *)(v184 + 272);
  long long v275 = v69;
  long long v274 = v68;
  uint64_t v277 = v186;
  long long v70 = *(_OWORD *)(v184 + 304);
  long long v71 = *(_OWORD *)(v184 + 320);
  long long v72 = *(_OWORD *)(v184 + 336);
  long long v281 = *(_OWORD *)(v184 + 352);
  long long v280 = v72;
  long long v279 = v71;
  long long v278 = v70;
  v146[4] = v177;
  v146[5] = v178;
  v146[0] = v173;
  v146[1] = v174;
  v146[2] = v175;
  v146[3] = v176;
  v146[9] = v182;
  v146[10] = v183;
  v146[7] = v180;
  _OWORD v146[8] = v181;
  v146[6] = v179;
  v236[0] = *(_DWORD *)v170;
  long long v73 = *(_OWORD *)(v170 + 16);
  long long v74 = *(_OWORD *)(v170 + 32);
  long long v239 = *(_OWORD *)(v170 + 48);
  long long v238 = v74;
  long long v237 = v73;
  uint64_t v240 = *((void *)&v170 + 1);
  int v241 = *(_DWORD *)(v170 + 80);
  long long v76 = *(_OWORD *)(v170 + 112);
  long long v75 = *(_OWORD *)(v170 + 128);
  long long v242 = *(_OWORD *)(v170 + 96);
  long long v243 = v76;
  long long v77 = *(_OWORD *)(v170 + 160);
  long long v78 = *(_OWORD *)(v170 + 176);
  long long v244 = v75;
  long long v245 = v77;
  long long v79 = *(_OWORD *)(v170 + 192);
  long long v80 = *(_OWORD *)(v170 + 208);
  long long v246 = v78;
  long long v247 = v79;
  long long v248 = v80;
  long long v249 = v171;
  int v250 = *(_DWORD *)(v170 + 224);
  long long v81 = *(_OWORD *)(v170 + 240);
  long long v82 = *(_OWORD *)(v170 + 256);
  long long v253 = *(_OWORD *)(v170 + 272);
  long long v252 = v82;
  long long v251 = v81;
  uint64_t v254 = v172;
  long long v83 = *(_OWORD *)(v170 + 304);
  long long v84 = *(_OWORD *)(v170 + 320);
  long long v85 = *(_OWORD *)(v170 + 336);
  long long v258 = *(_OWORD *)(v170 + 352);
  long long v257 = v85;
  long long v256 = v84;
  long long v255 = v83;
  v145[4] = v163;
  v145[5] = v164;
  v145[0] = v159;
  v145[1] = v160;
  v145[2] = v161;
  v145[3] = v162;
  v145[9] = v168;
  v145[10] = v169;
  v145[7] = v166;
  _OWORD v145[8] = v167;
  v145[6] = v165;
  long long v86 = *(_OWORD *)v156;
  long long v87 = *(_OWORD *)(v156 + 16);
  long long v88 = *(_OWORD *)(v156 + 32);
  v216[3] = *(_OWORD *)(v156 + 48);
  v216[2] = v88;
  v216[1] = v87;
  v216[0] = v86;
  int v89 = *(_DWORD *)(v156 + 64);
  long long v90 = *(_OWORD *)(v156 + 80);
  long long v91 = *(_OWORD *)(v156 + 112);
  long long v219 = *(_OWORD *)(v156 + 96);
  long long v218 = v90;
  long long v92 = *(_OWORD *)(v156 + 144);
  long long v93 = *(_OWORD *)(v156 + 160);
  long long v220 = v91;
  long long v221 = v92;
  long long v94 = *(_OWORD *)(v156 + 176);
  long long v95 = *(_OWORD *)(v156 + 192);
  long long v222 = v93;
  long long v223 = v94;
  long long v224 = v95;
  long long v225 = v157;
  int v96 = *(_DWORD *)(v156 + 208);
  long long v97 = *(_OWORD *)(v156 + 224);
  long long v98 = *(_OWORD *)(v156 + 240);
  long long v229 = *(_OWORD *)(v156 + 256);
  long long v228 = v98;
  long long v227 = v97;
  long long v99 = *(_OWORD *)(v156 + 304);
  long long v100 = *(_OWORD *)(v156 + 320);
  int v101 = *(_DWORD *)(v156 + 288);
  long long v234 = *(_OWORD *)(v156 + 336);
  int v217 = v89;
  long long v233 = v100;
  long long v232 = v99;
  *(void *)&long long v99 = *(void *)&a12[14].var1.var0;
  v141[4] = v149;
  v141[5] = v53;
  long long v102 = *(_OWORD *)&a12[16].var0.var0.var0;
  int v226 = v96;
  uint64_t v230 = v158;
  LOBYTE(v89) = a12[17].var0.var1.var1;
  int v231 = v101;
  uint64_t v235 = *((void *)&v156 + 1);
  v141[0] = v58;
  v141[1] = v59;
  v141[2] = v147;
  v141[3] = v51;
  v141[9] = v154;
  v141[10] = v155;
  v141[7] = v152;
  v141[8] = v153;
  v141[6] = v151;
  uint64_t v142 = v99;
  long long v143 = v102;
  char v144 = v89;
  if ((void)v194)
  {
    v54.i16[0] = *(_WORD *)(v194 + 12);
    v54.i16[2] = *(_WORD *)(v194 + 14);
  }
  else
  {
    int32x2_t v54 = 0;
  }
  uint16x4_t v103 = *(uint16x4_t *)&a10[2].var0.var2.var1.var3;
  uint16x4_t v104 = *(uint16x4_t *)&a12[26].var1.var0;
  v103.i16[3] = 0;
  v104.i16[3] = 0;
  int16x4_t v105 = (int16x4_t)vmax_u16(v103, v104);
  uint16x4_t v106 = vmax_u16((uint16x4_t)vdup_lane_s16(v105, 0).u32[0], (uint16x4_t)vext_s8((int8x8_t)v105, (int8x8_t)v54, 2uLL).u32[0]);
  int8x8_t v107 = (int8x8_t)vmovl_u16(v106).u64[0];
  int32x2_t v108 = (int32x2_t)vand_s8(v107, (int8x8_t)0xFFFF0000FFFFLL);
  int16x4_t v109 = (int16x4_t)vceq_s32(v108, (int32x2_t)0x100000001);
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v109, v109)) & 0x8000) != 0)
  {
    float32x2_t v116 = vadd_f32((float32x2_t)vorr_s8(vand_s8((int8x8_t)v54, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V2.2S, #1.0 }
    *(float32x2_t *)&long long v122 = vdiv_f32(_D2, v116);
    *((float32x2_t *)&v122 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v116);
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v200 = 3221225472;
    long long v201 = ___ZN3xdr52dispatch_convert_gainmap_image_to_gainmap_image_loopILt1ELt1EEEvRKNS_7imageInES3_RKNS_8imageOutES6_RKNS_16colorTransformInERKNS_15gainTransformInES9_SC_RKNS_17colorTransformOutERKNS_16gainTransformOutEDv2_t_block_invoke;
    int v202 = &__block_descriptor_132_e8_v16__0Q8l;
    __int16 v215 = v54.i16[2];
    __int16 v214 = v54.i16[0];
    long long v204 = v190;
    long long v205 = v189;
    size_t v123 = v54.u16[2];
LABEL_17:
    uint64_t v206 = v188;
    long long v207 = v187;
    long long v208 = v259;
    long long v209 = v146;
    long long v210 = v236;
    v211 = v145;
    long long v212 = v216;
    long long v213 = v141;
    long long v203 = v122;
LABEL_18:
    dispatch_apply(v123, 0, &block);
    BOOL v115 = 1;
    goto LABEL_19;
  }
  int16x4_t v110 = (int16x4_t)vceq_s32(v108, (int32x2_t)0x100000002);
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v110, v110)) & 0x8000) != 0)
  {
    uint32x2_t v124 = (uint32x2_t)vand_s8((int8x8_t)vadd_s32(v54, (int32x2_t)1), (int8x8_t)0xFFFF0000FFFFLL);
    float32x2_t v125 = vadd_f32((float32x2_t)vorr_s8(vand_s8((int8x8_t)v54, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V2.2S, #1.0 }
    *(float32x2_t *)&long long v122 = vdiv_f32(_D2, v125);
    *((float32x2_t *)&v122 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v125);
    uint32x2_t v127 = vshl_u32(v124, (uint32x2_t)0xFFFFFFFFLL);
    size_t v123 = v127.u32[1];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v200 = 3221225472;
    long long v128 = ___ZN3xdr52dispatch_convert_gainmap_image_to_gainmap_image_loopILt2ELt1EEEvRKNS_7imageInES3_RKNS_8imageOutES6_RKNS_16colorTransformInERKNS_15gainTransformInES9_SC_RKNS_17colorTransformOutERKNS_16gainTransformOutEDv2_t_block_invoke;
LABEL_16:
    long long v201 = v128;
    int v202 = &__block_descriptor_132_e8_v16__0Q8l;
    __int16 v215 = v123;
    __int16 v214 = v127.i16[0];
    long long v204 = v190;
    long long v205 = v189;
    goto LABEL_17;
  }
  int32x2_t v111 = (int32x2_t)vand_s8(v107, (int8x8_t)0xFFFF0000FFFFLL);
  int16x4_t v112 = (int16x4_t)vceq_s32(v111, (int32x2_t)0x200000002);
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v112, v112)) & 0x8000) != 0)
  {
    int8x8_t v129 = (int8x8_t)vadd_s32(v54, (int32x2_t)0x100000001);
    float32x2_t v130 = vadd_f32((float32x2_t)vorr_s8(vand_s8((int8x8_t)v54, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V2.2S, #1.0 }
    *(float32x2_t *)&long long v122 = vdiv_f32(_D2, v130);
    *((float32x2_t *)&v122 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v130);
    uint32x2_t v127 = vshr_n_u32((uint32x2_t)vand_s8(v129, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    size_t v123 = v127.u32[1];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v200 = 3221225472;
    long long v128 = ___ZN3xdr52dispatch_convert_gainmap_image_to_gainmap_image_loopILt2ELt2EEEvRKNS_7imageInES3_RKNS_8imageOutES6_RKNS_16colorTransformInERKNS_15gainTransformInES9_SC_RKNS_17colorTransformOutERKNS_16gainTransformOutEDv2_t_block_invoke;
    goto LABEL_16;
  }
  int16x4_t v113 = (int16x4_t)vceq_s32(v111, (int32x2_t)0x200000004);
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v113, v113)) & 0x8000) != 0)
  {
    int8x8_t v133 = (int8x8_t)vadd_s32(v54, (int32x2_t)0x100000003);
    float32x2_t v134 = vadd_f32((float32x2_t)vorr_s8(vand_s8((int8x8_t)v54, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V3.2S, #1.0 }
    *(float32x2_t *)&long long v136 = vdiv_f32(_D3, v134);
    *((float32x2_t *)&v136 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v134);
    uint32x2_t v137 = vshl_u32((uint32x2_t)vand_s8(v133, (int8x8_t)0xFFFF0000FFFFLL), (uint32x2_t)-2);
    size_t v123 = v137.u32[1];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v200 = 3221225472;
    long long v201 = ___ZN3xdr52dispatch_convert_gainmap_image_to_gainmap_image_loopILt4ELt2EEEvRKNS_7imageInES3_RKNS_8imageOutES6_RKNS_16colorTransformInERKNS_15gainTransformInES9_SC_RKNS_17colorTransformOutERKNS_16gainTransformOutEDv2_t_block_invoke;
    int v202 = &__block_descriptor_132_e8_v16__0Q8l;
    __int16 v215 = v137.i16[2];
    __int16 v214 = v137.i16[0];
    long long v204 = v190;
    long long v205 = v189;
    uint64_t v206 = v188;
    long long v207 = v187;
    long long v208 = v259;
    long long v209 = v146;
    long long v210 = v236;
    v211 = v145;
    long long v212 = v216;
    long long v213 = v141;
    long long v203 = v136;
    goto LABEL_18;
  }
  int16x4_t v114 = (int16x4_t)vceq_s32((int32x2_t)vand_s8(v107, (int8x8_t)0xFFFF0000FFFFLL), (int32x2_t)0x400000004);
  if ((vminv_u16((uint16x4_t)vuzp1_s16(v114, v114)) & 0x8000) != 0)
  {
    int8x8_t v138 = (int8x8_t)vadd_s32(v54, (int32x2_t)0x300000003);
    float32x2_t v139 = vadd_f32((float32x2_t)vorr_s8(vand_s8((int8x8_t)v54, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
    __asm { FMOV            V2.2S, #1.0 }
    *(float32x2_t *)&long long v122 = vdiv_f32(_D2, v139);
    *((float32x2_t *)&v122 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v139);
    uint32x2_t v127 = vshr_n_u32((uint32x2_t)vand_s8(v138, (int8x8_t)0xFFFF0000FFFFLL), 2uLL);
    size_t v123 = v127.u32[1];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v200 = 3221225472;
    long long v128 = ___ZN3xdr52dispatch_convert_gainmap_image_to_gainmap_image_loopILt4ELt4EEEvRKNS_7imageInES3_RKNS_8imageOutES6_RKNS_16colorTransformInERKNS_15gainTransformInES9_SC_RKNS_17colorTransformOutERKNS_16gainTransformOutEDv2_t_block_invoke;
    goto LABEL_16;
  }
  LogError("-[HDRImageConverter_SIMD convertImage:transform:alternate:gainMap:transform:alternate:toImage:transform:gainMap:transform:]", 990, "Unupported subsample factors (%d,%d)", v106.u16[0], v106.u16[1]);
  BOOL v115 = 0;
LABEL_19:
  xdr::ColorBox<HDRColorTransformOut>::~ColorBox(&v156);
  xdr::ColorBox<HDRColorTransformOut>::~ColorBox(&v170);
  xdr::ColorBox<HDRColorTransformOut>::~ColorBox(&v184);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v191);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v193);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v195);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v197);
  return v115;
}

- (BOOL)computeLumaGainHistogram:(id *)a3 scale:(__CVBuffer *)a4 image:(id *)a5 transform:(__CVBuffer *)a6 gainMap:(id *)a7 transform:
{
  uint16x4_t v11 = v7;
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  long long v69 = 0u;
  long long v70 = 0u;
  _ZN3xdr8ImageBoxI19HDRPixelTransformInLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE0EEC2EP10__CVBufferRKS1_(&v69, (uint64_t)a4, &a5->var0.var0);
  long long v67 = 0u;
  long long v68 = 0u;
  _ZN3xdr8ImageBoxI19HDRPixelTransformInLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE0EEC2EP10__CVBufferRKS1_(&v67, (uint64_t)a6, &a7->var0.var0);
  v66[0] = v70;
  long long v13 = *(_OWORD *)(*((void *)&v69 + 1) + 48);
  long long v15 = **((_OWORD **)&v69 + 1);
  long long v14 = *(_OWORD *)(*((void *)&v69 + 1) + 16);
  v66[3] = *(_OWORD *)(*((void *)&v69 + 1) + 32);
  v66[4] = v13;
  v66[1] = v15;
  v66[2] = v14;
  long long v16 = *(_OWORD *)(*((void *)&v69 + 1) + 112);
  long long v18 = *(_OWORD *)(*((void *)&v69 + 1) + 64);
  long long v17 = *(_OWORD *)(*((void *)&v69 + 1) + 80);
  v66[7] = *(_OWORD *)(*((void *)&v69 + 1) + 96);
  v66[8] = v16;
  v66[5] = v18;
  v66[6] = v17;
  v65[0] = v68;
  long long v19 = *(_OWORD *)(*((void *)&v67 + 1) + 48);
  long long v21 = **((_OWORD **)&v67 + 1);
  long long v20 = *(_OWORD *)(*((void *)&v67 + 1) + 16);
  v65[3] = *(_OWORD *)(*((void *)&v67 + 1) + 32);
  v65[4] = v19;
  v65[1] = v21;
  v65[2] = v20;
  long long v23 = *(_OWORD *)(*((void *)&v67 + 1) + 64);
  long long v22 = *(_OWORD *)(*((void *)&v67 + 1) + 80);
  long long v24 = *(_OWORD *)(*((void *)&v67 + 1) + 112);
  v65[7] = *(_OWORD *)(*((void *)&v67 + 1) + 96);
  v65[8] = v24;
  v65[5] = v23;
  v65[6] = v22;
  uint64_t v64 = 0;
  long long v62 = 0u;
  long long v63 = 0u;
  xdr::ColorBox<HDRColorTransformIn>::ColorBox((uint64_t)&v62, &a5->var1.var1.var4.var1.var3);
  long long v25 = *(_OWORD *)&a7[22].var1.var1.var1;
  uint32x4_t v59 = *(uint32x4_t *)&a7[21].var1.var0.var0;
  long long v60 = v25;
  long long v61 = *(_OWORD *)&a7[24].var0.var0;
  long long v26 = *(_OWORD *)&a7[14].var1.var1.var1;
  long long v27 = *(_OWORD *)&a7[17].var1.var0.var0;
  long long v55 = *(_OWORD *)&a7[16].var0.var0;
  long long v56 = v27;
  long long v28 = *(_OWORD *)&a7[17].var1.var0.var0;
  long long v29 = *(_OWORD *)&a7[20].var0.var0;
  long long v57 = *(_OWORD *)&a7[18].var1.var1.var1;
  long long v58 = v29;
  long long v30 = *(_OWORD *)&a7[12].var0.var0;
  v52[11] = *(_OWORD *)&a7[10].var1.var1.var1;
  v52[12] = v30;
  long long v31 = *(_OWORD *)&a7[14].var1.var1.var1;
  long long v33 = *(_OWORD *)&a7[10].var1.var1.var1;
  long long v32 = *(_OWORD *)&a7[12].var0.var0;
  long long v53 = *(_OWORD *)&a7[13].var1.var0.var0;
  long long v54 = v31;
  int v34 = *(_DWORD *)v62;
  long long v35 = *(_OWORD *)(v62 + 16);
  long long v36 = *(_OWORD *)(v62 + 48);
  long long v73 = *(_OWORD *)(v62 + 32);
  long long v74 = v36;
  long long v72 = v35;
  int v37 = *(_DWORD *)(v62 + 80);
  long long v38 = *(_OWORD *)(v62 + 112);
  long long v39 = *(_OWORD *)(v62 + 128);
  long long v77 = *(_OWORD *)(v62 + 96);
  long long v78 = v38;
  long long v40 = *(_OWORD *)(v62 + 160);
  long long v41 = *(_OWORD *)(v62 + 176);
  long long v79 = v39;
  long long v80 = v40;
  long long v42 = *(_OWORD *)(v62 + 192);
  long long v43 = *(_OWORD *)(v62 + 208);
  long long v81 = v41;
  long long v82 = v42;
  long long v83 = v43;
  long long v84 = v63;
  int v44 = *(_DWORD *)(v62 + 224);
  long long v45 = *(_OWORD *)(v62 + 240);
  long long v46 = *(_OWORD *)(v62 + 272);
  long long v87 = *(_OWORD *)(v62 + 256);
  long long v88 = v46;
  long long v86 = v45;
  long long v47 = *(_OWORD *)(v62 + 304);
  long long v48 = *(_OWORD *)(v62 + 320);
  long long v49 = *(_OWORD *)(v62 + 336);
  long long v93 = *(_OWORD *)(v62 + 352);
  long long v92 = v49;
  long long v91 = v48;
  long long v90 = v47;
  v52[4] = v55;
  v52[5] = v28;
  v71[0] = v34;
  uint64_t v75 = *((void *)&v62 + 1);
  int v76 = v37;
  int v85 = v44;
  uint64_t v89 = v64;
  v52[0] = v33;
  v52[1] = v32;
  v52[2] = v53;
  v52[3] = v26;
  v52[9] = v60;
  v52[10] = v61;
  v52[7] = v58;
  v52[8] = v59;
  v52[6] = v57;
  if ((void)v70) {
    __int32 v50 = *(_DWORD *)(v70 + 12);
  }
  else {
    __int32 v50 = 0;
  }
  xdr::dispatch_compute_luma_gain_histogram<(unsigned short)2,(unsigned short)2,(unsigned short)4>((uint64_t)v66, (uint64_t)v65, (uint64_t)v71, (uint64_t)v52, (uint64_t)a3, v50, v11, *(double *)&v58, v59);
  xdr::ColorBox<HDRColorTransformOut>::~ColorBox(&v62);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v67);
  _ZN3xdr8ImageBoxI20HDRPixelTransformOutLNS_7TextureIDv2_tDv2_fDv2_iE10AccessModeE1EED2Ev((uint64_t)&v69);
  return 1;
}

@end