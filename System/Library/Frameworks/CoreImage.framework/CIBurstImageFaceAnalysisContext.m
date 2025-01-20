@interface CIBurstImageFaceAnalysisContext
- (BOOL)forceFaceDetectionEnable;
- (CGRect)calculateFaceCoreROI:(id)a3 imageStat:(id)a4 needFaceCore:(BOOL *)a5;
- (CGRect)padRoiRect:(CGRect)a3 paddingX:(float)a4 paddingY:(float)a5;
- (CIBurstImageFaceAnalysisContext)initWithVersion:(id)a3;
- (double)latestFaceTimestamp;
- (double)timeBlinkDetectionDone;
- (double)timeFaceDetectionDone;
- (id)findOverlappingFaceStat:(CGRect)a3 imageStat:(id)a4;
- (int)findFacesInImage:(id)a3 imageStat:(id)a4;
- (int)version;
- (void)addFaceToArray:(id)a3;
- (void)addFacesToImageStat:(id)a3 imageSize:(CGSize)a4;
- (void)adjustFaceIdsForImageStat:(id)a3;
- (void)calcFaceScores:(id)a3;
- (void)calculateFaceFocusInImage:(id)a3 imageStat:(id)a4;
- (void)dealloc;
- (void)dumpFaceInfoArray;
- (void)extractFacesFromMetadata:(id)a3;
- (void)setForceFaceDetectionEnable:(BOOL)a3;
- (void)setLatestFaceTimestamp:(double)a3;
- (void)setTimeBlinkDetectionDone:(double)a3;
- (void)setTimeFaceDetectionDone:(double)a3;
- (void)setVersion:(int)a3;
- (void)setupFaceDetector;
@end

@implementation CIBurstImageFaceAnalysisContext

- (CIBurstImageFaceAnalysisContext)initWithVersion:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CIBurstImageFaceAnalysisContext;
  v4 = [(CIBurstImageFaceAnalysisContext *)&v8 init];
  if (v4)
  {
    v4->curConfig = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    v4->faceIdMapping = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    v4->renameMapping = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    v4->faceIdCounter = 1;
    v4->faceInfoArray = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    v4->numFramesNoFaces = 0;
    v4->forceFaceDetectionEnable = 1;
    v4->faceDetector = 0;
    v5 = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    v4->latestFaceTimestamp = 0.0;
    v4->faceTimestampArray = v5;
    v4->latestImageTimestamp = 0.0;
    v4->lastFaceIndex = 0;
    if ([a3 isEqualToString:kCIBurstImageSet_VersionString_2[0]]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    [(CIBurstImageFaceAnalysisContext *)v4 setVersion:v6];
  }
  return v4;
}

- (void)dealloc
{
  curConfig = self->curConfig;
  if (curConfig)
  {

    self->curConfig = 0;
  }
  faceIdMapping = self->faceIdMapping;
  if (faceIdMapping)
  {

    self->faceIdMapping = 0;
  }
  renameMapping = self->renameMapping;
  if (renameMapping)
  {

    self->renameMapping = 0;
  }
  faceInfoArray = self->faceInfoArray;
  if (faceInfoArray)
  {

    self->faceInfoArray = 0;
  }
  faceDetector = self->faceDetector;
  if (faceDetector)
  {

    self->faceDetector = 0;
  }
  faceTimestampArray = self->faceTimestampArray;
  if (faceTimestampArray)
  {

    self->faceTimestampArray = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)CIBurstImageFaceAnalysisContext;
  [(CIBurstImageFaceAnalysisContext *)&v9 dealloc];
}

- (void)setupFaceDetector
{
}

- (CGRect)padRoiRect:(CGRect)a3 paddingX:(float)a4 paddingY:(float)a5
{
  float v5 = 100.0 / a3.size.width + -0.5;
  if (v5 > a4) {
    a4 = 100.0 / a3.size.width + -0.5;
  }
  float v6 = 100.0 / a3.size.height + -0.5;
  if (v6 > a5) {
    a5 = 100.0 / a3.size.height + -0.5;
  }
  double v7 = a4;
  double v8 = a3.origin.x - a3.size.width * v7;
  double v9 = a5;
  double v10 = a3.origin.y - a3.size.height * v9;
  double v11 = a3.size.width + a3.size.width * v7 * 2.0;
  double v12 = a3.size.height + a3.size.height * v9 * 2.0;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v8;
  return result;
}

- (CGRect)calculateFaceCoreROI:(id)a3 imageStat:(id)a4 needFaceCore:(BOOL *)a5
{
  id v7 = a3;
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  int v8 = [a3 width];
  int v9 = [v7 height];
  [a4 orientation];
  BurstLoggingMessage("    orientation = %d\n", [a4 orientation]);
  if (a5) {
    *a5 = 0;
  }
  [v7 width];
  [v7 height];
  double x = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CGFloat v147 = *MEMORY[0x1E4F1DB28];
  CGFloat v148 = v11;
  CGFloat r1_24 = v13;
  if ([(CIBurstImageFaceAnalysisContext *)self version] <= 1)
  {
    int v114 = [v7 width];
    int v115 = [v7 height];
    uint64_t v116 = objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count");
    uint64_t v117 = v116;
    if ((int)v116 < 1)
    {
      double v127 = (float)((float)(unint64_t)v8 * 0.2);
      double v128 = (float)((float)(unint64_t)v9 * 0.2);
      double v129 = (double)(unint64_t)v8 * 0.599999994;
      double v130 = (double)(unint64_t)v9 * 0.599999994;
    }
    else
    {
      BurstLoggingMessage("Number of HW faces = %d - calculating rect\n", v116);
      if (v117)
      {
        uint64_t v118 = 0;
        do
        {
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "objectAtIndex:", v118), "faceRect");
          double x = v119 - v120 * 0.25;
          double y = v121 - v122 * 0.25;
          double width = v120 + v120 * 0.25 * 2.0;
          double height = v122 + v122 * 0.25 * 2.0;
          BurstLoggingMessage("   face %d = (%.3f,%.3f,%.3f,%.3f)\n", v118, x, y, width, height);
          if (v118)
          {
            v173.origin.double x = v147;
            v173.origin.double y = v148;
            v173.size.double width = v12;
            v173.size.double height = r1_24;
            v184.origin.double x = x;
            v184.origin.double y = y;
            v184.size.double width = width;
            v184.size.double height = height;
            CGRect v174 = CGRectUnion(v173, v184);
            double x = v174.origin.x;
            double y = v174.origin.y;
            double width = v174.size.width;
            double height = v174.size.height;
          }
          ++v118;
          CGFloat v147 = x;
          CGFloat v148 = y;
          CGFloat v12 = width;
          CGFloat r1_24 = height;
        }
        while (v117 != v118);
      }
      else
      {
        double height = v13;
        double width = v12;
        double y = v11;
      }
      v188.origin.double x = 0.0;
      v188.origin.double y = 0.0;
      v178.origin.double x = x;
      v178.origin.double y = y;
      v178.size.double width = width;
      v178.size.double height = height;
      v188.size.double width = (double)v114;
      v188.size.double height = (double)v115;
      CGRect v179 = CGRectIntersection(v178, v188);
      double v127 = v179.origin.x;
      double v128 = v179.origin.y;
      double v129 = v179.size.width;
      double v130 = v179.size.height;
    }
    objc_msgSend(a4, "setFacesRoiRect:", v127, v128, v129, v130);
    [a4 setNumHWFaces:v117];
    if (a5) {
      *a5 = 1;
    }
  }
  else
  {
    v138 = v7;
    BurstLoggingMessage("Number of HW faces = %d - calculating rect\n", objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"));
    uint64_t v14 = objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count");
    double v15 = v13;
    CGFloat v16 = v12;
    CGFloat v17 = v11;
    double v18 = x;
    CGFloat v19 = v13;
    CGFloat r1_16 = v12;
    double v20 = v11;
    double v21 = x;
    if (v14)
    {
      unint64_t v22 = 0;
      double v23 = v147;
      double v24 = v11;
      double v25 = v12;
      double v26 = r1_24;
      CGFloat r1 = v147;
      CGFloat v144 = r1_24;
      double r2 = v11;
      CGFloat v27 = v12;
      do
      {
        double v28 = v27;
        CGFloat v139 = v26;
        CGFloat v140 = v25;
        CGFloat v141 = v24;
        v29 = objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "objectAtIndex:", v22);
        [v29 faceRect];
        double v31 = v30;
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        objc_msgSend(v29, "setHwFaceId:", objc_msgSend(v29, "faceId"));
        [v29 faceRect];
        objc_msgSend(v29, "setHwFaceRect:");
        BurstLoggingMessage("   hwFaceRect: (%.3f,%.3f,%.3f,%.3f), hasLeftEye = %d, hasRightEye = %d\n", v31, v33, v35, v37, [v29 hasLeftEye], objc_msgSend(v29, "hasRightEye"));
        CGFloat v143 = v23;
        if ([v29 hasLeftEye]) {
          char v40 = [v29 hasRightEye];
        }
        else {
          char v40 = 0;
        }
        LODWORD(v38) = 0.25;
        LODWORD(v39) = 0.25;
        -[CIBurstImageFaceAnalysisContext padRoiRect:paddingX:paddingY:](self, "padRoiRect:paddingX:paddingY:", v31, v33, v35, v37, v38, v39);
        double v21 = v41;
        double v20 = v42;
        double v44 = v43;
        double v46 = v45;
        if [v29 isSyncedWithImage] && (v40)
        {
          double v47 = v46;
          double v15 = v144;
          double v48 = r2;
          double v18 = r1;
          double v11 = v148;
        }
        else
        {
          double v11 = v148;
          double v49 = v28;
          if (a5) {
            *a5 = 1;
          }
          double v15 = v46;
          double v28 = v44;
          double v47 = v46;
          double v48 = v20;
          double v18 = v21;
          if (v49 != 0.0)
          {
            CGFloat v50 = r1;
            CGFloat v52 = v144;
            double v51 = r2;
            double v53 = v21;
            double v54 = v20;
            double v55 = v44;
            double v56 = v47;
            CGRect v165 = CGRectUnion(*(CGRect *)(&v49 - 2), *(CGRect *)(&v47 - 3));
            double v47 = v56;
            double v18 = v165.origin.x;
            double v48 = v165.origin.y;
            double v28 = v165.size.width;
            double v15 = v165.size.height;
          }
        }
        CGFloat r2a = v47;
        BurstLoggingMessage("   face %d = (%.3f,%.3f,%.3f,%.3f)\n", v22, v21, v20, v44, v47);
        double v156 = v28;
        double r1_8 = v48;
        BurstLoggingMessage("   fcrect  = (%.3f,%.3f,%.3f,%.3f)\n", v18, v48, v28, v15);
        CGFloat v12 = v44;
        if (v22)
        {
          v166.origin.double y = v141;
          v166.origin.double x = v143;
          v166.size.double height = v139;
          v166.size.double width = v140;
          v181.origin.double x = v21;
          v181.origin.double y = v20;
          v181.size.double width = v44;
          v181.size.double height = r2a;
          CGRect v167 = CGRectUnion(v166, v181);
          double v21 = v167.origin.x;
          double v20 = v167.origin.y;
          CGFloat v12 = v167.size.width;
          CGFloat v57 = v167.size.height;
        }
        else
        {
          CGFloat v57 = r2a;
        }
        ++v22;
        unint64_t v58 = objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count");
        double v23 = v21;
        double v24 = v20;
        double v25 = v12;
        double v26 = v57;
        CGFloat r1 = v18;
        CGFloat v19 = v57;
        CGFloat v17 = r1_8;
        CGFloat v144 = v15;
        double r2 = r1_8;
        CGFloat v16 = v156;
        CGFloat v27 = v156;
      }
      while (v22 < v58);
    }
    CGFloat v59 = v19;
    CGFloat r1a = v18;
    CGFloat r1_8a = v15;
    double v157 = v16;
    v142.origin.double x = v21;
    v142.origin.double y = v20;
    v142.size.double width = v12;
    int v60 = [a4 temporalOrder];
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    faceInfoArradouble y = self->faceInfoArray;
    uint64_t v62 = [(NSMutableArray *)faceInfoArray countByEnumeratingWithState:&v159 objects:v163 count:16];
    v142.size.double height = v59;
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v160;
      double v65 = r1_24;
      double v66 = v157;
      CGFloat v67 = v147;
      do
      {
        for (uint64_t i = 0; i != v63; ++i)
        {
          if (*(void *)v160 != v64) {
            objc_enumerationMutation(faceInfoArray);
          }
          v69 = *(void **)(*((void *)&v159 + 1) + 8 * i);
          BOOL v70 = [v69 hwFaceId] != -1
             && (int)(v60 - [v69 hwLastFrameSeen]) < 4;
          BOOL v71 = [v69 swFaceId] != -1
             && (int)(v60 - [v69 swLastFrameSeen]) < 4;
          if (v70 || v71)
          {
            double v72 = r1_16;
            double v73 = v11;
            double v74 = v67;
            if (v70)
            {
              [v69 hwCenter];
              double v76 = v75;
              [v69 hwSize];
              double v74 = v76 - v77 * 0.5;
              [v69 hwCenter];
              double v79 = v78;
              [v69 hwSize];
              double v73 = v79 - v80 * 0.5;
              [v69 hwSize];
              double v72 = v81;
              [v69 hwSize];
              double v65 = v82;
            }
            double v158 = v66;
            if (v71)
            {
              [v69 swCenter];
              double v84 = v83;
              [v69 swSize];
              double v86 = v84 - v85 * 0.5;
              [v69 swCenter];
              double v88 = v87;
              [v69 swSize];
              double v90 = v88 - v89 * 0.5;
              [v69 swSize];
              double v92 = v91;
              [v69 swSize];
              double v94 = v93;
              if (v70)
              {
                v168.origin.double x = v74;
                v168.origin.double y = v73;
                v168.size.double width = v72;
                v168.size.double height = v65;
                double v95 = v86;
                double v96 = v90;
                double v97 = v92;
                CGRect v169 = CGRectUnion(v168, *(CGRect *)(&v94 - 3));
                double v74 = v169.origin.x;
                double v73 = v169.origin.y;
                double v72 = v169.size.width;
                double v65 = v169.size.height;
              }
              else
              {
                double v65 = v93;
                double v72 = v92;
                double v73 = v90;
                double v74 = v86;
              }
              CGFloat v67 = v147;
              double v11 = v148;
            }
            if (objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"))
            {
              uint64_t v100 = 0;
              float v101 = v65 * v72;
              float v102 = v101 * 0.25;
              while (1)
              {
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "objectAtIndex:", v100), "faceRect");
                v182.origin.double x = v74;
                v182.origin.double y = v73;
                v182.size.double width = v72;
                v182.size.double height = v65;
                CGRect v171 = CGRectIntersection(v170, v182);
                *(float *)&v171.origin.double x = v171.size.width * v171.size.height;
                if (v102 <= *(float *)&v171.origin.x) {
                  break;
                }
                if (++v100 >= (unint64_t)objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count")) {
                  goto LABEL_43;
                }
              }
              double v65 = r1_24;
              double v66 = v158;
            }
            else
            {
LABEL_43:
              LODWORD(v98) = 0.25;
              LODWORD(v99) = 0.25;
              -[CIBurstImageFaceAnalysisContext padRoiRect:paddingX:paddingY:](self, "padRoiRect:paddingX:paddingY:", v74, v73, v72, v65, v98, v99);
              double v104 = v103;
              double v106 = v105;
              double v66 = v107;
              double v109 = v108;
              BurstLoggingMessage("   inserting prev face (hw%d,sw=%d) = (%.3f,%.3f,%.3f,%.3f) padding=(%.3f,%.3f)\n", [v69 hwFaceId], objc_msgSend(v69, "swFaceId"), v103, v105, v107, v108, v137, *(double *)&v138);
              if (a5) {
                *a5 = 1;
              }
              double v110 = v158;
              if (v158 != 0.0)
              {
                CGFloat v111 = r1a;
                CGFloat v112 = r1_8a;
                CGFloat v113 = v17;
                v183.origin.double x = v104;
                v183.origin.double y = v106;
                v183.size.double width = v66;
                v183.size.double height = v109;
                CGRect v172 = CGRectUnion(*(CGRect *)(&v110 - 2), v183);
                double v104 = v172.origin.x;
                double v106 = v172.origin.y;
                double v66 = v172.size.width;
                double v109 = v172.size.height;
              }
              BurstLoggingMessage("   fcrect  = (%.3f,%.3f,%.3f,%.3f)\n", v104, v106, v66, v109);
              CGFloat r1a = v104;
              CGFloat r1_8a = v109;
              CGFloat v17 = v106;
              double v65 = r1_24;
            }
          }
        }
        uint64_t v63 = [(NSMutableArray *)faceInfoArray countByEnumeratingWithState:&v159 objects:v163 count:16];
      }
      while (v63);
    }
    else
    {
      double v66 = v157;
    }
    id v7 = v138;
    CGFloat v126 = (double)(int)[v138 width];
    v185.size.double height = (double)(int)[v138 height];
    v185.origin.double x = 0.0;
    v185.origin.double y = 0.0;
    v175.origin.double x = r1a;
    v175.size.double height = r1_8a;
    v175.origin.double y = v17;
    v175.size.double width = v66;
    v185.size.double width = v126;
    CGRect v176 = CGRectIntersection(v175, v185);
    double v127 = v176.origin.x;
    double v128 = v176.origin.y;
    double v129 = v176.size.width;
    double v130 = v176.size.height;
    CGFloat v131 = (double)(int)[v138 width];
    v186.size.double height = (double)(int)[v138 height];
    v186.origin.double x = 0.0;
    v186.origin.double y = 0.0;
    v186.size.double width = v131;
    CGRect v177 = CGRectIntersection(v142, v186);
    if (v129 > 0.0 && v130 > 0.0)
    {
      v187.origin.double x = v127;
      v187.origin.double y = v128;
      v187.size.double width = v129;
      v187.size.double height = v130;
      CGRect v177 = CGRectUnion(v177, v187);
    }
    objc_msgSend(a4, "setFacesRoiRect:", v177.origin.x, v177.origin.y, v177.size.width, v177.size.height);
    objc_msgSend(a4, "setNumHWFaces:", objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"));
  }
  unsigned int v132 = [a4 orientation];
  if (v132 > 8) {
    goto LABEL_76;
  }
  if (((1 << v132) & 0x18) != 0)
  {
    double v127 = (double)(int)[v7 width] - v127 - v129;
    double v134 = (double)(int)[v7 height] - v128 - v130;
    double v133 = v130;
LABEL_77:
    double v128 = v127;
    goto LABEL_78;
  }
  if (((1 << v132) & 0xC0) != 0)
  {
    double v134 = (double)(int)[v7 width] - v127 - v129;
    double v133 = v129;
    double v129 = v130;
    goto LABEL_78;
  }
  if (((1 << v132) & 0x120) == 0)
  {
LABEL_76:
    double v133 = v130;
    double v134 = v128;
    goto LABEL_77;
  }
  double v128 = (double)(int)[v7 height] - v128 - v130;
  double v133 = v129;
  double v129 = v130;
  double v134 = v127;
LABEL_78:
  double v135 = v128;
  double v136 = v129;
  result.size.double height = v133;
  result.size.double width = v136;
  result.origin.double y = v134;
  result.origin.double x = v135;
  return result;
}

- (id)findOverlappingFaceStat:(CGRect)a3 imageStat:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v8 = objc_msgSend(a4, "faceStatArray", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  uint64_t v12 = *(void *)v24;
LABEL_3:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v24 != v12) {
      objc_enumerationMutation(v8);
    }
    uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
    [v14 faceRect];
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.double width = width;
    v31.size.double height = height;
    CGRect v30 = CGRectIntersection(v29, v31);
    float v15 = v30.size.width * v30.size.height;
    [v14 faceRect];
    double v17 = v16;
    [v14 faceRect];
    *(float *)&double v19 = v15 * 4.0;
    float v11 = width * height;
    if ((float)(v15 * 4.0) < v11)
    {
      float v20 = v17 * v18;
      BOOL v21 = *(float *)&v19 < v20;
    }
    else
    {
      BOOL v21 = 0;
    }
    if (!v21) {
      return v14;
    }
    if (v10 == ++v13)
    {
      uint64_t v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v19);
      uint64_t v14 = 0;
      if (v10) {
        goto LABEL_3;
      }
      return v14;
    }
  }
}

- (int)findFacesInImage:(id)a3 imageStat:(id)a4
{
  uint64_t v229 = *MEMORY[0x1E4F143B8];
  int v179 = [a3 width];
  int v7 = [a3 height];
  CGRect v185 = self;
  [(CIBurstImageFaceAnalysisContext *)self setupFaceDetector];
  int v182 = [a3 width];
  int v181 = [a3 height];
  CGRect v183 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  id v219 = 0;
  id v189 = a4;
  unsigned int v8 = [a4 orientation] - 3;
  if (v8 > 5) {
    unsigned int v184 = 0;
  }
  else {
    unsigned int v184 = dword_19395001C[v8];
  }
  unsigned __int8 v218 = 0;
  [(CIBurstImageFaceAnalysisContext *)self calculateFaceCoreROI:a3 imageStat:a4 needFaceCore:&v218];
  rect2.origin.double x = v9;
  rect2.origin.double y = v10;
  rect2.size.double width = v11;
  rect2.size.double height = v12;
  *(void *)&long long v223 = 0;
  *((void *)&v223 + 1) = &v223;
  *(void *)&long long v224 = 0x3052000000;
  *((void *)&v224 + 1) = __Block_byref_object_copy__0;
  v225 = __Block_byref_object_dispose__0;
  uint64_t v13 = (objc_class *)getFaceCoreImageClass_softClass;
  uint64_t v226 = getFaceCoreImageClass_softClass;
  if (!getFaceCoreImageClass_softClass)
  {
    *(void *)&long long v220 = MEMORY[0x1E4F143A8];
    *((void *)&v220 + 1) = 3221225472;
    *(void *)&long long v221 = __getFaceCoreImageClass_block_invoke;
    *((void *)&v221 + 1) = &unk_1E57710B8;
    v222 = &v223;
    __getFaceCoreImageClass_block_invoke((uint64_t)&v220);
    uint64_t v13 = *(objc_class **)(*((void *)&v223 + 1) + 40);
  }
  _Block_object_dispose(&v223, 8);
  id v178 = (id)objc_msgSend([v13 alloc], "initWithWidth:height:bytesPerRow:buffer:freeWhenDone:", (int)objc_msgSend(a3, "width"), (int)objc_msgSend(a3, "height"), (int)objc_msgSend(a3, "bytesPerRow"), objc_msgSend(a3, "Ybuffer"), 0);
  BurstLoggingMessage("  needFaceCore = %d\n", v218);
  CGRect v187 = (void *)[MEMORY[0x1E4F1CA48] array];
  unint64_t v180 = v7;
  if ([(CIBurstImageFaceAnalysisContext *)self version] >= 2)
  {
    long long v215 = 0u;
    long long v216 = 0u;
    long long v213 = 0u;
    long long v214 = 0u;
    uint64_t v14 = (void *)[a4 faceStatArray];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v213 objects:v228 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v214;
      double v186 = (double)(unint64_t)v7;
      double v17 = 0.5;
      double v18 = (long long *)MEMORY[0x1E4F1DB28];
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v214 != v16) {
            objc_enumerationMutation(v14);
          }
          float v20 = *(void **)(*((void *)&v213 + 1) + 8 * i);
          if ([v20 hasLeftEye] && objc_msgSend(v20, "hasRightEye"))
          {
            *(void *)&long long v223 = 0;
            *((void *)&v223 + 1) = &v223;
            *(void *)&long long v224 = 0x3052000000;
            *((void *)&v224 + 1) = __Block_byref_object_copy__0;
            v225 = __Block_byref_object_dispose__0;
            BOOL v21 = (objc_class *)getFaceCoreFaceClass_softClass;
            uint64_t v226 = getFaceCoreFaceClass_softClass;
            if (!getFaceCoreFaceClass_softClass)
            {
              *(void *)&long long v220 = MEMORY[0x1E4F143A8];
              *((void *)&v220 + 1) = 3221225472;
              *(void *)&long long v221 = __getFaceCoreFaceClass_block_invoke;
              *((void *)&v221 + 1) = &unk_1E57710B8;
              v222 = &v223;
              __getFaceCoreFaceClass_block_invoke((uint64_t)&v220);
              BOOL v21 = *(objc_class **)(*((void *)&v223 + 1) + 40);
            }
            _Block_object_dispose(&v223, 8);
            id v22 = objc_alloc_init(v21);
            if ([v20 hasRollAngle])
            {
              [v20 rollAngle];
              uint64_t v24 = (uint64_t)v23;
              if ((uint64_t)v23 > 180) {
                uint64_t v24 = (uint64_t)v23 - 360;
              }
              [v22 setFaceAngle:(float)v24];
              [v22 faceAngle];
              float v26 = v25 + 90.0;
            }
            else
            {
              [v22 setFaceAngle:0.0];
              float v26 = (float)(int)v184 + 90.0;
            }
            float v190 = v26;
            if ([v20 hasYawAngle])
            {
              [v20 yawAngle];
              if (v27 >= 30.0)
              {
                [v20 yawAngle];
                if (v28 < 180.0)
                {
                  uint64_t v29 = 1;
LABEL_29:
                  [v22 setFaceType:v29];
                  [v20 faceRect];
                  uint64_t v33 = v32;
                  uint64_t v35 = v34;
                  double v37 = v36;
                  double v39 = v38;
                  [v20 faceRect];
                  double MidX = CGRectGetMidX(v230);
                  [v20 faceRect];
                  double MidY = CGRectGetMidY(v231);
                  double v42 = MidY;
                  if (v37 >= v39) {
                    double v43 = v39;
                  }
                  else {
                    double v43 = v37;
                  }
                  *(double *)v212 = MidX;
                  *(double *)&v212[1] = MidY;
                  v212[2] = v33;
                  v212[3] = v35;
                  *(double *)&v212[4] = v37;
                  *(double *)&v212[5] = v39;
                  [v22 setFace:v212];
                  float v44 = v43 * v17;
                  double v45 = v44;
                  [v22 setFaceSize:v44];
                  long long v223 = 0u;
                  long long v224 = 0u;
                  long long v220 = 0u;
                  long long v221 = 0u;
                  double v46 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                  double v47 = 0.0;
                  CGFloat v48 = 0.0;
                  if ([v20 hasLeftEye])
                  {
                    [v20 leftEyeRect];
                    CGFloat v48 = CGRectGetMidX(v232);
                    [v20 leftEyeRect];
                    double v49 = CGRectGetMidY(v233);
                    long long v50 = v18[1];
                    long long v223 = *v18;
                    long long v224 = v50;
                    [v20 leftEyeBlinkScore];
                    double v47 = v186 - v49;
                    if (v51 >= 30.0) {
                      objc_msgSend(v46, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), getFCRFaceExpressionLeftEyeClosed());
                    }
                  }
                  double v52 = 0.0;
                  CGFloat v53 = 0.0;
                  if ([v20 hasRightEye])
                  {
                    [v20 rightEyeRect];
                    CGFloat v53 = CGRectGetMidX(v234);
                    [v20 rightEyeRect];
                    double v54 = CGRectGetMidY(v235);
                    long long v55 = v18[1];
                    long long v220 = *v18;
                    long long v221 = v55;
                    [v20 rightEyeBlinkScore];
                    double v52 = v186 - v54;
                    if (v56 >= 30.0) {
                      objc_msgSend(v46, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), getFCRFaceExpressionRightEyeClosed());
                    }
                  }
                  [v20 smileScore];
                  if (v57 > 30.0) {
                    objc_msgSend(v46, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), getFCRFaceExpressionSmile());
                  }
                  [v22 setExpressionFeatures:v46];
                  __double2 v58 = __sincos_stret(v190 / 180.0 * 3.14159265);
                  long long v210 = v223;
                  long long v211 = v224;
                  *(CGFloat *)v209 = v48;
                  *(double *)&v209[1] = v47;
                  [v22 setLeftEye:v209];
                  long long v207 = v220;
                  long long v208 = v221;
                  *(CGFloat *)v206 = v53;
                  *(double *)&v206[1] = v52;
                  [v22 setRightEye:v206];
                  double v17 = 0.5;
                  v203[0] = MidX + v58.__sinval * v45 * 0.5;
                  v203[1] = v42 + v58.__cosval * v45 * 0.5;
                  long long v59 = v18[1];
                  long long v204 = *v18;
                  long long v205 = v59;
                  [v22 setMouth:v203];
                  [v187 addObject:v22];

                  continue;
                }
              }
              [v20 yawAngle];
              if (v30 <= 330.0)
              {
                [v20 yawAngle];
                if (v31 > 180.0)
                {
                  uint64_t v29 = 2;
                  goto LABEL_29;
                }
              }
            }
            uint64_t v29 = 0;
            goto LABEL_29;
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v213 objects:v228 count:16];
      }
      while (v15);
    }
  }
  int v60 = v218;
  if (v218)
  {
    v236.origin.double x = 0.0;
    v236.origin.double y = 0.0;
    v236.size.double width = (double)v182;
    v236.size.double height = (double)v181;
    if (!CGRectEqualToRect(v236, rect2))
    {
      BurstLoggingMessage("setting faces ROI to (%.3f,%.3f,%.3f,%.3f)\n", rect2.origin.x, rect2.origin.y, rect2.size.width, rect2.size.height);
      uint64_t v61 = [MEMORY[0x1E4F29238] valueWithBytes:&rect2 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      *(void *)&long long v220 = 0;
      *((void *)&v220 + 1) = &v220;
      *(void *)&long long v221 = 0x2020000000;
      uint64_t v62 = (void *)getFCRDetectionParamDetectionRegionSymbolLoc_ptr;
      *((void *)&v221 + 1) = getFCRDetectionParamDetectionRegionSymbolLoc_ptr;
      if (!getFCRDetectionParamDetectionRegionSymbolLoc_ptr)
      {
        *(void *)&long long v223 = MEMORY[0x1E4F143A8];
        *((void *)&v223 + 1) = 3221225472;
        *(void *)&long long v224 = __getFCRDetectionParamDetectionRegionSymbolLoc_block_invoke;
        *((void *)&v224 + 1) = &unk_1E57710B8;
        v225 = (void (*)(uint64_t))&v220;
        uint64_t v63 = (void *)FaceCoreLibrary();
        uint64_t v64 = dlsym(v63, "FCRDetectionParamDetectionRegion");
        *(void *)(*((void *)v225 + 1) + 24) = v64;
        getFCRDetectionParamDetectionRegionSymbolLoc_ptr = *(void *)(*((void *)v225 + 1) + 24);
        uint64_t v62 = *(void **)(*((void *)&v220 + 1) + 24);
      }
      _Block_object_dispose(&v220, 8);
      if (!v62) {
        -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:]1();
      }
      [v183 setObject:v61 forKey:*v62];
    }
    uint64_t v65 = [NSNumber numberWithInt:v184];
    *(void *)&long long v220 = 0;
    *((void *)&v220 + 1) = &v220;
    *(void *)&long long v221 = 0x2020000000;
    double v66 = (void *)getFCRDetectionParamInitialAngleSymbolLoc_ptr;
    *((void *)&v221 + 1) = getFCRDetectionParamInitialAngleSymbolLoc_ptr;
    if (!getFCRDetectionParamInitialAngleSymbolLoc_ptr)
    {
      *(void *)&long long v223 = MEMORY[0x1E4F143A8];
      *((void *)&v223 + 1) = 3221225472;
      *(void *)&long long v224 = __getFCRDetectionParamInitialAngleSymbolLoc_block_invoke;
      *((void *)&v224 + 1) = &unk_1E57710B8;
      v225 = (void (*)(uint64_t))&v220;
      CGFloat v67 = (void *)FaceCoreLibrary();
      v68 = dlsym(v67, "FCRDetectionParamInitialAngle");
      *(void *)(*((void *)v225 + 1) + 24) = v68;
      getFCRDetectionParamInitialAngleSymbolLoc_ptr = *(void *)(*((void *)v225 + 1) + 24);
      double v66 = *(void **)(*((void *)&v220 + 1) + 24);
    }
    _Block_object_dispose(&v220, 8);
    if (!v66) {
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:]0();
    }
    [v183 setObject:v65 forKey:*v66];
    double v69 = rect2.size.width * rect2.size.height;
    if (rect2.size.width * rect2.size.height <= 0.100000001) {
      uint64_t v70 = objc_msgSend(MEMORY[0x1E4F1C978], "array", v69);
    }
    else {
      uint64_t v70 = -[FCRFaceDetector detectFacesInImage:options:error:](v185->faceDetector, "detectFacesInImage:options:error:", v178, v183, &v219, v69);
    }
    BOOL v71 = (void *)v70;
  }
  else
  {
    BOOL v71 = 0;
  }
  if (-[CIBurstImageFaceAnalysisContext version](v185, "version") >= 2 && [v187 count]) {
    double v72 = (void *)[v187 arrayByAddingObjectsFromArray:v71];
  }
  else {
    double v72 = v71;
  }
  CGRect v188 = v72;
  if ((unint64_t)[v72 count] >= 7)
  {
    v202[0] = MEMORY[0x1E4F143A8];
    v202[1] = 3221225472;
    v202[2] = __62__CIBurstImageFaceAnalysisContext_findFacesInImage_imageStat___block_invoke;
    v202[3] = &unk_1E5771058;
    v202[7] = 0;
    v202[6] = 0;
    *(double *)&v202[8] = (double)v182;
    *(double *)&v202[9] = (double)v181;
    v202[4] = v185;
    v202[5] = v189;
    CGRect v188 = objc_msgSend((id)objc_msgSend(v188, "sortedArrayUsingComparator:", v202), "subarrayWithRange:", 0, 6);
  }
  if (v219) {
    BurstLoggingMessage("Face detection error\n");
  }
  v185->timeFaceDetectionDone = timeElapsedSinceInit();
  if (v185->faceDetector && v188 && [v188 count])
  {
    double v73 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v74 = [NSNumber numberWithBool:1];
    *(void *)&long long v220 = 0;
    *((void *)&v220 + 1) = &v220;
    *(void *)&long long v221 = 0x2020000000;
    double v75 = (void *)getFCRExtractionParamExtractBlinkSymbolLoc_ptr;
    *((void *)&v221 + 1) = getFCRExtractionParamExtractBlinkSymbolLoc_ptr;
    if (!getFCRExtractionParamExtractBlinkSymbolLoc_ptr)
    {
      *(void *)&long long v223 = MEMORY[0x1E4F143A8];
      *((void *)&v223 + 1) = 3221225472;
      *(void *)&long long v224 = __getFCRExtractionParamExtractBlinkSymbolLoc_block_invoke;
      *((void *)&v224 + 1) = &unk_1E57710B8;
      v225 = (void (*)(uint64_t))&v220;
      double v76 = (void *)FaceCoreLibrary();
      double v77 = dlsym(v76, "FCRExtractionParamExtractBlink");
      *(void *)(*((void *)v225 + 1) + 24) = v77;
      getFCRExtractionParamExtractBlinkSymbolLoc_ptr = *(void *)(*((void *)v225 + 1) + 24);
      double v75 = *(void **)(*((void *)&v220 + 1) + 24);
    }
    _Block_object_dispose(&v220, 8);
    if (!v75) {
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.4();
    }
    [v73 setObject:v74 forKey:*v75];
    uint64_t v78 = [NSNumber numberWithBool:1];
    *(void *)&long long v220 = 0;
    *((void *)&v220 + 1) = &v220;
    *(void *)&long long v221 = 0x2020000000;
    double v79 = (void *)getFCRExtractionParamExtractSmileSymbolLoc_ptr;
    *((void *)&v221 + 1) = getFCRExtractionParamExtractSmileSymbolLoc_ptr;
    if (!getFCRExtractionParamExtractSmileSymbolLoc_ptr)
    {
      *(void *)&long long v223 = MEMORY[0x1E4F143A8];
      *((void *)&v223 + 1) = 3221225472;
      *(void *)&long long v224 = __getFCRExtractionParamExtractSmileSymbolLoc_block_invoke;
      *((void *)&v224 + 1) = &unk_1E57710B8;
      v225 = (void (*)(uint64_t))&v220;
      double v80 = (void *)FaceCoreLibrary();
      double v81 = dlsym(v80, "FCRExtractionParamExtractSmile");
      *(void *)(*((void *)v225 + 1) + 24) = v81;
      getFCRExtractionParamExtractSmileSymbolLoc_ptr = *(void *)(*((void *)v225 + 1) + 24);
      double v79 = *(void **)(*((void *)&v220 + 1) + 24);
    }
    _Block_object_dispose(&v220, 8);
    if (!v79) {
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.5();
    }
    [v73 setObject:v78 forKey:*v79];
    uint64_t v82 = [NSNumber numberWithBool:0];
    *(void *)&long long v220 = 0;
    *((void *)&v220 + 1) = &v220;
    *(void *)&long long v221 = 0x2020000000;
    double v83 = (void *)getFCRExtractionParamExtractFaceprintSymbolLoc_ptr;
    *((void *)&v221 + 1) = getFCRExtractionParamExtractFaceprintSymbolLoc_ptr;
    if (!getFCRExtractionParamExtractFaceprintSymbolLoc_ptr)
    {
      *(void *)&long long v223 = MEMORY[0x1E4F143A8];
      *((void *)&v223 + 1) = 3221225472;
      *(void *)&long long v224 = __getFCRExtractionParamExtractFaceprintSymbolLoc_block_invoke;
      *((void *)&v224 + 1) = &unk_1E57710B8;
      v225 = (void (*)(uint64_t))&v220;
      double v84 = (void *)FaceCoreLibrary();
      double v85 = dlsym(v84, "FCRExtractionParamExtractFaceprint");
      *(void *)(*((void *)v225 + 1) + 24) = v85;
      getFCRExtractionParamExtractFaceprintSymbolLoc_ptr = *(void *)(*((void *)v225 + 1) + 24);
      double v83 = *(void **)(*((void *)&v220 + 1) + 24);
    }
    _Block_object_dispose(&v220, 8);
    if (!v83) {
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.6();
    }
    [v73 setObject:v82 forKey:*v83];
    uint64_t v86 = [NSNumber numberWithBool:0];
    *(void *)&long long v220 = 0;
    *((void *)&v220 + 1) = &v220;
    *(void *)&long long v221 = 0x2020000000;
    double v87 = (void *)getFCRExtractionParamExtractLandmarkPointsSymbolLoc_ptr;
    *((void *)&v221 + 1) = getFCRExtractionParamExtractLandmarkPointsSymbolLoc_ptr;
    if (!getFCRExtractionParamExtractLandmarkPointsSymbolLoc_ptr)
    {
      *(void *)&long long v223 = MEMORY[0x1E4F143A8];
      *((void *)&v223 + 1) = 3221225472;
      *(void *)&long long v224 = __getFCRExtractionParamExtractLandmarkPointsSymbolLoc_block_invoke;
      *((void *)&v224 + 1) = &unk_1E57710B8;
      v225 = (void (*)(uint64_t))&v220;
      double v88 = (void *)FaceCoreLibrary();
      double v89 = dlsym(v88, "FCRExtractionParamExtractLandmarkPoints");
      *(void *)(*((void *)v225 + 1) + 24) = v89;
      getFCRExtractionParamExtractLandmarkPointsSymbolLoc_ptr = *(void *)(*((void *)v225 + 1) + 24);
      double v87 = *(void **)(*((void *)&v220 + 1) + 24);
    }
    _Block_object_dispose(&v220, 8);
    if (!v87) {
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.7();
    }
    [v73 setObject:v86 forKey:*v87];
    uint64_t v90 = [NSNumber numberWithBool:1];
    *(void *)&long long v220 = 0;
    *((void *)&v220 + 1) = &v220;
    *(void *)&long long v221 = 0x2020000000;
    double v91 = (void *)getFCRExtractionParamEnhancedEyesAndMouthLocalizationSymbolLoc_ptr;
    *((void *)&v221 + 1) = getFCRExtractionParamEnhancedEyesAndMouthLocalizationSymbolLoc_ptr;
    if (!getFCRExtractionParamEnhancedEyesAndMouthLocalizationSymbolLoc_ptr)
    {
      *(void *)&long long v223 = MEMORY[0x1E4F143A8];
      *((void *)&v223 + 1) = 3221225472;
      *(void *)&long long v224 = __getFCRExtractionParamEnhancedEyesAndMouthLocalizationSymbolLoc_block_invoke;
      *((void *)&v224 + 1) = &unk_1E57710B8;
      v225 = (void (*)(uint64_t))&v220;
      double v92 = (void *)FaceCoreLibrary();
      double v93 = dlsym(v92, "FCRExtractionParamEnhancedEyesAndMouthLocalization");
      *(void *)(*((void *)v225 + 1) + 24) = v93;
      getFCRExtractionParamEnhancedEyesAndMouthLocalizationSymbolLoc_ptr = *(void *)(*((void *)v225 + 1) + 24);
      double v91 = *(void **)(*((void *)&v220 + 1) + 24);
    }
    _Block_object_dispose(&v220, 8);
    if (!v91) {
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.8();
    }
    [v73 setObject:v90 forKey:*v91];
    uint64_t v94 = [NSNumber numberWithInt:v184];
    *(void *)&long long v220 = 0;
    *((void *)&v220 + 1) = &v220;
    *(void *)&long long v221 = 0x2020000000;
    double v95 = (void *)getFCRExtractionParamInitialAngleSymbolLoc_ptr;
    *((void *)&v221 + 1) = getFCRExtractionParamInitialAngleSymbolLoc_ptr;
    if (!getFCRExtractionParamInitialAngleSymbolLoc_ptr)
    {
      *(void *)&long long v223 = MEMORY[0x1E4F143A8];
      *((void *)&v223 + 1) = 3221225472;
      *(void *)&long long v224 = __getFCRExtractionParamInitialAngleSymbolLoc_block_invoke;
      *((void *)&v224 + 1) = &unk_1E57710B8;
      v225 = (void (*)(uint64_t))&v220;
      double v96 = (void *)FaceCoreLibrary();
      double v97 = dlsym(v96, "FCRExtractionParamInitialAngle");
      *(void *)(*((void *)v225 + 1) + 24) = v97;
      getFCRExtractionParamInitialAngleSymbolLoc_ptr = *(void *)(*((void *)v225 + 1) + 24);
      double v95 = *(void **)(*((void *)&v220 + 1) + 24);
    }
    _Block_object_dispose(&v220, 8);
    if (!v95) {
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.9();
    }
    [v73 setObject:v94 forKey:*v95];
    if (v60 || [(CIBurstImageFaceAnalysisContext *)v185 version] <= 1) {
      CGRect v188 = (void *)[(FCRFaceDetector *)v185->faceDetector extractDetailsForFaces:v188 inImage:v178 options:v73 error:&v219];
    }
    if (v219) {
      BurstLoggingMessage("extractDetails error: %s\n", (const char *)objc_msgSend((id)objc_msgSend(v219, "localizedDescription"), "UTF8String"));
    }
  }
  v185->timeBlinkDetectionDone = timeElapsedSinceInit();
  if ([(CIBurstImageFaceAnalysisContext *)v185 version] >= 2)
  {
    if ([v188 count] || objc_msgSend((id)objc_msgSend(v189, "faceStatArray"), "count")) {
      v185->numFramesNoFaces = 0;
    }
    else {
      ++v185->numFramesNoFaces;
    }
  }
  if ([v188 count])
  {
    for (unint64_t j = 0; j < [v188 count]; ++j)
    {
      double v99 = (void *)[v188 objectAtIndex:j];
      uint64_t v100 = objc_msgSend((id)objc_msgSend(v99, "expressionFeatures"), "valueForKey:", getFCRFaceExpressionLeftEyeClosed());
      float v101 = objc_msgSend((id)objc_msgSend(v99, "expressionFeatures"), "valueForKey:", getFCRFaceExpressionRightEyeClosed());
      float v102 = objc_msgSend((id)objc_msgSend(v99, "expressionFeatures"), "valueForKey:", getFCRFaceExpressionSmile());
      if (v100)
      {
        uint64_t v103 = [v100 BOOLValue] ^ 1;
        if (v101) {
          goto LABEL_99;
        }
      }
      else
      {
        uint64_t v103 = 1;
        if (v101)
        {
LABEL_99:
          uint64_t v104 = [v101 BOOLValue] ^ 1;
          if (!v102) {
            goto LABEL_100;
          }
          goto LABEL_104;
        }
      }
      uint64_t v104 = 1;
      if (!v102)
      {
LABEL_100:
        if (!v99) {
          goto LABEL_105;
        }
        goto LABEL_101;
      }
LABEL_104:
      float v102 = (void *)[v102 BOOLValue];
      if (!v99)
      {
LABEL_105:
        long long v109 = 0uLL;
        long long v200 = 0u;
        long long v201 = 0u;
        double v108 = 0.0;
        double v107 = 0.0;
        double v106 = 0.0;
        double v105 = 0.0;
        long long v199 = 0u;
        goto LABEL_106;
      }
LABEL_101:
      [v99 face];
      double v106 = *((double *)&v200 + 1);
      double v105 = *(double *)&v200;
      double v108 = *((double *)&v201 + 1);
      double v107 = *(double *)&v201;
      long long v109 = 0uLL;
LABEL_106:
      long long v197 = v109;
      long long v198 = v109;
      long long v195 = v109;
      long long v196 = v109;
      double v110 = (void *)[v189 faceStatArray];
      uint64_t v111 = [v110 countByEnumeratingWithState:&v195 objects:v227 count:16];
      double v112 = v105 + 0.0;
      double v113 = v106 + 0.0;
      if (v111)
      {
        uint64_t v115 = *(void *)v196;
        do
        {
          for (uint64_t k = 0; k != v111; ++k)
          {
            if (*(void *)v196 != v115) {
              objc_enumerationMutation(v110);
            }
            uint64_t v117 = *(CIBurstFaceStat **)(*((void *)&v195 + 1) + 8 * k);
            [(CIBurstFaceStat *)v117 faceRect];
            v241.origin.double x = v112;
            v241.origin.double y = v113;
            v241.size.double width = v107;
            v241.size.double height = v108;
            CGRect v238 = CGRectIntersection(v237, v241);
            double width = v238.size.width;
            double height = v238.size.height;
            [(CIBurstFaceStat *)v117 faceRect];
            double v121 = v120;
            [(CIBurstFaceStat *)v117 faceRect];
            float v123 = width * height;
            float v124 = v123 * 4.0;
            float v114 = v107 * v108;
            if (v124 < v114)
            {
              float v125 = v121 * v122;
              BOOL v126 = v124 < v125;
            }
            else
            {
              BOOL v126 = 0;
            }
            if (!v126)
            {
              [(CIBurstFaceStat *)v117 setHwFaceId:[(CIBurstFaceStat *)v117 faceId]];
              goto LABEL_119;
            }
          }
          uint64_t v111 = [v110 countByEnumeratingWithState:&v195 objects:v227 count:16];
        }
        while (v111);
      }
      uint64_t v117 = objc_alloc_init(CIBurstFaceStat);
      objc_msgSend((id)objc_msgSend(v189, "faceStatArray"), "addObject:", v117);

LABEL_119:
      -[CIBurstFaceStat setFaceRect:](v117, "setFaceRect:", v112, v113, v107, v108);
      BOOL v127 = [(CIBurstImageFaceAnalysisContext *)v185 version] > 1;
      [(CIBurstFaceStat *)v117 faceRect];
      double x = v128;
      double y = v129;
      double v136 = v130;
      double v137 = v131;
      if (v127)
      {
        LODWORD(v132) = 0.25;
        LODWORD(v133) = 0.25;
        -[CIBurstImageFaceAnalysisContext padRoiRect:paddingX:paddingY:](v185, "padRoiRect:paddingX:paddingY:", v128, v129, v130, v131, v132, v133);
        double x = v138;
        double y = v139;
        double v136 = v140;
        double v137 = v141;
      }
      if ([v189 numHWFaces] || j)
      {
        [v189 facesRoiRect];
        v242.origin.double x = x;
        v242.origin.double y = y;
        v242.size.double width = v136;
        v242.size.double height = v137;
        CGRect v240 = CGRectUnion(v239, v242);
        double x = v240.origin.x;
        double y = v240.origin.y;
        double v136 = v240.size.width;
        double v137 = v240.size.height;
      }
      objc_msgSend(v189, "setFacesRoiRect:", x, y, v136, v137);
      -[CIBurstFaceStat setNormalizedFaceRect:](v117, "setNormalizedFaceRect:", v112 * (float)(1.0 / (float)(unint64_t)v179), v113 * (float)(1.0 / (float)v180), v107 * (float)(1.0 / (float)(unint64_t)v179), v108 * (float)(1.0 / (float)v180));
      [(CIBurstFaceStat *)v117 setFoundByFaceCore:1];
      if ([(CIBurstImageFaceAnalysisContext *)v185 version] <= 1)
      {
        [(CIBurstFaceStat *)v117 setHasLeftEye:1];
        [(CIBurstFaceStat *)v117 setHasRightEye:1];
      }
      [(CIBurstFaceStat *)v117 setLeftEyeOpen:v103];
      [(CIBurstFaceStat *)v117 setRightEyeOpen:v104];
      [(CIBurstFaceStat *)v117 setSmiling:v102];
      CGRect v142 = (void *)[v99 expressionFeatures];
      *(void *)&long long v220 = 0;
      *((void *)&v220 + 1) = &v220;
      *(void *)&long long v221 = 0x2020000000;
      CGFloat v143 = (void *)getFCRFaceExpressionLeftEyeClosedScoreSymbolLoc_ptr;
      *((void *)&v221 + 1) = getFCRFaceExpressionLeftEyeClosedScoreSymbolLoc_ptr;
      if (!getFCRFaceExpressionLeftEyeClosedScoreSymbolLoc_ptr)
      {
        *(void *)&long long v223 = MEMORY[0x1E4F143A8];
        *((void *)&v223 + 1) = 3221225472;
        *(void *)&long long v224 = __getFCRFaceExpressionLeftEyeClosedScoreSymbolLoc_block_invoke;
        *((void *)&v224 + 1) = &unk_1E57710B8;
        v225 = (void (*)(uint64_t))&v220;
        CGFloat v144 = (void *)FaceCoreLibrary();
        v145 = dlsym(v144, "FCRFaceExpressionLeftEyeClosedScore");
        *(void *)(*((void *)v225 + 1) + 24) = v145;
        getFCRFaceExpressionLeftEyeClosedScoreSymbolLoc_ptr = *(void *)(*((void *)v225 + 1) + 24);
        CGFloat v143 = *(void **)(*((void *)&v220 + 1) + 24);
      }
      _Block_object_dispose(&v220, 8);
      if (!v143) {
        -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:]();
      }
      objc_msgSend((id)objc_msgSend(v142, "valueForKey:", *v143), "floatValue");
      -[CIBurstFaceStat setLeftEyeBlinkScore:](v117, "setLeftEyeBlinkScore:");
      v146 = (void *)[v99 expressionFeatures];
      *(void *)&long long v220 = 0;
      *((void *)&v220 + 1) = &v220;
      *(void *)&long long v221 = 0x2020000000;
      CGFloat v147 = (void *)getFCRFaceExpressionRightEyeClosedScoreSymbolLoc_ptr;
      *((void *)&v221 + 1) = getFCRFaceExpressionRightEyeClosedScoreSymbolLoc_ptr;
      if (!getFCRFaceExpressionRightEyeClosedScoreSymbolLoc_ptr)
      {
        *(void *)&long long v223 = MEMORY[0x1E4F143A8];
        *((void *)&v223 + 1) = 3221225472;
        *(void *)&long long v224 = __getFCRFaceExpressionRightEyeClosedScoreSymbolLoc_block_invoke;
        *((void *)&v224 + 1) = &unk_1E57710B8;
        v225 = (void (*)(uint64_t))&v220;
        CGFloat v148 = (void *)FaceCoreLibrary();
        v149 = dlsym(v148, "FCRFaceExpressionRightEyeClosedScore");
        *(void *)(*((void *)v225 + 1) + 24) = v149;
        getFCRFaceExpressionRightEyeClosedScoreSymbolLoc_ptr = *(void *)(*((void *)v225 + 1) + 24);
        CGFloat v147 = *(void **)(*((void *)&v220 + 1) + 24);
      }
      _Block_object_dispose(&v220, 8);
      if (!v147) {
        -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:]();
      }
      objc_msgSend((id)objc_msgSend(v146, "valueForKey:", *v147), "floatValue");
      -[CIBurstFaceStat setRightEyeBlinkScore:](v117, "setRightEyeBlinkScore:");
      v150 = (void *)[v99 expressionFeatures];
      *(void *)&long long v220 = 0;
      *((void *)&v220 + 1) = &v220;
      *(void *)&long long v221 = 0x2020000000;
      v151 = (void *)getFCRFaceExpressionSmileScoreSymbolLoc_ptr;
      *((void *)&v221 + 1) = getFCRFaceExpressionSmileScoreSymbolLoc_ptr;
      if (!getFCRFaceExpressionSmileScoreSymbolLoc_ptr)
      {
        *(void *)&long long v223 = MEMORY[0x1E4F143A8];
        *((void *)&v223 + 1) = 3221225472;
        *(void *)&long long v224 = __getFCRFaceExpressionSmileScoreSymbolLoc_block_invoke;
        *((void *)&v224 + 1) = &unk_1E57710B8;
        v225 = (void (*)(uint64_t))&v220;
        v152 = (void *)FaceCoreLibrary();
        v153 = dlsym(v152, "FCRFaceExpressionSmileScore");
        *(void *)(*((void *)v225 + 1) + 24) = v153;
        getFCRFaceExpressionSmileScoreSymbolLoc_ptr = *(void *)(*((void *)v225 + 1) + 24);
        v151 = *(void **)(*((void *)&v220 + 1) + 24);
      }
      _Block_object_dispose(&v220, 8);
      if (!v151) {
        -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:]();
      }
      objc_msgSend((id)objc_msgSend(v150, "valueForKey:", *v151), "floatValue");
      -[CIBurstFaceStat setSmileScore:](v117, "setSmileScore:");
      [(CIBurstImageFaceAnalysisContext *)v185 version];
      [(CIBurstFaceStat *)v117 faceRect];
      double v155 = v154;
      [(CIBurstFaceStat *)v117 faceRect];
      double v157 = v156;
      double v158 = v155 * 0.300000012;
      if (v99)
      {
        [v99 leftEye];
        [v99 leftEye];
        double v159 = -v158;
        double v160 = -0.5;
        double v161 = v194 + 0.0 + v158 * -0.5;
        double v162 = *((double *)&v193 + 1);
      }
      else
      {
        double v194 = 0.0;
        double v159 = -v158;
        double v162 = 0.0;
        double v160 = -0.5;
        double v161 = v158 * -0.5 + 0.0;
        long long v193 = 0u;
      }
      double v163 = v157 * 0.200000003;
      -[CIBurstFaceStat setLeftEyeRect:](v117, "setLeftEyeRect:", v161, v162 + 0.0 + v163 * v160, v158, v163);
      if (v99)
      {
        [v99 rightEye];
        [v99 rightEye];
        double v164 = v192 + 0.0 + v159 * 0.5;
        double v165 = 0.5;
        double v166 = *((double *)&v191 + 1);
      }
      else
      {
        double v192 = 0.0;
        double v166 = 0.0;
        double v164 = v159 * 0.5 + 0.0;
        double v165 = 0.5;
        long long v191 = 0u;
      }
      -[CIBurstFaceStat setRightEyeRect:](v117, "setRightEyeRect:", v164, v166 + 0.0 + -v163 * v165, v158, v163);
      int v167 = [(CIBurstFaceStat *)v117 faceId];
      [(CIBurstFaceStat *)v117 faceRect];
      double v169 = v168;
      [(CIBurstFaceStat *)v117 faceRect];
      double v171 = v170;
      [(CIBurstFaceStat *)v117 faceRect];
      double v173 = v172;
      [(CIBurstFaceStat *)v117 faceRect];
      BurstLoggingMessage("face %d: rect = %.3f,%.3f,%.3f,%.3f, leftOpen=%d,rightOpen=%d\n", v167, v169, v171, v173, v174, [(CIBurstFaceStat *)v117 leftEyeOpen], [(CIBurstFaceStat *)v117 rightEyeOpen]);
    }
  }
  BurstLoggingMessage("  #faces = %d\n", [v188 count]);
  if ([(CIBurstImageFaceAnalysisContext *)v185 version] <= 1
    && objc_msgSend((id)objc_msgSend(v189, "faceStatArray"), "count"))
  {
    uint64_t v175 = 0;
    int v176 = 0;
    do
    {
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v189, "faceStatArray"), "objectAtIndex:", v175), "foundByFaceCore") & 1) == 0)
      {
        objc_msgSend((id)objc_msgSend(v189, "faceStatArray"), "removeObjectAtIndex:", v175);
        --v176;
      }
      uint64_t v175 = ++v176;
    }
    while (objc_msgSend((id)objc_msgSend(v189, "faceStatArray"), "count") > (unint64_t)v176);
  }
  return [v188 count];
}

uint64_t __62__CIBurstImageFaceAnalysisContext_findFacesInImage_imageStat___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    [a2 face];
    [a2 face];
    float v6 = *(double *)&v39 * *((double *)&v36 + 1);
    if (a3) {
      goto LABEL_3;
    }
LABEL_6:
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    float v7 = 0.0;
    if (a2) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  float v6 = 0.0;
  if (!a3) {
    goto LABEL_6;
  }
LABEL_3:
  [a3 face];
  [a3 face];
  float v7 = *(double *)&v33 * *((double *)&v30 + 1);
  if (a2)
  {
LABEL_4:
    [a2 face];
    double v9 = *((double *)&v26 + 1);
    double v8 = *(double *)&v26;
    double v11 = *((double *)&v27 + 1);
    double v10 = *(double *)&v27;
    goto LABEL_8;
  }
LABEL_7:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  double v11 = 0.0;
  double v10 = 0.0;
  double v9 = 0.0;
  double v8 = 0.0;
LABEL_8:
  CGFloat v12 = objc_msgSend(*(id *)(a1 + 32), "findOverlappingFaceStat:imageStat:", *(void *)(a1 + 40), v8 + *(double *)(a1 + 48), v9 + *(double *)(a1 + 56), v10, v11);
  if (a3)
  {
    [a3 face];
    double v14 = *((double *)&v23 + 1);
    double v13 = *(double *)&v23;
    double v16 = *((double *)&v24 + 1);
    double v15 = *(double *)&v24;
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
    double v16 = 0.0;
    double v15 = 0.0;
    double v14 = 0.0;
    double v13 = 0.0;
  }
  uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "findOverlappingFaceStat:imageStat:", *(void *)(a1 + 40), v13 + *(double *)(a1 + 48), v14 + *(double *)(a1 + 56), v15, v16, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33,
          v34,
          v35,
          v36,
          v37,
          v38,
          v39);
  double v18 = (void *)v17;
  if (v12 && !v17) {
    return -1;
  }
  if (v17 && !v12) {
    return 1;
  }
  if (v12 && v17)
  {
    if ([v12 hasLeftEye]) {
      int v20 = [v12 hasRightEye];
    }
    else {
      int v20 = 0;
    }
    if ([v18 hasLeftEye])
    {
      int v21 = [v18 hasRightEye];
      if (v21 | v20 ^ 1) {
        uint64_t result = 1;
      }
      else {
        uint64_t result = -1;
      }
      if (v21)
      {
        if ((v20 & 1) == 0) {
          return result;
        }
      }
      else if (v20)
      {
        return result;
      }
    }
    else if (v20)
    {
      return -1;
    }
  }
  if (v6 <= v7) {
    return 1;
  }
  else {
    return -1;
  }
}

- (void)calculateFaceFocusInImage:(id)a3 imageStat:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"))
  {
    BurstLoggingMessage("calculateFaceFocus:\n");
    float v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"));
    if (objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"))
    {
      unint64_t v7 = 0;
      do
      {
        double v8 = objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "objectAtIndex:", v7);
        memset(&v58, 0, sizeof(v58));
        if ([v8 hasLeftEye] && objc_msgSend(v8, "hasRightEye"))
        {
          [v8 leftEyeRect];
          CGFloat v10 = v9;
          CGFloat v12 = v11;
          CGFloat v14 = v13;
          CGFloat v16 = v15;
          [v8 rightEyeRect];
          v62.origin.uint64_t x = v17;
          v62.origin.double y = v18;
          v62.size.int width = v19;
          v62.size.int height = v20;
          v59.origin.uint64_t x = v10;
          v59.origin.double y = v12;
          v59.size.int width = v14;
          v59.size.int height = v16;
          CGRect v60 = CGRectUnion(v59, v62);
        }
        else if ([v8 hasLeftEye])
        {
          [v8 leftEyeRect];
        }
        else if ([v8 hasRightEye])
        {
          [v8 rightEyeRect];
        }
        else
        {
          [v8 faceRect];
        }
        v58.origin.uint64_t x = (double)(int)v60.origin.x;
        v58.origin.double y = (double)(int)v60.origin.y;
        v58.size.int width = (double)(int)v60.size.width;
        v58.size.int height = (double)(int)v60.size.height;
        CGFloat v21 = (double)(int)([a3 width] - 2);
        v63.size.int height = (double)(int)([a3 height] - 2);
        v63.origin.uint64_t x = 1.0;
        v63.origin.double y = 1.0;
        v63.size.int width = v21;
        CGRect v61 = CGRectIntersection(v58, v63);
        CGRect v58 = v61;
        BurstLoggingMessage("   adding rect: %.3f,%.3f,%.3f,%.3f\n", v61.origin.x, v61.origin.y, v61.size.width, v61.size.height);
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "value:withObjCType:", &v58, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
        ++v7;
      }
      while (objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count") > v7);
    }
    int v57 = [a3 height];
    int v56 = [a3 bytesPerRow];
    long long v22 = (char *)malloc_type_malloc(v56 * v57, 0x100004077774924uLL);
    if ([v6 count])
    {
      unint64_t v23 = 0;
      do
      {
        memset(&v58, 0, sizeof(v58));
        objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v23), "getValue:", &v58);
        v58.origin.double y = (double)v57 - v58.origin.y - v58.size.height;
        uint64_t v24 = [a3 Ybuffer];
        int height = (int)v58.size.height;
        if ((int)v58.size.height >= 1)
        {
          int v26 = 0;
          uint64_t x = (int)v58.origin.x;
          long long v28 = &v22[v56 * (uint64_t)(int)v58.origin.y + x];
          uint64_t v29 = v24 + v56 * (uint64_t)(int)v58.origin.y;
          uint64_t v30 = x + v56 * (uint64_t)(int)v58.origin.y;
          uint64_t v31 = v24 + ~v56 + v30;
          uint64_t v32 = v24 + 1 - v56 + v30;
          uint64_t v33 = v24 + v56 + v30;
          uint64_t v34 = v24 + v56 - 1 + v30;
          uint64_t v35 = v24 + v56 + 1 + v30;
          uint64_t v36 = v24 - v56 + v30;
          int width = (int)v58.size.width;
          do
          {
            if (width >= 1)
            {
              uint64_t v38 = 0;
              do
              {
                int v39 = *(unsigned __int8 *)(v31 + v38);
                int v40 = *(unsigned __int8 *)(v32 + v38);
                int v41 = *(unsigned __int8 *)(v34 + v38);
                int v42 = *(unsigned __int8 *)(v35 + v38);
                int v43 = 3 * (v41 - v42 + v39 - v40)
                    + 10 * (*(unsigned __int8 *)(v29 + x + v38 - 1) - *(unsigned __int8 *)(v29 + x + v38 + 1));
                int v44 = 3 * (v40 - v42 + v39 - v41)
                    + 10 * (*(unsigned __int8 *)(v36 + v38) - *(unsigned __int8 *)(v33 + v38));
                unsigned int v45 = (v43 * v43 + v44 * v44) >> 11;
                if (v45 >= 0xFF) {
                  LOBYTE(v45) = -1;
                }
                v28[v38++] = v45;
              }
              while ((int)v38 < width);
            }
            ++v26;
            v28 += v56;
            v31 += v56;
            v32 += v56;
            v33 += v56;
            v29 += v56;
            v34 += v56;
            v35 += v56;
            v36 += v56;
          }
          while (v26 < height);
        }
        ++v23;
      }
      while ([v6 count] > v23);
    }
    if (objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"))
    {
      unint64_t v46 = 0;
      do
      {
        double v47 = objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "objectAtIndex:", v46);
        CGFloat v48 = (void *)[v6 objectAtIndex:v46];
        memset(&v58, 0, sizeof(v58));
        [v48 getValue:&v58];
        double v49 = (double)v57 - v58.origin.y - v58.size.height;
        v58.origin.double y = v49;
        if ((int)v58.size.height < 1)
        {
          int v51 = 0;
        }
        else
        {
          int v50 = 0;
          int v51 = 0;
          uint64_t v52 = (uint64_t)&v22[v56 * (uint64_t)(int)v49 + (int)v58.origin.x];
          int v53 = (int)v58.size.width;
          do
          {
            if (v53 >= 1)
            {
              uint64_t v54 = 0;
              do
                v51 += *(unsigned __int8 *)(v52 + v54++);
              while (v53 != v54);
            }
            ++v50;
            v52 += v56;
          }
          while (v50 != (int)v58.size.height);
        }
        BurstLoggingMessage("   focusScore = %d, %.3f\n", v51, v58.size.height * v58.size.width);
        double v55 = (double)v51 / (v58.size.width * v58.size.height);
        *(float *)&double v55 = v55;
        [v47 setFocusScore:v55];
        ++v46;
      }
      while (objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count") > v46);
    }
    free(v22);
  }
}

- (void)calcFaceScores:(id)a3
{
  v4 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  if ([a3 count])
  {
    unint64_t v5 = 0;
    do
    {
      float v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v5), "burstImages"), "objectAtIndex:", 0);
      if (objc_msgSend((id)objc_msgSend(v6, "faceStatArray"), "count"))
      {
        unint64_t v7 = 0;
        do
        {
          double v8 = objc_msgSend((id)objc_msgSend(v6, "faceStatArray"), "objectAtIndex:", v7);
          uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "faceId"));
          uint64_t v10 = [v4 objectForKey:v9];
          if (v10)
          {
            double v11 = (void *)v10;
            [v8 focusScore];
            objc_msgSend(v11, "addScore:");
          }
          else
          {
            CGFloat v12 = [CIBurstFaceScoreEntry alloc];
            [v8 focusScore];
            double v13 = -[CIBurstFaceScoreEntry initWithScore:](v12, "initWithScore:");
            [v4 setObject:v13 forKey:v9];
          }
          ++v7;
        }
        while (objc_msgSend((id)objc_msgSend(v6, "faceStatArray"), "count") > v7);
      }
      ++v5;
    }
    while ([a3 count] > v5);
  }
  if ([a3 count])
  {
    unint64_t v14 = 0;
    do
    {
      double v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v14), "burstImages"), "objectAtIndex:", 0);
      if (objc_msgSend((id)objc_msgSend(v15, "faceStatArray"), "count"))
      {
        unint64_t v16 = 0;
        do
        {
          CGFloat v17 = objc_msgSend((id)objc_msgSend(v15, "faceStatArray"), "objectAtIndex:", v16);
          CGFloat v18 = objc_msgSend(v4, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "faceId")));
          [v18 computeAverage];
          float v20 = v19;
          [v17 focusScore];
          *(float *)&double v22 = v21 / v20;
          [v17 setNormalizedFocusScore:v22];
          [v17 focusScore];
          float v24 = v23 - v20;
          [v18 computeStandardDeviation];
          *(float *)&double v26 = v24 / v25;
          [v17 setNormalizedSigma:v26];
          ++v16;
        }
        while (objc_msgSend((id)objc_msgSend(v15, "faceStatArray"), "count") > v16);
      }
      ++v14;
    }
    while ([a3 count] > v14);
  }
}

- (void)adjustFaceIdsForImageStat:(id)a3
{
  id v3 = a3;
  uint64_t v214 = *MEMORY[0x1E4F143B8];
  BurstLoggingMessage("AdjustFaceIds: Examining '%s'\n", (const char *)objc_msgSend((id)objc_msgSend(a3, "imageId"), "UTF8String"));
  if (!objc_msgSend((id)objc_msgSend(v3, "faceStatArray"), "count")) {
    return;
  }
  double v174 = v3;
  if ([(CIBurstImageFaceAnalysisContext *)self version] >= 2)
  {
    long long v205 = 0u;
    long long v206 = 0u;
    long long v203 = 0u;
    long long v204 = 0u;
    obuint64_t j = (id)[v3 faceStatArray];
    id v177 = (id)[obj countByEnumeratingWithState:&v203 objects:v213 count:16];
    if (!v177) {
      return;
    }
    uint64_t v175 = *(void *)v204;
    while (1)
    {
      for (uint64_t i = 0; i != v177; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v204 != v175) {
          objc_enumerationMutation(obj);
        }
        float v6 = *(void **)(*((void *)&v203 + 1) + 8 * i);
        long long v199 = 0u;
        long long v200 = 0u;
        long long v201 = 0u;
        long long v202 = 0u;
        faceInfoArradouble y = self->faceInfoArray;
        uint64_t v8 = [(NSMutableArray *)faceInfoArray countByEnumeratingWithState:&v199 objects:v212 count:16];
        if (!v8) {
          goto LABEL_20;
        }
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v200;
LABEL_10:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v200 != v10) {
            objc_enumerationMutation(faceInfoArray);
          }
          CGFloat v12 = *(CIBurstFaceInfo **)(*((void *)&v199 + 1) + 8 * v11);
          int v13 = [v6 hwFaceId];
          if (v13 == [(CIBurstFaceInfo *)v12 hwFaceId]) {
            break;
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [(NSMutableArray *)faceInfoArray countByEnumeratingWithState:&v199 objects:v212 count:16];
            if (!v9) {
              goto LABEL_20;
            }
            goto LABEL_10;
          }
        }
        if ([(CIBurstFaceInfo *)v12 swFaceId] == -1)
        {
          ++self->faceIdCounter;
          -[CIBurstFaceInfo setSwFaceId:](v12, "setSwFaceId:");
        }
        if (v12) {
          goto LABEL_44;
        }
LABEL_20:
        long long v197 = 0u;
        long long v198 = 0u;
        long long v195 = 0u;
        long long v196 = 0u;
        unint64_t v14 = self->faceInfoArray;
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v195 objects:v211 count:16];
        if (!v15) {
          goto LABEL_43;
        }
        uint64_t v16 = v15;
        int v17 = 0;
        CGFloat v12 = 0;
        uint64_t v18 = *(void *)v196;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v196 != v18) {
              objc_enumerationMutation(v14);
            }
            float v20 = *(CIBurstFaceInfo **)(*((void *)&v195 + 1) + 8 * v19);
            [v6 faceRect];
            -[CIBurstFaceInfo overlapWithHwRect:](v20, "overlapWithHwRect:");
            if (v21 >= 0.25)
            {
              int v22 = [(CIBurstFaceInfo *)v20 hwLastFrameSeen];
              if (!v12) {
                goto LABEL_31;
              }
              if (v22 > v17
                && ([(CIBurstFaceInfo *)v20 hwLastFrameSeen] - v17 > 3
                 || [(CIBurstFaceInfo *)v20 swFaceId] != -1
                 || [(CIBurstFaceInfo *)v12 swFaceId] == -1))
              {
                int v22 = [(CIBurstFaceInfo *)v20 hwLastFrameSeen];
LABEL_31:
                int v17 = v22;
                CGFloat v12 = v20;
              }
            }
            [v6 faceRect];
            -[CIBurstFaceInfo overlapWithSwRect:](v20, "overlapWithSwRect:");
            if (v23 < 0.25) {
              goto LABEL_37;
            }
            int v24 = [(CIBurstFaceInfo *)v20 swLastFrameSeen];
            if (v12)
            {
              if (v24 <= v17) {
                goto LABEL_37;
              }
              int v24 = [(CIBurstFaceInfo *)v20 swLastFrameSeen];
            }
            int v17 = v24;
            CGFloat v12 = v20;
LABEL_37:
            ++v19;
          }
          while (v16 != v19);
          uint64_t v25 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v195 objects:v211 count:16];
          uint64_t v16 = v25;
        }
        while (v25);
        id v3 = v174;
        if (!v12)
        {
LABEL_43:
          CGFloat v12 = objc_alloc_init(CIBurstFaceInfo);
          [(NSMutableArray *)self->faceInfoArray addObject:v12];
        }
LABEL_44:
        if ([(CIBurstFaceInfo *)v12 swFaceId] == -1)
        {
          ++self->faceIdCounter;
          -[CIBurstFaceInfo setSwFaceId:](v12, "setSwFaceId:");
        }
        -[CIBurstFaceInfo setSwLastFrameSeen:](v12, "setSwLastFrameSeen:", [v3 temporalOrder]);
        [v6 faceRect];
        double MidX = CGRectGetMidX(v215);
        [v6 faceRect];
        -[CIBurstFaceInfo setSwCenter:](v12, "setSwCenter:", MidX, CGRectGetMidY(v216));
        [v6 faceRect];
        -[CIBurstFaceInfo setSwSize:](v12, "setSwSize:", v27, v28);
        objc_msgSend(v6, "setFaceId:", -[CIBurstFaceInfo swFaceId](v12, "swFaceId"));
      }
      id v177 = (id)[obj countByEnumeratingWithState:&v203 objects:v213 count:16];
      if (!v177) {
        return;
      }
    }
  }
  id v178 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v3, "faceStatArray"), "count"));
  int v176 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)objc_msgSend(v3, "faceStatArray"), "count"));
  long long v191 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  uint64_t v29 = (void *)[v3 faceStatArray];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v191 objects:v210 count:16];
  unint64_t v31 = 0x1E4F28000uLL;
  if (!v30) {
    goto LABEL_67;
  }
  uint64_t v32 = v30;
  uint64_t v33 = *(void *)v192;
  double v34 = *MEMORY[0x1E4F1DB28];
  double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v37 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  do
  {
    uint64_t v38 = 0;
    do
    {
      if (*(void *)v192 != v33) {
        objc_enumerationMutation(v29);
      }
      int v39 = *(void **)(*((void *)&v191 + 1) + 8 * v38);
      BurstLoggingMessage("faceStat.id = %d\n", [v39 faceId]);
      if (![v39 faceId])
      {
        uint64_t faceIdCounter = self->faceIdCounter;
        self->uint64_t faceIdCounter = faceIdCounter + 1;
        BurstLoggingMessage("    no id: assigning %d\n", faceIdCounter);
        int v51 = v39;
        uint64_t v52 = faceIdCounter;
        goto LABEL_60;
      }
      uint64_t v40 = -[NSMutableDictionary objectForKey:](self->renameMapping, "objectForKey:", objc_msgSend(*(id *)(v31 + 3792), "numberWithInt:", objc_msgSend(v39, "faceId")));
      if (!v40) {
        goto LABEL_58;
      }
      int v41 = (void *)v40;
      int v42 = [v3 temporalOrder];
      if ((int)(v42 - [v41 framesSinceLast]) >= 41)
      {
        -[NSMutableDictionary removeObjectForKey:](self->renameMapping, "removeObjectForKey:", objc_msgSend(*(id *)(v31 + 3792), "numberWithInt:", objc_msgSend(v39, "faceId")));
LABEL_58:
        uint64_t v43 = self->faceIdCounter;
        self->uint64_t faceIdCounter = v43 + 1;
        BurstLoggingMessage("    new id: %d mapped to %d\n", [v39 faceId], v43);
        int v44 = -[CIBurstFaceConfigEntry initWithRect:withFaceId:]([CIBurstFaceConfigEntry alloc], "initWithRect:withFaceId:", v43, v34, v35, v36, v37);
        -[CIBurstFaceConfigEntry setFramesSinceLast:](v44, "setFramesSinceLast:", [v3 temporalOrder]);
        renameMapping = self->renameMapping;
        unint64_t v46 = NSNumber;
        uint64_t v47 = [v39 faceId];
        CGFloat v48 = v46;
        unint64_t v31 = 0x1E4F28000;
        uint64_t v49 = [v48 numberWithInt:v47];
        int v50 = renameMapping;
        id v3 = v174;
        [(NSMutableDictionary *)v50 setObject:v44 forKey:v49];

        int v51 = v39;
        uint64_t v52 = v43;
LABEL_60:
        [v51 setFaceId:v52];
        goto LABEL_61;
      }
      BurstLoggingMessage("    rename found: %d mapped to %d\n", [v39 faceId], objc_msgSend(v41, "faceId"));
      objc_msgSend(v39, "setFaceId:", objc_msgSend(v41, "faceId"));
      objc_msgSend(v41, "setFramesSinceLast:", objc_msgSend(v3, "temporalOrder"));
LABEL_61:
      uint64_t v54 = (void *)-[NSMutableDictionary objectForKey:](self->faceIdMapping, "objectForKey:", objc_msgSend(*(id *)(v31 + 3792), "numberWithInt:", objc_msgSend(v39, "faceId")));
      if (v54)
      {
        double v55 = v54;
        BurstLoggingMessage("    map found: %d maps to %d\n", [v39 faceId], objc_msgSend(v54, "intValue"));
        objc_msgSend(v39, "setFaceId:", objc_msgSend(v55, "intValue"));
        objc_msgSend(v176, "setObject:forKey:", objc_msgSend(*(id *)(v31 + 3792), "numberWithInt:", objc_msgSend(v39, "faceId")), objc_msgSend(*(id *)(v31 + 3792), "numberWithInt:", objc_msgSend(v39, "faceId")));
      }
      int v56 = [CIBurstFaceConfigEntry alloc];
      [v39 faceRect];
      CGRect v61 = -[CIBurstFaceConfigEntry initWithRect:withFaceId:](v56, "initWithRect:withFaceId:", [v39 faceId], v57, v58, v59, v60);
      [v178 addObject:v61];

      ++v38;
    }
    while (v32 != v38);
    uint64_t v62 = [v29 countByEnumeratingWithState:&v191 objects:v210 count:16];
    uint64_t v32 = v62;
  }
  while (v62);
LABEL_67:
  double v170 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->curConfig, "count"));
  [v170 addEntriesFromDictionary:self->curConfig];
  CGRect v63 = v178;
  if ([v178 count])
  {
    uint64_t v64 = 0;
    int v65 = 0;
    int v66 = 0;
    double v67 = 0.0;
    double v68 = 0.0;
    double v69 = 0.0;
    double v70 = 0.0;
    while (1)
    {
      BOOL v71 = (void *)[v63 objectAtIndex:v64];
      uint64_t v72 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v71, "faceId"));
      uint64_t v73 = [v176 objectForKey:v72];
      double v74 = 1.0;
      if (v73)
      {
        double v75 = 1.0;
      }
      else
      {
        double v76 = objc_msgSend(v170, "objectForKey:", v72, 1.0);
        if (!v76)
        {
          id v3 = v174;
          CGRect v63 = v178;
          goto LABEL_74;
        }
        double v77 = v76;
        uint64_t v78 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v76, "faceId"));
        objc_msgSend(v176, "setObject:forKey:", v78, objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v71, "faceId")));
        BurstLoggingMessage("       entry exists with same id: %d\n", [v77 faceId]);
        [v71 faceRect];
        double v79 = CGRectGetMidX(v217);
        [v71 faceRect];
        double MidY = CGRectGetMidY(v218);
        [v77 faceRect];
        double v81 = CGRectGetMidX(v219);
        [v77 faceRect];
        double v67 = v67 + v79 - v81;
        double v68 = v68 + MidY - CGRectGetMidY(v220);
        [v71 faceRect];
        double v83 = v82;
        [v77 faceRect];
        double v75 = v83 / v84;
        [v71 faceRect];
        double v86 = v85;
        [v77 faceRect];
        double v74 = v86 / v87;
        id v3 = v174;
      }
      double v69 = v69 + v75;
      double v70 = v70 + v74;
      ++v65;
      CGRect v63 = v178;
      [v178 removeObjectAtIndex:v64];
      --v66;
      [v170 removeObjectForKey:v72];
LABEL_74:
      uint64_t v64 = ++v66;
      if ([v63 count] <= (unint64_t)v66) {
        goto LABEL_78;
      }
    }
  }
  int v65 = 0;
  double v70 = 0.0;
  double v69 = 0.0;
  double v68 = 0.0;
  double v67 = 0.0;
LABEL_78:
  BurstLoggingMessage("%d faces so far unmatched:\n", [v63 count]);
  if ([v63 count])
  {
    unint64_t v88 = 0;
    do
      BurstLoggingMessage("    face %d\n", objc_msgSend((id)objc_msgSend(v63, "objectAtIndex:", v88++), "faceId"));
    while ([v63 count] > v88);
  }
  unint64_t v89 = 0x1E4F28000;
  uint64_t v90 = v170;
  if ([v63 count])
  {
    if (v65 <= 0)
    {
      if ([v178 count])
      {
        uint64_t v118 = 0;
        int v169 = 0;
        double v119 = 0;
        while (1)
        {
          uint64_t v166 = v118;
          double v120 = (void *)[v90 allKeys];
          BurstLoggingMessage("  prevConfig has %d entries\n", [v120 count]);
          int v167 = v120;
          if ([v120 count])
          {
            uint64_t v121 = 0;
            id v168 = v119;
            double v122 = v178;
            do
            {
              uint64_t v171 = v121;
              float v123 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v122];
              float v124 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v90];
              id obja = (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v122, "count"));
              if ([v123 count])
              {
                unint64_t v125 = 0;
                do
                {
                  BOOL v126 = (void *)[v123 objectAtIndex:v125];
                  [v126 faceRect];
                  CGFloat v128 = v127;
                  CGFloat v130 = v129;
                  double v132 = v131;
                  double v134 = v133;
                  double v135 = (void *)[v124 allKeys];
                  if ([v135 count])
                  {
                    uint64_t v136 = 0;
                    while (1)
                    {
                      double v137 = objc_msgSend(v124, "objectForKey:", objc_msgSend(v135, "objectAtIndex:", v136));
                      [v137 faceRect];
                      v226.origin.uint64_t x = v128;
                      v226.origin.double y = v130;
                      v226.size.int width = v132;
                      v226.size.int height = v134;
                      CGRect v224 = CGRectIntersection(v223, v226);
                      double v138 = v224.size.width * v224.size.height;
                      if (v224.size.width * v224.size.height >= v132 * v134 * 0.5) {
                        break;
                      }
                      if (objc_msgSend(v135, "count", v138, v224.origin.y) <= (unint64_t)++v136) {
                        goto LABEL_105;
                      }
                    }
                    uint64_t v139 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v137, "faceId", v138, v224.origin.y));
                    objc_msgSend(obja, "setObject:forKey:", v139, objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v126, "faceId")));
                    objc_msgSend(v124, "removeObjectForKey:", objc_msgSend(v135, "objectAtIndex:", v136));
                  }
LABEL_105:
                  ++v125;
                }
                while ([v123 count] > v125);
              }
              double v119 = obja;
              uint64_t v90 = v170;
              double v122 = v178;
              if ([obja count] > (unint64_t)v169)
              {
                id v168 = obja;
                int v169 = [obja count];
                if (objc_msgSend((id)objc_msgSend(v174, "faceStatArray"), "count") == v169) {
                  break;
                }
              }
              uint64_t v121 = v171 + 1;
              double v119 = v168;
            }
            while ([v167 count] > (unint64_t)(v171 + 1));
          }
          else
          {
            double v122 = v178;
          }
          id v3 = v174;
          if (objc_msgSend((id)objc_msgSend(v174, "faceStatArray"), "count") == v169) {
            break;
          }
          uint64_t v118 = v166 + 1;
          unint64_t v89 = 0x1E4F28000;
          if ([v122 count] <= (unint64_t)(v166 + 1)) {
            goto LABEL_115;
          }
        }
        BurstLoggingMessage("Found mapping!\n");
        unint64_t v89 = 0x1E4F28000uLL;
LABEL_115:
        if (v169 >= 1)
        {
          if ([v178 count])
          {
            uint64_t v140 = 0;
            int v141 = 0;
            do
            {
              if (objc_msgSend(v119, "objectForKey:", objc_msgSend(*(id *)(v89 + 3792), "numberWithInt:", objc_msgSend((id)objc_msgSend(v178, "objectAtIndex:", v140), "faceId"))))
              {
                [v178 removeObjectAtIndex:v140];
                --v141;
              }
              uint64_t v140 = ++v141;
            }
            while ([v178 count] > (unint64_t)v141);
          }
          [v176 addEntriesFromDictionary:v119];
        }
      }
      long long v189 = 0u;
      long long v190 = 0u;
      long long v187 = 0u;
      long long v188 = 0u;
      uint64_t v142 = [v178 countByEnumeratingWithState:&v187 objects:v209 count:16];
      if (v142)
      {
        uint64_t v143 = v142;
        uint64_t v144 = *(void *)v188;
        do
        {
          for (uint64_t j = 0; j != v143; ++j)
          {
            if (*(void *)v188 != v144) {
              objc_enumerationMutation(v178);
            }
            v146 = *(void **)(*((void *)&v187 + 1) + 8 * j);
            objc_msgSend(v176, "setObject:forKey:", objc_msgSend(*(id *)(v89 + 3792), "numberWithInt:", objc_msgSend(v146, "faceId")), objc_msgSend(*(id *)(v89 + 3792), "numberWithInt:", objc_msgSend(v146, "faceId")));
            BurstLoggingMessage("   mapping not found for %d, mapping to itself\n", [v146 faceId]);
          }
          uint64_t v143 = [v178 countByEnumeratingWithState:&v187 objects:v209 count:16];
        }
        while (v143);
      }
    }
    else
    {
      double v91 = v178;
      if ([v178 count])
      {
        unint64_t v92 = 0;
        double v93 = (float)(1.0 / (float)v65);
        double v94 = v67 * v93;
        double v95 = v68 * v93;
        double v96 = v69 * v93;
        double v97 = v70 * v93;
        do
        {
          double v98 = (void *)[v91 objectAtIndex:v92];
          double v99 = (void *)[v90 allKeys];
          if ([v99 count])
          {
            uint64_t v100 = 0;
            while (1)
            {
              float v101 = objc_msgSend(v90, "objectForKey:", objc_msgSend(v99, "objectAtIndex:", v100));
              [v98 faceRect];
              CGFloat v103 = v94 + v102;
              CGFloat v105 = v95 + v104;
              CGFloat v107 = v96 * v106;
              CGFloat v109 = v97 * v108;
              [v98 faceRect];
              v225.origin.uint64_t x = v110;
              v225.origin.double y = v111;
              v225.size.int width = v112;
              v225.size.int height = v113;
              v221.origin.uint64_t x = v103;
              v221.origin.double y = v105;
              v221.size.int width = v107;
              v221.size.int height = v109;
              CGRect v222 = CGRectIntersection(v221, v225);
              *(float *)&CGFloat v103 = v222.size.width * v222.size.height;
              BurstLoggingMessage("    %d overlaps with %d by %.3f %% : ", [v101 faceId], objc_msgSend(v98, "faceId"), (float)(*(float *)&v103 * 100.0) / (v107 * v109));
              double v114 = *(float *)&v103;
              double v115 = v107 * v109 * 0.5;
              if (v115 <= *(float *)&v103) {
                break;
              }
              BurstLoggingMessage("    not matched\n", v114, v115);
              if ([v99 count] <= (unint64_t)++v100) {
                goto LABEL_89;
              }
            }
            BurstLoggingMessage("    matched!  mapping %d to %d\n", objc_msgSend(v98, "faceId", v114, v115), objc_msgSend(v101, "faceId"));
            uint64_t v117 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v101, "faceId"));
            uint64_t v90 = v170;
            objc_msgSend(v176, "setObject:forKey:", v117, objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v98, "faceId")));
            objc_msgSend(v170, "removeObjectForKey:", objc_msgSend(v99, "objectAtIndex:", v100));
          }
          else
          {
LABEL_89:
            BurstLoggingMessage("      no match found for id %d - adding face\n", [v98 faceId]);
            uint64_t v116 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v98, "faceId"));
            objc_msgSend(v176, "setObject:forKey:", v116, objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v98, "faceId")));
          }
          ++v92;
          double v91 = v178;
          id v3 = v174;
        }
        while ([v178 count] > v92);
      }
    }
  }
  [(NSMutableDictionary *)self->faceIdMapping addEntriesFromDictionary:v176];
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  CGFloat v147 = (void *)[v3 faceStatArray];
  uint64_t v148 = [v147 countByEnumeratingWithState:&v183 objects:v208 count:16];
  if (v148)
  {
    uint64_t v149 = v148;
    uint64_t v150 = *(void *)v184;
    do
    {
      for (uint64_t k = 0; k != v149; ++k)
      {
        if (*(void *)v184 != v150) {
          objc_enumerationMutation(v147);
        }
        v152 = *(void **)(*((void *)&v183 + 1) + 8 * k);
        objc_msgSend(v152, "setFaceId:", objc_msgSend((id)objc_msgSend(v176, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v152, "faceId"))), "intValue"));
        v153 = [CIBurstFaceConfigEntry alloc];
        [v152 faceRect];
        double v158 = -[CIBurstFaceConfigEntry initWithRect:withFaceId:](v153, "initWithRect:withFaceId:", [v152 faceId], v154, v155, v156, v157);
        -[NSMutableDictionary setObject:forKey:](self->curConfig, "setObject:forKey:", v158, objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v152, "faceId")));
      }
      uint64_t v149 = [v147 countByEnumeratingWithState:&v183 objects:v208 count:16];
    }
    while (v149);
  }
  double v159 = (void *)[(NSMutableDictionary *)self->curConfig allKeys];
  long long v179 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  uint64_t v160 = [v159 countByEnumeratingWithState:&v179 objects:v207 count:16];
  if (v160)
  {
    uint64_t v161 = v160;
    uint64_t v162 = *(void *)v180;
    do
    {
      for (uint64_t m = 0; m != v161; ++m)
      {
        if (*(void *)v180 != v162) {
          objc_enumerationMutation(v159);
        }
        uint64_t v164 = *(void *)(*((void *)&v179 + 1) + 8 * m);
        double v165 = (void *)[(NSMutableDictionary *)self->curConfig objectForKey:v164];
        objc_msgSend(v165, "setFramesSinceLast:", objc_msgSend(v165, "framesSinceLast") + 1);
        if ((int)[v165 framesSinceLast] >= 4)
        {
          BurstLoggingMessage("removing config entry: %d\n", [v165 faceId]);
          [(NSMutableDictionary *)self->curConfig removeObjectForKey:v164];
        }
      }
      uint64_t v161 = [v159 countByEnumeratingWithState:&v179 objects:v207 count:16];
    }
    while (v161);
  }
}

- (void)addFaceToArray:(id)a3
{
  CFDictionaryRef v5 = (const __CFDictionary *)[a3 objectForKey:@"Timestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    memset(&v27, 0, 24);
    CMTimeMakeFromDictionary((CMTime *)&v27, v5);
    *(CGPoint *)&time.value = v27.origin;
    time.epoch = *(void *)&v27.size.width;
    double Seconds = CMTimeGetSeconds(&time);
LABEL_5:
    double v7 = Seconds;
    goto LABEL_6;
  }
  objc_opt_class();
  double v7 = -1.0;
  if (objc_opt_isKindOfClass())
  {
    unint64_t v8 = [(__CFDictionary *)v5 unsignedLongLongValue];
    double Seconds = timestampToSeconds(v8, v9, v10, v11);
    goto LABEL_5;
  }
LABEL_6:
  BurstLoggingMessage("  face ID = %d, timestamp = %.6f\n", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"FaceID"), "intValue"), v7);
  int v12 = [(NSMutableArray *)self->faceTimestampArray count];
  int v13 = v12 & (v12 >> 31);
  uint64_t v14 = v12 - 1;
  while (1)
  {
    BOOL v15 = __OFSUB__(v12--, 1);
    if (v12 < 0 != v15) {
      break;
    }
    objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->faceTimestampArray, "objectAtIndex:", v14--), "objectForKey:", @"Timestamp"), "doubleValue");
    if (v7 >= v16)
    {
      int v13 = v12 + 1;
      break;
    }
  }
  int v17 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
  objc_msgSend(v17, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", v7), @"Timestamp");
  uint64_t v18 = [v17 objectForKey:@"Rect"];
  if (v18)
  {
    CFDictionaryRef v19 = (const __CFDictionary *)v18;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      memset(&v27, 0, sizeof(v27));
      if (CGRectMakeWithDictionaryRepresentation(v19, &v27))
      {
        float v20 = NSNumber;
        CGFloat MidX = CGRectGetMidX(v27);
        *(float *)&CGFloat MidX = MidX;
        objc_msgSend(v17, "setObject:forKey:", objc_msgSend(v20, "numberWithFloat:", MidX), @"X");
        int v22 = NSNumber;
        CGFloat MidY = CGRectGetMidY(v27);
        *(float *)&CGFloat MidY = MidY;
        objc_msgSend(v17, "setObject:forKey:", objc_msgSend(v22, "numberWithFloat:", MidY), @"Y");
        HIDWORD(v24) = HIDWORD(v27.size.width);
        *(float *)&double v24 = v27.size.width;
        objc_msgSend(v17, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v24), @"Width");
        HIDWORD(v25) = HIDWORD(v27.size.height);
        *(float *)&double v25 = v27.size.height;
        objc_msgSend(v17, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v25), @"Height");
        [v17 removeObjectForKey:@"Rect"];
      }
    }
  }
  [(NSMutableArray *)self->faceTimestampArray insertObject:v17 atIndex:v13];
  BurstLoggingMessage("    inserting at index %d, count=%d\n", v13, [v17 count]);
  double latestFaceTimestamp = self->latestFaceTimestamp;
  if (v7 > latestFaceTimestamp) {
    double latestFaceTimestamp = v7;
  }
  self->double latestFaceTimestamp = latestFaceTimestamp;
}

- (void)extractFacesFromMetadata:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BurstLoggingMessage("  extractFacesFromMetadata\n", a2);
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFDictionaryRef v5 = (void *)[a3 objectForKey:@"AccumulatedFaceMetadata"];
      BurstLoggingMessage("  accumulatedFaceMetadata = %x\n", v5);
      if (v5)
      {
        BurstLoggingMessage("adding %d faces\n", [v5 count]);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v27 != v8) {
                objc_enumerationMutation(v5);
              }
              [(CIBurstImageFaceAnalysisContext *)self addFaceToArray:*(void *)(*((void *)&v26 + 1) + 8 * i)];
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v7);
        }
        goto LABEL_29;
      }
      uint64_t v10 = [a3 objectForKey:*MEMORY[0x1E4F2F800]];
      if (v10)
      {
        double v11 = (void *)v10;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        uint64_t v13 = *MEMORY[0x1E4F2F6D8];
        if (isKindOfClass)
        {
          uint64_t v14 = (void *)[v11 objectForKey:*MEMORY[0x1E4F2F6D8]];
          if (v14) {
            goto LABEL_21;
          }
        }
      }
      else
      {
        uint64_t v13 = *MEMORY[0x1E4F2F6D8];
      }
      uint64_t v14 = (void *)[a3 objectForKey:v13];
      if (!v14)
      {
LABEL_29:
        uint64_t v20 = [a3 objectForKey:*MEMORY[0x1E4F2FC20]];
        if (v20)
        {
          float v21 = (void *)v20;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CFDictionaryRef v22 = (const __CFDictionary *)[v21 objectForKey:@"3"];
            if (v22)
            {
              memset(&v25, 0, sizeof(v25));
              CMTimeMakeFromDictionary(&v25, v22);
              CMTime time = v25;
              Float64 latestFaceTimestamp = CMTimeGetSeconds(&time) + -0.100000001;
              if (self->latestFaceTimestamp > latestFaceTimestamp) {
                Float64 latestFaceTimestamp = self->latestFaceTimestamp;
              }
              self->Float64 latestFaceTimestamp = latestFaceTimestamp;
            }
          }
        }
        BurstLoggingMessage("    Float64 latestFaceTimestamp = %.6f\n", self->latestFaceTimestamp);
        return;
      }
LABEL_21:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = [v14 objectForKey:@"Regions"];
        if (v15)
        {
          double v16 = (void *)v15;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BurstLoggingMessage("regions exist\n");
            int v17 = (void *)[v16 objectForKey:@"RegionList"];
            if (v17)
            {
              uint64_t v18 = v17;
              if ([v17 count])
              {
                BurstLoggingMessage("  num regions = %d\n", [v18 count]);
                if ([v18 count])
                {
                  unint64_t v19 = 0;
                  do
                    -[CIBurstImageFaceAnalysisContext addFaceToArray:](self, "addFaceToArray:", [v18 objectAtIndex:v19++]);
                  while ([v18 count] > v19);
                }
              }
            }
          }
        }
      }
      goto LABEL_29;
    }
  }

  BurstLoggingMessage("extractFaceMetadata: invalid properties\n");
}

- (void)addFacesToImageStat:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  [a3 timestamp];
  double v9 = v8;
  BurstLoggingMessage("addFacesToImageStat: timestamp = %.6f, lastFaceIndex=%d\n", v8, self->lastFaceIndex);
  if (v9 <= self->latestFaceTimestamp)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    lastFaceIndeuint64_t x = self->lastFaceIndex;
    if ([(NSMutableArray *)self->faceTimestampArray count] > lastFaceIndex)
    {
      double v12 = v9 + 0.0160000008;
      float v13 = width;
      float v14 = height;
      float v15 = v13;
      float v126 = v14;
      double v124 = *MEMORY[0x1E4F1DB28];
      double v125 = v14;
      double v122 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v123 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v121 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      float v117 = v13;
      do
      {
        double v16 = (void *)[(NSMutableArray *)self->faceTimestampArray objectAtIndex:self->lastFaceIndex];
        objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"Timestamp"), "doubleValue");
        if (v17 > v12) {
          break;
        }
        double v18 = v17;
        unint64_t v19 = objc_alloc_init(CIBurstFaceStat);
        objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"Width"), "floatValue");
        float v21 = v20;
        objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"Height"), "floatValue");
        float v23 = v22;
        objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"X"), "floatValue");
        float v25 = v24;
        objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"Y"), "floatValue");
        float v27 = v26;
        -[CIBurstFaceStat setFaceId:](v19, "setFaceId:", objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"FaceID"), "intValue"));
        double v129 = v27;
        double v130 = v25;
        double v127 = v23;
        double v128 = v21;
        -[CIBurstFaceStat setNormalizedFaceRect:](v19, "setNormalizedFaceRect:");
        [(CIBurstFaceStat *)v19 setTimestamp:v18];
        long long v28 = (void *)[v16 objectForKey:@"RollAngle"];
        long long v29 = (void *)[v16 objectForKey:@"YawAngle"];
        if (v28)
        {
          [(CIBurstFaceStat *)v19 setHasRollAngle:1];
          [v28 floatValue];
          -[CIBurstFaceStat setRollAngle:](v19, "setRollAngle:");
        }
        else
        {
          [(CIBurstFaceStat *)v19 setHasRollAngle:0];
        }
        if (v29)
        {
          [(CIBurstFaceStat *)v19 setHasYawAngle:1];
          [v29 floatValue];
          -[CIBurstFaceStat setYawAngle:](v19, "setYawAngle:");
        }
        else
        {
          [(CIBurstFaceStat *)v19 setHasYawAngle:0];
        }
        -[CIBurstFaceStat setFaceRect:](v19, "setFaceRect:", (float)((float)(v25 - (float)(v21 * 0.5)) * v15), v125 - (float)((float)(v27 - (float)(v23 * 0.5)) * v126) - (float)(v23 * v126), (float)(v21 * v15));
        objc_msgSend(v10, "setObject:forKey:", v19, objc_msgSend(NSNumber, "numberWithInt:", -[CIBurstFaceStat faceId](v19, "faceId")));

        [(CIBurstFaceStat *)v19 setFramesSinceLast:0];
        if ([v16 objectForKey:@"LeftEyeX"])
        {
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"LeftEyeX"), "floatValue");
          float v31 = v30;
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"LeftEyeY"), "floatValue");
          float v33 = v32;
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"LeftEyeWidth"), "floatValue");
          float v35 = v34;
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"LeftEyeHeight"), "floatValue");
          float v37 = v36;
          BOOL v38 = v36 > 0.0 && v35 > 0.0;
          [(CIBurstFaceStat *)v19 setHasLeftEye:v38];
          if ([(CIBurstFaceStat *)v19 hasLeftEye])
          {
            -[CIBurstFaceStat setLeftEyeRect:](v19, "setLeftEyeRect:", (float)((float)(v31 - (float)(v35 * 0.5)) * v15), (float)((float)(v33 - (float)(v37 * 0.5)) * v126), (float)(v35 * v15), (float)(v37 * v126));
            objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"LeftEyeBlinkLevel"), "floatValue");
            -[CIBurstFaceStat setLeftEyeBlinkScore:](v19, "setLeftEyeBlinkScore:");
          }
        }
        else
        {
          -[CIBurstFaceStat setLeftEyeRect:](v19, "setLeftEyeRect:", v124, v123, v122, v121);
          [(CIBurstFaceStat *)v19 setHasLeftEye:0];
        }
        if ([v16 objectForKey:@"RightEyeX"])
        {
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"RightEyeX"), "floatValue");
          float v40 = v39;
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"RightEyeY"), "floatValue");
          float v42 = v41;
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"RightEyeWidth"), "floatValue");
          float v44 = v43;
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"RightEyeHeight"), "floatValue");
          float v46 = v45;
          BOOL v47 = v45 > 0.0 && v44 > 0.0;
          [(CIBurstFaceStat *)v19 setHasRightEye:v47];
          if ([(CIBurstFaceStat *)v19 hasRightEye])
          {
            -[CIBurstFaceStat setRightEyeRect:](v19, "setRightEyeRect:", (float)((float)(v40 - (float)(v44 * 0.5)) * v15), (float)((float)(v42 - (float)(v46 * 0.5)) * v126), (float)(v44 * v15), (float)(v46 * v126));
            objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"RightEyeBlinkLevel"), "floatValue");
            -[CIBurstFaceStat setRightEyeBlinkScore:](v19, "setRightEyeBlinkScore:");
          }
        }
        else
        {
          -[CIBurstFaceStat setRightEyeRect:](v19, "setRightEyeRect:", v124, v123, v122, v121);
          [(CIBurstFaceStat *)v19 setHasRightEye:0];
        }
        if ([(CIBurstFaceStat *)v19 hasLeftEye] && [(CIBurstFaceStat *)v19 hasRightEye])
        {
          [(CIBurstFaceStat *)v19 leftEyeRect];
          double MidX = CGRectGetMidX(v138);
          [(CIBurstFaceStat *)v19 leftEyeRect];
          double MidY = CGRectGetMidY(v139);
          [(CIBurstFaceStat *)v19 rightEyeRect];
          double v50 = CGRectGetMidX(v140);
          [(CIBurstFaceStat *)v19 rightEyeRect];
          double v119 = CGRectGetMidY(v141);
          double v120 = v50;
          double v51 = v50 - MidX;
          double v52 = v119 - MidX;
          float v53 = sqrt(v52 * v52 + v51 * v51);
          double v54 = 0.0;
          double v55 = 0.0;
          if (v53 >= 0.01)
          {
            double v56 = (float)(1.0 / v53);
            double v55 = v51 * v56;
            double v54 = v52 * v56;
          }
          [(CIBurstFaceStat *)v19 faceRect];
          double v58 = v57;
          [(CIBurstFaceStat *)v19 faceRect];
          float v60 = (v58 + v59) * 0.5;
          double v61 = (float)((float)(v60 * 0.3) * 0.5);
          double v62 = (float)((float)(v60 * 0.2) * 0.5);
          double v63 = MidX - v61 * v55;
          double v64 = v63 - v62 * v54;
          double v65 = MidY - v61 * v54;
          double v66 = v65 - v62 * v55;
          double v67 = v63 + v62 * v54;
          double v68 = v65 + v62 * v55;
          double v69 = MidX + v61 * v55;
          double v70 = v69 - v62 * v54;
          double v71 = MidY + v61 * v54;
          double v72 = v71 - v62 * v55;
          double v73 = v69 + v62 * v54;
          double v74 = v71 + v62 * v55;
          if (v72 >= v74) {
            double v75 = v74;
          }
          else {
            double v75 = v72;
          }
          if (v72 > v74) {
            double v74 = v72;
          }
          if (v66 >= v68) {
            double v76 = v68;
          }
          else {
            double v76 = v66;
          }
          if (v66 > v68) {
            double v68 = v66;
          }
          if (v70 >= v73) {
            double v77 = v73;
          }
          else {
            double v77 = v70;
          }
          if (v70 > v73) {
            double v73 = v70;
          }
          if (v64 >= v67) {
            double v78 = v67;
          }
          else {
            double v78 = v64;
          }
          if (v64 > v67) {
            double v67 = v64;
          }
          if (v78 >= v77) {
            double v79 = v77;
          }
          else {
            double v79 = v78;
          }
          if (v76 >= v75) {
            double v80 = v75;
          }
          else {
            double v80 = v76;
          }
          if (v67 <= v73) {
            double v67 = v73;
          }
          double v118 = v67;
          if (v68 <= v74) {
            double v81 = v74;
          }
          else {
            double v81 = v68;
          }
          [(CIBurstFaceStat *)v19 leftEyeRect];
          v146.size.double width = v118 - v79;
          v146.size.double height = v81 - v80;
          v146.origin.uint64_t x = v79;
          v146.origin.double y = v80;
          CGRect v143 = CGRectUnion(v142, v146);
          -[CIBurstFaceStat setLeftEyeRect:](v19, "setLeftEyeRect:", v143.origin.x, v143.origin.y, v143.size.width, v143.size.height);
          double v82 = v120 - v61 * v55;
          double v83 = v82 - v62 * v54;
          double v84 = v119 - v61 * v54;
          double v85 = v84 - v62 * v55;
          double v86 = v82 + v62 * v54;
          double v87 = v84 + v62 * v55;
          double v88 = v120 + v61 * v55;
          double v89 = v88 - v62 * v54;
          double v90 = v119 + v61 * v54;
          double v91 = v90 - v62 * v55;
          double v92 = v88 + v62 * v54;
          double v93 = v90 + v62 * v55;
          if (v91 >= v93) {
            double v94 = v93;
          }
          else {
            double v94 = v91;
          }
          if (v91 > v93) {
            double v93 = v91;
          }
          if (v85 >= v87) {
            double v95 = v87;
          }
          else {
            double v95 = v85;
          }
          if (v85 > v87) {
            double v87 = v85;
          }
          if (v89 >= v92) {
            double v96 = v92;
          }
          else {
            double v96 = v89;
          }
          if (v89 > v92) {
            double v92 = v89;
          }
          if (v83 >= v86) {
            double v97 = v86;
          }
          else {
            double v97 = v83;
          }
          if (v83 > v86) {
            double v86 = v83;
          }
          if (v97 >= v96) {
            double v98 = v96;
          }
          else {
            double v98 = v97;
          }
          if (v95 >= v94) {
            double v99 = v94;
          }
          else {
            double v99 = v95;
          }
          if (v86 <= v92) {
            double v100 = v92;
          }
          else {
            double v100 = v86;
          }
          if (v87 <= v93) {
            double v101 = v93;
          }
          else {
            double v101 = v87;
          }
          [(CIBurstFaceStat *)v19 rightEyeRect];
          v147.size.double width = v100 - v98;
          v147.size.double height = v101 - v99;
          v147.origin.uint64_t x = v98;
          v147.origin.double y = v99;
          CGRect v145 = CGRectUnion(v144, v147);
          -[CIBurstFaceStat setRightEyeRect:](v19, "setRightEyeRect:", v145.origin.x, v145.origin.y, v145.size.width, v145.size.height);
          double v12 = v9 + 0.0160000008;
          float v15 = v117;
        }
        if ([v16 objectForKey:@"SmileLevel"])
        {
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"SmileLevel"), "floatValue");
          -[CIBurstFaceStat setSmileScore:](v19, "setSmileScore:");
        }
        int v102 = [(CIBurstFaceStat *)v19 faceId];
        [(CIBurstFaceStat *)v19 timestamp];
        BurstLoggingMessage("      found face id %d, timestamp=%.6f, x=%.3f,y=%.3f,w=%.3f,h=%.3f\n", v102, v103, v130, v129, v128, v127);
        uint64_t v104 = self->lastFaceIndex;
        self->lastFaceIndeuint64_t x = v104 + 1;
      }
      while ([(NSMutableArray *)self->faceTimestampArray count] > (unint64_t)(v104 + 1));
    }
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    CGFloat v105 = (void *)[v10 allKeys];
    uint64_t v106 = [v105 countByEnumeratingWithState:&v131 objects:v135 count:16];
    if (v106)
    {
      uint64_t v107 = v106;
      uint64_t v108 = *(void *)v132;
      do
      {
        for (uint64_t i = 0; i != v107; ++i)
        {
          if (*(void *)v132 != v108) {
            objc_enumerationMutation(v105);
          }
          CGFloat v110 = (void *)[v10 objectForKey:*(void *)(*((void *)&v131 + 1) + 8 * i)];
          [v110 timestamp];
          *(float *)&double v111 = v111 - v9;
          float v112 = fabsf(*(float *)&v111);
          if (v112 <= 0.016)
          {
            int v115 = [v110 faceId];
            [v110 timestamp];
            BurstLoggingMessage("    adding face id %d, timestamp %.6f\n", v115, v116);
            [v110 setIsSyncedWithImage:1];
            objc_msgSend((id)objc_msgSend(a3, "faceStatArray"), "addObject:", v110);
          }
          else if (v112 <= 0.04)
          {
            [v110 setIsSyncedWithImage:0];
            objc_msgSend((id)objc_msgSend(a3, "faceStatArray"), "addObject:", v110);
            int v113 = [v110 faceId];
            [v110 timestamp];
            BurstLoggingMessage("    face id %d, timestamp %.6f - delta = %.6f, perhaps should use FaceCore\n", v113, v114, v112);
          }
        }
        uint64_t v107 = [v105 countByEnumeratingWithState:&v131 objects:v135 count:16];
      }
      while (v107);
    }
  }
  else
  {
    BurstLoggingMessage("    imageTimestamp > latestFaceTimestamp\n");
  }
}

- (void)dumpFaceInfoArray
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BurstLoggingMessage("FaceInfoArray:\n", a2);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  faceInfoArradouble y = self->faceInfoArray;
  uint64_t v4 = [(NSMutableArray *)faceInfoArray countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(faceInfoArray);
        }
        double v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        int v9 = [v8 hwFaceId];
        int v10 = [v8 hwLastFrameSeen];
        [v8 hwCenter];
        double v12 = v11;
        [v8 hwCenter];
        double v14 = v13;
        [v8 hwSize];
        double v16 = v15;
        [v8 hwSize];
        double v18 = v17;
        int v19 = [v8 swFaceId];
        int v20 = [v8 swLastFrameSeen];
        [v8 swCenter];
        double v22 = v21;
        [v8 swCenter];
        double v24 = v23;
        [v8 swSize];
        double v26 = v25;
        [v8 swSize];
        BurstLoggingMessage("hwId = %d (lastSeen=%d, ctr=%.3f,%.3f size=%.3f,%.3f), swId = %d (lastSeen=%d, ctr=%.3f,%.3f size=%.3f,%.3f)\n", v9, v10, v12, v14, v16, v18, v19, v20, v22, v24, v26, v27);
      }
      uint64_t v5 = [(NSMutableArray *)faceInfoArray countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v5);
  }
}

- (double)timeBlinkDetectionDone
{
  return self->timeBlinkDetectionDone;
}

- (void)setTimeBlinkDetectionDone:(double)a3
{
  self->timeBlinkDetectionDone = a3;
}

- (double)timeFaceDetectionDone
{
  return self->timeFaceDetectionDone;
}

- (void)setTimeFaceDetectionDone:(double)a3
{
  self->timeFaceDetectionDone = a3;
}

- (BOOL)forceFaceDetectionEnable
{
  return self->forceFaceDetectionEnable;
}

- (void)setForceFaceDetectionEnable:(BOOL)a3
{
  self->forceFaceDetectionEnable = a3;
}

- (double)latestFaceTimestamp
{
  return self->latestFaceTimestamp;
}

- (void)setLatestFaceTimestamp:(double)a3
{
  self->Float64 latestFaceTimestamp = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (void)findFacesInImage:imageStat:.cold.1()
{
}

- (void)findFacesInImage:imageStat:.cold.2()
{
}

- (void)findFacesInImage:imageStat:.cold.3()
{
}

- (void)findFacesInImage:imageStat:.cold.4()
{
}

- (void)findFacesInImage:imageStat:.cold.5()
{
}

- (void)findFacesInImage:imageStat:.cold.6()
{
}

- (void)findFacesInImage:imageStat:.cold.7()
{
}

- (void)findFacesInImage:imageStat:.cold.8()
{
}

- (void)findFacesInImage:imageStat:.cold.9()
{
}

- (void)findFacesInImage:imageStat:.cold.10()
{
}

- (void)findFacesInImage:imageStat:.cold.11()
{
}

@end