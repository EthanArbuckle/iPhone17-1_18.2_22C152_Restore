@interface MLCYOLOLossDescriptor
+ (MLCYOLOLossDescriptor)descriptorWithAnchorBoxes:(NSData *)anchorBoxes anchorBoxCount:(NSUInteger)anchorBoxCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldRescore;
- (MLCLossDescriptor)classesLossDescriptor;
- (MLCLossDescriptor)confidenceLossDescriptor;
- (MLCLossDescriptor)spatialPositionLossDescriptor;
- (MLCLossDescriptor)spatialSizeLossDescriptor;
- (MLCYOLOLossDescriptor)initWithLossDescriptorWithSpatialPositionLossType:(int)a3 spatialSizeLossType:(int)a4 confidenceLossType:(int)a5 classesLossType:(int)a6 reductionType:(int)a7 anchorBoxCount:(unint64_t)a8 anchorBoxes:(id)a9;
- (NSData)anchorBoxes;
- (NSUInteger)anchorBoxCount;
- (float)maximumIOUForObjectAbsence;
- (float)minimumIOUForObjectPresence;
- (float)scaleClassLoss;
- (float)scaleNoObjectConfidenceLoss;
- (float)scaleObjectConfidenceLoss;
- (float)scaleSpatialPositionLoss;
- (float)scaleSpatialSizeLoss;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)reductionType;
- (unint64_t)hash;
- (void)setMaximumIOUForObjectAbsence:(float)maximumIOUForObjectAbsence;
- (void)setMinimumIOUForObjectPresence:(float)minimumIOUForObjectPresence;
- (void)setScaleClassLoss:(float)scaleClassLoss;
- (void)setScaleNoObjectConfidenceLoss:(float)scaleNoObjectConfidenceLoss;
- (void)setScaleObjectConfidenceLoss:(float)scaleObjectConfidenceLoss;
- (void)setScaleSpatialPositionLoss:(float)scaleSpatialPositionLoss;
- (void)setScaleSpatialSizeLoss:(float)scaleSpatialSizeLoss;
- (void)setShouldRescore:(BOOL)shouldRescore;
@end

@implementation MLCYOLOLossDescriptor

+ (MLCYOLOLossDescriptor)descriptorWithAnchorBoxes:(NSData *)anchorBoxes anchorBoxCount:(NSUInteger)anchorBoxCount
{
  v6 = anchorBoxes;
  v7 = (void *)[objc_alloc((Class)a1) initWithLossDescriptorWithSpatialPositionLossType:1 spatialSizeLossType:6 confidenceLossType:3 classesLossType:2 reductionType:1 anchorBoxCount:anchorBoxCount anchorBoxes:v6];

  return (MLCYOLOLossDescriptor *)v7;
}

- (MLCYOLOLossDescriptor)initWithLossDescriptorWithSpatialPositionLossType:(int)a3 spatialSizeLossType:(int)a4 confidenceLossType:(int)a5 classesLossType:(int)a6 reductionType:(int)a7 anchorBoxCount:(unint64_t)a8 anchorBoxes:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  uint64_t v13 = *(void *)&a4;
  uint64_t v14 = *(void *)&a3;
  id v17 = a9;
  if (v10 >= 3)
  {
    v29 = +[MLCLog framework];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[MLCYOLOLossDescriptor initWithLossDescriptorWithSpatialPositionLossType:spatialSizeLossType:confidenceLossType:classesLossType:reductionType:anchorBoxCount:anchorBoxes:](a2, v10, v29);
    }

    v28 = 0;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)MLCYOLOLossDescriptor;
    v18 = [(MLCYOLOLossDescriptor *)&v31 init];
    v19 = v18;
    if (v18)
    {
      v18->_anchorBoxCount = a8;
      objc_storeStrong((id *)&v18->_anchorBoxes, a9);
      *(_OWORD *)&v19->_scaleSpatialPositionLoss = xmmword_1DD1F0DB0;
      *(void *)&v19->_scaleClassLoss = 0x3F33333340000000;
      v19->_shouldRescore = 1;
      v19->_maximumIOUForObjectAbsence = 0.3;
      v19->_reductionType = v10;
      uint64_t v20 = +[MLCLossDescriptor descriptorWithType:v14 reductionType:v10];
      spatialPositionLossDescriptor = v19->_spatialPositionLossDescriptor;
      v19->_spatialPositionLossDescriptor = (MLCLossDescriptor *)v20;

      uint64_t v22 = +[MLCLossDescriptor descriptorWithType:v13 reductionType:v10];
      spatialSizeLossDescriptor = v19->_spatialSizeLossDescriptor;
      v19->_spatialSizeLossDescriptor = (MLCLossDescriptor *)v22;

      uint64_t v24 = +[MLCLossDescriptor descriptorWithType:v12 reductionType:v10];
      confidenceLossDescriptor = v19->_confidenceLossDescriptor;
      v19->_confidenceLossDescriptor = (MLCLossDescriptor *)v24;

      uint64_t v26 = +[MLCLossDescriptor descriptorWithType:v11 reductionType:v10];
      classesLossDescriptor = v19->_classesLossDescriptor;
      v19->_classesLossDescriptor = (MLCLossDescriptor *)v26;
    }
    self = v19;
    v28 = self;
  }

  return v28;
}

- (id)description
{
  v25 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(MLCYOLOLossDescriptor *)self spatialPositionLossDescriptor];
  uint64_t v24 = [v5 lossType];
  v6 = [(MLCYOLOLossDescriptor *)self spatialSizeLossDescriptor];
  uint64_t v23 = [v6 lossType];
  BOOL v7 = [(MLCYOLOLossDescriptor *)self shouldRescore];
  [(MLCYOLOLossDescriptor *)self scaleNoObjectConfidenceLoss];
  double v9 = v8;
  [(MLCYOLOLossDescriptor *)self scaleObjectConfidenceLoss];
  double v11 = v10;
  [(MLCYOLOLossDescriptor *)self scaleClassLoss];
  double v13 = v12;
  [(MLCYOLOLossDescriptor *)self minimumIOUForObjectPresence];
  double v15 = v14;
  [(MLCYOLOLossDescriptor *)self maximumIOUForObjectAbsence];
  double v17 = v16;
  v18 = [(MLCYOLOLossDescriptor *)self confidenceLossDescriptor];
  uint64_t v19 = [v18 lossType];
  uint64_t v20 = [(MLCYOLOLossDescriptor *)self classesLossDescriptor];
  v21 = [v25 stringWithFormat:@"%@: { spatialPositionLossType=%d : spatialSizeLossType=%d : rescore=%d : scaleNoObjectConfidenceLoss=%f : scaleObjectConfidenceLoss=%f : scaleClassLoss=%f :minimumIOUForObjectPresence=%f : maximumIOUForObjectAbsence=%fconfidenceLossType=%d : classesLossType=%d : reductionType=%d: numberOfAnchorBoxes=%lu }", v4, v24, v23, v7, *(void *)&v9, *(void *)&v11, *(void *)&v13, *(void *)&v15, *(void *)&v17, v19, objc_msgSend(v20, "lossType"), -[MLCYOLOLossDescriptor reductionType](self, "reductionType"), -[MLCYOLOLossDescriptor anchorBoxCount](self, "anchorBoxCount")];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 anchorBoxCount];
    if (v6 == [(MLCYOLOLossDescriptor *)self anchorBoxCount])
    {
      BOOL v7 = [v5 anchorBoxes];
      float v8 = [(MLCYOLOLossDescriptor *)self anchorBoxes];
      if (![v7 isEqualToData:v8]) {
        goto LABEL_19;
      }
      int v9 = [v5 shouldRescore];
      if (v9 != [(MLCYOLOLossDescriptor *)self shouldRescore]) {
        goto LABEL_19;
      }
      [v5 scaleSpatialPositionLoss];
      float v11 = v10;
      [(MLCYOLOLossDescriptor *)self scaleSpatialPositionLoss];
      if (v11 != v12) {
        goto LABEL_19;
      }
      [v5 scaleSpatialSizeLoss];
      float v14 = v13;
      [(MLCYOLOLossDescriptor *)self scaleSpatialSizeLoss];
      if (v14 != v15) {
        goto LABEL_19;
      }
      [v5 scaleNoObjectConfidenceLoss];
      float v17 = v16;
      [(MLCYOLOLossDescriptor *)self scaleNoObjectConfidenceLoss];
      if (v17 != v18) {
        goto LABEL_19;
      }
      [v5 scaleObjectConfidenceLoss];
      float v20 = v19;
      [(MLCYOLOLossDescriptor *)self scaleObjectConfidenceLoss];
      if (v20 != v21) {
        goto LABEL_19;
      }
      [v5 scaleClassLoss];
      float v23 = v22;
      [(MLCYOLOLossDescriptor *)self scaleClassLoss];
      if (v23 != v24) {
        goto LABEL_19;
      }
      [v5 minimumIOUForObjectPresence];
      float v26 = v25;
      [(MLCYOLOLossDescriptor *)self minimumIOUForObjectPresence];
      if (v26 == v27
        && ([v5 maximumIOUForObjectAbsence],
            float v29 = v28,
            [(MLCYOLOLossDescriptor *)self maximumIOUForObjectAbsence],
            v29 == v30))
      {
        objc_super v31 = [v5 spatialPositionLossDescriptor];
        v32 = [(MLCYOLOLossDescriptor *)self spatialPositionLossDescriptor];
        if ([v31 isEqual:v32])
        {
          v33 = [v5 spatialSizeLossDescriptor];
          v34 = [(MLCYOLOLossDescriptor *)self spatialSizeLossDescriptor];
          if ([v33 isEqual:v34])
          {
            v35 = [v5 confidenceLossDescriptor];
            v44 = [(MLCYOLOLossDescriptor *)self confidenceLossDescriptor];
            v45 = v35;
            if ([v35 isEqual:v44])
            {
              uint64_t v36 = [v5 classesLossDescriptor];
              uint64_t v37 = [(MLCYOLOLossDescriptor *)self classesLossDescriptor];
              v43 = (void *)v36;
              v38 = (void *)v36;
              v39 = (void *)v37;
              if ([v38 isEqual:v37])
              {
                int v42 = [v5 reductionType];
                BOOL v40 = v42 == [(MLCYOLOLossDescriptor *)self reductionType];
              }
              else
              {
                BOOL v40 = 0;
              }
            }
            else
            {
              BOOL v40 = 0;
            }
          }
          else
          {
            BOOL v40 = 0;
          }
        }
        else
        {
          BOOL v40 = 0;
        }
      }
      else
      {
LABEL_19:
        BOOL v40 = 0;
      }
    }
    else
    {
      BOOL v40 = 0;
    }
  }
  else
  {
    BOOL v40 = 0;
  }

  return v40;
}

- (unint64_t)hash
{
  unint64_t v31 = 0;
  char v28 = [(MLCYOLOLossDescriptor *)self anchorBoxCount];
  float v30 = [(MLCYOLOLossDescriptor *)self anchorBoxes];
  [v30 hash];
  [(MLCYOLOLossDescriptor *)self shouldRescore];
  v3 = NSNumber;
  [(MLCYOLOLossDescriptor *)self scaleSpatialPositionLoss];
  float v29 = objc_msgSend(v3, "numberWithFloat:");
  [v29 hash];
  id v4 = NSNumber;
  [(MLCYOLOLossDescriptor *)self scaleSpatialSizeLoss];
  float v27 = objc_msgSend(v4, "numberWithFloat:");
  [v27 hash];
  id v5 = NSNumber;
  [(MLCYOLOLossDescriptor *)self scaleNoObjectConfidenceLoss];
  float v26 = objc_msgSend(v5, "numberWithFloat:");
  [v26 hash];
  uint64_t v6 = NSNumber;
  [(MLCYOLOLossDescriptor *)self scaleObjectConfidenceLoss];
  float v25 = objc_msgSend(v6, "numberWithFloat:");
  [v25 hash];
  BOOL v7 = NSNumber;
  [(MLCYOLOLossDescriptor *)self scaleClassLoss];
  float v24 = objc_msgSend(v7, "numberWithFloat:");
  [v24 hash];
  float v8 = NSNumber;
  [(MLCYOLOLossDescriptor *)self minimumIOUForObjectPresence];
  float v23 = objc_msgSend(v8, "numberWithFloat:");
  [v23 hash];
  int v9 = NSNumber;
  [(MLCYOLOLossDescriptor *)self maximumIOUForObjectAbsence];
  float v10 = objc_msgSend(v9, "numberWithFloat:");
  [v10 hash];
  float v11 = [(MLCYOLOLossDescriptor *)self spatialPositionLossDescriptor];
  [v11 hash];
  float v12 = [(MLCYOLOLossDescriptor *)self spatialSizeLossDescriptor];
  [v12 hash];
  float v13 = [(MLCYOLOLossDescriptor *)self confidenceLossDescriptor];
  [v13 hash];
  float v14 = [(MLCYOLOLossDescriptor *)self classesLossDescriptor];
  [v14 hash];
  [(MLCYOLOLossDescriptor *)self reductionType];
  hashCombine_5(&v31, v15, v16, v17, v18, v19, v20, v21, v28);

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  NSUInteger v5 = [(MLCYOLOLossDescriptor *)self anchorBoxCount];
  uint64_t v6 = [(MLCYOLOLossDescriptor *)self anchorBoxes];
  BOOL v7 = (void *)[v4 initWithLossDescriptorWithSpatialPositionLossType:1 spatialSizeLossType:6 confidenceLossType:3 classesLossType:2 reductionType:1 anchorBoxCount:v5 anchorBoxes:v6];

  return v7;
}

- (NSUInteger)anchorBoxCount
{
  return self->_anchorBoxCount;
}

- (NSData)anchorBoxes
{
  return self->_anchorBoxes;
}

- (BOOL)shouldRescore
{
  return self->_shouldRescore;
}

- (void)setShouldRescore:(BOOL)shouldRescore
{
  self->_shouldRescore = shouldRescore;
}

- (float)scaleSpatialPositionLoss
{
  return self->_scaleSpatialPositionLoss;
}

- (void)setScaleSpatialPositionLoss:(float)scaleSpatialPositionLoss
{
  self->_scaleSpatialPositionLoss = scaleSpatialPositionLoss;
}

- (float)scaleSpatialSizeLoss
{
  return self->_scaleSpatialSizeLoss;
}

- (void)setScaleSpatialSizeLoss:(float)scaleSpatialSizeLoss
{
  self->_scaleSpatialSizeLoss = scaleSpatialSizeLoss;
}

- (float)scaleNoObjectConfidenceLoss
{
  return self->_scaleNoObjectConfidenceLoss;
}

- (void)setScaleNoObjectConfidenceLoss:(float)scaleNoObjectConfidenceLoss
{
  self->_scaleNoObjectConfidenceLoss = scaleNoObjectConfidenceLoss;
}

- (float)scaleObjectConfidenceLoss
{
  return self->_scaleObjectConfidenceLoss;
}

- (void)setScaleObjectConfidenceLoss:(float)scaleObjectConfidenceLoss
{
  self->_scaleObjectConfidenceLoss = scaleObjectConfidenceLoss;
}

- (float)scaleClassLoss
{
  return self->_scaleClassLoss;
}

- (void)setScaleClassLoss:(float)scaleClassLoss
{
  self->_scaleClassLoss = scaleClassLoss;
}

- (float)minimumIOUForObjectPresence
{
  return self->_minimumIOUForObjectPresence;
}

- (void)setMinimumIOUForObjectPresence:(float)minimumIOUForObjectPresence
{
  self->_minimumIOUForObjectPresence = minimumIOUForObjectPresence;
}

- (float)maximumIOUForObjectAbsence
{
  return self->_maximumIOUForObjectAbsence;
}

- (void)setMaximumIOUForObjectAbsence:(float)maximumIOUForObjectAbsence
{
  self->_maximumIOUForObjectAbsence = maximumIOUForObjectAbsence;
}

- (MLCLossDescriptor)spatialPositionLossDescriptor
{
  return (MLCLossDescriptor *)objc_getProperty(self, a2, 64, 1);
}

- (MLCLossDescriptor)spatialSizeLossDescriptor
{
  return (MLCLossDescriptor *)objc_getProperty(self, a2, 72, 1);
}

- (MLCLossDescriptor)confidenceLossDescriptor
{
  return (MLCLossDescriptor *)objc_getProperty(self, a2, 80, 1);
}

- (MLCLossDescriptor)classesLossDescriptor
{
  return (MLCLossDescriptor *)objc_getProperty(self, a2, 88, 1);
}

- (int)reductionType
{
  return self->_reductionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classesLossDescriptor, 0);
  objc_storeStrong((id *)&self->_confidenceLossDescriptor, 0);
  objc_storeStrong((id *)&self->_spatialSizeLossDescriptor, 0);
  objc_storeStrong((id *)&self->_spatialPositionLossDescriptor, 0);

  objc_storeStrong((id *)&self->_anchorBoxes, 0);
}

- (void)initWithLossDescriptorWithSpatialPositionLossType:(NSObject *)a3 spatialSizeLossType:confidenceLossType:classesLossType:reductionType:anchorBoxCount:anchorBoxes:.cold.1(const char *a1, int a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  BOOL v7 = v5;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: failure to create yolo loss descriptor with reduceType = %d", (uint8_t *)&v6, 0x12u);
}

@end