@interface CNHeapObject
- (NSString)binary;
- (NSString)className;
- (id)classAndBinaryKey;
- (id)description;
- (unint64_t)bytes;
- (unint64_t)count;
- (void)setBinary:(id)a3;
- (void)setBytes:(unint64_t)a3;
- (void)setClassName:(id)a3;
- (void)setCount:(unint64_t)a3;
@end

@implementation CNHeapObject

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CNHeapObject;
  v4 = [(CNHeapObject *)&v11 description];
  unint64_t v5 = [(CNHeapObject *)self count];
  unint64_t v6 = [(CNHeapObject *)self bytes];
  v7 = [(CNHeapObject *)self className];
  v8 = [(CNHeapObject *)self binary];
  v9 = [v3 stringWithFormat:@"%@, %ld objects \t %ld bytes \t %@ \t %@", v4, v5, v6, v7, v8];

  return v9;
}

- (id)classAndBinaryKey
{
  uint64_t v3 = [(CNHeapObject *)self className];
  if (v3)
  {
    v4 = (void *)v3;
    unint64_t v5 = [(CNHeapObject *)self binary];

    if (v5)
    {
      unint64_t v6 = [(CNHeapObject *)self className];
      v7 = [(CNHeapObject *)self binary];
      v8 = [v6 stringByAppendingString:v7];

      goto LABEL_9;
    }
  }
  v9 = [(CNHeapObject *)self className];

  if (v9)
  {
    uint64_t v10 = [(CNHeapObject *)self className];
LABEL_8:
    v8 = (__CFString *)v10;
    goto LABEL_9;
  }
  objc_super v11 = [(CNHeapObject *)self binary];

  if (v11)
  {
    uint64_t v10 = [(CNHeapObject *)self binary];
    goto LABEL_8;
  }
  v8 = @"NoClassNameOrBinaryKey";
LABEL_9:

  return v8;
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
}

- (NSString)binary
{
  return self->_binary;
}

- (void)setBinary:(id)a3
{
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)bytes
{
  return self->_bytes;
}

- (void)setBytes:(unint64_t)a3
{
  self->_bytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binary, 0);

  objc_storeStrong((id *)&self->_className, 0);
}

@end