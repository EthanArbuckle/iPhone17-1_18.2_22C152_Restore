@interface VCPProtoFilesystemMovieAudioClassificationResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)duration;
- (float)start;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(float)a3;
- (void)setStart:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoFilesystemMovieAudioClassificationResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v14, 0, sizeof(v14));
  CMTimeRangeMakeFromDictionary(&v14, v3);
  CMTime start = v14.start;
  CMTime duration = v14.duration;
  uint64_t v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"quality"];
  v5 = (void *)v4;
  if (v14.start.flags)
  {
    v6 = 0;
    if ((v14.duration.flags & 1) != 0 && !v14.duration.epoch)
    {
      v6 = 0;
      if ((v14.duration.value & 0x8000000000000000) == 0)
      {
        if (v4)
        {
          v6 = objc_alloc_init(VCPProtoFilesystemMovieAudioClassificationResult);
          CMTime time = start;
          Float64 Seconds = CMTimeGetSeconds(&time);
          *(float *)&Float64 Seconds = Seconds;
          [(VCPProtoFilesystemMovieAudioClassificationResult *)v6 setStart:Seconds];
          CMTime v10 = duration;
          Float64 v8 = CMTimeGetSeconds(&v10);
          *(float *)&Float64 v8 = v8;
          [(VCPProtoFilesystemMovieAudioClassificationResult *)v6 setDuration:v8];
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)exportToLegacyDictionary
{
  memset(&v12, 0, sizeof(v12));
  [(VCPProtoFilesystemMovieAudioClassificationResult *)self start];
  CMTimeMakeWithSeconds(&v12, v3, 600);
  memset(&v11, 0, sizeof(v11));
  [(VCPProtoFilesystemMovieAudioClassificationResult *)self duration];
  CMTimeMakeWithSeconds(&v11, v4, 600);
  memset(&v10, 0, sizeof(v10));
  CMTime start = v12;
  CMTime v8 = v11;
  CMTimeRangeMake(&v10, &start, &v8);
  CMTimeRange range = v10;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  [v6 setObject:&unk_1F15EAC38 forKeyedSubscript:@"quality"];
  return v6;
}

- (id)description
{
  float v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoFilesystemMovieAudioClassificationResult;
  float v4 = [(VCPProtoFilesystemMovieAudioClassificationResult *)&v8 description];
  CFDictionaryRef v5 = [(VCPProtoFilesystemMovieAudioClassificationResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  float v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_start;
  CFDictionaryRef v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"start"];

  *(float *)&double v6 = self->_duration;
  v7 = [NSNumber numberWithFloat:v6];
  [v3 setObject:v7 forKey:@"duration"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoFilesystemMovieAudioClassificationResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = LODWORD(self->_start);
  *((_DWORD *)a3 + 2) = LODWORD(self->_duration);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = LODWORD(self->_start);
  *((_DWORD *)result + 2) = LODWORD(self->_duration);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (float *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_start == v4[3]
    && self->_duration == v4[2];

  return v5;
}

- (unint64_t)hash
{
  float start = self->_start;
  float v4 = -start;
  if (start >= 0.0) {
    float v4 = self->_start;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  float v7 = fmodf(v5, 1.8447e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  float duration = self->_duration;
  float v13 = -duration;
  if (duration >= 0.0) {
    float v13 = self->_duration;
  }
  float v14 = floorf(v13 + 0.5);
  float v15 = (float)(v13 - v14) * 1.8447e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmodf(v14, 1.8447e19);
  unint64_t v17 = v16 + (unint64_t)v15;
  float v18 = fabsf(v15);
  if (v15 <= 0.0) {
    unint64_t v17 = v16;
  }
  unint64_t v19 = v16 - (unint64_t)v18;
  if (v15 >= 0.0) {
    unint64_t v19 = v17;
  }
  return v19 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_float start = *((float *)a3 + 3);
  self->_float duration = *((float *)a3 + 2);
}

- (float)start
{
  return self->_start;
}

- (void)setStart:(float)a3
{
  self->_float start = a3;
}

- (float)duration
{
  return self->_duration;
}

- (void)setDuration:(float)a3
{
  self->_float duration = a3;
}

@end