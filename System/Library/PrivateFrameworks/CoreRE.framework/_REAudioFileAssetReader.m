@interface _REAudioFileAssetReader
- (AudioFileAssetReader)reader;
- (_REAudioFileAssetReader)initWithStream:(SeekableInputStream *)a3 ownsStream:(BOOL)a4;
- (id).cxx_construct;
- (id)getBackingData;
- (unint64_t)getFileLength;
@end

@implementation _REAudioFileAssetReader

- (_REAudioFileAssetReader)initWithStream:(SeekableInputStream *)a3 ownsStream:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_REAudioFileAssetReader;
  v6 = [(_REAudioFileAssetReader *)&v9 init];
  v7 = v6;
  if (v6) {
    re::audio::AudioFileAssetReader::init(&v6->_reader, (re::SeekableInputStream *)a3, a4);
  }
  return v7;
}

- (AudioFileAssetReader)reader
{
  return &self->_reader;
}

- (id)getBackingData
{
  seekableStream = self->_reader.seekableStream;
  if (seekableStream)
  {
    backingData = self->_reader.backingData;
    if (!backingData)
    {
      v5 = (re *)(*(uint64_t (**)(void *, void))(*(void *)seekableStream + 56))(seekableStream, 0);
      v6 = re::globalAllocators(v5);
      uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6[2] + 32))(v6[2], 72, 8);
      v8 = self->_reader.seekableStream;
      *(void *)(v7 + 64) = 0;
      *(_DWORD *)(v7 + 56) = 0;
      *(void *)(v7 + 40) = 0;
      *(void *)(v7 + 48) = 0;
      *(void *)(v7 + 32) = 0;
      *(_DWORD *)(v7 + 24) = 0;
      *(void *)uint64_t v7 = v8;
      *(void *)(v7 + 8) = 0;
      *(void *)(v7 + 16) = 0;
      self->_reader.backingData = (SeekableInputStreamBufferedReader *)v7;
      BOOL Next = re::SeekableInputStreamBufferedReader::readNext((re::SeekableInputStreamBufferedReader *)v7, 0xFFFFFFFFFFFFFFFFLL);
      seekableStream = 0;
      if (!Next) {
        goto LABEL_6;
      }
      backingData = self->_reader.backingData;
    }
    seekableStream = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:*((void *)backingData + 1) length:*((void *)backingData + 2) freeWhenDone:0];
  }
LABEL_6:
  return seekableStream;
}

- (unint64_t)getFileLength
{
  return self->_reader.fileLength;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((unsigned char *)self + 16) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((void *)self + 7) = 0;
  return self;
}

@end