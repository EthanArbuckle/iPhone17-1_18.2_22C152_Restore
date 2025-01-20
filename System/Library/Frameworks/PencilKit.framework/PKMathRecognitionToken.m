@interface PKMathRecognitionToken
- (BOOL)isTrigonometric;
- (CGRect)bounds;
- (NSArray)alternatives;
- (NSArray)errors;
- (NSArray)renderableAlternatives;
- (NSString)text;
- (NSUUID)uuid;
- (PKMathRecognitionItem)item;
- (PKMathRecognitionToken)init;
- (_NSRange)characterRange;
- (id)debugDescription;
- (int64_t)columnIndex;
- (int64_t)type;
- (void)setAlternatives:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCharacterRange:(_NSRange)a3;
- (void)setColumnIndex:(int64_t)a3;
- (void)setErrors:(id)a3;
- (void)setIsTrigonometric:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setRenderableAlternatives:(id)a3;
- (void)setText:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKMathRecognitionToken

- (PKMathRecognitionToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKMathRecognitionToken;
  v2 = [(PKMathRecognitionToken *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    [(PKMathRecognitionToken *)v2 setType:0];
    [(PKMathRecognitionToken *)v2 setErrors:MEMORY[0x1E4F1CBF0]];
    -[PKMathRecognitionToken setCharacterRange:](v2, "setCharacterRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    [(PKMathRecognitionToken *)v2 setColumnIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  return v2;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PKMathRecognitionToken;
  v4 = [(PKMathRecognitionToken *)&v10 description];
  v5 = [(PKMathRecognitionToken *)self text];
  v12.location = [(PKMathRecognitionToken *)self characterRange];
  objc_super v6 = NSStringFromRange(v12);
  v7 = [(PKMathRecognitionToken *)self errors];
  v8 = [v3 stringWithFormat:@"%@ - text: %@, range: %@, errors: %lu", v4, v5, v6, objc_msgSend(v7, "count")];

  return v8;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (PKMathRecognitionItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);

  return (PKMathRecognitionItem *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (_NSRange)characterRange
{
  NSUInteger length = self->_characterRange.length;
  NSUInteger location = self->_characterRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCharacterRange:(_NSRange)a3
{
  self->_characterRange = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (int64_t)columnIndex
{
  return self->_columnIndex;
}

- (void)setColumnIndex:(int64_t)a3
{
  self->_columnIndedouble x = a3;
}

- (BOOL)isTrigonometric
{
  return self->_isTrigonometric;
}

- (void)setIsTrigonometric:(BOOL)a3
{
  self->_isTrigonometric = a3;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void)setAlternatives:(id)a3
{
}

- (NSArray)renderableAlternatives
{
  return self->_renderableAlternatives;
}

- (void)setRenderableAlternatives:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderableAlternatives, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_item);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end