@interface PKIndexableContent
- (CHRecognitionSessionIndexableContent)chIndexableContent;
- (NSString)indexableTextRepresentation;
- (NSString)presentableTextRepresentation;
- (PKIndexableContent)initWithIndexableContent:(id)a3;
- (void)setChIndexableContent:(id)a3;
@end

@implementation PKIndexableContent

- (PKIndexableContent)initWithIndexableContent:(id)a3
{
  v4 = (CHRecognitionSessionIndexableContent *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PKIndexableContent;
  v5 = [(PKIndexableContent *)&v8 init];
  chIndexableContent = v5->_chIndexableContent;
  v5->_chIndexableContent = v4;

  return v5;
}

- (NSString)indexableTextRepresentation
{
  v2 = [(PKIndexableContent *)self chIndexableContent];
  v3 = [v2 indexableTextRepresentation];

  return (NSString *)v3;
}

- (NSString)presentableTextRepresentation
{
  v2 = [(PKIndexableContent *)self chIndexableContent];
  v3 = [v2 presentableTextRepresentation];

  return (NSString *)v3;
}

- (CHRecognitionSessionIndexableContent)chIndexableContent
{
  return (CHRecognitionSessionIndexableContent *)objc_getProperty(self, a2, 8, 1);
}

- (void)setChIndexableContent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end