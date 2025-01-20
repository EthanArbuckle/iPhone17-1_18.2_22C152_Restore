@interface CIRedEyeCorrections
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSArray)inputCorrectionInfo;
- (NSString)inputCameraModel;
- (id)_initFromProperties:(id)a3;
- (id)_outputProperties;
- (id)outputImage;
- (void)setDefaults;
- (void)setInputCameraModel:(id)a3;
- (void)setInputCorrectionInfo:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIRedEyeCorrections

- (void)setDefaults
{
  self->inputCameraModel = 0;
  v3 = self->inputCorrectionInfo;
  self->inputCorrectionInfo = 0;
}

- (BOOL)_isIdentity
{
  return [(NSArray *)self->inputCorrectionInfo count] == 0;
}

- (id)outputImage
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  if ([(NSArray *)self->inputCorrectionInfo count])
  {
    if (self->inputCameraModel) {
      inputCameraModel = (__CFString *)self->inputCameraModel;
    }
    else {
      inputCameraModel = @"undefined";
    }
    v4 = self->inputImage;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    inputCorrectionInfo = self->inputCorrectionInfo;
    uint64_t v6 = [(NSArray *)inputCorrectionInfo countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(inputCorrectionInfo);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          v17[0] = @"inputCorrectionInfo";
          v17[1] = @"inputCameraModel";
          v18[0] = v10;
          v18[1] = inputCameraModel;
          v4 = -[CIImage imageByCompositingOverImage:](-[CIImage imageByApplyingFilter:withInputParameters:](v4, "imageByApplyingFilter:withInputParameters:", @"CIRedEyeCorrection", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2]), "imageByCompositingOverImage:", v4);
        }
        uint64_t v7 = [(NSArray *)inputCorrectionInfo countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v7);
    }
    return v4;
  }
  v12 = self->inputImage;

  return v12;
}

- (id)_outputProperties
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->inputCorrectionInfo count]) {
    return 0;
  }
  id v3 = [(NSArray *)self->inputCorrectionInfo objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"convexHull"];
  if (!v4 && ![v3 objectForKeyedSubscript:@"pointX"])
  {
    puts("red-eye repair dictionary is of unknown type");
    return 0;
  }
  v123 = (void *)[MEMORY[0x1E4F1CA48] array];
  v117 = (void *)[MEMORY[0x1E4F1CA48] array];
  v118 = self;
  if (v4)
  {
    long long v140 = 0uLL;
    long long v141 = 0uLL;
    long long v138 = 0uLL;
    long long v139 = 0uLL;
    inputCorrectionInfo = self->inputCorrectionInfo;
    uint64_t v6 = [(NSArray *)inputCorrectionInfo countByEnumeratingWithState:&v138 objects:v155 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v139;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v139 != v8) {
            objc_enumerationMutation(inputCorrectionInfo);
          }
          uint64_t v10 = *(void **)(*((void *)&v138 + 1) + 8 * i);
          v11 = NSString;
          objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"px"), "doubleValue");
          *(float *)&double v12 = v12;
          double v13 = *(float *)&v12;
          objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"py"), "doubleValue");
          *(float *)&double v14 = 1.0 - v14;
          [v123 addObject:objc_msgSend(v11, "stringWithFormat:", @"x = %.5f, y = %.5f, width = 10.0, height = 10.0, alpha = 0.0244, density = 0.86, strength = 0.0757, redBias = 0.253, pupilSize = 0.50, pupilDarkenAmount = 0.75", *(void *)&v13, *(float *)&v14)];
        }
        uint64_t v7 = [(NSArray *)inputCorrectionInfo countByEnumeratingWithState:&v138 objects:v155 count:16];
      }
      while (v7);
    }
    v122 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    obuint64_t j = self->inputCorrectionInfo;
    uint64_t v121 = [(NSArray *)obj countByEnumeratingWithState:&v134 objects:v154 count:16];
    if (v121)
    {
      uint64_t v120 = *(void *)v135;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v135 != v120) {
            objc_enumerationMutation(obj);
          }
          uint64_t v124 = v15;
          v125 = *(void **)(*((void *)&v134 + 1) + 8 * v15);
          long long v16 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          v17 = (void *)[v125 objectForKeyedSubscript:@"context"];
          v18 = (void *)[v17 objectForKeyedSubscript:@"faceRect"];
          v126 = v16;
          [v16 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@", objc_msgSend(v18, "objectAtIndexedSubscript:", 0), objc_msgSend(v18, "objectAtIndexedSubscript:", 1), objc_msgSend(v18, "objectAtIndexedSubscript:", 2), objc_msgSend(v18, "objectAtIndexedSubscript:", 3)), @"cfr" forKeyedSubscript];
          v19 = (void *)[v17 objectForKeyedSubscript:@"leftEye"];
          [v16 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@", objc_msgSend(v19, "objectAtIndexedSubscript:", 0), objc_msgSend(v19, "objectAtIndexedSubscript:", 1)), @"cle" forKeyedSubscript];
          uint64_t v20 = (void *)[v17 objectForKeyedSubscript:@"leftPoly0"];
          v21 = (void *)[v17 objectForKeyedSubscript:@"leftPoly1"];
          v22 = (void *)[v17 objectForKeyedSubscript:@"leftPoly2"];
          v23 = (void *)[v17 objectForKeyedSubscript:@"leftPoly3"];
          v24 = (void *)[v17 objectForKeyedSubscript:@"leftPoly4"];
          v25 = (void *)[v17 objectForKeyedSubscript:@"leftPoly5"];
          v26 = (void *)[v17 objectForKeyedSubscript:@"leftPoly6"];
          v27 = (void *)[v17 objectForKeyedSubscript:@"leftPoly7"];
          objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@", objc_msgSend(v20, "objectAtIndexedSubscript:", 0), objc_msgSend(v20, "objectAtIndexedSubscript:", 1), objc_msgSend(v21, "objectAtIndexedSubscript:", 0), objc_msgSend(v21, "objectAtIndexedSubscript:", 1), objc_msgSend(v22, "objectAtIndexedSubscript:", 0), objc_msgSend(v22, "objectAtIndexedSubscript:", 1), objc_msgSend(v23, "objectAtIndexedSubscript:", 0), objc_msgSend(v23, "objectAtIndexedSubscript:", 1), objc_msgSend(v24, "objectAtIndexedSubscript:", 0), objc_msgSend(v24, "objectAtIndexedSubscript:", 1), objc_msgSend(v25, "objectAtIndexedSubscript:", 0), objc_msgSend(v25, "objectAtIndexedSubscript:", 1), objc_msgSend(v26, "objectAtIndexedSubscript:", 0),
              [v26 objectAtIndexedSubscript:1],
              [v27 objectAtIndexedSubscript:0],
              [v27 objectAtIndexedSubscript:1]),
            @"clp");
          v28 = (void *)[v17 objectForKeyedSubscript:@"leftRect"];
          [v16 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@", objc_msgSend(v28, "objectAtIndexedSubscript:", 0), objc_msgSend(v28, "objectAtIndexedSubscript:", 1), objc_msgSend(v28, "objectAtIndexedSubscript:", 2), objc_msgSend(v28, "objectAtIndexedSubscript:", 3)), @"clr" forKeyedSubscript];
          v29 = (void *)[v17 objectForKeyedSubscript:@"leftDistMatrix"];
          [v16 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@", objc_msgSend(v29, "objectAtIndexedSubscript:", 0), objc_msgSend(v29, "objectAtIndexedSubscript:", 1), objc_msgSend(v29, "objectAtIndexedSubscript:", 2), objc_msgSend(v29, "objectAtIndexedSubscript:", 3)), @"clm" forKeyedSubscript];
          v30 = (void *)[v17 objectForKeyedSubscript:@"rightEye"];
          [v16 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@", objc_msgSend(v30, "objectAtIndexedSubscript:", 0), objc_msgSend(v30, "objectAtIndexedSubscript:", 1)), @"cre" forKeyedSubscript];
          v31 = (void *)[v17 objectForKeyedSubscript:@"rightPoly0"];
          v32 = (void *)[v17 objectForKeyedSubscript:@"rightPoly1"];
          v33 = (void *)[v17 objectForKeyedSubscript:@"rightPoly2"];
          v34 = (void *)[v17 objectForKeyedSubscript:@"rightPoly3"];
          v35 = (void *)[v17 objectForKeyedSubscript:@"rightPoly4"];
          v36 = (void *)[v17 objectForKeyedSubscript:@"rightPoly5"];
          v37 = (void *)[v17 objectForKeyedSubscript:@"rightPoly6"];
          v38 = (void *)[v17 objectForKeyedSubscript:@"rightPoly7"];
          objc_msgSend(v126, "setObject:forKeyedSubscript:", objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@", objc_msgSend(v31, "objectAtIndexedSubscript:", 0), objc_msgSend(v31, "objectAtIndexedSubscript:", 1), objc_msgSend(v32, "objectAtIndexedSubscript:", 0), objc_msgSend(v32, "objectAtIndexedSubscript:", 1), objc_msgSend(v33, "objectAtIndexedSubscript:", 0), objc_msgSend(v33, "objectAtIndexedSubscript:", 1), objc_msgSend(v34, "objectAtIndexedSubscript:", 0), objc_msgSend(v34, "objectAtIndexedSubscript:", 1), objc_msgSend(v35, "objectAtIndexedSubscript:", 0), objc_msgSend(v35, "objectAtIndexedSubscript:", 1), objc_msgSend(v36, "objectAtIndexedSubscript:", 0), objc_msgSend(v36, "objectAtIndexedSubscript:", 1), objc_msgSend(v37, "objectAtIndexedSubscript:", 0),
              [v37 objectAtIndexedSubscript:1],
              [v38 objectAtIndexedSubscript:0],
              [v38 objectAtIndexedSubscript:1]),
            @"crp");
          v39 = (void *)[v17 objectForKeyedSubscript:@"rightRect"];
          [v126 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@", objc_msgSend(v39, "objectAtIndexedSubscript:", 0), objc_msgSend(v39, "objectAtIndexedSubscript:", 1), objc_msgSend(v39, "objectAtIndexedSubscript:", 2), objc_msgSend(v39, "objectAtIndexedSubscript:", 3)), @"crr" forKeyedSubscript];
          v40 = (void *)[v17 objectForKeyedSubscript:@"rightDistMatrix"];
          [v126 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@", objc_msgSend(v40, "objectAtIndexedSubscript:", 0), objc_msgSend(v40, "objectAtIndexedSubscript:", 1), objc_msgSend(v40, "objectAtIndexedSubscript:", 2), objc_msgSend(v40, "objectAtIndexedSubscript:", 3)), @"crm" forKeyedSubscript];
          v41 = (void *)[v125 objectForKeyedSubscript:@"convexHull"];
          [v126 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@", objc_msgSend(v41, "objectForKeyedSubscript:", @"counterClockwise", objc_msgSend(v41, "objectForKeyedSubscript:", @"maxPoints", objc_msgSend(v41, "objectForKeyedSubscript:", @"nPoints", @"hin" forKeyedSubscript];
          v42 = (void *)[v41 objectForKeyedSubscript:@"hullBody"];
          int v43 = [v42 count];
          int v44 = v43;
          if (v43 < 1)
          {
            v47 = &stru_1EE465CC0;
          }
          else
          {
            uint64_t v45 = 0;
            uint64_t v46 = v43;
            v47 = &stru_1EE465CC0;
            uint64_t v129 = v43;
            int v131 = v43;
            do
            {
              if ((int)v46 - (int)v45 >= 4) {
                int v48 = 4;
              }
              else {
                int v48 = v46 - v45;
              }
              if (v46 - v45 >= 1)
              {
                uint64_t v49 = 0;
                do
                {
                  *(&v150 + v49) = (id)[v42 objectAtIndexedSubscript:v45 + v49];
                  ++v49;
                }
                while (v49 < v48);
              }
              if (v45) {
                v47 = (__CFString *)[(__CFString *)v47 stringByAppendingFormat:@" "];
              }
              switch(v48)
              {
                case 1:
                  uint64_t v50 = -[__CFString stringByAppendingFormat:](v47, "stringByAppendingFormat:", @"%@ %@", [v150 objectAtIndexedSubscript:0], objc_msgSend(v150, "objectAtIndexedSubscript:", 1), v108, v109, v110, v113, v115, v116);
                  goto LABEL_32;
                case 2:
                  id v68 = v150;
                  uint64_t v69 = [v150 objectAtIndexedSubscript:0];
                  uint64_t v70 = [v68 objectAtIndexedSubscript:1];
                  uint64_t v50 = -[__CFString stringByAppendingFormat:](v47, "stringByAppendingFormat:", @"%@ %@ %@ %@", v69, v70, [v151 objectAtIndexedSubscript:0], objc_msgSend(v151, "objectAtIndexedSubscript:", 1), v110, v113, v115, v116);
                  goto LABEL_32;
                case 3:
                  id v51 = v150;
                  uint64_t v52 = [v150 objectAtIndexedSubscript:0];
                  uint64_t v53 = [v51 objectAtIndexedSubscript:1];
                  id v54 = v151;
                  v55 = v47;
                  uint64_t v56 = [v151 objectAtIndexedSubscript:0];
                  uint64_t v57 = [v54 objectAtIndexedSubscript:1];
                  id v58 = v152;
                  uint64_t v59 = [v152 objectAtIndexedSubscript:0];
                  v60 = v58;
                  int v44 = v131;
                  uint64_t v111 = v59;
                  uint64_t v46 = v129;
                  uint64_t v50 = -[__CFString stringByAppendingFormat:](v55, "stringByAppendingFormat:", @"%@ %@ %@ %@ %@ %@", v52, v53, v56, v57, v111, [v60 objectAtIndexedSubscript:1], v115, v116);
                  goto LABEL_32;
                case 4:
                  id v61 = v150;
                  id v127 = (id)[v150 objectAtIndexedSubscript:0];
                  uint64_t v62 = [v61 objectAtIndexedSubscript:1];
                  id v63 = v151;
                  v64 = v47;
                  uint64_t v65 = [v151 objectAtIndexedSubscript:0];
                  uint64_t v66 = [v63 objectAtIndexedSubscript:1];
                  id v67 = v152;
                  uint64_t v112 = [v152 objectAtIndexedSubscript:0];
                  uint64_t v114 = [v67 objectAtIndexedSubscript:1];
                  uint64_t v46 = v129;
                  int v44 = v131;
                  uint64_t v50 = -[__CFString stringByAppendingFormat:](v64, "stringByAppendingFormat:", @"%@ %@ %@ %@ %@ %@ %@ %@", v127, v62, v65, v66, v112, v114, [v153 objectAtIndexedSubscript:0], objc_msgSend(v153, "objectAtIndexedSubscript:", 1));
LABEL_32:
                  v47 = (__CFString *)v50;
                  break;
                default:
                  break;
              }
              v45 += 4;
            }
            while ((int)v45 < v44);
          }
          [v126 setObject:v47 forKeyedSubscript:@"hb"];
          [v126 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@ %@ %@", objc_msgSend(v125, "objectForKeyedSubscript:", @"px", objc_msgSend(v125, "objectForKeyedSubscript:", @"py", objc_msgSend(v125, "objectForKeyedSubscript:", @"ioffx", objc_msgSend(v125, "objectForKeyedSubscript:", @"ioffy", objc_msgSend(v125, "objectForKeyedSubscript:", @"xf", objc_msgSend(v125, "objectForKeyedSubscript:", @"yf", @"g" forKeyedSubscript];
          [v126 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@", objc_msgSend(v125, "objectForKeyedSubscript:", @"xPosition", objc_msgSend(v125, "objectForKeyedSubscript:", @"hue", objc_msgSend(v125, "objectForKeyedSubscript:", @"saturation", objc_msgSend(v125, "objectForKeyedSubscript:", @"luminance", @"ec" forKeyedSubscript];
          [v126 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@ %@ %@ %@ %@", objc_msgSend(v125, "objectForKeyedSubscript:", @"skinval", objc_msgSend(v125, "objectForKeyedSubscript:", @"avgLuminance", objc_msgSend(v125, "objectForKeyedSubscript:", @"minLuminance", objc_msgSend(v125, "objectForKeyedSubscript:", @"maxLuminance", objc_msgSend(v125, "objectForKeyedSubscript:", @"darkPercent", objc_msgSend(v125, "objectForKeyedSubscript:", @"clipPercent", objc_msgSend(v125, "objectForKeyedSubscript:", @"variance", objc_msgSend(v125, "objectForKeyedSubscript:", @"nNonZero", @"sk" forKeyedSubscript];
          v71 = (void *)[v125 objectForKeyedSubscript:@"settings"];
          [v126 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@ %@", objc_msgSend(v71, "objectForKeyedSubscript:", @"IOD", objc_msgSend(v71, "objectForKeyedSubscript:", @"faceIndex", objc_msgSend(v71, "objectForKeyedSubscript:", @"side", objc_msgSend(v71, "objectForKeyedSubscript:", @"scale", objc_msgSend(v71, "objectForKeyedSubscript:", @"height", @"sg" forKeyedSubscript];
          [v126 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@ %@ %@ %@ %@ %@ %@", objc_msgSend(v71, "objectForKeyedSubscript:", @"alignmentTolerance", objc_msgSend(v71, "objectForKeyedSubscript:", @"capture", objc_msgSend(v71, "objectForKeyedSubscript:", @"connectThreshold", objc_msgSend(v71, "objectForKeyedSubscript:", @"downsampleOversizeX", objc_msgSend(v71, "objectForKeyedSubscript:", @"downsampleOversizeY", objc_msgSend(v71, "objectForKeyedSubscript:", @"downsampleType", objc_msgSend(v71, "objectForKeyedSubscript:", @"gradientChannel", objc_msgSend(v71, "objectForKeyedSubscript:", @"edgeFindingChannel", objc_msgSend(v71, "objectForKeyedSubscript:", @"minMagnitude", objc_msgSend(v71, "objectForKeyedSubscript:", @"regressionRadius", @"sp" forKeyedSubscript];
          v72 = (void *)[v71 objectForKeyedSubscript:@"transform"];
          [v126 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@ %@ %@", objc_msgSend(v72, "objectAtIndexedSubscript:", 0), objc_msgSend(v72, "objectAtIndexedSubscript:", 1), objc_msgSend(v72, "objectAtIndexedSubscript:", 2), objc_msgSend(v72, "objectAtIndexedSubscript:", 3), objc_msgSend(v72, "objectAtIndexedSubscript:", 4), objc_msgSend(v72, "objectAtIndexedSubscript:", 5)), @"st" forKeyedSubscript];
          [v122 addObject:v126];
          uint64_t v15 = v124 + 1;
        }
        while (v124 + 1 != v121);
        uint64_t v121 = [(NSArray *)obj countByEnumeratingWithState:&v134 objects:v154 count:16];
      }
      while (v121);
    }
    v73 = v118;
    id v74 = [(NSArray *)v118->inputCorrectionInfo objectAtIndex:0];
    objc_msgSend((id)objc_msgSend(v74, "objectForKeyedSubscript:", @"xf"), "doubleValue");
    v76 = v117;
    [v117 addObject:metadataPropertyWithDouble(v75)];
    objc_msgSend((id)objc_msgSend(v74, "objectForKeyedSubscript:", @"yf"), "doubleValue");
    [v117 addObject:metadataPropertyWithDouble(v77)];
    [v117 addObject:metadataPropertyWithDouble(1.0)];
    [v117 addObject:metadataPropertyWithDouble(1.0)];
    double v78 = 64.0;
  }
  else
  {
    long long v148 = 0uLL;
    long long v149 = 0uLL;
    long long v146 = 0uLL;
    long long v147 = 0uLL;
    v132 = self->inputCorrectionInfo;
    uint64_t v79 = [(NSArray *)v132 countByEnumeratingWithState:&v146 objects:v157 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v147;
      do
      {
        for (uint64_t j = 0; j != v80; ++j)
        {
          if (*(void *)v147 != v81) {
            objc_enumerationMutation(v132);
          }
          v83 = *(void **)(*((void *)&v146 + 1) + 8 * j);
          v84 = NSString;
          objc_msgSend((id)objc_msgSend(v83, "objectForKeyedSubscript:", @"pointX"), "doubleValue");
          *(float *)&double v85 = v85;
          double v86 = *(float *)&v85;
          objc_msgSend((id)objc_msgSend(v83, "objectForKeyedSubscript:", @"pointY"), "doubleValue");
          *(float *)&double v87 = 1.0 - v87;
          double v88 = *(float *)&v87;
          objc_msgSend((id)objc_msgSend(v83, "objectForKeyedSubscript:", @"size"), "doubleValue");
          uint64_t v90 = v89;
          objc_msgSend((id)objc_msgSend(v83, "objectForKeyedSubscript:", @"size"), "doubleValue");
          [v123 addObject:objc_msgSend(v84, "stringWithFormat:", @"x = %.5f, y = %.5f, width = %.5f, height = %.5f, alpha = 0.0244, density = 0.86, strength = 0.0757, redBias = 0.253, pupilSize = 0.50, pupilDarkenAmount = 0.75", *(void *)&v86, *(void *)&v88, v90, v91)];
        }
        uint64_t v80 = [(NSArray *)v132 countByEnumeratingWithState:&v146 objects:v157 count:16];
      }
      while (v80);
    }
    v122 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    v128 = self->inputCorrectionInfo;
    id v133 = (id)[(NSArray *)v128 countByEnumeratingWithState:&v142 objects:v156 count:16];
    if (v133)
    {
      uint64_t v130 = *(void *)v143;
      do
      {
        for (k = 0; k != v133; k = (char *)k + 1)
        {
          if (*(void *)v143 != v130) {
            objc_enumerationMutation(v128);
          }
          v93 = *(void **)(*((void *)&v142 + 1) + 8 * (void)k);
          v94 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          [v94 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@", objc_msgSend(v93, "objectForKeyedSubscript:", @"pointX", objc_msgSend(v93, "objectForKeyedSubscript:", @"pointY", objc_msgSend(v93, "objectForKeyedSubscript:", @"size", @"p" forKeyedSubscript];
          [v94 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@", objc_msgSend(v93, "objectForKeyedSubscript:", @"pupilShadeLow", objc_msgSend(v93, "objectForKeyedSubscript:", @"pupilShadeMedium", objc_msgSend(v93, "objectForKeyedSubscript:", @"pupilShadeHigh", objc_msgSend(v93, "objectForKeyedSubscript:", @"pupilShadeAverage", @"ps" forKeyedSubscript];
          objc_msgSend(v94, "setObject:forKeyedSubscript:", objc_msgSend(v93, "objectForKeyedSubscript:", @"interocularDistance"), @"iod");
          [v94 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@", objc_msgSend(v93, "objectForKeyedSubscript:", @"snappedX", objc_msgSend(v93, "objectForKeyedSubscript:", @"snappedY", @"s" forKeyedSubscript];
          [v94 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@", objc_msgSend(v93, "objectForKeyedSubscript:", @"bitmaskX", objc_msgSend(v93, "objectForKeyedSubscript:", @"bitmaskY", objc_msgSend(v93, "objectForKeyedSubscript:", @"bitmaskThreshold", @"b" forKeyedSubscript];
          [v94 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@", objc_msgSend(v93, "objectForKeyedSubscript:", @"cornealReflectionX", objc_msgSend(v93, "objectForKeyedSubscript:", @"cornealReflectionY", objc_msgSend(v93, "objectForKeyedSubscript:", @"cornealReflectionThreshold", @"cr" forKeyedSubscript];
          [v94 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@", objc_msgSend(v93, "objectForKeyedSubscript:", @"existingPupilLow", objc_msgSend(v93, "objectForKeyedSubscript:", @"existingPupilMedium", objc_msgSend(v93, "objectForKeyedSubscript:", @"existingPupilHigh", objc_msgSend(v93, "objectForKeyedSubscript:", @"existingPupilAverage", @"ep" forKeyedSubscript];
          objc_msgSend(v94, "setObject:forKeyedSubscript:", objc_msgSend(v93, "objectForKeyedSubscript:", @"averageSkinLuminance"), @"asl");
          [v94 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@", objc_msgSend(v93, "objectForKeyedSubscript:", @"searchRectangleMinimumY", objc_msgSend(v93, "objectForKeyedSubscript:", @"searchRectangleMaximumY", objc_msgSend(v93, "objectForKeyedSubscript:", @"searchRectangleMinimumX", objc_msgSend(v93, "objectForKeyedSubscript:", @"searchRectangleMaximumX", @"sr" forKeyedSubscript];
          [v94 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@ %@ %@", objc_msgSend(v93, "objectForKeyedSubscript:", @"repairRectangleMinimumY", objc_msgSend(v93, "objectForKeyedSubscript:", @"repairRectangleMaximumY", objc_msgSend(v93, "objectForKeyedSubscript:", @"repairRectangleMinimumX", objc_msgSend(v93, "objectForKeyedSubscript:", @"repairRectangleMaximumX", @"rr" forKeyedSubscript];
          v95 = (void *)[v93 objectForKeyedSubscript:@"forceCase"];
          [v95 floatValue];
          if (v96 != 0.0) {
            [v94 setObject:v95 forKeyedSubscript:@"fc"];
          }
          v97 = (void *)[v93 objectForKeyedSubscript:@"pupilShadeAlignment"];
          [v97 floatValue];
          if (v98 != 0.0) {
            [v94 setObject:v97 forKeyedSubscript:@"psa"];
          }
          v99 = (void *)[v93 objectForKeyedSubscript:@"finalEyeCase"];
          [v99 floatValue];
          if (v100 != 0.0) {
            [v94 setObject:v99 forKeyedSubscript:@"fec"];
          }
          [v122 addObject:v94];
        }
        id v133 = (id)[(NSArray *)v128 countByEnumeratingWithState:&v142 objects:v156 count:16];
      }
      while (v133);
    }
    v73 = self;
    id v101 = [(NSArray *)self->inputCorrectionInfo objectAtIndex:0];
    objc_msgSend((id)objc_msgSend(v101, "objectForKeyedSubscript:", @"fullImageWidth"), "doubleValue");
    v76 = v117;
    [v117 addObject:metadataPropertyWithDouble(v102)];
    objc_msgSend((id)objc_msgSend(v101, "objectForKeyedSubscript:", @"fullImageHeight"), "doubleValue");
    [v117 addObject:metadataPropertyWithDouble(v103)];
    objc_msgSend((id)objc_msgSend(v101, "objectForKeyedSubscript:", @"imageSpecialValue"), "doubleValue");
    [v117 addObject:metadataPropertyWithDouble(v104)];
    objc_msgSend((id)objc_msgSend(v101, "objectForKeyedSubscript:", @"imageOrientation"), "doubleValue");
    [v117 addObject:metadataPropertyWithDouble(v105)];
    objc_msgSend((id)objc_msgSend(v101, "objectForKeyedSubscript:", @"imageSignalToNoiseRatio"), "doubleValue");
  }
  [v76 addObject:metadataPropertyWithDouble(v78)];
  uint64_t inputCameraModel = (uint64_t)v73->inputCameraModel;
  if (inputCameraModel) {
    [v76 addObject:metadataPropertyWithString(@"http://ns.apple.com/adjustment-settings/1.0/", @"aas", @"RedEyeModel", inputCameraModel)];
  }
  [v76 addObject:metadataPropertyWithArrayOfStructs(@"http://ns.apple.com/adjustment-settings/1.0/", @"aas", @"http://ns.apple.com/adjustment-settings/1.0/sType/redeye", @"re", @"RedEyeCorrections", v122)];
  [v76 addObject:metadataPropertyWithBool()];
  [v76 addObject:metadataPropertyWithArray(@"http://ns.adobe.com/camera-raw-settings/1.0/", @"crs", @"RedEyeInfo", v123)];
  return v76;
}

- (id)_initFromProperties:(id)a3
{
  uint64_t v260 = *MEMORY[0x1E4F143B8];
  ArrayOfStructs = (void *)metadataPropertyArrayGetArrayOfStructs((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"http://ns.apple.com/adjustment-settings/1.0/sType/red-eye");
  if (!ArrayOfStructs) {
    goto LABEL_12;
  }
  uint64_t v6 = ArrayOfStructs;
  long long v230 = 0u;
  long long v231 = 0u;
  long long v228 = 0u;
  long long v229 = 0u;
  uint64_t v7 = [ArrayOfStructs countByEnumeratingWithState:&v228 objects:v259 count:16];
  if (!v7) {
    goto LABEL_12;
  }
  uint64_t v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v229;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v229 != v10) {
        objc_enumerationMutation(v6);
      }
      if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v228 + 1) + 8 * i), "allKeys"), "count")) {
        char v9 = 1;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v228 objects:v259 count:16];
  }
  while (v8);
  if ((v9 & 1) == 0)
  {
LABEL_12:
    double v226 = 0.0;
    double v227 = 0.0;
    double v224 = 0.0;
    double v225 = 0.0;
    double v223 = 0.0;
    if (!metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"RedEyeW", &v227)|| !metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"RedEyeH", &v226)|| !metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"RedEyeISV", &v225)|| !metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"RedEyeOrt", &v224)
      || (metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"RedEyeSNR", &v223) & 1) == 0)
    {
      goto LABEL_43;
    }
    id v193 = a3;
    v194 = self;
    double v12 = (void *)metadataPropertyArrayGetArrayOfStructs((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"http://ns.apple.com/adjustment-settings/1.0/sType/redeye");
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    long long v219 = 0u;
    long long v220 = 0u;
    long long v221 = 0u;
    long long v222 = 0u;
    obuint64_t j = v12;
    uint64_t v197 = [v12 countByEnumeratingWithState:&v219 objects:v258 count:16];
    if (v197)
    {
      uint64_t v196 = *(void *)v220;
      unint64_t v13 = 0x1E4F1C000uLL;
      while (2)
      {
        for (uint64_t j = 0; j != v197; ++j)
        {
          if (*(void *)v220 != v196) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v219 + 1) + 8 * j);
          if (objc_msgSend(v15, "objectForKeyedSubscript:", @"hb", v193, v194))
          {
            uint64_t v217 = j;
            v218 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:50];
            long long v16 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"cfr"), "componentsSeparatedByString:", @" ");
            v17 = NSNumber;
            objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", 0), "floatValue");
            v257[0] = objc_msgSend(v17, "numberWithFloat:");
            v18 = NSNumber;
            objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", 1), "floatValue");
            v257[1] = objc_msgSend(v18, "numberWithFloat:");
            v19 = NSNumber;
            objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", 2), "floatValue");
            v257[2] = objc_msgSend(v19, "numberWithFloat:");
            uint64_t v20 = NSNumber;
            objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", 3), "floatValue");
            v257[3] = objc_msgSend(v20, "numberWithFloat:");
            uint64_t v216 = [*(id *)(v13 + 2424) arrayWithObjects:v257 count:4];
            v21 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"cle"), "componentsSeparatedByString:", @" ");
            v22 = NSNumber;
            objc_msgSend((id)objc_msgSend(v21, "objectAtIndexedSubscript:", 0), "floatValue");
            v256[0] = objc_msgSend(v22, "numberWithFloat:");
            v23 = NSNumber;
            objc_msgSend((id)objc_msgSend(v21, "objectAtIndexedSubscript:", 1), "floatValue");
            v256[1] = objc_msgSend(v23, "numberWithFloat:");
            uint64_t v215 = [*(id *)(v13 + 2424) arrayWithObjects:v256 count:2];
            v24 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"clp"), "componentsSeparatedByString:", @" ");
            v25 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 0), "floatValue");
            v255[0] = objc_msgSend(v25, "numberWithFloat:");
            v26 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 1), "floatValue");
            v255[1] = objc_msgSend(v26, "numberWithFloat:");
            uint64_t v214 = [*(id *)(v13 + 2424) arrayWithObjects:v255 count:2];
            v27 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 2), "floatValue");
            v254[0] = objc_msgSend(v27, "numberWithFloat:");
            v28 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 3), "floatValue");
            v254[1] = objc_msgSend(v28, "numberWithFloat:");
            uint64_t v213 = [*(id *)(v13 + 2424) arrayWithObjects:v254 count:2];
            v29 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 4), "floatValue");
            v253[0] = objc_msgSend(v29, "numberWithFloat:");
            v30 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 5), "floatValue");
            v253[1] = objc_msgSend(v30, "numberWithFloat:");
            uint64_t v212 = [*(id *)(v13 + 2424) arrayWithObjects:v253 count:2];
            v31 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 6), "floatValue");
            v252[0] = objc_msgSend(v31, "numberWithFloat:");
            v32 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 7), "floatValue");
            v252[1] = objc_msgSend(v32, "numberWithFloat:");
            uint64_t v211 = [*(id *)(v13 + 2424) arrayWithObjects:v252 count:2];
            v33 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 8), "floatValue");
            v251[0] = objc_msgSend(v33, "numberWithFloat:");
            v34 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 9), "floatValue");
            v251[1] = objc_msgSend(v34, "numberWithFloat:");
            uint64_t v210 = [*(id *)(v13 + 2424) arrayWithObjects:v251 count:2];
            v35 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 10), "floatValue");
            v250[0] = objc_msgSend(v35, "numberWithFloat:");
            v36 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 11), "floatValue");
            v250[1] = objc_msgSend(v36, "numberWithFloat:");
            uint64_t v209 = [*(id *)(v13 + 2424) arrayWithObjects:v250 count:2];
            v37 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 12), "floatValue");
            v249[0] = objc_msgSend(v37, "numberWithFloat:");
            v38 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 13), "floatValue");
            v249[1] = objc_msgSend(v38, "numberWithFloat:");
            uint64_t v208 = [*(id *)(v13 + 2424) arrayWithObjects:v249 count:2];
            v39 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 14), "floatValue");
            v248[0] = objc_msgSend(v39, "numberWithFloat:");
            v40 = NSNumber;
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 15), "floatValue");
            v248[1] = objc_msgSend(v40, "numberWithFloat:");
            uint64_t v207 = [*(id *)(v13 + 2424) arrayWithObjects:v248 count:2];
            v41 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"clr"), "componentsSeparatedByString:", @" ");
            v42 = NSNumber;
            objc_msgSend((id)objc_msgSend(v41, "objectAtIndexedSubscript:", 0), "floatValue");
            v247[0] = objc_msgSend(v42, "numberWithFloat:");
            int v43 = NSNumber;
            objc_msgSend((id)objc_msgSend(v41, "objectAtIndexedSubscript:", 1), "floatValue");
            v247[1] = objc_msgSend(v43, "numberWithFloat:");
            int v44 = NSNumber;
            objc_msgSend((id)objc_msgSend(v41, "objectAtIndexedSubscript:", 2), "floatValue");
            v247[2] = objc_msgSend(v44, "numberWithFloat:");
            uint64_t v45 = NSNumber;
            objc_msgSend((id)objc_msgSend(v41, "objectAtIndexedSubscript:", 3), "floatValue");
            v247[3] = objc_msgSend(v45, "numberWithFloat:");
            uint64_t v206 = [*(id *)(v13 + 2424) arrayWithObjects:v247 count:4];
            uint64_t v46 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"clm"), "componentsSeparatedByString:", @" ");
            v47 = NSNumber;
            objc_msgSend((id)objc_msgSend(v46, "objectAtIndexedSubscript:", 0), "floatValue");
            v246[0] = objc_msgSend(v47, "numberWithFloat:");
            int v48 = NSNumber;
            objc_msgSend((id)objc_msgSend(v46, "objectAtIndexedSubscript:", 1), "floatValue");
            v246[1] = objc_msgSend(v48, "numberWithFloat:");
            uint64_t v49 = NSNumber;
            objc_msgSend((id)objc_msgSend(v46, "objectAtIndexedSubscript:", 2), "floatValue");
            v246[2] = objc_msgSend(v49, "numberWithFloat:");
            uint64_t v50 = NSNumber;
            objc_msgSend((id)objc_msgSend(v46, "objectAtIndexedSubscript:", 3), "floatValue");
            v246[3] = objc_msgSend(v50, "numberWithFloat:");
            uint64_t v205 = [*(id *)(v13 + 2424) arrayWithObjects:v246 count:4];
            id v51 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"cre"), "componentsSeparatedByString:", @" ");
            uint64_t v52 = NSNumber;
            objc_msgSend((id)objc_msgSend(v51, "objectAtIndexedSubscript:", 0), "floatValue");
            v245[0] = objc_msgSend(v52, "numberWithFloat:");
            uint64_t v53 = NSNumber;
            objc_msgSend((id)objc_msgSend(v51, "objectAtIndexedSubscript:", 1), "floatValue");
            v245[1] = objc_msgSend(v53, "numberWithFloat:");
            uint64_t v204 = [*(id *)(v13 + 2424) arrayWithObjects:v245 count:2];
            id v54 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"crp"), "componentsSeparatedByString:", @" ");
            v55 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 0), "floatValue");
            v244[0] = objc_msgSend(v55, "numberWithFloat:");
            uint64_t v56 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 1), "floatValue");
            v244[1] = objc_msgSend(v56, "numberWithFloat:");
            uint64_t v203 = [*(id *)(v13 + 2424) arrayWithObjects:v244 count:2];
            uint64_t v57 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 2), "floatValue");
            v243[0] = objc_msgSend(v57, "numberWithFloat:");
            id v58 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 3), "floatValue");
            v243[1] = objc_msgSend(v58, "numberWithFloat:");
            uint64_t v202 = [*(id *)(v13 + 2424) arrayWithObjects:v243 count:2];
            uint64_t v59 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 4), "floatValue");
            v242[0] = objc_msgSend(v59, "numberWithFloat:");
            v60 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 5), "floatValue");
            v242[1] = objc_msgSend(v60, "numberWithFloat:");
            uint64_t v201 = [*(id *)(v13 + 2424) arrayWithObjects:v242 count:2];
            id v61 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 6), "floatValue");
            v241[0] = objc_msgSend(v61, "numberWithFloat:");
            uint64_t v62 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 7), "floatValue");
            v241[1] = objc_msgSend(v62, "numberWithFloat:");
            uint64_t v200 = [*(id *)(v13 + 2424) arrayWithObjects:v241 count:2];
            id v63 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 8), "floatValue");
            v240[0] = objc_msgSend(v63, "numberWithFloat:");
            v64 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 9), "floatValue");
            v240[1] = objc_msgSend(v64, "numberWithFloat:");
            uint64_t v199 = [*(id *)(v13 + 2424) arrayWithObjects:v240 count:2];
            uint64_t v65 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 10), "floatValue");
            v239[0] = objc_msgSend(v65, "numberWithFloat:");
            uint64_t v66 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 11), "floatValue");
            v239[1] = objc_msgSend(v66, "numberWithFloat:");
            uint64_t v67 = [*(id *)(v13 + 2424) arrayWithObjects:v239 count:2];
            id v68 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 12), "floatValue");
            v238[0] = objc_msgSend(v68, "numberWithFloat:");
            uint64_t v69 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 13), "floatValue");
            v238[1] = objc_msgSend(v69, "numberWithFloat:");
            uint64_t v198 = [*(id *)(v13 + 2424) arrayWithObjects:v238 count:2];
            uint64_t v70 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 14), "floatValue");
            v237[0] = objc_msgSend(v70, "numberWithFloat:");
            v71 = NSNumber;
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 15), "floatValue");
            v237[1] = objc_msgSend(v71, "numberWithFloat:");
            uint64_t v72 = [*(id *)(v13 + 2424) arrayWithObjects:v237 count:2];
            v73 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"crr"), "componentsSeparatedByString:", @" ");
            id v74 = v15;
            unint64_t v75 = v13;
            v76 = NSNumber;
            objc_msgSend((id)objc_msgSend(v73, "objectAtIndexedSubscript:", 0), "floatValue");
            v236[0] = objc_msgSend(v76, "numberWithFloat:");
            double v77 = NSNumber;
            objc_msgSend((id)objc_msgSend(v73, "objectAtIndexedSubscript:", 1), "floatValue");
            v236[1] = objc_msgSend(v77, "numberWithFloat:");
            double v78 = NSNumber;
            objc_msgSend((id)objc_msgSend(v73, "objectAtIndexedSubscript:", 2), "floatValue");
            v236[2] = objc_msgSend(v78, "numberWithFloat:");
            uint64_t v79 = NSNumber;
            objc_msgSend((id)objc_msgSend(v73, "objectAtIndexedSubscript:", 3), "floatValue");
            v236[3] = objc_msgSend(v79, "numberWithFloat:");
            uint64_t v80 = [*(id *)(v75 + 2424) arrayWithObjects:v236 count:4];
            uint64_t v81 = objc_msgSend((id)objc_msgSend(v74, "objectForKeyedSubscript:", @"crm"), "componentsSeparatedByString:", @" ");
            v82 = NSNumber;
            objc_msgSend((id)objc_msgSend(v81, "objectAtIndexedSubscript:", 0), "floatValue");
            v235[0] = objc_msgSend(v82, "numberWithFloat:");
            v83 = NSNumber;
            objc_msgSend((id)objc_msgSend(v81, "objectAtIndexedSubscript:", 1), "floatValue");
            v235[1] = objc_msgSend(v83, "numberWithFloat:");
            v84 = NSNumber;
            objc_msgSend((id)objc_msgSend(v81, "objectAtIndexedSubscript:", 2), "floatValue");
            v235[2] = objc_msgSend(v84, "numberWithFloat:");
            double v85 = NSNumber;
            double v86 = v81;
            unint64_t v13 = v75;
            objc_msgSend((id)objc_msgSend(v86, "objectAtIndexedSubscript:", 3), "floatValue");
            v235[3] = objc_msgSend(v85, "numberWithFloat:");
            uint64_t v87 = [*(id *)(v75 + 2424) arrayWithObjects:v235 count:4];
            v234[0] = v216;
            v234[1] = v215;
            v234[2] = v214;
            v234[3] = v213;
            v234[4] = v212;
            v234[5] = v211;
            v234[6] = v210;
            v234[7] = v209;
            v234[8] = v208;
            v234[9] = v207;
            v234[10] = v206;
            v234[11] = v204;
            v234[12] = v203;
            v234[13] = v202;
            v234[14] = v201;
            v234[15] = v200;
            v234[16] = v199;
            v234[17] = v67;
            v234[18] = v198;
            v234[19] = v72;
            v234[20] = v80;
            v234[21] = v205;
            v233[0] = @"faceRect";
            v233[1] = @"leftEye";
            v233[2] = @"leftPoly0";
            v233[3] = @"leftPoly1";
            v233[4] = @"leftPoly2";
            v233[5] = @"leftPoly3";
            v233[6] = @"leftPoly4";
            v233[7] = @"leftPoly5";
            v233[8] = @"leftPoly6";
            v233[9] = @"leftPoly7";
            v233[10] = @"leftRect";
            v233[11] = @"rightEye";
            v233[12] = @"rightPoly0";
            v233[13] = @"rightPoly1";
            v233[14] = @"rightPoly2";
            v233[15] = @"rightPoly3";
            v233[16] = @"rightPoly4";
            v233[17] = @"rightPoly5";
            v233[18] = @"rightPoly6";
            v233[19] = @"rightPoly7";
            v233[20] = @"rightRect";
            v233[21] = @"leftDistMatrix";
            v233[22] = @"rightDistMatrix";
            v234[22] = v87;
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v234, v233, 23), @"context");
            double v88 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            uint64_t v89 = v74;
            uint64_t v90 = objc_msgSend((id)objc_msgSend(v74, "objectForKeyedSubscript:", @"hin"), "componentsSeparatedByString:", @" ");
            uint64_t v91 = NSNumber;
            objc_msgSend((id)objc_msgSend(v90, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v88, "setObject:forKeyedSubscript:", objc_msgSend(v91, "numberWithFloat:"), @"counterClockwise");
            v92 = NSNumber;
            objc_msgSend((id)objc_msgSend(v90, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v88, "setObject:forKeyedSubscript:", objc_msgSend(v92, "numberWithFloat:"), @"maxPoints");
            v93 = NSNumber;
            objc_msgSend((id)objc_msgSend(v90, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v88, "setObject:forKeyedSubscript:", objc_msgSend(v93, "numberWithFloat:"), @"nPoints");
            v94 = (void *)[MEMORY[0x1E4F1CA48] array];
            v95 = objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", @"hb"), "componentsSeparatedByString:", @" ");
            if ([v95 count])
            {
              unint64_t v96 = 0;
              do
              {
                v97 = NSNumber;
                objc_msgSend((id)objc_msgSend(v95, "objectAtIndexedSubscript:", v96), "floatValue");
                v232[0] = objc_msgSend(v97, "numberWithFloat:");
                float v98 = NSNumber;
                objc_msgSend((id)objc_msgSend(v95, "objectAtIndexedSubscript:", v96 + 1), "floatValue");
                v99 = v98;
                unint64_t v13 = v75;
                v232[1] = objc_msgSend(v99, "numberWithFloat:");
                objc_msgSend(v94, "addObject:", objc_msgSend(*(id *)(v75 + 2424), "arrayWithObjects:count:", v232, 2));
                v96 += 2;
              }
              while ([v95 count] > v96);
            }
            [v88 setObject:v94 forKeyedSubscript:@"hullBody"];
            [v218 setObject:v88 forKeyedSubscript:@"convexHull"];
            float v100 = v218;
            id v101 = objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", @"g"), "componentsSeparatedByString:", @" ");
            double v102 = NSNumber;
            objc_msgSend((id)objc_msgSend(v101, "objectAtIndexedSubscript:", 0), "floatValue");
            uint64_t v103 = objc_msgSend(v102, "numberWithFloat:");
            [v218 setObject:v103 forKeyedSubscript:@"px"];
            [v218 setObject:v103 forKeyedSubscript:@"pointX"];
            double v104 = NSNumber;
            objc_msgSend((id)objc_msgSend(v101, "objectAtIndexedSubscript:", 1), "floatValue");
            uint64_t v105 = objc_msgSend(v104, "numberWithFloat:");
            [v218 setObject:v105 forKeyedSubscript:@"py"];
            [v218 setObject:v105 forKeyedSubscript:@"pointY"];
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v101, "objectAtIndexedSubscript:", 2), "intValue")), @"ioffx");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v101, "objectAtIndexedSubscript:", 3), "intValue")), @"ioffy");
            v106 = NSNumber;
            objc_msgSend((id)objc_msgSend(v101, "objectAtIndexedSubscript:", 4), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v106, "numberWithFloat:"), @"xf");
            v107 = NSNumber;
            objc_msgSend((id)objc_msgSend(v101, "objectAtIndexedSubscript:", 5), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v107, "numberWithFloat:"), @"yf");
            uint64_t v108 = objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", @"ec"), "componentsSeparatedByString:", @" ");
            uint64_t v109 = NSNumber;
            objc_msgSend((id)objc_msgSend(v108, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v109, "numberWithFloat:"), @"xPosition");
            uint64_t v110 = NSNumber;
            objc_msgSend((id)objc_msgSend(v108, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v110, "numberWithFloat:"), @"hue");
            uint64_t v111 = NSNumber;
            objc_msgSend((id)objc_msgSend(v108, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v111, "numberWithFloat:"), @"saturation");
            uint64_t v112 = NSNumber;
            objc_msgSend((id)objc_msgSend(v108, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v112, "numberWithFloat:"), @"luminance");
            uint64_t v113 = objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", @"sk"), "componentsSeparatedByString:", @" ");
            uint64_t v114 = NSNumber;
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v114, "numberWithFloat:"), @"skinval");
            uint64_t v115 = NSNumber;
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v115, "numberWithFloat:"), @"avgLuminance");
            uint64_t v116 = NSNumber;
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v116, "numberWithFloat:"), @"minLuminance");
            v117 = NSNumber;
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v117, "numberWithFloat:"), @"maxLuminance");
            v118 = NSNumber;
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 4), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v118, "numberWithFloat:"), @"darkPercent");
            v119 = NSNumber;
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 5), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v119, "numberWithFloat:"), @"clipPercent");
            uint64_t v120 = NSNumber;
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 6), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v120, "numberWithFloat:"), @"variance");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 7), "intValue")), @"nNonZero");
            uint64_t v121 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            v122 = objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", @"sg"), "componentsSeparatedByString:", @" ");
            v123 = NSNumber;
            objc_msgSend((id)objc_msgSend(v122, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v123, "numberWithFloat:"), @"IOD");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v122, "objectAtIndexedSubscript:", 1), "intValue")), @"faceIndex");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v122, "objectAtIndexedSubscript:", 2), "intValue")), @"side");
            uint64_t v124 = NSNumber;
            objc_msgSend((id)objc_msgSend(v122, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v124, "numberWithFloat:"), @"scale");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v122, "objectAtIndexedSubscript:", 4), "intValue")), @"height");
            v125 = objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", @"sp"), "componentsSeparatedByString:", @" ");
            v126 = NSNumber;
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v126, "numberWithFloat:"), @"alignmentTolerance");
            id v127 = NSNumber;
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v127, "numberWithFloat:"), @"capture");
            v128 = NSNumber;
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v128, "numberWithFloat:"), @"connectThreshold");
            uint64_t v129 = NSNumber;
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v129, "numberWithFloat:"), @"downsampleOversizeX");
            uint64_t v130 = NSNumber;
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 4), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v130, "numberWithFloat:"), @"downsampleOversizeY");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 5), "intValue")), @"downsampleType");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 6), "intValue")), @"gradientChannel");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 7), "intValue")), @"edgeFindingChannel");
            int v131 = NSNumber;
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 8), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v131, "numberWithFloat:"), @"minMagnitude");
            v132 = NSNumber;
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 9), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v132, "numberWithFloat:"), @"regressionRadius");
            id v133 = (void *)[MEMORY[0x1E4F1CA48] array];
            long long v134 = objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", @"st"), "componentsSeparatedByString:", @" ");
            long long v135 = NSNumber;
            objc_msgSend((id)objc_msgSend(v134, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v133, "addObject:", objc_msgSend(v135, "numberWithFloat:"));
            long long v136 = NSNumber;
            objc_msgSend((id)objc_msgSend(v134, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v133, "addObject:", objc_msgSend(v136, "numberWithFloat:"));
            long long v137 = NSNumber;
            objc_msgSend((id)objc_msgSend(v134, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v133, "addObject:", objc_msgSend(v137, "numberWithFloat:"));
            long long v138 = NSNumber;
            objc_msgSend((id)objc_msgSend(v134, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v133, "addObject:", objc_msgSend(v138, "numberWithFloat:"));
            long long v139 = NSNumber;
            objc_msgSend((id)objc_msgSend(v134, "objectAtIndexedSubscript:", 4), "floatValue");
            objc_msgSend(v133, "addObject:", objc_msgSend(v139, "numberWithFloat:"));
            long long v140 = NSNumber;
            objc_msgSend((id)objc_msgSend(v134, "objectAtIndexedSubscript:", 5), "floatValue");
            objc_msgSend(v133, "addObject:", objc_msgSend(v140, "numberWithFloat:"));
            [v121 setObject:v133 forKeyedSubscript:@"transform"];
            [v218 setObject:v121 forKeyedSubscript:@"settings"];
            uint64_t j = v217;
          }
          else
          {
            if (![v15 objectForKeyedSubscript:@"p1"])
            {
              puts("red-eye repair dictionary is of unknown type");
              return 0;
            }
            float v100 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:50];
            long long v141 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"p"), "componentsSeparatedByString:", @" ");
            long long v142 = NSNumber;
            objc_msgSend((id)objc_msgSend(v141, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v142, "numberWithFloat:"), @"pointX");
            long long v143 = NSNumber;
            objc_msgSend((id)objc_msgSend(v141, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v143, "numberWithFloat:"), @"pointY");
            long long v144 = NSNumber;
            objc_msgSend((id)objc_msgSend(v141, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v144, "numberWithFloat:"), @"size");
            long long v145 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"ps"), "componentsSeparatedByString:", @" ");
            long long v146 = NSNumber;
            objc_msgSend((id)objc_msgSend(v145, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v146, "numberWithFloat:"), @"pupilShadeLow");
            long long v147 = NSNumber;
            objc_msgSend((id)objc_msgSend(v145, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v147, "numberWithFloat:"), @"pupilShadeMedium");
            long long v148 = NSNumber;
            objc_msgSend((id)objc_msgSend(v145, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v148, "numberWithFloat:"), @"pupilShadeHigh");
            long long v149 = NSNumber;
            objc_msgSend((id)objc_msgSend(v145, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v149, "numberWithFloat:"), @"pupilShadeAverage");
            id v150 = NSNumber;
            objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"iod"), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v150, "numberWithFloat:"), @"interocularDistance");
            id v151 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"s"), "componentsSeparatedByString:", @" ");
            id v152 = NSNumber;
            objc_msgSend((id)objc_msgSend(v151, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v152, "numberWithFloat:"), @"snappedX");
            id v153 = NSNumber;
            objc_msgSend((id)objc_msgSend(v151, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v153, "numberWithFloat:"), @"snappedY");
            v154 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"b"), "componentsSeparatedByString:", @" ");
            v155 = NSNumber;
            objc_msgSend((id)objc_msgSend(v154, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v155, "numberWithFloat:"), @"bitmaskX");
            v156 = NSNumber;
            objc_msgSend((id)objc_msgSend(v154, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v156, "numberWithFloat:"), @"bitmaskY");
            v157 = NSNumber;
            objc_msgSend((id)objc_msgSend(v154, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v157, "numberWithFloat:"), @"bitmaskThreshold");
            uint64_t v158 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"cr"), "componentsSeparatedByString:", @" ");
            v159 = NSNumber;
            objc_msgSend((id)objc_msgSend(v158, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v159, "numberWithFloat:"), @"cornealReflectionX");
            v160 = NSNumber;
            objc_msgSend((id)objc_msgSend(v158, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v160, "numberWithFloat:"), @"cornealReflectionY");
            v161 = NSNumber;
            objc_msgSend((id)objc_msgSend(v158, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v161, "numberWithFloat:"), @"cornealReflectionThreshold");
            v162 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"ep"), "componentsSeparatedByString:", @" ");
            v163 = NSNumber;
            objc_msgSend((id)objc_msgSend(v162, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v163, "numberWithFloat:"), @"existingPupilLow");
            v164 = NSNumber;
            objc_msgSend((id)objc_msgSend(v162, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v164, "numberWithFloat:"), @"existingPupilMedium");
            v165 = NSNumber;
            objc_msgSend((id)objc_msgSend(v162, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v165, "numberWithFloat:"), @"existingPupilHigh");
            v166 = NSNumber;
            objc_msgSend((id)objc_msgSend(v162, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v166, "numberWithFloat:"), @"existingPupilAverage");
            v167 = NSNumber;
            objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"asl"), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v167, "numberWithFloat:"), @"averageSkinLuminance");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v224), @"imageOrientation");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v223), @"imageSignalToNoiseRatio");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v225), @"imageSpecialValue");
            v168 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"sr"), "componentsSeparatedByString:", @" ");
            v169 = NSNumber;
            objc_msgSend((id)objc_msgSend(v168, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v169, "numberWithFloat:"), @"searchRectangleMinimumY");
            v170 = NSNumber;
            objc_msgSend((id)objc_msgSend(v168, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v170, "numberWithFloat:"), @"searchRectangleMaximumY");
            v171 = NSNumber;
            objc_msgSend((id)objc_msgSend(v168, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v171, "numberWithFloat:"), @"searchRectangleMinimumX");
            v172 = NSNumber;
            objc_msgSend((id)objc_msgSend(v168, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v172, "numberWithFloat:"), @"searchRectangleMaximumX");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v227), @"fullImageWidth");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v226), @"fullImageHeight");
            v173 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"rr"), "componentsSeparatedByString:", @" ");
            v174 = NSNumber;
            objc_msgSend((id)objc_msgSend(v173, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v174, "numberWithFloat:"), @"repairRectangleMinimumY");
            v175 = NSNumber;
            objc_msgSend((id)objc_msgSend(v173, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v175, "numberWithFloat:"), @"repairRectangleMaximumY");
            v176 = NSNumber;
            objc_msgSend((id)objc_msgSend(v173, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v176, "numberWithFloat:"), @"repairRectangleMinimumX");
            v177 = NSNumber;
            objc_msgSend((id)objc_msgSend(v173, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v177, "numberWithFloat:"), @"repairRectangleMaximumX");
            v178 = (void *)[v15 objectForKeyedSubscript:@"fc"];
            if (v178)
            {
              v179 = NSNumber;
              [v178 floatValue];
              v180 = objc_msgSend(v179, "numberWithFloat:");
              v181 = v100;
            }
            else
            {
              v181 = v100;
              v180 = &unk_1EE4AB6F0;
            }
            [v181 setObject:v180 forKeyedSubscript:@"forceCase"];
            v182 = (void *)[v15 objectForKeyedSubscript:@"psa"];
            if (v182)
            {
              v183 = NSNumber;
              [v182 floatValue];
              v184 = objc_msgSend(v183, "numberWithFloat:");
              v185 = v100;
            }
            else
            {
              v185 = v100;
              v184 = &unk_1EE4AB6F0;
            }
            [v185 setObject:v184 forKeyedSubscript:@"pupilShadeAlignment"];
            v186 = (void *)[v15 objectForKeyedSubscript:@"fec"];
            if (v186)
            {
              v187 = NSNumber;
              [v186 floatValue];
              v188 = objc_msgSend(v187, "numberWithFloat:");
              v189 = v100;
            }
            else
            {
              v189 = v100;
              v188 = &unk_1EE4AB6F0;
            }
            [v189 setObject:v188 forKeyedSubscript:@"finalEyeCase"];
          }
          [v6 addObject:v100];
        }
        uint64_t v197 = [obj countByEnumeratingWithState:&v219 objects:v258 count:16];
        if (v197) {
          continue;
        }
        break;
      }
    }
    self = v194;
  }
  id String = metadataPropertyArrayGetString();
  if (v6)
  {
    id v191 = String;
    [(CIRedEyeCorrections *)self setInputCorrectionInfo:v6];
    [(CIRedEyeCorrections *)self setInputCameraModel:v191];
    return self;
  }
LABEL_43:

  return 0;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSString)inputCameraModel
{
  return self->inputCameraModel;
}

- (void)setInputCameraModel:(id)a3
{
}

- (NSArray)inputCorrectionInfo
{
  return self->inputCorrectionInfo;
}

- (void)setInputCorrectionInfo:(id)a3
{
}

@end