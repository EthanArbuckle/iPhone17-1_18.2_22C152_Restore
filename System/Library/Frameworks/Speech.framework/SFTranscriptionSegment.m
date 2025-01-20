@interface SFTranscriptionSegment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)alternativeConfidences;
- (NSArray)alternativeSubstrings;
- (NSRange)substringRange;
- (NSString)ipaPhoneSequence;
- (NSString)phoneSequence;
- (NSString)substring;
- (NSTimeInterval)duration;
- (NSTimeInterval)timestamp;
- (SFTranscriptionSegment)initWithCoder:(id)a3;
- (SFVoiceAnalytics)voiceAnalytics;
- (float)confidence;
- (id)_initWithSubstring:(id)a3 range:(_NSRange)a4 timestamp:(double)a5 duration:(double)a6 confidence:(float)a7 alternativeSubstrings:(id)a8 alternativeConfidences:(id)a9 phoneSequence:(id)a10 ipaPhoneSequence:(id)a11 voiceAnalytics:(id)a12;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFTranscriptionSegment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipaPhoneSequence, 0);
  objc_storeStrong((id *)&self->_phoneSequence, 0);
  objc_storeStrong((id *)&self->_alternativeConfidences, 0);
  objc_storeStrong((id *)&self->_voiceAnalytics, 0);
  objc_storeStrong((id *)&self->_alternativeSubstrings, 0);

  objc_storeStrong((id *)&self->_substring, 0);
}

- (NSString)ipaPhoneSequence
{
  return self->_ipaPhoneSequence;
}

- (NSString)phoneSequence
{
  return self->_phoneSequence;
}

- (NSArray)alternativeConfidences
{
  return self->_alternativeConfidences;
}

- (SFVoiceAnalytics)voiceAnalytics
{
  return self->_voiceAnalytics;
}

- (NSArray)alternativeSubstrings
{
  return self->_alternativeSubstrings;
}

- (float)confidence
{
  return self->_confidence;
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (NSRange)substringRange
{
  NSUInteger length = self->_substringRange.length;
  NSUInteger location = self->_substringRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)substring
{
  return self->_substring;
}

- (id)_initWithSubstring:(id)a3 range:(_NSRange)a4 timestamp:(double)a5 duration:(double)a6 confidence:(float)a7 alternativeSubstrings:(id)a8 alternativeConfidences:(id)a9 phoneSequence:(id)a10 ipaPhoneSequence:(id)a11 voiceAnalytics:(id)a12
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v22 = a3;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  v44.receiver = self;
  v44.super_class = (Class)SFTranscriptionSegment;
  v28 = [(SFTranscriptionSegment *)&v44 init];
  if (v28)
  {
    uint64_t v29 = [v22 copy];
    substring = v28->_substring;
    v28->_substring = (NSString *)v29;

    v28->_substringRange.NSUInteger location = location;
    v28->_substringRange.NSUInteger length = length;
    v28->_timestamp = a5;
    v28->_duration = a6;
    v28->_confidence = a7;
    uint64_t v31 = [v24 count];
    if (v31 != [v23 count])
    {
      v43 = [MEMORY[0x1E4F28B00] currentHandler];
      [v43 handleFailureInMethod:a2 object:v28 file:@"SFTranscriptionSegment.m" lineNumber:96 description:&stru_1F10479F8];
    }
    uint64_t v32 = [v23 copy];
    alternativeSubstrings = v28->_alternativeSubstrings;
    v28->_alternativeSubstrings = (NSArray *)v32;

    uint64_t v34 = [v24 copy];
    alternativeConfidences = v28->_alternativeConfidences;
    v28->_alternativeConfidences = (NSArray *)v34;

    uint64_t v36 = [v25 copy];
    phoneSequence = v28->_phoneSequence;
    v28->_phoneSequence = (NSString *)v36;

    uint64_t v38 = [v26 copy];
    ipaPhoneSequence = v28->_ipaPhoneSequence;
    v28->_ipaPhoneSequence = (NSString *)v38;

    uint64_t v40 = [v27 copy];
    voiceAnalytics = v28->_voiceAnalytics;
    v28->_voiceAnalytics = (SFVoiceAnalytics *)v40;
  }
  return v28;
}

- (SFTranscriptionSegment)initWithCoder:(id)a3
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SFTranscriptionSegment;
  v5 = [(SFTranscriptionSegment *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_substring"];
    substring = v5->_substring;
    v5->_substring = (NSString *)v6;

    v5->_substringRange.NSUInteger location = [v4 decodeIntegerForKey:@"_substringRange.location"];
    v5->_substringRange.NSUInteger length = [v4 decodeIntegerForKey:@"_substringRange.length"];
    [v4 decodeDoubleForKey:@"_timestamp"];
    v5->_timestamp = v8;
    [v4 decodeDoubleForKey:@"_duration"];
    v5->_duration = v9;
    [v4 decodeDoubleForKey:@"_confidence"];
    *(float *)&double v10 = v10;
    v5->_confidence = *(float *)&v10;
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_alternativeSubstrings"];
    alternativeSubstrings = v5->_alternativeSubstrings;
    v5->_alternativeSubstrings = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"_alternativeConfidences"];
    alternativeConfidences = v5->_alternativeConfidences;
    v5->_alternativeConfidences = (NSArray *)v19;

    uint64_t v21 = [(NSArray *)v5->_alternativeConfidences count];
    if (v21 != [(NSArray *)v5->_alternativeSubstrings count])
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v23 = v5->_alternativeSubstrings;
      uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v24)
      {
        uint64_t v26 = v24;
        uint64_t v27 = *(void *)v39;
        while (1)
        {
          if (*(void *)v39 != v27) {
            objc_enumerationMutation(v23);
          }
          *(float *)&double v25 = v5->_confidence;
          v28 = objc_msgSend(NSNumber, "numberWithFloat:", v25, v38);
          [v22 addObject:v28];

          if (!--v26)
          {
            uint64_t v26 = [(NSArray *)v23 countByEnumeratingWithState:&v38 objects:v43 count:16];
            if (!v26) {
              break;
            }
          }
        }
      }

      uint64_t v29 = [v22 copy];
      v30 = v5->_alternativeConfidences;
      v5->_alternativeConfidences = (NSArray *)v29;
    }
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_phoneSequence"];
    phoneSequence = v5->_phoneSequence;
    v5->_phoneSequence = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ipaPhoneSequence"];
    ipaPhoneSequence = v5->_ipaPhoneSequence;
    v5->_ipaPhoneSequence = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_voiceAnalytics"];
    voiceAnalytics = v5->_voiceAnalytics;
    v5->_voiceAnalytics = (SFVoiceAnalytics *)v35;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  substring = self->_substring;
  id v5 = a3;
  [v5 encodeObject:substring forKey:@"_substring"];
  [v5 encodeInteger:self->_substringRange.location forKey:@"_substringRange.location"];
  [v5 encodeInteger:self->_substringRange.length forKey:@"_substringRange.length"];
  [v5 encodeDouble:@"_timestamp" forKey:self->_timestamp];
  [v5 encodeDouble:@"_duration" forKey:self->_duration];
  [v5 encodeDouble:@"_confidence" forKey:self->_confidence];
  [v5 encodeObject:self->_alternativeSubstrings forKey:@"_alternativeSubstrings"];
  [v5 encodeObject:self->_alternativeConfidences forKey:@"_alternativeConfidences"];
  [v5 encodeObject:self->_phoneSequence forKey:@"_phoneSequence"];
  [v5 encodeObject:self->_ipaPhoneSequence forKey:@"_ipaPhoneSequence"];
  [v5 encodeObject:self->_voiceAnalytics forKey:@"_voiceAnalytics"];
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)SFTranscriptionSegment;
  v3 = [(SFTranscriptionSegment *)&v11 description];
  id v4 = NSStringFromRange(self->_substringRange);
  id v5 = [NSNumber numberWithDouble:self->_timestamp];
  uint64_t v6 = [NSNumber numberWithDouble:self->_duration];
  *(float *)&double v7 = self->_confidence;
  double v8 = [NSNumber numberWithFloat:v7];
  double v9 = [v3 stringByAppendingFormat:@", substringRange=%@, timestamp=%@, duration=%@, confidence=%@, substring=%@, alternativeSubstrings=%@, phoneSequence=%@, ipaPhoneSequence=%@, voiceAnalytics=%@", v4, v5, v6, v8, self->_substring, self->_alternativeSubstrings, self->_phoneSequence, self->_ipaPhoneSequence, self->_voiceAnalytics];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFVoiceAnalytics **)a3;
  objc_opt_class();
  BOOL v11 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (SFVoiceAnalytics *)self->_substringRange.location == v4[10]
    && (SFVoiceAnalytics *)self->_substringRange.length == v4[11]
    && self->_timestamp == *((double *)v4 + 3)
    && self->_duration == *((double *)v4 + 4)
    && self->_confidence == *((float *)v4 + 2))
  {
    substring = self->_substring;
    if (substring == (NSString *)v4[2] || -[NSString isEqual:](substring, "isEqual:"))
    {
      alternativeSubstrings = self->_alternativeSubstrings;
      if (alternativeSubstrings == (NSArray *)v4[5]
        || -[NSArray isEqual:](alternativeSubstrings, "isEqual:"))
      {
        alternativeConfidences = self->_alternativeConfidences;
        if (alternativeConfidences == (NSArray *)v4[7]
          || -[NSArray isEqual:](alternativeConfidences, "isEqual:"))
        {
          phoneSequence = self->_phoneSequence;
          if (phoneSequence == (NSString *)v4[8] || -[NSString isEqual:](phoneSequence, "isEqual:"))
          {
            ipaPhoneSequence = self->_ipaPhoneSequence;
            if (ipaPhoneSequence == (NSString *)v4[9]
              || -[NSString isEqual:](ipaPhoneSequence, "isEqual:"))
            {
              voiceAnalytics = self->_voiceAnalytics;
              if (voiceAnalytics == v4[6] || -[SFVoiceAnalytics isEqual:](voiceAnalytics, "isEqual:")) {
                BOOL v11 = 1;
              }
            }
          }
        }
      }
    }
  }

  return v11;
}

- (unint64_t)hash
{
  return [(NSString *)self->_substring hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end