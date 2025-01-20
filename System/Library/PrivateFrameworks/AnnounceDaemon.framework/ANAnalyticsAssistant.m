@interface ANAnalyticsAssistant
- (ANAnalyticsAssistantAudioData)audioDataForAnnouncement:(id)a3;
- (ANAnalyticsAssistantSenderData)senderDataForAnnouncement:(SEL)a3;
- (id)_playerForAnnouncement:(id)a3;
- (int)_linearBucketAtInterval:(double)a3 value:(double)a4 max:(double)a5;
- (int64_t)boundGroupCount:(int64_t)a3;
- (int64_t)bucketFromDuration:(double)a3;
- (int64_t)bucketFromReceiveTime:(double)a3;
- (int64_t)bucketFromSize:(int64_t)a3;
@end

@implementation ANAnalyticsAssistant

- (ANAnalyticsAssistantAudioData)audioDataForAnnouncement:(id)a3
{
  v3 = [(ANAnalyticsAssistant *)self _playerForAnnouncement:a3];
  v4 = v3;
  if (v3)
  {
    [v3 duration];
    double v6 = v5;
    v7 = [v4 data];
    uint64_t v8 = [v7 length];

    double v9 = v6;
  }
  else
  {
    double v9 = 0.0;
    uint64_t v8 = 0;
  }

  unint64_t v10 = v8;
  double v11 = v9;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (ANAnalyticsAssistantSenderData)senderDataForAnnouncement:(SEL)a3
{
  id v9 = a4;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var0 = [v9 action];
  retstr->var1 = [v9 deviceClass];
  double v5 = [v9 location];
  if (v5)
  {
    double v6 = [v9 location];
    unint64_t v7 = [v6 target];
  }
  else
  {
    unint64_t v7 = 0;
  }
  retstr->var2 = v7;

  retstr->var3 = [v9 source];

  return result;
}

- (int64_t)boundGroupCount:(int64_t)a3
{
  if (a3 >= 10) {
    return 10;
  }
  else {
    return a3;
  }
}

- (int64_t)bucketFromSize:(int64_t)a3
{
  return [(ANAnalyticsAssistant *)self _linearBucketAtInterval:100000.0 value:(double)a3 max:2000000.0];
}

- (int64_t)bucketFromDuration:(double)a3
{
  return [(ANAnalyticsAssistant *)self _linearBucketAtInterval:5.0 value:a3 max:60.0];
}

- (int64_t)bucketFromReceiveTime:(double)a3
{
  return [(ANAnalyticsAssistant *)self _linearBucketAtInterval:0.5 value:a3 max:10.0];
}

- (id)_playerForAnnouncement:(id)a3
{
  id v3 = a3;
  v4 = [v3 fileData];
  double v5 = [v3 filePath];

  if (!v4 && v5)
  {
    double v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    if (v6) {
      v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v6];
    }
    else {
      v4 = 0;
    }
  }
  if (v4) {
    unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F153C0]) initWithData:v4 error:0];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (int)_linearBucketAtInterval:(double)a3 value:(double)a4 max:(double)a5
{
  if (a4 > a5) {
    return (int)(a5 / a3 + 1.0);
  }
  if (a4 <= 0.0) {
    return 1;
  }
  return vcvtpd_s64_f64(a4 / a3);
}

@end