@interface SGPseudoReminderKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPseudoReminderKey:(id)a3;
- (NSString)description;
- (NSString)groupId;
- (SGPseudoReminderKey)initWithGroupId:(id)a3;
- (id)serialize;
- (unint64_t)hash;
@end

@implementation SGPseudoReminderKey

- (void).cxx_destruct
{
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"[SGPseudoReminderKey groupId:%@", self->_groupId];
  return (NSString *)v2;
}

- (id)serialize
{
  return self->_groupId;
}

- (unint64_t)hash
{
  return [(NSString *)self->_groupId hash];
}

- (BOOL)isEqualToPseudoReminderKey:(id)a3
{
  v4 = self->_groupId;
  v5 = v4;
  if (v4 == *((NSString **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSString isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGPseudoReminderKey *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGPseudoReminderKey *)self isEqualToPseudoReminderKey:v5];

  return v6;
}

- (SGPseudoReminderKey)initWithGroupId:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGPseudoReminderKey.m", 21, @"Invalid parameter not satisfying: %@", @"groupId" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SGPseudoReminderKey;
  v7 = [(SGPseudoReminderKey *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_groupId, a3);
  }

  return v8;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  if ((unint64_t)a3 < 0x1C) {
    return (a3 & 0xFFFFFFF) == 22;
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGPseudoReminderKey.m", 85, @"Unknown entity type: %lu", a3);

  return 0;
}

@end