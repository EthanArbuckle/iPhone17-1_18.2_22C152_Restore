@interface MLCTensorData
+ (MLCTensorData)dataWithBytes:(void *)a3 length:(unint64_t)a4;
+ (MLCTensorData)dataWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
+ (MLCTensorData)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length;
+ (MLCTensorData)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length deallocator:(void *)deallocator;
- (MLCTensorData)initWithData:(void *)a3 length:(unint64_t)a4;
- (MLCTensorData)initWithDataNoCopy:(void *)a3 length:(unint64_t)a4 deallocator:(id)a5;
- (MLCTensorData)initWithDataNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (NSData)data;
- (NSUInteger)length;
- (void)bytes;
- (void)setData:(id)a3;
@end

@implementation MLCTensorData

- (MLCTensorData)initWithDataNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MLCTensorData;
  v8 = [(MLCTensorData *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:a3 length:a4 freeWhenDone:v5];
    data = v8->_data;
    v8->_data = (NSData *)v9;
  }
  return v8;
}

- (MLCTensorData)initWithDataNoCopy:(void *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MLCTensorData;
  uint64_t v9 = [(MLCTensorData *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a3 length:a4 deallocator:v8];
    data = v9->_data;
    v9->_data = (NSData *)v10;
  }
  return v9;
}

- (MLCTensorData)initWithData:(void *)a3 length:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MLCTensorData;
  v6 = [(MLCTensorData *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:a4];
    data = v6->_data;
    v6->_data = (NSData *)v7;
  }
  return v6;
}

+ (MLCTensorData)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length
{
  return (MLCTensorData *)[a1 dataWithBytesNoCopy:bytes length:length freeWhenDone:0];
}

+ (MLCTensorData)dataWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = (void *)[objc_alloc((Class)a1) initWithDataNoCopy:a3 length:a4 freeWhenDone:a5];

  return (MLCTensorData *)v5;
}

+ (MLCTensorData)dataWithBytes:(void *)a3 length:(unint64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithData:a3 length:a4];

  return (MLCTensorData *)v4;
}

+ (MLCTensorData)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length deallocator:(void *)deallocator
{
  id v8 = deallocator;
  uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithDataNoCopy:bytes length:length deallocator:v8];

  return (MLCTensorData *)v9;
}

- (void)bytes
{
  id v2 = [(MLCTensorData *)self data];
  v3 = (void *)[v2 bytes];

  return v3;
}

- (NSUInteger)length
{
  id v2 = [(MLCTensorData *)self data];
  NSUInteger v3 = [v2 length];

  return v3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end