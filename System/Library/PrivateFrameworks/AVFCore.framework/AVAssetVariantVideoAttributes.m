@interface AVAssetVariantVideoAttributes
- (AVAssetVariantVideoAttributes)initWithFigAlternateObjC:(id)a3;
- (AVVideoRange)videoRange;
- (CGSize)presentationSize;
- (NSArray)codecTypes;
- (NSArray)videoLayoutAttributes;
- (double)nominalFrameRate;
- (id)description;
- (id)immersiveAttributes;
- (void)dealloc;
@end

@implementation AVAssetVariantVideoAttributes

- (AVVideoRange)videoRange
{
  v2 = (void *)[(FigAlternateObjC *)self->_figAlternateObjC videoAttributes];
  return (AVVideoRange)[v2 videoRange];
}

- (NSArray)codecTypes
{
  v2 = (void *)[(FigAlternateObjC *)self->_figAlternateObjC videoAttributes];
  return (NSArray *)[v2 codecTypes];
}

- (CGSize)presentationSize
{
  v2 = (void *)[(FigAlternateObjC *)self->_figAlternateObjC videoAttributes];
  [v2 presentationSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)nominalFrameRate
{
  v2 = (void *)[(FigAlternateObjC *)self->_figAlternateObjC videoAttributes];
  [v2 nominalFrameRate];
  return result;
}

- (id)immersiveAttributes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  MEMORY[0x199715030](self->_mutex, a2);
  if (!self->_allImmersiveAttributes)
  {
    double v3 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v4 = objc_msgSend((id)-[FigAlternateObjC videoAttributes](self->_figAlternateObjC, "videoAttributes", 0), "immersiveAttributes");
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [[AVAssetVariantVideoImmersiveAttributes alloc] initWithFigVideoImmersiveAttributes:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
          [v3 addObject:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    self->_allImmersiveAttributes = (NSArray *)[v3 copy];
  }
  MEMORY[0x199715040](self->_mutex);
  return self->_allImmersiveAttributes;
}

- (NSArray)videoLayoutAttributes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  MEMORY[0x199715030](self->_mutex, a2);
  if (!self->_allVideoLayoutAttributes)
  {
    double v3 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v4 = objc_msgSend((id)-[FigAlternateObjC videoAttributes](self->_figAlternateObjC, "videoAttributes", 0), "videoLayoutAttributes");
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [[AVAssetVariantVideoLayoutAttributes alloc] initWithFigVideoImmersiveAttributes:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
          [v3 addObject:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    self->_allVideoLayoutAttributes = (NSArray *)v3;
  }
  MEMORY[0x199715040](self->_mutex);
  return self->_allVideoLayoutAttributes;
}

- (void)dealloc
{
  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantVideoAttributes;
  [(AVAssetVariantVideoAttributes *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  double v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(AVAssetVariantVideoAttributes *)self videoRange];
  [(AVAssetVariantVideoAttributes *)self presentationSize];
  uint64_t v8 = (int)v7;
  [(AVAssetVariantVideoAttributes *)self presentationSize];
  uint64_t v10 = (int)v9;
  [(AVAssetVariantVideoAttributes *)self nominalFrameRate];
  *(float *)&double v11 = v11;
  long long v12 = (void *)[v3 stringWithFormat:@"<%@: %p, videoRange:%@ size:%dx%d, framerate:%0.2f codecs:%@", v5, self, v6, v8, v10, *(float *)&v11, -[AVAssetVariantVideoAttributes codecTypes](self, "codecTypes")];
  [v12 appendFormat:@" videoLayoutAttributes:%@", -[AVAssetVariantVideoAttributes videoLayoutAttributes](self, "videoLayoutAttributes")];
  [v12 appendFormat:@">"];
  return v12;
}

- (AVAssetVariantVideoAttributes)initWithFigAlternateObjC:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAssetVariantVideoAttributes;
  double v4 = [(AVAssetVariantVideoAttributes *)&v6 init];
  if (v4)
  {
    v4->_figAlternateObjC = (FigAlternateObjC *)a3;
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v4;
}

@end