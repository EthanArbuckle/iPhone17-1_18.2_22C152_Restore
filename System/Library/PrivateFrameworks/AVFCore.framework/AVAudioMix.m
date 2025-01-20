@interface AVAudioMix
- (AVAudioMix)init;
- (BOOL)isEqual:(id)a3;
- (NSArray)inputParameters;
- (id)audioMixInputParametersForTrackID:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setInputParameters:(id)a3;
@end

@implementation AVAudioMix

- (AVAudioMix)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVAudioMix;
  v2 = [(AVAudioMix *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVAudioMixInternal);
    v2->_audioMix = v3;
    if (v3)
    {
      CFRetain(v3);
      v2->_audioMix->inputParameters = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  audioMix = self->_audioMix;
  if (audioMix)
  {

    CFRelease(self->_audioMix);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioMix;
  [(AVAudioMix *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, input parameters = %@>", NSStringFromClass(v4), self, -[AVAudioMix inputParameters](self, "inputParameters")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(AVAudioMix *)self isMemberOfClass:objc_opt_class()])
  {
    return self;
  }
  else
  {
    objc_super v5 = [+[AVAudioMix allocWithZone:a3] init];
    v6 = v5;
    if (v5) {
      [(AVAudioMix *)v5 setInputParameters:self->_audioMix->inputParameters];
    }
    return v6;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = [(AVAudioMix *)+[AVMutableAudioMix allocWithZone:a3] init];
  objc_super v5 = v4;
  if (v4) {
    [(AVMutableAudioMix *)v4 setInputParameters:self->_audioMix->inputParameters];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (NSUInteger v5 = [(NSArray *)[(AVAudioMix *)self inputParameters] count],
        v5 == objc_msgSend((id)objc_msgSend(a3, "inputParameters"), "count")))
  {
    if (![(AVAudioMix *)self inputParameters]
      || (BOOL v6 = -[NSArray isEqualToArray:](-[AVAudioMix inputParameters](self, "inputParameters"), "isEqualToArray:", [a3 inputParameters])))
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (unint64_t)hash
{
  v2 = [(AVAudioMix *)self inputParameters];
  return [(NSArray *)v2 hash];
}

- (NSArray)inputParameters
{
  return self->_audioMix->inputParameters;
}

- (void)setInputParameters:(id)a3
{
  if (a3) {
    v3 = (NSArray *)a3;
  }
  else {
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  inputParameters = self->_audioMix->inputParameters;
  if (inputParameters != v3)
  {

    self->_audioMix->inputParameters = (NSArray *)[(NSArray *)v3 copy];
  }
}

- (id)audioMixInputParametersForTrackID:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v4 = [(AVAudioMix *)self inputParameters];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 trackID] == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

@end