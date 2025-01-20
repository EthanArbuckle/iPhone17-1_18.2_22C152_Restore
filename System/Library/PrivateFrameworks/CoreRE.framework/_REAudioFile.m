@interface _REAudioFile
+ (id)audioFileWithData:(id)a3;
+ (id)audioFileWithStream:(SeekableInputStream *)a3 ownsStream:(BOOL)a4;
- (_REAudioFileAssetReader)reader;
- (id)getBackingData;
- (id)processingFormat;
- (unint64_t)getReaderFileLength;
- (void)setReader:(id)a3;
@end

@implementation _REAudioFile

+ (id)audioFileWithStream:(SeekableInputStream *)a3 ownsStream:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = [[_REAudioFileAssetReader alloc] initWithStream:a3 ownsStream:a4];
  uint64_t v5 = [(_REAudioFileAssetReader *)v4 reader];
  if (re::audio::AudioFileAssetReader::createExtAudioFile((AudioFileID *)v5))
  {
    v6 = 0;
  }
  else
  {
    v7 = [_REAudioFile alloc];
    uint64_t v8 = *(void *)(v5 + 32);
    id v14 = 0;
    v6 = (void *)[(_REAudioFile *)v7 initForReadingFromExtAudioFile:v8 error:&v14];
    v9 = (re *)v14;
    v10 = v9;
    if (v6)
    {
      id v11 = v6;
    }
    else
    {
      v12 = *re::audioLogObjects(v9);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v10;
        _os_log_error_impl(&dword_233120000, v12, OS_LOG_TYPE_ERROR, "Failed to create AVAudioFile from ExtAudioFile: %@", buf, 0xCu);
      }
    }
  }
  [v6 setReader:v4];

  return v6;
}

+ (id)audioFileWithData:(id)a3
{
  v4 = (re *)a3;
  uint64_t v5 = re::globalAllocators(v4);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v5[2] + 32))(v5[2], 112, 8);
  v7 = v4;
  v10 = v7;
  re::DataSeekableInputStream::DataSeekableInputStream(v6, (id *)&v10, 0, 0);
  uint64_t v8 = [a1 audioFileWithStream:v6 ownsStream:1];

  return v8;
}

- (id)getBackingData
{
  return [(_REAudioFileAssetReader *)self->_reader getBackingData];
}

- (id)processingFormat
{
  v2 = (void *)[(_REAudioFileAssetReader *)self->_reader reader][48];
  return v2;
}

- (unint64_t)getReaderFileLength
{
  return [(_REAudioFileAssetReader *)self->_reader getFileLength];
}

- (_REAudioFileAssetReader)reader
{
  return self->_reader;
}

- (void)setReader:(id)a3
{
}

- (void).cxx_destruct
{
}

@end