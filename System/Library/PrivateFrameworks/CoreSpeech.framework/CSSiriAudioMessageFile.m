@interface CSSiriAudioMessageFile
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSiriAudioMessageFile)initWithRequestUUID:(id)a3;
- (NSString)requestUUID;
- (NSURL)recordedAudioFileURL;
- (void)_removeRecordedAudio;
- (void)appendAudioChunk:(id)a3;
- (void)dealloc;
- (void)endAudio;
- (void)prepareFile;
- (void)setAudioFileWriter:(id)a3;
- (void)setRecordedAudioFileURL:(id)a3;
- (void)setRequestUUID:(id)a3;
@end

@implementation CSSiriAudioMessageFile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_recordedAudioFileURL, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setRecordedAudioFileURL:(id)a3
{
}

- (NSURL)recordedAudioFileURL
{
  return self->_recordedAudioFileURL;
}

- (void)setRequestUUID:(id)a3
{
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (void)_removeRecordedAudio
{
  if (self->_recordedAudioFileURL
    && (!CSIsInternalBuild() || (_AFPreferencesKeepRecorededAudioFiles() & 1) == 0))
  {
    [(CSPlainAudioFileWriter *)self->_audioFileWriter endAudio];
    v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      recordedAudioFileURL = self->_recordedAudioFileURL;
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSSiriAudioMessageFile _removeRecordedAudio]";
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2112;
      v20 = recordedAudioFileURL;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s %p Removing recorded audio at %@...", buf, 0x20u);
    }
    v5 = +[NSFileManager defaultManager];
    v6 = self->_recordedAudioFileURL;
    id v14 = 0;
    unsigned int v7 = [v5 removeItemAtURL:v6 error:&v14];
    id v8 = v14;

    v9 = CSLogContextFacilityCoreSpeech;
    if (!v7 || v8)
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v11 = self->_recordedAudioFileURL;
        v12 = v9;
        v13 = [v8 localizedDescription];
        *(_DWORD *)buf = 136315906;
        v16 = "-[CSSiriAudioMessageFile _removeRecordedAudio]";
        __int16 v17 = 2048;
        v18 = self;
        __int16 v19 = 2112;
        v20 = v11;
        __int16 v21 = 2112;
        v22 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s %p Failed to remove recorded audio at %@ (error = %@).", buf, 0x2Au);
      }
    }
    else if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_recordedAudioFileURL;
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSSiriAudioMessageFile _removeRecordedAudio]";
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s %p Removed recorded audio at %@.", buf, 0x20u);
    }
  }
}

- (void)dealloc
{
  [(CSSiriAudioMessageFile *)self _removeRecordedAudio];
  v3.receiver = self;
  v3.super_class = (Class)CSSiriAudioMessageFile;
  [(CSSiriAudioMessageFile *)&v3 dealloc];
}

- (void)endAudio
{
  [(CSPlainAudioFileWriter *)self->_audioFileWriter endAudio];
  audioFileWriter = self->_audioFileWriter;
  self->_audioFileWriter = 0;
}

- (void)appendAudioChunk:(id)a3
{
  audioFileWriter = self->_audioFileWriter;
  id v4 = a3;
  id v7 = [v4 data];
  id v5 = [v7 bytes];
  id v6 = [v4 numSamples];

  [(CSPlainAudioFileWriter *)audioFileWriter addSamples:v5 numSamples:v6];
}

- (void)prepareFile
{
  objc_super v3 = AFUserSupportDirectoryPath();
  id v4 = [v3 stringByAppendingPathComponent:@"RecordedAudio"];

  id v5 = +[NSFileManager defaultManager];
  [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];

  id v6 = objc_alloc((Class)NSString);
  CFStringRef requestUUID = (const __CFString *)self->_requestUUID;
  if (!requestUUID) {
    CFStringRef requestUUID = @"Unknown";
  }
  id v8 = [v6 initWithFormat:@"%@.wav", requestUUID];
  v9 = [v4 stringByAppendingPathComponent:v8];
  v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[CSSiriAudioMessageFile prepareFile]";
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Creating recorded audio file in %@", buf, 0x16u);
  }
  v11 = +[NSURL fileURLWithPath:v9];
  recordedAudioFileURL = self->_recordedAudioFileURL;
  self->_recordedAudioFileURL = v11;

  id v13 = objc_alloc((Class)CSPlainAudioFileWriter);
  id v14 = self->_recordedAudioFileURL;
  +[CSFAudioStreamBasicDescriptionFactory lpcmMonoInterleavedASBD];
  +[CSFAudioStreamBasicDescriptionFactory lpcmMonoInterleavedASBD];
  v15 = (CSPlainAudioFileWriter *)[v13 initWithURL:v14 inputFormat:v18 outputFormat:v17];
  audioFileWriter = self->_audioFileWriter;
  self->_audioFileWriter = v15;
}

- (CSSiriAudioMessageFile)initWithRequestUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSSiriAudioMessageFile;
  id v6 = [(CSSiriAudioMessageFile *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requestUUID, a3);
  }

  return v7;
}

@end