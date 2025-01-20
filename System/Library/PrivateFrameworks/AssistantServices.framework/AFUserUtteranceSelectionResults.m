@interface AFUserUtteranceSelectionResults
+ (BOOL)supportsSecureCoding;
- (AFUserUtteranceSelectionResults)initWithCoder:(id)a3;
- (NSNumber)combinedRank;
- (NSNumber)combinedScore;
- (NSNumber)onDeviceUtterancesPresent;
- (NSNumber)originalRank;
- (NSNumber)originalScore;
- (NSString)interactionId;
- (NSString)previousUtterance;
- (NSString)sessionId;
- (NSString)utteranceSource;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCombinedRank:(id)a3;
- (void)setCombinedScore:(id)a3;
- (void)setInteractionId:(id)a3;
- (void)setOnDeviceUtterancesPresent:(id)a3;
- (void)setOriginalRank:(id)a3;
- (void)setOriginalScore:(id)a3;
- (void)setPreviousUtterance:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setUtteranceSource:(id)a3;
@end

@implementation AFUserUtteranceSelectionResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceSource, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_previousUtterance, 0);
  objc_storeStrong((id *)&self->_originalScore, 0);
  objc_storeStrong((id *)&self->_originalRank, 0);
  objc_storeStrong((id *)&self->_onDeviceUtterancesPresent, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_combinedScore, 0);
  objc_storeStrong((id *)&self->_combinedRank, 0);
}

- (void)setUtteranceSource:(id)a3
{
}

- (NSString)utteranceSource
{
  return self->_utteranceSource;
}

- (void)setSessionId:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setPreviousUtterance:(id)a3
{
}

- (NSString)previousUtterance
{
  return self->_previousUtterance;
}

- (void)setOriginalScore:(id)a3
{
}

- (NSNumber)originalScore
{
  return self->_originalScore;
}

- (void)setOriginalRank:(id)a3
{
}

- (NSNumber)originalRank
{
  return self->_originalRank;
}

- (void)setOnDeviceUtterancesPresent:(id)a3
{
}

- (NSNumber)onDeviceUtterancesPresent
{
  return self->_onDeviceUtterancesPresent;
}

- (void)setInteractionId:(id)a3
{
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (void)setCombinedScore:(id)a3
{
}

- (NSNumber)combinedScore
{
  return self->_combinedScore;
}

- (void)setCombinedRank:(id)a3
{
}

- (NSNumber)combinedRank
{
  return self->_combinedRank;
}

- (AFUserUtteranceSelectionResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AFUserUtteranceSelectionResults;
  v5 = [(AFUserUtteranceSelectionResults *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_combinedRank"];
    combinedRank = v5->_combinedRank;
    v5->_combinedRank = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_combinedScore"];
    combinedScore = v5->_combinedScore;
    v5->_combinedScore = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_interactionId"];
    interactionId = v5->_interactionId;
    v5->_interactionId = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_onDeviceUtterancesPresent"];
    onDeviceUtterancesPresent = v5->_onDeviceUtterancesPresent;
    v5->_onDeviceUtterancesPresent = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalRank"];
    originalRank = v5->_originalRank;
    v5->_originalRank = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalScore"];
    originalScore = v5->_originalScore;
    v5->_originalScore = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_previousUtterance"];
    previousUtterance = v5->_previousUtterance;
    v5->_previousUtterance = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sessionId"];
    sessionId = v5->_sessionId;
    v5->_sessionId = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_utteranceSource"];
    utteranceSource = v5->_utteranceSource;
    v5->_utteranceSource = (NSString *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  combinedRank = self->_combinedRank;
  id v5 = a3;
  [v5 encodeObject:combinedRank forKey:@"_combinedRank"];
  [v5 encodeObject:self->_combinedScore forKey:@"_combinedScore"];
  [v5 encodeObject:self->_interactionId forKey:@"_interactionId"];
  [v5 encodeObject:self->_onDeviceUtterancesPresent forKey:@"_onDeviceUtterancesPresent"];
  [v5 encodeObject:self->_originalRank forKey:@"_originalRank"];
  [v5 encodeObject:self->_originalScore forKey:@"_originalScore"];
  [v5 encodeObject:self->_previousUtterance forKey:@"_previousUtterance"];
  [v5 encodeObject:self->_sessionId forKey:@"_sessionId"];
  [v5 encodeObject:self->_utteranceSource forKey:@"_utteranceSource"];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)AFUserUtteranceSelectionResults;
  v3 = [(AFUserUtteranceSelectionResults *)&v6 description];
  objc_msgSend(v3, "stringByAppendingFormat:", @"combinedRank: %@ combinedScore: %@ interactionId: %@ onDeviceUtterancesPresent: %@ originalRank: %@ originalScore: %@ previousUtterance; %@ sessionId: %@ utteranceSource: %@",
    self->_combinedRank,
    self->_combinedScore,
    self->_interactionId,
    self->_onDeviceUtterancesPresent,
    self->_originalRank,
    self->_originalScore,
    self->_previousUtterance,
    self->_sessionId,
  id v4 = self->_utteranceSource);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end