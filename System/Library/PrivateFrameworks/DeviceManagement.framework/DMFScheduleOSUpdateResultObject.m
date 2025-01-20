@interface DMFScheduleOSUpdateResultObject
+ (BOOL)supportsSecureCoding;
- (DMFScheduleOSUpdateResultObject)initWithAction:(unint64_t)a3 productKey:(id)a4 error:(id)a5;
- (DMFScheduleOSUpdateResultObject)initWithCoder:(id)a3;
- (NSError)error;
- (NSString)productKey;
- (id)description;
- (unint64_t)action;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFScheduleOSUpdateResultObject

- (DMFScheduleOSUpdateResultObject)initWithAction:(unint64_t)a3 productKey:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DMFScheduleOSUpdateResultObject;
  v10 = [(CATTaskResultObject *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_action = a3;
    uint64_t v12 = [v8 copy];
    productKey = v11->_productKey;
    v11->_productKey = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    error = v11->_error;
    v11->_error = (NSError *)v14;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFScheduleOSUpdateResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMFScheduleOSUpdateResultObject;
  v5 = [(CATTaskResultObject *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    v5->_action = [v6 unsignedIntegerValue];

    v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"productKey"];
    productKey = v5->_productKey;
    v5->_productKey = (NSString *)v8;

    v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DMFScheduleOSUpdateResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v8 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFScheduleOSUpdateResultObject action](self, "action", v8.receiver, v8.super_class));
  [v4 encodeObject:v5 forKey:@"action"];

  v6 = [(DMFScheduleOSUpdateResultObject *)self productKey];
  [v4 encodeObject:v6 forKey:@"productKey"];

  v7 = [(DMFScheduleOSUpdateResultObject *)self error];
  [v4 encodeObject:v7 forKey:@"error"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  id v4 = +[DMFScheduleOSUpdateRequest _descriptionForAction:[(DMFScheduleOSUpdateResultObject *)self action]];
  [v3 appendFormat:@"\tAction      : %@\n", v4];

  uint64_t v5 = [(DMFScheduleOSUpdateResultObject *)self productKey];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"None";
  }
  [v3 appendFormat:@"\tProduct Key : %@\n", v7];

  uint64_t v8 = [(DMFScheduleOSUpdateResultObject *)self error];
  id v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = @"None";
  }
  [v3 appendFormat:@"\tError       : %@\n", v10];

  [v3 appendString:@"}>"];
  uint64_t v11 = (void *)[v3 copy];

  return v11;
}

- (unint64_t)action
{
  return self->_action;
}

- (NSString)productKey
{
  return self->_productKey;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_productKey, 0);
}

@end