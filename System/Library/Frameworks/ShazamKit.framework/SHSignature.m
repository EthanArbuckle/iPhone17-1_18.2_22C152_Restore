@interface SHSignature
+ (BOOL)supportsSecureCoding;
+ (SHSignature)signatureWithDataRepresentation:(NSData *)dataRepresentation error:(NSError *)error;
+ (id)signatureFromData:(id)a3 atTime:(id)a4 error:(id *)a5;
- (AVAudioTime)time;
- (NSData)dataRepresentation;
- (NSDate)audioStartDate;
- (NSTimeInterval)duration;
- (NSUUID)_ID;
- (SHSignature)init;
- (SHSignature)initWithCoder:(id)a3;
- (SHSignature)initWithDataRepresentation:(NSData *)dataRepresentation error:(NSError *)error;
- (SHSignature)initWithID:(id)a3 dataRepresentation:(id)a4 startTime:(id)a5 error:(id *)a6;
- (SHSignatureMetrics)metrics;
- (id)_startDateBasedUponAudioTime:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)commonSetupWithID:(id)a3 dataRepresentation:(id)a4 startTime:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioStartDate:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setTime:(id)a3;
@end

@implementation SHSignature

+ (id)signatureFromData:(id)a3 atTime:(id)a4 error:(id *)a5
{
  return +[SHSignature signatureWithDataRepresentation:a3 error:a5];
}

+ (SHSignature)signatureWithDataRepresentation:(NSData *)dataRepresentation error:(NSError *)error
{
  v5 = dataRepresentation;
  v6 = [[SHSignature alloc] initWithDataRepresentation:v5 error:error];

  +[SHError remapErrorToClientErrorPointer:error];

  return v6;
}

- (SHSignature)initWithDataRepresentation:(NSData *)dataRepresentation error:(NSError *)error
{
  v6 = dataRepresentation;
  if (+[SHSignatureDataRepresentationValidator signatureDataIsValid:v6 error:error])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263EF9430]) initWithHostTime:mach_absolute_time()];
    v12.receiver = self;
    v12.super_class = (Class)SHSignature;
    v8 = [(SHSignature *)&v12 init];
    if (v8)
    {
      v9 = [MEMORY[0x263F08C38] UUID];
      [(SHSignature *)v8 commonSetupWithID:v9 dataRepresentation:v6 startTime:v7];
    }
    self = v8;

    v10 = self;
  }
  else
  {
    +[SHError remapErrorToClientErrorPointer:error];
    v10 = 0;
  }

  return v10;
}

- (SHSignature)initWithID:(id)a3 dataRepresentation:(id)a4 startTime:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHSignature;
  objc_super v12 = [(SHSignature *)&v15 init];
  v13 = v12;
  if (v12) {
    [(SHSignature *)v12 commonSetupWithID:v9 dataRepresentation:v10 startTime:v11];
  }

  return v13;
}

- (void)commonSetupWithID:(id)a3 dataRepresentation:(id)a4 startTime:(id)a5
{
  v8 = (NSUUID *)a3;
  id v9 = (NSData *)a4;
  id v10 = (AVAudioTime *)a5;
  ID = self->__ID;
  self->__ID = v8;
  v18 = v8;

  time = self->_time;
  self->_time = v10;
  v13 = v10;

  dataRepresentation = self->_dataRepresentation;
  self->_dataRepresentation = v9;
  objc_super v15 = v9;

  v16 = [(SHSignature *)self _startDateBasedUponAudioTime:v13];
  audioStartDate = self->_audioStartDate;
  self->_audioStartDate = v16;
}

- (SHSignature)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EF9430]) initWithHostTime:mach_absolute_time()];
  v4 = [MEMORY[0x263F08C38] UUID];
  v5 = [MEMORY[0x263EFF8F8] data];
  v6 = [(SHSignature *)self initWithID:v4 dataRepresentation:v5 startTime:v3 error:0];

  return v6;
}

- (id)_startDateBasedUponAudioTime:(id)a3
{
  id v4 = a3;
  if ([v4 isHostTimeValid])
  {
    [MEMORY[0x263EF9430] secondsForHostTime:mach_absolute_time()];
    double v6 = v5;
    objc_msgSend(MEMORY[0x263EF9430], "secondsForHostTime:", objc_msgSend(v4, "hostTime"));
    double v8 = v6 - v7;
    id v9 = (void *)MEMORY[0x263EFF910];
  }
  else
  {
    id v9 = (void *)MEMORY[0x263EFF910];
    [(SHSignature *)self duration];
  }
  id v10 = [v9 dateWithTimeIntervalSinceNow:-v8];

  return v10;
}

- (NSTimeInterval)duration
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(SHSignature *)self dataRepresentation];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0.0;
  }
  double v5 = [(SHSignature *)self dataRepresentation];
  id v11 = 0;
  +[SigCrop getSampleLength:v5 error:&v11];
  double v7 = v6;
  id v8 = v11;

  if (v8)
  {
    id v9 = sh_log_object();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_224B4B000, v9, OS_LOG_TYPE_ERROR, "Error getting signature duration, returning 0, %@", buf, 0xCu);
    }
  }
  return v7;
}

- (void)setMetrics:(id)a3
{
}

- (SHSignatureMetrics)metrics
{
  metrics = self->_metrics;
  if (!metrics)
  {
    uint64_t v4 = [SHSignatureMetrics alloc];
    double v5 = [(SHSignature *)self audioStartDate];
    double v6 = [(SHSignatureMetrics *)v4 initWithSessionStartDate:v5 signatureRecordingOffset:0.0];
    double v7 = self->_metrics;
    self->_metrics = v6;

    metrics = self->_metrics;
  }

  return metrics;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHSignature)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHSignatureCodingKeyData"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"SHSignatureCodingHostTime"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"SHSignatureCodingSampleTime"];
  [v4 decodeDoubleForKey:@"SHSignatureCodingTimeSampleRate"];
  double v9 = v8;
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHSignatureCodingKeyID"];
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHSignatureCodingMetrics"];
  objc_super v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHSignatureCodingSignatureStartDate"];

  id v13 = [MEMORY[0x263EF9430] timeWithHostTime:v6 sampleTime:v7 atRate:v9];
  uint64_t v14 = [(SHSignature *)self initWithID:v10 dataRepresentation:v5 startTime:v13 error:0];

  [(SHSignature *)v14 setMetrics:v11];
  [(SHSignature *)v14 setAudioStartDate:v12];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(SHSignature *)self dataRepresentation];
  [v4 encodeObject:v5 forKey:@"SHSignatureCodingKeyData"];

  uint64_t v6 = [(SHSignature *)self time];
  objc_msgSend(v4, "encodeInt64:forKey:", objc_msgSend(v6, "hostTime"), @"SHSignatureCodingHostTime");

  uint64_t v7 = [(SHSignature *)self time];
  objc_msgSend(v4, "encodeInt64:forKey:", objc_msgSend(v7, "sampleTime"), @"SHSignatureCodingSampleTime");

  double v8 = [(SHSignature *)self time];
  [v8 sampleRate];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SHSignatureCodingTimeSampleRate");

  double v9 = [(SHSignature *)self _ID];
  [v4 encodeObject:v9 forKey:@"SHSignatureCodingKeyID"];

  id v10 = [(SHSignature *)self metrics];
  [v4 encodeObject:v10 forKey:@"SHSignatureCodingMetrics"];

  id v11 = [(SHSignature *)self audioStartDate];
  [v4 encodeObject:v11 forKey:@"SHSignatureCodingSignatureStartDate"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = (void *)MEMORY[0x263EF9430];
  uint64_t v6 = [(SHSignature *)self time];
  uint64_t v7 = [v6 sampleTime];
  double v8 = [(SHSignature *)self time];
  [v8 sampleRate];
  double v9 = objc_msgSend(v5, "timeWithSampleTime:atRate:", v7);

  id v10 = +[SHSignature allocWithZone:a3];
  id v11 = [(SHSignature *)self _ID];
  objc_super v12 = (void *)[v11 copyWithZone:a3];
  id v13 = [(SHSignature *)self dataRepresentation];
  uint64_t v14 = (void *)[v13 copyWithZone:a3];
  objc_super v15 = [(SHSignature *)v10 initWithID:v12 dataRepresentation:v14 startTime:v9 error:0];

  v16 = [(SHSignature *)self metrics];
  v17 = (void *)[v16 copyWithZone:a3];
  [(SHSignature *)v15 setMetrics:v17];

  v18 = [(SHSignature *)self audioStartDate];
  v19 = (void *)[v18 copyWithZone:a3];
  [(SHSignature *)v15 setAudioStartDate:v19];

  return v15;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [(SHSignature *)self duration];
  uint64_t v7 = v6;
  v11.receiver = self;
  v11.super_class = (Class)SHSignature;
  double v8 = [(SHSignature *)&v11 debugDescription];
  double v9 = [v3 stringWithFormat:@"%@: %.2fs %@", v5, v7, v8];

  return v9;
}

- (NSData)dataRepresentation
{
  return self->_dataRepresentation;
}

- (NSDate)audioStartDate
{
  return self->_audioStartDate;
}

- (void)setAudioStartDate:(id)a3
{
}

- (AVAudioTime)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (NSUUID)_ID
{
  return self->__ID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__ID, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_audioStartDate, 0);
  objc_storeStrong((id *)&self->_metrics, 0);

  objc_storeStrong((id *)&self->_dataRepresentation, 0);
}

@end