@interface SFTranscription
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)segments;
- (NSString)formattedString;
- (NSTimeInterval)averagePauseDuration;
- (SFTranscription)initWithCoder:(id)a3;
- (double)speakingRate;
- (id)_initWithSegments:(id)a3 formattedString:(id)a4 speakingRate:(double)a5 averagePauseDuration:(double)a6;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFTranscription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);

  objc_storeStrong((id *)&self->_formattedString, 0);
}

- (NSTimeInterval)averagePauseDuration
{
  return self->_averagePauseDuration;
}

- (double)speakingRate
{
  return self->_speakingRate;
}

- (NSArray)segments
{
  return self->_segments;
}

- (NSString)formattedString
{
  return self->_formattedString;
}

- (id)_initWithSegments:(id)a3 formattedString:(id)a4 speakingRate:(double)a5 averagePauseDuration:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SFTranscription;
  v12 = [(SFTranscription *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    segments = v12->_segments;
    v12->_segments = (NSArray *)v13;

    uint64_t v15 = [v11 copy];
    formattedString = v12->_formattedString;
    v12->_formattedString = (NSString *)v15;

    v12->_speakingRate = a5;
    v12->_averagePauseDuration = a6;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  segments = self->_segments;
  id v5 = a3;
  [v5 encodeObject:segments forKey:@"_segments"];
  [v5 encodeObject:self->_formattedString forKey:@"_formattedString"];
  [v5 encodeDouble:@"_speakingRate" forKey:self->_speakingRate];
  [v5 encodeDouble:@"_avgPauseDuration" forKey:self->_averagePauseDuration];
}

- (SFTranscription)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFTranscription;
  id v5 = [(SFTranscription *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_segments"];
    segments = v5->_segments;
    v5->_segments = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_formattedString"];
    formattedString = v5->_formattedString;
    v5->_formattedString = (NSString *)v11;

    [v4 decodeDoubleForKey:@"_speakingRate"];
    v5->_speakingRate = v13;
    [v4 decodeDoubleForKey:@"_avgPauseDuration"];
    v5->_averagePauseDuration = v14;
  }

  return v5;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)SFTranscription;
  v3 = [(SFTranscription *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@", formattedString=%@, segments=%@, speakingRate=%f, averagePauseDuration=%f", self->_formattedString, self->_segments, *(void *)&self->_speakingRate, *(void *)&self->_averagePauseDuration];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v7 = 0;
  if (objc_opt_isKindOfClass())
  {
    segments = self->_segments;
    if (segments == (NSArray *)v4[2] || -[NSArray isEqual:](segments, "isEqual:"))
    {
      formattedString = self->_formattedString;
      if (formattedString == (NSString *)v4[1] || -[NSString isEqual:](formattedString, "isEqual:")) {
        BOOL v7 = 1;
      }
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_formattedString hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end