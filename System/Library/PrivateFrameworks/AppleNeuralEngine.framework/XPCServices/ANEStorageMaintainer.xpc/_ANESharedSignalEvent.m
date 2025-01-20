@interface _ANESharedSignalEvent
+ (BOOL)supportsSecureCoding;
+ (id)new;
+ (id)signalEventWithValue:(unint64_t)a3 symbolIndex:(unsigned int)a4 eventType:(int64_t)a5 sharedEvent:(id)a6;
- (IOSurfaceSharedEvent)sharedEvent;
- (_ANESharedSignalEvent)init;
- (_ANESharedSignalEvent)initWithCoder:(id)a3;
- (_ANESharedSignalEvent)initWithValue:(unint64_t)a3 symbolIndex:(unsigned int)a4 eventType:(int64_t)a5 sharedEvent:(id)a6 agentMask:(unint64_t)a7;
- (id)description;
- (id)waitEvent;
- (int64_t)eventType;
- (unint64_t)agentMask;
- (unint64_t)value;
- (unsigned)symbolIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setAgentMask:(unint64_t)a3;
- (void)setValue:(unint64_t)a3;
@end

@implementation _ANESharedSignalEvent

+ (id)new
{
  return 0;
}

- (_ANESharedSignalEvent)init
{
  return 0;
}

- (_ANESharedSignalEvent)initWithValue:(unint64_t)a3 symbolIndex:(unsigned int)a4 eventType:(int64_t)a5 sharedEvent:(id)a6 agentMask:(unint64_t)a7
{
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_ANESharedSignalEvent;
  v14 = [(_ANESharedSignalEvent *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_symbolIndex = a4;
    v14->_agentMask = a7;
    v14->_eventType = a5;
    v14->_value = a3;
    objc_storeStrong((id *)&v14->_sharedEvent, a6);
  }

  return v15;
}

+ (id)signalEventWithValue:(unint64_t)a3 symbolIndex:(unsigned int)a4 eventType:(int64_t)a5 sharedEvent:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = [objc_alloc((Class)a1) initWithValue:a3 symbolIndex:v7 eventType:a5 sharedEvent:v10 agentMask:0];

  return v11;
}

- (id)waitEvent
{
  unint64_t v3 = [(_ANESharedSignalEvent *)self value];
  v4 = [(_ANESharedSignalEvent *)self sharedEvent];
  v5 = +[_ANESharedWaitEvent waitEventWithValue:v3 sharedEvent:v4 eventType:0];

  return v5;
}

- (void)setAgentMask:(unint64_t)a3
{
  self->_agentMask = a3;
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unint64_t v5 = [(_ANESharedSignalEvent *)self value];
  uint64_t v6 = [(_ANESharedSignalEvent *)self symbolIndex];
  int64_t v7 = [(_ANESharedSignalEvent *)self eventType];
  v8 = [(_ANESharedSignalEvent *)self sharedEvent];
  v9 = +[NSString stringWithFormat:@"%@: { value=%llu : symbolIndex=%u : eventType=%lu : sharedEvent=%@ agentMask=%llu } ", v4, v5, v6, v7, v8, [(_ANESharedSignalEvent *)self agentMask]];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_ANESharedSignalEvent value](self, "value"), @"value");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_ANESharedSignalEvent symbolIndex](self, "symbolIndex"), @"symbolIndex");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_ANESharedSignalEvent eventType](self, "eventType"), @"eventType");
  id v5 = [(_ANESharedSignalEvent *)self sharedEvent];
  [v4 encodeObject:v5 forKey:@"sharedEvent"];
}

- (_ANESharedSignalEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"value"];
  id v6 = [v4 decodeIntegerForKey:@"symbolIndex"];
  id v7 = [v4 decodeIntegerForKey:@"eventType"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedEvent"];
  id v9 = [v4 decodeIntegerForKey:@"agentMask"];

  id v10 = [(_ANESharedSignalEvent *)self initWithValue:v5 symbolIndex:v6 eventType:v7 sharedEvent:v8 agentMask:v9];
  return v10;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

- (unsigned)symbolIndex
{
  return self->_symbolIndex;
}

- (unint64_t)agentMask
{
  return self->_agentMask;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (IOSurfaceSharedEvent)sharedEvent
{
  return self->_sharedEvent;
}

- (void).cxx_destruct
{
}

@end