@interface ARImageTrackingTechnique
- (ARImageTrackingTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4;
- (ARImageTrackingTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4 deterministicMode:(BOOL)a5;
@end

@implementation ARImageTrackingTechnique

- (ARImageTrackingTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4
{
  return [(ARImageTrackingTechnique *)self initWithReferenceImages:a3 maximumNumberOfTrackedImages:a4 deterministicMode:0];
}

- (ARImageTrackingTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4 deterministicMode:(BOOL)a5
{
  id v7 = a3;
  v8 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.ARImageTrackingTechnique");
  v12.receiver = self;
  v12.super_class = (Class)ARImageTrackingTechnique;
  v9 = [(ARImageDetectionTechnique *)&v12 initWithReferenceImages:v7 maximumNumberOfTrackedImages:a4 continuousDetection:0 processingQueue:v8];
  v10 = v9;
  if (v9) {
    v9->super._needsWorldTrackingPoseData = 0;
  }

  return v10;
}

@end