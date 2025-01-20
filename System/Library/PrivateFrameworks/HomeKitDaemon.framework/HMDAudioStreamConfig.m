@interface HMDAudioStreamConfig
- (id)description;
@end

@implementation HMDAudioStreamConfig

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  v22.receiver = self;
  v22.super_class = (Class)HMDAudioStreamConfig;
  [(HMDMediaStreamConfig *)&v22 addToDescription:v3];
  [v3 appendFormat:@"\n"];
  v4 = [(AVCMediaStreamConfig *)self audio];
  uint64_t v5 = [v4 codecType];
  v6 = [(AVCMediaStreamConfig *)self audio];
  unint64_t v7 = [v6 codecType];
  if (v7 > 0xB) {
    v8 = @"Unknown AVC Audio codec";
  }
  else {
    v8 = off_264A20198[v7];
  }
  v9 = v8;
  [v3 appendFormat:@"audio.codecType       = %tu, %@\n", v5, v9];

  v10 = [(AVCMediaStreamConfig *)self audio];
  objc_msgSend(v3, "appendFormat:", @"audio.dtmfPayloadType = %tu\n", objc_msgSend(v10, "dtmfPayloadType"));

  v11 = [(AVCMediaStreamConfig *)self audio];
  [v11 isOctectAligned];
  v12 = HMFBooleanToString();
  [v3 appendFormat:@"audio.octetAligned    = %@\n", v12];

  v13 = [(AVCMediaStreamConfig *)self audio];
  [v13 isDTXEnabled];
  v14 = HMFEnabledStatusToString();
  [v3 appendFormat:@"audio.dtxEnabled      = %@\n", v14];

  v15 = [(AVCMediaStreamConfig *)self audio];
  objc_msgSend(v3, "appendFormat:", @"audio.audioStreamMode = %tu\n", objc_msgSend(v15, "audioStreamMode"));

  v16 = [(AVCMediaStreamConfig *)self audio];
  [v16 isCNEnabled];
  v17 = HMFEnabledStatusToString();
  [v3 appendFormat:@"audio.cnEnabled       = %@\n", v17];

  v18 = [(AVCMediaStreamConfig *)self audio];
  objc_msgSend(v3, "appendFormat:", @"audio.cnPayloadType   = %tu\n", objc_msgSend(v18, "cnPayloadType"));

  v19 = [(AVCMediaStreamConfig *)self audio];
  objc_msgSend(v3, "appendFormat:", @"audio.ptime           = %tu ms\n", objc_msgSend(v19, "ptime"));

  v20 = (void *)[v3 copy];
  return v20;
}

@end