@interface C2MultipeerServerContext
- (C2MultipeerServerContext)init;
- (NSData)chunkData;
- (OS_os_activity)osActivity;
- (void)setChunkData:(id)a3;
- (void)setOsActivity:(id)a3;
@end

@implementation C2MultipeerServerContext

- (C2MultipeerServerContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)C2MultipeerServerContext;
  v2 = [(C2MultipeerServerContext *)&v6 init];
  if (v2)
  {
    os_activity_t v3 = _os_activity_create(&dword_1DD523000, "c2-chunk-server", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    osActivity = v2->_osActivity;
    v2->_osActivity = (OS_os_activity *)v3;
  }
  return v2;
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (void)setOsActivity:(id)a3
{
}

- (NSData)chunkData
{
  return self->_chunkData;
}

- (void)setChunkData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chunkData, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);
}

@end