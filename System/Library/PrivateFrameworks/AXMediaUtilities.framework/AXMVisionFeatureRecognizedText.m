@interface AXMVisionFeatureRecognizedText
+ (BOOL)supportsSecureCoding;
- (AXMVisionFeatureRecognizedText)initWithCoder:(id)a3;
- (AXMVisionFeatureRecognizedText)initWithRecognizedText:(id)a3 range:(_NSRange)a4;
- (VNRecognizedText)text;
- (_NSRange)textRange;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AXMVisionFeatureRecognizedText

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionFeatureRecognizedText)initWithRecognizedText:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXMVisionFeatureRecognizedText;
  v9 = [(AXMVisionFeatureRecognizedText *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_text, a3);
    v10->_textRange.NSUInteger location = location;
    v10->_textRange.NSUInteger length = length;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  uint64_t v5 = AXMVisionFeatureCodingKeyTextRecognition;
  id v6 = a3;
  [v6 encodeObject:text forKey:v5];
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_textRange.location, self->_textRange.length);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v7 forKey:AXMVisionFeatureCodingKeyRange];
}

- (AXMVisionFeatureRecognizedText)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXMVisionFeatureRecognizedText *)self init];
  if (v5 && getVNRecognizedTextClass())
  {
    uint64_t v6 = [v4 decodeObjectOfClass:getVNRecognizedTextClass() forKey:AXMVisionFeatureCodingKeyTextRecognition];
    text = v5->_text;
    v5->_text = (VNRecognizedText *)v6;

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureCodingKeyRange];
    v5->_textRange.NSUInteger location = [v8 rangeValue];
    v5->_textRange.NSUInteger length = v9;
  }
  return v5;
}

- (VNRecognizedText)text
{
  return self->_text;
}

- (_NSRange)textRange
{
  NSUInteger length = self->_textRange.length;
  NSUInteger location = self->_textRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
}

@end