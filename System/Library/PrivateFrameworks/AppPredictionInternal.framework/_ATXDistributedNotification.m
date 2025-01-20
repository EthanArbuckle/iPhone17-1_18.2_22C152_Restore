@interface _ATXDistributedNotification
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualTo_ATXDistributedNotification:(id)a3;
- (NSDictionary)userInfo;
- (NSString)name;
- (_ATXDistributedNotification)initWithName:(id)a3 userInfo:(id)a4;
- (double)timestamp;
- (unint64_t)hash;
@end

@implementation _ATXDistributedNotification

- (_ATXDistributedNotification)initWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_ATXDistributedNotification;
  v8 = [(_ATXDistributedNotification *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    userInfo = v8->_userInfo;
    v8->_userInfo = (NSDictionary *)v11;

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v8->_timestamp = v13;
    v14 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(_ATXDistributedNotification *)self name];
  uint64_t v4 = [v3 hash];

  v5 = [(_ATXDistributedNotification *)self userInfo];
  unint64_t v6 = [v5 hash] - v4 + 32 * v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_ATXDistributedNotification *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_ATXDistributedNotification *)self isEqualTo_ATXDistributedNotification:v5];

  return v6;
}

- (BOOL)isEqualTo_ATXDistributedNotification:(id)a3
{
  uint64_t v4 = (id *)a3;
  name = self->_name;
  BOOL v6 = (NSString *)v4[1];
  if (name == v6)
  {
  }
  else
  {
    id v7 = v6;
    v8 = name;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  uint64_t v11 = self->_userInfo;
  v12 = v11;
  if (v11 == v4[2]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSDictionary isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end