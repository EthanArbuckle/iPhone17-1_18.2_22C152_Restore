@interface SHSignatureGenerator
+ (void)generateSignatureFromAsset:(AVAsset *)asset completionHandler:(void *)completionHandler;
- (BOOL)appendBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)time error:(NSError *)error;
- (BOOL)updateRingBufferDuration:(double)a3 error:(id *)a4;
- (SHMutableSignature)mutableSignature;
- (SHSignature)signature;
- (SHSignatureGenerator)init;
- (SHSignatureGenerator)initWithMaximumSignatureDuration:(double)a3;
- (SHSignatureGenerator)initWithMutableSignature:(id)a3;
- (double)duration;
- (double)maximumDuration;
- (id)initSignatureRingBufferWithDuration:(double)a3;
- (void)disableSpectralOutput;
- (void)enableSpectralOutput;
- (void)setMutableSignature:(id)a3;
@end

@implementation SHSignatureGenerator

- (SHSignatureGenerator)initWithMaximumSignatureDuration:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SHSignatureGenerator;
  v4 = [(SHSignatureGenerator *)&v8 init];
  if (v4)
  {
    v5 = [[SHMutableSignature alloc] initWithMaximumSeconds:0 clipStyle:a3];
    mutableSignature = v4->_mutableSignature;
    v4->_mutableSignature = v5;
  }
  return v4;
}

- (id)initSignatureRingBufferWithDuration:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SHSignatureGenerator;
  v4 = [(SHSignatureGenerator *)&v8 init];
  if (v4)
  {
    v5 = [[SHMutableSignature alloc] initWithMaximumSeconds:1 clipStyle:a3];
    mutableSignature = v4->_mutableSignature;
    v4->_mutableSignature = v5;
  }
  return v4;
}

- (SHSignatureGenerator)init
{
  v3 = objc_alloc_init(SHMutableSignature);
  v4 = [(SHSignatureGenerator *)self initWithMutableSignature:v3];

  return v4;
}

- (SHSignatureGenerator)initWithMutableSignature:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSignatureGenerator;
  v6 = [(SHSignatureGenerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mutableSignature, a3);
  }

  return v7;
}

- (BOOL)appendBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)time error:(NSError *)error
{
  objc_super v8 = time;
  objc_super v9 = buffer;
  v10 = [(SHSignatureGenerator *)self mutableSignature];
  char v11 = [v10 appendBuffer:v9 atTime:v8 error:error];

  +[SHError remapErrorToClientErrorPointer:error];
  return v11;
}

- (SHSignature)signature
{
  v2 = [(SHSignatureGenerator *)self mutableSignature];
  v3 = (void *)[v2 copy];

  return (SHSignature *)v3;
}

- (double)duration
{
  v2 = [(SHSignatureGenerator *)self mutableSignature];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (double)maximumDuration
{
  v2 = [(SHSignatureGenerator *)self mutableSignature];
  [v2 maximumSeconds];
  double v4 = v3;

  return v4;
}

- (BOOL)updateRingBufferDuration:(double)a3 error:(id *)a4
{
  v6 = [(SHSignatureGenerator *)self mutableSignature];
  LOBYTE(a4) = [v6 updateRingBufferDuration:a4 error:a3];

  return (char)a4;
}

- (void)enableSpectralOutput
{
  id v3 = [(SHSignatureGenerator *)self mutableSignature];
  v2 = [[SHSpectralOutputConfiguration alloc] initWithNumberOfBins:8 callbackFrequency:8];
  [v3 setSpectralOutputConfiguration:v2];
}

- (void)disableSpectralOutput
{
  id v2 = [(SHSignatureGenerator *)self mutableSignature];
  [v2 disableSpectralOutput];
}

+ (void)generateSignatureFromAsset:(AVAsset *)asset completionHandler:(void *)completionHandler
{
  id v5 = completionHandler;
  if (v5)
  {
    v6 = asset;
    v7 = objc_alloc_init(SHMutableSignature);
    objc_super v8 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initStandardFormatWithSampleRate:1 channels:16000.0];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __69__SHSignatureGenerator_generateSignatureFromAsset_completionHandler___block_invoke;
    v13[3] = &unk_2646EF710;
    v14 = v7;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __69__SHSignatureGenerator_generateSignatureFromAsset_completionHandler___block_invoke_2;
    v10[3] = &unk_2646EF738;
    char v11 = v14;
    id v12 = v5;
    objc_super v9 = v14;
    +[SHAssetUtilities mixedTracksFromAsset:v6 format:v8 accumulator:v13 completionHandler:v10];
  }
}

id __69__SHSignatureGenerator_generateSignatureFromAsset_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v8 = 0;
  char v3 = [v2 appendBuffer:a2 atTime:0 error:&v8];
  id v4 = v8;
  id v5 = v4;
  id v6 = 0;
  if ((v3 & 1) == 0) {
    id v6 = v4;
  }

  return v6;
}

void __69__SHSignatureGenerator_generateSignatureFromAsset_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    char v3 = *(void (**)(uint64_t, void, uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, 0, a2);
  }
  else
  {
    id v5 = (id)[*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
}

- (SHMutableSignature)mutableSignature
{
  return self->_mutableSignature;
}

- (void)setMutableSignature:(id)a3
{
}

- (void).cxx_destruct
{
}

@end