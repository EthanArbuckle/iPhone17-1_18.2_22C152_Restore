@interface VCPMetaTrackDecoder
- (VCPMetaTrackDecoder)initWithTrack:(id)a3;
- (id)copyNextMetadataGroup;
- (int64_t)status;
- (void)dealloc;
@end

@implementation VCPMetaTrackDecoder

- (VCPMetaTrackDecoder)initWithTrack:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VCPMetaTrackDecoder;
  v5 = [(VCPMetaTrackDecoder *)&v17 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F16378]);
      v7 = [v4 asset];
      uint64_t v8 = [v6 initWithAsset:v7 error:0];
      reader = v5->_reader;
      v5->_reader = (AVAssetReader *)v8;

      v10 = v5->_reader;
      if (!v10) {
        goto LABEL_12;
      }
      uint64_t v11 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v4 outputSettings:0];
      readerOutput = v5->_readerOutput;
      v5->_readerOutput = (AVAssetReaderTrackOutput *)v11;

      if (v5->_readerOutput)
      {
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F16390], "assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:");
        readerOutputAdaptor = v5->_readerOutputAdaptor;
        v5->_readerOutputAdaptor = (AVAssetReaderOutputMetadataAdaptor *)v13;

        v10 = v5->_readerOutputAdaptor;
        if (v10)
        {
          if ([(AVAssetReader *)v5->_reader canAddOutput:v5->_readerOutput])
          {
            [(AVAssetReader *)v5->_reader addOutput:v5->_readerOutput];
            if ([(AVAssetReader *)v5->_reader startReading]) {
              v10 = v5;
            }
            else {
              v10 = 0;
            }
            goto LABEL_12;
          }
          goto LABEL_11;
        }
LABEL_12:
        v15 = v10;
        goto LABEL_13;
      }
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (void)dealloc
{
  reader = self->_reader;
  if (reader) {
    [(AVAssetReader *)reader cancelReading];
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPMetaTrackDecoder;
  [(VCPMetaTrackDecoder *)&v4 dealloc];
}

- (int64_t)status
{
  return [(AVAssetReader *)self->_reader status];
}

- (id)copyNextMetadataGroup
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerOutputAdaptor, 0);
  objc_storeStrong((id *)&self->_readerOutput, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end