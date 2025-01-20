@interface AKShapeToCHRecognitionResult
- (AKAnnotation)annotation;
- (AKShapeToCHRecognitionResult)initWith:(int64_t)a3 result:(id)a4;
- (BOOL)doodlePathIsPrestroked;
- (CGRect)doodlePathBoundsInInputView;
- (CHRecognitionResult)result;
- (PKDrawing)inkDrawing;
- (UIBezierPath)doodlePath;
- (int64_t)tag;
- (void)setAnnotation:(id)a3;
- (void)setDoodlePath:(id)a3;
- (void)setDoodlePathBoundsInInputView:(CGRect)a3;
- (void)setDoodlePathIsPrestroked:(BOOL)a3;
- (void)setInkDrawing:(id)a3;
- (void)setResult:(id)a3;
- (void)setTag:(int64_t)a3;
@end

@implementation AKShapeToCHRecognitionResult

- (AKShapeToCHRecognitionResult)initWith:(int64_t)a3 result:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AKShapeToCHRecognitionResult;
  v8 = [(AKShapeToCHRecognitionResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_tag = a3;
    objc_storeStrong((id *)&v8->_result, a4);
  }

  return v9;
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (CHRecognitionResult)result
{
  return (CHRecognitionResult *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResult:(id)a3
{
}

- (UIBezierPath)doodlePath
{
  return (UIBezierPath *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDoodlePath:(id)a3
{
}

- (PKDrawing)inkDrawing
{
  return (PKDrawing *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInkDrawing:(id)a3
{
}

- (AKAnnotation)annotation
{
  return (AKAnnotation *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAnnotation:(id)a3
{
}

- (CGRect)doodlePathBoundsInInputView
{
  objc_copyStruct(v6, &self->_doodlePathBoundsInInputView, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setDoodlePathBoundsInInputView:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_doodlePathBoundsInInputView, &v3, 32, 1, 0);
}

- (BOOL)doodlePathIsPrestroked
{
  return self->_doodlePathIsPrestroked;
}

- (void)setDoodlePathIsPrestroked:(BOOL)a3
{
  self->_doodlePathIsPrestroked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_inkDrawing, 0);
  objc_storeStrong((id *)&self->_doodlePath, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

@end