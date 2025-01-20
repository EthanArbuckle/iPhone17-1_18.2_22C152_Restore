@interface CSAudioDecoder
- (CSAudioDecoder)initWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4;
- (CSAudioDecoderDelegate)delegate;
- (void)addPackets:(id)a3 audioStreamHandleId:(unint64_t)a4 remoteVAD:(id)a5 timestamp:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7 wasBuffered:(BOOL)a8 receivedNumChannels:(unsigned int)a9;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation CSAudioDecoder

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (CSAudioDecoderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAudioDecoderDelegate *)WeakRetained;
}

- (void)addPackets:(id)a3 audioStreamHandleId:(unint64_t)a4 remoteVAD:(id)a5 timestamp:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7 wasBuffered:(BOOL)a8 receivedNumChannels:(unsigned int)a9
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v30 = a5;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v12)
  {
    uint64_t v32 = *(void *)v40;
    location = (id *)&self->_delegate;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        UInt32 mFramesPerPacket = self->_inASBD.mFramesPerPacket;
        v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:2 * mFramesPerPacket];
        memset(&outOutputData.mNumberBuffers + 1, 0, 20);
        outOutputData.mNumberBuffers = 1;
        id v17 = v16;
        outOutputData.mBuffers[0].mData = (void *)[v17 mutableBytes];
        UInt32 v18 = [v17 length];
        outOutputData.mBuffers[0].mNumberChannels = 1;
        outOutputData.mBuffers[0].mDataByteSize = v18;
        UInt32 ioOutputDataPacketSize = mFramesPerPacket;
        v35[0] = 0;
        v35[1] = v35;
        v35[2] = 0x2020000000;
        int v36 = 0;
        v34[0] = 0;
        v34[1] = v34;
        v34[2] = 0x2020000000;
        v34[3] = 1;
        decoder = self->_decoder;
        inInputDataProcUserData[0] = MEMORY[0x1E4F143A8];
        inInputDataProcUserData[1] = 3221225472;
        inInputDataProcUserData[2] = __133__CSAudioDecoder_addPackets_audioStreamHandleId_remoteVAD_timestamp_arrivalTimestampToAudioRecorder_wasBuffered_receivedNumChannels___block_invoke;
        inInputDataProcUserData[3] = &unk_1E61FFBF8;
        inInputDataProcUserData[4] = v14;
        inInputDataProcUserData[5] = v34;
        inInputDataProcUserData[6] = v35;
        inInputDataProcUserData[7] = &v43;
        OSStatus v20 = AudioConverterFillComplexBuffer(decoder, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke_6668, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
        if ((v20 == 1836086393 || !v20) && ioOutputDataPacketSize && outOutputData.mNumberBuffers)
        {
          if (2 * (unint64_t)ioOutputDataPacketSize > outOutputData.mBuffers[0].mDataByteSize)
          {
            _Block_object_dispose(v34, 8);
            _Block_object_dispose(v35, 8);

            goto LABEL_19;
          }
          v21 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", outOutputData.mBuffers[0].mData);
          if (+[CSConfig inputRecordingIsFloat])
          {
            v22 = +[CSFLPCMTypeConverter convertToFloatLPCMBufFromShortLPCMBuf:v21];
            id WeakRetained = objc_loadWeakRetained(location);
            HIDWORD(v24) = a9;
            LOBYTE(v24) = a8;
            objc_msgSend(WeakRetained, "audioDecoderDidDecodePackets:audioStreamHandleId:buffer:remoteVAD:timestamp:arrivalTimestampToAudioRecorder:wasBuffered:receivedNumChannels:", self, a4, v22, v30, a6, a7, v24);
          }
          else
          {
            v22 = objc_loadWeakRetained(location);
            HIDWORD(v24) = a9;
            LOBYTE(v24) = a8;
            objc_msgSend(v22, "audioDecoderDidDecodePackets:audioStreamHandleId:buffer:remoteVAD:timestamp:arrivalTimestampToAudioRecorder:wasBuffered:receivedNumChannels:", self, a4, v21, v30, a6, a7, v24);
          }
        }
        _Block_object_dispose(v34, 8);
        _Block_object_dispose(v35, 8);
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_19:
}

uint64_t __133__CSAudioDecoder_addPackets_audioStreamHandleId_remoteVAD_timestamp_arrivalTimestampToAudioRecorder_wasBuffered_receivedNumChannels___block_invoke(uint64_t a1, _DWORD *a2, uint64_t a3, void *a4)
{
  unint64_t v7 = *a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= v7)
  {
    if (v7 == 1)
    {
      int v10 = [*(id *)(a1 + 32) length];
      id v11 = *(id *)(a1 + 32);
      *(void *)(a3 + 16) = [v11 bytes];
      *(_DWORD *)(a3 + 12) = v10;
      if (a4)
      {
        uint64_t v12 = *(void *)(a1 + 56);
        *(void *)uint64_t v12 = 0;
        *(_DWORD *)(v12 + 8) = 0;
        *(_DWORD *)(v12 + 12) = v10;
        *a4 = v12;
      }
      --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

      return 0;
    }
    else
    {
      return 1752524863;
    }
  }
  else
  {
    uint64_t result = 1836086393;
    *a2 = 0;
    *(void *)(a3 + 16) = 0;
    *(_DWORD *)(a3 + 12) = 0;
    if (a4)
    {
      v9 = *(void **)(a1 + 56);
      void *v9 = 0;
      v9[1] = 0;
      *a4 = v9;
    }
  }
  return result;
}

- (void)dealloc
{
  decoder = self->_decoder;
  if (decoder)
  {
    AudioConverterDispose(decoder);
    self->_decoder = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAudioDecoder;
  [(CSAudioDecoder *)&v4 dealloc];
}

- (CSAudioDecoder)initWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)CSAudioDecoder;
  v6 = [(CSAudioDecoder *)&v14 init];
  unint64_t v7 = v6;
  if (v6)
  {
    AudioConverterNew(a3, a4, &v6->_decoder);
    if (!v7->_decoder)
    {
      uint64_t v12 = 0;
      goto LABEL_6;
    }
    long long v8 = *(_OWORD *)&a3->mSampleRate;
    long long v9 = *(_OWORD *)&a3->mBytesPerPacket;
    *(void *)&v7->_inASBD.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
    *(_OWORD *)&v7->_inASBD.mSampleRate = v8;
    *(_OWORD *)&v7->_inASBD.mBytesPerPacket = v9;
    long long v10 = *(_OWORD *)&a4->mSampleRate;
    long long v11 = *(_OWORD *)&a4->mBytesPerPacket;
    *(void *)&v7->_outASBD.mBitsPerChannel = *(void *)&a4->mBitsPerChannel;
    *(_OWORD *)&v7->_outASBD.mBytesPerPacket = v11;
    *(_OWORD *)&v7->_outASBD.mSampleRate = v10;
  }
  uint64_t v12 = v7;
LABEL_6:

  return v12;
}

@end