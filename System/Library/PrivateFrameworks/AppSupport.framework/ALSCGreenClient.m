@interface ALSCGreenClient
- (ALSCGreenClient)init;
- (BOOL)_attemptReadingValuesFromDiskAndUpdateFileState;
- (BOOL)_readGreenKeysFromDictionary:(id)a3;
- (BOOL)key1Value;
- (BOOL)key2Value;
- (BOOL)key3Value;
- (void)setKey1Value:(BOOL)a3;
- (void)setKey2Value:(BOOL)a3;
- (void)setKey3Value:(BOOL)a3;
@end

@implementation ALSCGreenClient

- (ALSCGreenClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)ALSCGreenClient;
  v2 = [(ALSCGreenClient *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ALSCGreenClient *)v2 _attemptReadingValuesFromDiskAndUpdateFileState];
  }
  return v3;
}

- (BOOL)key1Value
{
  return self->_key1Value;
}

- (BOOL)key2Value
{
  return self->_key2Value;
}

- (BOOL)key3Value
{
  return self->_key3Value;
}

- (BOOL)_readGreenKeysFromDictionary:(id)a3
{
  uint64_t v5 = [a3 objectForKey:@"key1"];
  if (v5)
  {
    v6 = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      -[ALSCGreenClient setKey1Value:](self, "setKey1Value:", [v6 BOOLValue]);
    }
  }
  uint64_t v7 = [a3 objectForKey:@"key2"];
  if (v7)
  {
    v8 = (void *)v7;
    if (objc_opt_respondsToSelector()) {
      -[ALSCGreenClient setKey2Value:](self, "setKey2Value:", [v8 BOOLValue]);
    }
  }
  uint64_t v9 = [a3 objectForKey:@"key3"];
  if (v9)
  {
    v10 = (void *)v9;
    if (objc_opt_respondsToSelector()) {
      -[ALSCGreenClient setKey3Value:](self, "setKey3Value:", [v10 BOOLValue]);
    }
  }
  uint64_t v11 = [a3 objectForKey:@"state"];
  if (v11)
  {
    v12 = (void *)v11;
    LOBYTE(v11) = (objc_opt_respondsToSelector() & 1) != 0 && [v12 integerValue] > 0;
  }
  return v11;
}

- (BOOL)_attemptReadingValuesFromDiskAndUpdateFileState
{
  if (self->_cachingAllowed) {
    return 1;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", @"/var/mobile/Library/Application Support/com.apple.palette.green.plist") & 1) == 0)return self->_cachingAllowed; {
  BOOL result = -[ALSCGreenClient _readGreenKeysFromDictionary:](self, "_readGreenKeysFromDictionary:", [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/var/mobile/Library/Application Support/com.apple.palette.green.plist"]);
  }
  self->_cachingAllowed = result;
  return result;
}

- (void)setKey1Value:(BOOL)a3
{
  self->_key1Value = a3;
}

- (void)setKey2Value:(BOOL)a3
{
  self->_key2Value = a3;
}

- (void)setKey3Value:(BOOL)a3
{
  self->_key3Value = a3;
}

@end