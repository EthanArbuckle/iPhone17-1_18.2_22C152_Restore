@interface AVOutputDeviceLegacyFrecentsWriter
+ (id)defaultFrecentsWriter;
- (AVOutputDeviceLegacyFrecentsWriter)init;
- (BOOL)persistToDiskReturningError:(id *)a3;
- (int64_t)numberOfKeysToBeSet;
- (void)dealloc;
- (void)removeFrecencyInfoForDeviceID:(id)a3;
- (void)setFrecencyInfo:(id)a3 forDeviceID:(id)a4;
@end

@implementation AVOutputDeviceLegacyFrecentsWriter

+ (id)defaultFrecentsWriter
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (AVOutputDeviceLegacyFrecentsWriter)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVOutputDeviceLegacyFrecentsWriter;
  id v2 = [(AVOutputDeviceLegacyFrecentsWriter *)&v5 init];
  if (v2)
  {
    v2->_updatedFrecentsList = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_keysToRemove = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceLegacyFrecentsWriter;
  [(AVOutputDeviceLegacyFrecentsWriter *)&v3 dealloc];
}

- (void)setFrecencyInfo:(id)a3 forDeviceID:(id)a4
{
}

- (int64_t)numberOfKeysToBeSet
{
  return [(NSMutableDictionary *)self->_updatedFrecentsList count];
}

- (void)removeFrecencyInfoForDeviceID:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_updatedFrecentsList, "removeObjectForKey:");
  keysToRemove = self->_keysToRemove;
  [(NSMutableArray *)keysToRemove addObject:a3];
}

- (BOOL)persistToDiskReturningError:(id *)a3
{
  CFPreferencesSetMultiple((CFDictionaryRef)self->_updatedFrecentsList, (CFArrayRef)self->_keysToRemove, @"com.apple.avfoundation.frecents", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  int v4 = CFPreferencesAppSynchronize(@"com.apple.avfoundation.frecents");
  [(NSMutableDictionary *)self->_updatedFrecentsList removeAllObjects];
  [(NSMutableArray *)self->_keysToRemove removeAllObjects];
  return v4 != 0;
}

@end