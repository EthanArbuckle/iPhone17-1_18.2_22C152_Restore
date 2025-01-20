@interface CKVOToken
- (CKVOToken)initWithKeyPath:(id)a3 index:(int64_t)a4 block:(id)a5;
- (NSString)keypath;
- (id)block;
- (id)description;
- (int64_t)index;
@end

@implementation CKVOToken

- (CKVOToken)initWithKeyPath:(id)a3 index:(int64_t)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKVOToken;
  v11 = [(CKVOToken *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_keypath, a3);
    v12->_index = a4;
    uint64_t v13 = MEMORY[0x1D25F2CB0](v10);
    id block = v12->_block;
    v12->_id block = (id)v13;
  }
  return v12;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKVOToken;
  v4 = [(CKVOToken *)&v8 description];
  v5 = [(CKVOToken *)self keypath];
  v6 = [v3 stringWithFormat:@"%@ (%@ #%ld)", v4, v5, -[CKVOToken index](self, "index")];

  return v6;
}

- (NSString)keypath
{
  return self->_keypath;
}

- (int64_t)index
{
  return self->_index;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_keypath, 0);
}

@end