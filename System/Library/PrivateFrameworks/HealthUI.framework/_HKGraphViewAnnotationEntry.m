@interface _HKGraphViewAnnotationEntry
- (NSAttributedString)annotation;
- (id)modelCoordinate;
- (void)setAnnotation:(id)a3;
- (void)setModelCoordinate:(id)a3;
@end

@implementation _HKGraphViewAnnotationEntry

- (NSAttributedString)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (id)modelCoordinate
{
  return self->_modelCoordinate;
}

- (void)setModelCoordinate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modelCoordinate, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end