@interface AVAudioMixProcessingEffectParameter
+ (id)parameterWithFourCharCode:(unsigned int)a3 value:(float)a4;
- (AVAudioMixProcessingEffectParameter)initWithFourCharCode:(unsigned int)a3 value:(float)a4;
- (BOOL)isEqual:(id)a3;
- (float)value;
- (unint64_t)hash;
- (unsigned)fourcc;
@end

@implementation AVAudioMixProcessingEffectParameter

- (AVAudioMixProcessingEffectParameter)initWithFourCharCode:(unsigned int)a3 value:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVAudioMixProcessingEffectParameter;
  result = [(AVAudioMixProcessingEffectParameter *)&v7 init];
  if (result)
  {
    result->_fourcc = a3;
    result->_value = a4;
  }
  return result;
}

+ (id)parameterWithFourCharCode:(unsigned int)a3 value:(float)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = [AVAudioMixProcessingEffectParameter alloc];
  *(float *)&double v7 = a4;
  v8 = [(AVAudioMixProcessingEffectParameter *)v6 initWithFourCharCode:v5 value:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (a3 == self) {
    return 1;
  }
  if (self->_fourcc != *((_DWORD *)a3 + 2)) {
    return 0;
  }
  *(float *)&double v5 = self->_value;
  v6 = (void *)[MEMORY[0x1E4F28ED0] numberWithFloat:v5];
  LODWORD(v7) = *((_DWORD *)a3 + 3);
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithFloat:v7];
  return [v6 isEqual:v8];
}

- (unint64_t)hash
{
  *(float *)&double v2 = self->_value;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v2), "hash");
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", self->_fourcc), "hash") ^ v4;
}

- (unsigned)fourcc
{
  return self->_fourcc;
}

- (float)value
{
  return self->_value;
}

@end