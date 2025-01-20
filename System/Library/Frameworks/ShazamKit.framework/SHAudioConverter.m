@interface SHAudioConverter
- (AVAudioConverter)converter;
- (SHAudioConverter)audioConverterWithInputFormat:(id)a3 outputFormat:(id)a4;
- (id)supportedPCMBufferFromBuffer:(id)a3 error:(id *)a4;
- (void)setConverter:(id)a3;
@end

@implementation SHAudioConverter

- (id)supportedPCMBufferFromBuffer:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = [v7 format];
  unsigned int v9 = [v8 channelCount];

  if (v9 >= 2) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = v9;
  }
  v11 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithCommonFormat:1 sampleRate:v10 channels:1 interleaved:48000.0];
  if ([v7 frameLength])
  {
    double v12 = (double)[v7 frameLength];
    v13 = [v7 format];
    [v13 sampleRate];
    LODWORD(v4) = vcvtad_u64_f64(48000.0 / v14 * v12);

    v15 = (void *)[objc_alloc(MEMORY[0x263EF93B0]) initWithPCMFormat:v11 frameCapacity:v4];
    v16 = [v7 format];
    v17 = [(SHAudioConverter *)self audioConverterWithInputFormat:v16 outputFormat:v11];

    v18 = NSString;
    v19 = [v7 format];
    v20 = [v18 stringWithFormat:@"Failed to convert input buffer with format %@ to standard format %@", objc_msgSend(v19, "formatDescription"), objc_msgSend(v11, "formatDescription")];

    if (v15) {
      BOOL v21 = v17 == 0;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21)
    {
      uint64_t v33 = *MEMORY[0x263F08320];
      v34[0] = v20;
      v22 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
      +[SHError annotateClientError:a4 code:100 underlyingError:0 keyOverrides:v22];
      id v23 = 0;
    }
    else
    {
      id v30 = 0;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __55__SHAudioConverter_supportedPCMBufferFromBuffer_error___block_invoke;
      v28[3] = &unk_2646EFA80;
      id v29 = v7;
      uint64_t v24 = [v17 convertToBuffer:v15 error:&v30 withInputFromBlock:v28];
      id v25 = v30;
      v22 = v25;
      if (v24 == 3)
      {
        uint64_t v31 = *MEMORY[0x263F08320];
        v32 = v20;
        v26 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        +[SHError annotateClientError:a4 code:100 underlyingError:v22 keyOverrides:v26];

        id v23 = 0;
      }
      else
      {
        id v23 = v15;
      }
    }
  }
  else
  {
    id v23 = (id)[objc_alloc(MEMORY[0x263EF93B0]) initWithPCMFormat:v11 frameCapacity:0];
  }

  return v23;
}

id __55__SHAudioConverter_supportedPCMBufferFromBuffer_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 0;
  return *(id *)(a1 + 32);
}

- (SHAudioConverter)audioConverterWithInputFormat:(id)a3 outputFormat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SHAudioConverter *)self converter];
  unsigned int v9 = [v8 inputFormat];
  if (([v6 isEqual:v9] & 1) == 0)
  {

    goto LABEL_5;
  }
  uint64_t v10 = [(SHAudioConverter *)self converter];
  v11 = [v10 outputFormat];
  char v12 = [v7 isEqual:v11];

  if ((v12 & 1) == 0)
  {
LABEL_5:
    v13 = (void *)[objc_alloc(MEMORY[0x263EF9340]) initFromFormat:v6 toFormat:v7];
    [(SHAudioConverter *)self setConverter:v13];
  }
  double v14 = [(SHAudioConverter *)self converter];

  return (SHAudioConverter *)v14;
}

- (AVAudioConverter)converter
{
  return self->_converter;
}

- (void)setConverter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end