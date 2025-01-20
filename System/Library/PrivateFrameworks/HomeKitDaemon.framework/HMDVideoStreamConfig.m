@interface HMDVideoStreamConfig
- (id)description;
@end

@implementation HMDVideoStreamConfig

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  v27.receiver = self;
  v27.super_class = (Class)HMDVideoStreamConfig;
  [(HMDMediaStreamConfig *)&v27 addToDescription:v3];
  [v3 appendFormat:@"\n"];
  v4 = [(AVCMediaStreamConfig *)self video];
  uint64_t v5 = [v4 txCodecType];
  v6 = [(AVCMediaStreamConfig *)self video];
  uint64_t v7 = [v6 txCodecType];
  if (v7 == 1) {
    v8 = @"kAVCCodecTypeHEVC";
  }
  else {
    v8 = @"Unknown AVC Video codec";
  }
  if (!v7) {
    v8 = @"kAVCCodecTypeH264";
  }
  v9 = v8;
  [v3 appendFormat:@"video.txCodecType     = %tu, %@\n", v5, v9];

  v10 = [(AVCMediaStreamConfig *)self video];
  uint64_t v11 = [v10 rxCodecType];
  v12 = [(AVCMediaStreamConfig *)self video];
  uint64_t v13 = [v12 txCodecType];
  if (v13 == 1) {
    v14 = @"kAVCCodecTypeHEVC";
  }
  else {
    v14 = @"Unknown AVC Video codec";
  }
  if (!v13) {
    v14 = @"kAVCCodecTypeH264";
  }
  v15 = v14;
  [v3 appendFormat:@"video.rxCodecType     = %tu, %@\n", v11, v15];

  v16 = [(AVCMediaStreamConfig *)self video];
  uint64_t v17 = [v16 videoResolution];
  v18 = [(AVCMediaStreamConfig *)self video];
  unint64_t v19 = [v18 videoResolution];
  if (v19 > 0xE) {
    v20 = @"Unknown AVC Video resolution";
  }
  else {
    v20 = off_264A201F8[v19];
  }
  v21 = v20;
  [v3 appendFormat:@"video.videoResolution = %tu, %@\n", v17, v21];

  v22 = [(AVCMediaStreamConfig *)self video];
  objc_msgSend(v3, "appendFormat:", @"video.framerate       = %tu\n", objc_msgSend(v22, "framerate"));

  v23 = [(AVCMediaStreamConfig *)self video];
  objc_msgSend(v3, "appendFormat:", @"video.rxMaxBitrate    = %tu\n", objc_msgSend(v23, "rxMaxBitrate"));

  v24 = [(AVCMediaStreamConfig *)self video];
  objc_msgSend(v3, "appendFormat:", @"video.rxMinBitrate    = %tu\n", objc_msgSend(v24, "rxMinBitrate"));

  v25 = (void *)[v3 copy];
  return v25;
}

@end