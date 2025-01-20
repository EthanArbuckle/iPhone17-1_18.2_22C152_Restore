@interface CVNLPTextDecodingToken
- (BOOL)hasPrecedingSpace;
- (CVNLPTextDecodingToken)initWithString:(id)a3 score:(id)a4 activationRange:(_NSRange)a5 hasPrecedingSpace:(BOOL)a6;
- (CVNLPTextDecodingToken)initWithString:(id)a3 score:(id)a4 activationRange:(_NSRange)a5 terminatingCharacter:(id)a6;
- (CVNLPTextDecodingToken)initWithString:(id)a3 score:(id)a4 alignmentScore:(id)a5 activationRange:(_NSRange)a6 terminatingCharacter:(id)a7;
- (NSNumber)alignmentScore;
- (NSNumber)score;
- (NSString)fullString;
- (NSString)string;
- (NSString)terminatingCharacter;
- (_NSRange)activationRange;
@end

@implementation CVNLPTextDecodingToken

- (CVNLPTextDecodingToken)initWithString:(id)a3 score:(id)a4 alignmentScore:(id)a5 activationRange:(_NSRange)a6 terminatingCharacter:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CVNLPTextDecodingToken;
  v17 = [(CVNLPTextDecodingToken *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_string, a3);
    objc_storeStrong((id *)&v18->_score, a4);
    objc_storeStrong((id *)&v18->_alignmentScore, a5);
    v18->_activationRange.NSUInteger location = location;
    v18->_activationRange.NSUInteger length = length;
    objc_storeStrong((id *)&v18->_terminatingCharacter, a7);
  }

  return v18;
}

- (CVNLPTextDecodingToken)initWithString:(id)a3 score:(id)a4 activationRange:(_NSRange)a5 terminatingCharacter:(id)a6
{
  return (CVNLPTextDecodingToken *)objc_msgSend_initWithString_score_alignmentScore_activationRange_terminatingCharacter_(self, a2, (uint64_t)a3, (uint64_t)a4, &unk_1F0D5B1B0, a5.location, a5.length, a6);
}

- (CVNLPTextDecodingToken)initWithString:(id)a3 score:(id)a4 activationRange:(_NSRange)a5 hasPrecedingSpace:(BOOL)a6
{
  result = (CVNLPTextDecodingToken *)objc_msgSend_initWithString_score_alignmentScore_activationRange_terminatingCharacter_(self, a2, (uint64_t)a3, (uint64_t)a4, &unk_1F0D5B1B0, a5.location, a5.length, 0);
  if (result) {
    result->_hasPrecedingSpace = a6;
  }
  return result;
}

- (NSString)fullString
{
  v5 = self->_string;
  terminatingCharacter = self->_terminatingCharacter;
  if (terminatingCharacter)
  {
    uint64_t v7 = objc_msgSend_stringWithFormat_(NSString, v3, @"%@%@", v4, self->_string, terminatingCharacter);

    v5 = (NSString *)v7;
  }
  if (self->_hasPrecedingSpace)
  {
    uint64_t v8 = objc_msgSend_stringWithFormat_(NSString, v3, @" %@", v4, v5);

    v5 = (NSString *)v8;
  }
  return v5;
}

- (NSString)string
{
  return self->_string;
}

- (BOOL)hasPrecedingSpace
{
  return self->_hasPrecedingSpace;
}

- (NSString)terminatingCharacter
{
  return self->_terminatingCharacter;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSNumber)alignmentScore
{
  return self->_alignmentScore;
}

- (_NSRange)activationRange
{
  NSUInteger length = self->_activationRange.length;
  NSUInteger location = self->_activationRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignmentScore, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_terminatingCharacter, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end