@interface AFSpeechAcousticFeature
+ (BOOL)supportsSecureCoding;
- (AFSpeechAcousticFeature)initWithAcousticFeatureValue:(id)a3 frameDuration:(double)a4;
- (AFSpeechAcousticFeature)initWithCoder:(id)a3;
- (NSArray)acousticFeatureValuePerFrame;
- (double)frameDuration;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSpeechAcousticFeature

- (void).cxx_destruct
{
}

- (double)frameDuration
{
  return self->_frameDuration;
}

- (NSArray)acousticFeatureValuePerFrame
{
  return self->_acousticFeatureValuePerFrame;
}

- (AFSpeechAcousticFeature)initWithAcousticFeatureValue:(id)a3 frameDuration:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFSpeechAcousticFeature;
  v7 = [(AFSpeechAcousticFeature *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    acousticFeatureValuePerFrame = v7->_acousticFeatureValuePerFrame;
    v7->_acousticFeatureValuePerFrame = (NSArray *)v8;

    v7->_frameDuration = a4;
  }

  return v7;
}

- (AFSpeechAcousticFeature)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFSpeechAcousticFeature;
  v5 = [(AFSpeechAcousticFeature *)&v13 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    uint64_t v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_acousticFeatureValuePerFrame"];
    acousticFeatureValuePerFrame = v5->_acousticFeatureValuePerFrame;
    v5->_acousticFeatureValuePerFrame = (NSArray *)v9;

    [v4 decodeDoubleForKey:@"_frameDuration"];
    v5->_frameDuration = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  acousticFeatureValuePerFrame = self->_acousticFeatureValuePerFrame;
  id v5 = a3;
  [v5 encodeObject:acousticFeatureValuePerFrame forKey:@"_acousticFeatureValuePerFrame"];
  [v5 encodeDouble:@"_frameDuration" forKey:self->_frameDuration];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end