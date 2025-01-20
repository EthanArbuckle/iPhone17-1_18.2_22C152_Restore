@interface CTStewieConnectionAssistantEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTStewieConnectionAssistantEvent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)eventType;
- (void)encodeWithCoder:(id)a3;
- (void)setEventType:(int64_t)a3;
@end

@implementation CTStewieConnectionAssistantEvent

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  int64_t v4 = [(CTStewieConnectionAssistantEvent *)self eventType];
  if ((unint64_t)(v4 - 1) > 7) {
    v5 = "CTStewieConnectionAssistantEventTypeUnknown";
  }
  else {
    v5 = off_1E5267588[v4 - 1];
  }
  [v3 appendFormat:@", eventType=%s", v5];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (CTStewieConnectionAssistantEvent *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = [(CTStewieConnectionAssistantEvent *)self eventType];
      BOOL v6 = v5 == [(CTStewieConnectionAssistantEvent *)v4 eventType];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setEventType:", -[CTStewieConnectionAssistantEvent eventType](self, "eventType"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieConnectionAssistantEvent eventType](self, "eventType"), @"eventType");
}

- (CTStewieConnectionAssistantEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTStewieConnectionAssistantEvent;
  int64_t v5 = [(CTStewieConnectionAssistantEvent *)&v7 init];
  if (v5) {
    v5->_eventType = [v4 decodeIntegerForKey:@"eventType"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

@end