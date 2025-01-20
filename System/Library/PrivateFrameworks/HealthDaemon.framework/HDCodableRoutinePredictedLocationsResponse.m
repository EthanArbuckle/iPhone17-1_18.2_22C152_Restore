@interface HDCodableRoutinePredictedLocationsResponse
+ (Class)predictedLocationsOfInterestType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)predictedLocationsOfInterests;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)predictedLocationsOfInterestAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)predictedLocationsOfInterestsCount;
- (void)addPredictedLocationsOfInterest:(id)a3;
- (void)clearPredictedLocationsOfInterests;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPredictedLocationsOfInterests:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableRoutinePredictedLocationsResponse

- (void)clearPredictedLocationsOfInterests
{
}

- (void)addPredictedLocationsOfInterest:(id)a3
{
  id v4 = a3;
  predictedLocationsOfInterests = self->_predictedLocationsOfInterests;
  id v8 = v4;
  if (!predictedLocationsOfInterests)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_predictedLocationsOfInterests;
    self->_predictedLocationsOfInterests = v6;

    id v4 = v8;
    predictedLocationsOfInterests = self->_predictedLocationsOfInterests;
  }
  [(NSMutableArray *)predictedLocationsOfInterests addObject:v4];
}

- (unint64_t)predictedLocationsOfInterestsCount
{
  return [(NSMutableArray *)self->_predictedLocationsOfInterests count];
}

- (id)predictedLocationsOfInterestAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_predictedLocationsOfInterests objectAtIndex:a3];
}

+ (Class)predictedLocationsOfInterestType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableRoutinePredictedLocationsResponse;
  id v4 = [(HDCodableRoutinePredictedLocationsResponse *)&v8 description];
  v5 = [(HDCodableRoutinePredictedLocationsResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_predictedLocationsOfInterests count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_predictedLocationsOfInterests, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_predictedLocationsOfInterests;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"predictedLocationsOfInterest"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutinePredictedLocationsResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_predictedLocationsOfInterests;
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
  if ([(HDCodableRoutinePredictedLocationsResponse *)self predictedLocationsOfInterestsCount])
  {
    [v8 clearPredictedLocationsOfInterests];
    unint64_t v4 = [(HDCodableRoutinePredictedLocationsResponse *)self predictedLocationsOfInterestsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableRoutinePredictedLocationsResponse *)self predictedLocationsOfInterestAtIndex:i];
        [v8 addPredictedLocationsOfInterest:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_predictedLocationsOfInterests;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addPredictedLocationsOfInterest:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    predictedLocationsOfInterests = self->_predictedLocationsOfInterests;
    if ((unint64_t)predictedLocationsOfInterests | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](predictedLocationsOfInterests, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_predictedLocationsOfInterests hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[HDCodableRoutinePredictedLocationsResponse addPredictedLocationsOfInterest:](self, "addPredictedLocationsOfInterest:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)predictedLocationsOfInterests
{
  return self->_predictedLocationsOfInterests;
}

- (void)setPredictedLocationsOfInterests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end