@interface ManagedStreamGroup
- (ManagedStreamGroup)init;
- (NSMutableDictionary)inputStreams;
- (NSMutableDictionary)outputStreams;
- (NSUUID)controllingClientID;
- (id)stateChangeBlock;
- (void)setControllingClientID:(id)a3;
- (void)setInputStreams:(id)a3;
- (void)setOutputStreams:(id)a3;
- (void)setStateChangeBlock:(id)a3;
@end

@implementation ManagedStreamGroup

- (ManagedStreamGroup)init
{
  v8.receiver = self;
  v8.super_class = (Class)ManagedStreamGroup;
  v2 = [(ManagedStreamGroup *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    outputStreams = v2->_outputStreams;
    v2->_outputStreams = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    inputStreams = v2->_inputStreams;
    v2->_inputStreams = v5;
  }
  return v2;
}

- (NSUUID)controllingClientID
{
  return self->_controllingClientID;
}

- (void)setControllingClientID:(id)a3
{
}

- (NSMutableDictionary)outputStreams
{
  return self->_outputStreams;
}

- (void)setOutputStreams:(id)a3
{
}

- (NSMutableDictionary)inputStreams
{
  return self->_inputStreams;
}

- (void)setInputStreams:(id)a3
{
}

- (id)stateChangeBlock
{
  return self->_stateChangeBlock;
}

- (void)setStateChangeBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangeBlock, 0);
  objc_storeStrong((id *)&self->_inputStreams, 0);
  objc_storeStrong((id *)&self->_outputStreams, 0);

  objc_storeStrong((id *)&self->_controllingClientID, 0);
}

@end