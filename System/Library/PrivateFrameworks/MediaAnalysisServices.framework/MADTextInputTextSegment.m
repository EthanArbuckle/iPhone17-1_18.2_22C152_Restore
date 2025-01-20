@interface MADTextInputTextSegment
+ (BOOL)supportsSecureCoding;
- (MADTextInputTextSegment)initWithCoder:(id)a3;
- (MADTextInputTextSegment)initWithText:(id)a3;
- (NSString)text;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADTextInputTextSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADTextInputTextSegment)initWithText:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADTextInputTextSegment;
  v6 = [(MADTextInputTextSegment *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_text, a3);
  }

  return v7;
}

- (MADTextInputTextSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADTextInputTextSegment;
  id v5 = [(MADTextInputSegment *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADTextInputTextSegment;
  id v4 = a3;
  [(MADTextInputSegment *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_text, @"Text", v5.receiver, v5.super_class);
}

- (int64_t)type
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"text: %@>", self->_text];
  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
}

@end