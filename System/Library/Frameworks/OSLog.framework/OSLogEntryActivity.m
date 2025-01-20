@interface OSLogEntryActivity
+ (BOOL)supportsSecureCoding;
- (NSString)process;
- (NSString)sender;
- (OSLogEntryActivity)initWithCoder:(id)a3;
- (OSLogEntryActivity)initWithEventProxy:(id)a3;
- (int)processIdentifier;
- (os_activity_id_t)parentActivityIdentifier;
- (unint64_t)activityIdentifier;
- (unint64_t)threadIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OSLogEntryActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);

  objc_storeStrong((id *)&self->_process, 0);
}

- (os_activity_id_t)parentActivityIdentifier
{
  return self->_parentActivityIdentifier;
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

- (OSLogEntryActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)OSLogEntryActivity;
  v5 = [(OSLogEntry *)&v15 initWithCoder:v4];
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

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentActivityIdentifier"];
    v5->_parentActivityIdentifier = [v12 unsignedLongLongValue];

    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)OSLogEntryActivity;
  id v4 = a3;
  [(OSLogEntry *)&v10 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[OSLogEntryActivity activityIdentifier](self, "activityIdentifier", v10.receiver, v10.super_class));
  [v4 encodeObject:v5 forKey:@"activityIdentifier"];

  v6 = [(OSLogEntryActivity *)self process];
  [v4 encodeObject:v6 forKey:@"process"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[OSLogEntryActivity processIdentifier](self, "processIdentifier"), @"processIdentifier");
  uint64_t v7 = [(OSLogEntryActivity *)self sender];
  [v4 encodeObject:v7 forKey:@"sender"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[OSLogEntryActivity threadIdentifier](self, "threadIdentifier"));
  [v4 encodeObject:v8 forKey:@"threadIdentifier"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[OSLogEntryActivity parentActivityIdentifier](self, "parentActivityIdentifier"));
  [v4 encodeObject:v9 forKey:@"parentActivityIdentifier"];
}

- (OSLogEntryActivity)initWithEventProxy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OSLogEntryActivity;
  v5 = [(OSLogEntry *)&v12 initWithEventProxy:v4];
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
    v5->_parentActivityIdentifier = [v4 parentActivityIdentifier];
    objc_super v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end