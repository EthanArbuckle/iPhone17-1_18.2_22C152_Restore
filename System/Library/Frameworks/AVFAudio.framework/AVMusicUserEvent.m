@interface AVMusicUserEvent
- (AVMusicUserEvent)initWithData:(NSData *)data;
- (AVMusicUserEvent)initWithUserData:(MusicEventUserData *)a3;
- (MusicEventUserData)userData;
- (UInt32)sizeInBytes;
@end

@implementation AVMusicUserEvent

- (void).cxx_destruct
{
}

- (MusicEventUserData)userData
{
  return (MusicEventUserData *)[(NSMutableData *)self->_userData bytes];
}

- (AVMusicUserEvent)initWithUserData:(MusicEventUserData *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AVMusicUserEvent;
  v4 = [(AVMusicUserEvent *)&v11 init];
  if (v4)
  {
    UInt32 length = a3->length;
    v5 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    userData = v4->_userData;
    v4->_userData = v5;

    [(NSMutableData *)v4->_userData appendBytes:&length length:4];
    v7 = v4->_userData;
    v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3->data length:a3->length];
    [(NSMutableData *)v7 appendData:v8];
  }
  return v4;
}

- (UInt32)sizeInBytes
{
  return [(NSMutableData *)self->_userData length] - 4;
}

- (AVMusicUserEvent)initWithData:(NSData *)data
{
  v4 = data;
  v10.receiver = self;
  v10.super_class = (Class)AVMusicUserEvent;
  v5 = [(AVMusicUserEvent *)&v10 init];
  if (v5)
  {
    int v9 = [(NSData *)v4 length];
    v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    userData = v5->_userData;
    v5->_userData = v6;

    [(NSMutableData *)v5->_userData appendBytes:&v9 length:4];
    [(NSMutableData *)v5->_userData appendData:v4];
  }

  return v5;
}

@end