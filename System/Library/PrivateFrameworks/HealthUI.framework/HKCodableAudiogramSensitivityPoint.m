@interface HKCodableAudiogramSensitivityPoint
+ (Class)testsType;
- (BOOL)hasFrequency;
- (BOOL)hasLeftEarSensitivity;
- (BOOL)hasRightEarSensitivity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)frequency;
- (HKCodableQuantity)leftEarSensitivity;
- (HKCodableQuantity)rightEarSensitivity;
- (NSMutableArray)tests;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)testsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)testsCount;
- (void)addTests:(id)a3;
- (void)clearTests;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFrequency:(id)a3;
- (void)setLeftEarSensitivity:(id)a3;
- (void)setRightEarSensitivity:(id)a3;
- (void)setTests:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableAudiogramSensitivityPoint

- (BOOL)hasFrequency
{
  return self->_frequency != 0;
}

- (BOOL)hasLeftEarSensitivity
{
  return self->_leftEarSensitivity != 0;
}

- (BOOL)hasRightEarSensitivity
{
  return self->_rightEarSensitivity != 0;
}

- (void)clearTests
{
}

- (void)addTests:(id)a3
{
  id v4 = a3;
  tests = self->_tests;
  id v8 = v4;
  if (!tests)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_tests;
    self->_tests = v6;

    id v4 = v8;
    tests = self->_tests;
  }
  [(NSMutableArray *)tests addObject:v4];
}

- (unint64_t)testsCount
{
  return [(NSMutableArray *)self->_tests count];
}

- (id)testsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tests objectAtIndex:a3];
}

+ (Class)testsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableAudiogramSensitivityPoint;
  id v4 = [(HKCodableAudiogramSensitivityPoint *)&v8 description];
  v5 = [(HKCodableAudiogramSensitivityPoint *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  frequency = self->_frequency;
  if (frequency)
  {
    v5 = [(HKCodableQuantity *)frequency dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"frequency"];
  }
  leftEarSensitivity = self->_leftEarSensitivity;
  if (leftEarSensitivity)
  {
    v7 = [(HKCodableQuantity *)leftEarSensitivity dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"leftEarSensitivity"];
  }
  rightEarSensitivity = self->_rightEarSensitivity;
  if (rightEarSensitivity)
  {
    v9 = [(HKCodableQuantity *)rightEarSensitivity dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"rightEarSensitivity"];
  }
  if ([(NSMutableArray *)self->_tests count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_tests, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = self->_tests;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"tests"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableAudiogramSensitivityPointReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_frequency) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_leftEarSensitivity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rightEarSensitivity) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_tests;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_frequency) {
    objc_msgSend(v8, "setFrequency:");
  }
  if (self->_leftEarSensitivity) {
    objc_msgSend(v8, "setLeftEarSensitivity:");
  }
  if (self->_rightEarSensitivity) {
    objc_msgSend(v8, "setRightEarSensitivity:");
  }
  if ([(HKCodableAudiogramSensitivityPoint *)self testsCount])
  {
    [v8 clearTests];
    unint64_t v4 = [(HKCodableAudiogramSensitivityPoint *)self testsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HKCodableAudiogramSensitivityPoint *)self testsAtIndex:i];
        [v8 addTests:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableQuantity *)self->_frequency copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(HKCodableQuantity *)self->_leftEarSensitivity copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(HKCodableQuantity *)self->_rightEarSensitivity copyWithZone:a3];
  long long v11 = (void *)v5[3];
  v5[3] = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_tests;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addTests:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((frequency = self->_frequency, !((unint64_t)frequency | v4[1]))
     || -[HKCodableQuantity isEqual:](frequency, "isEqual:"))
    && ((leftEarSensitivity = self->_leftEarSensitivity, !((unint64_t)leftEarSensitivity | v4[2]))
     || -[HKCodableQuantity isEqual:](leftEarSensitivity, "isEqual:"))
    && ((rightEarSensitivity = self->_rightEarSensitivity, !((unint64_t)rightEarSensitivity | v4[3]))
     || -[HKCodableQuantity isEqual:](rightEarSensitivity, "isEqual:")))
  {
    tests = self->_tests;
    if ((unint64_t)tests | v4[4]) {
      char v9 = -[NSMutableArray isEqual:](tests, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableQuantity *)self->_frequency hash];
  unint64_t v4 = [(HKCodableQuantity *)self->_leftEarSensitivity hash] ^ v3;
  unint64_t v5 = [(HKCodableQuantity *)self->_rightEarSensitivity hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_tests hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  frequency = self->_frequency;
  uint64_t v6 = *((void *)v4 + 1);
  if (frequency)
  {
    if (v6) {
      -[HKCodableQuantity mergeFrom:](frequency, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HKCodableAudiogramSensitivityPoint setFrequency:](self, "setFrequency:");
  }
  leftEarSensitivity = self->_leftEarSensitivity;
  uint64_t v8 = *((void *)v4 + 2);
  if (leftEarSensitivity)
  {
    if (v8) {
      -[HKCodableQuantity mergeFrom:](leftEarSensitivity, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[HKCodableAudiogramSensitivityPoint setLeftEarSensitivity:](self, "setLeftEarSensitivity:");
  }
  rightEarSensitivity = self->_rightEarSensitivity;
  uint64_t v10 = *((void *)v4 + 3);
  if (rightEarSensitivity)
  {
    if (v10) {
      -[HKCodableQuantity mergeFrom:](rightEarSensitivity, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[HKCodableAudiogramSensitivityPoint setRightEarSensitivity:](self, "setRightEarSensitivity:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v4 + 4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[HKCodableAudiogramSensitivityPoint addTests:](self, "addTests:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (HKCodableQuantity)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(id)a3
{
}

- (HKCodableQuantity)leftEarSensitivity
{
  return self->_leftEarSensitivity;
}

- (void)setLeftEarSensitivity:(id)a3
{
}

- (HKCodableQuantity)rightEarSensitivity
{
  return self->_rightEarSensitivity;
}

- (void)setRightEarSensitivity:(id)a3
{
}

- (NSMutableArray)tests
{
  return self->_tests;
}

- (void)setTests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tests, 0);
  objc_storeStrong((id *)&self->_rightEarSensitivity, 0);
  objc_storeStrong((id *)&self->_leftEarSensitivity, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
}

@end