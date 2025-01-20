@interface BMDSLArray
+ (BOOL)supportsSecureCoding;
- (BMDSLArray)initWithCoder:(id)a3;
- (BMDSLArray)initWithName:(id)a3 version:(unsigned int)a4 values:(id)a5 valueClassName:(id)a6;
- (BMDSLArray)initWithValues:(id)a3 valueClassName:(id)a4;
- (NSArray)values;
- (NSString)valueClassName;
- (id)bpsPublisher;
- (id)upstreams;
- (void)encodeWithCoder:(id)a3;
- (void)setValueClassName:(id)a3;
@end

@implementation BMDSLArray

- (BMDSLArray)initWithName:(id)a3 version:(unsigned int)a4 values:(id)a5 valueClassName:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (a4 == 1)
  {
    v20.receiver = self;
    v20.super_class = (Class)BMDSLArray;
    v12 = [(BMDSLBaseCodable *)&v20 initWithName:a3 version:1];
    if (v12)
    {
      uint64_t v13 = [v10 copy];
      values = v12->_values;
      v12->_values = (NSArray *)v13;

      uint64_t v15 = [v11 copy];
      valueClassName = v12->_valueClassName;
      v12->_valueClassName = (NSString *)v15;
    }
    self = v12;
    v17 = self;
  }
  else
  {
    v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[BMDSLArray initWithName:version:values:valueClassName:](a4, v18);
    }

    v17 = 0;
  }

  return v17;
}

- (BMDSLArray)initWithValues:(id)a3 valueClassName:(id)a4
{
  return [(BMDSLArray *)self initWithName:@"array" version:1 values:a3 valueClassName:a4];
}

- (id)upstreams
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BMDSLArray;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v7 encodeWithCoder:v4];
  v5 = [(BMDSLArray *)self values];
  [v4 encodeObject:v5 forKey:@"values"];

  v6 = [(BMDSLArray *)self valueClassName];
  [v4 encodeObject:v6 forKey:@"valueClassName"];
}

- (BMDSLArray)initWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMDSLArray;
  v6 = [(BMDSLBaseCodable *)&v29 initWithCoder:v5];
  if (v6)
  {
    objc_super v7 = v6;
    v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"valueClassName"];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v9 = +[BMDSLClasses allowed];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = NSStringFromClass(*(Class *)(*((void *)&v25 + 1) + 8 * v13));
          char v15 = [v14 isEqualToString:v8];

          if (v15)
          {

            v16 = NSClassFromString(v8);
            v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), v16, 0);
            if (!v16)
            {
              v22 = [MEMORY[0x1E4F28B00] currentHandler];
              v23 = (objc_class *)objc_opt_class();
              v24 = NSStringFromClass(v23);
              [v22 handleFailureInMethod:a2, v7, @"BMDSLArray.m", 75, @"%@ - Can't get class from string %@", v24, v8 object file lineNumber description];
            }
            v19 = [v5 decodeObjectOfClasses:v18 forKey:@"values"];
            objc_super v20 = [(BMDSLBaseCodable *)v7 name];
            objc_super v7 = [(BMDSLArray *)v7 initWithName:v20 version:[(BMDSLBaseCodable *)v7 version] values:v19 valueClassName:v8];

            v17 = v7;
            goto LABEL_14;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:v7 file:@"BMDSLArray.m" lineNumber:69 description:@"Decoded class not in allow list"];
    v17 = 0;
LABEL_14:
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSArray)values
{
  return self->_values;
}

- (NSString)valueClassName
{
  return self->_valueClassName;
}

- (void)setValueClassName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueClassName, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

- (id)bpsPublisher
{
  v2 = [(BMDSLArray *)self values];
  v3 = [v2 bpsPublisher];

  return v3;
}

- (void)initWithName:(int)a1 version:(NSObject *)a2 values:valueClassName:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3086000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLArray", (uint8_t *)v2, 8u);
}

@end