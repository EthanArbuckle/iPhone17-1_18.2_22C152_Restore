@interface CBAODFlipBookEntryWrapper
- ($7D12C9F9DF7F825FC3F2BA39AA26C9BC)entry;
- (CBAODFlipBookEntryWrapper)initWithFlipBookEntry:(id *)a3;
- (NSData)entryData;
- (id)description;
- (void)dealloc;
@end

@implementation CBAODFlipBookEntryWrapper

- (CBAODFlipBookEntryWrapper)initWithFlipBookEntry:(id *)a3
{
  v9 = self;
  SEL v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CBAODFlipBookEntryWrapper;
  v9 = [(CBAODFlipBookEntryWrapper *)&v6 init];
  if (v9)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:79];
    v9->_entryData = (NSData *)v3;
  }
  return v9;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBAODFlipBookEntryWrapper;
  [(CBAODFlipBookEntryWrapper *)&v2 dealloc];
}

- (id)description
{
  v9 = [(NSData *)self->_entryData bytes];
  SEL v8 = NSString;
  uint64_t v2 = objc_opt_class();
  SEL v3 = "set";
  if (v9[1]) {
    v4 = "set";
  }
  else {
    v4 = "not set";
  }
  if (*((unsigned char *)v9 + 51)) {
    v5 = "set";
  }
  else {
    v5 = "not set";
  }
  if (*((unsigned char *)v9 + 46)) {
    objc_super v6 = "set";
  }
  else {
    objc_super v6 = "not set";
  }
  if ((*((unsigned char *)v9 + 9) & 1) == 0) {
    SEL v3 = "not set";
  }
  return (id)[v8 stringWithFormat:@"%@: ID=%i | brt-%f (%s) | limit=%f (%s) | pcc=%f (%s) | WP %s", v2, *v9, *(float *)((char *)v9 + 5), v4, *((float *)v9 + 13), v5, *(float *)((char *)v9 + 47), v6, v3];
}

- ($7D12C9F9DF7F825FC3F2BA39AA26C9BC)entry
{
  return ($7D12C9F9DF7F825FC3F2BA39AA26C9BC *)[(NSData *)self->_entryData bytes];
}

- (NSData)entryData
{
  return self->_entryData;
}

@end