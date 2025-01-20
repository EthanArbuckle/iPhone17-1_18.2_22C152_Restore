@interface CAXContextualActionsPredictionElement
- (BOOL)isEqual:(id)a3;
- (CAXContextualActionsPredictionElement)initWithIdentifier:(id)a3 frequency:(id)a4;
- (CAXContextualActionsPredictionElement)initWithIdentifier:(id)a3 frequency:(id)a4 normalizedFrequency:(id)a5 priorTotal:(id)a6;
- (NSNumber)frequency;
- (NSNumber)normalizedFrequency;
- (NSNumber)priorTotal;
- (NSString)encodedActionIdentifier;
- (unint64_t)hash;
- (void)setEncodedActionIdentifier:(id)a3;
- (void)setFrequency:(id)a3;
- (void)setNormalizedFrequency:(id)a3;
- (void)setPriorTotal:(id)a3;
@end

@implementation CAXContextualActionsPredictionElement

- (CAXContextualActionsPredictionElement)initWithIdentifier:(id)a3 frequency:(id)a4
{
  return [(CAXContextualActionsPredictionElement *)self initWithIdentifier:a3 frequency:a4 normalizedFrequency:&unk_26D8F3040 priorTotal:&unk_26D8F3040];
}

- (CAXContextualActionsPredictionElement)initWithIdentifier:(id)a3 frequency:(id)a4 normalizedFrequency:(id)a5 priorTotal:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CAXContextualActionsPredictionElement;
  v15 = [(CAXContextualActionsPredictionElement *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_encodedActionIdentifier, a3);
    objc_storeStrong((id *)&v16->_frequency, a4);
    objc_storeStrong((id *)&v16->_normalizedFrequency, a5);
    objc_storeStrong((id *)&v16->_priorTotal, a6);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CAXContextualActionsPredictionElement *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CAXContextualActionsPredictionElement *)self encodedActionIdentifier];
      v6 = [(CAXContextualActionsPredictionElement *)v4 encodedActionIdentifier];
      if ([v5 isEqualToString:v6])
      {
        v7 = [(CAXContextualActionsPredictionElement *)self frequency];
        v8 = [(CAXContextualActionsPredictionElement *)v4 frequency];
        char v9 = [v7 isEqualToNumber:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(CAXContextualActionsPredictionElement *)self encodedActionIdentifier];
  int v4 = [v3 intValue];
  v5 = [(CAXContextualActionsPredictionElement *)self frequency];
  unint64_t v6 = (int)([v5 intValue] * v4);

  return v6;
}

- (NSString)encodedActionIdentifier
{
  return self->_encodedActionIdentifier;
}

- (void)setEncodedActionIdentifier:(id)a3
{
}

- (NSNumber)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(id)a3
{
}

- (NSNumber)normalizedFrequency
{
  return self->_normalizedFrequency;
}

- (void)setNormalizedFrequency:(id)a3
{
}

- (NSNumber)priorTotal
{
  return self->_priorTotal;
}

- (void)setPriorTotal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorTotal, 0);
  objc_storeStrong((id *)&self->_normalizedFrequency, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_storeStrong((id *)&self->_encodedActionIdentifier, 0);
}

@end