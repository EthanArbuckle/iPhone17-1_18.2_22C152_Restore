@interface ZWSenderIDGenerationCountPair
- (BOOL)isEqual:(id)a3;
- (ZWSenderIDGenerationCountPair)initWithSenderID:(unint64_t)a3 generationCount:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)generationCount;
- (unint64_t)hash;
- (unint64_t)senderID;
- (void)setGenerationCount:(int64_t)a3;
- (void)setSenderID:(unint64_t)a3;
@end

@implementation ZWSenderIDGenerationCountPair

- (ZWSenderIDGenerationCountPair)initWithSenderID:(unint64_t)a3 generationCount:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ZWSenderIDGenerationCountPair;
  result = [(ZWSenderIDGenerationCountPair *)&v7 init];
  if (result)
  {
    result->_senderID = a3;
    result->_generationCount = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [ZWSenderIDGenerationCountPair alloc];
  unint64_t senderID = self->_senderID;
  int64_t generationCount = self->_generationCount;

  return [(ZWSenderIDGenerationCountPair *)v4 initWithSenderID:senderID generationCount:generationCount];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 senderID];
    if (v6 == (id)[(ZWSenderIDGenerationCountPair *)self senderID])
    {
      id v7 = [v5 generationCount];
      BOOL v8 = v7 == (id)[(ZWSenderIDGenerationCountPair *)self generationCount];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ZWSenderIDGenerationCountPair *)self senderID];
  return [(ZWSenderIDGenerationCountPair *)self generationCount] ^ v3;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(unint64_t)a3
{
  self->_unint64_t senderID = a3;
}

- (int64_t)generationCount
{
  return self->_generationCount;
}

- (void)setGenerationCount:(int64_t)a3
{
  self->_int64_t generationCount = a3;
}

@end