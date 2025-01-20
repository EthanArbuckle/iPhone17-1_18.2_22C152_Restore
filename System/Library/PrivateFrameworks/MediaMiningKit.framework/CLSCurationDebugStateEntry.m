@interface CLSCurationDebugStateEntry
- (CLSCurationDebugStateEntry)initWithState:(unint64_t)a3 reason:(id)a4 agent:(id)a5 stage:(id)a6;
- (NSString)agent;
- (NSString)reason;
- (NSString)stage;
- (unint64_t)state;
@end

@implementation CLSCurationDebugStateEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stage, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (NSString)stage
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)agent
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)state
{
  return self->_state;
}

- (CLSCurationDebugStateEntry)initWithState:(unint64_t)a3 reason:(id)a4 agent:(id)a5 stage:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CLSCurationDebugStateEntry;
  v14 = [(CLSCurationDebugStateEntry *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_state = a3;
    objc_storeStrong((id *)&v14->_reason, a4);
    objc_storeStrong((id *)&v15->_agent, a5);
    objc_storeStrong((id *)&v15->_stage, a6);
  }

  return v15;
}

@end