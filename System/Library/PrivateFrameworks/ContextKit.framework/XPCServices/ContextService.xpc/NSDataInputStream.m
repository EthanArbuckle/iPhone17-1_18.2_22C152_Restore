@interface NSDataInputStream
+ (id)streamWithData:(id)a3;
- (NSDataInputStream)initWithData:(id)a3;
- (int)available;
- (int)read;
- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)close;
- (void)dealloc;
@end

@implementation NSDataInputStream

- (NSDataInputStream)initWithData:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSDataInputStream;
  v4 = [(JavaIoInputStream *)&v6 init];
  if (v4)
  {
    v4->data_ = (NSData *)a3;
    v4->position_ = 0;
  }
  return v4;
}

+ (id)streamWithData:(id)a3
{
  v3 = [[NSDataInputStream alloc] initWithData:a3];
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSDataInputStream;
  [(NSDataInputStream *)&v3 dealloc];
}

- (int)read
{
  position = (void *)self->position_;
  if (position == (void *)[(NSData *)self->data_ length]) {
    return -1;
  }
  v5 = [(NSData *)self->data_ bytes];
  unint64_t v6 = self->position_;
  self->position_ = v6 + 1;
  return v5[v6];
}

- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  LODWORD(v5) = a5;
  if (a5)
  {
    uint64_t v6 = *(void *)&a4;
    position = (void *)self->position_;
    if (position == (void *)[(NSData *)self->data_ length])
    {
      LODWORD(v5) = -1;
    }
    else
    {
      unsigned int v10 = [(NSData *)self->data_ length];
      if (!a3) {
        JreThrowNullPointerException();
      }
      int v11 = v10 - LODWORD(self->position_);
      if (v11 >= (int)v5) {
        uint64_t v5 = v5;
      }
      else {
        uint64_t v5 = v11;
      }
      objc_msgSend(a3, "replaceBytes:length:offset:", (char *)-[NSData bytes](self->data_, "bytes") + self->position_, v5, v6);
      self->position_ += (int)v5;
    }
  }
  return v5;
}

- (int)available
{
  return [(NSData *)self->data_ length] - LODWORD(self->position_);
}

- (void)close
{
  self->data_ = 0;
  self->position_ = 0;
}

@end