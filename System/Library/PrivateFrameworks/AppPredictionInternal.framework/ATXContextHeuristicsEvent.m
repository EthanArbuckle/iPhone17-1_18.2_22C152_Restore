@interface ATXContextHeuristicsEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXContextHeuristicsEvent)initWithContextName:(id)a3 contextType:(id)a4 isStart:(BOOL)a5;
- (ATXContextHeuristicsEvent)initWithProto:(id)a3;
- (ATXContextHeuristicsEvent)initWithProtoData:(id)a3;
- (BOOL)isStart;
- (NSString)contextName;
- (NSString)contextType;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDictionary;
- (id)proto;
- (unsigned)dataVersion;
- (void)setIsStart:(BOOL)a3;
@end

@implementation ATXContextHeuristicsEvent

- (ATXContextHeuristicsEvent)initWithContextName:(id)a3 contextType:(id)a4 isStart:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXContextHeuristicsEvent;
  v10 = [(ATXContextHeuristicsEvent *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    contextName = v10->_contextName;
    v10->_contextName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    contextType = v10->_contextType;
    v10->_contextType = (NSString *)v13;

    v10->_isStart = a5;
  }

  return v10;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"contextName";
  v3 = [(ATXContextHeuristicsEvent *)self contextName];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"contextType";
  id v5 = [(ATXContextHeuristicsEvent *)self contextType];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"isStart";
  BOOL v7 = [(ATXContextHeuristicsEvent *)self isStart];
  id v8 = &unk_1F27F0C00;
  if (v7) {
    id v8 = &unk_1F27F0BE8;
  }
  v12[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (!v5) {

  }
  if (!v3) {
  return v9;
  }
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXContextHeuristicsEvent *)self jsonDictionary];
  v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (ATXContextHeuristicsEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBContextHeuristicsEvent alloc] initWithData:v4];

    self = [(ATXContextHeuristicsEvent *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXContextHeuristicsEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXContextHeuristicsEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [v5 contextName];
    BOOL v7 = [v5 contextType];
    uint64_t v8 = [v5 isStart];

    self = [(ATXContextHeuristicsEvent *)self initWithContextName:v6 contextType:v7 isStart:v8];
    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(ATXContextHeuristicsEvent *)self contextName];
  [v3 setContextName:v4];

  id v5 = [(ATXContextHeuristicsEvent *)self contextType];
  [v3 setContextType:v5];

  objc_msgSend(v3, "setIsStart:", -[ATXContextHeuristicsEvent isStart](self, "isStart"));
  return v3;
}

- (NSString)contextName
{
  return self->_contextName;
}

- (NSString)contextType
{
  return self->_contextType;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (void)setIsStart:(BOOL)a3
{
  self->_isStart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextType, 0);
  objc_storeStrong((id *)&self->_contextName, 0);
}

@end