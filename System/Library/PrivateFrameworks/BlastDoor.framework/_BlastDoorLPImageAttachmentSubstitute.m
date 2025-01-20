@interface _BlastDoorLPImageAttachmentSubstitute
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldEncodeData;
- (_BlastDoorLPImageAttachmentSubstitute)initWithCoder:(id)a3;
- (_BlastDoorLPImageAttachmentSubstitute)initWithImage:(id)a3;
- (unint64_t)index;
- (void)encodeWithCoder:(id)a3;
- (void)setIndex:(unint64_t)a3;
@end

@implementation _BlastDoorLPImageAttachmentSubstitute

- (_BlastDoorLPImageAttachmentSubstitute)initWithImage:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_BlastDoorLPImageAttachmentSubstitute;
  v3 = [(_BlastDoorLPImage *)&v7 _initWithImage:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (_BlastDoorLPImageAttachmentSubstitute)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_BlastDoorLPImageAttachmentSubstitute;
  v5 = [(_BlastDoorLPImage *)&v8 initWithCoder:v4];
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
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)_BlastDoorLPImageAttachmentSubstitute;
  id v4 = a3;
  [(_BlastDoorLPImage *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:self->_index forKey:@"richLinkImageAttachmentSubstituteIndex"];
}

- (BOOL)_shouldEncodeData
{
  return 0;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end