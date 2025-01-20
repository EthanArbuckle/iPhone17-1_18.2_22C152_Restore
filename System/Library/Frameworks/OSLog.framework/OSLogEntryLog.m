@interface OSLogEntryLog
+ (BOOL)supportsSecureCoding;
- (NSArray)components;
- (NSString)category;
- (NSString)formatString;
- (NSString)process;
- (NSString)sender;
- (NSString)subsystem;
- (OSLogEntryLog)initWithCoder:(id)a3;
- (OSLogEntryLog)initWithDate:(id)a3 composedMessage:(id)a4 processIdentifier:(int)a5;
- (OSLogEntryLog)initWithEventProxy:(id)a3;
- (OSLogEntryLogLevel)level;
- (int)processIdentifier;
- (unint64_t)activityIdentifier;
- (unint64_t)threadIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OSLogEntryLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_sender, 0);

  objc_storeStrong((id *)&self->_process, 0);
}

- (OSLogEntryLogLevel)level
{
  return self->_level;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (NSArray)components
{
  return self->_components;
}

- (NSString)category
{
  return self->_category;
}

- (unint64_t)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NSString)sender
{
  return self->_sender;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)process
{
  return self->_process;
}

- (unint64_t)activityIdentifier
{
  return self->_activityIdentifier;
}

- (OSLogEntryLog)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)OSLogEntryLog;
  v5 = [(OSLogEntry *)&v25 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityIdentifier"];
    v5->_activityIdentifier = [v6 unsignedLongLongValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"process"];
    process = v5->_process;
    v5->_process = (NSString *)v7;

    v5->_processIdentifier = [v4 decodeInt32ForKey:@"processIdentifier"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
    sender = v5->_sender;
    v5->_sender = (NSString *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threadIdentifier"];
    v5->_threadIdentifier = [v11 unsignedLongLongValue];

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    category = v5->_category;
    v5->_category = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    v16 = [v14 setWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"components"];
    components = v5->_components;
    v5->_components = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatString"];
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subsystem"];
    subsystem = v5->_subsystem;
    v5->_subsystem = (NSString *)v21;

    v5->_level = [v4 decodeIntegerForKey:@"level"];
    v23 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)OSLogEntryLog;
  id v4 = a3;
  [(OSLogEntry *)&v13 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[OSLogEntryLog activityIdentifier](self, "activityIdentifier", v13.receiver, v13.super_class));
  [v4 encodeObject:v5 forKey:@"activityIdentifier"];

  v6 = [(OSLogEntryLog *)self process];
  [v4 encodeObject:v6 forKey:@"process"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[OSLogEntryLog processIdentifier](self, "processIdentifier"), @"processIdentifier");
  uint64_t v7 = [(OSLogEntryLog *)self sender];
  [v4 encodeObject:v7 forKey:@"sender"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[OSLogEntryLog threadIdentifier](self, "threadIdentifier"));
  [v4 encodeObject:v8 forKey:@"threadIdentifier"];

  uint64_t v9 = [(OSLogEntryLog *)self category];
  [v4 encodeObject:v9 forKey:@"category"];

  v10 = [(OSLogEntryLog *)self components];
  [v4 encodeObject:v10 forKey:@"components"];

  v11 = [(OSLogEntryLog *)self formatString];
  [v4 encodeObject:v11 forKey:@"formatString"];

  uint64_t v12 = [(OSLogEntryLog *)self subsystem];
  [v4 encodeObject:v12 forKey:@"subsystem"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[OSLogEntryLog level](self, "level"), @"level");
}

- (OSLogEntryLog)initWithDate:(id)a3 composedMessage:(id)a4 processIdentifier:(int)a5
{
  v10.receiver = self;
  v10.super_class = (Class)OSLogEntryLog;
  v6 = [(OSLogEntry *)&v10 initWithDate:a3 composedMessage:a4];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_processIdentifier = a5;
    v8 = v6;
  }

  return v7;
}

- (OSLogEntryLog)initWithEventProxy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)OSLogEntryLog;
  v5 = [(OSLogEntry *)&v22 initWithEventProxy:v4];
  if (v5)
  {
    v5->_activityIdentifier = [v4 activityIdentifier];
    uint64_t v6 = [v4 process];
    process = v5->_process;
    v5->_process = (NSString *)v6;

    v5->_processIdentifier = [v4 processIdentifier];
    uint64_t v8 = [v4 sender];
    sender = v5->_sender;
    v5->_sender = (NSString *)v8;

    v5->_threadIdentifier = [v4 threadIdentifier];
    uint64_t v10 = [v4 category];
    category = v5->_category;
    v5->_category = (NSString *)v10;

    uint64_t v12 = makeComponents(v4);
    components = v5->_components;
    v5->_components = (NSArray *)v12;

    uint64_t v14 = [v4 formatString];
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v14;

    uint64_t v16 = [v4 subsystem];
    subsystem = v5->_subsystem;
    v5->_subsystem = (NSString *)v16;

    uint64_t v18 = [v4 logType];
    if (v18 <= 1)
    {
      if (!v18)
      {
        uint64_t v19 = 3;
        goto LABEL_14;
      }
      if (v18 == 1)
      {
        uint64_t v19 = 2;
        goto LABEL_14;
      }
    }
    else
    {
      switch(v18)
      {
        case 2:
          uint64_t v19 = 1;
          goto LABEL_14;
        case 16:
          uint64_t v19 = 4;
          goto LABEL_14;
        case 17:
          uint64_t v19 = 5;
LABEL_14:
          v5->_level = v19;
          v20 = v5;
          goto LABEL_15;
      }
    }
    uint64_t v19 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end