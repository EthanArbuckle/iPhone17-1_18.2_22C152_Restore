@interface AXCameraAccessibilityElement
- (AXMCameraFrameContext)cameraFrameContext;
- (AXMVisionFeatureFaceAttributes)faceAttributes;
- (BOOL)didCrossEdge;
- (BOOL)didReuse;
- (BOOL)isFace;
- (BOOL)isObjectClassification;
- (BOOL)isPerson;
- (BOOL)isProminentObject;
- (CGRect)normalizedFrame;
- (NSString)_subjectDescription;
- (NSString)classificationLabel;
- (NSString)classificationLocalizedValue;
- (NSString)faceName;
- (double)confidence;
- (id)accessibilityLabel;
- (id)description;
- (int64_t)faceID;
- (int64_t)location;
- (unint64_t)featureType;
- (void)setCameraFrameContext:(id)a3;
- (void)setClassificationLabel:(id)a3;
- (void)setClassificationLocalizedValue:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setDidCrossEdge:(BOOL)a3;
- (void)setDidReuse:(BOOL)a3;
- (void)setFaceAttributes:(id)a3;
- (void)setFaceID:(int64_t)a3;
- (void)setFaceName:(id)a3;
- (void)setFeatureType:(unint64_t)a3;
- (void)setLocation:(int64_t)a3;
- (void)setNormalizedFrame:(CGRect)a3;
@end

@implementation AXCameraAccessibilityElement

- (id)accessibilityLabel
{
  v3 = objc_msgSend(MEMORY[0x263F21560], "localizedStringForLocation:isSubjectImplicit:", -[AXCameraAccessibilityElement location](self, "location"), 0);
  if (v3)
  {
    v4 = NSString;
    v5 = [(AXCameraAccessibilityElement *)self _subjectDescription];
    v6 = objc_msgSend(v4, "localizedStringWithFormat:", v3, v5);
  }
  else
  {
    v6 = [(AXCameraAccessibilityElement *)self _subjectDescription];
  }

  return v6;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)AXCameraAccessibilityElement;
  v3 = [(AXCameraAccessibilityElement *)&v8 description];
  v4 = [(AXCameraAccessibilityElement *)self accessibilityLabel];
  [(AXCameraAccessibilityElement *)self normalizedFrame];
  v5 = AXMStringFromNormalizedCGRect();
  v6 = [v3 stringByAppendingFormat:@" %@ (%@)", v4, v5];

  return v6;
}

- (NSString)_subjectDescription
{
  v3 = [(AXCameraAccessibilityElement *)self faceName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [(AXCameraAccessibilityElement *)self faceName];
LABEL_6:
    v7 = (void *)v5;
    goto LABEL_7;
  }
  if ([(AXCameraAccessibilityElement *)self isFace])
  {
    v6 = @"unknown.face";
LABEL_5:
    uint64_t v5 = accessibilityCameraUILocalizedString(v6);
    goto LABEL_6;
  }
  if (![(AXCameraAccessibilityElement *)self isPerson])
  {
    if ([(AXCameraAccessibilityElement *)self isObjectClassification])
    {
      uint64_t v5 = [(AXCameraAccessibilityElement *)self classificationLocalizedValue];
      goto LABEL_6;
    }
    v6 = @"prominent.object";
    goto LABEL_5;
  }
  v9 = NSString;
  v10 = accessibilityCameraUILocalizedString(@"people.count");
  v7 = objc_msgSend(v9, "localizedStringWithFormat:", v10, 1);

LABEL_7:

  return (NSString *)v7;
}

- (BOOL)isFace
{
  return [(AXCameraAccessibilityElement *)self featureType] == 5
      || [(AXCameraAccessibilityElement *)self featureType] == 6;
}

- (BOOL)isProminentObject
{
  return [(AXCameraAccessibilityElement *)self featureType] == 19;
}

- (BOOL)isObjectClassification
{
  return [(AXCameraAccessibilityElement *)self featureType] == 10;
}

- (BOOL)isPerson
{
  return [(AXCameraAccessibilityElement *)self featureType] == 7;
}

- (unint64_t)featureType
{
  return self->_featureType;
}

- (void)setFeatureType:(unint64_t)a3
{
  self->_featureType = a3;
}

- (int64_t)location
{
  return self->_location;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (CGRect)normalizedFrame
{
  double x = self->_normalizedFrame.origin.x;
  double y = self->_normalizedFrame.origin.y;
  double width = self->_normalizedFrame.size.width;
  double height = self->_normalizedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNormalizedFrame:(CGRect)a3
{
  self->_normalizedFrame = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (AXMCameraFrameContext)cameraFrameContext
{
  return self->_cameraFrameContext;
}

- (void)setCameraFrameContext:(id)a3
{
}

- (NSString)faceName
{
  return self->_faceName;
}

- (void)setFaceName:(id)a3
{
}

- (AXMVisionFeatureFaceAttributes)faceAttributes
{
  return self->_faceAttributes;
}

- (void)setFaceAttributes:(id)a3
{
}

- (int64_t)faceID
{
  return self->_faceID;
}

- (void)setFaceID:(int64_t)a3
{
  self->_faceID = a3;
}

- (NSString)classificationLocalizedValue
{
  return self->_classificationLocalizedValue;
}

- (void)setClassificationLocalizedValue:(id)a3
{
}

- (NSString)classificationLabel
{
  return self->_classificationLabel;
}

- (void)setClassificationLabel:(id)a3
{
}

- (BOOL)didCrossEdge
{
  return self->_didCrossEdge;
}

- (void)setDidCrossEdge:(BOOL)a3
{
  self->_didCrossEdge = a3;
}

- (BOOL)didReuse
{
  return self->_didReuse;
}

- (void)setDidReuse:(BOOL)a3
{
  self->_didReuse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationLabel, 0);
  objc_storeStrong((id *)&self->_classificationLocalizedValue, 0);
  objc_storeStrong((id *)&self->_faceAttributes, 0);
  objc_storeStrong((id *)&self->_faceName, 0);

  objc_storeStrong((id *)&self->_cameraFrameContext, 0);
}

@end