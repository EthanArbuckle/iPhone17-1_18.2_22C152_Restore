@interface DebugHierarchyLogEntry
+ (id)errorLogEntryWithTitle:(id)a3 message:(id)a4 methodSignature:(id)a5;
+ (id)errorLogEntryWithTitle:(id)a3 message:(id)a4 methodSignature:(id)a5 environmentInfo:(id)a6;
+ (id)formattedSummaryOfLogs:(id)a3;
+ (id)logEntryWithDictionary:(id)a3;
+ (id)warningLogEntryWithTitle:(id)a3 message:(id)a4 methodSignature:(id)a5;
+ (id)warningLogEntryWithTitle:(id)a3 message:(id)a4 methodSignature:(id)a5 environmentInfo:(id)a6;
- (DebugHierarchyLogEntry)initWithDictionary:(id)a3;
- (DebugHierarchyLogEntry)initWithSeverity:(unint64_t)a3 title:(id)a4 message:(id)a5 methodSignature:(id)a6 environmentInfo:(id)a7;
- (NSDate)timestamp;
- (NSString)environmentInfo;
- (NSString)message;
- (NSString)methodSignature;
- (NSString)title;
- (id)dictionaryRepresentation;
- (id)formattedSummary;
- (unint64_t)severity;
- (void)setEnvironmentInfo:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMethodSignature:(id)a3;
- (void)setSeverity:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation DebugHierarchyLogEntry

+ (id)errorLogEntryWithTitle:(id)a3 message:(id)a4 methodSignature:(id)a5 environmentInfo:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithSeverity:0 title:v13 message:v12 methodSignature:v11 environmentInfo:v10];

  return v14;
}

+ (id)warningLogEntryWithTitle:(id)a3 message:(id)a4 methodSignature:(id)a5 environmentInfo:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithSeverity:1 title:v13 message:v12 methodSignature:v11 environmentInfo:v10];

  return v14;
}

+ (id)errorLogEntryWithTitle:(id)a3 message:(id)a4 methodSignature:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithSeverity:0 title:v10 message:v9 methodSignature:v8 environmentInfo:0];

  return v11;
}

+ (id)warningLogEntryWithTitle:(id)a3 message:(id)a4 methodSignature:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithSeverity:1 title:v10 message:v9 methodSignature:v8 environmentInfo:0];

  return v11;
}

+ (id)logEntryWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

+ (id)formattedSummaryOfLogs:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "formattedSummary", (void)v13);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 componentsJoinedByString:@"\n\n"];

  return v11;
}

- (DebugHierarchyLogEntry)initWithSeverity:(unint64_t)a3 title:(id)a4 message:(id)a5 methodSignature:(id)a6 environmentInfo:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)DebugHierarchyLogEntry;
  v17 = [(DebugHierarchyLogEntry *)&v21 init];
  if (v17)
  {
    uint64_t v18 = +[NSDate date];
    timestamp = v17->_timestamp;
    v17->_timestamp = (NSDate *)v18;

    v17->_severity = a3;
    objc_storeStrong((id *)&v17->_title, a4);
    objc_storeStrong((id *)&v17->_message, a5);
    objc_storeStrong((id *)&v17->_methodSignature, a6);
    objc_storeStrong((id *)&v17->_environmentInfo, a7);
  }

  return v17;
}

- (DebugHierarchyLogEntry)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DebugHierarchyLogEntry;
  id v5 = [(DebugHierarchyLogEntry *)&v19 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"logTimestampKey"];
    uint64_t v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)[v6 integerValue]);
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v7;

    id v9 = [v4 objectForKeyedSubscript:@"logSeverityKey"];
    v5->_severity = (unint64_t)[v9 unsignedIntegerValue];

    uint64_t v10 = [v4 objectForKeyedSubscript:@"logTitleKey"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"logMessageKey"];
    message = v5->_message;
    v5->_message = (NSString *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"logMethodKey"];
    methodSignature = v5->_methodSignature;
    v5->_methodSignature = (NSString *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"logEnvironmentKey"];
    environmentInfo = v5->_environmentInfo;
    v5->_environmentInfo = (NSString *)v16;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionaryWithCapacity:5];
  id v4 = [(DebugHierarchyLogEntry *)self timestamp];
  [v4 timeIntervalSinceReferenceDate];
  id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v5 forKeyedSubscript:@"logTimestampKey"];

  id v6 = +[NSNumber numberWithUnsignedInteger:[(DebugHierarchyLogEntry *)self severity]];
  [v3 setObject:v6 forKeyedSubscript:@"logSeverityKey"];

  uint64_t v7 = [(DebugHierarchyLogEntry *)self title];
  id v8 = [v7 length];

  if (v8)
  {
    id v9 = [(DebugHierarchyLogEntry *)self title];
    [v3 setObject:v9 forKeyedSubscript:@"logTitleKey"];
  }
  uint64_t v10 = [(DebugHierarchyLogEntry *)self message];
  id v11 = [v10 length];

  if (v11)
  {
    uint64_t v12 = [(DebugHierarchyLogEntry *)self message];
    [v3 setObject:v12 forKeyedSubscript:@"logMessageKey"];
  }
  id v13 = [(DebugHierarchyLogEntry *)self methodSignature];
  id v14 = [v13 length];

  if (v14)
  {
    id v15 = [(DebugHierarchyLogEntry *)self methodSignature];
    [v3 setObject:v15 forKeyedSubscript:@"logMethodKey"];
  }
  uint64_t v16 = [(DebugHierarchyLogEntry *)self environmentInfo];
  id v17 = [v16 length];

  if (v17)
  {
    uint64_t v18 = [(DebugHierarchyLogEntry *)self environmentInfo];
    [v3 setObject:v18 forKeyedSubscript:@"logEnvironmentKey"];
  }
  id v19 = [v3 copy];

  return v19;
}

- (id)formattedSummary
{
  id v3 = [(DebugHierarchyLogEntry *)self title];
  id v4 = [(DebugHierarchyLogEntry *)self message];
  id v5 = [(DebugHierarchyLogEntry *)self methodSignature];
  id v6 = +[NSString stringWithFormat:@"Log Title: %@\nLog Details: %@\nLog Method: %@", v3, v4, v5];

  return v6;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMessage:(id)a3
{
}

- (NSString)methodSignature
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMethodSignature:(id)a3
{
}

- (unint64_t)severity
{
  return self->_severity;
}

- (void)setSeverity:(unint64_t)a3
{
  self->_severity = a3;
}

- (NSString)environmentInfo
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnvironmentInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentInfo, 0);
  objc_storeStrong((id *)&self->_methodSignature, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end