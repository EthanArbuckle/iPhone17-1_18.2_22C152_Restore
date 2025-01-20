@interface SSHBHIDSampleBuffer
- (BOOL)isFull;
- (NSMutableArray)buffer;
- (SSHBHIDSampleBuffer)init;
- (SSHBHIDSampleBuffer)initWithSize:(unint64_t)a3;
- (id)csv;
- (id)removeSample;
- (id)sampleBuffer;
- (unint64_t)bufferSize;
- (void)addSample:(id)a3;
- (void)setBuffer:(id)a3;
- (void)setBufferSize:(unint64_t)a3;
- (void)setIsFull:(BOOL)a3;
- (void)writeSamplesWithFilePath:(id)a3;
@end

@implementation SSHBHIDSampleBuffer

- (SSHBHIDSampleBuffer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSHBHIDSampleBuffer;
  v2 = [(SSHBHIDSampleBuffer *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    buffer = v2->_buffer;
    v2->_buffer = v3;

    v2->_isFull = 0;
    v2->_bufferSize = 0xFFFFFFFFLL;
  }
  return v2;
}

- (SSHBHIDSampleBuffer)initWithSize:(unint64_t)a3
{
  result = [(SSHBHIDSampleBuffer *)self init];
  if (result)
  {
    unint64_t v5 = 0xFFFFFFFFLL;
    if (a3) {
      unint64_t v5 = a3;
    }
    result->_bufferSize = v5;
  }
  return result;
}

- (id)sampleBuffer
{
  v2 = [(SSHBHIDSampleBuffer *)self buffer];
  id v3 = [v2 copy];

  return v3;
}

- (void)addSample:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SSHBHIDSampleBuffer *)self buffer];
  [v5 addObject:v4];

  objc_super v6 = [(SSHBHIDSampleBuffer *)self buffer];
  id v7 = [v6 count];
  unint64_t v8 = [(SSHBHIDSampleBuffer *)self bufferSize];

  if ((unint64_t)v7 > v8) {
    id v9 = [(SSHBHIDSampleBuffer *)self removeSample];
  }
  id v10 = [(SSHBHIDSampleBuffer *)self buffer];
  -[SSHBHIDSampleBuffer setIsFull:](self, "setIsFull:", [v10 count] >= (id)-[SSHBHIDSampleBuffer bufferSize](self, "bufferSize"));
}

- (id)removeSample
{
  id v3 = [(SSHBHIDSampleBuffer *)self buffer];
  id v4 = [v3 objectAtIndex:0];

  unint64_t v5 = [(SSHBHIDSampleBuffer *)self buffer];
  [v5 removeObjectAtIndex:0];

  objc_super v6 = [(SSHBHIDSampleBuffer *)self buffer];
  -[SSHBHIDSampleBuffer setIsFull:](self, "setIsFull:", [v6 count] >= (id)-[SSHBHIDSampleBuffer bufferSize](self, "bufferSize"));

  return v4;
}

- (id)csv
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(SSHBHIDSampleBuffer *)self buffer];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) csv];
        [v3 appendFormat:@"%@\n", v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)writeSamplesWithFilePath:(id)a3
{
  id v13 = a3;
  id v4 = [(SSHBHIDSampleBuffer *)self csv];
  id v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v5 fileExistsAtPath:v13];

  uint64_t v7 = v13;
  if (v6)
  {
    uint64_t v8 = 1;
    id v9 = v13;
    do
    {
      id v10 = [v13 stringByDeletingPathExtension];
      uint64_t v11 = [v13 pathExtension];
      uint64_t v7 = +[NSString stringWithFormat:@"%@-%u.%@", v10, v8, v11];

      long long v12 = +[NSFileManager defaultManager];
      LOBYTE(v11) = [v12 fileExistsAtPath:v7];

      uint64_t v8 = (v8 + 1);
      id v9 = v7;
    }
    while ((v11 & 1) != 0);
  }
  [v4 writeToFile:v7 atomically:1 encoding:4 error:0];
}

- (BOOL)isFull
{
  return self->_isFull;
}

- (void)setIsFull:(BOOL)a3
{
  self->_isFull = a3;
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (void).cxx_destruct
{
}

@end