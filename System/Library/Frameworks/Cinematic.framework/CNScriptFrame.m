@interface CNScriptFrame
+ (id)_copyFrameFromInternal:(id)a3;
+ (id)_copyFramesFromInternal:(id)a3;
+ (id)_copyInternalFromFrames:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CMTime)time;
- (CNDetection)bestDetectionForGroupID:(CNDetectionGroupID)detectionGroupID;
- (CNDetection)detectionForID:(CNDetectionID)detectionID;
- (CNDetection)focusDetection;
- (CNScriptFrame)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (CNScriptFrame)initWithTimedMetadataGroup:(id)a3;
- (NSArray)allDetections;
- (PTCinematographyFrame)internalFrame;
- (float)focusDisparity;
- (id)_initCopyingInternalFrame:(id)a3;
- (id)_initTakingInternalFrame:(id)a3;
- (id)_initWithTimedData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setInternalFrame:(id)a3;
@end

@implementation CNScriptFrame

- (CNScriptFrame)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x263EFA8C0]) initWithSampleBuffer:a3];
  v5 = [(CNScriptFrame *)self initWithTimedMetadataGroup:v4];

  return v5;
}

- (CNScriptFrame)initWithTimedMetadataGroup:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = objc_msgSend(a3, "items", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = [v9 key];
        int v11 = [v10 isEqual:0x26F895670];

        if (v11)
        {
          v13 = [v9 value];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v15 = [v9 value];
            self = (CNScriptFrame *)[(CNScriptFrame *)self _initWithTimedData:v15];
            v12 = self;
          }
          else
          {
            v15 = _CNLogSystem();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[CNRenderingSessionFrameAttributes initWithTimedMetadataGroup:sessionAttributes:](0x26F895670, v9, v15);
            }
            v12 = 0;
          }

          goto LABEL_16;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (CMTime)time
{
  result = (CMTime *)self->_internalFrame;
  if (result) {
    return (CMTime *)[(CMTime *)result time];
  }
  retstr->value = 0;
  *(void *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (float)focusDisparity
{
  [(PTCinematographyFrame *)self->_internalFrame focusDistance];
  return result;
}

- (CNDetection)focusDetection
{
  v3 = [(PTCinematographyFrame *)self->_internalFrame focusDetection];
  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F5F2A8]);
    [(CNScriptFrame *)self time];
    [(CNScriptFrame *)self focusDisparity];
    LODWORD(v6) = v5;
    v3 = objc_msgSend(v4, "initWithTime:rect:focusDistance:", v9, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), v6);
    [v3 setDetectionType:0];
    objc_msgSend(v3, "setTrackIdentifier:", -[PTCinematographyFrame focusTrackIdentifier](self->_internalFrame, "focusTrackIdentifier"));
    objc_msgSend(v3, "setGroupIdentifier:", -[PTCinematographyFrame focusGroupIdentifier](self->_internalFrame, "focusGroupIdentifier"));
  }
  id v7 = +[CNDetection _copyDetectionFromInternal:v3];

  return (CNDetection *)v7;
}

- (NSArray)allDetections
{
  v2 = [(PTCinematographyFrame *)self->_internalFrame allDetections];
  id v3 = +[CNDetection _copyDetectionsFromInternal:v2];

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    double v6 = [(CNScriptFrame *)self internalFrame];
    id v7 = [v5 internalFrame];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(CNScriptFrame *)self internalFrame];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  internalFrame = self->_internalFrame;

  return (id)[v4 _initCopyingInternalFrame:internalFrame];
}

- (id)_initTakingInternalFrame:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNScriptFrame;
  double v6 = [(CNScriptFrame *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internalFrame, a3);
  }

  return v7;
}

- (id)_initCopyingInternalFrame:(id)a3
{
  id v4 = (void *)[a3 copy];
  id v5 = [(CNScriptFrame *)self _initTakingInternalFrame:v4];

  return v5;
}

- (id)_initWithTimedData:(id)a3
{
  id v4 = [MEMORY[0x263F5F2F0] objectFromData:a3 error:0];
  if (v4)
  {
    self = (CNScriptFrame *)[(CNScriptFrame *)self _initTakingInternalFrame:v4];
    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (PTCinematographyFrame)internalFrame
{
  return (PTCinematographyFrame *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalFrame:(id)a3
{
}

- (void).cxx_destruct
{
}

- (CNDetection)detectionForID:(CNDetectionID)detectionID
{
  id v4 = [(CNScriptFrame *)self internalFrame];
  id v5 = [v4 detectionForTrackIdentifier:detectionID];

  if (v5) {
    id v6 = +[CNDetection _copyDetectionFromInternal:v5];
  }
  else {
    id v6 = 0;
  }

  return (CNDetection *)v6;
}

- (CNDetection)bestDetectionForGroupID:(CNDetectionGroupID)detectionGroupID
{
  id v4 = [(CNScriptFrame *)self internalFrame];
  id v5 = [v4 bestDetectionForGroupIdentifier:detectionGroupID];

  if (v5) {
    id v6 = +[CNDetection _copyDetectionFromInternal:v5];
  }
  else {
    id v6 = 0;
  }

  return (CNDetection *)v6;
}

+ (id)_copyFrameFromInternal:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) _initCopyingInternalFrame:v4];

  return v5;
}

+ (id)_copyFramesFromInternal:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = objc_msgSend(a1, "_copyFrameFromInternal:", *(void *)(*((void *)&v14 + 1) + 8 * v10), (void)v14);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  return v12;
}

+ (id)_copyInternalFromFrames:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "internalFrame", (void)v14);
        int v11 = (void *)[v10 copy];
        [v4 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = (void *)[v4 copy];
  return v12;
}

@end