@interface SHMutableSignature
+ (BOOL)supportsSecureCoding;
- (AVAudioFormat)format;
- (BOOL)appendBuffer:(id)a3 atTime:(id)a4 error:(id *)a5;
- (BOOL)updateRingBufferDuration:(double)a3 error:(id *)a4;
- (SHAudioConverter)audioConverter;
- (SHMutableSignature)init;
- (SHMutableSignature)initWithCoder:(id)a3;
- (SHMutableSignature)initWithID:(id)a3 dataRepresentation:(id)a4 startTime:(id)a5 error:(id *)a6;
- (SHMutableSignature)initWithMaximumSeconds:(double)a3 clipStyle:(int64_t)a4;
- (SHSpectralOutputConfiguration)spectralOutputConfiguration;
- (SigX)sigX;
- (double)duration;
- (double)maximumSeconds;
- (double)secondsFromFrameCount:(unsigned int)a3 forFormat:(id)a4;
- (id)clipExcessAudio:(id)a3;
- (id)dataRepresentation;
- (id)generate:(id *)a3;
- (int)signatureType;
- (int64_t)clipStyle;
- (int64_t)currentPosition;
- (unsigned)currentFrameCount;
- (void)configureWithFormat:(id)a3;
- (void)disableSpectralOutput;
- (void)enableSpectralOutputWithConfiguration:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentFrameCount:(unsigned int)a3;
- (void)setFormat:(id)a3;
- (void)setSigX:(id)a3;
- (void)setSpectralOutputConfiguration:(id)a3;
@end

@implementation SHMutableSignature

- (SHSpectralOutputConfiguration)spectralOutputConfiguration
{
  return self->_spectralOutputConfiguration;
}

- (void)setSpectralOutputConfiguration:(id)a3
{
}

- (SHMutableSignature)init
{
  return [(SHMutableSignature *)self initWithMaximumSeconds:0 clipStyle:36000.0];
}

- (SHMutableSignature)initWithMaximumSeconds:(double)a3 clipStyle:(int64_t)a4
{
  if (a3 <= 0.0)
  {
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Signature maximum duration must be greater than zero" userInfo:0];
    objc_exception_throw(v12);
  }
  v7 = [MEMORY[0x263F08C38] UUID];
  v8 = [MEMORY[0x263EFF8F8] data];
  v13.receiver = self;
  v13.super_class = (Class)SHMutableSignature;
  v9 = [(SHSignature *)&v13 initWithID:v7 dataRepresentation:v8 startTime:0 error:0];

  if (v9)
  {
    double v10 = 36000.0;
    if (a3 <= 36000.0) {
      double v10 = a3;
    }
    v9->_maximumSeconds = v10;
    v9->_clipStyle = a4;
  }
  return v9;
}

- (SHMutableSignature)initWithID:(id)a3 dataRepresentation:(id)a4 startTime:(id)a5 error:(id *)a6
{
  v7.receiver = self;
  v7.super_class = (Class)SHMutableSignature;
  result = [(SHSignature *)&v7 initWithID:a3 dataRepresentation:a4 startTime:a5 error:a6];
  if (result)
  {
    result->_maximumSeconds = 36000.0;
    result->_clipStyle = 0;
  }
  return result;
}

- (SHMutableSignature)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SHMutableSignature;
  v5 = [(SHSignature *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"SHMutableSignatureCodingMaximumSeconds"];
    v5->_maximumSeconds = v6;
    v5->_clipStyle = [v4 decodeIntegerForKey:@"SHMutableSignatureCodingClipStyle"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SHMutableSignature;
  [(SHSignature *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[SHMutableSignature clipStyle](self, "clipStyle"), @"SHMutableSignatureCodingClipStyle");
  [(SHMutableSignature *)self maximumSeconds];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SHMutableSignatureCodingMaximumSeconds");
}

- (BOOL)updateRingBufferDuration:(double)a3 error:(id *)a4
{
  if ([(SHMutableSignature *)self clipStyle] != 1)
  {
    v25 = sh_log_object();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_224B4B000, v25, OS_LOG_TYPE_ERROR, "Can't update mutable signature duration as the clip style is not OLD", v26, 2u);
    }

    +[SHError annotateClientError:a4 code:500 underlyingError:0];
    return 0;
  }
  uint64_t v7 = [(SHMutableSignature *)self sigX];
  if (v7)
  {
    objc_super v8 = (void *)v7;
    v9 = [(SHMutableSignature *)self sigX];
    *(float *)&double v10 = a3;
    int v11 = [v9 setRollingBufferSeconds:a4 error:v10];

    if (!v11) {
      return 0;
    }
  }
  [(SHMutableSignature *)self duration];
  if (v12 > a3)
  {
    [(SHMutableSignature *)self duration];
    double v14 = v13;
    v15 = [(SHMutableSignature *)self format];
    [v15 sampleRate];
    double v17 = v16;

    id v18 = objc_alloc(MEMORY[0x263EF9430]);
    v19 = [(SHSignature *)self time];
    uint64_t v20 = [v19 sampleTime];
    v21 = [(SHMutableSignature *)self format];
    [v21 sampleRate];
    unsigned int v22 = ((v14 - a3) * v17);
    v23 = objc_msgSend(v18, "initWithSampleTime:atRate:", v20 + v22);
    [(SHSignature *)self setTime:v23];

    [(SHMutableSignature *)self setCurrentFrameCount:[(SHMutableSignature *)self currentFrameCount] - v22];
  }
  self->_maximumSeconds = a3;
  return 1;
}

- (int)signatureType
{
  if ([(SHMutableSignature *)self clipStyle] == 1) {
    return 4;
  }
  else {
    return 2;
  }
}

- (void)configureWithFormat:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SHMutableSignature *)self setFormat:v4];
  objc_super v5 = [SigX alloc];
  uint64_t v6 = [(SHMutableSignature *)self signatureType];
  uint64_t v7 = [(SHMutableSignature *)self format];
  [(id)v7 sampleRate];
  id v21 = 0;
  v9 = [(SigX *)v5 initWithSignatureType:v6 sampleRate:v8 error:&v21];
  id v10 = v21;
  [(SHMutableSignature *)self setSigX:v9];

  int v11 = [(SHMutableSignature *)self spectralOutputConfiguration];
  LOBYTE(v7) = v11 == 0;

  if ((v7 & 1) == 0)
  {
    double v12 = [(SHMutableSignature *)self spectralOutputConfiguration];
    [(SHMutableSignature *)self enableSpectralOutputWithConfiguration:v12];
  }
  if ([(SHMutableSignature *)self signatureType] == 4)
  {
    double v13 = [(SHMutableSignature *)self sigX];
    [(SHMutableSignature *)self maximumSeconds];
    *(float *)&double v14 = v14;
    id v20 = v10;
    [v13 setRollingBufferSeconds:&v20 error:v14];
    id v15 = v20;

    id v10 = v15;
  }
  if (v10)
  {
    double v16 = sh_log_object();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v10;
      _os_log_impl(&dword_224B4B000, v16, OS_LOG_TYPE_ERROR, "SigX returned an error: %@", buf, 0xCu);
    }

    double v17 = (void *)MEMORY[0x263EFF940];
    id v18 = [v10 localizedDescription];
    id v19 = [v17 exceptionWithName:*MEMORY[0x263EFF4A0] reason:v18 userInfo:0];

    objc_exception_throw(v19);
  }
}

- (void)enableSpectralOutputWithConfiguration:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_super v5 = [(SHMutableSignature *)self sigX];
  uint64_t v6 = [v4 numberOfBins];
  uint64_t v7 = [v4 callbackFrequency];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__SHMutableSignature_enableSpectralOutputWithConfiguration___block_invoke;
  v8[3] = &unk_2646EFB08;
  objc_copyWeak(&v9, &location);
  [v5 enableSpectralOutputForNumberOfFrequencyBins:v6 callbackFrequency:v7 completionHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__SHMutableSignature_enableSpectralOutputWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "subarrayWithRange:", 1, 6);
  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v8 = @"spectralData";
  v9[0] = v4;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v5 postNotificationName:@"com.apple.shazamd.sigx.newspectraloutput" object:WeakRetained userInfo:v7];
}

- (void)disableSpectralOutput
{
  id v2 = [(SHMutableSignature *)self sigX];
  [v2 disableSpectralOutput];
}

- (id)clipExcessAudio:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  +[SHAudioUtilities durationOfBuffer:v4];
  double v6 = v5;
  [(SHMutableSignature *)self duration];
  double v8 = v7;
  [(SHMutableSignature *)self maximumSeconds];
  if (v6 + v8 > v9)
  {
    [(SHMutableSignature *)self maximumSeconds];
    double v11 = v10;
    [(SHMutableSignature *)self duration];
    double v13 = v12;
    double v14 = sh_log_object();
    double v15 = v11 - v13;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 134217984;
      double v19 = v15;
      _os_log_impl(&dword_224B4B000, v14, OS_LOG_TYPE_DEBUG, "Audio will be too long we require only %f", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v16 = +[SHAudioUtilities bufferHead:v4 duration:v15];

    id v4 = (id)v16;
  }

  return v4;
}

- (BOOL)appendBuffer:(id)a3 atTime:(id)a4 error:(id *)a5
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  double v10 = [v8 format];
  BOOL v11 = +[SHAudioUtilities willAudioFormatCauseBufferMutation:v10];

  if (v11)
  {
    uint64_t v12 = [v8 copy];

    id v8 = (id)v12;
  }
  double v13 = [v8 format];
  BOOL v14 = +[SHAudioUtilities isAudioFormatSupported:v13];

  if (!v14)
  {
    double v15 = [(SHMutableSignature *)self audioConverter];
    uint64_t v16 = [v15 supportedPCMBufferFromBuffer:v8 error:a5];

    if (!v16)
    {
      v25 = sh_log_object();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224B4B000, v25, OS_LOG_TYPE_ERROR, "Failed to convert input buffer to standard format", buf, 2u);
      }
      goto LABEL_37;
    }
    if (v9)
    {
      double v17 = [v16 format];
      [v17 sampleRate];
      if (v18 == 0.0)
      {
        double v24 = 1.0;
      }
      else
      {
        double v19 = [v8 format];
        [v19 sampleRate];
        double v21 = v20;
        unsigned int v22 = [v16 format];
        [v22 sampleRate];
        double v24 = v21 / v23;
      }
      uint64_t v26 = [v9 sampleTime];
      v27 = (void *)MEMORY[0x263EF9430];
      v28 = [v16 format];
      [v28 sampleRate];
      uint64_t v29 = objc_msgSend(v27, "timeWithSampleTime:atRate:", vcvtpd_s64_f64((double)v26 / v24));

      id v9 = (id)v29;
    }

    id v8 = v16;
  }
  v30 = [(SHMutableSignature *)self format];

  if (!v30)
  {
    [(SHSignature *)self setTime:v9];
    v31 = [(SHSignature *)self time];
    v32 = [(SHSignature *)self _startDateBasedUponAudioTime:v31];
    [(SHSignature *)self setAudioStartDate:v32];

    v33 = [v8 format];
    [(SHMutableSignature *)self configureWithFormat:v33];
  }
  v34 = [v8 format];
  v35 = [(SHMutableSignature *)self format];
  char v36 = [v34 isEqual:v35];

  if ((v36 & 1) == 0)
  {
    v80 = [v8 format];
    uint64_t v81 = [v80 formatDescription];

    v82 = [(SHMutableSignature *)self format];
    uint64_t v83 = [v82 formatDescription];

    v84 = sh_log_object();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      v85 = [v8 format];
      *(_DWORD *)buf = 138412546;
      uint64_t v98 = [v85 formatDescription];
      __int16 v99 = 2112;
      uint64_t v100 = v83;
      _os_log_impl(&dword_224B4B000, v84, OS_LOG_TYPE_ERROR, "Audio format mismatch %@ != %@", buf, 0x16u);
    }
    v86 = (void *)MEMORY[0x263EFF940];
    v87 = [NSString stringWithFormat:@"Supplied audio format %@ does not match existing format %@", v81, v83];
    id v88 = [v86 exceptionWithName:*MEMORY[0x263EFF4A0] reason:v87 userInfo:0];

    objc_exception_throw(v88);
  }
  +[SHAudioUtilities durationOfBuffer:v8];
  double v38 = v37;
  [(SHMutableSignature *)self duration];
  double v40 = v39;
  [(SHMutableSignature *)self maximumSeconds];
  double v42 = v41;
  [(SHMutableSignature *)self duration];
  double v44 = v43;
  [(SHMutableSignature *)self maximumSeconds];
  double v46 = v45;
  double v47 = v38 + v44;
  if (![(SHMutableSignature *)self clipStyle])
  {
    if (v40 >= v42)
    {
      v75 = sh_log_object();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224B4B000, v75, OS_LOG_TYPE_DEBUG, "Discarding audio we are at max duration with a discard behaviour", buf, 2u);
      }

      v25 = [NSString stringWithFormat:@"The signature has reached the max duration"];
      v95[0] = *MEMORY[0x263F08338];
      v95[1] = @"discardedAudioDuration";
      v96[0] = v25;
      v76 = [NSNumber numberWithDouble:v38];
      v96[1] = v76;
      v77 = [NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:2];
      +[SHError annotateClientError:a5 code:201 underlyingError:0 keyOverrides:v77];

      goto LABEL_37;
    }
    if (v47 > v46)
    {
      v65 = [(SHMutableSignature *)self clipExcessAudio:v8];

      v66 = [(SHMutableSignature *)self sigX];
      int v67 = [v66 flowBuffer:v65 error:a5];

      if (!v67)
      {
        BOOL v64 = 0;
        goto LABEL_40;
      }
      v68 = sh_log_object();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224B4B000, v68, OS_LOG_TYPE_DEBUG, "Discarding audio we are at max duration with a discard behaviour", buf, 2u);
      }

      v25 = [NSString stringWithFormat:@"The signature has reached the max duration"];
      [(SHMutableSignature *)self maximumSeconds];
      double v70 = v69;
      [(SHMutableSignature *)self duration];
      v93[0] = *MEMORY[0x263F08338];
      v93[1] = @"discardedAudioDuration";
      v94[0] = v25;
      v72 = [NSNumber numberWithDouble:v38 - (v70 - v71)];
      v94[1] = v72;
      v73 = [NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:2];
      +[SHError annotateClientError:a5 code:201 underlyingError:0 keyOverrides:v73];

      -[SHMutableSignature setCurrentFrameCount:](self, "setCurrentFrameCount:", -[SHMutableSignature currentFrameCount](self, "currentFrameCount")+ [v65 frameLength]);
      id v8 = v65;
      goto LABEL_37;
    }
  }
  if (!v9) {
    goto LABEL_21;
  }
  if (([v9 isSampleTimeValid] & 1) == 0)
  {
    v25 = [NSString stringWithFormat:@"The provided time does not have a valid sample time"];
    uint64_t v91 = *MEMORY[0x263F08338];
    v92 = v25;
    v74 = [NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    +[SHError annotateClientError:a5 code:101 underlyingError:0 keyOverrides:v74];

LABEL_37:
    goto LABEL_38;
  }
  if ([(SHMutableSignature *)self currentPosition])
  {
    int64_t v48 = [(SHMutableSignature *)self currentPosition];
    if (v48 != [v9 sampleTime])
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"The current frame position %lld does not equal the sample time %lld", -[SHMutableSignature currentPosition](self, "currentPosition"), objc_msgSend(v9, "sampleTime"));
      uint64_t v89 = *MEMORY[0x263F08338];
      v90 = v25;
      v78 = [NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
      +[SHError annotateClientError:a5 code:101 underlyingError:0 keyOverrides:v78];

      goto LABEL_37;
    }
  }
LABEL_21:
  v49 = [(SHMutableSignature *)self sigX];
  int v50 = [v49 flowBuffer:v8 error:a5];

  if (v50)
  {
    if ([(SHMutableSignature *)self clipStyle] == 1 && v47 > v46)
    {
      [(SHMutableSignature *)self maximumSeconds];
      double v52 = v51;
      v53 = [(SHMutableSignature *)self format];
      [v53 sampleRate];
      double v55 = v54;

      unsigned int v56 = [(SHMutableSignature *)self currentFrameCount];
      int v57 = [v8 frameLength];
      id v58 = objc_alloc(MEMORY[0x263EF9430]);
      v59 = [(SHSignature *)self time];
      uint64_t v60 = [v59 sampleTime];
      v61 = [(SHMutableSignature *)self format];
      [v61 sampleRate];
      unsigned int v62 = v56 - (v52 * v55) + v57;
      v63 = objc_msgSend(v58, "initWithSampleTime:atRate:", v60 + v62);
      [(SHSignature *)self setTime:v63];

      [(SHMutableSignature *)self setCurrentFrameCount:[(SHMutableSignature *)self currentFrameCount] - v62];
    }
    -[SHMutableSignature setCurrentFrameCount:](self, "setCurrentFrameCount:", -[SHMutableSignature currentFrameCount](self, "currentFrameCount") + [v8 frameLength]);
    BOOL v64 = 1;
    goto LABEL_39;
  }
LABEL_38:
  BOOL v64 = 0;
LABEL_39:
  v65 = v8;
LABEL_40:

  return v64;
}

- (int64_t)currentPosition
{
  id v3 = [(SHSignature *)self time];
  uint64_t v4 = [v3 sampleTime];
  int64_t v5 = v4 + [(SHMutableSignature *)self currentFrameCount];

  return v5;
}

- (id)generate:(id *)a3
{
  int64_t v5 = [(SHMutableSignature *)self sigX];

  if (v5)
  {
    double v6 = [(SHMutableSignature *)self sigX];
    id v11 = 0;
    double v7 = [v6 signatureWithError:&v11];
    id v8 = v11;

    if (v7) {
      id v9 = v7;
    }
    else {
      +[SHError annotateClientError:a3 code:200 underlyingError:v8];
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)dataRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v15 = 0;
  id v3 = [(SHMutableSignature *)self generate:&v15];
  id v4 = v15;
  int64_t v5 = v4;
  if (v3)
  {
    +[SigCrop getSampleLength:v3 error:0];
    double v7 = v6;
    [(SHMutableSignature *)self maximumSeconds];
    if (v7 > v8)
    {
      id v9 = sh_log_object();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224B4B000, v9, OS_LOG_TYPE_ERROR, "Rolling signature buffer is over maximum seconds, cropping down to duration", buf, 2u);
      }

      [(SHMutableSignature *)self maximumSeconds];
      uint64_t v11 = +[SigCrop cropSignature:v3 atPosition:0 withDuration:0.0 error:v10];

      id v3 = (void *)v11;
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v12 = sh_log_object();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        double v17 = v5;
        _os_log_impl(&dword_224B4B000, v12, OS_LOG_TYPE_ERROR, "Signature generation error %@", buf, 0xCu);
      }
    }
    v14.receiver = self;
    v14.super_class = (Class)SHMutableSignature;
    id v3 = [(SHSignature *)&v14 dataRepresentation];
  }

  return v3;
}

- (double)duration
{
  if ([(SHMutableSignature *)self currentFrameCount])
  {
    uint64_t v3 = [(SHMutableSignature *)self currentFrameCount];
    id v4 = [(SHMutableSignature *)self format];
    [(SHMutableSignature *)self secondsFromFrameCount:v3 forFormat:v4];
    double v6 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SHMutableSignature;
    double v7 = [(SHSignature *)&v10 dataRepresentation];
    +[SigCrop getSampleLength:v7 error:0];
    double v6 = v8;
  }
  return v6;
}

- (double)secondsFromFrameCount:(unsigned int)a3 forFormat:(id)a4
{
  id v5 = a4;
  double v6 = v5;
  if (a3)
  {
    [v5 sampleRate];
    double v8 = (double)a3 / v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (SHAudioConverter)audioConverter
{
  audioConverter = self->_audioConverter;
  if (!audioConverter)
  {
    id v4 = objc_alloc_init(SHAudioConverter);
    id v5 = self->_audioConverter;
    self->_audioConverter = v4;

    audioConverter = self->_audioConverter;
  }

  return audioConverter;
}

- (double)maximumSeconds
{
  return self->_maximumSeconds;
}

- (int64_t)clipStyle
{
  return self->_clipStyle;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (SigX)sigX
{
  return self->_sigX;
}

- (void)setSigX:(id)a3
{
}

- (unsigned)currentFrameCount
{
  return self->_currentFrameCount;
}

- (void)setCurrentFrameCount:(unsigned int)a3
{
  self->_currentFrameCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigX, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_spectralOutputConfiguration, 0);

  objc_storeStrong((id *)&self->_audioConverter, 0);
}

@end