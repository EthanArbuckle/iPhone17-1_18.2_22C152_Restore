@interface PDFAnnotationEditMenuConfiguration
+ (id)configurationWithIdentifier:(id)a3 sourcePoint:(CGPoint)a4;
- (PDFAnnotation)annotation;
- (void)setAnnotation:(id)a3;
@end

@implementation PDFAnnotationEditMenuConfiguration

+ (id)configurationWithIdentifier:(id)a3 sourcePoint:(CGPoint)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___PDFAnnotationEditMenuConfiguration;
  v4 = objc_msgSendSuper2(&v6, sel_configurationWithIdentifier_sourcePoint_, a3, a4.x, a4.y);

  return v4;
}

- (PDFAnnotation)annotation
{
  return (PDFAnnotation *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAnnotation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end