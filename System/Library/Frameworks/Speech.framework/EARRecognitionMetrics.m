@interface EARRecognitionMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmojiDisambiguationUsed;
- (BOOL)isEmojiExpectedButNotRecognized;
- (BOOL)isEmojiPersonalizationUsed;
- (EARRecognitionMetrics)initWithCoder:(id)a3;
- (EARRecognitionMetrics)initWithRecognitionMetrics:(id)a3 cpuInstructions:(double)a4;
- (NSArray)allItnRunIntervals;
- (NSArray)pauseDurations;
- (NSArray)recognizedEmojis;
- (NSNumber)itnDurationInNs;
- (double)cpuMillionInstructionsPerSecond;
- (void)encodeWithCoder:(id)a3;
- (void)setAllItnRunIntervals:(id)a3;
@end

@implementation EARRecognitionMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizedEmojis, 0);
  objc_storeStrong((id *)&self->_itnDurationInNs, 0);
  objc_storeStrong((id *)&self->_pauseDurations, 0);

  objc_storeStrong((id *)&self->_allItnRunIntervals, 0);
}

- (double)cpuMillionInstructionsPerSecond
{
  return self->_cpuMillionInstructionsPerSecond;
}

- (NSArray)recognizedEmojis
{
  return self->_recognizedEmojis;
}

- (BOOL)isEmojiExpectedButNotRecognized
{
  return self->_isEmojiExpectedButNotRecognized;
}

- (BOOL)isEmojiDisambiguationUsed
{
  return self->_isEmojiDisambiguationUsed;
}

- (BOOL)isEmojiPersonalizationUsed
{
  return self->_isEmojiPersonalizationUsed;
}

- (NSNumber)itnDurationInNs
{
  return self->_itnDurationInNs;
}

- (NSArray)pauseDurations
{
  return self->_pauseDurations;
}

- (void)setAllItnRunIntervals:(id)a3
{
}

- (NSArray)allItnRunIntervals
{
  return self->_allItnRunIntervals;
}

- (EARRecognitionMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)EARRecognitionMetrics;
  v5 = [(EARRecognitionMetrics *)&v25 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"allItnRunIntervals"];
    allItnRunIntervals = v5->_allItnRunIntervals;
    v5->_allItnRunIntervals = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"pauseDurations"];
    pauseDurations = v5->_pauseDurations;
    v5->_pauseDurations = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itnDurationInNs"];
    itnDurationInNs = v5->_itnDurationInNs;
    v5->_itnDurationInNs = (NSNumber *)v16;

    v5->_isEmojiDisambiguationUsed = [v4 decodeBoolForKey:@"isEmojiDisambiguationUsed"];
    v5->_isEmojiPersonalizationUsed = [v4 decodeBoolForKey:@"isEmojiPersonalizationUsed"];
    v5->_isEmojiExpectedButNotRecognized = [v4 decodeBoolForKey:@"isEmojiExpectedButNotRecognized"];
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"recognizedEmojis"];
    recognizedEmojis = v5->_recognizedEmojis;
    v5->_recognizedEmojis = (NSArray *)v21;

    [v4 decodeDoubleForKey:@"cpuMillionInstructionsPerSecond"];
    v5->_cpuMillionInstructionsPerSecond = v23;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  allItnRunIntervals = self->_allItnRunIntervals;
  id v8 = a3;
  [v8 encodeObject:allItnRunIntervals forKey:@"allItnRunIntervals"];
  [v8 encodeObject:self->_pauseDurations forKey:@"pauseDurations"];
  [v8 encodeObject:self->_itnDurationInNs forKey:@"itnDurationInNs"];
  v5 = [NSNumber numberWithBool:self->_isEmojiDisambiguationUsed];
  [v8 encodeObject:v5 forKey:@"isEmojiDisambiguationUsed"];

  v6 = [NSNumber numberWithBool:self->_isEmojiPersonalizationUsed];
  [v8 encodeObject:v6 forKey:@"isEmojiPersonalizationUsed"];

  uint64_t v7 = [NSNumber numberWithBool:self->_isEmojiExpectedButNotRecognized];
  [v8 encodeObject:v7 forKey:@"isEmojiExpectedButNotRecognized"];

  [v8 encodeObject:self->_recognizedEmojis forKey:@"recognizedEmojis"];
  [v8 encodeDouble:@"cpuMillionInstructionsPerSecond" forKey:self->_cpuMillionInstructionsPerSecond];
}

- (EARRecognitionMetrics)initWithRecognitionMetrics:(id)a3 cpuInstructions:(double)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EARRecognitionMetrics;
  uint64_t v7 = [(EARRecognitionMetrics *)&v20 init];
  if (v7)
  {
    id v8 = [v6 allItnRunIntervals];
    uint64_t v9 = [v8 copy];
    allItnRunIntervals = v7->_allItnRunIntervals;
    v7->_allItnRunIntervals = (NSArray *)v9;

    v11 = [v6 pauseDurations];
    uint64_t v12 = [v11 copy];
    pauseDurations = v7->_pauseDurations;
    v7->_pauseDurations = (NSArray *)v12;

    uint64_t v14 = [v6 itnDurationInNs];
    itnDurationInNs = v7->_itnDurationInNs;
    v7->_itnDurationInNs = (NSNumber *)v14;

    v7->_isEmojiDisambiguationUsed = [v6 isEmojiDisambiguationUsed];
    v7->_isEmojiPersonalizationUsed = [v6 isEmojiPersonalizationUsed];
    v7->_isEmojiExpectedButNotRecognized = [v6 isEmojiExpectedButNotRecognized];
    uint64_t v16 = [v6 recognizedEmojis];
    uint64_t v17 = [v16 copy];
    recognizedEmojis = v7->_recognizedEmojis;
    v7->_recognizedEmojis = (NSArray *)v17;

    v7->_cpuMillionInstructionsPerSecond = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end