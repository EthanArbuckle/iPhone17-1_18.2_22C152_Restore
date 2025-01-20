@interface CNDetection
+ (BOOL)isValidDetectionGroupID:(CNDetectionGroupID)detectionGroupID;
+ (BOOL)isValidDetectionID:(CNDetectionID)detectionID;
+ (NSString)accessibilityLabelForDetectionType:(CNDetectionType)detectionType;
+ (float)disparityInNormalizedRect:(CGRect)normalizedRect sourceDisparity:(CVPixelBufferRef)sourceDisparity detectionType:(CNDetectionType)detectionType priorDisparity:(float)priorDisparity;
+ (id)_copyDetectionFromInternal:(id)a3;
+ (id)_copyDetectionsFromInternal:(id)a3;
+ (id)_copyInternalFromDetections:(id)a3;
+ (int64_t)invalidDetectionGroupID;
+ (int64_t)invalidDetectionID;
- (BOOL)_integrityCheck;
- (BOOL)isEqual:(id)a3;
- (CGRect)normalizedRect;
- (CMTime)time;
- (CNDetection)initWithTime:(CMTime *)time detectionType:(CNDetectionType)detectionType normalizedRect:(CGRect)normalizedRect focusDisparity:(float)focusDisparity;
- (CNDetectionGroupID)detectionGroupID;
- (CNDetectionID)detectionID;
- (CNDetectionType)detectionType;
- (PTCinematographyDetection)internalDetection;
- (float)focusDisparity;
- (id)_initCopyingInternalDetection:(id)a3;
- (id)_initTakingInternalDetection:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)creationHash;
- (unint64_t)hash;
- (void)setCreationHash:(unint64_t)a3;
- (void)setInternalDetection:(id)a3;
@end

@implementation CNDetection

- (CNDetection)initWithTime:(CMTime *)time detectionType:(CNDetectionType)detectionType normalizedRect:(CGRect)normalizedRect focusDisparity:(float)focusDisparity
{
  double height = normalizedRect.size.height;
  double width = normalizedRect.size.width;
  double y = normalizedRect.origin.y;
  double x = normalizedRect.origin.x;
  id v14 = objc_alloc(MEMORY[0x263F5F2A8]);
  CMTime v19 = *time;
  *(float *)&double v15 = focusDisparity;
  v16 = objc_msgSend(v14, "initWithTime:rect:focusDistance:", &v19, x, y, width, height, v15);
  [v16 setDetectionType:detectionType];
  [v16 setTrackIdentifier:-1];
  [v16 setGroupIdentifier:-1];
  v17 = [(CNDetection *)self _initTakingInternalDetection:v16];

  return v17;
}

- (CMTime)time
{
  result = (CMTime *)self->_internalDetection;
  if (result) {
    return (CMTime *)[(CMTime *)result time];
  }
  retstr->value = 0;
  *(void *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (CNDetectionType)detectionType
{
  return [(PTCinematographyDetection *)self->_internalDetection detectionType];
}

- (CNDetectionID)detectionID
{
  return [(PTCinematographyDetection *)self->_internalDetection trackIdentifier];
}

- (CNDetectionGroupID)detectionGroupID
{
  return [(PTCinematographyDetection *)self->_internalDetection groupIdentifier];
}

- (CGRect)normalizedRect
{
  [(PTCinematographyDetection *)self->_internalDetection rect];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (float)focusDisparity
{
  [(PTCinematographyDetection *)self->_internalDetection focusDistance];
  return result;
}

+ (int64_t)invalidDetectionID
{
  return -1;
}

+ (int64_t)invalidDetectionGroupID
{
  return -1;
}

+ (NSString)accessibilityLabelForDetectionType:(CNDetectionType)detectionType
{
  return (NSString *)[MEMORY[0x263F5F2A8] accessibilityLabelForDetectionType:detectionType];
}

+ (BOOL)isValidDetectionID:(CNDetectionID)detectionID
{
  return MEMORY[0x270F550B8](detectionID, a2);
}

+ (BOOL)isValidDetectionGroupID:(CNDetectionGroupID)detectionGroupID
{
  return MEMORY[0x270F550B0](detectionGroupID, a2);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(CNDetection *)self internalDetection];
    v7 = [v5 internalDetection];

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
  double v2 = [(CNDetection *)self internalDetection];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  internalDetection = self->_internalDetection;

  return (id)[v4 _initCopyingInternalDetection:internalDetection];
}

- (id)_initTakingInternalDetection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNDetection;
  v6 = [(CNDetection *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internalDetection, a3);
    v7->_creationHash = [(CNDetection *)v7 hash];
  }

  return v7;
}

- (id)_initCopyingInternalDetection:(id)a3
{
  id v4 = (void *)[a3 copy];
  id v5 = [(CNDetection *)self _initTakingInternalDetection:v4];

  return v5;
}

+ (float)disparityInNormalizedRect:(CGRect)normalizedRect sourceDisparity:(CVPixelBufferRef)sourceDisparity detectionType:(CNDetectionType)detectionType priorDisparity:(float)priorDisparity
{
  PTDisparityInNormalizedRectFromPixelBufferWithPrior();
  return result;
}

- (PTCinematographyDetection)internalDetection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalDetection:(id)a3
{
}

- (unint64_t)creationHash
{
  return self->_creationHash;
}

- (void)setCreationHash:(unint64_t)a3
{
  self->_creationHash = a3;
}

- (void).cxx_destruct
{
}

+ (id)_copyDetectionFromInternal:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) _initCopyingInternalDetection:v4];

  return v5;
}

+ (id)_copyDetectionsFromInternal:(id)a3
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
        v11 = objc_msgSend(a1, "_copyDetectionFromInternal:", *(void *)(*((void *)&v14 + 1) + 8 * v10), (void)v14);
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

+ (id)_copyInternalFromDetections:(id)a3
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
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "internalDetection", (void)v14);
        v11 = (void *)[v10 copy];
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

- (BOOL)_integrityCheck
{
  return [(CNDetection *)self hash] == self->_creationHash;
}

@end