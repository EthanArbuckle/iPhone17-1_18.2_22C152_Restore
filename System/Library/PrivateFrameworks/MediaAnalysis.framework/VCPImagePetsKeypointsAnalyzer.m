@interface VCPImagePetsKeypointsAnalyzer
- (VCPImagePetsKeypointsAnalyzer)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 petsDetections:(id)a5 results:(id *)a6 cancel:(id)a7;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5;
@end

@implementation VCPImagePetsKeypointsAnalyzer

- (VCPImagePetsKeypointsAnalyzer)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)VCPImagePetsKeypointsAnalyzer;
  v8 = [(VCPImagePetsKeypointsAnalyzer *)&v20 init];
  v9 = v8;
  if (v8)
  {
    if (a3 >= 6) {
      int v10 = 6;
    }
    else {
      int v10 = a3;
    }
    if (v10 <= 1) {
      int v10 = 1;
    }
    v8->_maxNumRegions = v10;
    uint64_t v11 = +[VCPCNNPetsDetectorV2 detector:6 forceCPU:0 sharedModel:0 revision:1];
    petsDetector = v9->_petsDetector;
    v9->_petsDetector = (VCPCNNPetsDetectorV2 *)v11;

    v13 = [[VCPCNNPetsKeypointsDetector alloc] initWithForceCPU:v6 sharedModel:v5];
    petsKeypointsDetector = v9->_petsKeypointsDetector;
    v9->_petsKeypointsDetector = v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    results = v9->_results;
    v9->_results = (NSMutableArray *)v15;

    v9->_inputWidth = 580;
    v9->_inputHeight = 580;
    v17 = v9->_petsDetector;
    if (v17)
    {
      if (v9->_petsKeypointsDetector) {
        v17 = v9;
      }
      else {
        v17 = 0;
      }
    }
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  int result = -50;
  if (a3 && a4)
  {
    if (a5)
    {
      int result = 0;
      *a3 = self->_inputWidth;
      *a4 = self->_inputHeight;
      *a5 = 1111970369;
    }
  }
  return result;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 petsDetections:(id)a5 results:(id *)a6 cancel:(id)a7
{
  v101 = a6;
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v104 = a5;
  id v102 = a7;
  v123 = [MEMORY[0x1E4F1CA48] array];
  v103 = [MEMORY[0x1E4F1CA48] array];
  [(NSMutableArray *)self->_results removeAllObjects];
  if ([v104 count])
  {
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    obuint64_t j = v104;
    uint64_t v8 = [obj countByEnumeratingWithState:&v133 objects:v146 count:16];
    if (v8)
    {
      uint64_t v121 = *(void *)v134;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v134 != v121) {
            objc_enumerationMutation(obj);
          }
          int v10 = *(void **)(*((void *)&v133 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"attributes", v101);
          v12 = [v11 objectForKeyedSubscript:@"petsBounds"];

          v13 = [v10 objectForKeyedSubscript:@"attributes"];
          v14 = [v13 objectForKeyedSubscript:@"petsConfidence"];

          NSRect v148 = NSRectFromString(v12);
          v132.a = 1.0;
          v132.b = 0.0;
          v132.c = 0.0;
          *(_OWORD *)&v132.d = xmmword_1BC280F00;
          v132.tdouble y = 1.0;
          CGRect v149 = CGRectApplyAffineTransform(v148, &v132);
          v144[0] = @"petsBounds";
          if (v149.origin.x < 1.0) {
            double x = v149.origin.x;
          }
          else {
            double x = 1.0;
          }
          if (v149.origin.x <= 0.0) {
            double x = 0.0;
          }
          if (v149.origin.y < 1.0) {
            double y = v149.origin.y;
          }
          else {
            double y = 1.0;
          }
          if (v149.origin.y <= 0.0) {
            double y = 0.0;
          }
          double width = 1.0 - v149.origin.x;
          if (v149.size.width < width) {
            double width = v149.size.width;
          }
          if (v149.size.width <= 0.0) {
            double v18 = 0.0;
          }
          else {
            double v18 = width;
          }
          double height = 1.0 - v149.origin.y;
          if (v149.size.height < 1.0 - v149.origin.y) {
            double height = v149.size.height;
          }
          if (v149.size.height <= 0.0) {
            double v20 = 0.0;
          }
          else {
            double v20 = height;
          }
          double v21 = x;
          double v22 = y;
          v23 = NSStringFromRect(*(NSRect *)(&v18 - 2));
          v144[1] = @"petsConfidence";
          v145[0] = v23;
          v145[1] = v14;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v145 forKeys:v144 count:2];
          [v123 addObject:v24];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v133 objects:v146 count:16];
      }
      while (v8);
    }
  }
  else
  {
    int v116 = [(VCPCNNPetsDetectorV2 *)self->_petsDetector petsDetection:a3 petsRegions:v123 petsFaceRegions:v103 cancel:v102];
    if (v116) {
      goto LABEL_77;
    }
  }
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v105 = v123;
  uint64_t v25 = [v105 countByEnumeratingWithState:&v128 objects:v143 count:16];
  if (v25)
  {
    int v116 = 0;
    uint64_t v107 = *(void *)v129;
    while (2)
    {
      uint64_t v26 = 0;
      uint64_t v106 = v25;
      do
      {
        if (*(void *)v129 != v107) {
          objc_enumerationMutation(v105);
        }
        v27 = *(void **)(*((void *)&v128 + 1) + 8 * v26);
        objc_msgSend(v27, "objectForKeyedSubscript:", @"petsBounds", v101);
        v115 = (NSString *)objc_claimAutoreleasedReturnValue();
        NSRect v150 = NSRectFromString(v115);
        CGFloat v110 = v150.size.width;
        CGFloat v111 = v150.origin.x;
        double v108 = v150.origin.y;
        double v109 = v150.size.height;
        NSRect v151 = NSRectFromString(v115);
        CGFloat v28 = v151.origin.x;
        CGFloat v29 = v151.origin.y;
        CGFloat v30 = v151.size.width;
        CGFloat v31 = v151.size.height;
        v32 = [v27 objectForKeyedSubscript:@"petsConfidence"];
        [v32 floatValue];
        int v34 = v33;

        v35 = [VCPBoundingBox alloc];
        *(float *)&double v36 = v28;
        *(float *)&double v37 = v29;
        CGFloat v38 = v30 * 1.10000002;
        *(float *)&CGFloat v38 = v30 * 1.10000002;
        CGFloat v39 = v31 * 1.10000002;
        *(float *)&CGFloat v39 = v31 * 1.10000002;
        LODWORD(v40) = v34;
        v41 = [(VCPBoundingBox *)v35 initWithXYAndSize:v36 y:v37 width:v38 height:v39 confidence:v40];
        [(VCPBoundingBox *)v41 maxX];
        LODWORD(v31) = v42;
        [(VCPBoundingBox *)v41 minX];
        LODWORD(v28) = v43;
        [(VCPBoundingBox *)v41 maxY];
        float v45 = v44;
        [(VCPBoundingBox *)v41 minY];
        LODWORD(v29) = v46;
        [(VCPBoundingBox *)v41 minX];
        LODWORD(v30) = v47;
        [(VCPBoundingBox *)v41 minY];
        float v49 = (float)(*(float *)&v31 - *(float *)&v28) * 0.5;
        float v50 = (float)(v45 - *(float *)&v29) * 0.5;
        float v51 = v49 + *(float *)&v30;
        float v52 = v50 + *(float *)&v48;
        if (v49 <= v50)
        {
          *(float *)&double v48 = v51 - v50;
          if ((float)(v51 - v50) < 0.0) {
            *(float *)&double v48 = 0.0;
          }
          [(VCPBoundingBox *)v41 setMinX:v48];
          *(float *)&double v57 = v50 + v51;
          if ((float)(v50 + v51) > 1.0) {
            *(float *)&double v57 = 1.0;
          }
          [(VCPBoundingBox *)v41 setMaxX:v57];
          *(float *)&double v58 = v52 - v50;
          if ((float)(v52 - v50) < 0.0) {
            *(float *)&double v58 = 0.0;
          }
          [(VCPBoundingBox *)v41 setMinY:v58];
          *(float *)&double v55 = v50 + v52;
          float v56 = 1.0;
          if ((float)(v50 + v52) > 1.0) {
            *(float *)&double v55 = 1.0;
          }
        }
        else
        {
          *(float *)&double v48 = v51 - v49;
          if ((float)(v51 - v49) < 0.0) {
            *(float *)&double v48 = 0.0;
          }
          [(VCPBoundingBox *)v41 setMinX:v48];
          *(float *)&double v53 = v49 + v51;
          if ((float)(v49 + v51) > 1.0) {
            *(float *)&double v53 = 1.0;
          }
          [(VCPBoundingBox *)v41 setMaxX:v53];
          *(float *)&double v54 = v52 - v49;
          if ((float)(v52 - v49) < 0.0) {
            *(float *)&double v54 = 0.0;
          }
          [(VCPBoundingBox *)v41 setMinY:v54];
          *(float *)&double v55 = v49 + v52;
          float v56 = 1.0;
          if ((float)(v49 + v52) > 1.0) {
            *(float *)&double v55 = 1.0;
          }
        }
        [(VCPBoundingBox *)v41 setMaxY:v55];
        v120 = [MEMORY[0x1E4F1CA48] array];
        int v59 = -[VCPCNNPetsKeypointsDetector analyzeFrame:withBox:keypoints:](self->_petsKeypointsDetector, "analyzeFrame:withBox:keypoints:", a3, v41);
        if (v59)
        {
          int v60 = 1;
          int v116 = v59;
        }
        else
        {
          v122 = [MEMORY[0x1E4F1CA48] array];
          v113 = [MEMORY[0x1E4F1CA60] dictionary];
          [(VCPBoundingBox *)v41 maxX];
          float v62 = v61;
          [(VCPBoundingBox *)v41 minX];
          float v64 = v63;
          [(VCPBoundingBox *)v41 maxY];
          float v66 = v65;
          [(VCPBoundingBox *)v41 minY];
          float v68 = v67;
          if ([v120 count] == 25)
          {
            long long v126 = 0u;
            long long v127 = 0u;
            long long v124 = 0u;
            long long v125 = 0u;
            id obja = v120;
            uint64_t v69 = [obja countByEnumeratingWithState:&v124 objects:v142 count:16];
            if (v69)
            {
              float v70 = v62 - v64;
              float v71 = v66 - v68;
              uint64_t v72 = *(void *)v125;
              while (2)
              {
                for (uint64_t j = 0; j != v69; ++j)
                {
                  if (*(void *)v125 != v72) {
                    objc_enumerationMutation(obja);
                  }
                  v74 = *(void **)(*((void *)&v124 + 1) + 8 * j);
                  if ([v74 count] != 3)
                  {
                    int v116 = -18;
                    int v60 = 1;

                    goto LABEL_67;
                  }
                  v75 = [v74 objectAtIndexedSubscript:0];
                  [v75 floatValue];
                  float v77 = v76;

                  v78 = [v74 objectAtIndexedSubscript:1];
                  [v78 floatValue];
                  float v80 = v79;

                  v81 = [v74 objectAtIndexedSubscript:2];
                  [v81 floatValue];
                  int v83 = v82;

                  [(VCPBoundingBox *)v41 minX];
                  float v85 = v84;
                  [(VCPBoundingBox *)v41 minY];
                  float v87 = v86;
                  *(float *)&double v88 = v85 + (float)((float)(v77 / 288.0) * v70);
                  v89 = [NSNumber numberWithFloat:v88];
                  *(float *)&double v90 = v56 - (float)(v87 + (float)((float)(v80 / 288.0) * v71));
                  v141[0] = v89;
                  v91 = [NSNumber numberWithFloat:v90];
                  v141[1] = v91;
                  LODWORD(v92) = v83;
                  v93 = [NSNumber numberWithFloat:v92];
                  v141[2] = v93;
                  v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v141 count:3];
                  [v122 addObject:v94];
                }
                uint64_t v69 = [obja countByEnumeratingWithState:&v124 objects:v142 count:16];
                if (v69) {
                  continue;
                }
                break;
              }
            }

            [v113 setObject:v122 forKeyedSubscript:@"petsKeypoints"];
            v152.size.double height = v109;
            v152.origin.double y = 1.0 - v108 - v109;
            v152.size.double width = v110;
            v152.origin.double x = v111;
            v95 = NSStringFromRect(v152);
            [v113 setObject:v95 forKeyedSubscript:@"petsBounds"];

            v96 = [v27 objectForKeyedSubscript:@"petsConfidence"];
            [v113 setObject:v96 forKeyedSubscript:@"petsConfidence"];

            v97 = [v27 objectForKeyedSubscript:@"petsType"];
            [v113 setObject:v97 forKeyedSubscript:@"petsType"];

            results = self->_results;
            v139 = @"attributes";
            v140 = v113;
            id objb = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
            -[NSMutableArray addObject:](results, "addObject:");
            int v60 = 0;
          }
          else
          {
            int v116 = -18;
            int v60 = 1;
          }
LABEL_67:
        }
        if (v60)
        {

          goto LABEL_77;
        }
        ++v26;
      }
      while (v26 != v106);
      uint64_t v25 = [v105 countByEnumeratingWithState:&v128 objects:v143 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  v99 = self->_results;
  if (v99)
  {
    v137 = @"PetsKeypointsResults";
    v138 = v99;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
    int v116 = 0;
    id *v101 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v116 = 0;
  }
LABEL_77:

  return v116;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  return [(VCPImagePetsKeypointsAnalyzer *)self analyzePixelBuffer:a3 flags:a4 petsDetections:0 results:a5 cancel:a6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_petsKeypointsDetector, 0);
  objc_storeStrong((id *)&self->_petsDetector, 0);
}

@end