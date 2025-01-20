@interface LPImageAttachmentSubstitute
+ (BOOL)supportsSecureCoding;
- (BOOL)_isSubstitute;
- (LPImageAttachmentSubstitute)initWithCoder:(id)a3;
- (LPImageAttachmentSubstitute)initWithImage:(id)a3;
- (int64_t)index;
- (void)encodeWithCoder:(id)a3;
- (void)setIndex:(int64_t)a3;
@end

@implementation LPImageAttachmentSubstitute

- (LPImageAttachmentSubstitute)initWithImage:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LPImageAttachmentSubstitute;
  v3 = [(LPImage *)&v7 _initWithImage:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (LPImageAttachmentSubstitute)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPImageAttachmentSubstitute;
  v5 = [(LPImage *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_index = [v4 decodeIntegerForKey:@"richLinkImageAttachmentSubstituteIndex"];
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LPImageAttachmentSubstitute;
  [(LPImage *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:self->_index forKey:@"richLinkImageAttachmentSubstituteIndex"];
}

- (BOOL)_isSubstitute
{
  return 1;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

@end