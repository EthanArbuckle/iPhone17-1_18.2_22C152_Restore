@interface C2MetricOperationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (C2MetricOperationGroupOptions)operationGroup;
- (C2MetricOperationOptions)initWithCoder:(id)a3;
- (NSString)operationId;
- (NSString)operationType;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setOperationGroup:(id)a3;
- (void)setOperationId:(id)a3;
- (void)setOperationType:(id)a3;
@end

@implementation C2MetricOperationOptions

- (C2MetricOperationGroupOptions)operationGroup
{
  return self->_operationGroup;
}

- (NSString)operationType
{
  return self->_operationType;
}

- (NSString)operationId
{
  return self->_operationId;
}

- (void)setOperationType:(id)a3
{
}

- (void)setOperationId:(id)a3
{
}

- (void)setOperationGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_storeStrong((id *)&self->_operationId, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[C2MetricOperationOptions allocWithZone:a3];
  if (v4)
  {
    v5 = [(C2MetricOperationOptions *)self operationGroup];
    [(C2MetricOperationOptions *)v4 setOperationGroup:v5];

    v6 = [(C2MetricOperationOptions *)self operationId];
    [(C2MetricOperationOptions *)v4 setOperationId:v6];

    v7 = [(C2MetricOperationOptions *)self operationType];
    [(C2MetricOperationOptions *)v4 setOperationType:v7];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (C2MetricOperationOptions *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      operationGroup = self->_operationGroup;
      uint64_t v7 = [(C2MetricOperationOptions *)v5 operationGroup];
      if (operationGroup == (C2MetricOperationGroupOptions *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        v9 = self->_operationGroup;
        if (!v9) {
          goto LABEL_19;
        }
        v10 = [(C2MetricOperationOptions *)v5 operationGroup];
        BOOL v11 = [(C2MetricOperationGroupOptions *)v9 isEqual:v10];

        if (!v11) {
          goto LABEL_20;
        }
      }
      operationId = self->_operationId;
      uint64_t v14 = [(C2MetricOperationOptions *)v5 operationId];
      if (operationId == (NSString *)v14)
      {
      }
      else
      {
        v8 = (void *)v14;
        v15 = self->_operationId;
        if (!v15) {
          goto LABEL_19;
        }
        v16 = [(C2MetricOperationOptions *)v5 operationId];
        int v17 = [(NSString *)v15 isEqual:v16];

        if (!v17) {
          goto LABEL_20;
        }
      }
      operationType = self->_operationType;
      uint64_t v19 = [(C2MetricOperationOptions *)v5 operationType];
      if (operationType == (NSString *)v19)
      {

LABEL_24:
        BOOL v12 = 1;
        goto LABEL_21;
      }
      v8 = (void *)v19;
      v20 = self->_operationType;
      if (v20)
      {
        v21 = [(C2MetricOperationOptions *)v5 operationType];
        char v22 = [(NSString *)v20 isEqual:v21];

        if (v22) {
          goto LABEL_24;
        }
LABEL_20:
        BOOL v12 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    BOOL v12 = 0;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(C2MetricOperationGroupOptions *)self->_operationGroup hash];
  NSUInteger v4 = [(NSString *)self->_operationId hash] ^ v3;
  return v4 ^ [(NSString *)self->_operationType hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  operationGroup = self->_operationGroup;
  id v5 = a3;
  [v5 encodeObject:operationGroup forKey:@"operationGroup"];
  [v5 encodeObject:self->_operationId forKey:@"operationId"];
  [v5 encodeObject:self->_operationType forKey:@"operationType"];
}

- (C2MetricOperationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)C2MetricOperationOptions;
  id v5 = [(C2MetricOperationOptions *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationGroup"];
    operationGroup = v5->_operationGroup;
    v5->_operationGroup = (C2MetricOperationGroupOptions *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationId"];
    operationId = v5->_operationId;
    v5->_operationId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationType"];
    operationType = v5->_operationType;
    v5->_operationType = (NSString *)v10;
  }
  return v5;
}

@end