@interface ARFrameContext
+ (BOOL)supportsSecureCoding;
- (ARDeviceOrientationData)orientationData;
- (ARFrameContext)init;
- (ARFrameContext)initWithCoder:(id)a3;
- (ARImageData)imageData;
- (ARLocationData)locationData;
- (ARWorldMap)worldMap;
- (BOOL)didRelocalize;
- (BOOL)isEqual:(id)a3;
- (BOOL)sessionTransformReset;
- (BOOL)sessionTransformShouldResumeCameraHeading;
- (BOOL)sessionTransformShouldResumeCameraPosition;
- (BOOL)sessionTransformUpdated;
- (NSArray)anchorsToAdd;
- (NSArray)anchorsToRemove;
- (NSArray)anchorsToStopTracking;
- (NSSet)collaborationData;
- (NSString)description;
- (__n128)relocalizationDeltaTransform;
- (__n128)sessionTransform;
- (__n128)setRelocalizationDeltaTransform:(__n128)a3;
- (double)setSessionTransform:(__n128)a3;
- (id)resultDataOfClass:(Class)a3;
- (int64_t)cameraPosition;
- (int64_t)worldAlignment;
- (unint64_t)frameDebugOptions;
- (unint64_t)hash;
- (void)addAnchor:(id)a3;
- (void)clearAddedAnchors;
- (void)encodeWithCoder:(id)a3;
- (void)removeAnchor:(id)a3;
- (void)resetSessionTransform;
- (void)resumeSessionCameraPosition;
- (void)resumeSessionCameraPositionAndHeading;
- (void)setAnchorsToAdd:(id)a3;
- (void)setAnchorsToRemove:(id)a3;
- (void)setAnchorsToStopTracking:(id)a3;
- (void)setCollaborationData:(id)a3;
- (void)setDidRelocalize:(BOOL)a3;
- (void)setFrameDebugOptions:(unint64_t)a3;
- (void)setImageData:(id)a3;
- (void)setLocationData:(id)a3;
- (void)setOrientationData:(id)a3;
- (void)setSessionTransformReset:(BOOL)a3;
- (void)setSessionTransformUpdated:(BOOL)a3;
- (void)setWorldAlignment:(int64_t)a3;
- (void)setWorldMap:(id)a3;
- (void)stopTrackingAnchors:(id)a3;
@end

@implementation ARFrameContext

- (ARFrameContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)ARFrameContext;
  v2 = [(ARFrameContext *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    uint64_t v5 = objc_opt_new();
    collaborationData = v2->_collaborationData;
    v2->_collaborationData = (NSSet *)v5;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ARFrameContext *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSUUID *)self->_identifier isEqual:v4->_identifier];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARFrameContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ARFrameContext;
  char v5 = [(ARFrameContext *)&v36 init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"identifier"];
    v7 = v6;
    if (v6) {
      objc_super v8 = v6;
    }
    else {
      objc_super v8 = (NSUUID *)objc_opt_new();
    }
    identifier = v5->_identifier;
    v5->_identifier = v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (ARImageData *)v10;

    uint64_t v12 = [v4 decodeObjectForKey:@"orientationData"];
    orientationData = v5->_orientationData;
    v5->_orientationData = (ARDeviceOrientationData *)v12;

    uint64_t v14 = [v4 decodeObjectForKey:@"locationData"];
    locationData = v5->_locationData;
    v5->_locationData = (ARLocationData *)v14;

    v5->_worldAlignment = [v4 decodeIntegerForKey:@"worldAlignment"];
    uint64_t v16 = [v4 decodeObjectForKey:@"worldMap"];
    worldMap = v5->_worldMap;
    v5->_worldMap = (ARWorldMap *)v16;

    v18 = [v4 decodeObjectForKey:@"frameDebugOptions"];
    v5->_frameDebugOptions = [v18 unsignedIntegerValue];

    v5->_didRelocalize = [v4 decodeBoolForKey:@"didRelocalize"];
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"relocalizationDeltaTransform");
    *(_OWORD *)&v5[1].super.isa = v19;
    *(_OWORD *)&v5[1]._anchorsToAdd = v20;
    *(_OWORD *)&v5[1]._anchorsToStopTracking = v21;
    *(_OWORD *)&v5[1]._imageData = v22;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"sessionTransform");
    *(_OWORD *)v5->_anon_70 = v23;
    *(_OWORD *)&v5->_anon_70[16] = v24;
    *(_OWORD *)&v5->_anon_70[32] = v25;
    *(_OWORD *)&v5->_anon_70[48] = v26;
    v5->_sessionTransformUpdated = [v4 decodeBoolForKey:@"sessionTransformUpdated"];
    v5->_sessionTransformReset = [v4 decodeBoolForKey:@"sessionTransformReset"];
    v5->_sessionTransformShouldResumeCameraHeading = [v4 decodeBoolForKey:@"sessionTransformShouldResumeCameraHeading"];
    v5->_sessionTransformShouldResumeCameraPosition = [v4 decodeBoolForKey:@"sessionTransformShouldResumeCameraPosition"];
    uint64_t v27 = [v4 decodeObjectForKey:@"anchorsToAdd"];
    anchorsToAdd = v5->_anchorsToAdd;
    v5->_anchorsToAdd = (NSMutableArray *)v27;

    uint64_t v29 = [v4 decodeObjectForKey:@"anchorsToRemove"];
    anchorsToRemove = v5->_anchorsToRemove;
    v5->_anchorsToRemove = (NSMutableArray *)v29;

    uint64_t v31 = [v4 decodeObjectForKey:@"anchorsToStopTracking"];
    anchorsToStopTracking = v5->_anchorsToStopTracking;
    v5->_anchorsToStopTracking = (NSMutableArray *)v31;

    uint64_t v33 = [v4 decodeObjectForKey:@"collaborationData"];
    collaborationData = v5->_collaborationData;
    v5->_collaborationData = (NSSet *)v33;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"identifier"];
  [v6 encodeObject:self->_imageData forKey:@"imageData"];
  [v6 encodeObject:self->_orientationData forKey:@"orientationData"];
  [v6 encodeObject:self->_locationData forKey:@"locationData"];
  [v6 encodeInteger:self->_worldAlignment forKey:@"worldAlignment"];
  [v6 encodeObject:self->_worldMap forKey:@"worldMap"];
  char v5 = [NSNumber numberWithUnsignedInteger:self->_frameDebugOptions];
  [v6 encodeObject:v5 forKey:@"frameDebugOptions"];

  [v6 encodeBool:self->_didRelocalize forKey:@"didRelocalize"];
  objc_msgSend(v6, "ar_encodeMatrix4x4:forKey:", @"relocalizationDeltaTransform", *(double *)&self[1].super.isa, *(double *)&self[1]._anchorsToAdd, *(double *)&self[1]._anchorsToStopTracking, *(double *)&self[1]._imageData);
  objc_msgSend(v6, "ar_encodeMatrix4x4:forKey:", @"sessionTransform", *(double *)self->_anon_70, *(double *)&self->_anon_70[16], *(double *)&self->_anon_70[32], *(double *)&self->_anon_70[48]);
  [v6 encodeBool:self->_sessionTransformUpdated forKey:@"sessionTransformUpdated"];
  [v6 encodeBool:self->_sessionTransformReset forKey:@"sessionTransformReset"];
  [v6 encodeBool:self->_sessionTransformShouldResumeCameraHeading forKey:@"sessionTransformShouldResumeCameraHeading"];
  [v6 encodeBool:self->_sessionTransformShouldResumeCameraPosition forKey:@"sessionTransformShouldResumeCameraPosition"];
  [v6 encodeObject:self->_anchorsToAdd forKey:@"anchorsToAdd"];
  [v6 encodeObject:self->_anchorsToRemove forKey:@"anchorsToRemove"];
  [v6 encodeObject:self->_anchorsToStopTracking forKey:@"anchorsToStopTracking"];
  [v6 encodeObject:self->_collaborationData forKey:@"collaborationData"];
}

- (double)setSessionTransform:(__n128)a3
{
  a1[7] = a2;
  a1[8] = a3;
  a1[9] = a4;
  a1[10] = a5;
  *(void *)&double result = 0x100000001;
  a1[2].n128_u32[2] = 1;
  return result;
}

- (void)resetSessionTransform
{
  uint64_t v2 = MEMORY[0x1E4F149A0];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
  *(_OWORD *)self->_anon_70 = *MEMORY[0x1E4F149A0];
  *(_OWORD *)&self->_anon_70[16] = v3;
  long long v4 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)&self->_anon_70[32] = *(_OWORD *)(v2 + 32);
  *(_OWORD *)&self->_anon_70[48] = v4;
  *(_DWORD *)&self->_sessionTransformUpdated = 257;
}

- (void)resumeSessionCameraPosition
{
  self->_sessionTransformShouldResumeCameraPosition = 1;
  self->_sessionTransformReset = 0;
}

- (void)resumeSessionCameraPositionAndHeading
{
  self->_sessionTransformShouldResumeCameraPosition = 1;
  *(_WORD *)&self->_sessionTransformReset = 256;
}

- (NSArray)anchorsToAdd
{
  return (NSArray *)self->_anchorsToAdd;
}

- (NSArray)anchorsToRemove
{
  return (NSArray *)self->_anchorsToRemove;
}

- (NSArray)anchorsToStopTracking
{
  return (NSArray *)self->_anchorsToStopTracking;
}

- (void)addAnchor:(id)a3
{
  id v4 = a3;
  anchorsToAdd = self->_anchorsToAdd;
  id v8 = v4;
  if (!anchorsToAdd)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_anchorsToAdd;
    self->_anchorsToAdd = v6;

    id v4 = v8;
    anchorsToAdd = self->_anchorsToAdd;
  }
  [(NSMutableArray *)anchorsToAdd addObject:v4];
}

- (void)clearAddedAnchors
{
}

- (void)removeAnchor:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!self->_anchorsToRemove)
  {
    char v5 = (NSMutableArray *)objc_opt_new();
    anchorsToRemove = self->_anchorsToRemove;
    self->_anchorsToRemove = v5;

    id v4 = v7;
  }
  [(NSMutableArray *)self->_anchorsToAdd removeObject:v4];
  [(NSMutableArray *)self->_anchorsToRemove addObject:v7];
}

- (void)stopTrackingAnchors:(id)a3
{
  id v4 = a3;
  anchorsToStopTracking = self->_anchorsToStopTracking;
  id v8 = v4;
  if (!anchorsToStopTracking)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    id v7 = self->_anchorsToStopTracking;
    self->_anchorsToStopTracking = v6;

    id v4 = v8;
    anchorsToStopTracking = self->_anchorsToStopTracking;
  }
  [(NSMutableArray *)anchorsToStopTracking addObjectsFromArray:v4];
}

- (void)setSessionTransformReset:(BOOL)a3
{
  self->_sessionTransformReset = a3;
}

- (void)setSessionTransformUpdated:(BOOL)a3
{
  self->_sessionTransformUpdated = a3;
}

- (void)setAnchorsToAdd:(id)a3
{
  id v4 = (NSMutableArray *)[a3 mutableCopy];
  anchorsToAdd = self->_anchorsToAdd;
  self->_anchorsToAdd = v4;
}

- (void)setAnchorsToRemove:(id)a3
{
  id v4 = (NSMutableArray *)[a3 mutableCopy];
  anchorsToRemove = self->_anchorsToRemove;
  self->_anchorsToRemove = v4;
}

- (void)setAnchorsToStopTracking:(id)a3
{
  id v4 = (NSMutableArray *)[a3 mutableCopy];
  anchorsToStopTracking = self->_anchorsToStopTracking;
  self->_anchorsToStopTracking = v4;
}

- (int64_t)cameraPosition
{
  uint64_t v2 = [(ARFrameContext *)self imageData];
  int64_t v3 = [v2 cameraPosition];

  return v3;
}

- (id)resultDataOfClass:(Class)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSString)description
{
  int64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)ARFrameContext;
  id v4 = [(ARFrameContext *)&v8 description];
  char v5 = [v3 stringWithFormat:@"%@\n", v4];

  [v5 appendFormat:@"identifier: %@\n", self->_identifier];
  id v6 = [(ARFrameContext *)self imageData];
  [v5 appendFormat:@"imageData: %@\n", v6];

  return (NSString *)v5;
}

- (ARImageData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (ARDeviceOrientationData)orientationData
{
  return self->_orientationData;
}

- (void)setOrientationData:(id)a3
{
}

- (ARLocationData)locationData
{
  return self->_locationData;
}

- (void)setLocationData:(id)a3
{
}

- (int64_t)worldAlignment
{
  return self->_worldAlignment;
}

- (void)setWorldAlignment:(int64_t)a3
{
  self->_worldAlignment = a3;
}

- (ARWorldMap)worldMap
{
  return self->_worldMap;
}

- (void)setWorldMap:(id)a3
{
}

- (unint64_t)frameDebugOptions
{
  return self->_frameDebugOptions;
}

- (void)setFrameDebugOptions:(unint64_t)a3
{
  self->_frameDebugOptions = a3;
}

- (NSSet)collaborationData
{
  return self->_collaborationData;
}

- (void)setCollaborationData:(id)a3
{
}

- (__n128)sessionTransform
{
  return a1[7];
}

- (BOOL)sessionTransformUpdated
{
  return self->_sessionTransformUpdated;
}

- (BOOL)sessionTransformReset
{
  return self->_sessionTransformReset;
}

- (BOOL)sessionTransformShouldResumeCameraHeading
{
  return self->_sessionTransformShouldResumeCameraHeading;
}

- (BOOL)sessionTransformShouldResumeCameraPosition
{
  return self->_sessionTransformShouldResumeCameraPosition;
}

- (BOOL)didRelocalize
{
  return self->_didRelocalize;
}

- (void)setDidRelocalize:(BOOL)a3
{
  self->_didRelocalize = a3;
}

- (__n128)relocalizationDeltaTransform
{
  return a1[11];
}

- (__n128)setRelocalizationDeltaTransform:(__n128)a3
{
  result[11] = a2;
  result[12] = a3;
  result[13] = a4;
  result[14] = a5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationData, 0);
  objc_storeStrong((id *)&self->_worldMap, 0);
  objc_storeStrong((id *)&self->_locationData, 0);
  objc_storeStrong((id *)&self->_orientationData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_anchorsToStopTracking, 0);
  objc_storeStrong((id *)&self->_anchorsToRemove, 0);
  objc_storeStrong((id *)&self->_anchorsToAdd, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end