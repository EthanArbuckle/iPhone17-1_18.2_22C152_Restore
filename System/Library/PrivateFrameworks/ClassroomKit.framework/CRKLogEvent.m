@interface CRKLogEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEvent:(id)a3;
- (CRKLogEvent)init;
- (CRKLogEvent)initWithCoder:(id)a3;
- (CRKLogEvent)initWithName:(id)a3 date:(id)a4 userInfo:(id)a5;
- (NSDate)date;
- (NSDictionary)userInfo;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setName:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation CRKLogEvent

- (CRKLogEvent)init
{
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [(CRKLogEvent *)self initWithName:@"NO NAME" date:v3 userInfo:0];

  return v4;
}

- (CRKLogEvent)initWithName:(id)a3 date:(id)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"CRKLogEvent.m", 28, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x263F08690] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"CRKLogEvent.m", 29, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)CRKLogEvent;
  v12 = [(CRKLogEvent *)&v20 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    objc_storeStrong((id *)&v12->_date, a4);
    uint64_t v15 = [v11 copy];
    userInfo = v12->_userInfo;
    v12->_userInfo = (NSDictionary *)v15;
  }
  return v12;
}

- (unint64_t)hash
{
  v3 = [(CRKLogEvent *)self name];
  uint64_t v4 = [v3 hash];
  v5 = [(CRKLogEvent *)self date];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(CRKLogEvent *)self userInfo];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CRKLogEvent *)self isEqualToEvent:v4];

  return v5;
}

- (BOOL)isEqualToEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(CRKLogEvent *)self name];
    uint64_t v6 = [v4 name];
    unint64_t v7 = v5;
    unint64_t v8 = v6;
    if (v7 | v8 && (int v9 = [(id)v7 isEqual:v8], (id)v8, (id)v7, !v9))
    {
      char v17 = 0;
    }
    else
    {
      id v10 = [(CRKLogEvent *)self date];
      id v11 = [v4 date];
      unint64_t v12 = v10;
      unint64_t v13 = v11;
      if (v12 | v13
        && (int v14 = [(id)v12 isEqual:v13], (id)v13, (id)v12, !v14))
      {
        char v17 = 0;
      }
      else
      {
        uint64_t v15 = [(CRKLogEvent *)self userInfo];
        uint64_t v16 = [v4 userInfo];
        if (v15 | v16) {
          char v17 = [(id)v15 isEqual:v16];
        }
        else {
          char v17 = 1;
        }
      }
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CRKLogEvent *)self name];
  uint64_t v6 = [(CRKLogEvent *)self date];
  unint64_t v7 = [(CRKLogEvent *)self userInfo];
  unint64_t v8 = [v3 stringWithFormat:@"<%@: %p { name = %@, date = %@, userInfo = %@ }>", v4, self, v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRKLogEvent *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  uint64_t v6 = [(CRKLogEvent *)self date];
  [v4 encodeObject:v6 forKey:@"date"];

  id v7 = [(CRKLogEvent *)self userInfo];
  [v4 encodeObject:v7 forKey:@"userInfo"];
}

- (CRKLogEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CRKLogEvent;
  BOOL v5 = [(CRKLogEvent *)&v27 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    int v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v10;

    v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    objc_super v20 = objc_msgSend(v26, "setWithObjects:", v25, v24, v12, v13, v14, v15, v16, v17, v18, v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v21;
  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end