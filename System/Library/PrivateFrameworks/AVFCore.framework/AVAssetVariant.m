@interface AVAssetVariant
+ (BOOL)supportsSecureCoding;
- (AVAssetVariant)initWithCoder:(id)a3;
- (AVAssetVariant)initWithFigAlternate:(OpaqueFigAlternate *)a3;
- (AVAssetVariantAudioAttributes)audioAttributes;
- (AVAssetVariantVideoAttributes)videoAttributes;
- (OpaqueFigAlternate)_figAlternate;
- (double)averageBitRate;
- (double)peakBitRate;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVAssetVariant

- (double)peakBitRate
{
  [(FigAlternateObjC *)self->_figAlternateObjC peakBitRate];
  return result;
}

- (double)averageBitRate
{
  [(FigAlternateObjC *)self->_figAlternateObjC averageBitRate];
  return result;
}

- (AVAssetVariantVideoAttributes)videoAttributes
{
  MEMORY[0x199715030](self->_mutex, a2);
  if (!self->_videoAttributes && [(FigAlternateObjC *)self->_figAlternateObjC videoAttributes]) {
    self->_videoAttributes = [[AVAssetVariantVideoAttributes alloc] initWithFigAlternateObjC:self->_figAlternateObjC];
  }
  MEMORY[0x199715040](self->_mutex);
  v3 = self->_videoAttributes;
  return v3;
}

- (AVAssetVariantAudioAttributes)audioAttributes
{
  MEMORY[0x199715030](self->_mutex, a2);
  if (!self->_audioAttributes && [(FigAlternateObjC *)self->_figAlternateObjC audioAttributes]) {
    self->_audioAttributes = [[AVAssetVariantAudioAttributes alloc] initWithFigAlternateObjC:self->_figAlternateObjC];
  }
  MEMORY[0x199715040](self->_mutex);
  v3 = self->_audioAttributes;
  return v3;
}

- (void)dealloc
{
  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariant;
  [(AVAssetVariant *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(AVAssetVariant *)self peakBitRate];
  uint64_t v7 = (int)v6;
  [(AVAssetVariant *)self averageBitRate];
  return (id)[v3 stringWithFormat:@"<%@: %p, peakBitRate:%d averageBitRate:%d video:%@ audio:%@>", v5, self, v7, (int)v8, -[AVAssetVariant videoAttributes](self, "videoAttributes"), -[AVAssetVariant audioAttributes](self, "audioAttributes")];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = @"supports only keyed archivers";
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = @"supports only NSXPCCoder";
LABEL_6:
    v13 = objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v12, v5, v6, v7, v8, v9, v14), 0);
    objc_exception_throw(v13);
  }
  [(AVAssetVariant *)self _figAlternate];
  FigAlternateCopyAsXPCObjectWithContext();
}

- (AVAssetVariant)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v12 = self;
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = @"supports only keyed archivers";
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = @"supports only NSXPCCoder";
LABEL_8:
    v16 = objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v15, v6, v7, v8, v9, v10, v17), 0);
    objc_exception_throw(v16);
  }
  if ([a3 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"variant"]) {
    FigAlternateCreateWithXPCObject();
  }
  return 0;
}

- (AVAssetVariant)initWithFigAlternate:(OpaqueFigAlternate *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAssetVariant;
  v4 = [(AVAssetVariant *)&v6 init];
  if (v4)
  {
    v4->_figAlternateObjC = (FigAlternateObjC *)[objc_alloc(MEMORY[0x1E4F31AC8]) initWithFigAlternate:a3];
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v4;
}

- (OpaqueFigAlternate)_figAlternate
{
  return (OpaqueFigAlternate *)[(FigAlternateObjC *)self->_figAlternateObjC figAlternate];
}

@end