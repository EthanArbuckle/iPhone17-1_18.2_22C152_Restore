@interface _PHAssetCreationRequestValidator
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)validatedImageDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)validatedVideoDuration;
- (BOOL)getLivePhotoVideoMetadataFromURL:(id)a3 videoComplementMetadata:(id)a4 pairingIdentifier:(id *)a5 videoDuration:(id *)a6 imageDisplayTime:(id *)a7 error:(id *)a8;
- (NSString)validatedPairingIdentifier;
- (PHAssetCreationRequest)assetCreationRequest;
- (_PHAssetCreationRequestValidator)initWithAssetCreationRequest:(id)a3;
@end

@implementation _PHAssetCreationRequestValidator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validatedPairingIdentifier, 0);

  objc_destroyWeak((id *)&self->_assetCreationRequest);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)validatedImageDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)validatedVideoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (NSString)validatedPairingIdentifier
{
  return self->_validatedPairingIdentifier;
}

- (PHAssetCreationRequest)assetCreationRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetCreationRequest);

  return (PHAssetCreationRequest *)WeakRetained;
}

- (BOOL)getLivePhotoVideoMetadataFromURL:(id)a3 videoComplementMetadata:(id)a4 pairingIdentifier:(id *)a5 videoDuration:(id *)a6 imageDisplayTime:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  v16 = [(_PHAssetCreationRequestValidator *)self assetCreationRequest];
  uint64_t v17 = [v16 pairingIdentifier];
  v18 = (void *)v17;
  long long v40 = 0uLL;
  int64_t v41 = 0;
  if (v16)
  {
    [v16 videoDuration];
    long long v38 = 0uLL;
    int64_t v39 = 0;
    [v16 imageDisplayTime];
    if (!v18) {
      goto LABEL_7;
    }
  }
  else
  {
    long long v38 = 0uLL;
    int64_t v39 = 0;
    if (!v17) {
      goto LABEL_7;
    }
  }
  if (BYTE12(v38) & 1) != 0 && (BYTE12(v40))
  {
    id v24 = 0;
    BOOL v30 = 1;
    goto LABEL_15;
  }
LABEL_7:
  v28 = a5;
  v29 = a6;
  v19 = a7;
  v20 = a8;
  long long v36 = *MEMORY[0x1E4F1F9F8];
  int64_t v37 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v34 = v36;
  int64_t v35 = v37;
  id v32 = 0;
  id v33 = 0;
  v31.receiver = self;
  v31.super_class = (Class)_PHAssetCreationRequestValidator;
  id v21 = v14;
  id v22 = v15;
  BOOL v30 = [(PHValidator *)&v31 getLivePhotoVideoMetadataFromURL:v14 videoComplementMetadata:v15 pairingIdentifier:&v33 videoDuration:&v36 imageDisplayTime:&v34 error:&v32];
  id v23 = v33;
  id v24 = v32;
  if (v18) {
    v25 = v18;
  }
  else {
    v25 = v23;
  }
  id v26 = v25;

  if ((BYTE12(v38) & 1) == 0)
  {
    long long v38 = v34;
    int64_t v39 = v35;
  }
  if ((BYTE12(v40) & 1) == 0)
  {
    long long v40 = v36;
    int64_t v41 = v37;
  }

  v18 = v26;
  id v14 = v21;
  a8 = v20;
  id v15 = v22;
  a7 = v19;
  a5 = v28;
  a6 = v29;
LABEL_15:
  objc_storeStrong((id *)&self->_validatedPairingIdentifier, v18);
  *(_OWORD *)&self->_validatedVideoDuration.value = v40;
  self->_validatedVideoDuration.epoch = v41;
  *(_OWORD *)&self->_validatedImageDisplayTime.value = v38;
  self->_validatedImageDisplayTime.epoch = v39;
  if (a5) {
    *a5 = v18;
  }
  if (a6)
  {
    *(_OWORD *)&a6->var0 = v40;
    a6->var3 = v41;
  }
  if (a7)
  {
    *(_OWORD *)&a7->var0 = v38;
    a7->var3 = v39;
  }
  if (a8) {
    *a8 = v24;
  }

  return v30;
}

- (_PHAssetCreationRequestValidator)initWithAssetCreationRequest:(id)a3
{
  id v4 = a3;
  v5 = [(_PHAssetCreationRequestValidator *)self init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_assetCreationRequest, v4);
  }

  return v6;
}

@end