@interface BMContextualActionParameter
+ (BOOL)supportsSecureCoding;
- (BMContextualActionParameter)initWithCoder:(id)a3;
- (BMContextualActionParameter)initWithType:(id)a3 metadata:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)parameterMetadata;
- (NSString)parameterType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMContextualActionParameter

- (BMContextualActionParameter)initWithType:(id)a3 metadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMContextualActionParameter;
  v9 = [(BMContextualActionParameter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parameterType, a3);
    objc_storeStrong((id *)&v10->_parameterMetadata, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  parameterType = self->_parameterType;
  id v5 = a3;
  [v5 encodeObject:parameterType forKey:@"parameterType"];
  [v5 encodeObject:self->_parameterMetadata forKey:@"parameterMetadata"];
}

- (BMContextualActionParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterType"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  objc_super v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"parameterMetadata"];

  v14 = [(BMContextualActionParameter *)self initWithType:v5 metadata:v13];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    uint64_t v7 = [(BMContextualActionParameter *)self parameterType];
    if (v7 || ([v6 parameterType], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v8 = [(BMContextualActionParameter *)self parameterType];
      uint64_t v9 = [v6 parameterType];
      char v10 = [v8 isEqual:v9];

      if (v7)
      {
LABEL_9:

        objc_super v12 = [(BMContextualActionParameter *)self parameterMetadata];
        if (v12 || ([v6 parameterMetadata], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v13 = [(BMContextualActionParameter *)self parameterMetadata];
          v14 = [v6 parameterMetadata];
          char v15 = [v13 isEqualToDictionary:v14];

          if (v12)
          {
LABEL_15:

            char v11 = v10 & v15;
            goto LABEL_16;
          }
        }
        else
        {
          char v15 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      char v10 = 1;
    }

    goto LABEL_9;
  }
  char v11 = 0;
LABEL_16:

  return v11;
}

- (NSString)parameterType
{
  return self->_parameterType;
}

- (NSDictionary)parameterMetadata
{
  return self->_parameterMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterMetadata, 0);

  objc_storeStrong((id *)&self->_parameterType, 0);
}

@end