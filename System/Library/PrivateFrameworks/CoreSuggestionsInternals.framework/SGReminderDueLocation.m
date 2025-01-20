@interface SGReminderDueLocation
+ (id)mergeDueLocations:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReminderDueLocation:(id)a3;
- (NSString)name;
- (SGReminderDueLocation)initWithLocationType:(unsigned __int8)a3 trigger:(unsigned __int8)a4 name:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)locationType;
- (unsigned)trigger;
@end

@implementation SGReminderDueLocation

- (void).cxx_destruct
{
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)trigger
{
  return self->_trigger;
}

- (unsigned)locationType
{
  return self->_locationType;
}

- (BOOL)isEqualToReminderDueLocation:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4
    && (int locationType = self->_locationType, locationType == [v4 locationType])
    && (int trigger = self->_trigger, trigger == [v5 trigger]))
  {
    v8 = self->_name;
    v9 = v8;
    if (v8 == (NSString *)v5[2]) {
      char v10 = 1;
    }
    else {
      char v10 = -[NSString isEqual:](v8, "isEqual:");
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGReminderDueLocation *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGReminderDueLocation *)self isEqualToReminderDueLocation:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v5 = objc_opt_new();
  BOOL v6 = (void *)v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 8) = self->_locationType;
    *(unsigned char *)(v5 + 9) = self->_trigger;
    uint64_t v7 = [(NSString *)self->_name copyWithZone:a3];
    v8 = (void *)v6[2];
    v6[2] = v7;
  }
  return v6;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_trigger - (unint64_t)self->_locationType + 32 * self->_locationType;
  return [(NSString *)self->_name hash] - v2 + 32 * v2;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [MEMORY[0x1E4F5DB28] describeReminderDueLocationType:self->_locationType];
  uint64_t v5 = [MEMORY[0x1E4F5DB28] describeReminderDueLocationTrigger:self->_trigger];
  BOOL v6 = (void *)[v3 initWithFormat:@"<SGReminderDueLocation type:'%@' trigger: %@ name: %@>", v4, v5, self->_name];

  return v6;
}

- (SGReminderDueLocation)initWithLocationType:(unsigned __int8)a3 trigger:(unsigned __int8)a4 name:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SGReminderDueLocation;
  char v10 = [(SGReminderDueLocation *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_int locationType = a3;
    v10->_int trigger = a4;
    objc_storeStrong((id *)&v10->_name, a5);
  }

  return v11;
}

+ (id)mergeDueLocations:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = objc_msgSend(v3, "allObjects", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned __int8 v7 = 0;
    unsigned __int8 v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v4);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v13 = [v12 locationType];
        if (v7)
        {
          if (v13 && [v12 locationType] != v7) {
            goto LABEL_26;
          }
        }
        else
        {
          unsigned __int8 v7 = v13;
        }
        int v14 = [v12 trigger];
        if (v8)
        {
          if (v14 && [v12 trigger] != v8) {
            goto LABEL_26;
          }
        }
        else
        {
          unsigned __int8 v8 = v14;
        }
        v15 = [v12 name];
        v16 = v15;
        if (v9)
        {
          if (v15 && ([v9 isEqualToString:v15] & 1) == 0)
          {

LABEL_26:
            v17 = 0;
            goto LABEL_27;
          }
        }
        else
        {
          id v9 = v15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
    unsigned __int8 v8 = 0;
    id v9 = 0;
  }

  v17 = [[SGReminderDueLocation alloc] initWithLocationType:v7 trigger:v8 name:v9];
LABEL_27:

  return v17;
}

@end