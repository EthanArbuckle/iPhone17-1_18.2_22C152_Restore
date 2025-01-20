@interface CNACTStewieFacadeTestDouble
- (BOOL)isAvocetEnabled;
- (BOOL)isEmergencyEnabled;
- (CNACTStewieFacadeTestDouble)initWithPhrases:(id)a3 numbers:(id)a4;
- (NSArray)avocetTerms;
- (NSArray)emergencyTerms;
- (id)terms;
@end

@implementation CNACTStewieFacadeTestDouble

- (CNACTStewieFacadeTestDouble)initWithPhrases:(id)a3 numbers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNACTStewieFacadeTestDouble;
  v8 = [(CNACTStewieFacadeTestDouble *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    phrases = v8->_phrases;
    v8->_phrases = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    numbers = v8->_numbers;
    v8->_numbers = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (BOOL)isEmergencyEnabled
{
  return [(NSArray *)self->_numbers count] != 0;
}

- (BOOL)isAvocetEnabled
{
  return [(NSArray *)self->_numbers count] != 0;
}

- (id)terms
{
  v6[2] = *MEMORY[0x1E4F143B8];
  numbers = self->_numbers;
  v6[0] = self->_phrases;
  v6[1] = numbers;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = objc_msgSend(v3, "_cn_flatten");

  return v4;
}

- (NSArray)emergencyTerms
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)avocetTerms
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->avocetTerms, 0);
  objc_storeStrong((id *)&self->emergencyTerms, 0);
  objc_storeStrong((id *)&self->_numbers, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
}

@end