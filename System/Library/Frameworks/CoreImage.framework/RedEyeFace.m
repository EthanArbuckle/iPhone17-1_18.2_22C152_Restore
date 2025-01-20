@interface RedEyeFace
- (CIImage)segmentationIris;
- (CIImage)segmentationSclera;
- (CIImage)segmentationSkin;
- (CIVector)faceRect;
- (CIVector)pupilLeft;
- (CIVector)pupilRight;
- (CIVector)roiRenderOriginLeft;
- (CIVector)roiRenderOriginRight;
- (CIVector)roiRenderSize;
- (NSArray)uvLeft;
- (NSArray)uvRight;
- (RedEyeFace)init;
- (VNFaceLandmarks2D)landmarks;
- (VNFaceObservation)observation;
- (float)areaMax;
- (float)faceOrientation;
- (float)junkiness;
- (int)imageOrientation;
- (void)dealloc;
- (void)setAreaMax:(float)a3;
- (void)setFaceOrientation:(float)a3;
- (void)setFaceRect:(id)a3;
- (void)setImageOrientation:(int)a3;
- (void)setJunkiness:(float)a3;
- (void)setLandmarks:(id)a3;
- (void)setObservation:(id)a3;
- (void)setPupilLeft:(id)a3;
- (void)setPupilRight:(id)a3;
- (void)setRoiRenderOriginLeft:(id)a3;
- (void)setRoiRenderOriginRight:(id)a3;
- (void)setRoiRenderSize:(id)a3;
- (void)setSegmentationIris:(id)a3;
- (void)setSegmentationSclera:(id)a3;
- (void)setSegmentationSkin:(id)a3;
- (void)setUvLeft:(id)a3;
- (void)setUvRight:(id)a3;
@end

@implementation RedEyeFace

- (RedEyeFace)init
{
  v3.receiver = self;
  v3.super_class = (Class)RedEyeFace;
  return [(RedEyeFace *)&v3 init];
}

- (void)dealloc
{
  [(RedEyeFace *)self setObservation:0];
  [(RedEyeFace *)self setLandmarks:0];
  [(RedEyeFace *)self setSegmentationSkin:0];
  [(RedEyeFace *)self setSegmentationSclera:0];
  [(RedEyeFace *)self setSegmentationIris:0];
  [(RedEyeFace *)self setUvLeft:0];
  [(RedEyeFace *)self setUvRight:0];
  [(RedEyeFace *)self setFaceRect:0];
  [(RedEyeFace *)self setRoiRenderOriginLeft:0];
  [(RedEyeFace *)self setRoiRenderOriginRight:0];
  [(RedEyeFace *)self setRoiRenderSize:0];
  [(RedEyeFace *)self setPupilLeft:0];
  [(RedEyeFace *)self setPupilRight:0];
  v3.receiver = self;
  v3.super_class = (Class)RedEyeFace;
  [(RedEyeFace *)&v3 dealloc];
}

- (int)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(int)a3
{
  self->_imageOrientation = a3;
}

- (float)faceOrientation
{
  return self->_faceOrientation;
}

- (void)setFaceOrientation:(float)a3
{
  self->_faceOrientation = a3;
}

- (float)junkiness
{
  return self->_junkiness;
}

- (void)setJunkiness:(float)a3
{
  self->_junkiness = a3;
}

- (float)areaMax
{
  return self->_areaMax;
}

- (void)setAreaMax:(float)a3
{
  self->_areaMax = a3;
}

- (VNFaceObservation)observation
{
  return self->_observation;
}

- (void)setObservation:(id)a3
{
}

- (VNFaceLandmarks2D)landmarks
{
  return self->_landmarks;
}

- (void)setLandmarks:(id)a3
{
}

- (CIImage)segmentationSkin
{
  return self->_segmentationSkin;
}

- (void)setSegmentationSkin:(id)a3
{
}

- (CIImage)segmentationSclera
{
  return self->_segmentationSclera;
}

- (void)setSegmentationSclera:(id)a3
{
}

- (CIImage)segmentationIris
{
  return self->_segmentationIris;
}

- (void)setSegmentationIris:(id)a3
{
}

- (NSArray)uvLeft
{
  return self->_uvLeft;
}

- (void)setUvLeft:(id)a3
{
}

- (NSArray)uvRight
{
  return self->_uvRight;
}

- (void)setUvRight:(id)a3
{
}

- (CIVector)faceRect
{
  return self->_faceRect;
}

- (void)setFaceRect:(id)a3
{
}

- (CIVector)roiRenderOriginLeft
{
  return self->_roiRenderOriginLeft;
}

- (void)setRoiRenderOriginLeft:(id)a3
{
}

- (CIVector)roiRenderOriginRight
{
  return self->_roiRenderOriginRight;
}

- (void)setRoiRenderOriginRight:(id)a3
{
}

- (CIVector)roiRenderSize
{
  return self->_roiRenderSize;
}

- (void)setRoiRenderSize:(id)a3
{
}

- (CIVector)pupilLeft
{
  return self->_pupilLeft;
}

- (void)setPupilLeft:(id)a3
{
}

- (CIVector)pupilRight
{
  return self->_pupilRight;
}

- (void)setPupilRight:(id)a3
{
}

@end