@interface AVAudioChannelLayout
+ (AVAudioChannelLayout)layoutWithLayout:(const AudioChannelLayout *)layout;
+ (AVAudioChannelLayout)layoutWithLayoutTag:(AudioChannelLayoutTag)layoutTag;
+ (BOOL)supportsSecureCoding;
- (AVAudioChannelCount)channelCount;
- (AVAudioChannelLayout)init;
- (AVAudioChannelLayout)initWithCoder:(id)a3;
- (AVAudioChannelLayout)initWithLayout:(const AudioChannelLayout *)layout;
- (AVAudioChannelLayout)initWithLayoutTag:(AudioChannelLayoutTag)layoutTag;
- (AudioChannelLayoutTag)layoutTag;
- (BOOL)isEqual:(id)object;
- (const)layout;
- (unint64_t)hash;
- (unint64_t)layoutSize;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVAudioChannelLayout

- (AVAudioChannelLayout)initWithLayout:(const AudioChannelLayout *)layout
{
  if (layout)
  {
    v10.receiver = self;
    v10.super_class = (Class)AVAudioChannelLayout;
    v4 = [(AVAudioChannelLayout *)&v10 init];
    v5 = v4;
    if (v4)
    {
      AudioChannelLayoutTag mChannelLayoutTag = layout->mChannelLayoutTag;
      v4->_layoutTag = layout->mChannelLayoutTag;
      if (mChannelLayoutTag) {
        size_t v7 = 12;
      }
      else {
        size_t v7 = 20 * layout->mNumberChannelDescriptions + 12;
      }
      v8 = (AudioChannelLayout *)malloc_type_malloc(v7, 0x8C1817CEuLL);
      v5->_layout = v8;
      memcpy(v8, layout, v7);
      if (v5->_layoutTag) {
        v5->_layout->mNumberChannelDescriptions = 0;
      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (unint64_t)layoutSize
{
  unint64_t result = [(AVAudioChannelLayout *)self layout];
  if (result)
  {
    if (*(_DWORD *)[(AVAudioChannelLayout *)self layout]) {
      return 12;
    }
    else {
      return 20 * [(AVAudioChannelLayout *)self layout][8] + 12;
    }
  }
  return result;
}

- (const)layout
{
  return self->_layout;
}

- (AVAudioChannelCount)channelCount
{
  layout = self->_layout;
  if (layout->mChannelLayoutTag == 0x10000)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)layout->mChannelBitmap);
    v4.i16[0] = vaddlv_u8(v4);
    return v4.i32[0];
  }
  else if (layout->mChannelLayoutTag)
  {
    return (unsigned __int16)layout->mChannelLayoutTag;
  }
  else
  {
    return layout->mNumberChannelDescriptions;
  }
}

- (AVAudioChannelLayout)initWithCoder:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  v5 = (_DWORD *)[a3 decodeBytesWithReturnedLength:&v9];
  uint64_t v6 = [a3 decodeBytesWithReturnedLength:&v8];
  if (v5 && v6 && v9 == 4 && v8 == *v5) {
    return [(AVAudioChannelLayout *)self initWithLayout:v6];
  }

  objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4864, 0));
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  unsigned int v5 = [(AVAudioChannelLayout *)self layoutSize];
  [a3 encodeBytes:&v5 length:4];
  [a3 encodeBytes:self->_layout length:v5];
}

- (AudioChannelLayoutTag)layoutTag
{
  return self->_layoutTag;
}

- (unint64_t)hash
{
  int v5 = 4;
  unsigned int v6 = 0;
  PropertyProc = (void (*)(uint64_t, uint64_t, AudioChannelLayout *, int *, unsigned int *))GetAudioFormatGetPropertyProc();
  PropertyProc(1667786849, 8, self->_layout, &v5, &v6);
  return v6;
}

- (BOOL)isEqual:(id)object
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (object == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (-[AVAudioChannelLayout layout](self, "layout") && [object layout])
  {
    v10[0] = [(AVAudioChannelLayout *)self layout];
    v10[1] = [object layout];
    PropertyProc = (unsigned int (*)(uint64_t, uint64_t, void *, uint64_t *, char *))GetAudioFormatGetPropertyProc();
    if (PropertyProc(1667786097, 16, v10, &v9, (char *)&v9 + 4)) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = HIDWORD(v9) == 0;
    }
    return !v6;
  }
  else
  {
    int v8 = [object layoutTag];
    return v8 == [(AVAudioChannelLayout *)self layoutTag];
  }
}

- (void)dealloc
{
  free(self->_layout);
  v3.receiver = self;
  v3.super_class = (Class)AVAudioChannelLayout;
  [(AVAudioChannelLayout *)&v3 dealloc];
}

- (AVAudioChannelLayout)initWithLayoutTag:(AudioChannelLayoutTag)layoutTag
{
  if ((layoutTag & 0xFFFEFFFF) != 0)
  {
    v4[1] = 0;
    v4[2] = 0;
    v4[0] = layoutTag;
    return [(AVAudioChannelLayout *)self initWithLayout:v4];
  }
  else
  {

    return 0;
  }
}

- (AVAudioChannelLayout)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (AVAudioChannelLayout)layoutWithLayout:(const AudioChannelLayout *)layout
{
  objc_super v3 = [[AVAudioChannelLayout alloc] initWithLayout:layout];

  return v3;
}

+ (AVAudioChannelLayout)layoutWithLayoutTag:(AudioChannelLayoutTag)layoutTag
{
  objc_super v3 = [[AVAudioChannelLayout alloc] initWithLayoutTag:*(void *)&layoutTag];

  return v3;
}

@end