@interface SHSignatureBuffer
- (AVAudioFormat)format;
- (BOOL)shouldGenerateSpectralOutput;
- (SHSignature)currentSignature;
- (SHSignatureBuffer)initWithMinimumSignatureDuration:(double)a3 maximumSignatureDuration:(double)a4 bufferDuration:(double)a5;
- (SHSignatureBuffer)initWithMinimumSignatureDuration:(double)a3 maximumSignatureDuration:(double)a4 bufferDuration:(double)a5 signatureGenerator:(id)a6;
- (SHSignatureGenerator)signatureGenerator;
- (double)bufferMaxSize;
- (double)currentSignatureDuration;
- (double)duration;
- (double)maximumSignatureDuration;
- (double)minimumSignatureDuration;
- (double)signatureOffset;
- (id)generateCurrentSignature;
- (void)discardSignatureWithID:(id)a3;
- (void)flow:(id)a3 time:(id)a4;
- (void)reset;
- (void)setBufferMaxSize:(double)a3;
- (void)setCurrentSignature:(id)a3;
- (void)setFormat:(id)a3;
- (void)setMaximumSignatureDuration:(double)a3;
- (void)setMinimumSignatureDuration:(double)a3;
- (void)setShouldGenerateSpectralOutput:(BOOL)a3;
- (void)setSignatureGenerator:(id)a3;
- (void)setSignatureOffset:(double)a3;
@end

@implementation SHSignatureBuffer

- (SHSignatureBuffer)initWithMinimumSignatureDuration:(double)a3 maximumSignatureDuration:(double)a4 bufferDuration:(double)a5
{
  v11.receiver = self;
  v11.super_class = (Class)SHSignatureBuffer;
  v8 = [(SHSignatureBuffer *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_minimumSignatureDuration = a3;
    v8->_maximumSignatureDuration = a4;
    v8->_bufferMaxSize = a5;
    [(SHSignatureBuffer *)v8 reset];
  }
  return v9;
}

- (SHSignatureBuffer)initWithMinimumSignatureDuration:(double)a3 maximumSignatureDuration:(double)a4 bufferDuration:(double)a5 signatureGenerator:(id)a6
{
  id v11 = a6;
  v12 = [(SHSignatureBuffer *)self initWithMinimumSignatureDuration:a3 maximumSignatureDuration:a4 bufferDuration:a5];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_signatureGenerator, a6);
    [(SHSignatureGenerator *)v13->_signatureGenerator updateRingBufferDuration:0 error:a5];
  }

  return v13;
}

- (void)discardSignatureWithID:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SHSignatureBuffer *)self currentSignature];
  v6 = [v5 _ID];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    v8 = [(SHSignatureBuffer *)self signatureGenerator];
    [v8 duration];
    double v10 = v9;
    id v11 = [(SHSignatureBuffer *)self currentSignature];
    [v11 duration];
    double v13 = v12;
    [(SHSignatureBuffer *)self signatureOffset];
    double v15 = v10 - (v13 + v14);

    v16 = [(SHSignatureBuffer *)self signatureGenerator];
    id v26 = 0;
    char v17 = [v16 updateRingBufferDuration:&v26 error:v15];
    id v18 = v26;

    if (v17)
    {
      v19 = [(SHSignatureBuffer *)self signatureGenerator];
      [(SHSignatureBuffer *)self bufferMaxSize];
      id v25 = v18;
      char v20 = objc_msgSend(v19, "updateRingBufferDuration:error:", &v25);
      id v21 = v25;

      if (v20)
      {
        [(SHSignatureBuffer *)self setCurrentSignature:0];
        [(SHSignatureBuffer *)self setSignatureOffset:0.0];
      }
      else
      {
        v23 = sh_log_object();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          [(SHSignatureBuffer *)self bufferMaxSize];
          *(_DWORD *)buf = 134218242;
          double v28 = v24;
          __int16 v29 = 2112;
          id v30 = v21;
          _os_log_impl(&dword_224B4B000, v23, OS_LOG_TYPE_ERROR, "Failed to update ring buffer duration to %f, resetting %@", buf, 0x16u);
        }

        [(SHSignatureBuffer *)self reset];
      }
      id v18 = v21;
    }
    else
    {
      v22 = sh_log_object();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        double v28 = v15;
        __int16 v29 = 2112;
        id v30 = v18;
        _os_log_impl(&dword_224B4B000, v22, OS_LOG_TYPE_ERROR, "Failed to update ring buffer duration to %f, resetting %@", buf, 0x16u);
      }

      [(SHSignatureBuffer *)self reset];
    }
  }
}

- (void)reset
{
  v3 = [SHSignatureGenerator alloc];
  [(SHSignatureBuffer *)self bufferMaxSize];
  id v4 = -[SHSignatureGenerator initSignatureRingBufferWithDuration:](v3, "initSignatureRingBufferWithDuration:");
  signatureGenerator = self->_signatureGenerator;
  self->_signatureGenerator = v4;

  [(SHSignatureBuffer *)self setCurrentSignature:0];

  [(SHSignatureBuffer *)self setSignatureOffset:0.0];
}

- (double)duration
{
  v2 = [(SHSignatureBuffer *)self signatureGenerator];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (double)currentSignatureDuration
{
  double v3 = [(SHSignatureBuffer *)self signatureGenerator];
  [v3 duration];
  double v5 = v4;
  [(SHSignatureBuffer *)self signatureOffset];
  double v7 = v5 - v6;

  [(SHSignatureBuffer *)self maximumSignatureDuration];
  if (v7 < result) {
    return v7;
  }
  return result;
}

- (void)flow:(id)a3 time:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 format];
  [(SHSignatureBuffer *)self setFormat:v8];

  double v9 = [(SHSignatureBuffer *)self signatureGenerator];
  id v16 = 0;
  char v10 = [v9 appendBuffer:v6 atTime:v7 error:&v16];
  id v11 = v16;

  if ((v10 & 1) == 0)
  {
    double v12 = sh_log_object();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v11;
      _os_log_impl(&dword_224B4B000, v12, OS_LOG_TYPE_ERROR, "Failed to append to signature buffer, resetting %@", buf, 0xCu);
    }

    [(SHSignatureBuffer *)self reset];
    double v13 = [(SHSignatureBuffer *)self signatureGenerator];
    id v15 = v11;
    [v13 appendBuffer:v6 atTime:v7 error:&v15];
    id v14 = v15;

    id v11 = v14;
  }
}

- (id)generateCurrentSignature
{
  double v3 = [(SHSignatureBuffer *)self signatureGenerator];
  double v4 = [v3 signature];

  double v5 = [(SHSignatureBuffer *)self currentSignature];
  if (v5)
  {
    id v6 = [(SHSignatureBuffer *)self currentSignature];
    id v7 = [v6 _ID];
  }
  else
  {
    id v7 = [MEMORY[0x263F08C38] UUID];
  }

  v8 = [SHSignature alloc];
  double v9 = [v4 dataRepresentation];
  char v10 = [v4 time];
  id v45 = 0;
  id v11 = [(SHSignature *)v8 initWithID:v7 dataRepresentation:v9 startTime:v10 error:&v45];
  id v12 = v45;
  [(SHSignatureBuffer *)self setCurrentSignature:v11];

  double v13 = [(SHSignatureBuffer *)self currentSignature];

  if (!v13)
  {
    [(SHSignatureBuffer *)self reset];
    uint64_t v18 = objc_opt_new();
LABEL_13:
    v41 = (void *)v18;
    goto LABEL_14;
  }
  id v14 = [(SHSignatureBuffer *)self currentSignature];
  [v14 duration];
  double v16 = v15;
  [(SHSignatureBuffer *)self maximumSignatureDuration];
  if (v16 <= v17)
  {
    [(SHSignatureBuffer *)self signatureOffset];
    double v20 = v19;

    if (v20 <= 0.0)
    {
LABEL_12:
      uint64_t v18 = [(SHSignatureBuffer *)self currentSignature];
      goto LABEL_13;
    }
  }
  else
  {
  }
  id v21 = [(SHSignatureBuffer *)self currentSignature];
  v22 = [v21 dataRepresentation];
  [(SHSignatureBuffer *)self signatureOffset];
  double v24 = v23;
  [(SHSignatureBuffer *)self maximumSignatureDuration];
  id v44 = v12;
  id v26 = +[SigCrop cropSignature:v22 atPosition:&v44 withDuration:v24 error:v25];
  id v27 = v44;

  if (v26)
  {
    [(SHSignatureBuffer *)self signatureOffset];
    double v29 = v28;
    id v30 = [(SHSignatureBuffer *)self format];
    [v30 sampleRate];
    unsigned int v32 = (v29 * v31);

    id v33 = objc_alloc(MEMORY[0x263EF9430]);
    v34 = [v4 time];
    [v34 sampleRate];
    uint64_t v36 = (uint64_t)(v35 + (double)v32);
    v37 = [(SHSignatureBuffer *)self format];
    [v37 sampleRate];
    v38 = objc_msgSend(v33, "initWithSampleTime:atRate:", v36);

    id v43 = v27;
    v39 = [[SHSignature alloc] initWithID:v7 dataRepresentation:v26 startTime:v38 error:&v43];
    id v12 = v43;

    [(SHSignatureBuffer *)self setCurrentSignature:v39];
    v40 = [(SHSignatureBuffer *)self currentSignature];

    if (v40)
    {

      goto LABEL_12;
    }
    [(SHSignatureBuffer *)self reset];
    v41 = objc_opt_new();
  }
  else
  {
    [(SHSignatureBuffer *)self reset];
    v41 = objc_opt_new();
    id v12 = v27;
  }
LABEL_14:

  return v41;
}

- (BOOL)shouldGenerateSpectralOutput
{
  return self->_shouldGenerateSpectralOutput;
}

- (void)setShouldGenerateSpectralOutput:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldGenerateSpectralOutput = a3;
  double v4 = [(SHSignatureBuffer *)self signatureGenerator];
  id v5 = v4;
  if (v3) {
    [v4 enableSpectralOutput];
  }
  else {
    [v4 disableSpectralOutput];
  }
}

- (double)signatureOffset
{
  return self->_signatureOffset;
}

- (void)setSignatureOffset:(double)a3
{
  self->_signatureOffset = a3;
}

- (double)minimumSignatureDuration
{
  return self->_minimumSignatureDuration;
}

- (void)setMinimumSignatureDuration:(double)a3
{
  self->_minimumSignatureDuration = a3;
}

- (double)maximumSignatureDuration
{
  return self->_maximumSignatureDuration;
}

- (void)setMaximumSignatureDuration:(double)a3
{
  self->_maximumSignatureDuration = a3;
}

- (double)bufferMaxSize
{
  return self->_bufferMaxSize;
}

- (void)setBufferMaxSize:(double)a3
{
  self->_bufferMaxSize = a3;
}

- (SHSignatureGenerator)signatureGenerator
{
  return self->_signatureGenerator;
}

- (void)setSignatureGenerator:(id)a3
{
}

- (SHSignature)currentSignature
{
  return self->_currentSignature;
}

- (void)setCurrentSignature:(id)a3
{
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_currentSignature, 0);

  objc_storeStrong((id *)&self->_signatureGenerator, 0);
}

@end