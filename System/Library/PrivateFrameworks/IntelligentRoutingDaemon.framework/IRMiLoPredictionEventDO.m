@interface IRMiLoPredictionEventDO
+ (BOOL)supportsSecureCoding;
+ (IRMiLoPredictionEventDO)miLoPredictionEventDOWithLabel:(id)a3 predictionId:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMiLoPredictionEventDO:(id)a3;
- (IRMiLoPredictionEventDO)initWithCoder:(id)a3;
- (IRMiLoPredictionEventDO)initWithLabel:(id)a3 predictionId:(id)a4;
- (NSString)label;
- (NSString)predictionId;
- (id)copyWithReplacementLabel:(id)a3;
- (id)copyWithReplacementPredictionId:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRMiLoPredictionEventDO

- (IRMiLoPredictionEventDO)initWithLabel:(id)a3 predictionId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IRMiLoPredictionEventDO;
  v9 = [(IRMiLoPredictionEventDO *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    objc_storeStrong((id *)&v10->_predictionId, a4);
  }

  return v10;
}

+ (IRMiLoPredictionEventDO)miLoPredictionEventDOWithLabel:(id)a3 predictionId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithLabel:v7 predictionId:v6];

  return (IRMiLoPredictionEventDO *)v8;
}

- (id)copyWithReplacementLabel:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLabel:v4 predictionId:self->_predictionId];

  return v5;
}

- (id)copyWithReplacementPredictionId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLabel:self->_label predictionId:v4];

  return v5;
}

- (BOOL)isEqualToMiLoPredictionEventDO:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_label != 0;
  id v7 = [v4 label];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  label = self->_label;
  if (label)
  {
    v10 = [v5 label];
    int v11 = [(NSString *)label isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_predictionId != 0;
  v13 = [v5 predictionId];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    predictionId = self->_predictionId;
    if (predictionId)
    {
      v16 = [v5 predictionId];
      char v17 = [(NSString *)predictionId isEqual:v16];
    }
    else
    {
      char v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRMiLoPredictionEventDO *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRMiLoPredictionEventDO *)self isEqualToMiLoPredictionEventDO:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  return [(NSString *)self->_predictionId hash] - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRMiLoPredictionEventDO)initWithCoder:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRMiLoPredictionEventDO key \"label\" (expected %@, decoded %@)", v7, v9, 0];
      uint64_t v22 = *MEMORY[0x263F08320];
      v23[0] = v10;
      int v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
      int v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRMiLoPredictionEventDOOCNTErrorDomain" code:3 userInfo:v11];
      [v4 failWithError:v12];
LABEL_9:

LABEL_10:
      int v14 = 0;
LABEL_13:

      goto LABEL_14;
    }
LABEL_6:
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionId"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v15);
        v16 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v16);
        int v11 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRMiLoPredictionEventDO key \"predictionId\" (expected %@, decoded %@)", v9, v10, 0];
        uint64_t v20 = *MEMORY[0x263F08320];
        v21 = v11;
        int v12 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        char v17 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRMiLoPredictionEventDOOCNTErrorDomain" code:3 userInfo:v12];
        [v4 failWithError:v17];

        goto LABEL_9;
      }
    }
    else
    {
      v18 = [v4 error];

      if (v18) {
        goto LABEL_10;
      }
    }
    self = [(IRMiLoPredictionEventDO *)self initWithLabel:v5 predictionId:v7];
    int v14 = self;
    goto LABEL_13;
  }
  v13 = [v4 error];

  if (!v13) {
    goto LABEL_6;
  }
  int v14 = 0;
LABEL_14:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  label = self->_label;
  id v7 = v4;
  if (label)
  {
    [v4 encodeObject:label forKey:@"label"];
    id v4 = v7;
  }
  predictionId = self->_predictionId;
  if (predictionId)
  {
    [v7 encodeObject:predictionId forKey:@"predictionId"];
    id v4 = v7;
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<IRMiLoPredictionEventDO | label:%@ predictionId:%@>", self->_label, self->_predictionId];

  return v2;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)predictionId
{
  return self->_predictionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionId, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end