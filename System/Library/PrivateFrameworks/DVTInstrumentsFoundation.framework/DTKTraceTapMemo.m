@interface DTKTraceTapMemo
- (BOOL)isRawKtraceFile;
- (BOOL)isSession;
- (DVTInputStream)datastream;
- (NSData)triggerIDs;
- (OS_xpc_object)stackshot;
- (unsigned)triggerCount;
- (void)setDatastream:(id)a3;
- (void)setIsRawKtraceFile:(BOOL)a3;
- (void)setIsSession:(BOOL)a3;
- (void)setStackshot:(id)a3;
- (void)setTriggerCount:(unsigned int)a3;
- (void)setTriggerIDs:(id)a3;
@end

@implementation DTKTraceTapMemo

- (BOOL)isSession
{
  return self->super._supportsPeek;
}

- (void)setIsSession:(BOOL)a3
{
  self->super._supportsPeek = a3;
}

- (unsigned)triggerCount
{
  return *(_DWORD *)(&self->super._finalMemo + 3);
}

- (void)setTriggerCount:(unsigned int)a3
{
  *(_DWORD *)(&self->super._finalMemo + 3) = a3;
}

- (NSData)triggerIDs
{
  return *(NSData **)&self->_isSession;
}

- (void)setTriggerIDs:(id)a3
{
}

- (DVTInputStream)datastream
{
  return (DVTInputStream *)self->_triggerIDs;
}

- (void)setDatastream:(id)a3
{
}

- (OS_xpc_object)stackshot
{
  return self->_datastream;
}

- (void)setStackshot:(id)a3
{
}

- (BOOL)isRawKtraceFile
{
  return self->super._finalMemo;
}

- (void)setIsRawKtraceFile:(BOOL)a3
{
  self->super._finalMemo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datastream, 0);
  objc_storeStrong((id *)&self->_triggerIDs, 0);
  objc_storeStrong((id *)&self->_isSession, 0);
}

@end