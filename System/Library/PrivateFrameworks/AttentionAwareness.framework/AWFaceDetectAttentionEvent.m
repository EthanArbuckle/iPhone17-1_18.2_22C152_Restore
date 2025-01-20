@interface AWFaceDetectAttentionEvent
+ (BOOL)supportsSecureCoding;
- (AWFaceDetectAttentionEvent)initWithCoder:(id)a3;
- (AWFaceDetectAttentionEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 faceMetadata:(AWFaceDetectMetadata *)a5;
- (BOOL)isMetadataValid;
- (CGRect)faceBounds;
- (NSArray)motionData;
- (double)distance;
- (double)pitch;
- (double)roll;
- (double)yaw;
- (float)attentionScore;
- (float)faceDetectionScore;
- (id)describeMotionData:(id)a3;
- (id)description;
- (unint64_t)faceState;
- (unint64_t)metadataType;
- (unint64_t)motionResult;
- (unint64_t)orientation;
- (unint64_t)personID;
- (void)encodeWithCoder:(id)a3;
- (void)validateMask;
@end

@implementation AWFaceDetectAttentionEvent

- (void).cxx_destruct
{
}

- (CGRect)faceBounds
{
  double x = self->_faceBounds.origin.x;
  double y = self->_faceBounds.origin.y;
  double width = self->_faceBounds.size.width;
  double height = self->_faceBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)personID
{
  return self->_personID;
}

- (float)faceDetectionScore
{
  return self->_faceDetectionScore;
}

- (float)attentionScore
{
  return self->_attentionScore;
}

- (unint64_t)motionResult
{
  return self->_motionResult;
}

- (NSArray)motionData
{
  return self->_motionData;
}

- (unint64_t)metadataType
{
  return self->_metadataType;
}

- (unint64_t)faceState
{
  return self->_faceState;
}

- (double)distance
{
  return self->_distance;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (double)roll
{
  return self->_roll;
}

- (double)yaw
{
  return self->_yaw;
}

- (double)pitch
{
  return self->_pitch;
}

- (BOOL)isMetadataValid
{
  return self->_metadataValid;
}

- (id)description
{
  v26 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(AWAttentionEvent *)self timestamp];
  uint64_t v6 = v5;
  BOOL metadataValid = self->_metadataValid;
  double pitch = self->_pitch;
  double yaw = self->_yaw;
  double roll = self->_roll;
  v11 = getFaceDetectOrientationDescription(self->_orientation);
  double distance = self->_distance;
  v13 = getEyeReliefFaceStateDescription(self->_faceState);
  unint64_t metadataType = self->_metadataType;
  if (metadataType >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown AWFaceDetectMetadataType %llu", self->_metadataType);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E606A3C0[metadataType];
  }
  v16 = [(AWFaceDetectAttentionEvent *)self describeMotionData:self->_motionData];
  unint64_t motionResult = self->_motionResult;
  if (motionResult >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown AWAttentionMotionEventType %llu", self->_motionResult);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = off_1E606A3F0[motionResult];
  }
  double attentionScore = self->_attentionScore;
  double faceDetectionScore = self->_faceDetectionScore;
  uint64_t v21 = [(AWAttentionEvent *)self tagIndex];
  v22 = [(AWAttentionEvent *)self tag];
  v23 = tagDescription(v21, v22);
  v24 = [v26 stringWithFormat:@"<%@: %p> (timestamp: %13.5f metadataValid %u pitch %13.5f yaw %13.5f roll %13.5f orientation %@ distance %13.5f faceState: %@ metadataType: %@ motionData: %@ motionResult: %@ attentionScore: %13.5f faceDetectionScore: %13.5f %@)", v4, self, v6, metadataValid, *(void *)&pitch, *(void *)&yaw, *(void *)&roll, v11, *(void *)&distance, v13, v15, v16, v18, *(void *)&attentionScore, *(void *)&faceDetectionScore, v23];

  return v24;
}

- (id)describeMotionData:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(v7, 0, sizeof(v7));
  id v3 = a3;
  if ([v3 countByEnumeratingWithState:v7 objects:v8 count:16])
  {
    objc_msgSend(**((id **)&v7[0] + 1), "floatValue", *(void *)&v7[0]);
    v4 = [v3 valueForKey:@"description"];
    uint64_t v5 = [v4 componentsJoinedByString:@","];
  }
  else
  {
    uint64_t v5 = @"nil";
  }

  return v5;
}

- (AWFaceDetectAttentionEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 faceMetadata:(AWFaceDetectMetadata *)a5
{
  v15.receiver = self;
  v15.super_class = (Class)AWFaceDetectAttentionEvent;
  uint64_t v6 = [(AWAttentionEvent *)&v15 initWithTimestamp:a4 tagIndex:128 eventMask:a3];
  v7 = v6;
  if (a5 && v6)
  {
    v6->_BOOL metadataValid = a5->var0;
    v6->_double pitch = a5->var1;
    v6->_double yaw = a5->var2;
    v6->_double roll = a5->var3;
    v6->_orientation = a5->var4;
    v6->_double distance = a5->var5;
    v6->_faceState = a5->var6;
    v6->_unint64_t metadataType = a5->var7;
    v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:16];
    for (uint64_t i = 0; i != 16; ++i)
    {
      *(float *)&double v9 = a5->var8[i];
      v11 = [NSNumber numberWithFloat:v9];
      [v8 addObject:v11];
    }
    uint64_t v12 = [v8 copy];

    motionData = v7->_motionData;
    v7->_motionData = (NSArray *)v12;

    v7->_unint64_t motionResult = a5->var9;
    v7->_double attentionScore = a5->var10;
    v7->_double faceDetectionScore = a5->var11;
  }
  return v7;
}

- (void)validateMask
{
  if ([(AWAttentionEvent *)self eventMask] != 128) {
    __assert_rtn("-[AWFaceDetectAttentionEvent validateMask]", "SimpleFrameworkTypes.m", 922, "self.eventMask == AWAttentionEventMaskFaceDetect");
  }
}

- (AWFaceDetectAttentionEvent)initWithCoder:(id)a3
{
  v71[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v49 = 0;
  double v5 = decodeDouble(v4, &v49, @"timestamp");
  uint64_t v48 = decodeUInt64(v4, &v49, @"metadataValid");
  double v6 = decodeDouble(v4, &v49, @"pitch");
  double v7 = decodeDouble(v4, &v49, @"yaw");
  double v8 = decodeDouble(v4, &v49, @"roll");
  uint64_t v47 = decodeUInt64(v4, &v49, @"orientation");
  double v9 = decodeDouble(v4, &v49, @"distance");
  uint64_t v46 = decodeUInt64(v4, &v49, @"faceState");
  uint64_t v45 = decodeUInt64(v4, &v49, @"metadataType");
  uint64_t v10 = decodeUInt64(v4, &v49, @"tagIndex");
  id v11 = v4;
  uint64_t v12 = @"motionData";
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v71[0] = objc_opt_class();
  v71[1] = objc_opt_class();
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  objc_super v15 = [v13 setWithArray:v14];
  v16 = [v11 decodeObjectOfClasses:v15 forKey:@"motionData"];

  unint64_t v17 = 0x1EB801000;
  if (!v16)
  {
    if ([v11 containsValueForKey:@"motionData"])
    {
      id v23 = 0;
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_15:
    if (*(int *)(v17 + 2856) >= 3)
    {
      unint64_t v24 = v17;
      v25 = _AALog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        unint64_t v37 = absTimeNS();
        if (v37 == -1) {
          double v38 = INFINITY;
        }
        else {
          double v38 = (double)v37 / 1000000000.0;
        }
        int buf = 134218242;
        double v68 = v38;
        __int16 v69 = 2112;
        v70 = @"motionData";
        _os_log_error_impl(&dword_1B3B4B000, v25, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", (uint8_t *)&buf, 0x16u);
      }

      unint64_t v17 = v24;
    }
    id v23 = 0;
    char v49 = 1;
    goto LABEL_19;
  }
  uint64_t v43 = v10;
  v44 = self;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v51;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v51 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          uint64_t v10 = v43;
          self = v44;
          unint64_t v17 = 0x1EB801000uLL;
          goto LABEL_15;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  id v23 = v18;
  uint64_t v10 = v43;
  self = v44;
  unint64_t v17 = 0x1EB801000;
LABEL_19:

  uint64_t v26 = decodeUInt64(v11, &v49, @"motionResult");
  double v27 = decodeDouble(v11, &v49, @"attentionScore");
  double v28 = decodeDouble(v11, &v49, @"faceDetectionScore");
  if (v49)
  {
    if (*(int *)(v17 + 2856) >= 3)
    {
      v29 = _AALog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        unint64_t v39 = absTimeNS();
        if (v39 == -1) {
          double v40 = INFINITY;
        }
        else {
          double v40 = (double)v39 / 1000000000.0;
        }
        v41 = (objc_class *)objc_opt_class();
        v42 = NSStringFromClass(v41);
        *(_DWORD *)v54 = 134218242;
        *(double *)&v54[4] = v40;
        *(_WORD *)&v54[12] = 2112;
        *(void *)&v54[14] = v42;
        _os_log_error_impl(&dword_1B3B4B000, v29, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", v54, 0x16u);
      }
    }
    v30 = 0;
  }
  else
  {
    uint64_t v31 = 0;
    *(void *)v54 = v48 != 0;
    *(double *)&v54[8] = v6;
    *(double *)&v54[16] = v7;
    double v55 = v8;
    uint64_t v56 = v47;
    double v57 = v9;
    uint64_t v58 = v46;
    uint64_t v59 = v45;
    memset(v60, 0, sizeof(v60));
    uint64_t v61 = v26;
    float v32 = v27;
    float v33 = v28;
    float v62 = v32;
    float v63 = v33;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v66 = 0;
    do
    {
      v34 = [v23 objectAtIndexedSubscript:v31];
      [v34 floatValue];
      *((_DWORD *)v60 + v31) = v35;

      ++v31;
    }
    while (v31 != 16);
    v30 = [[AWFaceDetectAttentionEvent alloc] initWithTimestamp:v10 tagIndex:v54 faceMetadata:v5];
  }

  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [(AWAttentionEvent *)self timestamp];
  objc_msgSend(v5, "encodeDouble:forKey:", @"timestamp");
  [v5 encodeBool:self->_metadataValid forKey:@"metadataValid"];
  [v5 encodeDouble:@"pitch" forKey:self->_pitch];
  [v5 encodeDouble:@"yaw" forKey:self->_yaw];
  [v5 encodeDouble:@"roll" forKey:self->_roll];
  [v5 encodeInteger:self->_orientation forKey:@"orientation"];
  [v5 encodeDouble:@"distance" forKey:self->_distance];
  [v5 encodeDouble:@"faceState" forKey:(double)self->_faceState];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AWAttentionEvent tagIndex](self, "tagIndex"));
  [v5 encodeObject:v4 forKey:@"tagIndex"];

  [v5 encodeDouble:@"metadataType" forKey:(double)self->_metadataType];
  [v5 encodeObject:self->_motionData forKey:@"motionData"];
  [v5 encodeInt64:self->_motionResult forKey:@"motionResult"];
  [v5 encodeDouble:@"attentionScore" forKey:self->_attentionScore];
  [v5 encodeDouble:@"faceDetectionScore" forKey:self->_faceDetectionScore];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end