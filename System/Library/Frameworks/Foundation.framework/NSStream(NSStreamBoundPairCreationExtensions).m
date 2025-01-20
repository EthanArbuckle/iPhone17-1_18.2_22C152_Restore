@interface NSStream(NSStreamBoundPairCreationExtensions)
+ (__CFWriteStream)getBoundStreamsWithBufferSize:()NSStreamBoundPairCreationExtensions inputStream:outputStream:;
@end

@implementation NSStream(NSStreamBoundPairCreationExtensions)

+ (__CFWriteStream)getBoundStreamsWithBufferSize:()NSStreamBoundPairCreationExtensions inputStream:outputStream:
{
  readStream[1] = *(CFReadStreamRef *)MEMORY[0x1E4F143B8];
  CFWriteStreamRef writeStream = 0;
  readStream[0] = 0;
  CFStreamCreateBoundPair((CFAllocatorRef)*MEMORY[0x1E4F1CF80], readStream, &writeStream, transferBufferSize);
  if (readStream[0])
  {
    v7 = readStream[0];
    if (a4) {
      *a4 = readStream[0];
    }
  }
  result = writeStream;
  if (writeStream)
  {
    result = writeStream;
    if (a5) {
      *a5 = writeStream;
    }
  }
  return result;
}

@end