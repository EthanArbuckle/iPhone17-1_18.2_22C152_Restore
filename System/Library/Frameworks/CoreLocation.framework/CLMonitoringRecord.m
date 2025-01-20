@interface CLMonitoringRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLCondition)condition;
- (CLMonitoringEvent)lastEvent;
- (CLMonitoringRecord)initWithCoder:(id)a3;
- (NSString)identifier;
- (id)description;
- (id)initRecordWithCondition:(id)a3 identifier:(id)a4;
- (id)initRecordWithCondition:(id)a3 identifier:(id)a4 options:(unint64_t)a5;
- (id)initRecordWithCondition:(id)a3 identifier:(id)a4 options:(unint64_t)a5 initialState:(unint64_t)a6;
- (id)initRecordWithCondition:(id)a3 options:(unint64_t)a4 event:(id)a5;
- (id)initRecordWithMonitoringRecord:(id)a3;
- (unint64_t)hash;
- (unint64_t)options;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)updateEvent:(id)a3;
@end

@implementation CLMonitoringRecord

- (id)initRecordWithCondition:(id)a3 identifier:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_initRecordWithCondition_identifier_options_);
}

- (id)initRecordWithCondition:(id)a3 identifier:(id)a4 options:(unint64_t)a5
{
  return [(CLMonitoringRecord *)self initRecordWithCondition:a3 identifier:a4 options:a5 initialState:0];
}

- (id)initRecordWithMonitoringRecord:(id)a3
{
  [a3 condition];
  [a3 options];
  [a3 lastEvent];

  return (id)MEMORY[0x1F4181798](self, sel_initRecordWithCondition_options_event_);
}

- (id)initRecordWithCondition:(id)a3 identifier:(id)a4 options:(unint64_t)a5 initialState:(unint64_t)a6
{
  v9 = [CLMonitoringEvent alloc];
  v10 = -[CLMonitoringEvent initWithIdentifier:refinement:state:date:diagnostics:](v9, "initWithIdentifier:refinement:state:date:diagnostics:", a4, 0, a6, [MEMORY[0x1E4F1C9C8] date], 0);

  return (id)MEMORY[0x1F4181798](self, sel_initRecordWithCondition_options_event_);
}

- (id)initRecordWithCondition:(id)a3 options:(unint64_t)a4 event:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CLMonitoringRecord;
  v8 = [(CLMonitoringRecord *)&v10 init];
  if (v8)
  {
    v8->_condition = (CLCondition *)a3;
    v8->_options = a4;
    v8->_lastEvent = (CLMonitoringEvent *)a5;
  }
  return v8;
}

- (void)dealloc
{
  self->_condition = 0;
  self->_lastEvent = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLMonitoringRecord;
  [(CLMonitoringRecord *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 requiresSecureCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMonitoringRecord.m", 97, @"Invalid parameter not satisfying: %@", @"coder.requiresSecureCoding");
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[CLMonitoringRecord condition](self, "condition"), @"kCLMonitoringRecordCondition");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLMonitoringRecord lastEvent](self, "lastEvent"), @"kCLMonitoringRecordLastEvent");
  unint64_t v6 = [(CLMonitoringRecord *)self options];

  [a3 encodeInteger:v6 forKey:@"kCLMonitoringRecordMonitoringOptions"];
}

- (CLMonitoringRecord)initWithCoder:(id)a3
{
  if (([a3 requiresSecureCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMonitoringRecord.m", 105, @"Invalid parameter not satisfying: %@", @"coder.requiresSecureCoding");
  }
  unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  self->_condition = (CLCondition *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0), @"kCLMonitoringRecordCondition");
  self->_lastEvent = (CLMonitoringEvent *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMonitoringRecordLastEvent"];
  self->_options = [a3 decodeIntegerForKey:@"kCLMonitoringRecordMonitoringOptions"];
  return self;
}

- (NSString)identifier
{
  v2 = [(CLMonitoringRecord *)self lastEvent];

  return [(CLMonitoringEvent *)v2 identifier];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendString:", -[CLCondition description](-[CLMonitoringRecord condition](self, "condition"), "description"));
  [v3 appendFormat:@", options: %lu", -[CLMonitoringRecord options](self, "options")];
  [v3 appendFormat:@", lastEvent: %@", -[CLMonitoringRecord lastEvent](self, "lastEvent")];
  return v3;
}

- (void)updateEvent:(id)a3
{
  v4 = (CLMonitoringEvent *)a3;

  self->_lastEvent = v4;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)[(CLMonitoringEvent *)[(CLMonitoringRecord *)self lastEvent] identifier] hash];
  return [(CLCondition *)[(CLMonitoringRecord *)self condition] hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = -[CLCondition isEqual:](-[CLMonitoringRecord condition](self, "condition"), "isEqual:", [a3 condition]);
      if (v5)
      {
        unint64_t v6 = [(CLMonitoringEvent *)[(CLMonitoringRecord *)self lastEvent] identifier];
        uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "lastEvent"), "identifier");
        LOBYTE(v5) = [(NSString *)v6 isEqualToString:v7];
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (CLCondition)condition
{
  return (CLCondition *)objc_getProperty(self, a2, 8, 1);
}

- (CLMonitoringEvent)lastEvent
{
  return (CLMonitoringEvent *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)options
{
  return self->_options;
}

@end