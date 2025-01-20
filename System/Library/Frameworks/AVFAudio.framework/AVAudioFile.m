@interface AVAudioFile
- (AVAudioFile)initForReading:(NSURL *)fileURL commonFormat:(AVAudioCommonFormat)format interleaved:(BOOL)interleaved error:(NSError *)outError;
- (AVAudioFile)initForReading:(NSURL *)fileURL error:(NSError *)outError;
- (AVAudioFile)initForWriting:(NSURL *)fileURL settings:(NSDictionary *)settings commonFormat:(AVAudioCommonFormat)format interleaved:(BOOL)interleaved error:(NSError *)outError;
- (AVAudioFile)initForWriting:(NSURL *)fileURL settings:(NSDictionary *)settings error:(NSError *)outError;
- (AVAudioFormat)fileFormat;
- (AVAudioFormat)processingFormat;
- (AVAudioFramePosition)framePosition;
- (AVAudioFramePosition)length;
- (BOOL)isOpen;
- (BOOL)readIntoBuffer:(AVAudioPCMBuffer *)buffer error:(NSError *)outError;
- (BOOL)readIntoBuffer:(AVAudioPCMBuffer *)buffer frameCount:(AVAudioFrameCount)frames error:(NSError *)outError;
- (BOOL)writeFromBuffer:(const AVAudioPCMBuffer *)buffer error:(NSError *)outError;
- (NSURL)url;
- (id).cxx_construct;
- (id)initForReadingFromExtAudioFile:(OpaqueExtAudioFile *)a3 commonFormat:(unint64_t)a4 interleaved:(BOOL)a5 error:(id *)a6;
- (id)initForReadingFromExtAudioFile:(OpaqueExtAudioFile *)a3 error:(id *)a4;
- (id)initSecondaryReader:(id)a3 format:(id)a4 error:(id *)a5;
- (void)close;
- (void)dealloc;
- (void)setFramePosition:(AVAudioFramePosition)framePosition;
@end

@implementation AVAudioFile

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (NSURL)url
{
  return (NSURL *)*(id *)self->_impl.__ptr_.__value_;
}

- (void)setFramePosition:(AVAudioFramePosition)framePosition
{
  value = self->_impl.__ptr_.__value_;
  if (*((void *)value + 1))
  {
    uint64_t v6 = AVAudioFileImpl::CheckClientFormatSet(value);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 639, (uint64_t)"-[AVAudioFile setFramePosition:]", (uint64_t)"_impl->CheckClientFormatSet()", v6, 0);
    uint64_t v7 = ExtAudioFileSeek(*((ExtAudioFileRef *)self->_impl.__ptr_.__value_ + 1), framePosition);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 640, (uint64_t)"-[AVAudioFile setFramePosition:]", (uint64_t)"ExtAudioFileSeek(_impl->_extAudioFile, pos)", v7, 0);
  }
}

- (AVAudioFramePosition)framePosition
{
  value = self->_impl.__ptr_.__value_;
  if (!*((void *)value + 1)) {
    return -1;
  }
  SInt64 outFrameOffset = 0;
  uint64_t v4 = AVAudioFileImpl::CheckClientFormatSet(value);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 629, (uint64_t)"-[AVAudioFile framePosition]", (uint64_t)"_impl->CheckClientFormatSet()", v4, 0);
  uint64_t v5 = ExtAudioFileTell(*((ExtAudioFileRef *)self->_impl.__ptr_.__value_ + 1), &outFrameOffset);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 630, (uint64_t)"-[AVAudioFile framePosition]", (uint64_t)"ExtAudioFileTell(_impl->_extAudioFile, &pos)", v5, 0);
  return outFrameOffset;
}

- (AVAudioFramePosition)length
{
  value = self->_impl.__ptr_.__value_;
  uint64_t v4 = (OpaqueExtAudioFile *)*((void *)value + 1);
  AVAudioFramePosition v5 = *((void *)value + 4);
  if (v4) {
    BOOL v6 = v5 == -1;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    AVAudioFramePosition outPropertyData = 0;
    UInt32 ioPropertyDataSize = 8;
    uint64_t Property = ExtAudioFileGetProperty(v4, 0x2366726Du, &ioPropertyDataSize, &outPropertyData);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 617, (uint64_t)"-[AVAudioFile length]", (uint64_t)"ExtAudioFileGetProperty(_impl->_extAudioFile, kExtAudioFileProperty_FileLengthFrames, &propSize, &length)", Property, 0);
    AVAudioFramePosition v5 = outPropertyData;
    *((void *)self->_impl.__ptr_.__value_ + 4) = outPropertyData;
  }
  return v5;
}

- (AVAudioFormat)processingFormat
{
  return (AVAudioFormat *)*((id *)self->_impl.__ptr_.__value_ + 3);
}

- (AVAudioFormat)fileFormat
{
  return (AVAudioFormat *)*((id *)self->_impl.__ptr_.__value_ + 5);
}

- (BOOL)readIntoBuffer:(AVAudioPCMBuffer *)buffer frameCount:(AVAudioFrameCount)frames error:(NSError *)outError
{
  uint64_t v6 = *(void *)&frames;
  v8 = buffer;
  char v9 = *((void *)self->_impl.__ptr_.__value_ + 1) != 0;
  id v23 = 0;
  int v10 = _AVAE_CheckAndReturnErr(576, (uint64_t)"-[AVAudioFile readIntoBuffer:frameCount:error:]", (uint64_t)"_impl->isOpen()", v9, 4294967253, &v23);
  v11 = (NSError *)v23;
  v12 = v11;
  if (!v10)
  {
    _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 581, "-[AVAudioFile readIntoBuffer:frameCount:error:]", "buffer != nil", v8 != 0);
    _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 582, "-[AVAudioFile readIntoBuffer:frameCount:error:]", "frames <= buffer.frameCapacity", [(AVAudioPCMBuffer *)v8 frameCapacity] >= v6);
    v22 = v12;
    int v13 = _AVAE_CheckAndReturnErr(583, (uint64_t)"-[AVAudioFile readIntoBuffer:frameCount:error:]", (uint64_t)"buffer.frameCapacity != 0", [(AVAudioPCMBuffer *)v8 frameCapacity] != 0, 4294967246, &v22);
    v14 = v22;

    if (v13)
    {
      if (outError)
      {
        v11 = v14;
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v16 = AVAudioFileImpl::CheckClientFormatSet(self->_impl.__ptr_.__value_);
      if (_AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 588, (uint64_t)"-[AVAudioFile readIntoBuffer:frameCount:error:]", (uint64_t)"_impl->CheckClientFormatSet()", v16, outError))
      {
        UInt32 ioNumberFrames = v6;
        [(AVAudioPCMBuffer *)v8 setFrameLength:v6];
        uint64_t v17 = ExtAudioFileRead(*((ExtAudioFileRef *)self->_impl.__ptr_.__value_ + 1), &ioNumberFrames, [(AVAudioBuffer *)v8 mutableAudioBufferList]);
        BOOL v18 = _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 593, (uint64_t)"-[AVAudioFile readIntoBuffer:frameCount:error:]", (uint64_t)"ExtAudioFileRead(_impl->_extAudioFile, &ioFrames, buffer.mutableAudioBufferList)", v17, outError);
        UInt32 v19 = ioNumberFrames;
        [(AVAudioPCMBuffer *)v8 setFrameLength:ioNumberFrames];
        if (v19) {
          BOOL v15 = v18;
        }
        else {
          BOOL v15 = 0;
        }
        goto LABEL_14;
      }
    }
    BOOL v15 = 0;
LABEL_14:
    v12 = v14;
    goto LABEL_15;
  }
  if (!outError)
  {
    BOOL v15 = 0;
    goto LABEL_15;
  }
LABEL_7:
  v12 = v11;
  BOOL v15 = 0;
  *outError = v12;
LABEL_15:

  return v15;
}

- (BOOL)writeFromBuffer:(const AVAudioPCMBuffer *)buffer error:(NSError *)outError
{
  uint64_t v6 = (id)buffer;
  char v7 = *((void *)self->_impl.__ptr_.__value_ + 1) != 0;
  id v16 = 0;
  int v8 = _AVAE_CheckAndReturnErr(556, (uint64_t)"-[AVAudioFile writeFromBuffer:error:]", (uint64_t)"_impl->isOpen()", v7, 4294967253, &v16);
  id v9 = v16;
  int v10 = v9;
  if (v8)
  {
    BOOL v11 = 0;
    if (outError) {
      *outError = (NSError *)v9;
    }
  }
  else
  {
    _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 561, "-[AVAudioFile writeFromBuffer:error:]", "buffer != nil", v6 != 0);
    if ([(AVAudioPCMBuffer *)v6 frameCapacity])
    {
      uint64_t v12 = AVAudioFileImpl::CheckClientFormatSet(self->_impl.__ptr_.__value_);
      _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 566, (uint64_t)"-[AVAudioFile writeFromBuffer:error:]", (uint64_t)"_impl->CheckClientFormatSet()", v12, outError);
      value = self->_impl.__ptr_.__value_;
      *((void *)value + 4) = -1;
      uint64_t v14 = ExtAudioFileWrite(*((ExtAudioFileRef *)value + 1), [(AVAudioPCMBuffer *)v6 frameLength], [(AVAudioBuffer *)v6 audioBufferList]);
      BOOL v11 = _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 570, (uint64_t)"-[AVAudioFile writeFromBuffer:error:]", (uint64_t)"ExtAudioFileWrite(_impl->_extAudioFile, buffer.frameLength, buffer.audioBufferList)", v14, outError);
    }
    else
    {
      BOOL v11 = 1;
    }
  }

  return v11;
}

- (BOOL)readIntoBuffer:(AVAudioPCMBuffer *)buffer error:(NSError *)outError
{
  uint64_t v6 = buffer;
  LOBYTE(outError) = [(AVAudioFile *)self readIntoBuffer:v6 frameCount:[(AVAudioPCMBuffer *)v6 frameCapacity] error:outError];

  return (char)outError;
}

- (BOOL)isOpen
{
  return *((void *)self->_impl.__ptr_.__value_ + 1) != 0;
}

- (void)close
{
  value = self->_impl.__ptr_.__value_;
  if (value)
  {
    v3 = (OpaqueExtAudioFile *)*((void *)value + 1);
    if (v3)
    {
      ExtAudioFileDispose(v3);
      *((void *)value + 1) = 0;
    }
  }
}

- (void)dealloc
{
  [(AVAudioFile *)self close];
  std::unique_ptr<AVAudioFileImpl>::reset[abi:ne180100]((uint64_t *)&self->_impl, 0);
  v3.receiver = self;
  v3.super_class = (Class)AVAudioFile;
  [(AVAudioFile *)&v3 dealloc];
}

- (id)initSecondaryReader:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AVAudioFile;
  if ([(AVAudioFile *)&v11 init]) {
    operator new();
  }
  if (a5) {
    *a5 = 0;
  }

  return 0;
}

- (AVAudioFile)initForWriting:(NSURL *)fileURL settings:(NSDictionary *)settings commonFormat:(AVAudioCommonFormat)format interleaved:(BOOL)interleaved error:(NSError *)outError
{
  int v10 = fileURL;
  uint64_t v12 = settings;
  v13.receiver = self;
  v13.super_class = (Class)AVAudioFile;
  if ([(AVAudioFile *)&v13 init]) {
    operator new();
  }
  if (outError) {
    *outError = (NSError *)0;
  }

  return 0;
}

- (AVAudioFile)initForWriting:(NSURL *)fileURL settings:(NSDictionary *)settings error:(NSError *)outError
{
  return [(AVAudioFile *)self initForWriting:fileURL settings:settings commonFormat:1 interleaved:0 error:outError];
}

- (id)initForReadingFromExtAudioFile:(OpaqueExtAudioFile *)a3 commonFormat:(unint64_t)a4 interleaved:(BOOL)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)AVAudioFile;
  if ([(AVAudioFile *)&v8 init]) {
    operator new();
  }
  if (a6) {
    *a6 = 0;
  }

  return 0;
}

- (id)initForReadingFromExtAudioFile:(OpaqueExtAudioFile *)a3 error:(id *)a4
{
  return [(AVAudioFile *)self initForReadingFromExtAudioFile:a3 commonFormat:1 interleaved:0 error:a4];
}

- (AVAudioFile)initForReading:(NSURL *)fileURL commonFormat:(AVAudioCommonFormat)format interleaved:(BOOL)interleaved error:(NSError *)outError
{
  objc_super v8 = fileURL;
  v10.receiver = self;
  v10.super_class = (Class)AVAudioFile;
  if ([(AVAudioFile *)&v10 init]) {
    operator new();
  }
  if (outError) {
    *outError = (NSError *)0;
  }

  return 0;
}

- (AVAudioFile)initForReading:(NSURL *)fileURL error:(NSError *)outError
{
  return [(AVAudioFile *)self initForReading:fileURL commonFormat:1 interleaved:0 error:outError];
}

@end