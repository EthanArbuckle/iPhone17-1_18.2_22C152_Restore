@interface _BlastDoorLPVideoAttachmentSubstitute
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldEncodeData;
- (_BlastDoorLPVideoAttachmentSubstitute)initWithCoder:(id)a3;
- (_BlastDoorLPVideoAttachmentSubstitute)initWithVideo:(id)a3;
- (unint64_t)index;
- (void)encodeWithCoder:(id)a3;
- (void)setIndex:(unint64_t)a3;
@end

@implementation _BlastDoorLPVideoAttachmentSubstitute

- (_BlastDoorLPVideoAttachmentSubstitute)initWithVideo:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_BlastDoorLPVideoAttachmentSubstitute;
  v3 = [(_BlastDoorLPVideo *)&v7 _initWithVideo:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (_BlastDoorLPVideoAttachmentSubstitute)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_BlastDoorLPVideoAttachmentSubstitute;
  v5 = [(_BlastDoorLPVideo *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_index = [v4 decodeIntegerForKey:@"richLinkVideoAttachmentSubstituteIndex"];
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
  v5.super_class = (Class)_BlastDoorLPVideoAttachmentSubstitute;
  id v4 = a3;
  [(_BlastDoorLPVideo *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:self->_index forKey:@"richLinkVideoAttachmentSubstituteIndex"];
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