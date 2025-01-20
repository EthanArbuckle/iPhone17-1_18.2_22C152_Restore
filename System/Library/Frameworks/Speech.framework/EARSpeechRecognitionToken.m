@interface EARSpeechRecognitionToken
+ (BOOL)supportsSecureCoding;
- (BOOL)appendedAutoPunctuation;
- (BOOL)hasSpaceAfter;
- (BOOL)hasSpaceBefore;
- (BOOL)isModifiedByAutoPunctuation;
- (BOOL)prependedAutoPunctuation;
- (EARSpeechRecognitionToken)initWithCoder:(id)a3;
- (EARSpeechRecognitionToken)initWithToken:(id)a3;
- (NSString)ipaPhoneSequence;
- (NSString)phoneSequence;
- (NSString)tokenName;
- (double)acousticCost;
- (double)confidence;
- (double)end;
- (double)graphCost;
- (double)silenceStart;
- (double)start;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EARSpeechRecognitionToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipaPhoneSequence, 0);
  objc_storeStrong((id *)&self->_phoneSequence, 0);

  objc_storeStrong((id *)&self->_tokenName, 0);
}

- (double)acousticCost
{
  return self->_acousticCost;
}

- (double)graphCost
{
  return self->_graphCost;
}

- (BOOL)isModifiedByAutoPunctuation
{
  return self->_isModifiedByAutoPunctuation;
}

- (BOOL)prependedAutoPunctuation
{
  return self->_prependedAutoPunctuation;
}

- (BOOL)appendedAutoPunctuation
{
  return self->_appendedAutoPunctuation;
}

- (NSString)ipaPhoneSequence
{
  return self->_ipaPhoneSequence;
}

- (NSString)phoneSequence
{
  return self->_phoneSequence;
}

- (BOOL)hasSpaceBefore
{
  return self->_hasSpaceBefore;
}

- (BOOL)hasSpaceAfter
{
  return self->_hasSpaceAfter;
}

- (double)confidence
{
  return self->_confidence;
}

- (double)silenceStart
{
  return self->_silenceStart;
}

- (double)end
{
  return self->_end;
}

- (double)start
{
  return self->_start;
}

- (NSString)tokenName
{
  return self->_tokenName;
}

- (EARSpeechRecognitionToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EARSpeechRecognitionToken;
  v5 = [(EARSpeechRecognitionToken *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenName"];
    tokenName = v5->_tokenName;
    v5->_tokenName = (NSString *)v6;

    [v4 decodeDoubleForKey:@"start"];
    v5->_start = v8;
    [v4 decodeDoubleForKey:@"end"];
    v5->_end = v9;
    [v4 decodeDoubleForKey:@"silenceStart"];
    v5->_silenceStart = v10;
    [v4 decodeDoubleForKey:@"confidence"];
    v5->_confidence = v11;
    v5->_hasSpaceAfter = [v4 decodeBoolForKey:@"hasSpaceAfter"];
    v5->_hasSpaceBefore = [v4 decodeBoolForKey:@"hasSpaceBefore"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneSequence"];
    phoneSequence = v5->_phoneSequence;
    v5->_phoneSequence = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ipaPhoneSequence"];
    ipaPhoneSequence = v5->_ipaPhoneSequence;
    v5->_ipaPhoneSequence = (NSString *)v14;

    v5->_appendedAutoPunctuation = [v4 decodeBoolForKey:@"appendedAutoPunctuation"];
    v5->_prependedAutoPunctuation = [v4 decodeBoolForKey:@"prependedAutoPunctuation"];
    v5->_isModifiedByAutoPunctuation = [v4 decodeBoolForKey:@"isModifiedByAutoPunctuation"];
    [v4 decodeDoubleForKey:@"graphCost"];
    v5->_graphCost = v16;
    [v4 decodeDoubleForKey:@"acousticCost"];
    v5->_acousticCost = v17;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  tokenName = self->_tokenName;
  id v5 = a3;
  [v5 encodeObject:tokenName forKey:@"tokenName"];
  [v5 encodeDouble:@"start" forKey:self->_start];
  [v5 encodeDouble:@"end" forKey:self->_end];
  [v5 encodeDouble:@"silenceStart" forKey:self->_silenceStart];
  [v5 encodeDouble:@"confidence" forKey:self->_confidence];
  [v5 encodeBool:self->_hasSpaceAfter forKey:@"hasSpaceAfter"];
  [v5 encodeBool:self->_hasSpaceBefore forKey:@"hasSpaceBefore"];
  [v5 encodeObject:self->_phoneSequence forKey:@"phoneSequence"];
  [v5 encodeObject:self->_ipaPhoneSequence forKey:@"ipaPhoneSequence"];
  [v5 encodeBool:self->_appendedAutoPunctuation forKey:@"appendedAutoPunctuation"];
  [v5 encodeBool:self->_prependedAutoPunctuation forKey:@"prependedAutoPunctuation"];
  [v5 encodeBool:self->_isModifiedByAutoPunctuation forKey:@"isModifiedByAutoPunctuation"];
  [v5 encodeDouble:@"graphCost" forKey:self->_graphCost];
  [v5 encodeDouble:@"acousticCost" forKey:self->_acousticCost];
}

- (EARSpeechRecognitionToken)initWithToken:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EARSpeechRecognitionToken;
  id v5 = [(EARSpeechRecognitionToken *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 tokenName];
    uint64_t v7 = [v6 copy];
    tokenName = v5->_tokenName;
    v5->_tokenName = (NSString *)v7;

    [v4 start];
    v5->_start = v9;
    [v4 end];
    v5->_end = v10;
    [v4 silenceStart];
    v5->_silenceStart = v11;
    [v4 confidence];
    v5->_confidence = v12;
    v5->_hasSpaceAfter = [v4 hasSpaceAfter];
    v5->_hasSpaceBefore = [v4 hasSpaceBefore];
    v13 = [v4 phoneSequence];
    uint64_t v14 = [v13 copy];
    phoneSequence = v5->_phoneSequence;
    v5->_phoneSequence = (NSString *)v14;

    double v16 = [v4 ipaPhoneSequence];
    uint64_t v17 = [v16 copy];
    ipaPhoneSequence = v5->_ipaPhoneSequence;
    v5->_ipaPhoneSequence = (NSString *)v17;

    v5->_appendedAutoPunctuation = [v4 appendedAutoPunctuation];
    v5->_prependedAutoPunctuation = [v4 prependedAutoPunctuation];
    v5->_isModifiedByAutoPunctuation = [v4 isModifiedByAutoPunctuation];
    [v4 graphCost];
    v5->_graphCost = v19;
    [v4 acousticCost];
    v5->_acousticCost = v20;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end