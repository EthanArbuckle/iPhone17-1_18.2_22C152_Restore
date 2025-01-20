@interface C2MetricOperationGroupOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (C2MetricOperationGroupOptions)initWithCoder:(id)a3;
- (NSString)operationGroupId;
- (NSString)operationGroupName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setOperationGroupId:(id)a3;
- (void)setOperationGroupName:(id)a3;
@end

@implementation C2MetricOperationGroupOptions

- (NSString)operationGroupId
{
  return self->_operationGroupId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[C2MetricOperationGroupOptions allocWithZone:a3];
  if (v4)
  {
    v5 = [(C2MetricOperationGroupOptions *)self operationGroupId];
    [(C2MetricOperationGroupOptions *)v4 setOperationGroupId:v5];

    v6 = [(C2MetricOperationGroupOptions *)self operationGroupName];
    [(C2MetricOperationGroupOptions *)v4 setOperationGroupName:v6];
  }
  return v4;
}

- (void)setOperationGroupName:(id)a3
{
}

- (void)setOperationGroupId:(id)a3
{
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_operationGroupId, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (C2MetricOperationGroupOptions *)a3;
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
      operationGroupId = self->_operationGroupId;
      uint64_t v7 = [(C2MetricOperationGroupOptions *)v5 operationGroupId];
      if (operationGroupId == (NSString *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        v9 = self->_operationGroupId;
        if (!v9) {
          goto LABEL_14;
        }
        v10 = [(C2MetricOperationGroupOptions *)v5 operationGroupId];
        int v11 = [(NSString *)v9 isEqual:v10];

        if (!v11) {
          goto LABEL_15;
        }
      }
      operationGroupName = self->_operationGroupName;
      uint64_t v14 = [(C2MetricOperationGroupOptions *)v5 operationGroupName];
      if (operationGroupName == (NSString *)v14)
      {

LABEL_17:
        BOOL v12 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v14;
      v15 = self->_operationGroupName;
      if (v15)
      {
        v16 = [(C2MetricOperationGroupOptions *)v5 operationGroupName];
        char v17 = [(NSString *)v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
LABEL_15:
        BOOL v12 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    BOOL v12 = 0;
  }
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_operationGroupId hash];
  return [(NSString *)self->_operationGroupName hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  operationGroupId = self->_operationGroupId;
  id v5 = a3;
  [v5 encodeObject:operationGroupId forKey:@"id"];
  [v5 encodeObject:self->_operationGroupName forKey:@"name"];
}

- (C2MetricOperationGroupOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)C2MetricOperationGroupOptions;
  id v5 = [(C2MetricOperationGroupOptions *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    operationGroupId = v5->_operationGroupId;
    v5->_operationGroupId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    operationGroupName = v5->_operationGroupName;
    v5->_operationGroupName = (NSString *)v8;
  }
  return v5;
}

@end