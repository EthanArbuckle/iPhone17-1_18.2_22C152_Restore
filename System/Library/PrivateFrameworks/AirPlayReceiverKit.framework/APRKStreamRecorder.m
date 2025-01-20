@interface APRKStreamRecorder
- (BOOL)finalizeRecording;
- (int)_recordSampleBuffer:(opaqueCMSampleBuffer *)a3 toTrackWithID:(int)a4;
- (int)recordAudioSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (int)recordVideoSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (int)startRecordingAtURL:(id)a3;
@end

@implementation APRKStreamRecorder

- (int)startRecordingAtURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x263F01090];
  long long v6 = *MEMORY[0x263F01090];
  self->_audioTrackID = 0;
  p_audioTrackID = &self->_audioTrackID;
  *(_OWORD *)(p_audioTrackID - 6) = v6;
  *((void *)p_audioTrackID - 1) = *(void *)(v5 + 16);
  p_audioTrackID[1] = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F12388], (const void *)*MEMORY[0x263EFFB40]);
  CFRunLoopGetCurrent();
  v9 = p_audioTrackID - 8;
  int v10 = FigAssetWriterCreateWithURL();
  if (v10)
  {
    int v19 = v10;
  }
  else
  {
    uint64_t v11 = *(void *)v9;
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    v14 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v13 + 8);
    if (v14)
    {
      int v15 = v14(v11, 1936684398, p_audioTrackID);
      if (v15)
      {
        int v19 = v15;
      }
      else
      {
        uint64_t v16 = *(void *)v9;
        uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v17) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = 0;
        }
        v20 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v18 + 8);
        if (v20)
        {
          int v19 = v20(v16, 1986618469, p_audioTrackID + 1);
          if (!v19) {
            goto LABEL_19;
          }
        }
        else
        {
          int v19 = -12782;
        }
      }
    }
    else
    {
      int v19 = -12782;
    }
  }
  APSLogErrorAt();
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_19:
  if (Mutable) {
    CFRelease(Mutable);
  }

  return v19;
}

- (BOOL)finalizeRecording
{
  uint64_t videoTrackID = self->_videoTrackID;
  if (videoTrackID)
  {
    assetWriter = self->_assetWriter;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    v8 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t))(v6 + 104);
    if (v8) {
      BOOL v7 = v8(assetWriter, videoTrackID) != 0;
    }
    else {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  v9 = self->_assetWriter;
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(unsigned int (**)(OpaqueFigAssetWriter *))(v11 + 120);
  if (v12)
  {
    if (v12(v9)) {
      int v13 = 1;
    }
    else {
      int v13 = v7;
    }
  }
  else
  {
    int v13 = 1;
  }
  v14 = self->_assetWriter;
  if (v14)
  {
    CFRelease(v14);
    self->_assetWriter = 0;
  }
  *(void *)&self->_audioTrackID = 0;
  return v13 == 0;
}

- (int)recordVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return [(APRKStreamRecorder *)self _recordSampleBuffer:a3 toTrackWithID:self->_videoTrackID];
}

- (int)recordAudioSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return [(APRKStreamRecorder *)self _recordSampleBuffer:a3 toTrackWithID:self->_audioTrackID];
}

- (int)_recordSampleBuffer:(opaqueCMSampleBuffer *)a3 toTrackWithID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3) {
    CFRetain(a3);
  }
  if ((self->_recordingStartTime.flags & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp(&v20, a3);
    *(_OWORD *)&self->_recordingStartTime.value = *(_OWORD *)&v20.value;
    CMTimeEpoch epoch = v20.epoch;
    self->_recordingStartTime.CMTimeEpoch epoch = v20.epoch;
    assetWriter = self->_assetWriter;
    *(_OWORD *)&v19.value = *(_OWORD *)&self->_recordingStartTime.value;
    v19.CMTimeEpoch epoch = epoch;
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(uint64_t (**)(OpaqueFigAssetWriter *, CMTime *))(v10 + 72);
    if (v11)
    {
      CMTime v20 = v19;
      int v12 = v11(assetWriter, &v20);
      if (!v12) {
        goto LABEL_9;
      }
      int v16 = v12;
    }
    else
    {
      int v16 = -12782;
    }
    APSLogErrorAt();
    goto LABEL_18;
  }
LABEL_9:
  int v13 = self->_assetWriter;
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v17 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, opaqueCMSampleBuffer *))(v15 + 80);
  if (v17)
  {
    int v16 = v17(v13, v4, a3);
    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
    int v16 = -12782;
  }
LABEL_18:
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_22:
  if (a3) {
    CFRelease(a3);
  }
  return v16;
}

@end