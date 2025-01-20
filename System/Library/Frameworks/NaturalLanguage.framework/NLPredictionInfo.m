@interface NLPredictionInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NLPredictionInfo)initWithCoder:(id)a3;
- (NLPredictionInfo)initWithPrediction:(id)a3 contextLength:(unint64_t)a4 probabilityInfo:(id)a5;
- (NLPredictionInfo)initWithPrediction:(id)a3 probabilityInfo:(id)a4;
- (NLPredictionInfo)initWithPrediction:(id)a3 tokenIDArray:(id)a4 contextLength:(unint64_t)a5 probabilityInfo:(id)a6;
- (NLPredictionInfo)initWithPrediction:(id)a3 tokenIDs:(const unsigned int *)a4 length:(unint64_t)a5 contextLength:(unint64_t)a6 probabilityInfo:(id)a7;
- (NLProbabilityInfo)probabilityInfo;
- (NSString)prediction;
- (const)tokenIDs;
- (id)description;
- (id)tokenIDArray;
- (unint64_t)contextLength;
- (unint64_t)hash;
- (unint64_t)tokenIDLength;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NLPredictionInfo

- (NLPredictionInfo)initWithPrediction:(id)a3 tokenIDArray:(id)a4 contextLength:(unint64_t)a5 probabilityInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)NLPredictionInfo;
  v13 = [(NLPredictionInfo *)&v26 init];
  if (v13)
  {
    size_t v14 = [v11 count];
    uint64_t v15 = [v10 copy];
    prediction = v13->_prediction;
    v13->_prediction = (NSString *)v15;

    v13->_contextLength = a5;
    uint64_t v17 = [v12 copy];
    probabilityInfo = v13->_probabilityInfo;
    v13->_probabilityInfo = (NLProbabilityInfo *)v17;

    uint64_t v19 = [v11 copy];
    tokenIDArray = v13->_tokenIDArray;
    v13->_tokenIDArray = (NSArray *)v19;

    v13->_tokenIDs = 0;
    if (v14)
    {
      v21 = malloc_type_calloc(v14, 4uLL, 0x100004052888210uLL);
      if (v21)
      {
        v22 = v21;
        for (uint64_t i = 0; i != v14; ++i)
        {
          v24 = [v11 objectAtIndex:i];
          v22[i] = [v24 unsignedIntegerValue];
        }
        v13->_tokenIDs = v22;
      }
    }
  }

  return v13;
}

- (NLPredictionInfo)initWithPrediction:(id)a3 contextLength:(unint64_t)a4 probabilityInfo:(id)a5
{
  return [(NLPredictionInfo *)self initWithPrediction:a3 tokenIDArray:MEMORY[0x1E4F1CBF0] contextLength:a4 probabilityInfo:a5];
}

- (NLPredictionInfo)initWithPrediction:(id)a3 probabilityInfo:(id)a4
{
  return [(NLPredictionInfo *)self initWithPrediction:a3 tokenIDArray:MEMORY[0x1E4F1CBF0] contextLength:0 probabilityInfo:a4];
}

- (NLPredictionInfo)initWithPrediction:(id)a3 tokenIDs:(const unsigned int *)a4 length:(unint64_t)a5 contextLength:(unint64_t)a6 probabilityInfo:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  for (uint64_t i = [MEMORY[0x1E4F1CA48] array];
  {
    unsigned int v15 = *a4++;
    v16 = [NSNumber numberWithUnsignedInteger:v15];
    [i addObject:v16];
  }
  uint64_t v17 = [(NLPredictionInfo *)self initWithPrediction:v12 tokenIDArray:i contextLength:a6 probabilityInfo:v13];

  return v17;
}

- (void)dealloc
{
  tokenIDs = self->_tokenIDs;
  if (tokenIDs) {
    free(tokenIDs);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLPredictionInfo;
  [(NLPredictionInfo *)&v4 dealloc];
}

- (id)tokenIDArray
{
  return self->_tokenIDArray;
}

- (const)tokenIDs
{
  return (const unsigned int *)self->_tokenIDs;
}

- (unint64_t)tokenIDLength
{
  v2 = [(NLPredictionInfo *)self tokenIDArray];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  objc_super v4 = [(NLPredictionInfo *)self prediction];
  v5 = [(NLPredictionInfo *)self probabilityInfo];
  v6 = [v3 stringWithFormat:@"<%@> %@", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NLPredictionInfo *)self prediction];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(NLPredictionInfo *)self contextLength] ^ v4;
  v6 = [(NLPredictionInfo *)self probabilityInfo];
  uint64_t v7 = [v6 hash];
  v8 = [(NLPredictionInfo *)self tokenIDArray];
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (NLPredictionInfo *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    goto LABEL_8;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_11:
    BOOL v14 = 0;
    goto LABEL_12;
  }
  v6 = [(NLPredictionInfo *)self prediction];
  uint64_t v7 = [(NLPredictionInfo *)v5 prediction];
  if (![v6 isEqual:v7]
    || (unint64_t v8 = [(NLPredictionInfo *)self contextLength],
        v8 != [(NLPredictionInfo *)v5 contextLength]))
  {
LABEL_10:

    goto LABEL_11;
  }
  unint64_t v9 = [(NLPredictionInfo *)self probabilityInfo];
  id v10 = [(NLPredictionInfo *)v5 probabilityInfo];
  if (![v9 isEqual:v10])
  {

    goto LABEL_10;
  }
  id v11 = [(NLPredictionInfo *)self tokenIDArray];
  id v12 = [(NLPredictionInfo *)v5 tokenIDArray];
  char v13 = [v11 isEqual:v12];

  if ((v13 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  if (([v8 allowsKeyedCoding] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NLPredictionInfo requires keyed coding" userInfo:0];
    objc_exception_throw(v7);
  }
  uint64_t v4 = [(NLPredictionInfo *)self prediction];
  [v8 encodeObject:v4 forKey:@"NLPrediction"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[NLPredictionInfo contextLength](self, "contextLength"), @"NLContextLength");
  unint64_t v5 = [(NLPredictionInfo *)self probabilityInfo];
  [v8 encodeObject:v5 forKey:@"NLProbabilityInfo"];

  v6 = [(NLPredictionInfo *)self tokenIDArray];
  [v8 encodeObject:v6 forKey:@"NLTokenIDArray"];
}

- (NLPredictionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NLPredictionInfo requires keyed coding" userInfo:0];
    objc_exception_throw(v11);
  }
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NLPrediction"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"NLContextLength"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NLProbabilityInfo"];
  id v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"NLTokenIDArray"];
  unint64_t v9 = [(NLPredictionInfo *)self initWithPrediction:v5 tokenIDArray:v8 contextLength:v6 probabilityInfo:v7];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)prediction
{
  return self->_prediction;
}

- (unint64_t)contextLength
{
  return self->_contextLength;
}

- (NLProbabilityInfo)probabilityInfo
{
  return self->_probabilityInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probabilityInfo, 0);
  objc_storeStrong((id *)&self->_prediction, 0);

  objc_storeStrong((id *)&self->_tokenIDArray, 0);
}

@end