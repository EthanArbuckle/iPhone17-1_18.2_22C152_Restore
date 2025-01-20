@interface JFXOverlayEffectTransforms
+ (id)transformsWithEffect:(id)a3;
+ (id)transformsWithTransform:(id)a3 transformAnimation:(id)a4 faceTrackingTransform:(id)a5;
- (JFXFaceTrackedEffectTransform)faceTrackingTransform;
- (JFXOverlayEffectTransforms)initWithEffect:(id)a3;
- (JFXOverlayEffectTransforms)initWithTransform:(id)a3 transformAnimation:(id)a4 faceTrackingTransform:(id)a5;
- (PVTransformAnimation)transformAnimation;
- (void)applyToEffect:(id)a3;
- (void)setFaceTrackingTransform:(id)a3;
- (void)setTransformAnimation:(id)a3;
@end

@implementation JFXOverlayEffectTransforms

+ (id)transformsWithTransform:(id)a3 transformAnimation:(id)a4 faceTrackingTransform:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithTransform:v10 transformAnimation:v9 faceTrackingTransform:v8];

  return v11;
}

+ (id)transformsWithEffect:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithEffect:v4];

  return v5;
}

- (JFXOverlayEffectTransforms)initWithTransform:(id)a3 transformAnimation:(id)a4 faceTrackingTransform:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)JFXOverlayEffectTransforms;
  id v10 = [(JFXTextEffectTransforms *)&v16 initWithTransform:a3];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    transformAnimation = v10->_transformAnimation;
    v10->_transformAnimation = (PVTransformAnimation *)v11;

    uint64_t v13 = [v9 copy];
    faceTrackingTransform = v10->_faceTrackingTransform;
    v10->_faceTrackingTransform = (JFXFaceTrackedEffectTransform *)v13;
  }
  return v10;
}

- (JFXOverlayEffectTransforms)initWithEffect:(id)a3
{
  id v4 = a3;
  v5 = [v4 topLevelTransformObject];
  v6 = [v4 transformAnimation];
  v7 = [v4 faceTrackingTransform];

  id v8 = [(JFXOverlayEffectTransforms *)self initWithTransform:v5 transformAnimation:v6 faceTrackingTransform:v7];
  return v8;
}

- (void)applyToEffect:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)JFXOverlayEffectTransforms;
  id v4 = a3;
  [(JFXTextEffectTransforms *)&v7 applyToEffect:v4];
  v5 = [(JFXOverlayEffectTransforms *)self transformAnimation];
  [v4 setTransformAnimation:v5];

  v6 = [(JFXOverlayEffectTransforms *)self faceTrackingTransform];
  [v4 setFaceTrackingTransform:v6];
}

- (PVTransformAnimation)transformAnimation
{
  return self->_transformAnimation;
}

- (void)setTransformAnimation:(id)a3
{
}

- (JFXFaceTrackedEffectTransform)faceTrackingTransform
{
  return self->_faceTrackingTransform;
}

- (void)setFaceTrackingTransform:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceTrackingTransform, 0);
  objc_storeStrong((id *)&self->_transformAnimation, 0);
}

@end