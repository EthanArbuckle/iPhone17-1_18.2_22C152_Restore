@interface BRKAudioFileWriter
- (BRKAudioFileWriter)initWithPath:(id)a3;
- (void)_lock_close;
- (void)_lock_writeSamples:(const signed __int16 *)a3 count:(unint64_t)a4;
- (void)close;
- (void)writeSamples:(const signed __int16 *)a3 count:(unint64_t)a4;
@end

@implementation BRKAudioFileWriter

- (BRKAudioFileWriter)initWithPath:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRKAudioFileWriter;
  v5 = [(BRKWriter *)&v12 initWithPath:v4];
  v6 = (BRKAudioFileWriter *)v5;
  if (v5)
  {
    *((void *)v5 + 4) = 0x40CF400000000000;
    *(_OWORD *)(v5 + 40) = xmmword_234686FD0;
    *(_OWORD *)(v5 + 56) = xmmword_234686FE0;
    v7 = [NSURL fileURLWithPath:v4 isDirectory:0];
    p_audioFile = &v6->_audioFile;
    if (ExtAudioFileCreateWithURL((CFURLRef)v7, 0x57415645u, &v6->_format, 0, 1u, &v6->_audioFile))
    {
      v9 = BRKLoggingObjectForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[BRKAudioFileWriter initWithPath:]();
      }
    }
    else if (!ExtAudioFileSetProperty(*p_audioFile, 0x63666D74u, 0x28u, &v6->_format))
    {
LABEL_11:

      goto LABEL_12;
    }
    if (*p_audioFile)
    {
      [(BRKAudioFileWriter *)v6 close];
      v10 = BRKLoggingObjectForDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[BRKAudioFileWriter initWithPath:]();
      }
    }
    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

- (void)writeSamples:(const signed __int16 *)a3 count:(unint64_t)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__BRKAudioFileWriter_writeSamples_count___block_invoke;
  v4[3] = &unk_264BF6EC8;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  [(BRKWriter *)self performWithLock:v4];
}

uint64_t __41__BRKAudioFileWriter_writeSamples_count___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_writeSamples:count:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_lock_writeSamples:(const signed __int16 *)a3 count:(unint64_t)a4
{
  audioFile = self->_audioFile;
  if (audioFile)
  {
    *(&ioData.mNumberBuffers + 1) = 0;
    ioData.mNumberBuffers = 1;
    ioData.mBuffers[0].mNumberChannels = 1;
    ioData.mBuffers[0].mDataByteSize = 2 * a4;
    ioData.mBuffers[0].mData = (void *)a3;
    if (ExtAudioFileWrite(audioFile, a4, &ioData))
    {
      v5 = BRKLoggingObjectForDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[BRKAudioFileWriter _lock_writeSamples:count:]();
      }
    }
  }
}

- (void)close
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __27__BRKAudioFileWriter_close__block_invoke;
  v2[3] = &unk_264BF6EF0;
  v2[4] = self;
  [(BRKWriter *)self performWithLock:v2];
}

uint64_t __27__BRKAudioFileWriter_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_close");
}

- (void)_lock_close
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234680000, v0, v1, "Unable to close audio %d", v2, v3, v4, v5, v6);
}

- (void)initWithPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234680000, v0, v1, "Unable to set file property %d", v2, v3, v4, v5, v6);
}

- (void)initWithPath:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234680000, v0, v1, "Unable to audio writer %d", v2, v3, v4, v5, v6);
}

- (void)_lock_writeSamples:count:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234680000, v0, v1, "Unable to write audio %d", v2, v3, v4, v5, v6);
}

@end