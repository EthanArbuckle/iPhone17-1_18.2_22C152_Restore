@interface SGRealtimeReminder
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRealtimeReminder:(id)a3;
- (NSString)description;
- (NSString)notes;
- (SGRealtimeReminder)initWithCoder:(id)a3;
- (SGRealtimeReminder)initWithReminder:(id)a3 notes:(id)a4;
- (SGReminder)reminder;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGRealtimeReminder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);

  objc_storeStrong((id *)&self->_reminder, 0);
}

- (NSString)notes
{
  return self->_notes;
}

- (SGReminder)reminder
{
  return self->_reminder;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGRealtimeReminder reminder='%@'>", self->_reminder];

  return (NSString *)v2;
}

- (BOOL)isEqualToRealtimeReminder:(id)a3
{
  v4 = (id *)a3;
  reminder = self->_reminder;
  v6 = (SGReminder *)v4[1];
  if (reminder == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = reminder;
    BOOL v9 = [(SGReminder *)v8 isEqual:v7];

    if (!v9)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_notes;
  v12 = v11;
  if (v11 == v4[2]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSString isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGRealtimeReminder *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGRealtimeReminder *)self isEqualToRealtimeReminder:v5];

  return v6;
}

- (SGRealtimeReminder)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGRealtimeReminder;
  v5 = [(SGRealtimeReminder *)&v13 init];
  if (v5)
  {
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"reminder"];
    reminder = v5->_reminder;
    v5->_reminder = (SGReminder *)v7;

    BOOL v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"notes"];
    notes = v5->_notes;
    v5->_notes = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  reminder = self->_reminder;
  id v5 = a3;
  [v5 encodeObject:reminder forKey:@"reminder"];
  [v5 encodeObject:self->_notes forKey:@"notes"];
}

- (SGRealtimeReminder)initWithReminder:(id)a3 notes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGRealtimeReminder;
  BOOL v9 = [(SGRealtimeReminder *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reminder, a3);
    objc_storeStrong((id *)&v10->_notes, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end