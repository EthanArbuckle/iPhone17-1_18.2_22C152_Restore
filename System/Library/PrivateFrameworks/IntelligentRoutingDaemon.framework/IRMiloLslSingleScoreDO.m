@interface IRMiloLslSingleScoreDO
+ (BOOL)supportsSecureCoding;
+ (id)miloLslSingleScoreDOWithScore:(double)a3 eventID:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMiloLslSingleScoreDO:(id)a3;
- (IRMiloLslSingleScoreDO)initWithCoder:(id)a3;
- (IRMiloLslSingleScoreDO)initWithScore:(double)a3 eventID:(id)a4;
- (NSString)eventID;
- (double)score;
- (id)copyWithReplacementEventID:(id)a3;
- (id)copyWithReplacementScore:(double)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRMiloLslSingleScoreDO

- (IRMiloLslSingleScoreDO)initWithScore:(double)a3 eventID:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRMiloLslSingleScoreDO;
  v8 = [(IRMiloLslSingleScoreDO *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_score = a3;
    objc_storeStrong((id *)&v8->_eventID, a4);
  }

  return v9;
}

+ (id)miloLslSingleScoreDOWithScore:(double)a3 eventID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithScore:v6 eventID:a3];

  return v7;
}

- (id)copyWithReplacementScore:(double)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  eventID = self->_eventID;

  return (id)[v5 initWithScore:eventID eventID:a3];
}

- (id)copyWithReplacementEventID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithScore:v4 eventID:self->_score];

  return v5;
}

- (BOOL)isEqualToMiloLslSingleScoreDO:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (double score = self->_score, [v4 score], score == v7)
    && (int v8 = self->_eventID != 0,
        [v5 eventID],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = v9 == 0,
        v9,
        v8 != v10))
  {
    eventID = self->_eventID;
    if (eventID)
    {
      v12 = [v5 eventID];
      char v13 = [(NSString *)eventID isEqual:v12];
    }
    else
    {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRMiloLslSingleScoreDO *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRMiloLslSingleScoreDO *)self isEqualToMiloLslSingleScoreDO:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t score = (unint64_t)self->_score;
  return [(NSString *)self->_eventID hash] - score + 32 * score;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRMiloLslSingleScoreDO)initWithCoder:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"score"];
  if (v5) {
    goto LABEL_2;
  }
  v14 = [v4 error];

  if (!v14)
  {
    if (([v4 containsValueForKey:@"score"] & 1) == 0)
    {
      uint64_t v20 = *MEMORY[0x263F08320];
      v21[0] = @"Missing serialized value for IRMiloLslSingleScoreDO.score";
      BOOL v6 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      int v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRMiloLslSingleScoreDOOCNTErrorDomain" code:1 userInfo:v6];
      [v4 failWithError:v8];
      goto LABEL_11;
    }
LABEL_2:
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventID"];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v7 = (objc_class *)objc_opt_class();
        int v8 = NSStringFromClass(v7);
        v9 = (objc_class *)objc_opt_class();
        int v10 = NSStringFromClass(v9);
        objc_super v11 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRMiloLslSingleScoreDO key \"eventID\" (expected %@, decoded %@)", v8, v10, 0];
        uint64_t v18 = *MEMORY[0x263F08320];
        v19 = v11;
        v12 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        char v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRMiloLslSingleScoreDOOCNTErrorDomain" code:3 userInfo:v12];
        [v4 failWithError:v13];

LABEL_11:
        goto LABEL_12;
      }
    }
    else
    {
      v16 = [v4 error];

      if (v16)
      {
LABEL_12:
        v15 = 0;
        goto LABEL_13;
      }
    }
    self = [(IRMiloLslSingleScoreDO *)self initWithScore:v6 eventID:(double)v5];
    v15 = self;
LABEL_13:

    goto LABEL_14;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt64:(uint64_t)self->_score forKey:@"score"];
  eventID = self->_eventID;
  if (eventID) {
    [v5 encodeObject:eventID forKey:@"eventID"];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [NSNumber numberWithDouble:self->_score];
  id v5 = (void *)[v3 initWithFormat:@"<IRMiloLslSingleScoreDO | score:%@ eventID:%@>", v4, self->_eventID];

  return v5;
}

- (double)score
{
  return self->_score;
}

- (NSString)eventID
{
  return self->_eventID;
}

- (void).cxx_destruct
{
}

@end