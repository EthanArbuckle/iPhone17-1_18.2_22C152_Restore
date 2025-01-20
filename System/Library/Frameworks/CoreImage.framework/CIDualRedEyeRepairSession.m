@interface CIDualRedEyeRepairSession
+ (id)_contextRGBAh;
- (BOOL)_repairPrimaryWithSecondary:(__CVBuffer *)a3 to:(__CVBuffer *)a4;
- (BOOL)prepareRepair;
- (BOOL)prepareRepairWithTuningParametersByPortType:(id)a3;
- (BOOL)prewarm;
- (BOOL)renderUsingPixelBuffers;
- (BOOL)renderUsingProvidedCommandQueue;
- (BOOL)repairFace:(id)a3 filter:(id)a4;
- (BOOL)repairPrimaryWithSecondary:(__CVBuffer *)a3;
- (BOOL)setPrimary:(__CVBuffer *)a3 observations:(id)a4 metadata:(id)a5;
- (BOOL)validateRenderState;
- (CIContext)context;
- (CIDualRedEyeRepairSession)init;
- (CIDualRedEyeRepairTuning)tuning;
- (CIImage)primaryImage;
- (CIImage)secondaryImage;
- (CIRenderDestination)destination;
- (MTLCommandBuffer)commandBuffer;
- (MTLCommandQueue)commandQueue;
- (MTLTexture)outputTexture;
- (MTLTexture)primaryTexture;
- (MTLTexture)secondaryTexture;
- (NSArray)faces;
- (NSArray)observations;
- (NSDate)timestamp;
- (NSDictionary)imageProperties;
- (NSDictionary)metadata;
- (NSDictionary)tuningParametersByPortType;
- (id)redEyeFaceFromObservation:(id)a3 exifOrientation:(int)a4;
- (int)validateRepair;
- (int)validateSetPrimary;
- (void)cleanupState;
- (void)customizeRepairFilter:(id)a3 forFace:(id)a4;
- (void)dealloc;
- (void)dumpInputs;
- (void)dumpObservation:(id)a3 index:(int)a4;
- (void)dumpSecondary;
- (void)prewarm;
- (void)setCommandBuffer:(id)a3;
- (void)setCommandQueue:(id)a3;
- (void)setContext:(id)a3;
- (void)setDestination:(id)a3;
- (void)setFaces:(id)a3;
- (void)setImageProperties:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setObservations:(id)a3;
- (void)setOutputTexture:(id)a3;
- (void)setPrimaryImage:(id)a3;
- (void)setPrimaryTexture:(id)a3;
- (void)setSecondaryImage:(id)a3;
- (void)setSecondaryTexture:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setTuning:(id)a3;
- (void)setTuningParametersByPortType:(id)a3;
- (void)validateRenderState;
- (void)validateRepair;
- (void)validateSetPrimary;
@end

@implementation CIDualRedEyeRepairSession

+ (id)_contextRGBAh
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"working_format";
  v4[0] = [NSNumber numberWithInt:2056];
  return +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", @"CIDualRedEyeRepairRGBAh", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1]);
}

- (CIDualRedEyeRepairSession)init
{
  v4.receiver = self;
  v4.super_class = (Class)CIDualRedEyeRepairSession;
  v2 = [(CIDualRedEyeRepairSession *)&v4 init];
  if (v2) {
    [(CIDualRedEyeRepairSession *)v2 setTuning:[[CIDualRedEyeRepairTuning alloc] initWithTuning:0]];
  }
  return v2;
}

- (void)dealloc
{
  [(CIDualRedEyeRepairSession *)self cleanupState];
  v3.receiver = self;
  v3.super_class = (Class)CIDualRedEyeRepairSession;
  [(CIDualRedEyeRepairSession *)&v3 dealloc];
}

- (void)cleanupState
{
  self->_primary = 0;
  self->_secondary = 0;
}

- (BOOL)prewarm
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  if ([(CIContext *)[(CIDualRedEyeRepairSession *)self context] loadArchive:@"redeye_repair_archive"])
  {
LABEL_2:
    LOBYTE(v3) = 1;
    return v3;
  }
  objc_super v4 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor redColor]);
  v5 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor greenColor]);
  v6 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor blueColor]);
  v7 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor cyanColor]);
  v8 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor magentaColor]);
  v102 = -[CIImage imageByCroppingToRect:](v4, "imageByCroppingToRect:", 0.0, 0.0, 4224.0, 3024.0);
  uint64_t v9 = -[CIImage imageByCroppingToRect:](v5, "imageByCroppingToRect:", 0.0, 0.0, 4224.0, 3024.0);
  uint64_t v100 = -[CIImage imageByCroppingToRect:](v6, "imageByCroppingToRect:", 0.0, 0.0, 4224.0, 3024.0);
  uint64_t v99 = -[CIImage imageByCroppingToRect:](v7, "imageByCroppingToRect:", 0.0, 0.0, 4224.0, 3024.0);
  uint64_t v98 = -[CIImage imageByCroppingToRect:](v8, "imageByCroppingToRect:", 0.0, 0.0, 4224.0, 3024.0);
  v101 = [[CIRenderDestination alloc] initWithWidth:4224 height:3024 pixelFormat:70 commandBuffer:0 mtlTextureProvider:&__block_literal_global_21];
  if (v101)
  {
    uint64_t v111 = 0;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    uint64_t v10 = [&unk_1EE4AB858 countByEnumeratingWithState:&v107 objects:v117 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      unint64_t v12 = 0x1E576F000uLL;
      uint64_t v13 = *(void *)v108;
      v94 = self;
      uint64_t v90 = *(void *)v108;
      uint64_t v91 = v9;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v108 != v13) {
            objc_enumerationMutation(&unk_1EE4AB858);
          }
          uint64_t v93 = v14;
          id v15 = (id)objc_msgSend(objc_alloc(*(Class *)(v12 + 2912)), "initWithTuning:", (int)objc_msgSend(*(id *)(*((void *)&v107 + 1) + 8 * v14), "intValue"));
          v16 = +[CIFilter filterWithName:@"CIRedEyeRaw"];
          -[CIFilter setValuesForKeysWithDictionary:](v16, "setValuesForKeysWithDictionary:", [v15 repairTuning]);
          v115[0] = @"inputPrimary";
          v115[1] = @"inputSecondary";
          v116[0] = v102;
          v116[1] = v9;
          -[CIFilter setValuesForKeysWithDictionary:](v16, "setValuesForKeysWithDictionary:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:2]);
          v97 = v16;
          -[CIFilter setValue:forKey:](v16, "setValue:forKey:", objc_msgSend((id)objc_msgSend(v15, "sessionTuning"), "objectForKeyedSubscript:", @"kUseFaceSegmentationMask"), @"inputUseFaceSegmentationMask");
          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          uint64_t v96 = [&unk_1EE4AB870 countByEnumeratingWithState:&v103 objects:v114 count:16];
          if (v96)
          {
            uint64_t v95 = *(void *)v104;
            uint64_t v92 = v11;
LABEL_12:
            uint64_t v17 = 0;
            while (1)
            {
              if (*(void *)v104 != v95) {
                objc_enumerationMutation(&unk_1EE4AB870);
              }
              v18 = *(void **)(*((void *)&v103 + 1) + 8 * v17);
              [(CIImage *)v102 extent];
              double v20 = v19;
              [(CIImage *)v102 extent];
              double v22 = v21;
              [v18 floatValue];
              unint64_t v24 = (unint64_t)v23;
              unint64_t v25 = (unint64_t)(float)((float)(unint64_t)v23 * 0.7);
              *(float *)&double v22 = (double)(unint64_t)v22 * 0.6;
              v26 = +[CIVector vectorWithX:1.0 Y:0.0];
              v27 = +[CIVector vectorWithX:0.0 Y:1.0];
              double v28 = (double)(unint64_t)v20;
              double v29 = (double)v24 * 0.5;
              double v30 = *(float *)&v22;
              v31 = +[CIVector vectorWithX:-(v29 - v28 * 0.5) - (double)v24 Y:v30];
              v32 = +[CIVector vectorWithX:v29 + v28 * 0.5 Y:v30];
              CGFloat v33 = (double)v25;
              v34 = +[CIVector vectorWithX:(double)v24 Y:(double)v25];
              [(CIVector *)v31 X];
              double v36 = v35 + v29;
              [(CIVector *)v31 Y];
              v38 = +[CIVector vectorWithX:v36 Y:v37 + (double)v25 * 0.5];
              [(CIVector *)v32 X];
              double v40 = v39 + v29;
              [(CIVector *)v32 Y];
              v42 = +[CIVector vectorWithX:v40 Y:v41 + (double)v25 * 0.5];
              [(CIVector *)v31 X];
              CGFloat v44 = v43;
              [(CIVector *)v31 Y];
              CGFloat v46 = v45;
              [(CIVector *)v32 X];
              CGFloat v48 = v47;
              [(CIVector *)v32 Y];
              v123.origin.double y = v49;
              v119.origin.double x = v44;
              v119.origin.double y = v46;
              v119.size.double width = (double)v24;
              v119.size.double height = v33;
              v123.origin.double x = v48;
              v123.size.double width = (double)v24;
              v123.size.double height = v33;
              CGRect v120 = CGRectUnion(v119, v123);
              v50 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v120.origin.x, v120.origin.y, v120.size.width, v120.size.height);
              id v51 = (id)objc_opt_new();
              [v51 setImageOrientation:0];
              [v51 setSegmentationSkin:v100];
              [v51 setSegmentationSclera:v98];
              [v51 setSegmentationIris:v99];
              [v51 setFaceRect:v50];
              [v51 setFaceOrientation:0.0];
              v113[0] = v26;
              v113[1] = v27;
              objc_msgSend(v51, "setUvLeft:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v113, 2));
              v112[0] = v26;
              v112[1] = v27;
              objc_msgSend(v51, "setUvRight:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v112, 2));
              [v51 setRoiRenderOriginLeft:v31];
              [v51 setRoiRenderOriginRight:v32];
              [v51 setRoiRenderSize:v34];
              [v51 setPupilLeft:v38];
              [v51 setPupilRight:v42];
              [(CIDualRedEyeRepairSession *)v94 customizeRepairFilter:v97 forFace:v51];
              uint64_t v52 = [(CIFilter *)v97 outputImage];
              objc_msgSend((id)objc_msgSend(v51, "roiRenderOriginLeft"), "X");
              CGFloat v54 = v53;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderOriginLeft"), "Y");
              CGFloat v56 = v55;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderSize"), "X");
              CGFloat v58 = v57;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderSize"), "Y");
              CGFloat v60 = v59;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderOriginRight"), "X");
              CGFloat v62 = v61;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderOriginRight"), "Y");
              CGFloat v64 = v63;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderSize"), "X");
              CGFloat v66 = v65;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderSize"), "Y");
              v124.size.double height = v67;
              v121.origin.double x = v54;
              v121.origin.double y = v56;
              v121.size.double width = v58;
              v121.size.double height = v60;
              v124.origin.double x = v62;
              v124.origin.double y = v64;
              v124.size.double width = v66;
              CGRect v122 = CGRectUnion(v121, v124);
              double x = v122.origin.x;
              double y = v122.origin.y;
              double width = v122.size.width;
              double height = v122.size.height;
              if (![(CIDualRedEyeRepairSession *)v94 context])
              {
                int v3 = CI_LOG_DUALRED();
                if (v3)
                {
                  v80 = ci_logger_api();
                  int v3 = os_log_type_enabled(v80, OS_LOG_TYPE_ERROR);
                  if (v3)
                  {
                    [(CIDualRedEyeRepairSession *)v80 prewarm];
                    goto LABEL_31;
                  }
                }
                return v3;
              }
              -[CIContext prepareRender:fromRect:toDestination:atPoint:error:]([(CIDualRedEyeRepairSession *)v94 context], "prepareRender:fromRect:toDestination:atPoint:error:", v52, v101, &v111, x, y, width, height, x, y);
              if (v111) {
                break;
              }
              if (v96 == ++v17)
              {
                uint64_t v9 = v91;
                uint64_t v11 = v92;
                unint64_t v12 = 0x1E576F000;
                uint64_t v13 = v90;
                uint64_t v96 = [&unk_1EE4AB870 countByEnumeratingWithState:&v103 objects:v114 count:16];
                if (v96) {
                  goto LABEL_12;
                }
                goto LABEL_19;
              }
            }
            int v3 = CI_LOG_DUALRED();
            if (v3)
            {
              v88 = ci_logger_api();
              int v3 = os_log_type_enabled(v88, OS_LOG_TYPE_ERROR);
              if (v3)
              {
                -[CIDualRedEyeRepairSession prewarm]();
                goto LABEL_31;
              }
            }
            return v3;
          }
LABEL_19:
          uint64_t v14 = v93 + 1;
        }
        while (v93 + 1 != v11);
        uint64_t v11 = [&unk_1EE4AB858 countByEnumeratingWithState:&v107 objects:v117 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    goto LABEL_2;
  }
  int v3 = CI_LOG_DUALRED();
  if (v3)
  {
    v72 = ci_logger_api();
    int v3 = os_log_type_enabled(v72, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      [(CIDualRedEyeRepairSession *)v72 prewarm];
LABEL_31:
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

void __36__CIDualRedEyeRepairSession_prewarm__block_invoke()
{
}

- (BOOL)prepareRepair
{
  if (![(CIDualRedEyeRepairSession *)self context]) {
    [(CIDualRedEyeRepairSession *)self setContext:+[CIDualRedEyeRepairSession _contextRGBAh]];
  }
  return 1;
}

- (BOOL)prepareRepairWithTuningParametersByPortType:(id)a3
{
  [(CIDualRedEyeRepairSession *)self setTuningParametersByPortType:a3];

  return [(CIDualRedEyeRepairSession *)self prepareRepair];
}

- (BOOL)renderUsingPixelBuffers
{
  return self->_primary || self->_secondary || self->_output != 0;
}

- (BOOL)renderUsingProvidedCommandQueue
{
  return [(CIDualRedEyeRepairSession *)self commandQueue]
      || [(CIDualRedEyeRepairSession *)self primaryTexture]
      || [(CIDualRedEyeRepairSession *)self secondaryTexture]
      || [(CIDualRedEyeRepairSession *)self outputTexture] != 0;
}

- (void)dumpInputs
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136447234;
  OUTLINED_FUNCTION_5_1();
  _os_log_error_impl(&dword_193671000, v0, OS_LOG_TYPE_ERROR, "%{public}s pixelformat of primary image is %c%c%c%c", (uint8_t *)v1, 0x24u);
}

- (BOOL)validateRenderState
{
  BOOL v3 = [(CIDualRedEyeRepairSession *)self renderUsingPixelBuffers];
  BOOL v4 = [(CIDualRedEyeRepairSession *)self renderUsingProvidedCommandQueue];
  if (v4 && v3)
  {
    int v5 = CI_LOG_DUALRED();
    if (v5)
    {
      v6 = ci_logger_api();
      int v5 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        [(CIDualRedEyeRepairSession *)v6 validateRenderState];
LABEL_12:
        LOBYTE(v5) = 0;
      }
    }
  }
  else if (v4 || v3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = CI_LOG_DUALRED();
    if (v5)
    {
      uint64_t v14 = ci_logger_api();
      int v5 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        [(CIDualRedEyeRepairSession *)v14 validateRenderState];
        goto LABEL_12;
      }
    }
  }
  return v5;
}

- (int)validateSetPrimary
{
  if (![(CIDualRedEyeRepairSession *)self validateRenderState]) {
    return 3;
  }
  primardouble y = self->_primary;
  BOOL v4 = [(CIDualRedEyeRepairSession *)self renderUsingProvidedCommandQueue];
  if (primary && !self->_primary)
  {
    if (CI_LOG_DUALRED())
    {
      uint64_t v21 = ci_logger_api();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        [(CIDualRedEyeRepairSession *)v21 validateSetPrimary];
      }
    }
    return 3;
  }
  if (!v4)
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (!primary) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (![(CIDualRedEyeRepairSession *)self primaryTexture])
  {
    if (CI_LOG_DUALRED())
    {
      double v37 = ci_logger_api();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        [(CIDualRedEyeRepairSession *)v37 validateSetPrimary];
      }
    }
    return 3;
  }
  double Width = (double)(unint64_t)[(MTLTexture *)[(CIDualRedEyeRepairSession *)self primaryTexture] width];
  double Height = (double)(unint64_t)[(MTLTexture *)[(CIDualRedEyeRepairSession *)self primaryTexture] height];
  if (primary)
  {
LABEL_9:
    double Width = (double)CVPixelBufferGetWidth(self->_primary);
    double Height = (double)CVPixelBufferGetHeight(self->_primary);
  }
LABEL_10:
  if (Width > Height) {
    double Height = Width;
  }
  uint64_t v7 = (unint64_t)Height;
  if ((unint64_t)Height < (int)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", @"kMinPrimaryDimension"), "intValue"))
  {
    if (CI_LOG_DUALRED())
    {
      uint64_t v8 = ci_logger_api();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(CIDualRedEyeRepairSession *)v7 validateSetPrimary];
      }
    }
    return 3;
  }
  if (![(CIDualRedEyeRepairSession *)self observations]
    || ![(NSArray *)[(CIDualRedEyeRepairSession *)self observations] count])
  {
    if (CI_LOG_DUALRED())
    {
      double v29 = ci_logger_api();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        [(CIDualRedEyeRepairSession *)v29 validateSetPrimary];
      }
    }
    return 3;
  }
  if (![(CIDualRedEyeRepairSession *)self metadata])
  {
    if (CI_LOG_DUALRED())
    {
      double v45 = ci_logger_api();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        [(CIDualRedEyeRepairSession *)v45 validateSetPrimary];
      }
    }
    return 3;
  }
  char v15 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairSession metadata](self, "metadata"), "objectForKeyedSubscript:", @"WouldAutoFlashTurnOn"), "BOOLValue");
  if ([(NSDictionary *)[(CIDualRedEyeRepairSession *)self metadata] objectForKey:@"NormalizedSNR"])
  {
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairSession metadata](self, "metadata"), "objectForKeyedSubscript:", @"NormalizedSNR"), "floatValue");
    float v17 = v16;
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", @"kAutoFlashOverrideSNRThreshold"), "floatValue");
    if (v17 <= v18) {
      char v19 = 1;
    }
    else {
      char v19 = v15;
    }
    if (v19) {
      return 0;
    }
  }
  else if (v15)
  {
    return 0;
  }
  if (CI_LOG_DUALRED())
  {
    double v53 = ci_logger_api();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      [(CIDualRedEyeRepairSession *)v53 validateSetPrimary];
    }
  }
  return 2;
}

- (int)validateRepair
{
  if (![(CIDualRedEyeRepairSession *)self validateRenderState]) {
    return 3;
  }
  if ([(CIDualRedEyeRepairSession *)self faces]
    && [(NSArray *)[(CIDualRedEyeRepairSession *)self faces] count])
  {
    BOOL v3 = [(CIDualRedEyeRepairSession *)self renderUsingPixelBuffers];
    if (![(CIDualRedEyeRepairSession *)self renderUsingProvidedCommandQueue]
      || [(CIDualRedEyeRepairSession *)self primaryTexture]
      && [(CIDualRedEyeRepairSession *)self secondaryTexture]
      && [(CIDualRedEyeRepairSession *)self outputTexture])
    {
      if (!v3 || self->_primary && self->_secondary)
      {
        if ([(CIDualRedEyeRepairSession *)self context]) {
          return 0;
        }
        if (CI_LOG_DUALRED())
        {
          uint64_t v30 = ci_logger_api();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            [(CIDualRedEyeRepairSession *)v30 validateRepair];
          }
        }
      }
      else
      {
        if (CI_LOG_DUALRED())
        {
          uint64_t v21 = ci_logger_api();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[CIDualRedEyeRepairSession validateRepair].cold.4();
          }
        }
        if (!self->_primary)
        {
          if (self->_secondary)
          {
            if (CI_LOG_DUALRED())
            {
              uint64_t v22 = ci_logger_api();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                [(CIDualRedEyeRepairSession *)v22 validateRepair];
              }
            }
          }
        }
      }
    }
    else if (CI_LOG_DUALRED())
    {
      uint64_t v13 = ci_logger_api();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(CIDualRedEyeRepairSession *)v13 validateRepair];
      }
    }
    return 3;
  }
  if (CI_LOG_DUALRED())
  {
    int v5 = ci_logger_api();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(CIDualRedEyeRepairSession *)v5 validateRepair];
    }
  }
  return 1;
}

- (id)redEyeFaceFromObservation:(id)a3 exifOrientation:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v290 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[a3 landmarks];
  if (!v7)
  {
    if (CI_LOG_DUALRED())
    {
      uint64_t v29 = ci_logger_api();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:](v29, v30, v31, v32, v33, v34, v35, v36);
      }
    }
    return 0;
  }
  uint64_t v8 = v7;
  if (![v7 leftEye] || !objc_msgSend(v8, "rightEye"))
  {
    if (CI_LOG_DUALRED())
    {
      uint64_t v21 = ci_logger_api();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:](v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    return 0;
  }
  [a3 boundingBox];
  CIVNRectInOrientedImage([(CIDualRedEyeRepairSession *)self primaryImage], v9, v10, v11, v12);
  CGRect v292 = CGRectIntegral(v291);
  uint64_t v13 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v292.origin.x, v292.origin.y, v292.size.width, v292.size.height);
  id v14 = CIVNLandmarkInOrientedImage((void *)[v8 leftEye], -[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"));
  id v15 = CIVNLandmarkInOrientedImage((void *)[v8 rightEye], -[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"));
  if (CI_LOG_DUALRED())
  {
    if (CI_LOG_DUALRED())
    {
      uint64_t v16 = ci_logger_api();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]2();
      }
    }
    if (CI_LOG_DUALRED())
    {
      uint64_t v17 = ci_logger_api();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]1();
      }
    }
    if (CI_LOG_DUALRED())
    {
      uint64_t v18 = ci_logger_api();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]0(self, v18);
      }
    }
  }
  if ([v14 count] == 8)
  {
    uint64_t v19 = axesForEyePointsV2(v14);
    uint64_t v20 = axesForEyePointsV2(v15);
  }
  else
  {
    if ([v14 count] != 6)
    {
      if (CI_LOG_DUALRED())
      {
        v68 = ci_logger_api();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
          -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]9(v14);
        }
      }
      return 0;
    }
    uint64_t v19 = axesForEyePointsV3(v14);
    uint64_t v20 = axesForEyePointsV3(v15);
  }
  uint64_t v39 = v20;
  if (!v19 || !v20)
  {
    if (CI_LOG_DUALRED())
    {
      uint64_t v60 = ci_logger_api();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]8(v60, v61, v62, v63, v64, v65, v66, v67);
      }
    }
    return 0;
  }
  objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", 1), "_norm");
  float v41 = v40;
  objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", 0), "_norm");
  float v43 = v41 / v42;
  objc_msgSend((id)objc_msgSend(v39, "objectAtIndexedSubscript:", 1), "_norm");
  float v45 = v44;
  objc_msgSend((id)objc_msgSend(v39, "objectAtIndexedSubscript:", 0), "_norm");
  float v47 = v45 / v46;
  if (v43 >= v47) {
    float v48 = v47;
  }
  else {
    float v48 = v43;
  }
  float v49 = areaForAxes((void *)[v19 objectAtIndexedSubscript:0], objc_msgSend(v19, "objectAtIndexedSubscript:", 1));
  float v50 = areaForAxes((void *)[v39 objectAtIndexedSubscript:0], objc_msgSend(v39, "objectAtIndexedSubscript:", 1));
  if (v49 <= v50) {
    float v49 = v50;
  }
  [v8 confidence];
  float v52 = v51;
  [a3 faceJunkinessIndex];
  float v54 = v53;
  [a3 faceOrientationIndex];
  int v56 = v55;
  if (CI_LOG_DUALRED())
  {
    uint64_t v57 = ci_logger_api();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136447234;
      *(void *)&buf[4] = "-[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v52;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = v54;
      *(_WORD *)v289 = 2048;
      *(double *)&v289[2] = v48;
      *(_WORD *)&v289[10] = 2048;
      *(double *)&v289[12] = v49;
      _os_log_error_impl(&dword_193671000, v57, OS_LOG_TYPE_ERROR, "%{public}s Confidence=%.3f | junk=%.3f | Anisotropy=%.3f | area=%.0f", buf, 0x34u);
    }
  }
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", @"kMinLandmarkConfidenceThreshold"), "floatValue");
  if (v52 >= v58)
  {
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", @"kMaxFaceJunkinessThreshold"), "floatValue");
    if (v54 <= v69)
    {
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", @"kMinIsotropy"), "floatValue");
      if (v48 >= v71)
      {
        objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", @"kMinLandmarkArea"), "floatValue");
        if (v49 >= v73)
        {
          int v274 = v56;
          float v275 = v54;
          float v276 = v49;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", @"kSessionTuningOutsetROILong"), "floatValue");
          v287[0] = v75;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", @"kSessionTuningOutsetROIShort"), "floatValue");
          v287[1] = v76;
          repairROIforEyePoints(v14, v19, v287);
          double v78 = v77;
          double v80 = v79;
          double v82 = v81;
          double v84 = v83;
          repairROIforEyePoints(v15, v39, v287);
          double v277 = v88;
          double v279 = v87;
          double v89 = v85;
          double v90 = v86;
          if (v82 <= v85) {
            double v91 = v85;
          }
          else {
            double v91 = v82;
          }
          if (v84 <= v86) {
            double v92 = v86;
          }
          else {
            double v92 = v84;
          }
          double v93 = expandFromCenter(v78, v80, v82, v84, v91, v92);
          double v281 = v94;
          double v282 = v93;
          double v96 = v95;
          double v98 = v97;
          double v99 = expandFromCenter(v279, v277, v89, v90, v91, v92);
          double v101 = v100;
          double v103 = v102;
          double v105 = v104;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", @"kRegionOutset"), "floatValue");
          double v107 = (float)(v106 + 1.0);
          if (v96 <= v103) {
            double v108 = v103;
          }
          else {
            double v108 = v96;
          }
          double v109 = v108 * v107;
          if (v98 <= v105) {
            double v110 = v105;
          }
          else {
            double v110 = v98;
          }
          double v111 = v110 * v107;
          CGFloat v269 = v96;
          CGFloat v271 = v98;
          double v112 = expandFromCenter(v282, v281, v96, v98, v109, v110 * v107);
          double v278 = v113;
          double v280 = v112;
          double v115 = v114;
          double v117 = v116;
          CGFloat v272 = v99;
          CGFloat r2 = v101;
          CGFloat v270 = v103;
          double v118 = v103;
          CGFloat v119 = v105;
          double v120 = expandFromCenter(v99, v101, v118, v105, v109, v111);
          if (v115 != v123 || v117 != v122)
          {
            if (CI_LOG_DUALRED())
            {
              v147 = ci_logger_api();
              if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR)) {
                -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]7(v147, v148, v149, v150, v151, v152, v153, v154);
              }
            }
            return 0;
          }
          double v124 = v120;
          double v125 = v121;
          int v126 = objc_msgSend(-[NSDictionary objectForKey:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKey:", @"kForceFaceSegmentationPupils"), "BOOLValue");
          char v127 = objc_msgSend(-[NSDictionary objectForKey:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKey:", @"kUseFaceSegmentationMask"), "BOOLValue");
          int v128 = objc_msgSend(-[NSDictionary objectForKey:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKey:", @"kUseFaceSegmentation"), "BOOLValue");
          if ((v126 & 1) != 0 || (v127 & 1) != 0 || v128)
          {
            if (![a3 faceSegments])
            {
              if (CI_LOG_DUALRED())
              {
                v207 = ci_logger_api();
                if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR)) {
                  -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.7(v207, v208, v209, v210, v211, v212, v213, v214);
                }
              }
              return 0;
            }
            v155 = probabilitiesForSegment((void *)[a3 faceSegments], 482, v4);
            if (!v155)
            {
              if (CI_LOG_DUALRED())
              {
                v230 = ci_logger_api();
                if (os_log_type_enabled(v230, OS_LOG_TYPE_ERROR)) {
                  -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.8(v230, v231, v232, v233, v234, v235, v236, v237);
                }
              }
              return 0;
            }
            v156 = v155;
            uint64_t v157 = [v155 count];
            int v158 = CI_LOG_DUALRED();
            if (v157 != 5)
            {
              if (v158)
              {
                v238 = ci_logger_api();
                if (os_log_type_enabled(v238, OS_LOG_TYPE_ERROR)) {
                  -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]6(v156);
                }
              }
              return 0;
            }
            int v260 = v126;
            double v252 = v125;
            double v255 = v117;
            if (v158)
            {
              v159 = ci_logger_api();
              if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR)) {
                -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]5(v159, v160, v161, v162, v163, v164, v165, v166);
              }
            }
            v262 = (void *)[v156 objectAtIndexedSubscript:0];
            v268 = (void *)[v156 objectAtIndexedSubscript:1];
            v167 = (void *)[v156 objectAtIndexedSubscript:2];
            v168 = (void *)[v156 objectAtIndexedSubscript:3];
            v169 = (void *)[v156 objectAtIndexedSubscript:4];
            uint64_t v265 = (uint64_t)v167;
            v258 = (void *)RRmaximumRh(v268, v167);
            v248 = v169;
            v250 = v168;
            v170 = (void *)RRmaximumRh(v168, v169);
            objc_msgSend((id)objc_msgSend(a3, "faceSegments"), "boundingBox");
            CIVNRectInOrientedImage([(CIDualRedEyeRepairSession *)self primaryImage], v171, v172, v173, v174);
            CGFloat v176 = v175;
            CGFloat v178 = v177;
            double v180 = v179;
            double v182 = v181;
            [v262 extent];
            if (vabdd_f64(256.0, v183) > 0.00001 || ([v262 extent], vabdd_f64(256.0, v184) > 0.00001))
            {
              if (CI_LOG_DUALRED())
              {
                v185 = ci_logger_api();
                if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR)) {
                  -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.9(v262, v185);
                }
              }
              return 0;
            }
            *(_OWORD *)v289 = 0u;
            memset(buf, 0, sizeof(buf));
            CGAffineTransformMakeScale((CGAffineTransform *)buf, v180 * 0.00390625, v182 * 0.00390625);
            memset(&v286, 0, sizeof(v286));
            CGAffineTransformMakeTranslation(&v286, v176, v178);
            *(_OWORD *)&t1.a = *(_OWORD *)buf;
            *(_OWORD *)&t1.c = *(_OWORD *)&buf[16];
            *(_OWORD *)&t1.tdouble x = *(_OWORD *)v289;
            memset(&v285, 0, sizeof(v285));
            CGAffineTransform t2 = v286;
            CGAffineTransformConcat(&v285, &t1, &t2);
            CGAffineTransform t1 = v285;
            uint64_t v129 = [v262 imageByApplyingTransform:&t1];
            CGAffineTransform t1 = v285;
            uint64_t v130 = [v258 imageByApplyingTransform:&t1];
            CGAffineTransform t1 = v285;
            uint64_t v131 = [v170 imageByApplyingTransform:&t1];
            double v125 = v252;
            double v117 = v255;
            uint64_t v133 = v265;
            uint64_t v132 = (uint64_t)v268;
            int v126 = v260;
            v135 = v248;
            v134 = v250;
          }
          else
          {
            uint64_t v129 = 0;
            uint64_t v130 = 0;
            uint64_t v131 = 0;
            uint64_t v132 = 0;
            uint64_t v133 = 0;
            v134 = 0;
            v135 = 0;
          }
          uint64_t v259 = v130;
          uint64_t v261 = v129;
          uint64_t v257 = v131;
          if (v126)
          {
            uint64_t v263 = v133;
            uint64_t v266 = v132;
            v247 = v135;
            v249 = v134;
            double v136 = constellationRectInSegmentationRect(-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), (void *)[v8 rightEye], objc_msgSend(a3, "faceSegments"), 0x100uLL);
            CGFloat rect_16 = v138;
            CGFloat rect_24 = v137;
            CGFloat rect_8 = v139;
            double rect = constellationRectInSegmentationRect(-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), (void *)[v8 leftEye], objc_msgSend(a3, "faceSegments"), 0x100uLL);
            double v251 = v125;
            CGFloat v141 = v140;
            CGFloat v143 = v142;
            CGFloat v145 = v144;
            v293.origin.double x = v136;
            v293.size.double width = rect_16;
            v293.origin.double y = rect_24;
            v293.size.double height = rect_8;
            CGRect v294 = CGRectInset(v293, -12.8000002, -12.8000002);
            CGRectIntegral(v294);
            v295.origin.double x = rect;
            v295.origin.double y = v141;
            v295.size.double width = v143;
            v295.size.double height = v145;
            CGRect v296 = CGRectInset(v295, -12.8000002, -12.8000002);
            CGRectIntegral(v296);
            double v125 = v251;
            v146 = (void *)semanticPupils([(CIDualRedEyeRepairSession *)self primaryImage], a3, v4, v249, v247, v266, v263);
            uint64_t v267 = [v146 objectAtIndexedSubscript:0];
            uint64_t v264 = [v146 objectAtIndexedSubscript:1];
          }
          else
          {
            uint64_t v264 = 0;
            uint64_t v267 = 0;
          }
          v186 = orientedPupilFromLandmarks([(CIDualRedEyeRepairSession *)self primaryImage], v8, 0);
          v187 = orientedPupilFromLandmarks([(CIDualRedEyeRepairSession *)self primaryImage], v8, 1);
          if ((v126 & 1) == 0)
          {
            v188 = v187;
            if (CI_LOG_DUALRED())
            {
              v189 = ci_logger_api();
              if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR)) {
                -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]4(v189, v190, v191, v192, v193, v194, v195, v196);
              }
            }
            uint64_t v264 = (uint64_t)v188;
            uint64_t v267 = (uint64_t)v186;
          }
          objc_msgSend(-[NSDictionary objectForKey:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKey:", @"kMinLaplacianVariance"), "floatValue");
          if (v197 <= 0.0001
            || [(CIDualRedEyeRepairSession *)self renderUsingProvidedCommandQueue])
          {
            unint64_t v198 = 0x1E576F000;
            if (CI_LOG_DUALRED())
            {
              v199 = ci_logger_api();
              if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR)) {
                -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]0(v199, v200, v201, v202, v203, v204, v205, v206);
              }
            }
          }
          else
          {
            double v253 = v125;
            double v254 = v124;
            double v256 = v117;
            v297.origin.double y = v281;
            v297.origin.double x = v282;
            v297.size.double width = v269;
            v300.size.double width = v270;
            v297.size.double height = v271;
            v300.origin.double x = v272;
            v300.origin.double y = r2;
            v300.size.double height = v119;
            CGRect v298 = CGRectUnion(v297, v300);
            CGRect v299 = CGRectIntegral(v298);
            double x = v299.origin.x;
            double y = v299.origin.y;
            double width = v299.size.width;
            double height = v299.size.height;
            CFAbsoluteTimeGetCurrent();
            LODWORD(v219) = focusStatsForRegion(x, y, width, height, (uint64_t)self->_primary, [(CIDualRedEyeRepairSession *)self context], [(CIDualRedEyeRepairSession *)self primaryImage]);
            uint64_t v221 = v220;
            float v222 = v219;
            CFAbsoluteTimeGetCurrent();
            unint64_t v198 = 0x1E576F000uLL;
            if (CI_LOG_DUALRED())
            {
              v223 = ci_logger_api();
              if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR)) {
                [(CIDualRedEyeRepairSession *)v221 redEyeFaceFromObservation:v224 exifOrientation:v222];
              }
            }
            double v124 = v254;
            double v117 = v256;
            double v125 = v253;
            if (CI_LOG_DUALRED())
            {
              v225 = ci_logger_api();
              if (os_log_type_enabled(v225, OS_LOG_TYPE_ERROR)) {
                -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]2();
              }
            }
            objc_msgSend(-[NSDictionary objectForKey:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKey:", @"kMinLaplacianVariance"), "floatValue");
            if (v226 > v222)
            {
              float v239 = v226;
              if (CI_LOG_DUALRED())
              {
                v240 = ci_logger_api();
                if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR)) {
                  -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]1(v240, v222, v239, v241, v242);
                }
              }
              return 0;
            }
          }
          id v37 = (id)objc_opt_new();
          [v37 setImageOrientation:v4];
          [v37 setLandmarks:v8];
          [v37 setObservation:a3];
          [v37 setSegmentationSkin:v261];
          [v37 setSegmentationSclera:v259];
          [v37 setSegmentationIris:v257];
          [v37 setFaceRect:v13];
          *(float *)&double v227 = v275;
          [v37 setJunkiness:v227];
          LODWORD(v228) = v274;
          [v37 setFaceOrientation:v228];
          *(float *)&double v229 = v276;
          [v37 setAreaMax:v229];
          [v37 setUvLeft:v19];
          [v37 setUvRight:v39];
          objc_msgSend(v37, "setRoiRenderOriginLeft:", objc_msgSend(*(id *)(v198 + 3088), "vectorWithCGPoint:", v280, v278));
          objc_msgSend(v37, "setRoiRenderOriginRight:", objc_msgSend(*(id *)(v198 + 3088), "vectorWithCGPoint:", v124, v125));
          objc_msgSend(v37, "setRoiRenderSize:", objc_msgSend(*(id *)(v198 + 3088), "vectorWithX:Y:", v115, v117));
          [v37 setPupilLeft:v267];
          [v37 setPupilRight:v264];
          return v37;
        }
        if (CI_LOG_DUALRED())
        {
          uint64_t v74 = ci_logger_api();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
            -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.6(v49);
          }
        }
      }
      else if (CI_LOG_DUALRED())
      {
        v72 = ci_logger_api();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
          -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.5(v48);
        }
      }
    }
    else if (CI_LOG_DUALRED())
    {
      v70 = ci_logger_api();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.4(v54);
      }
    }
  }
  else if (CI_LOG_DUALRED())
  {
    uint64_t v59 = ci_logger_api();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:](v52);
    }
  }
  return 0;
}

- (void)customizeRepairFilter:(id)a3 forFace:(id)a4
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v13[0] = @"inputOriginLeft";
  objc_msgSend((id)objc_msgSend(a4, "roiRenderOriginLeft"), "X");
  double v7 = v6;
  objc_msgSend((id)objc_msgSend(a4, "roiRenderOriginLeft"), "Y");
  v14[0] = +[CIVector vectorWithX:v7 Y:v8];
  v13[1] = @"inputOriginRight";
  objc_msgSend((id)objc_msgSend(a4, "roiRenderOriginRight"), "X");
  double v10 = v9;
  objc_msgSend((id)objc_msgSend(a4, "roiRenderOriginRight"), "Y");
  v14[1] = +[CIVector vectorWithX:v10 Y:v11];
  v13[2] = @"inputSize";
  v14[2] = [a4 roiRenderSize];
  v13[3] = @"inputOrientationHint";
  CGFloat v12 = NSNumber;
  [a4 faceOrientation];
  v14[3] = objc_msgSend(v12, "numberWithFloat:");
  v13[4] = @"inputAxisLongLeft";
  v14[4] = objc_msgSend((id)objc_msgSend(a4, "uvLeft"), "objectAtIndexedSubscript:", 0);
  v13[5] = @"inputAxisLongRight";
  v14[5] = objc_msgSend((id)objc_msgSend(a4, "uvRight"), "objectAtIndexedSubscript:", 0);
  v13[6] = @"inputAxisShortLeft";
  v14[6] = objc_msgSend((id)objc_msgSend(a4, "uvLeft"), "objectAtIndexedSubscript:", 1);
  v13[7] = @"inputAxisShortRight";
  v14[7] = objc_msgSend((id)objc_msgSend(a4, "uvRight"), "objectAtIndexedSubscript:", 1);
  v13[8] = @"inputPupilCenterLeft";
  v14[8] = [a4 pupilLeft];
  v13[9] = @"inputPupilCenterRight";
  v14[9] = [a4 pupilRight];
  objc_msgSend(a3, "setValuesForKeysWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, v13, 10));
  if ([a4 segmentationSkin]) {
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(a4, "segmentationSkin"), @"inputSkinMask");
  }
  if ([a4 segmentationSclera]) {
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(a4, "segmentationSclera"), @"inputScleraMask");
  }
  if ([a4 segmentationSkin]) {
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(a4, "segmentationIris"), @"inputIrisMask");
  }
}

- (BOOL)repairFace:(id)a3 filter:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a3, "roiRenderOriginLeft"), "X");
  double v8 = v7;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderOriginLeft"), "Y");
  double v10 = v9;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderSize"), "X");
  double v12 = v11;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderSize"), "Y");
  double v14 = v13;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderOriginRight"), "X");
  CGFloat v16 = v15;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderOriginRight"), "Y");
  CGFloat v18 = v17;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderSize"), "X");
  CGFloat v20 = v19;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderSize"), "Y");
  v69.size.CGFloat height = v21;
  v65.origin.CGFloat x = v8;
  v65.origin.CGFloat y = v10;
  v65.size.CGFloat width = v12;
  v65.size.CGFloat height = v14;
  CGFloat v51 = v18;
  CGFloat v53 = v16;
  v69.origin.CGFloat x = v16;
  v69.origin.CGFloat y = v18;
  CGFloat height = v69.size.height;
  CGFloat v49 = v20;
  v69.size.CGFloat width = v20;
  CGRect v66 = CGRectIntersection(v65, v69);
  CGFloat x = v66.origin.x;
  CGFloat y = v66.origin.y;
  CGFloat width = v66.size.width;
  CGFloat v25 = v66.size.height;
  if (CI_LOG_DUALRED())
  {
    uint64_t v26 = ci_logger_api();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136447234;
      *(void *)&buf[4] = "-[CIDualRedEyeRepairSession repairFace:filter:]";
      __int16 v56 = 2048;
      CGFloat v57 = x;
      __int16 v58 = 2048;
      CGFloat v59 = y;
      __int16 v60 = 2048;
      CGFloat v61 = width;
      __int16 v62 = 2048;
      CGFloat v63 = v25;
      _os_log_error_impl(&dword_193671000, v26, OS_LOG_TYPE_ERROR, "%{public}s Intersection: %f,%f,%f,%f", buf, 0x34u);
    }
  }
  -[CIDualRedEyeRepairSession customizeRepairFilter:forFace:](self, "customizeRepairFilter:forFace:", a4, a3, *(void *)&height, *(void *)&v49, *(void *)&v51, *(void *)&v53);
  CFAbsoluteTimeGetCurrent();
  uint64_t v27 = (void *)[a4 outputImage];
  if (CI_LOG_DUALRED())
  {
    uint64_t v28 = ci_logger_api();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairSession repairFace:filter:].cold.9();
    }
  }
  *(void *)buf = 0;
  int v29 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", @"kRenderFullRect"), "BOOLValue");
  double Current = CFAbsoluteTimeGetCurrent();
  if (v29)
  {
    v67.origin.CGFloat x = v8;
    v67.origin.CGFloat y = v10;
    v67.size.CGFloat width = v12;
    v67.size.CGFloat height = v14;
    v70.origin.CGFloat y = v52;
    v70.origin.CGFloat x = v54;
    v70.size.CGFloat height = v48;
    v70.size.CGFloat width = v50;
    CGRect v68 = CGRectUnion(v67, v70);
    uint64_t v31 = -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self->context, "startTaskToRender:fromRect:toDestination:atPoint:error:", objc_msgSend(v27, "imageByCompositingOverImage:", -[CIImage imageByInsertingIntermediate:](-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), "imageByInsertingIntermediate:", 0)), -[CIDualRedEyeRepairSession destination](self, "destination"), buf, v68.origin.x, v68.origin.y, v68.size.width, v68.size.height, v68.origin.x, v68.origin.y);
    if (*(void *)buf)
    {
      int v32 = CI_LOG_DUALRED();
      if (v32)
      {
        uint64_t v33 = ci_logger_api();
        int v32 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
        if (v32)
        {
          -[CIDualRedEyeRepairSession repairFace:filter:].cold.4();
LABEL_38:
          LOBYTE(v32) = 0;
          return v32;
        }
      }
      return v32;
    }
    id v37 = v31;
    if ([(CIDualRedEyeRepairSession *)self renderUsingProvidedCommandQueue])
    {
      [(MTLCommandBuffer *)[(CIDualRedEyeRepairSession *)self commandBuffer] commit];
      uint64_t v38 = 0;
    }
    else
    {
      uint64_t v38 = [(CIRenderTask *)v37 waitUntilCompletedAndReturnError:buf];
    }
    uint64_t v40 = *(void *)buf;
    int v32 = CI_LOG_DUALRED();
    if (v40)
    {
      if (v32)
      {
        float v41 = ci_logger_api();
        int v32 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
        if (v32)
        {
          -[CIDualRedEyeRepairSession repairFace:filter:]();
          goto LABEL_38;
        }
      }
      return v32;
    }
    if (v32)
    {
      float v44 = ci_logger_api();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        -[CIDualRedEyeRepairSession repairFace:filter:]();
        if (v38) {
          goto LABEL_42;
        }
        goto LABEL_45;
      }
    }
LABEL_41:
    if (v38)
    {
LABEL_42:
      if (CI_LOG_DUALRED())
      {
        float v45 = ci_logger_api();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          -[CIDualRedEyeRepairSession repairFace:filter:](v38, v45);
        }
      }
    }
LABEL_45:
    LOBYTE(v32) = 1;
    return v32;
  }
  uint64_t v34 = -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self->context, "startTaskToRender:fromRect:toDestination:atPoint:error:", v27, [(CIDualRedEyeRepairSession *)self destination], buf, v8, v10, v12, v14, v8, v10);
  if (![(CIDualRedEyeRepairSession *)self renderUsingProvidedCommandQueue]) {
    [(CIRenderTask *)v34 waitUntilCompletedAndReturnError:buf];
  }
  if (CI_LOG_DUALRED())
  {
    uint64_t v35 = ci_logger_api();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairSession repairFace:filter:].cold.8();
    }
  }
  if (!*(void *)buf)
  {
    uint64_t v39 = -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self->context, "startTaskToRender:fromRect:toDestination:atPoint:error:", v27, [(CIDualRedEyeRepairSession *)self destination], buf, v54, v52, v50, v48, v54, v52);
    if ([(CIDualRedEyeRepairSession *)self renderUsingProvidedCommandQueue])
    {
      [(MTLCommandBuffer *)[(CIDualRedEyeRepairSession *)self commandBuffer] commit];
      uint64_t v38 = 0;
    }
    else
    {
      uint64_t v38 = [(CIRenderTask *)v39 waitUntilCompletedAndReturnError:buf];
    }
    if (CI_LOG_DUALRED())
    {
      float v42 = ci_logger_api();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[CIDualRedEyeRepairSession repairFace:filter:].cold.6();
      }
    }
    if (*(void *)buf)
    {
      int v32 = CI_LOG_DUALRED();
      if (v32)
      {
        float v43 = ci_logger_api();
        int v32 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
        if (v32)
        {
          -[CIDualRedEyeRepairSession repairFace:filter:].cold.5();
          goto LABEL_38;
        }
      }
      return v32;
    }
    goto LABEL_41;
  }
  int v32 = CI_LOG_DUALRED();
  if (v32)
  {
    uint64_t v36 = ci_logger_api();
    int v32 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      -[CIDualRedEyeRepairSession repairFace:filter:].cold.7();
      goto LABEL_38;
    }
  }
  return v32;
}

- (BOOL)setPrimary:(__CVBuffer *)a3 observations:(id)a4 metadata:(id)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  CFAbsoluteTimeGetCurrent();
  uint64_t v70 = 0;
  float v71 = &v70;
  uint64_t v72 = 0x2020000000;
  int v73 = 0;
  int v73 = 2 * [a4 count];
  double v9 = ci_signpost_log_dualredeye();
  if ((unint64_t)&self->super.isa + 1 >= 2)
  {
    double v10 = v9;
    if (os_signpost_enabled(v9))
    {
      int v11 = *((_DWORD *)v71 + 6);
      *(_DWORD *)buf = 67109120;
      LODWORD(v77) = v11;
      _os_signpost_emit_with_name_impl(&dword_193671000, v10, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "setPrimary", "eyeCount:%d", buf, 8u);
    }
  }
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  double v12 = v69;
  v69[0] = __62__CIDualRedEyeRepairSession_setPrimary_observations_metadata___block_invoke;
  v69[1] = &unk_1E5771090;
  v69[2] = &v70;
  v69[3] = self;
  if (CI_LOG_DUALRED())
  {
    double v13 = ci_logger_api();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.9([a4 count], v90, v13);
    }
  }
  if (CI_LOG_DUALRED())
  {
    double v14 = ci_logger_api();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.8();
    }
  }
  [(CIDualRedEyeRepairSession *)self cleanupState];
  -[CIDualRedEyeRepairSession setTimestamp:](self, "setTimestamp:", [MEMORY[0x1E4F1C9C8] date]);
  [(CIDualRedEyeRepairSession *)self setMetadata:a5];
  [(CIDualRedEyeRepairSession *)self setObservations:a4];
  self->_primarCGFloat y = a3;
  [(CIDualRedEyeRepairTuning *)[(CIDualRedEyeRepairSession *)self tuning] setTuningParametersByPortType:[(CIDualRedEyeRepairSession *)self tuningParametersByPortType] withCameraMetadata:a5];
  if (CI_LOG_DUALRED())
  {
    double v15 = ci_logger_api();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.7((uint64_t)[(CIDualRedEyeRepairTuning *)[(CIDualRedEyeRepairSession *)self tuning] sessionTuning], v89);
    }
  }
  if (CI_LOG_DUALRED())
  {
    CGFloat v16 = ci_logger_api();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.6((uint64_t)[(CIDualRedEyeRepairTuning *)[(CIDualRedEyeRepairSession *)self tuning] repairTuning], v88);
    }
  }
  [(CIDualRedEyeRepairSession *)self setImageProperties:0];
  if (a5 && [a5 objectForKeyedSubscript:@"ExifOrientation"])
  {
    double v17 = (void *)[a5 objectForKeyedSubscript:@"ExifOrientation"];
    double v86 = @"CIImageProperties";
    uint64_t v84 = *MEMORY[0x1E4F2FCA0];
    double v85 = v17;
    uint64_t v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
    -[CIDualRedEyeRepairSession setImageProperties:](self, "setImageProperties:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1]);
  }
  else
  {
    double v17 = &unk_1EE4AA790;
  }
  if ([(CIDualRedEyeRepairSession *)self renderUsingProvidedCommandQueue])
  {
    CGFloat v18 = +[CIImage imageWithMTLTexture:[(CIDualRedEyeRepairSession *)self secondaryTexture] options:[(CIDualRedEyeRepairSession *)self imageProperties]];
  }
  else
  {
    if (![(CIDualRedEyeRepairSession *)self renderUsingPixelBuffers]) {
      goto LABEL_25;
    }
    CGFloat v18 = +[CIImage imageWithCVPixelBuffer:self->_primary options:[(CIDualRedEyeRepairSession *)self imageProperties]];
  }
  [(CIDualRedEyeRepairSession *)self setPrimaryImage:v18];
LABEL_25:
  if (CI_LOG_DUALRED())
  {
    [(CIDualRedEyeRepairSession *)self dumpInputs];
    if ([(CIDualRedEyeRepairSession *)self primaryImage])
    {
      id v19 = [(CIImage *)[(CIDualRedEyeRepairSession *)self primaryImage] properties]
          ? [(NSDictionary *)[(CIImage *)[(CIDualRedEyeRepairSession *)self primaryImage] properties] objectForKey:@"Orientation"]: &unk_1EE4AA790;
      if (CI_LOG_DUALRED())
      {
        CGFloat v20 = ci_logger_api();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int v62 = [v19 intValue];
          [(CIImage *)[(CIDualRedEyeRepairSession *)self primaryImage] extent];
          uint64_t v64 = v63;
          [(CIImage *)[(CIDualRedEyeRepairSession *)self primaryImage] extent];
          *(_DWORD *)buf = 136446978;
          double v77 = "-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]";
          __int16 v78 = 1024;
          *(_DWORD *)double v79 = v62;
          *(_WORD *)&v79[4] = 2048;
          *(void *)&v79[6] = v64;
          *(_WORD *)&v79[14] = 2048;
          *(void *)&v79[16] = v65;
          _os_log_error_impl(&dword_193671000, v20, OS_LOG_TYPE_ERROR, "%{public}s Landmarks computed from orientation %d and size %f, %f", buf, 0x26u);
        }
      }
    }
  }
  if ([(CIDualRedEyeRepairSession *)self validateSetPrimary])
  {
    if (CI_LOG_DUALRED())
    {
      CGFloat v21 = ci_logger_api();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.5(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
LABEL_37:
    [(CIDualRedEyeRepairSession *)self cleanupState];
    BOOL v29 = 0;
    goto LABEL_64;
  }
  uint64_t v30 = (void *)[MEMORY[0x1E4F1CA48] array];
  for (unint64_t i = 0; [a4 count] > i; ++i)
  {
    if (CI_LOG_DUALRED())
    {
      int v32 = ci_logger_api();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        int v37 = [a4 count];
        *(_DWORD *)buf = 136446722;
        double v77 = "-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]";
        __int16 v78 = 1024;
        *(_DWORD *)double v79 = i + 1;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = v37;
        _os_log_error_impl(&dword_193671000, v32, OS_LOG_TYPE_ERROR, "%{public}s Processing face observation %d / %d", buf, 0x18u);
      }
    }
    uint64_t v33 = [a4 objectAtIndexedSubscript:i];
    if ((int)CI_LOG_DUALRED() >= 2) {
      [(CIDualRedEyeRepairSession *)self dumpObservation:v33 index:i];
    }
    id v34 = -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:](self, "redEyeFaceFromObservation:exifOrientation:", v33, [v17 intValue]);
    if (v34)
    {
      if (CI_LOG_DUALRED())
      {
        uint64_t v35 = ci_logger_api();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          CGRect v67 = v12;
          uint64_t v66 = [v34 roiRenderSize];
          uint64_t v38 = [v34 roiRenderOriginLeft];
          uint64_t v39 = [v34 uvLeft];
          uint64_t v40 = [v34 roiRenderOriginRight];
          uint64_t v41 = [v34 uvRight];
          *(_DWORD *)buf = 136447490;
          double v77 = "-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]";
          __int16 v78 = 2112;
          *(void *)double v79 = v66;
          *(_WORD *)&v79[8] = 2112;
          *(void *)&v79[10] = v38;
          *(_WORD *)&v79[18] = 2112;
          *(void *)&v79[20] = v39;
          __int16 v80 = 2112;
          uint64_t v81 = v40;
          __int16 v82 = 2112;
          uint64_t v83 = v41;
          _os_log_error_impl(&dword_193671000, v35, OS_LOG_TYPE_ERROR, "%{public}s Good face: size %@ | left %@ axes %@ | right %@ axes %@ ", buf, 0x3Eu);
          double v12 = v67;
        }
      }
      [v30 addObject:v34];
    }
    else if (CI_LOG_DUALRED())
    {
      uint64_t v36 = ci_logger_api();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[CIDualRedEyeRepairSession setPrimary:observations:metadata:](v74, &v75, v36);
      }
    }
  }
  if (![v30 count])
  {
    if (CI_LOG_DUALRED())
    {
      double v54 = ci_logger_api();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        -[CIDualRedEyeRepairSession setPrimary:observations:metadata:](v54, v55, v56, v57, v58, v59, v60, v61);
      }
    }
    goto LABEL_37;
  }
  unint64_t v42 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", @"kMaxFaceCount"), "unsignedIntegerValue");
  if ([v30 count] > v42)
  {
    [v30 sortUsingComparator:&__block_literal_global_262];
    uint64_t v30 = objc_msgSend(v30, "subarrayWithRange:", 0, v42);
  }
  [(CIDualRedEyeRepairSession *)self setFaces:v30];
  CFAbsoluteTimeGetCurrent();
  if (CI_LOG_DUALRED())
  {
    float v43 = ci_logger_api();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.4();
    }
  }
  if (CI_LOG_DUALRED())
  {
    float v44 = ci_logger_api();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairSession setPrimary:observations:metadata:](v44, v45, v46, v47, v48, v49, v50, v51);
    }
  }
  int v52 = [(NSArray *)[(CIDualRedEyeRepairSession *)self faces] count];
  *((_DWORD *)v71 + 6) = 2 * v52;
  BOOL v29 = 1;
LABEL_64:
  ((void (*)(void *))v69[0])(v68);
  _Block_object_dispose(&v70, 8);
  return v29;
}

void __62__CIDualRedEyeRepairSession_setPrimary_observations_metadata___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ci_signpost_log_dualredeye();
  os_signpost_id_t v3 = *(void *)(a1 + 40);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v4 = v2;
    if (os_signpost_enabled(v2))
    {
      int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_signpost_emit_with_name_impl(&dword_193671000, v4, OS_SIGNPOST_INTERVAL_END, v3, "setPrimary", "eyeCount:%d", (uint8_t *)v6, 8u);
    }
  }
}

uint64_t __62__CIDualRedEyeRepairSession_setPrimary_observations_metadata___block_invoke_259(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  [a2 areaMax];
  uint64_t v5 = objc_msgSend(v4, "numberWithFloat:");
  double v6 = NSNumber;
  [a3 areaMax];
  uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");

  return [v7 compare:v5];
}

- (BOOL)repairPrimaryWithSecondary:(__CVBuffer *)a3
{
  return [(CIDualRedEyeRepairSession *)self _repairPrimaryWithSecondary:a3 to:self->_primary];
}

- (BOOL)_repairPrimaryWithSecondary:(__CVBuffer *)a3 to:(__CVBuffer *)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  int v7 = [(NSArray *)[(CIDualRedEyeRepairSession *)self faces] count];
  double v8 = ci_signpost_log_dualredeye();
  if ((unint64_t)&self->super.isa + 1 >= 2)
  {
    double v54 = v8;
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v72) = v7;
      _os_signpost_emit_with_name_impl(&dword_193671000, v54, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "repairPrimaryWithSecondary", "eyeCount:%d", buf, 8u);
    }
  }
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  CGRect v67 = __60__CIDualRedEyeRepairSession__repairPrimaryWithSecondary_to___block_invoke;
  CGRect v68 = &__block_descriptor_44_e5_v8__0l;
  CGRect v69 = self;
  int v70 = v7;
  if (CI_LOG_DUALRED())
  {
    double v9 = ci_logger_api();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:].cold.8(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  if (CI_LOG_DUALRED())
  {
    double v17 = ci_logger_api();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:].cold.7((uint64_t)[(CIDualRedEyeRepairTuning *)[(CIDualRedEyeRepairSession *)self tuning] sessionTuning], v84);
    }
  }
  if (CI_LOG_DUALRED())
  {
    CGFloat v18 = ci_logger_api();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:].cold.6((uint64_t)[(CIDualRedEyeRepairTuning *)[(CIDualRedEyeRepairSession *)self tuning] repairTuning], v83);
    }
  }
  if (![(CIDualRedEyeRepairSession *)self context]
    || [(CIContext *)[(CIDualRedEyeRepairSession *)self context] workingFormat] != 2056)
  {
    if (CI_LOG_DUALRED())
    {
      id v19 = ci_logger_api();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:].cold.5(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    [(CIDualRedEyeRepairSession *)self setContext:+[CIDualRedEyeRepairSession _contextRGBAh]];
  }
  if ([(CIDualRedEyeRepairSession *)self renderUsingPixelBuffers])
  {
    [(CIDualRedEyeRepairSession *)self setDestination:[[CIRenderDestination alloc] initWithPixelBuffer:a4]];
    self->_secondarCGFloat y = a3;
    self->_output = a4;
    [(CIDualRedEyeRepairSession *)self setSecondaryImage:+[CIImage imageWithCVPixelBuffer:a3 options:[(CIDualRedEyeRepairSession *)self imageProperties]]];
  }
  if ([(CIDualRedEyeRepairSession *)self renderUsingProvidedCommandQueue]) {
    [(CIDualRedEyeRepairSession *)self setSecondaryImage:+[CIImage imageWithMTLTexture:[(CIDualRedEyeRepairSession *)self secondaryTexture] options:[(CIDualRedEyeRepairSession *)self imageProperties]]];
  }
  if (CI_LOG_DUALRED())
  {
    uint64_t v27 = ci_logger_api();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      [(CIImage *)self->primaryImage extent];
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      [(CIImage *)self->primaryImage extent];
      [(CIDualRedEyeRepairSession *)v82 _repairPrimaryWithSecondary:v31 to:v33];
    }
  }
  if (CI_LOG_DUALRED())
  {
    id v34 = ci_logger_api();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      [(CIImage *)self->secondaryImage extent];
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
      [(CIImage *)self->secondaryImage extent];
      [(CIDualRedEyeRepairSession *)v81 _repairPrimaryWithSecondary:v38 to:v40];
    }
  }
  if ((int)CI_LOG_DUALRED() >= 2) {
    [(CIDualRedEyeRepairSession *)self dumpSecondary];
  }
  if ([(CIDualRedEyeRepairSession *)self validateRepair])
  {
    [(CIDualRedEyeRepairSession *)self cleanupState];
  }
  else
  {
    context = (void *)MEMORY[0x199702DB0]();
    double Current = CFAbsoluteTimeGetCurrent();
    unint64_t v42 = +[CIFilter filterWithName:@"CIRedEyeRaw"];
    [(CIFilter *)v42 setValuesForKeysWithDictionary:[(CIDualRedEyeRepairTuning *)[(CIDualRedEyeRepairSession *)self tuning] repairTuning]];
    v79[0] = @"inputPrimary";
    float v43 = [(CIDualRedEyeRepairSession *)self primaryImage];
    v79[1] = @"inputSecondary";
    v80[0] = v43;
    v80[1] = [(CIDualRedEyeRepairSession *)self secondaryImage];
    -[CIFilter setValuesForKeysWithDictionary:](v42, "setValuesForKeysWithDictionary:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2]);
    [(CIFilter *)v42 setValue:[(NSDictionary *)[(CIDualRedEyeRepairTuning *)[(CIDualRedEyeRepairSession *)self tuning] sessionTuning] objectForKeyedSubscript:@"kUseFaceSegmentationMask"] forKey:@"inputUseFaceSegmentationMask"];
    NSUInteger v44 = 0;
    *(void *)&long long v45 = 136446722;
    long long v59 = v45;
    while (1)
    {
      NSUInteger v46 = v44;
      NSUInteger v47 = [(NSArray *)[(CIDualRedEyeRepairSession *)self faces] count];
      if (v47 <= v46) {
        break;
      }
      uint64_t v48 = ci_signpost_log_dualredeye();
      if ((unint64_t)&self->super.isa + 1 >= 2)
      {
        int v52 = v48;
        if (os_signpost_enabled(v48))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v72) = v46;
          _os_signpost_emit_with_name_impl(&dword_193671000, v52, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "repairFace", "face:%d", buf, 8u);
        }
      }
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      int v62 = __60__CIDualRedEyeRepairSession__repairPrimaryWithSecondary_to___block_invoke_264;
      uint64_t v63 = &__block_descriptor_44_e5_v8__0l;
      uint64_t v64 = self;
      int v65 = v46;
      if (CI_LOG_DUALRED())
      {
        uint64_t v49 = ci_logger_api();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          int v53 = [(NSArray *)[(CIDualRedEyeRepairSession *)self faces] count];
          *(_DWORD *)buf = v59;
          uint64_t v72 = "-[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:]";
          __int16 v73 = 1024;
          int v74 = v46 + 1;
          __int16 v75 = 1024;
          int v76 = v53;
          _os_log_error_impl(&dword_193671000, v49, OS_LOG_TYPE_ERROR, "%{public}s Repair %d/%d", buf, 0x18u);
        }
      }
      if ([(CIDualRedEyeRepairSession *)self renderUsingProvidedCommandQueue])
      {
        [(CIDualRedEyeRepairSession *)self setCommandBuffer:[(MTLCommandQueue *)[(CIDualRedEyeRepairSession *)self commandQueue] commandBuffer]];
        [(CIDualRedEyeRepairSession *)self setDestination:[[CIRenderDestination alloc] initWithMTLTexture:[(CIDualRedEyeRepairSession *)self outputTexture] commandBuffer:[(CIDualRedEyeRepairSession *)self commandBuffer]]];
      }
      BOOL v50 = [(CIDualRedEyeRepairSession *)self repairFace:[(NSArray *)[(CIDualRedEyeRepairSession *)self faces] objectAtIndexedSubscript:v46] filter:v42];
      if (!v50)
      {
        if (CI_LOG_DUALRED())
        {
          uint64_t v51 = ci_logger_api();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:](v77, &v78, v51);
          }
        }
        [(CIDualRedEyeRepairSession *)self cleanupState];
      }
      v62((uint64_t)v61);
      NSUInteger v44 = v46 + 1;
      if (!v50) {
        goto LABEL_55;
      }
    }
    double v55 = CFAbsoluteTimeGetCurrent();
    if (CI_LOG_DUALRED())
    {
      uint64_t v56 = ci_logger_api();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        [[(NSArray *)[(CIDualRedEyeRepairSession *)self faces] count] _repairPrimaryWithSecondary:v56 to:(v55 - Current) * 1000.0];
      }
    }
    if ((int)CI_LOG_DUALRED() >= 2) {
      dump(+[CIImage imageWithCVPixelBuffer:options:](CIImage, "imageWithCVPixelBuffer:options:", self->_primary, [(CIDualRedEyeRepairSession *)self imageProperties]), @"-repair", +[CIDualRedEyeRepairSession _contextRGBAh], (uint64_t)[(CIDualRedEyeRepairSession *)self timestamp]);
    }
LABEL_55:
    if (v47 <= v46)
    {
      [(CIDualRedEyeRepairSession *)self cleanupState];
      BOOL v57 = 1;
      goto LABEL_57;
    }
  }
  BOOL v57 = 0;
LABEL_57:
  v67((uint64_t)v66);
  return v57;
}

void __60__CIDualRedEyeRepairSession__repairPrimaryWithSecondary_to___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ci_signpost_log_dualredeye();
  os_signpost_id_t v3 = *(void *)(a1 + 32);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v4 = v2;
    if (os_signpost_enabled(v2))
    {
      int v5 = *(_DWORD *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_signpost_emit_with_name_impl(&dword_193671000, v4, OS_SIGNPOST_INTERVAL_END, v3, "repairPrimaryWithSecondary", "eyeCount:%d", (uint8_t *)v6, 8u);
    }
  }
}

void __60__CIDualRedEyeRepairSession__repairPrimaryWithSecondary_to___block_invoke_264(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ci_signpost_log_dualredeye();
  os_signpost_id_t v3 = *(void *)(a1 + 32);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v4 = v2;
    if (os_signpost_enabled(v2))
    {
      int v5 = *(_DWORD *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_signpost_emit_with_name_impl(&dword_193671000, v4, OS_SIGNPOST_INTERVAL_END, v3, "repairFace", "face:%d", (uint8_t *)v6, 8u);
    }
  }
}

- (void)dumpSecondary
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136447234;
  OUTLINED_FUNCTION_5_1();
  _os_log_error_impl(&dword_193671000, v0, OS_LOG_TYPE_ERROR, "%{public}s pixelformat of secondary image is %c%c%c%c", (uint8_t *)v1, 0x24u);
}

- (void)dumpObservation:(id)a3 index:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v8 = 0;
  double v6 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v8];
  if (v8)
  {
    if (CI_LOG_DUALRED())
    {
      uint64_t v7 = ci_logger_api();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CIDualRedEyeRepairSession dumpObservation:index:]();
      }
    }
  }
  else
  {
    [v6 writeToFile:dumpfilepathWithTag(objc_msgSend(NSString, "stringWithFormat:", @"%@-%d", @"-observation", v4), @".archive", (uint64_t)-[CIDualRedEyeRepairSession timestamp](self, "timestamp")), 0 atomically];
  }
}

- (CIContext)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
}

- (NSArray)observations
{
  return self->observations;
}

- (void)setObservations:(id)a3
{
}

- (CIRenderDestination)destination
{
  return self->destination;
}

- (void)setDestination:(id)a3
{
}

- (CIImage)primaryImage
{
  return self->primaryImage;
}

- (void)setPrimaryImage:(id)a3
{
}

- (CIImage)secondaryImage
{
  return self->secondaryImage;
}

- (void)setSecondaryImage:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)imageProperties
{
  return self->imageProperties;
}

- (void)setImageProperties:(id)a3
{
}

- (NSArray)faces
{
  return self->faces;
}

- (void)setFaces:(id)a3
{
}

- (CIDualRedEyeRepairTuning)tuning
{
  return self->tuning;
}

- (void)setTuning:(id)a3
{
}

- (NSDate)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSDictionary)tuningParametersByPortType
{
  return self->tuningParametersByPortType;
}

- (void)setTuningParametersByPortType:(id)a3
{
}

- (MTLCommandQueue)commandQueue
{
  return self->commandQueue;
}

- (void)setCommandQueue:(id)a3
{
}

- (MTLTexture)primaryTexture
{
  return self->primaryTexture;
}

- (void)setPrimaryTexture:(id)a3
{
}

- (MTLTexture)secondaryTexture
{
  return self->secondaryTexture;
}

- (void)setSecondaryTexture:(id)a3
{
}

- (MTLTexture)outputTexture
{
  return self->outputTexture;
}

- (void)setOutputTexture:(id)a3
{
}

- (MTLCommandBuffer)commandBuffer
{
  return self->commandBuffer;
}

- (void)setCommandBuffer:(id)a3
{
}

- (void)prewarm
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s Prewarming failed: prepareRender failed with error %@", v2, v3, v4, v5, 2u);
}

- (void)validateRenderState
{
}

- (void)validateSetPrimary
{
}

- (void)validateRepair
{
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)redEyeFaceFromObservation:(float)a1 exifOrientation:.cold.3(float a1)
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8], a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v1, v2, "%{public}s skip: confidence too low (%f)", v3, v4, v5, v6, 2u);
}

- (void)redEyeFaceFromObservation:(float)a1 exifOrientation:.cold.4(float a1)
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8], a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v1, v2, "%{public}s skip: junkiness too high (%f)", v3, v4, v5, v6, 2u);
}

- (void)redEyeFaceFromObservation:(float)a1 exifOrientation:.cold.5(float a1)
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8], a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v1, v2, "%{public}s skip: eye isotropy too large (%f)", v3, v4, v5, v6, 2u);
}

- (void)redEyeFaceFromObservation:(float)a1 exifOrientation:.cold.6(float a1)
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8], a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v1, v2, "%{public}s skip: eye constellation area too small (%f)", v3, v4, v5, v6, 2u);
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_193671000, a1, a3, "%{public}s Probabilities for face segments returned nil. Skipping this face.", a5, a6, a7, a8, 2u);
}

- (void)redEyeFaceFromObservation:(void *)a1 exifOrientation:(NSObject *)a2 .cold.9(void *a1, NSObject *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [a1 extent];
  int v5 = (int)v4;
  [a1 extent];
  int v7 = 136447234;
  uint64_t v8 = "-[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]";
  __int16 v9 = 1024;
  int v10 = 256;
  __int16 v11 = 1024;
  int v12 = v5;
  __int16 v13 = 1024;
  int v14 = 256;
  __int16 v15 = 1024;
  int v16 = (int)v6;
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "%{public}s Unexpected size for face probabilities: %d != %d, %d != %d", (uint8_t *)&v7, 0x24u);
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)redEyeFaceFromObservation:(float)a3 exifOrientation:(uint64_t)a4 .cold.11(NSObject *a1, float a2, float a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = 136446722;
  double v6 = "-[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]";
  __int16 v7 = 2048;
  double v8 = a2;
  __int16 v9 = 2048;
  double v10 = a3;
  OUTLINED_FUNCTION_10(&dword_193671000, a1, a5, "%{public}s skip: face out of focus: %.3f > %.3f", (uint8_t *)&v5);
}

- (void)redEyeFaceFromObservation:exifOrientation:.cold.12()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s Time spent computing focus stats: %.3fms\n", v2, v3, v4, v5, 2u);
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(float)a4 .cold.13(uint64_t a1, NSObject *a2, uint64_t a3, float a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = 136446722;
  uint64_t v5 = "-[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]";
  __int16 v6 = 2048;
  double v7 = a4;
  __int16 v8 = 2048;
  uint64_t v9 = a1;
  OUTLINED_FUNCTION_10(&dword_193671000, a2, a3, "%{public}s Focus variance = %.3f, count = %ld\n", (uint8_t *)&v4);
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)redEyeFaceFromObservation:(void *)a1 exifOrientation:.cold.16(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_12_0(&dword_193671000, v1, v2, "%{public}s Probabilities for face segments returned not enough features (%d but expected 5). Skipping this face.", v3, v4, v5, v6, 2u);
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)redEyeFaceFromObservation:(void *)a1 exifOrientation:.cold.19(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_12_0(&dword_193671000, v1, v2, "%{public}s skip: unexpected constellation size: %d != (6 or 8)", v3, v4, v5, v6, 2u);
}

- (void)redEyeFaceFromObservation:(void *)a1 exifOrientation:(NSObject *)a2 .cold.20(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a1, "primaryImage"), "properties");
  v4[0] = 136446466;
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0(&dword_193671000, a2, v3, "%{public}s Properties for primaryImage %@", (uint8_t *)v4);
}

- (void)redEyeFaceFromObservation:exifOrientation:.cold.21()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s Right Eye landmarks %@", v2, v3, v4, v5, 2u);
}

- (void)redEyeFaceFromObservation:exifOrientation:.cold.22()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s Left  Eye landmarks %@", v2, v3, v4, v5, 2u);
}

- (void)repairFace:(void *)a1 filter:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 kernelExecutionTime];
  v4[0] = 136446466;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_193671000, a2, v3, "%{public}s Kernel execution took %.3fms", (uint8_t *)v4);
}

- (void)repairFace:filter:.cold.2()
{
  OUTLINED_FUNCTION_15();
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  CFAbsoluteTimeGetCurrent();
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_193671000, v0, v1, "%{public}s startTaskToRender (composite) took %.3fms", (uint8_t *)v2);
}

- (void)repairFace:filter:.cold.3()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s Error in waitUntilCompletedAndReturnError: %@", v2, v3, v4, v5, 2u);
}

- (void)repairFace:filter:.cold.4()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s Error in startTaskToRender: %@", v2, v3, v4, v5, 2u);
}

- (void)repairFace:filter:.cold.5()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s Error in startTaskToRender (right): %@", v2, v3, v4, v5, 2u);
}

- (void)repairFace:filter:.cold.6()
{
  OUTLINED_FUNCTION_15();
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  CFAbsoluteTimeGetCurrent();
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_193671000, v0, v1, "%{public}s startTaskToRender (right) took %.3fms", (uint8_t *)v2);
}

- (void)repairFace:filter:.cold.7()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s Error in startTaskToRender (left): %@", v2, v3, v4, v5, 2u);
}

- (void)repairFace:filter:.cold.8()
{
  OUTLINED_FUNCTION_15();
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  CFAbsoluteTimeGetCurrent();
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_193671000, v0, v1, "%{public}s startTaskToRender (left) took %.3fms", (uint8_t *)v2);
}

- (void)repairFace:filter:.cold.9()
{
  OUTLINED_FUNCTION_15();
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  CFAbsoluteTimeGetCurrent();
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_193671000, v0, v1, "%{public}s Output image took %.3fms", (uint8_t *)v2);
}

- (void)setPrimary:(uint8_t *)buf observations:(void *)a2 metadata:(os_log_t)log .cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136446210;
  *a2 = "-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]";
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s Bad face, skipping", buf, 0xCu);
}

- (void)setPrimary:(uint64_t)a3 observations:(uint64_t)a4 metadata:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPrimary:(uint64_t)a3 observations:(uint64_t)a4 metadata:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_193671000, a1, a3, "%{public}s setPrimary returning successfully", a5, a6, a7, a8, 2u);
}

- (void)setPrimary:observations:metadata:.cold.4()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s Total time spent during setPrimary: %.3fms", v2, v3, v4, v5, 2u);
}

- (void)setPrimary:(uint64_t)a3 observations:(uint64_t)a4 metadata:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPrimary:(uint64_t)a1 observations:(_DWORD *)a2 metadata:.cold.6(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  OUTLINED_FUNCTION_6_0(a1, (uint64_t)a2, (uint64_t)"-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]");
  OUTLINED_FUNCTION_3_0(&dword_193671000, v2, (uint64_t)v2, "%{public}s setPrimary repair tuning:\n%@", v3);
}

- (void)setPrimary:(uint64_t)a1 observations:(_DWORD *)a2 metadata:.cold.7(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  OUTLINED_FUNCTION_6_0(a1, (uint64_t)a2, (uint64_t)"-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]");
  OUTLINED_FUNCTION_3_0(&dword_193671000, v2, (uint64_t)v2, "%{public}s setPrimary session tuning:\n%@", v3);
}

- (void)setPrimary:observations:metadata:.cold.8()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s setPrimary metadata:\n%@", v2, v3, v4, v5, 2u);
}

- (void)setPrimary:(int)a1 observations:(uint8_t *)buf metadata:(os_log_t)log .cold.9(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446466;
  *(void *)(buf + 4) = "-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a1;
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s setPrimary %d observations", buf, 0x12u);
}

- (void)_repairPrimaryWithSecondary:(os_log_t)log to:.cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136446210;
  *a2 = "-[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:]";
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s Error while repairing face", buf, 0xCu);
}

- (void)_repairPrimaryWithSecondary:(NSObject *)a3 to:(double)a4 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3, double a4)
{
  *(_DWORD *)a2 = 136446722;
  *(void *)(a2 + 4) = "-[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:]";
  *(_WORD *)(a2 + 12) = 2048;
  *(double *)(a2 + 14) = a4;
  *(_WORD *)(a2 + 22) = 2048;
  *(double *)(a2 + 24) = a4 / (double)(unint64_t)(2 * a1);
  OUTLINED_FUNCTION_10(&dword_193671000, a3, (uint64_t)a3, "%{public}s Total time spent during repair: %.3fms = %.3fms/eye", (uint8_t *)a2);
}

- (void)_repairPrimaryWithSecondary:(double)a3 to:(double)a4 .cold.3(_DWORD *a1, double a2, double a3, double a4)
{
  *a1 = 136446722;
  OUTLINED_FUNCTION_9_0((uint64_t)a1, (int)a4);
  _os_log_error_impl(&dword_193671000, v4, OS_LOG_TYPE_ERROR, "%{public}s CVPixelBuffer size (secondary) = %d, %d", v5, 0x18u);
}

- (void)_repairPrimaryWithSecondary:(double)a3 to:(double)a4 .cold.4(_DWORD *a1, double a2, double a3, double a4)
{
  *a1 = 136446722;
  OUTLINED_FUNCTION_9_0((uint64_t)a1, (int)a4);
  _os_log_error_impl(&dword_193671000, v4, OS_LOG_TYPE_ERROR, "%{public}s CVPixelBuffer size (primary) = %d, %d", v5, 0x18u);
}

- (void)_repairPrimaryWithSecondary:(uint64_t)a3 to:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_repairPrimaryWithSecondary:(uint64_t)a1 to:(_DWORD *)a2 .cold.6(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  OUTLINED_FUNCTION_6_0(a1, (uint64_t)a2, (uint64_t)"-[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:]");
  OUTLINED_FUNCTION_3_0(&dword_193671000, v2, (uint64_t)v2, "%{public}s repairPrimary repair tuning:\n%@", v3);
}

- (void)_repairPrimaryWithSecondary:(uint64_t)a1 to:(_DWORD *)a2 .cold.7(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  OUTLINED_FUNCTION_6_0(a1, (uint64_t)a2, (uint64_t)"-[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:]");
  OUTLINED_FUNCTION_3_0(&dword_193671000, v2, (uint64_t)v2, "%{public}s repairPrimary session tuning:\n%@", v3);
}

- (void)_repairPrimaryWithSecondary:(uint64_t)a3 to:(uint64_t)a4 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dumpObservation:index:.cold.1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s Failed to archive the observations: %@\n", v2, v3, v4, v5, 2u);
}

@end