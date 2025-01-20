@interface SFVoiceAnalytics
+ (BOOL)supportsSecureCoding;
- (SFAcousticFeature)jitter;
- (SFAcousticFeature)pitch;
- (SFAcousticFeature)shimmer;
- (SFAcousticFeature)voicing;
- (SFVoiceAnalytics)initWithCoder:(id)a3;
- (id)_initWithJitter:(id)a3 shimmer:(id)a4 pitch:(id)a5 voicing:(id)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFVoiceAnalytics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicing, 0);
  objc_storeStrong((id *)&self->_pitch, 0);
  objc_storeStrong((id *)&self->_shimmer, 0);

  objc_storeStrong((id *)&self->_jitter, 0);
}

- (SFAcousticFeature)voicing
{
  return self->_voicing;
}

- (SFAcousticFeature)pitch
{
  return self->_pitch;
}

- (SFAcousticFeature)shimmer
{
  return self->_shimmer;
}

- (SFAcousticFeature)jitter
{
  return self->_jitter;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)SFVoiceAnalytics;
  v3 = [(SFVoiceAnalytics *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@", jitter=%@, shimmer=%@, pitch=%@, voicing=%@", self->_jitter, self->_shimmer, self->_pitch, self->_voicing];

  return v4;
}

- (id)_initWithJitter:(id)a3 shimmer:(id)a4 pitch:(id)a5 voicing:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SFVoiceAnalytics;
  v14 = [(SFVoiceAnalytics *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    jitter = v14->_jitter;
    v14->_jitter = (SFAcousticFeature *)v15;

    uint64_t v17 = [v11 copy];
    shimmer = v14->_shimmer;
    v14->_shimmer = (SFAcousticFeature *)v17;

    uint64_t v19 = [v12 copy];
    pitch = v14->_pitch;
    v14->_pitch = (SFAcousticFeature *)v19;

    uint64_t v21 = [v13 copy];
    voicing = v14->_voicing;
    v14->_voicing = (SFAcousticFeature *)v21;
  }
  return v14;
}

- (SFVoiceAnalytics)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFVoiceAnalytics;
  v5 = [(SFVoiceAnalytics *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_jitter"];
    jitter = v5->_jitter;
    v5->_jitter = (SFAcousticFeature *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shimmer"];
    shimmer = v5->_shimmer;
    v5->_shimmer = (SFAcousticFeature *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pitch"];
    pitch = v5->_pitch;
    v5->_pitch = (SFAcousticFeature *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_voicing"];
    voicing = v5->_voicing;
    v5->_voicing = (SFAcousticFeature *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  jitter = self->_jitter;
  id v5 = a3;
  [v5 encodeObject:jitter forKey:@"_jitter"];
  [v5 encodeObject:self->_shimmer forKey:@"_shimmer"];
  [v5 encodeObject:self->_pitch forKey:@"_pitch"];
  [v5 encodeObject:self->_voicing forKey:@"_voicing"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end