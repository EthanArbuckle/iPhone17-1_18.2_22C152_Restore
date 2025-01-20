@interface VCFileUtil
+ (double)audioContentLengthOfFile:(id)a3;
+ (double)contentLengthOfFile:(id)a3;
+ (tagVCFileStats)statsOfFile:(SEL)a3;
+ (unint64_t)sizeOfFile:(id)a3;
@end

@implementation VCFileUtil

+ (unint64_t)sizeOfFile:(id)a3
{
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a3, "path"), 0);

  return [v3 fileSize];
}

+ (double)contentLengthOfFile:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F166C8] URLAssetWithURL:a3 options:0];
  memset(&v6, 170, sizeof(v6));
  if (v3) {
    [v3 duration];
  }
  else {
    memset(&v6, 0, sizeof(v6));
  }
  CMTime v5 = v6;
  return CMTimeGetSeconds(&v5);
}

+ (double)audioContentLengthOfFile:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F166C8] URLAssetWithURL:a3 options:0];
  v4 = (void *)[v3 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
  if (![v4 count]) {
    return 0.0;
  }
  CMTime v5 = (void *)[v4 objectAtIndexedSubscript:0];
  if (v5)
  {
    [v5 timeRange];
    CMTimeValue v6 = *((void *)&v12 + 1);
    CMTimeEpoch v7 = *((void *)&v13 + 1);
    uint64_t v8 = v13;
  }
  else
  {
    CMTimeEpoch v7 = 0;
    CMTimeValue v6 = 0;
    uint64_t v8 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
  }
  time.value = v6;
  *(void *)&time.timescale = v8;
  time.epoch = v7;
  return CMTimeGetSeconds(&time);
}

+ (tagVCFileStats)statsOfFile:(SEL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CMTimeValue v6 = (void *)[MEMORY[0x1E4F166C8] URLAssetWithURL:a4 options:0];
  CMTimeEpoch v7 = v6;
  memset(&v19, 170, sizeof(v19));
  if (v6) {
    [v6 duration];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }
  CMTime time = v19;
  double Seconds = CMTimeGetSeconds(&time);
  v9 = objc_msgSend((id)objc_msgSend(v7, "tracksWithMediaType:", *MEMORY[0x1E4F15BA8]), "firstObject");
  if (v9)
  {
    [v9 timeRange];
    CMTimeValue v10 = v15;
    CMTimeEpoch v11 = v17;
    uint64_t v12 = v16;
  }
  else
  {
    CMTimeEpoch v11 = 0;
    CMTimeValue v10 = 0;
    uint64_t v12 = 0;
  }
  time.value = v10;
  *(void *)&time.timescale = v12;
  time.epoch = v11;
  double v13 = CMTimeGetSeconds(&time);
  result = +[VCFileUtil sizeOfFile:a4];
  retstr->var0 = (unint64_t)result;
  retstr->var1 = Seconds;
  retstr->var2 = v13;
  return result;
}

@end