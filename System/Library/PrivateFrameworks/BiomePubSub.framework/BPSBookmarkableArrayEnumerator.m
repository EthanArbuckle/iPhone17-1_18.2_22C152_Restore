@interface BPSBookmarkableArrayEnumerator
- (BPSBookmarkableArrayEnumerator)initWithArray:(id)a3;
- (id)bookmark;
- (id)nextObject;
- (id)validateBookmark:(id)a3;
- (void)applyBookmark:(id)a3;
- (void)reset;
@end

@implementation BPSBookmarkableArrayEnumerator

- (id)nextObject
{
  unint64_t index = self->_index;
  if (index >= [(NSArray *)self->_array count])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NSArray *)self->_array objectAtIndexedSubscript:self->_index];
    ++self->_index;
  }
  return v4;
}

- (id)bookmark
{
  return (id)[NSNumber numberWithUnsignedInteger:self->_index];
}

- (void).cxx_destruct
{
}

- (BPSBookmarkableArrayEnumerator)initWithArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSBookmarkableArrayEnumerator;
  v6 = [(BPSBookmarkableArrayEnumerator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_array, a3);
    v7->_unint64_t index = 0;
  }

  return v7;
}

- (id)validateBookmark:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = 0;
  }
  else
  {
    id v5 = [NSString alloc];
    uint64_t v6 = objc_opt_class();
    v7 = (void *)[v5 initWithFormat:@"%@ expected bookmark of class %@, but received %@", v6, objc_opt_class(), v3];
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = v7;
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v4 = [v8 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v9];
  }
  return v4;
}

- (void)applyBookmark:(id)a3
{
  self->_unint64_t index = [a3 unsignedIntegerValue];
}

- (void)reset
{
  self->_unint64_t index = 0;
}

@end