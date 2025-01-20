@interface AVOutputDeviceFrecentsWriter
- (AVOutputDeviceFrecentsWriter)init;
- (AVOutputDeviceFrecentsWriter)initWithFrecentsFilePath:(id)a3;
- (BOOL)persistToDiskReturningError:(id *)a3;
- (int64_t)numberOfKeysToBeSet;
- (void)dealloc;
- (void)removeFrecencyInfoForDeviceID:(id)a3;
- (void)setFrecencyInfo:(id)a3 forDeviceID:(id)a4;
@end

@implementation AVOutputDeviceFrecentsWriter

- (AVOutputDeviceFrecentsWriter)init
{
  return [(AVOutputDeviceFrecentsWriter *)self initWithFrecentsFilePath:0];
}

- (AVOutputDeviceFrecentsWriter)initWithFrecentsFilePath:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceFrecentsWriter;
  v4 = [(AVOutputDeviceFrecentsWriter *)&v8 init];
  if (v4 && (uint64_t v5 = [a3 copy], (v4->_frecentsFilePath = (NSString *)v5) != 0))
  {
    v4->_frecents = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceFrecentsWriter;
  [(AVOutputDeviceFrecentsWriter *)&v3 dealloc];
}

- (void)setFrecencyInfo:(id)a3 forDeviceID:(id)a4
{
}

- (int64_t)numberOfKeysToBeSet
{
  return [(NSMutableDictionary *)self->_frecents count];
}

- (void)removeFrecencyInfoForDeviceID:(id)a3
{
}

- (BOOL)persistToDiskReturningError:(id *)a3
{
  v7 = 0;
  uint64_t v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:self->_frecents format:200 options:0 error:&v7];
  if (v5) {
    LOBYTE(v5) = [(id)v5 writeToFile:self->_frecentsFilePath options:0 error:&v7];
  }
  if (a3 && (v5 & 1) == 0) {
    *a3 = v7;
  }
  return v5;
}

@end