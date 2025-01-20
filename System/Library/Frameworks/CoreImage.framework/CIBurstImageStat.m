@interface CIBurstImageStat
- (BOOL)AEStable;
- (BOOL)AFStable;
- (BOOL)doLimitedSharpnessAndBlur;
- (BOOL)emotionallyRejected;
- (BOOL)exclude;
- (BOOL)hasRegistrationData;
- (BOOL)isGarbage;
- (CGRect)facesRoiRect;
- (CIBurstImageStat)initWithIdentifier:(id)a3;
- (GridROI_t)getSharpnessAndBlurLimits;
- (NSMutableArray)faceStatArray;
- (NSString)imageId;
- (__IOSurface)fullsizeJpegData;
- (double)timeReceived;
- (double)timestamp;
- (float)actionClusteringScore;
- (float)actionScore;
- (float)avgHorzDiffY;
- (float)blurExtent;
- (float)colorHistogram;
- (float)computeAEMatrixDifference:(id)a3;
- (float)computeFacialFocusScoreSum;
- (float)computeImageDistance:(id)a3;
- (float)computeRuleOfThreeDistance;
- (float)computeScore:(float)a3;
- (float)computeSmilePercentage;
- (float)computeSmoothedGridROI:(id)a3 nextStat:(id)a4;
- (float)imageScore;
- (float)maxSkewness;
- (float)registrationErrorIntegral;
- (float)registrationErrorX;
- (float)registrationErrorY;
- (float)roiSize;
- (float)tx;
- (float)ty;
- (int)AEAverage;
- (int)AEDelta;
- (int)AETarget;
- (int)canRegister;
- (int)fullsizeJpegSize;
- (int)numHWFaces;
- (int)orientation;
- (int)setAEMatrix:(id)a3;
- (int)temporalOrder;
- (int)version;
- (int64_t)compareImageOrder:(id)a3;
- (int64_t)compareImageStats:(id)a3;
- (unsigned)aeMatrix;
- (void)allocateMeanStdPingPongBuffers:(float *)a3 :(float *)a4 :(float *)a5 :(float *)a6;
- (void)assignMeanStdBuffers:(float *)a3;
- (void)collapseSharpnessGrid;
- (void)computeAEMatrix:(id)a3;
- (void)computeBlurStatsOnGrid:(id)a3;
- (void)computeImageColorHistogram:(id)a3;
- (void)computeImageData:(id)a3 faceIDCounts:(id)a4;
- (void)computeImageProjections:(id)a3;
- (void)computeImageSharpnessOnGrid:(id)a3;
- (void)dealloc;
- (void)flagAsGarbage;
- (void)performRegistration:(id)a3 deltaCol:(float *)a4 deltaRow:(float *)a5;
- (void)setAEAverage:(int)a3;
- (void)setAEDelta:(int)a3;
- (void)setAEStable:(BOOL)a3;
- (void)setAETarget:(int)a3;
- (void)setAFStable:(BOOL)a3;
- (void)setActionClusteringScore:(float)a3;
- (void)setActionScore:(float)a3;
- (void)setAvgHorzDiffY:(float)a3;
- (void)setBlurExtent:(float)a3;
- (void)setDoLimitedSharpnessAndBlur:(BOOL)a3;
- (void)setEmotionallyRejected:(BOOL)a3;
- (void)setExclude:(BOOL)a3;
- (void)setFaceStatArray:(id)a3;
- (void)setFacesRoiRect:(CGRect)a3;
- (void)setFullsizeJpegData:(__IOSurface *)a3;
- (void)setFullsizeJpegSize:(int)a3;
- (void)setHasRegistrationData:(BOOL)a3;
- (void)setImageId:(id)a3;
- (void)setImageScore:(float)a3;
- (void)setIsGarbage:(BOOL)a3;
- (void)setMaxSkewness:(float)a3;
- (void)setNumHWFaces:(int)a3;
- (void)setOrientation:(int)a3;
- (void)setRegistrationErrorIntegral:(float)a3;
- (void)setRegistrationErrorX:(float)a3;
- (void)setRegistrationErrorY:(float)a3;
- (void)setRoiSize:(float)a3;
- (void)setTemporalOrder:(int)a3;
- (void)setTimeReceived:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setTx:(float)a3;
- (void)setTy:(float)a3;
- (void)setVersion:(int)a3;
- (void)updateROI:(GridROI_t)a3;
- (void)writeGridROI:(id)a3;
@end

@implementation CIBurstImageStat

- (void)allocateMeanStdPingPongBuffers:(float *)a3 :(float *)a4 :(float *)a5 :(float *)a6
{
  if (a3)
  {
    if (a4)
    {
      *a3 = 0;
      *a4 = 0;
      if (self->projectionSignature.piCol)
      {
        if (self->projectionSignature.piRow)
        {
          signed int v10 = (4 * LODWORD(self->projectionSignature.nPiCol) + 35) & 0xFFFFFFE0;
          unsigned int v11 = ((4 * LODWORD(self->projectionSignature.nPiRow) + 35) & 0xFFFFFFE0) + v10;
          v12 = (float *)malloc_type_calloc(1uLL, (int)(5 * v11), 0x6B5AA37BuLL);
          if (v12)
          {
            *a3 = v12;
            v13 = (float *)((char *)v12 + (int)(2 * v11));
            *a4 = v13;
            v14 = (float *)((char *)v13 + (int)(2 * v11));
            *a5 = v14;
            *a6 = (float *)((char *)v14 + v10);
          }
        }
      }
    }
  }
}

- (void)assignMeanStdBuffers:(float *)a3
{
  if (a3)
  {
    piCol = self->projectionSignature.piCol;
    if (piCol)
    {
      if (self->projectionSignature.piRow)
      {
        int nPiCol = self->projectionSignature.nPiCol;
        signed int v6 = (4 * LODWORD(self->projectionSignature.nPiRow) + 35) & 0xFFFFFFE0;
        self->projectionSignature.piRowTable.sumTable = a3;
        v7 = (float *)((char *)a3 + v6);
        self->projectionSignature.piRowTable.sumSqTable = v7;
        v8 = (float *)((char *)v7 + v6);
        self->projectionSignature.piColTable.sumTable = v8;
        self->projectionSignature.piColTable.sumSqTable = (float *)((char *)v8 + (int)((4 * nPiCol + 35) & 0xFFFFFFE0));
        Projections_computeMeanStdTable(piCol, nPiCol, &self->projectionSignature.piColTable.sumTable);
        piRow = self->projectionSignature.piRow;
        int nPiRow = self->projectionSignature.nPiRow;
        Projections_computeMeanStdTable(piRow, nPiRow, &self->projectionSignature.piRowTable.sumTable);
      }
    }
  }
}

- (CIBurstImageStat)initWithIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CIBurstImageStat;
  v4 = [(CIBurstImageStat *)&v6 init];
  if (v4)
  {
    v4->imageId = (NSString *)(id)[NSString stringWithString:a3];
    v4->faceStatArray = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    v4->orientation = 1;
    v4->sharpnessGrid = 0;
    v4->maxSkewness = 0.0;
    v4->hasRegistrationData = 0;
    *(_OWORD *)&v4->timestamp = 0u;
    [(CIBurstImageStat *)v4 setFullsizeJpegData:0];
  }
  return v4;
}

- (void)dealloc
{
  imageId = self->imageId;
  if (imageId)
  {

    self->imageId = 0;
  }
  faceStatArray = self->faceStatArray;
  if (faceStatArray)
  {

    self->faceStatArray = 0;
  }
  sharpnessGrid = self->sharpnessGrid;
  if (sharpnessGrid) {
    free(sharpnessGrid);
  }
  projectionMemoryBlock = self->projectionMemoryBlock;
  if (projectionMemoryBlock) {
    free(projectionMemoryBlock);
  }
  v7.receiver = self;
  v7.super_class = (Class)CIBurstImageStat;
  [(CIBurstImageStat *)&v7 dealloc];
}

- (void)computeImageColorHistogram:(id)a3
{
  int v5 = [a3 bytesPerRow];
  int v6 = (int)[a3 width] >> 1;
  int v7 = (int)[a3 height] >> 1;
  self->numEntries = 0;
  colorHistogram = self->colorHistogram;
  bzero(self->colorHistogram, 0x1000uLL);
  int v9 = (int)((float)v6 * 0.05);
  uint64_t v10 = [a3 Cbuffer];
  int v12 = v7 - v9;
  if (v7 - v9 > v9)
  {
    double v11 = (float)v7 * 0.05;
    int v13 = (int)v11;
    uint64_t v14 = v10 + v5 * (uint64_t)v9 + 2 * (int)v11;
    do
    {
      if (v6 - (int)v11 > v13)
      {
        uint64_t v15 = 0;
        int v16 = self->numEntries + 1;
        int v17 = v6 - 2 * v13;
        do
        {
          int v18 = scaledBins[*(unsigned __int8 *)(v14 + v15)] + 32 * scaledBins[*(unsigned __int8 *)(v14 + v15 + 1)];
          colorHistogram[v18] = colorHistogram[v18] + 1.0;
          self->numEntries = v16++;
          v15 += 2;
          --v17;
        }
        while (v17);
      }
      ++v9;
      v14 += v5;
    }
    while (v9 != v12);
  }
  uint64_t v19 = 0;
  *(float *)&double v11 = (float)self->numEntries;
  float32x4_t v20 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v11, 0);
  do
  {
    *(float32x4_t *)&colorHistogram[v19] = vdivq_f32(*(float32x4_t *)&colorHistogram[v19], v20);
    v19 += 4;
  }
  while (v19 != 1024);
}

- (GridROI_t)getSharpnessAndBlurLimits
{
  uint64_t v2 = *(void *)&self->gridWidth;
  uint64_t v3 = 0;
  result.endX = v2;
  result.endY = HIDWORD(v2);
  result.startX = v3;
  result.startY = HIDWORD(v3);
  return result;
}

- (void)computeImageSharpnessOnGrid:(id)a3
{
  uint64_t v19 = [a3 Ybuffer];
  unint64_t v5 = [(CIBurstImageStat *)self getSharpnessAndBlurLimits];
  unint64_t v7 = HIDWORD(v5);
  unint64_t v8 = HIDWORD(v6);
  if (SHIDWORD(v5) < SHIDWORD(v6))
  {
    int v9 = v5;
    int v10 = v6;
    int v18 = v6 - v5;
    uint64_t v11 = (int)v5;
    do
    {
      int v12 = [a3 bytesPerRow];
      if (v10 > v9)
      {
        int v13 = (int8x16_t *)(v19 + 32 * (int)v7 * v12);
        sharpnessGrid = self->sharpnessGrid;
        uint64_t v15 = v11;
        int v16 = v18;
        do
        {
          if (!sharpnessGrid) {
            break;
          }
          float v17 = (float)(int)horzDiff32x32(v13, [a3 bytesPerRow], 32);
          sharpnessGrid = self->sharpnessGrid;
          sharpnessGrid[v15 + self->gridWidth * (uint64_t)(int)v7].var2 = v17;
          v13 += 2;
          ++v15;
          --v16;
        }
        while (v16);
      }
      LODWORD(v7) = v7 + 1;
    }
    while (v7 != v8);
  }
}

- (void)computeBlurStatsOnGrid:(id)a3
{
  v152[124] = *MEMORY[0x1E4F143B8];
  int v5 = [a3 bytesPerRow];
  uint64_t v140 = [a3 Ybuffer];
  unint64_t v6 = [(CIBurstImageStat *)self getSharpnessAndBlurLimits];
  int v145 = v9;
  unint64_t v146 = HIDWORD(v6);
  unint64_t v142 = HIDWORD(v9);
  int v143 = v6;
  if (SHIDWORD(v6) < SHIDWORD(v9))
  {
    int v141 = 32 * v5;
    uint64_t v10 = 8 * v5;
    uint64_t v139 = v140 - v5 + 8 * v5;
    int v144 = 32 * v5 * HIDWORD(v6);
    uint64_t v137 = v140 + 5 * v5;
    uint64_t v138 = v140 + 6 * v5;
    uint64_t v135 = v140 + 3 * v5;
    uint64_t v136 = v140 + 4 * v5;
    uint64_t v133 = v140 + v5;
    uint64_t v134 = v140 + 2 * v5;
    do
    {
      if (v143 < v145)
      {
        uint64_t v11 = 0;
        int v12 = v143;
        do
        {
          unsigned int v13 = 0;
          int v147 = v12;
          sharpnessGrid = self->sharpnessGrid;
          int v15 = v12 + self->gridWidth * v146;
          int v16 = (int32x4_t *)v149;
          uint64_t v148 = v11;
          do
          {
            char v17 = 1;
            uint64_t v18 = v11;
            uint64_t v19 = v16;
            do
            {
              uint8x16_t v20 = *(uint8x16_t *)(v140 + v144 + v18);
              uint8x16_t v21 = *(uint8x16_t *)(v133 + v144 + v18);
              int16x8_t v22 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v21.i8, *(uint8x8_t *)v20.i8);
              uint8x16_t v23 = *(uint8x16_t *)(v134 + v144 + v18);
              int16x8_t v24 = (int16x8_t)vaddl_high_u8(v21, v20);
              uint8x16_t v25 = *(uint8x16_t *)(v135 + v144 + v18);
              int16x8_t v26 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v25.i8, *(uint8x8_t *)v23.i8);
              uint8x16_t v27 = *(uint8x16_t *)(v136 + v144 + v18);
              int16x8_t v28 = (int16x8_t)vaddl_high_u8(v25, v23);
              uint8x16_t v29 = *(uint8x16_t *)(v137 + v144 + v18);
              int16x8_t v30 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v29.i8, *(uint8x8_t *)v27.i8);
              uint8x16_t v31 = *(uint8x16_t *)(v138 + v144 + v18);
              int16x8_t v32 = (int16x8_t)vaddl_high_u8(v29, v27);
              uint8x16_t v33 = *(uint8x16_t *)(v139 + v144 + v18);
              int16x8_t v34 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v33.i8, *(uint8x8_t *)v31.i8);
              int16x8_t v35 = (int16x8_t)vaddl_high_u8(v33, v31);
              int16x8_t v36 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v20.i8, *(uint8x8_t *)v21.i8);
              int16x8_t v37 = (int16x8_t)vsubl_high_u8(v20, v21);
              int16x8_t v38 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v23.i8, *(uint8x8_t *)v25.i8);
              int16x8_t v39 = (int16x8_t)vsubl_high_u8(v23, v25);
              int16x8_t v40 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v27.i8, *(uint8x8_t *)v29.i8);
              int16x8_t v41 = (int16x8_t)vsubl_high_u8(v27, v29);
              int16x8_t v42 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v31.i8, *(uint8x8_t *)v33.i8);
              int16x8_t v43 = (int16x8_t)vsubl_high_u8(v31, v33);
              int16x8_t v44 = vaddq_s16(v26, v22);
              int16x8_t v45 = vaddq_s16(v28, v24);
              int16x8_t v46 = vaddq_s16(v34, v30);
              int16x8_t v47 = vaddq_s16(v35, v32);
              int16x8_t v48 = vsubq_s16(v22, v26);
              int16x8_t v49 = vsubq_s16(v24, v28);
              int16x8_t v50 = vsubq_s16(v30, v34);
              int16x8_t v51 = vsubq_s16(v32, v35);
              int16x8_t v52 = vaddq_s16(v46, v44);
              int16x8_t v53 = vaddq_s16(v47, v45);
              int16x8_t v54 = vsubq_s16(v44, v46);
              int16x8_t v55 = vsubq_s16(v45, v47);
              int16x8_t v56 = vuzp1q_s16(v52, v54);
              int16x8_t v57 = vuzp1q_s16(v48, v50);
              int16x8_t v58 = vuzp2q_s16(v48, v50);
              int16x8_t v59 = vuzp1q_s16(v36, v38);
              int16x8_t v60 = vuzp2q_s16(v36, v38);
              int16x8_t v61 = vuzp2q_s16(v52, v54);
              int16x8_t v62 = vuzp1q_s16(v40, v42);
              int16x8_t v63 = vuzp2q_s16(v40, v42);
              int16x8_t v64 = vaddq_s16(v57, v58);
              int16x8_t v65 = vaddq_s16(v59, v60);
              int16x8_t v66 = vaddq_s16(v62, v63);
              int16x8_t v67 = vaddq_s16(v56, v61);
              int8x16_t v68 = (int8x16_t)vsubq_s16(v56, v61);
              int8x16_t v69 = (int8x16_t)vsubq_s16(v57, v58);
              int8x16_t v70 = (int8x16_t)vsubq_s16(v59, v60);
              int8x16_t v71 = (int8x16_t)vsubq_s16(v62, v63);
              int16x8_t v72 = vuzp1q_s16(v67, v64);
              int16x8_t v73 = vuzp2q_s16(v67, v64);
              int16x8_t v74 = vuzp1q_s16(v65, v66);
              int16x8_t v75 = vuzp2q_s16(v65, v66);
              int16x8_t v76 = vaddq_s16(v72, v73);
              int16x8_t v77 = vaddq_s16(v74, v75);
              int32x4_t v78 = (int32x4_t)vsubq_s16(v74, v75);
              int32x4_t v79 = (int32x4_t)vsubq_s16(v72, v73);
              int16x8_t v80 = vuzp1q_s16(v76, v77);
              int16x8_t v81 = vuzp2q_s16(v76, v77);
              int16x8_t v82 = vaddq_s16(v80, v81);
              int16x8_t v83 = vsubq_s16(v80, v81);
              int32x4_t v84 = (int32x4_t)vzip1q_s16(v82, v83);
              int32x4_t v85 = (int32x4_t)vzip2q_s16(v82, v83);
              int8x16_t v86 = (int8x16_t)vzip1q_s32(v84, v79);
              int8x16_t v87 = (int8x16_t)vzip2q_s32(v84, v79);
              int8x16_t v88 = (int8x16_t)vzip1q_s32(v85, v78);
              int8x16_t v89 = (int8x16_t)vzip2q_s32(v85, v78);
              v79.i64[0] = vextq_s8(v86, v86, 8uLL).u64[0];
              v85.i64[0] = v86.i64[0];
              v78.i64[0] = vextq_s8(v87, v87, 8uLL).u64[0];
              int16x8_t v90 = vuzp1q_s16(v53, v55);
              int16x8_t v91 = vuzp2q_s16(v53, v55);
              int16x8_t v92 = vuzp1q_s16(v49, v51);
              v53.i64[0] = vextq_s8(v88, v88, 8uLL).u64[0];
              int16x8_t v93 = vuzp2q_s16(v49, v51);
              int16x8_t v94 = vuzp1q_s16(v37, v39);
              int16x8_t v95 = vuzp2q_s16(v37, v39);
              int16x8_t v96 = vuzp1q_s16(v41, v43);
              int16x8_t v97 = vuzp2q_s16(v41, v43);
              v39.i64[0] = v88.i64[0];
              int16x8_t v98 = vaddq_s16(v90, v91);
              int16x8_t v99 = vaddq_s16(v92, v93);
              int16x8_t v100 = vaddq_s16(v94, v95);
              int16x8_t v101 = vaddq_s16(v96, v97);
              int8x16_t v102 = (int8x16_t)vsubq_s16(v90, v91);
              v37.i64[0] = vextq_s8(v89, v89, 8uLL).u64[0];
              int8x16_t v103 = (int8x16_t)vsubq_s16(v92, v93);
              int8x16_t v104 = (int8x16_t)vsubq_s16(v94, v95);
              int16x8_t v105 = vuzp1q_s16(v98, v99);
              int16x8_t v106 = vuzp2q_s16(v98, v99);
              int16x8_t v107 = vuzp1q_s16(v100, v101);
              v93.i64[0] = v89.i64[0];
              int16x8_t v108 = vuzp2q_s16(v100, v101);
              int16x8_t v109 = vaddq_s16(v105, v106);
              int16x8_t v110 = vaddq_s16(v107, v108);
              int32x4_t v111 = (int32x4_t)vsubq_s16(v105, v106);
              v85.i64[1] = v68.i64[0];
              int16x8_t v112 = vuzp1q_s16(v109, v110);
              int16x8_t v113 = vuzp2q_s16(v109, v110);
              int16x8_t v114 = vaddq_s16(v112, v113);
              int16x8_t v115 = vsubq_s16(v112, v113);
              v87.i64[1] = v69.i64[0];
              int32x4_t v116 = (int32x4_t)vzip1q_s16(v114, v115);
              int8x16_t v117 = (int8x16_t)vzip1q_s32(v116, v111);
              v100.i64[0] = vextq_s8(v117, v117, 8uLL).u64[0];
              v39.i64[1] = v70.i64[0];
              int8x16_t v118 = (int8x16_t)vzip2q_s32(v116, v111);
              v116.i64[0] = vextq_s8(v118, v118, 8uLL).u64[0];
              v79.i64[1] = vextq_s8(v68, v68, 8uLL).u64[0];
              v68.i64[0] = vextq_s8(v69, v69, 8uLL).u64[0];
              v69.i64[0] = vextq_s8(v70, v70, 8uLL).u64[0];
              v93.i64[1] = v71.i64[0];
              v78.i64[1] = v68.i64[0];
              int32x4_t v119 = (int32x4_t)vsubq_s16(v107, v108);
              int32x4_t v120 = (int32x4_t)vzip2q_s16(v114, v115);
              int8x16_t v121 = (int8x16_t)vzip1q_s32(v120, v119);
              v115.i64[0] = vextq_s8(v121, v121, 8uLL).u64[0];
              v53.i64[1] = v69.i64[0];
              int8x16_t v122 = (int8x16_t)vzip2q_s32(v120, v119);
              v69.i64[0] = vextq_s8(v122, v122, 8uLL).u64[0];
              v37.i64[1] = vextq_s8(v71, v71, 8uLL).u64[0];
              v117.i64[1] = v102.i64[0];
              *uint64_t v19 = v85;
              v19[1] = (int32x4_t)v117;
              v100.i64[1] = vextq_s8(v102, v102, 8uLL).u64[0];
              v118.i64[1] = v103.i64[0];
              v19[8] = (int32x4_t)v87;
              v19[9] = (int32x4_t)v118;
              int8x16_t v123 = (int8x16_t)vsubq_s16(v96, v97);
              v121.i64[1] = v104.i64[0];
              v19[16] = (int32x4_t)v39;
              v19[17] = (int32x4_t)v121;
              v116.i64[1] = vextq_s8(v103, v103, 8uLL).u64[0];
              v122.i64[1] = v123.i64[0];
              v19[4] = v79;
              v19[5] = (int32x4_t)v100;
              v19[24] = (int32x4_t)v93;
              v19[25] = (int32x4_t)v122;
              v115.i64[1] = vextq_s8(v104, v104, 8uLL).u64[0];
              v19[12] = v78;
              v19[13] = v116;
              v69.i64[1] = vextq_s8(v123, v123, 8uLL).u64[0];
              v19[20] = (int32x4_t)v53;
              v19[21] = (int32x4_t)v115;
              char v124 = v17;
              v19[28] = (int32x4_t)v37;
              v19[29] = (int32x4_t)v69;
              v18 += 16;
              v19 += 2;
              char v17 = 0;
            }
            while ((v124 & 1) != 0);
            v16 += 32;
            v11 += v10;
            BOOL v125 = v13 >= 0x18;
            v13 += 8;
          }
          while (!v125);
          v126 = &sharpnessGrid[v15];
          updateBlurStatsOne16x16((uint64_t)v149, v126, v7, v8);
          updateBlurStatsOne16x16((uint64_t)&v150, v126, v127, v128);
          updateBlurStatsOne16x16((uint64_t)&v151, v126, v129, v130);
          updateBlurStatsOne16x16((uint64_t)v152, v126, v131, v132);
          int v12 = v147 + 1;
          uint64_t v11 = v148 + 32;
        }
        while (v147 + 1 != v145);
      }
      v144 += v141;
      LODWORD(v146) = v146 + 1;
    }
    while (v146 != v142);
  }
}

- (float)computeSmoothedGridROI:(id)a3 nextStat:(id)a4
{
  if (self->doLimitedSharpnessAndBlur)
  {
    int32x4_t gridROI = (int32x4_t)self->gridROI;
LABEL_22:
    self->smoothedROI = (GridROI_t)gridROI;
    goto LABEL_23;
  }
  int startX = self->gridROI.startX;
  if (startX == -1
    || (int startY = self->gridROI.startY, startY == -1)
    || (int endX = self->gridROI.endX, endX == -1)
    || (int endY = self->gridROI.endY, endY == -1))
  {
    int startY = 0;
    int startX = 0;
    int endX = self->gridWidth - 1;
    self->gridROI.int endX = endX;
    *(void *)&self->gridROI.int startX = 0;
    int endY = self->gridHeight - 1;
    self->gridROI.int endY = endY;
  }
  if (a4
    && (*((_DWORD *)a4 + 1184) == -1
     || *((_DWORD *)a4 + 1185) == -1
     || *((_DWORD *)a4 + 1186) == -1
     || *((_DWORD *)a4 + 1187) == -1))
  {
    *((_DWORD *)a4 + 1184) = 0;
    *((_DWORD *)a4 + 1186) = self->gridWidth - 1;
    *((_DWORD *)a4 + 1185) = 0;
    *((_DWORD *)a4 + 1187) = self->gridHeight - 1;
    int startX = self->gridROI.startX;
    int startY = self->gridROI.startY;
    int endX = self->gridROI.endX;
    int endY = self->gridROI.endY;
  }
  BurstLoggingMessage("Original ROI = %d,%d -> %d,%d\t\t", startX, startY, endX, endY);
  if (a3 && a4)
  {
    GridROI_t v12 = self->gridROI;
    int32x4_t v13 = *((int32x4_t *)a3 + 296);
    int32x4_t v14 = vminq_s32((int32x4_t)v12, v13);
    int32x4_t gridROI = (int32x4_t)vbslq_s8((int8x16_t)vcgtq_s32(v14, *((int32x4_t *)a4 + 296)), (int8x16_t)v14, (int8x16_t)vminq_s32(vmaxq_s32((int32x4_t)v12, v13), *((int32x4_t *)a4 + 296)));
    goto LABEL_22;
  }
  if (a3) {
    int v15 = (int32x4_t *)a3;
  }
  else {
    int v15 = (int32x4_t *)a4;
  }
  if (v15)
  {
    int32x4_t gridROI = vshrq_n_s32(vaddq_s32(v15[296], (int32x4_t)self->gridROI), 1uLL);
    goto LABEL_22;
  }
LABEL_23:
  BurstLoggingMessage("Smoothed ROI = %d,%d -> %d,%d\n", self->smoothedROI.startX, self->smoothedROI.startY, self->smoothedROI.endX, self->smoothedROI.endY);
  float32x2_t v16 = vdiv_f32(vcvt_f32_s32(vsub_s32(*(int32x2_t *)&self->smoothedROI.endX, *(int32x2_t *)&self->smoothedROI.startX)), vcvt_f32_s32(*(int32x2_t *)&self->gridWidth));
  LODWORD(result) = vmul_lane_f32(v16, v16, 1).u32[0];
  self->roiSize = result;
  return result;
}

- (void)updateROI:(GridROI_t)a3
{
  if (!self->doLimitedSharpnessAndBlur)
  {
    int startY = a3.startY;
    int startX = self->gridROI.startX;
    if (startX == -1
      || (int v5 = self->gridROI.startY, v5 == -1)
      || (int endX = self->gridROI.endX, endX == -1)
      || (int v7 = self->gridROI.endY, v7 == -1))
    {
      *(void *)&self->gridROI.int endX = *(void *)&a3.endX;
      int endY = a3.endY;
    }
    else
    {
      a3.int startX = (a3.startX + startX + 1) >> 1;
      int startY = (a3.startY + v5 + 1) >> 1;
      self->gridROI.int endX = (a3.endX + endX + 1) >> 1;
      int endY = (a3.endY + v7 + 1) >> 1;
      self->gridROI.int endY = endY;
      a3.int endX = (a3.endX + endX + 1) >> 1;
    }
    self->gridROI.int startX = a3.startX & ~(a3.startX >> 31);
    self->gridROI.int startY = startY & ~(startY >> 31);
    int gridWidth = self->gridWidth;
    if (a3.endX >= gridWidth) {
      self->gridROI.int endX = gridWidth - 1;
    }
    int gridHeight = self->gridHeight;
    if (endY >= gridHeight) {
      self->gridROI.int endY = gridHeight - 1;
    }
    BurstLoggingMessage("Sharpness ROI for %s updated to (%d,%d)->(%d,%d)\n", [(NSString *)self->imageId UTF8String], self->gridROI.startX, self->gridROI.startY, self->gridROI.endX, self->gridROI.endY);
  }
}

- (void)flagAsGarbage
{
  self->isGarbage = 1;
  self->registrationErrorX = 0.0;
  *(void *)&self->registrationErrorY = 0;
}

- (void)performRegistration:(id)a3 deltaCol:(float *)a4 deltaRow:(float *)a5
{
  v106[0] = 0x7F7FFFFF7F7FFFFFLL;
  BurstLoggingMessage("%s REGISTERED AGAINST %s\n", -[NSString UTF8String](self->imageId, "UTF8String"), (const char *)objc_msgSend((id)objc_msgSend(a3, "imageId"), "UTF8String"));
  p_tx = &self->tx;
  p_ty = &self->ty;
  LODWORD(v11) = 0.5;
  FastRegistration_register(self + 4656, a3 + 4656, 0, self + 4840, self + 4844, (int)v106 + 4, (int)v106, v12, v11, v13, v14, v15, v16, v17, v18, v19, v93, v94, v95,
    v96,
    v97,
    v98,
    v99,
    v100,
    v101,
    v102,
    v103,
    v104,
    v105,
    (float *)0x7F7FFFFF7F7FFFFFLL,
    (float *)v106[1],
    v107,
    v108,
    v109,
    v110,
    v111,
    v112,
    v113,
    v114,
    v115,
    v116,
    *(float *)v117);
  int v20 = [(CIBurstImageStat *)self AEAverage] - *((_DWORD *)a3 + 1198);
  if (v20 >= 0) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = -v20;
  }
  [(CIBurstImageStat *)self setAEDelta:v21];
  if (!a4 || !a5) {
    return;
  }
  int8x16_t v104 = 0;
  uint64_t v105 = 0;
  int8x16_t v102 = 0;
  int8x16_t v103 = 0;
  uint64_t v100 = 0;
  int16x8_t v101 = 0;
  uint64_t v22 = (self->gridWidth - 1);
  uint64_t gridHeight = self->gridHeight;
  uint64_t v24 = (gridHeight - 1);
  FastRegistration_compareSignatures((uint64_t *)&self->projectionSignature, (uint64_t *)a3 + 582, a4, (vDSP_Length *)&v101, a5, (vDSP_Length *)&v100, gridHeight, self->tx, self->ty);
  BurstLoggingMessage("Registration result: tx = %d, ty = %d\n", (int)self->tx, (int)self->ty);
  float v26 = computeRegistrationErrorStats((float *)&v104, a5, v100, v25);
  *(float *)&double v27 = computeRegistrationErrorStats((float *)&v102, a4, (int)v101, v26);
  [(CIBurstImageStat *)self maxSkewness];
  if (v28 < *(float *)&v104) {
    -[CIBurstImageStat setMaxSkewness:](self, "setMaxSkewness:");
  }
  [(CIBurstImageStat *)self maxSkewness];
  if (*(float *)&v29 < *(float *)&v102) {
    -[CIBurstImageStat setMaxSkewness:](self, "setMaxSkewness:");
  }
  LODWORD(v29) = HIDWORD(v103);
  [(CIBurstImageStat *)self setRegistrationErrorX:v29];
  LODWORD(v30) = HIDWORD(v105);
  [(CIBurstImageStat *)self setRegistrationErrorY:v30];
  [(CIBurstImageStat *)self setHasRegistrationData:1];
  LODWORD(v31) = HIDWORD(v103);
  BOOL v32 = *((float *)&v103 + 1) <= 5000.0 && *((float *)&v105 + 1) <= 5000.0;
  if (v32 || (LODWORD(v31) = 1153957888, (float)(*((float *)&v104 + 1) + *((float *)&v102 + 1)) <= 1600.0))
  {
    -[CIBurstImageStat setRegistrationErrorIntegral:](self, "setRegistrationErrorIntegral:", 0.0, v31);
    [(CIBurstImageStat *)self registrationErrorIntegral];
    BurstLoggingMessage("----------REGISTRATION ERROR INTEGRAL \t\t= \t\t\t%f\n", v92);
    BurstLoggingMessage("Registration rejected due to insufficient local motion.\n");
LABEL_63:
    if (self->doLimitedSharpnessAndBlur) {
      return;
    }
    -[CIBurstImageStat updateROI:](self, "updateROI:", 0, v22 | (v24 << 32));
    id v90 = a3;
    uint64_t v89 = 0;
    uint64_t v91 = v22 | (v24 << 32);
    goto LABEL_65;
  }
  uint64_t v98 = 0;
  unint64_t v99 = 0;
  computeForegroundInterval((uint64_t)&v104, (uint64_t)a5, v100, (int *)&v99 + 1, (int *)&v99);
  computeForegroundInterval((uint64_t)&v102, (uint64_t)a4, (int)v101, (int *)&v98 + 1, (int *)&v98);
  int v33 = v99;
  int v34 = HIDWORD(v99);
  int v35 = v98;
  int v36 = HIDWORD(v98);
  int v37 = HIDWORD(v99) + (((int)v99 - HIDWORD(v99)) >> 1);
  int v38 = v37 - 49;
  int v39 = v37 + 49;
  if ((int)v99 - HIDWORD(v99) < 97)
  {
    int v33 = v39;
    int v34 = v38;
  }
  int v40 = HIDWORD(v98) + (((int)v98 - HIDWORD(v98)) >> 1);
  int v41 = v40 - 49;
  int v42 = v40 + 49;
  if ((int)v98 - HIDWORD(v98) < 97)
  {
    int v35 = v42;
    int v36 = v41;
  }
  int v43 = v35 - v36;
  int v44 = v33 - v34;
  if ((v35 - v36) * (v33 - v34) <= 20480)
  {
    float v45 = (float)v44 / (float)v43;
    float v46 = (float)(v34 + (v44 >> 1));
    float v47 = (float)(v45 * 144.0) * 0.5;
    int v34 = (int)(float)(v46 - v47);
    int v33 = (int)(float)(v47 + v46);
    float v48 = (float)(v36 + (v43 >> 1));
    float v49 = (float)(144.0 / v45) * 0.5;
    int v36 = (int)(float)(v48 - v49);
    int v35 = (int)(float)(v49 + v48);
  }
  int v50 = v34 & ~(v34 >> 31);
  HIDWORD(v98) = v36 & ~(v36 >> 31);
  if ((int)v100 - 1 < v33) {
    int v33 = v100 - 1;
  }
  unint64_t v99 = __PAIR64__(v50, v33);
  if ((int)v101 - 1 < v35) {
    int v35 = v101 - 1;
  }
  LODWORD(v98) = v35;
  int16x8_t v51 = &a5[v50];
  qsort(v51, v33 - v50, 4uLL, (int (__cdecl *)(const void *, const void *))compareFloats);
  int v52 = (int)((float)((int)v99 - HIDWORD(v99)) * 0.2);
  double v53 = 0.0;
  float v54 = 0.0;
  if (v52 >= 1)
  {
    uint64_t v55 = (int)((float)((int)v99 - HIDWORD(v99)) * 0.2);
    do
    {
      float v56 = *v51++;
      float v54 = v54 + v56;
      --v55;
    }
    while (v55);
  }
  float v57 = v54 / (float)v52;
  if (v52) {
    *(float *)&double v53 = v57;
  }
  [(CIBurstImageStat *)self setRegistrationErrorIntegral:v53];
  int16x8_t v58 = &a4[SHIDWORD(v98)];
  qsort(v58, (int)v98 - (uint64_t)SHIDWORD(v98), 4uLL, (int (__cdecl *)(const void *, const void *))compareFloats);
  int v59 = (int)((float)(v98 - HIDWORD(v98)) * 0.2);
  float v60 = 0.0;
  double v61 = 0.0;
  if (v59 >= 1)
  {
    uint64_t v62 = (int)((float)(v98 - HIDWORD(v98)) * 0.2);
    do
    {
      float v63 = *v58++;
      *(float *)&double v61 = *(float *)&v61 + v63;
      --v62;
    }
    while (v62);
  }
  if (v59) {
    float v60 = *(float *)&v61 / (float)v59;
  }
  [(CIBurstImageStat *)self registrationErrorIntegral];
  *(float *)&double v65 = v60 + v64;
  [(CIBurstImageStat *)self setRegistrationErrorIntegral:v65];
  [(CIBurstImageStat *)self registrationErrorIntegral];
  BurstLoggingMessage("----------REGISTRATION ERROR INTEGRAL \t\t= \t\t\t%f\n", v66);
  [(CIBurstImageStat *)self registrationErrorIntegral];
  -[CIBurstImageStat setActionClusteringScore:](self, "setActionClusteringScore:");
  if (*(float *)&v104 <= 0.5 || *((float *)&v105 + 1) <= 5000.0)
  {
    LODWORD(v67) = v102;
    if (*(float *)&v102 <= 0.5 || *((float *)&v103 + 1) <= 5000.0)
    {
      -[CIBurstImageStat setRegistrationErrorIntegral:](self, "setRegistrationErrorIntegral:", 0.0, v67);
      BurstLoggingMessage("Registration rejected due to skewness, which can indicate a bad registration result.\n");
      goto LABEL_63;
    }
  }
  BurstLoggingMessage("Row interval: (%d->%d)\n", HIDWORD(v99), v99);
  BurstLoggingMessage("Column interval: (%d->%d)\n", HIDWORD(v98), v98);
  int v68 = v99;
  int v69 = HIDWORD(v99);
  if ((int)v99 - HIDWORD(v99) >= 64)
  {
    int v70 = v98;
    int v71 = HIDWORD(v98);
    if ((int)v98 - HIDWORD(v98) >= 64)
    {
      if (!self->doLimitedSharpnessAndBlur)
      {
        int v72 = (int)(float)(*p_tx + (float)SHIDWORD(v98));
        int v73 = (int)(float)(*p_tx + (float)(int)v98);
        if (*p_tx <= 0.0)
        {
          int v72 = HIDWORD(v98);
          int v73 = v98;
          int v71 = (int)(float)((float)SHIDWORD(v98) - *p_tx);
          int v70 = (int)(float)((float)(int)v98 - *p_tx);
        }
        int v74 = (int)(float)(*p_ty + (float)SHIDWORD(v99));
        int v75 = (int)(float)(*p_ty + (float)(int)v99);
        if (*p_ty <= 0.0)
        {
          int v74 = HIDWORD(v99);
          int v75 = v99;
          int v69 = (int)(float)((float)SHIDWORD(v99) - *p_ty);
          int v68 = (int)(float)((float)(int)v99 - *p_ty);
        }
        uint64_t v76 = (v71 >> 5);
        int v77 = v70 >> 5;
        int v78 = self->gridWidth - 1;
        if (v77 < v78) {
          uint64_t v79 = (v77 + 1);
        }
        else {
          uint64_t v79 = v78;
        }
        uint64_t v80 = (v69 >> 5);
        int v81 = v68 >> 5;
        int v82 = self->gridHeight - 1;
        if (v81 < v82) {
          uint64_t v83 = (v81 + 1);
        }
        else {
          uint64_t v83 = v82;
        }
        uint64_t v84 = v79 | (v83 << 32);
        uint64_t v85 = (v72 >> 5);
        if (v73 >> 5 < v78) {
          uint64_t v86 = ((v73 >> 5) + 1);
        }
        else {
          uint64_t v86 = v78;
        }
        uint64_t v87 = (v74 >> 5);
        if (v75 >> 5 < v82) {
          uint64_t v88 = ((v75 >> 5) + 1);
        }
        else {
          uint64_t v88 = v82;
        }
        BurstLoggingMessage("sensedROI = (%d,%d)->(%d,%d)\n", v76, v80, v79, v83);
        -[CIBurstImageStat updateROI:](self, "updateROI:", v85 | (v87 << 32), v86 | (v88 << 32));
        BurstLoggingMessage("referenceROI = (%d,%d)->(%d,%d)\n", v85, v87, v86, v88);
        uint64_t v89 = v76 | (v80 << 32);
        id v90 = a3;
        uint64_t v91 = v84;
LABEL_65:
        objc_msgSend(v90, "updateROI:", v89, v91);
        return;
      }
LABEL_61:
      BurstLoggingMessage("Registration in favor of face detection ROI.\n");
      return;
    }
  }
  if (self->doLimitedSharpnessAndBlur) {
    goto LABEL_61;
  }
  BurstLoggingMessage("Registration rejected due to ROI too large or too small.\n");
  -[CIBurstImageStat updateROI:](self, "updateROI:", 0, v22 | (v24 << 32));
  objc_msgSend(a3, "updateROI:", 0, v22 | (v24 << 32));
  [(CIBurstImageStat *)self setRegistrationErrorIntegral:0.0];
}

- (void)computeImageProjections:(id)a3
{
  v6[2] = (int)([a3 width] & 0xFFFFFFE0);
  v6[1] = (int)[a3 height];
  v6[3] = (int)objc_msgSend(a3, "bytesPerRow", objc_msgSend(a3, "Ybuffer"));
  SignatureBuffers = allocateSignatureBuffers((uint64_t)&self->projectionSignature, (uint64_t)v6, 0);
  self->projectionMemoryBlock = SignatureBuffers;
  if (SignatureBuffers) {
    FastRegistration_computeSignatures((uint64_t)v6, 0, 0, (uint64_t)&self->projectionSignature);
  }
}

- (int)canRegister
{
  return self->projectionSignature.piRow && self->projectionSignature.piCol != 0;
}

- (void)writeGridROI:(id)a3
{
  uint64_t v5 = [NSNumber numberWithInt:self->gridROI.startX];
  [a3 setObject:v5 forKey:kCIBurstImageProperty_ImageROIGridStartX];
  uint64_t v6 = [NSNumber numberWithInt:self->gridROI.startY];
  [a3 setObject:v6 forKey:kCIBurstImageProperty_ImageROIGridStartY];
  uint64_t v7 = [NSNumber numberWithInt:self->gridROI.endX];
  [a3 setObject:v7 forKey:kCIBurstImageProperty_ImageROIGridEndX];
  uint64_t v8 = [NSNumber numberWithInt:self->gridROI.endY];
  uint64_t v9 = kCIBurstImageProperty_ImageROIGridEndY;

  [a3 setObject:v8 forKey:v9];
}

- (void)computeImageData:(id)a3 faceIDCounts:(id)a4
{
  -[CIBurstImageStat computeImageColorHistogram:](self, "computeImageColorHistogram:", a3, a4);
  self->int gridWidth = (int)[a3 width] >> 5;
  self->int gridHeight = (int)[a3 height] >> 5;
  *(void *)&self->gridROI.int startX = -1;
  *(void *)&self->gridROI.int endX = -1;
  self->doLimitedSharpnessAndBlur = 0;
  BurstLoggingMessage("\t\t----------------------- facecore count = %d, numHWFaces = %d\n", [(NSMutableArray *)self->faceStatArray count], self->numHWFaces);
  if ([(NSMutableArray *)self->faceStatArray count] || self->numHWFaces >= 1)
  {
    self->gridROI.int startX = (int)self->facesRoiRect.origin.x >> 5;
    self->gridROI.int startY = (int)((double)(int)[a3 height]
                               - self->facesRoiRect.origin.y
                               - (double)(int)self->facesRoiRect.size.height) >> 5;
    self->gridROI.int endX = (((int)self->facesRoiRect.size.width + (int)self->facesRoiRect.origin.x) >> 5) + 1;
    int v6 = ((int)((double)(int)[a3 height] - self->facesRoiRect.origin.y) >> 5) + 1;
    self->gridROI.int endY = v6;
    int32x2_t v7 = vmax_s32(*(int32x2_t *)&self->gridROI.startX, 0);
    *(int32x2_t *)&self->gridROI.int startX = v7;
    int endX = self->gridROI.endX;
    int gridWidth = self->gridWidth;
    if (endX >= gridWidth)
    {
      int endX = gridWidth - 1;
      self->gridROI.int endX = gridWidth - 1;
    }
    int gridHeight = self->gridHeight;
    if (v6 >= gridHeight)
    {
      int v6 = gridHeight - 1;
      self->gridROI.int endY = gridHeight - 1;
    }
    self->doLimitedSharpnessAndBlur = 1;
    BurstLoggingMessage("Limited ROI = (%d,%d)->(%d,%d)\n", v7.i32[0], v7.i32[1], endX, v6);
  }
  self->sharpnessGrid = (SharpnessGridElement_t *)malloc_type_calloc(1uLL, 8 * self->gridHeight * self->gridWidth, 0x1000040CE7E837CuLL);
  [(CIBurstImageStat *)self computeImageSharpnessOnGrid:a3];
  [(CIBurstImageStat *)self computeBlurStatsOnGrid:a3];

  [(CIBurstImageStat *)self computeImageProjections:a3];
}

- (void)collapseSharpnessGrid
{
  self->int32x4_t gridROI = self->smoothedROI;
  if ([(NSMutableArray *)self->faceStatArray count] && !self->doLimitedSharpnessAndBlur)
  {
    *(void *)&self->float avgHorzDiffY = 0x3F80000000000000;
  }
  else
  {
    self->float avgHorzDiffY = 0.0;
    BurstLoggingMessage("Computing sharpness over grid points (%d,%d)->(%d,%d)\n", self->gridROI.startX, self->gridROI.startY, self->gridROI.endX, self->gridROI.endY);
    int32x2_t v3 = vadd_s32(vsub_s32(*(int32x2_t *)&self->gridROI.endX, *(int32x2_t *)&self->gridROI.startX), (int32x2_t)0x100000001);
    int v33 = vmul_lane_s32(v3, v3, 1).u32[0];
    v4 = (float *)malloc_type_malloc(8 * v33, 0x1000040CE7E837CuLL);
    if (v4)
    {
      uint64_t v5 = v4;
      int startY = self->gridROI.startY;
      int endY = self->gridROI.endY;
      if (startY <= endY)
      {
        int v9 = 0;
        int v10 = 0;
        int v8 = 0;
        do
        {
          sharpnessGrid = self->sharpnessGrid;
          if (!sharpnessGrid) {
            break;
          }
          int startX = self->gridROI.startX;
          if (startX <= self->gridROI.endX)
          {
            double v13 = &sharpnessGrid[startX + self->gridWidth * startY];
            double v14 = (char *)&v4[2 * v10];
            int v15 = startX - 1;
            do
            {
              if (!self->doLimitedSharpnessAndBlur)
              {
                v9 += v13->var0;
                v8 += v13->var1;
              }
              uint64_t v16 = (uint64_t)*v13++;
              *(void *)double v14 = v16;
              v14 += 8;
              ++v10;
              ++v15;
            }
            while (v15 < self->gridROI.endX);
            int endY = self->gridROI.endY;
          }
        }
        while (startY++ < endY);
      }
      else
      {
        int v8 = 0;
        int v9 = 0;
      }
      if (self->doLimitedSharpnessAndBlur)
      {
        double v18 = self->sharpnessGrid;
        if (v18)
        {
          uint64_t gridHeight = self->gridHeight;
          if ((int)gridHeight >= 1)
          {
            uint64_t v20 = 0;
            int gridWidth = self->gridWidth;
            p_var1 = &v18->var1;
            do
            {
              uint64_t v23 = self->gridWidth;
              uint64_t v24 = p_var1;
              if (gridWidth >= 1)
              {
                do
                {
                  v9 += *(v24 - 1);
                  int v25 = *v24;
                  v24 += 8;
                  v8 += v25;
                  --v23;
                }
                while (v23);
              }
              ++v20;
              p_var1 += 8 * gridWidth;
            }
            while (v20 != gridHeight);
          }
        }
      }
      qsort(v4, v33, 8uLL, (int (__cdecl *)(const void *, const void *))compareGridElements);
      if (v33 >= 32) {
        int v26 = 32;
      }
      else {
        int v26 = v33;
      }
      float avgHorzDiffY = self->avgHorzDiffY;
      if (v33 >= 1)
      {
        if (v26 <= 1) {
          uint64_t v28 = 1;
        }
        else {
          uint64_t v28 = v26;
        }
        double v29 = v5 + 1;
        do
        {
          float v30 = *v29;
          v29 += 2;
          float avgHorzDiffY = v30 + avgHorzDiffY;
          self->float avgHorzDiffY = avgHorzDiffY;
          --v28;
        }
        while (v28);
      }
      float v31 = avgHorzDiffY / (float)((float)v26 * 1024.0);
      self->float avgHorzDiffY = v31;
      float v32 = (float)v8 / (float)v9;
      if (!v9) {
        float v32 = 1.0;
      }
      self->blurExtent = v32;
      BurstLoggingMessage("After collapse float avgHorzDiffY = %f, blurExtent = %f\n", v31, v32);
      free(v5);
    }
  }
}

- (float)computeFacialFocusScoreSum
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BurstLoggingMessage("Num HW faces = %d, facecore faces = %d\n", self->numHWFaces, [(NSMutableArray *)self->faceStatArray count]);
  int numHWFaces = self->numHWFaces;
  if (numHWFaces <= (int)[(NSMutableArray *)self->faceStatArray count]) {
    int v4 = [(NSMutableArray *)self->faceStatArray count];
  }
  else {
    int v4 = self->numHWFaces;
  }
  if ([(CIBurstImageStat *)self version] >= 2)
  {
    long long v28 = 0uLL;
    long long v29 = 0uLL;
    long long v26 = 0uLL;
    long long v27 = 0uLL;
    faceStatArray = self->faceStatArray;
    uint64_t v6 = [(NSMutableArray *)faceStatArray countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      float v9 = 1.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(faceStatArray);
          }
          double v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v11 normalizedFocusScore];
          float v9 = v9 * v12;
          if (![v11 leftEyeOpen] || (objc_msgSend(v11, "rightEyeOpen") & 1) == 0) {
            float v9 = v9 * 0.9;
          }
          if (([v11 leftEyeOpen] & 1) == 0 && !objc_msgSend(v11, "rightEyeOpen")) {
            float v9 = v9 * 0.7;
          }
          if (![v11 smiling]) {
            float v9 = v9 * 0.5;
          }
        }
        uint64_t v7 = [(NSMutableArray *)faceStatArray countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
      goto LABEL_38;
    }
LABEL_37:
    float v9 = 1.0;
    goto LABEL_38;
  }
  long long v24 = 0uLL;
  long long v25 = 0uLL;
  long long v22 = 0uLL;
  long long v23 = 0uLL;
  double v13 = self->faceStatArray;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (!v14) {
    goto LABEL_37;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v23;
  float v9 = 1.0;
  do
  {
    for (uint64_t j = 0; j != v15; ++j)
    {
      if (*(void *)v23 != v16) {
        objc_enumerationMutation(v13);
      }
      double v18 = *(void **)(*((void *)&v22 + 1) + 8 * j);
      [v18 normalizedFocusScore];
      float v9 = v9 * v19;
      if (![v18 leftEyeOpen] || (objc_msgSend(v18, "rightEyeOpen") & 1) == 0) {
        float v9 = v9 * 0.9;
      }
      if (([v18 leftEyeOpen] & 1) == 0 && !objc_msgSend(v18, "rightEyeOpen")) {
        float v9 = v9 * 0.7;
      }
      if (![v18 smiling]) {
        float v9 = v9 * 0.5;
      }
    }
    uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  }
  while (v15);
LABEL_38:
  if ([(NSMutableArray *)self->faceStatArray count]) {
    float v9 = v9 * 20.0;
  }
  BurstLoggingMessage("combined normalized focus score for face core detections = %f\n", v9);
  if (self->doLimitedSharpnessAndBlur) {
    float v20 = self->avgHorzDiffY / (float)(self->blurExtent + 1.0);
  }
  else {
    float v20 = 0.0;
  }
  BurstLoggingMessage("Limited sharpness score = %f, with number of faces = %d\n", v20, self->numHWFaces);
  return (float)((float)((float)v4 * 2000.0) * v9) * (float)(v20 + 5.0);
}

- (float)computeRuleOfThreeDistance
{
  faceStatArray = self->faceStatArray;
  float v4 = 1.0;
  if (faceStatArray && [(NSMutableArray *)faceStatArray count])
  {
    if ([(NSMutableArray *)self->faceStatArray count])
    {
      unint64_t v5 = 0;
      float v6 = 0.0;
      do
      {
        uint64_t v7 = (void *)[(NSMutableArray *)self->faceStatArray objectAtIndex:v5];
        [v7 normalizedFaceRect];
        double v9 = v8;
        [v7 normalizedFaceRect];
        float v11 = v9 + v10 * 0.5;
        [v7 normalizedFaceRect];
        double v13 = v12;
        [v7 normalizedFaceRect];
        uint64_t v14 = 0;
        float v16 = v13 + v15 * 0.5;
        float v17 = 100.0;
        do
        {
          float v18 = v16 - *(float *)&ruleOfThirdsY[v14];
          if ((float)((float)((float)(v11 - *(float *)&ruleOfThirdsX[v14])
                             * (float)(v11 - *(float *)&ruleOfThirdsX[v14]))
                     + (float)(v18 * v18)) < v17)
            float v17 = (float)((float)(v11 - *(float *)&ruleOfThirdsX[v14]) * (float)(v11 - *(float *)&ruleOfThirdsX[v14]))
                + (float)(v18 * v18);
          ++v14;
        }
        while (v14 != 9);
        float v6 = v6 + sqrtf(v17);
        ++v5;
      }
      while ([(NSMutableArray *)self->faceStatArray count] > v5);
    }
    else
    {
      float v6 = 0.0;
    }
    float v4 = v6 / (float)(unint64_t)[(NSMutableArray *)self->faceStatArray count];
  }
  return 1.3333 - v4;
}

- (float)computeSmilePercentage
{
  faceStatArray = self->faceStatArray;
  float v4 = 0.0;
  if (faceStatArray && [(NSMutableArray *)faceStatArray count])
  {
    if ([(NSMutableArray *)self->faceStatArray count])
    {
      unint64_t v5 = 0;
      int v6 = 0;
      do
        v6 += objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->faceStatArray, "objectAtIndex:", v5++), "smiling");
      while ([(NSMutableArray *)self->faceStatArray count] > v5);
      float v4 = (float)v6;
    }
    return v4 / (float)(unint64_t)[(NSMutableArray *)self->faceStatArray count];
  }
  return v4;
}

- (float)computeImageDistance:(id)a3
{
  uint64_t v3 = 0;
  double v4 = 0.0;
  do
  {
    float64x2_t v5 = vsqrtq_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&self->colorHistogram[v3]), vcvtq_f64_f32(*(float32x2_t *)((char *)a3 + v3 * 4 + 16))));
    double v4 = v4 + v5.f64[0] + v5.f64[1];
    v3 += 2;
  }
  while (v3 != 1024);
  return sqrt(1.0 - v4);
}

- (float)computeAEMatrixDifference:(id)a3
{
  uint64_t v3 = 0;
  float result = 0.0;
  do
  {
    uint16x8_t v5 = vabdq_u16(*(uint16x8_t *)&self->aeMatrix[v3], *(uint16x8_t *)((char *)a3 + v3 * 2 + 4116));
    int32x4_t v6 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v5.i8);
    float32x4_t v7 = vcvtq_f32_s32((int32x4_t)vmovl_high_u16(v5));
    float32x4_t v8 = vcvtq_f32_s32(v6);
    float result = (float)((float)((float)((float)((float)((float)((float)(result + v8.f32[0]) + v8.f32[1]) + v8.f32[2])
                                           + v8.f32[3])
                                   + v7.f32[0])
                           + v7.f32[1])
                   + v7.f32[2])
           + v7.f32[3];
    v3 += 8;
  }
  while (v3 != 256);
  return result;
}

- (int)setAEMatrix:(id)a3
{
  if (!a3) {
    return 0;
  }
  aeMatrix = self->aeMatrix;
  [a3 getBytes:self->aeMatrix length:512];
  uint64_t v4 = 0;
  int32x4_t v5 = 0uLL;
  int32x4_t v6 = 0uLL;
  do
  {
    uint16x8_t v7 = *(uint16x8_t *)&aeMatrix[v4];
    int32x4_t v6 = (int32x4_t)vaddw_high_u16((uint32x4_t)v6, v7);
    int32x4_t v5 = (int32x4_t)vaddw_u16((uint32x4_t)v5, *(uint16x4_t *)v7.i8);
    v4 += 8;
  }
  while (v4 != 256);
  if (!vaddvq_s32(vaddq_s32(v5, v6))) {
    return -1;
  }
  else {
    return 0;
  }
}

- (void)computeAEMatrix:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 Ybuffer];
  int v5 = [a3 height];
  int v6 = [a3 width];
  bzero(v14, 0x400uLL);
  if (v5)
  {
    for (unsigned int i = 0; i != v5; ++i)
    {
      if (v6)
      {
        for (unsigned int j = 0; j != v6; ++j)
        {
          LOBYTE(v9) = *(unsigned char *)(v4 + (int)(j + i * [a3 bytesPerRow]));
          v14[16 * (i / ((v5 + 15) >> 4)) + j / ((v6 + 15) >> 4)] = v14[16 * (i / ((v5 + 15) >> 4)) + j / ((v6 + 15) >> 4)]
                                                                                              + (float)v9;
        }
      }
    }
  }
  uint64_t v10 = 0;
  aeMatrix = (int16x8_t *)self->aeMatrix;
  float32x4_t v12 = (float32x4_t)vdupq_n_s32(0x44960000u);
  do
  {
    *aeMatrix++ = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vdivq_f32(*(float32x4_t *)&v14[v10], v12)), (int16x8_t)vcvtq_u32_f32(vdivq_f32(*(float32x4_t *)&v14[v10 + 4], v12)));
    v10 += 8;
  }
  while (v10 != 256);
}

- (unsigned)aeMatrix
{
  return self->aeMatrix;
}

- (float)computeScore:(float)a3
{
  p_emotionallyRejected = &self->emotionallyRejected;
  BurstLoggingMessage("Thumbnail selection score computation for %s\n", [(NSString *)self->imageId UTF8String]);
  faceStatArray = self->faceStatArray;
  if (faceStatArray && [(NSMutableArray *)faceStatArray count])
  {
    float v7 = 0.0;
    if (!*p_emotionallyRejected)
    {
      [(CIBurstImageStat *)self computeFacialFocusScoreSum];
      float v7 = v8;
    }
    BurstLoggingMessage("\tAverage facial focus score = %f\n");
  }
  else
  {
    float v7 = (float)(self->avgHorzDiffY + self->avgHorzDiffY) / (float)(self->blurExtent + 1.0);
    BurstLoggingMessage("\tInitial score (no faces) = %f (isGarbage = %d)\n");
  }
  self->actionScore = v7;
  float registrationErrorIntegral = self->registrationErrorIntegral;
  if (registrationErrorIntegral > a3 && !p_emotionallyRejected[2])
  {
    float v10 = (float)(registrationErrorIntegral / 100.0) + (float)(v7 * 4.0);
    self->actionScore = v10;
    BurstLoggingMessage("\tAction selection score = %f\n", v10);
  }
  self->imageScore = v7;
  return v7;
}

- (int64_t)compareImageStats:(id)a3
{
  return 0;
}

- (int64_t)compareImageOrder:(id)a3
{
  float v4 = (float)[(CIBurstImageStat *)self temporalOrder];
  float v5 = (float)(int)[a3 temporalOrder];
  if (v5 <= v4) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = -1;
  }
  if (v4 > v5) {
    return 1;
  }
  else {
    return v6;
  }
}

- (float)colorHistogram
{
  return self->colorHistogram;
}

- (NSString)imageId
{
  return self->imageId;
}

- (void)setImageId:(id)a3
{
  self->imageId = (NSString *)a3;
}

- (int)orientation
{
  return self->orientation;
}

- (void)setOrientation:(int)a3
{
  self->orientation = a3;
}

- (NSMutableArray)faceStatArray
{
  return self->faceStatArray;
}

- (void)setFaceStatArray:(id)a3
{
  self->faceStatArray = (NSMutableArray *)a3;
}

- (BOOL)exclude
{
  return self->exclude;
}

- (void)setExclude:(BOOL)a3
{
  self->exclude = a3;
}

- (BOOL)AEStable
{
  return self->AEStable;
}

- (void)setAEStable:(BOOL)a3
{
  self->AEStable = a3;
}

- (int)AEAverage
{
  return self->AEAverage;
}

- (void)setAEAverage:(int)a3
{
  self->AEAverage = a3;
}

- (int)AETarget
{
  return self->AETarget;
}

- (void)setAETarget:(int)a3
{
  self->AETarget = a3;
}

- (BOOL)AFStable
{
  return self->AFStable;
}

- (void)setAFStable:(BOOL)a3
{
  self->AFStable = a3;
}

- (int)temporalOrder
{
  return self->temporalOrder;
}

- (void)setTemporalOrder:(int)a3
{
  self->temporalOrder = a3;
}

- (float)avgHorzDiffY
{
  return self->avgHorzDiffY;
}

- (void)setAvgHorzDiffY:(float)a3
{
  self->float avgHorzDiffY = a3;
}

- (float)blurExtent
{
  return self->blurExtent;
}

- (void)setBlurExtent:(float)a3
{
  self->blurExtent = a3;
}

- (float)imageScore
{
  return self->imageScore;
}

- (void)setImageScore:(float)a3
{
  self->imageScore = a3;
}

- (float)actionScore
{
  return self->actionScore;
}

- (void)setActionScore:(float)a3
{
  self->actionScore = a3;
}

- (double)timeReceived
{
  return self->timeReceived;
}

- (void)setTimeReceived:(double)a3
{
  self->timeReceived = a3;
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

- (float)maxSkewness
{
  return self->maxSkewness;
}

- (void)setMaxSkewness:(float)a3
{
  self->maxSkewness = a3;
}

- (float)registrationErrorX
{
  return self->registrationErrorX;
}

- (void)setRegistrationErrorX:(float)a3
{
  self->registrationErrorX = a3;
}

- (float)registrationErrorY
{
  return self->registrationErrorY;
}

- (void)setRegistrationErrorY:(float)a3
{
  self->registrationErrorY = a3;
}

- (BOOL)hasRegistrationData
{
  return self->hasRegistrationData;
}

- (void)setHasRegistrationData:(BOOL)a3
{
  self->hasRegistrationData = a3;
}

- (float)registrationErrorIntegral
{
  return self->registrationErrorIntegral;
}

- (void)setRegistrationErrorIntegral:(float)a3
{
  self->float registrationErrorIntegral = a3;
}

- (float)actionClusteringScore
{
  return self->actionClusteringScore;
}

- (void)setActionClusteringScore:(float)a3
{
  self->actionClusteringScore = a3;
}

- (CGRect)facesRoiRect
{
  objc_copyStruct(v6, &self->facesRoiRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFacesRoiRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->facesRoiRect, &v3, 32, 1, 0);
}

- (int)numHWFaces
{
  return self->numHWFaces;
}

- (void)setNumHWFaces:(int)a3
{
  self->int numHWFaces = a3;
}

- (BOOL)emotionallyRejected
{
  return self->emotionallyRejected;
}

- (void)setEmotionallyRejected:(BOOL)a3
{
  self->emotionallyRejected = a3;
}

- (BOOL)doLimitedSharpnessAndBlur
{
  return self->doLimitedSharpnessAndBlur;
}

- (void)setDoLimitedSharpnessAndBlur:(BOOL)a3
{
  self->doLimitedSharpnessAndBlur = a3;
}

- (float)tx
{
  return self->tx;
}

- (void)setTx:(float)a3
{
  self->tx = a3;
}

- (float)ty
{
  return self->ty;
}

- (void)setTy:(float)a3
{
  self->ty = a3;
}

- (BOOL)isGarbage
{
  return self->isGarbage;
}

- (void)setIsGarbage:(BOOL)a3
{
  self->isGarbage = a3;
}

- (float)roiSize
{
  return self->roiSize;
}

- (void)setRoiSize:(float)a3
{
  self->roiSize = a3;
}

- (int)AEDelta
{
  return self->_AEDelta;
}

- (void)setAEDelta:(int)a3
{
  self->_AEDelta = a3;
}

- (__IOSurface)fullsizeJpegData
{
  return self->_fullsizeJpegData;
}

- (void)setFullsizeJpegData:(__IOSurface *)a3
{
  self->_fullsizeJpegData = a3;
}

- (int)fullsizeJpegSize
{
  return self->_fullsizeJpegSize;
}

- (void)setFullsizeJpegSize:(int)a3
{
  self->_fullsizeJpegSize = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

@end