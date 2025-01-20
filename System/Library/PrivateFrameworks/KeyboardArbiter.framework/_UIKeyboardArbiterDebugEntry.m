@interface _UIKeyboardArbiterDebugEntry
- (_UIKeyboardArbiterDebugEntry)init;
- (int)importance;
- (void)enumerateContents:(id)a3;
@end

@implementation _UIKeyboardArbiterDebugEntry

- (_UIKeyboardArbiterDebugEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyboardArbiterDebugEntry;
  v2 = [(_UIKeyboardArbiterDebugEntry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    timestamp = v2->_timestamp;
    v2->_timestamp = (NSDate *)v3;
  }
  return v2;
}

- (void)enumerateContents:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v8 = @"Timestamp";
  timestamp = self->_timestamp;
  id v5 = a3;
  objc_super v6 = [(NSDate *)timestamp description];
  v9[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  (*((void (**)(id, void *))a3 + 2))(v5, v7);
}

- (int)importance
{
  return 0;
}

- (void).cxx_destruct
{
}

@end