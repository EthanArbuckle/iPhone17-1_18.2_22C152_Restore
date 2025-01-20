@interface NSError(MOVStreamIO)
+ (id)mioPixelBufferPoolErrorWithMessage:()MOVStreamIO code:;
+ (id)movStreamIOErrorWithDomain:()MOVStreamIO message:code:;
+ (id)movStreamIOWarningWithDomain:()MOVStreamIO message:code:;
+ (uint64_t)internalErrorWithMessage:()MOVStreamIO code:;
+ (uint64_t)internalWarningWithMessage:()MOVStreamIO code:;
+ (uint64_t)readerErrorWithMessage:()MOVStreamIO code:;
+ (uint64_t)readerWarningWithMessage:()MOVStreamIO code:;
+ (uint64_t)streamErrorWithMessage:()MOVStreamIO code:;
+ (uint64_t)writerErrorWithMessage:()MOVStreamIO code:;
+ (uint64_t)writerWarningWithMessage:()MOVStreamIO code:;
+ (void)populateReaderError:()MOVStreamIO message:code:;
+ (void)populateStreamError:()MOVStreamIO message:code:;
+ (void)populateWriterError:()MOVStreamIO message:code:;
- (id)errorByAddingStreamId:()MOVStreamIO;
@end

@implementation NSError(MOVStreamIO)

+ (uint64_t)readerErrorWithMessage:()MOVStreamIO code:
{
  return [MEMORY[0x263F087E8] movStreamIOErrorWithDomain:@"com.apple.videoeng.streamreadererror" message:a3 code:a4];
}

+ (uint64_t)writerErrorWithMessage:()MOVStreamIO code:
{
  return [MEMORY[0x263F087E8] movStreamIOErrorWithDomain:@"com.apple.videoeng.streamwritererror" message:a3 code:a4];
}

+ (void)populateReaderError:()MOVStreamIO message:code:
{
  v6 = [MEMORY[0x263F087E8] readerErrorWithMessage:a4 code:a5];
  if (a3)
  {
    id v7 = v6;
    *a3 = v6;
    v6 = v7;
  }
}

+ (void)populateWriterError:()MOVStreamIO message:code:
{
  v6 = [MEMORY[0x263F087E8] writerErrorWithMessage:a4 code:a5];
  if (a3)
  {
    id v7 = v6;
    *a3 = v6;
    v6 = v7;
  }
}

+ (uint64_t)readerWarningWithMessage:()MOVStreamIO code:
{
  return [MEMORY[0x263F087E8] movStreamIOWarningWithDomain:@"com.apple.videoeng.streamreaderwarning" message:a3 code:a4];
}

+ (void)populateStreamError:()MOVStreamIO message:code:
{
  v6 = [MEMORY[0x263F087E8] streamErrorWithMessage:a4 code:a5];
  if (a3)
  {
    id v7 = v6;
    *a3 = v6;
    v6 = v7;
  }
}

+ (uint64_t)writerWarningWithMessage:()MOVStreamIO code:
{
  return [MEMORY[0x263F087E8] movStreamIOWarningWithDomain:@"com.apple.videoeng.streamwriterwarning" message:a3 code:a4];
}

+ (uint64_t)streamErrorWithMessage:()MOVStreamIO code:
{
  return [MEMORY[0x263F087E8] movStreamIOErrorWithDomain:@"com.apple.videoeng.streamerror" message:a3 code:a4];
}

+ (uint64_t)internalErrorWithMessage:()MOVStreamIO code:
{
  return [MEMORY[0x263F087E8] movStreamIOErrorWithDomain:@"com.apple.videoeng.streamerror" message:a3 code:a4];
}

+ (uint64_t)internalWarningWithMessage:()MOVStreamIO code:
{
  return [MEMORY[0x263F087E8] movStreamIOWarningWithDomain:@"com.apple.videoeng.streamwarning" message:a3 code:a4];
}

+ (id)mioPixelBufferPoolErrorWithMessage:()MOVStreamIO code:
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = v5;
    id v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    id v7 = 0;
  }
  v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.videoeng.miopixelbufferpoolerror" code:a4 userInfo:v7];
  v9 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_21B5ED000, v9, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR [MIOPixelBufferPool]: %{public}@ ⛔️⛔️⛔️", (uint8_t *)&v11, 0xCu);
  }

  return v8;
}

+ (id)movStreamIOErrorWithDomain:()MOVStreamIO message:code:
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    uint64_t v16 = *MEMORY[0x263F08320];
    v17[0] = v8;
    v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  }
  else
  {
    v10 = 0;
  }
  int v11 = [MEMORY[0x263F087E8] errorWithDomain:v7 code:a5 userInfo:v10];
  v12 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138543362;
    v15 = v11;
    _os_log_impl(&dword_21B5ED000, v12, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR [MOVStreamIO]: %{public}@ ⛔️⛔️⛔️", (uint8_t *)&v14, 0xCu);
  }

  return v11;
}

+ (id)movStreamIOWarningWithDomain:()MOVStreamIO message:code:
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    uint64_t v16 = *MEMORY[0x263F08320];
    v17[0] = v8;
    v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  }
  else
  {
    v10 = 0;
  }
  int v11 = [MEMORY[0x263F087E8] errorWithDomain:v7 code:a5 userInfo:v10];
  if (+[MIOLog debugEnabled])
  {
    v12 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_21B5ED000, v12, OS_LOG_TYPE_DEBUG, "⚠️⚠️⚠️ WARNING [MOVStreamIO]: %{public}@ ⚠️⚠️⚠️", (uint8_t *)&v14, 0xCu);
    }
  }

  return v11;
}

- (id)errorByAddingStreamId:()MOVStreamIO
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = a3;
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = @"Unknown";
  }
  v6 = [a1 userInfo];
  id v7 = (void *)[v6 mutableCopy];

  id v8 = [a1 domain];
  uint64_t v9 = [a1 code];
  if (!v7) {
    id v7 = objc_opt_new();
  }
  [v7 setObject:v5 forKey:@"ErrorInfoStreamId"];
  v10 = [MEMORY[0x263F087E8] errorWithDomain:v8 code:v9 userInfo:v7];
  int v11 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138543362;
    int v14 = v10;
    _os_log_impl(&dword_21B5ED000, v11, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR [MOVStreamIO]: %{public}@ ⛔️⛔️⛔️", (uint8_t *)&v13, 0xCu);
  }

  return v10;
}

@end