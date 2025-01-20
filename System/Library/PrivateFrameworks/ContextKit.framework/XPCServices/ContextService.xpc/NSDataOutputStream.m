@interface NSDataOutputStream
+ (id)stream;
- (NSDataOutputStream)init;
- (id)data;
- (void)dealloc;
- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
@end

@implementation NSDataOutputStream

- (NSDataOutputStream)init
{
  v4.receiver = self;
  v4.super_class = (Class)NSDataOutputStream;
  v2 = [(JavaIoOutputStream *)&v4 init];
  if (v2) {
    v2->data_ = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  }
  return v2;
}

+ (id)stream
{
  v2 = objc_alloc_init(NSDataOutputStream);
  return v2;
}

- (void)dealloc
{
  v3 = self->data_;
  v4.receiver = self;
  v4.super_class = (Class)NSDataOutputStream;
  [(NSDataOutputStream *)&v4 dealloc];
}

- (void)writeWithInt:(int)a3
{
  char v3 = a3;
  [(NSMutableData *)self->data_ appendBytes:&v3 length:1];
}

- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  NSUInteger v9 = [(NSMutableData *)self->data_ length];
  [(NSMutableData *)self->data_ increaseLengthBy:(int)v5];
  v10 = (char *)[(NSMutableData *)self->data_ mutableBytes] + v9;
  [a3 getBytes:v10 offset:v6 length:v5];
}

- (id)data
{
  return self->data_;
}

@end