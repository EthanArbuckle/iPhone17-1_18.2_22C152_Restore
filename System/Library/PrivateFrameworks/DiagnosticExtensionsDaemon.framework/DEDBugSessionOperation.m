@interface DEDBugSessionOperation
+ (BOOL)supportsSecureCoding;
+ (id)archivedClasses;
+ (id)hashingKeyWithId:(id)a3 type:(int64_t)a4;
- (DEDBugSessionOperation)initWithCoder:(id)a3;
- (NSDictionary)options;
- (NSString)description;
- (NSString)identifier;
- (id)hashingKey;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOptions:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation DEDBugSessionOperation

- (NSString)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)DEDBugSessionOperation;
  v4 = [(DEDBugSessionOperation *)&v11 description];
  uint64_t v5 = [(DEDBugSessionOperation *)self type];
  if (v5 > 99)
  {
    switch(v5)
    {
      case 100:
        v6 = "Notify";
        goto LABEL_15;
      case 1000:
        v6 = "Finish";
        goto LABEL_15;
      case 2000:
        v6 = "Cancel";
        goto LABEL_15;
    }
  }
  else
  {
    switch(v5)
    {
      case 0:
        v6 = "Kill";
        goto LABEL_15;
      case 1:
        v6 = "Collect";
        goto LABEL_15;
      case 2:
        v6 = "CollectDefer";
        goto LABEL_15;
    }
  }
  v6 = "Unknown";
LABEL_15:
  v7 = [(DEDBugSessionOperation *)self identifier];
  v8 = [(DEDBugSessionOperation *)self options];
  v9 = [v3 stringWithFormat:@"%@ type: [%s] id: [%@] options: %@", v4, v6, v7, v8];

  return (NSString *)v9;
}

+ (id)hashingKeyWithId:(id)a3 type:(int64_t)a4
{
  if (a4 > 99)
  {
    switch(a4)
    {
      case 100:
        v4 = "Notify";
        return (id)[NSString stringWithFormat:@"%s(%@)", v4, a3];
      case 1000:
        v4 = "Finish";
        return (id)[NSString stringWithFormat:@"%s(%@)", v4, a3];
      case 2000:
        v4 = "Cancel";
        return (id)[NSString stringWithFormat:@"%s(%@)", v4, a3];
    }
LABEL_14:
    v4 = "Unknown";
    return (id)[NSString stringWithFormat:@"%s(%@)", v4, a3];
  }
  if (!a4)
  {
    v4 = "Kill";
    return (id)[NSString stringWithFormat:@"%s(%@)", v4, a3];
  }
  if (a4 == 1)
  {
    v4 = "Collect";
    return (id)[NSString stringWithFormat:@"%s(%@)", v4, a3];
  }
  if (a4 != 2) {
    goto LABEL_14;
  }
  v4 = "CollectDefer";
  return (id)[NSString stringWithFormat:@"%s(%@)", v4, a3];
}

- (id)hashingKey
{
  v3 = objc_opt_class();
  v4 = [(DEDBugSessionOperation *)self identifier];
  uint64_t v5 = objc_msgSend(v3, "hashingKeyWithId:type:", v4, -[DEDBugSessionOperation type](self, "type"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEDBugSessionOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DEDBugSessionOperation;
  uint64_t v5 = [(DEDBugSessionOperation *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionOpID"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"sessionOpType"];
    v8 = +[DEDBugSessionOperation archivedClasses];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"sessionOpOptions"];
    options = v5->_options;
    v5->_options = (NSDictionary *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDBugSessionOperation *)self identifier];
  [v4 encodeObject:v5 forKey:@"sessionOpID"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDBugSessionOperation type](self, "type"), @"sessionOpType");
  id v6 = [(DEDBugSessionOperation *)self options];
  [v4 encodeObject:v6 forKey:@"sessionOpOptions"];
}

+ (id)archivedClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOptions:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end