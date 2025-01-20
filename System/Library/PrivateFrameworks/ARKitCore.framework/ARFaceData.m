@interface ARFaceData
+ (BOOL)supportsSecureCoding;
- (ARFaceData)init;
- (ARFaceData)initWithCoder:(id)a3;
- (ARFaceData)initWithMetadataObjects:(id)a3 mirroredVideoInput:(BOOL)a4 stripDetectionData:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMirrored;
- (NSArray)detectedFaces;
- (NSDictionary)faceMeshPayload;
- (void)encodeWithCoder:(id)a3;
- (void)setDetectedFaces:(id)a3;
- (void)setFaceMeshPayload:(id)a3;
- (void)setMirrored:(BOOL)a3;
@end

@implementation ARFaceData

- (ARFaceData)init
{
  v6.receiver = self;
  v6.super_class = (Class)ARFaceData;
  v2 = [(ARFaceData *)&v6 init];
  v3 = v2;
  if (v2)
  {
    detectedFaces = v2->_detectedFaces;
    v2->_detectedFaces = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (ARFaceData)initWithMetadataObjects:(id)a3 mirroredVideoInput:(BOOL)a4 stripDetectionData:(BOOL)a5
{
  BOOL v46 = a5;
  BOOL v5 = a4;
  v44 = self;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v47 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  BOOL v45 = v5;
  if (!v7)
  {
    v9 = 0;
    goto LABEL_28;
  }
  uint64_t v8 = v7;
  v9 = 0;
  uint64_t v10 = *(void *)v55;
  uint64_t v11 = *MEMORY[0x1E4F15E30];
  uint64_t v12 = *MEMORY[0x1E4F15E48];
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v55 != v10) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v54 + 1) + 8 * v13);
      v15 = objc_msgSend(v14, "type", v44);
      int v16 = [v15 isEqual:v11];

      if (v16)
      {
        v17 = v14;
        [(ARHWFaceDetection *)v17 bounds];
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        uint64_t v26 = [(ARHWFaceDetection *)v17 faceID];
        int v27 = [(ARHWFaceDetection *)v17 hasRollAngle];
        double v28 = 0.0;
        if (v27) {
          [(ARHWFaceDetection *)v17 rollAngle];
        }
        if (v5) {
          double v29 = 180.0 - v28;
        }
        else {
          double v29 = v28;
        }
        if (v5) {
          double v21 = 1.0 - v21 - v25;
        }
        v30 = objc_alloc_init(ARHWFaceDetection);
        [(ARHWFaceDetection *)v30 setID:v26];
        [(ARHWFaceDetection *)v30 setRollAngleInDegrees:v29];
        -[ARHWFaceDetection setBoundingBox:](v30, "setBoundingBox:", v19, v21, v23, v25);
        [(ARHWFaceDetection *)v30 setDetectionOrientation:3];
        if (v17)
        {
          [(ARHWFaceDetection *)v17 time];
        }
        else
        {
          long long v52 = 0uLL;
          uint64_t v53 = 0;
        }
        long long v50 = v52;
        uint64_t v51 = v53;
        [(ARHWFaceDetection *)v30 setTime:&v50];
        [v47 addObject:v30];
      }
      else
      {
        v31 = [v14 type];
        int v32 = [v31 isEqual:v12];

        if (!v32) {
          goto LABEL_22;
        }
        v17 = v14;
        v33 = [(ARHWFaceDetection *)v17 payload];
        v34 = v33;
        if (v46)
        {
          uint64_t v35 = ARFilterFaceTrackingPayload(v33);

          v30 = v17;
          v17 = v34;
          v9 = (ARHWFaceDetection *)v35;
          BOOL v5 = v45;
        }
        else
        {
          v30 = v9;
          v9 = v33;
        }
      }

LABEL_22:
      ++v13;
    }
    while (v8 != v13);
    uint64_t v36 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    uint64_t v8 = v36;
  }
  while (v36);
LABEL_28:

  if (![v47 count])
  {
    v37 = [(ARHWFaceDetection *)v9 objectForKeyedSubscript:*MEMORY[0x1E4F4D730]];
    if ([v37 count])
    {
      unint64_t v38 = 0;
      do
      {
        v39 = objc_msgSend(v37, "objectAtIndexedSubscript:", v38, v44);
        v40 = +[ARHWFaceDetection faceDetectionFromDictionary:v39];

        if (v40) {
          [v47 addObject:v40];
        }

        ++v38;
      }
      while ([v37 count] > v38);
    }

    LOBYTE(v5) = v45;
  }
  v49.receiver = v44;
  v49.super_class = (Class)ARFaceData;
  v41 = [(ARFaceData *)&v49 init];
  v42 = v41;
  if (v41)
  {
    objc_storeStrong((id *)&v41->_detectedFaces, v47);
    objc_storeStrong((id *)&v42->_faceMeshPayload, v9);
    v42->_mirrored = v5;
  }

  return v42;
}

- (ARFaceData)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ARFaceData;
  BOOL v5 = [(ARFaceData *)&v23 init];
  if (v5)
  {
    [MEMORY[0x1E4F28DC0] setClass:objc_opt_class() forClassName:@"AVTFaceDetection"];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"detectedFaces"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        while (2)
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_13;
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      [(ARFaceData *)v5 setDetectedFaces:v10];
    }
LABEL_13:
    v15 = ARApprovedDecoderClasses();
    int v16 = [v4 decodeObjectOfClasses:v15 forKey:@"faceMeshPayload"];

    if ([v4 containsValueForKey:@"mirrored"]) {
      char v17 = [v4 decodeBoolForKey:@"mirrored"];
    }
    else {
      char v17 = 1;
    }
    v5->_mirrored = v17;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ARFaceData *)v5 setFaceMeshPayload:v16];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  detectedFaces = self->_detectedFaces;
  id v5 = a3;
  [v5 encodeObject:detectedFaces forKey:@"detectedFaces"];
  [v5 encodeObject:self->_faceMeshPayload forKey:@"faceMeshPayload"];
  [v5 encodeBool:self->_mirrored forKey:@"mirrored"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (unsigned __int8 *)v4;
    faceMeshPayload = self->_faceMeshPayload;
    uint64_t v7 = [v5 faceMeshPayload];
    if ([(NSDictionary *)faceMeshPayload isEqual:v7])
    {
      detectedFaces = self->_detectedFaces;
      v9 = [v5 detectedFaces];
      if ([(NSArray *)detectedFaces isEqual:v9]) {
        BOOL v10 = self->_mirrored == v5[8];
      }
      else {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSArray)detectedFaces
{
  return self->_detectedFaces;
}

- (void)setDetectedFaces:(id)a3
{
}

- (NSDictionary)faceMeshPayload
{
  return self->_faceMeshPayload;
}

- (void)setFaceMeshPayload:(id)a3
{
}

- (BOOL)isMirrored
{
  return self->_mirrored;
}

- (void)setMirrored:(BOOL)a3
{
  self->_mirrored = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceMeshPayload, 0);
  objc_storeStrong((id *)&self->_detectedFaces, 0);
}

@end