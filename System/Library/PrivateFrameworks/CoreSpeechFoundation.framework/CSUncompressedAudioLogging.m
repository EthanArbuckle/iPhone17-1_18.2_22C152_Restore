@interface CSUncompressedAudioLogging
+ (int)loggingFileProtectionClass;
- (BOOL)_moveAudioLoggingToCollectionDirectory:(id *)a3;
- (BOOL)_prepareFileForLogging:(id *)a3;
- (BOOL)_setupFilePath:(id *)a3;
- (BOOL)_writePlistFile:(id *)a3;
- (BOOL)isCancelled;
- (BOOL)isRPISamplingEnabled;
- (BOOL)isSamplingForDictation;
- (BOOL)rpiEnabled;
- (CSUncompressedAudioLogging)initWithDictationInteractionId:(id)a3 asrId:(id)a4 languageCode:(id)a5 task:(id)a6;
- (CSUncompressedAudioLogging)initWithDictationInteractionId:(id)a3 languageCode:(id)a4 task:(id)a5;
- (CSUncompressedAudioLogging)initWithRequestId:(id)a3 asrId:(id)a4 dictationInteractionId:(id)a5 languageCode:(id)a6 task:(id)a7 isSamplingForDictation:(BOOL)a8;
- (CSUncompressedAudioLogging)initWithRequestId:(id)a3 asrId:(id)a4 dictationInteractionId:(id)a5 languageCode:(id)a6 task:(id)a7 isSamplingForDictation:(BOOL)a8 rpiEnabled:(BOOL)a9;
- (CSUncompressedAudioLogging)initWithRequestId:(id)a3 asrId:(id)a4 languageCode:(id)a5 task:(id)a6;
- (CSUncompressedAudioLogging)initWithRequestId:(id)a3 asrId:(id)a4 languageCode:(id)a5 task:(id)a6 rpiEnabled:(BOOL)a7;
- (CSUncompressedAudioLogging)initWithRequestId:(id)a3 languageCode:(id)a4 task:(id)a5;
- (NSDate)loggingDate;
- (NSFileHandle)audioFileHandle;
- (NSString)asrId;
- (NSString)audioFilePath;
- (NSString)audioId;
- (NSString)dictationInteractionId;
- (NSString)languageCode;
- (NSString)plistFilePath;
- (NSString)requestId;
- (NSString)rpiAudioFilePath;
- (NSString)rpiPlistFilePath;
- (NSString)rpiSamplingDirectory;
- (NSString)samplingDate;
- (NSString)samplingDirectory;
- (NSString)samplingTimestamp;
- (NSString)samplingTimestampDetail;
- (NSString)task;
- (NSString)tmpAudioFilePath;
- (NSString)tmpDirectory;
- (OS_dispatch_queue)queue;
- (id)getLoggingDate;
- (id)samplingString;
- (int)_createFileDescriptor:(id)a3 protectionClass:(int)a4;
- (void)_removeTmpAudioFile;
- (void)appendAudioData:(id)a3;
- (void)cancelAudioLogging;
- (void)endAudioWithCancellation:(BOOL)a3 completion:(id)a4;
- (void)prepareLogging:(id)a3;
- (void)setAsrId:(id)a3;
- (void)setAudioFileHandle:(id)a3;
- (void)setAudioFilePath:(id)a3;
- (void)setAudioId:(id)a3;
- (void)setDictationInteractionId:(id)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setIsSamplingForDictation:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLoggingDate:(id)a3;
- (void)setPlistFilePath:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRpiAudioFilePath:(id)a3;
- (void)setRpiEnabled:(BOOL)a3;
- (void)setRpiPlistFilePath:(id)a3;
- (void)setRpiSamplingDirectory:(id)a3;
- (void)setSamplingDate:(id)a3;
- (void)setSamplingDirectory:(id)a3;
- (void)setSamplingTimestamp:(id)a3;
- (void)setSamplingTimestampDetail:(id)a3;
- (void)setTask:(id)a3;
- (void)setTmpAudioFilePath:(id)a3;
- (void)setTmpDirectory:(id)a3;
@end

@implementation CSUncompressedAudioLogging

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingDate, 0);
  objc_storeStrong((id *)&self->_tmpAudioFilePath, 0);
  objc_storeStrong((id *)&self->_tmpDirectory, 0);
  objc_storeStrong((id *)&self->_audioFileHandle, 0);
  objc_storeStrong((id *)&self->_rpiPlistFilePath, 0);
  objc_storeStrong((id *)&self->_plistFilePath, 0);
  objc_storeStrong((id *)&self->_rpiAudioFilePath, 0);
  objc_storeStrong((id *)&self->_audioFilePath, 0);
  objc_storeStrong((id *)&self->_rpiSamplingDirectory, 0);
  objc_storeStrong((id *)&self->_samplingDirectory, 0);
  objc_storeStrong((id *)&self->_samplingTimestampDetail, 0);
  objc_storeStrong((id *)&self->_samplingTimestamp, 0);
  objc_storeStrong((id *)&self->_samplingDate, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
  objc_storeStrong((id *)&self->_dictationInteractionId, 0);
  objc_storeStrong((id *)&self->_audioId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setLoggingDate:(id)a3
{
}

- (NSDate)loggingDate
{
  return self->_loggingDate;
}

- (void)setRpiEnabled:(BOOL)a3
{
  self->_rpiEnabled = a3;
}

- (BOOL)rpiEnabled
{
  return self->_rpiEnabled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setTmpAudioFilePath:(id)a3
{
}

- (NSString)tmpAudioFilePath
{
  return self->_tmpAudioFilePath;
}

- (void)setTmpDirectory:(id)a3
{
}

- (NSString)tmpDirectory
{
  return self->_tmpDirectory;
}

- (void)setAudioFileHandle:(id)a3
{
}

- (NSFileHandle)audioFileHandle
{
  return self->_audioFileHandle;
}

- (void)setRpiPlistFilePath:(id)a3
{
}

- (NSString)rpiPlistFilePath
{
  return self->_rpiPlistFilePath;
}

- (void)setPlistFilePath:(id)a3
{
}

- (NSString)plistFilePath
{
  return self->_plistFilePath;
}

- (void)setRpiAudioFilePath:(id)a3
{
}

- (NSString)rpiAudioFilePath
{
  return self->_rpiAudioFilePath;
}

- (void)setAudioFilePath:(id)a3
{
}

- (NSString)audioFilePath
{
  return self->_audioFilePath;
}

- (void)setRpiSamplingDirectory:(id)a3
{
}

- (NSString)rpiSamplingDirectory
{
  return self->_rpiSamplingDirectory;
}

- (void)setSamplingDirectory:(id)a3
{
}

- (NSString)samplingDirectory
{
  return self->_samplingDirectory;
}

- (void)setSamplingTimestampDetail:(id)a3
{
}

- (NSString)samplingTimestampDetail
{
  return self->_samplingTimestampDetail;
}

- (void)setSamplingTimestamp:(id)a3
{
}

- (NSString)samplingTimestamp
{
  return self->_samplingTimestamp;
}

- (void)setSamplingDate:(id)a3
{
}

- (NSString)samplingDate
{
  return self->_samplingDate;
}

- (void)setTask:(id)a3
{
}

- (NSString)task
{
  return self->_task;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setIsSamplingForDictation:(BOOL)a3
{
  self->_isSamplingForDictation = a3;
}

- (BOOL)isSamplingForDictation
{
  return self->_isSamplingForDictation;
}

- (void)setAsrId:(id)a3
{
}

- (NSString)asrId
{
  return self->_asrId;
}

- (void)setDictationInteractionId:(id)a3
{
}

- (NSString)dictationInteractionId
{
  return self->_dictationInteractionId;
}

- (void)setAudioId:(id)a3
{
}

- (NSString)audioId
{
  return self->_audioId;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)samplingString
{
  if (self->_isSamplingForDictation) {
    return @"Dictation Sampling";
  }
  else {
    return @"Assistant Sampling";
  }
}

- (BOOL)_writePlistFile:(id *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = v5;
  if (self->_isSamplingForDictation)
  {
    if (!self->_dictationInteractionId) {
      goto LABEL_6;
    }
  }
  else if (!self->_requestId)
  {
    goto LABEL_6;
  }
  objc_msgSend(v5, "setObject:forKey:");
LABEL_6:
  samplingTimestampDetail = self->_samplingTimestampDetail;
  if (samplingTimestampDetail) {
    [v6 setObject:samplingTimestampDetail forKey:@"samplingTimestamp"];
  }
  languageCode = self->_languageCode;
  if (languageCode) {
    [v6 setObject:languageCode forKey:@"language"];
  }
  task = self->_task;
  if (task) {
    [v6 setObject:task forKey:@"task"];
  }
  asrId = self->_asrId;
  if (asrId) {
    [v6 setObject:asrId forKey:@"asrSelfComponentIdentifier"];
  }
  v11 = NSNumber;
  +[CSConfig inputRecordingSampleRate];
  v12 = objc_msgSend(v11, "numberWithFloat:");
  [v6 setObject:v12 forKey:@"samplingRate"];

  id v40 = 0;
  v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:100 options:0 error:&v40];
  id v14 = v40;
  if (!v13)
  {
    v24 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v29 = v24;
      v30 = [(CSUncompressedAudioLogging *)self samplingString];
      v31 = [v14 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v46 = "-[CSUncompressedAudioLogging _writePlistFile:]";
      __int16 v47 = 2112;
      v48 = v30;
      __int16 v49 = 2114;
      v50 = v31;
      _os_log_error_impl(&dword_1BA1A5000, v29, OS_LOG_TYPE_ERROR, "%s %@: Failed to serialize plistRoot into plist : %{public}@", buf, 0x20u);

      if (!a3) {
        goto LABEL_40;
      }
    }
    else if (!a3)
    {
      goto LABEL_40;
    }
    if (v14)
    {
      uint64_t v43 = *MEMORY[0x1E4F28A50];
      id v44 = v14;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      v26 = &v44;
      v27 = &v43;
LABEL_31:
      v16 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
LABEL_33:
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:2358 userInfo:v16];
      BOOL v22 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
LABEL_32:
    v16 = 0;
    goto LABEL_33;
  }
  uint64_t v15 = [(CSUncompressedAudioLogging *)self _createFileDescriptor:self->_plistFilePath protectionClass:+[CSUncompressedAudioLogging loggingFileProtectionClass]];
  if ((int)v15 <= 0)
  {
    v28 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v35 = v28;
      v36 = [(CSUncompressedAudioLogging *)self samplingString];
      *(_DWORD *)buf = 136315394;
      v46 = "-[CSUncompressedAudioLogging _writePlistFile:]";
      __int16 v47 = 2112;
      v48 = v36;
      _os_log_error_impl(&dword_1BA1A5000, v35, OS_LOG_TYPE_ERROR, "%s %@: Failed to create FD for plist file", buf, 0x16u);

      if (a3)
      {
LABEL_29:
        if (v14)
        {
          uint64_t v41 = *MEMORY[0x1E4F28A50];
          id v42 = v14;
          v25 = (void *)MEMORY[0x1E4F1C9E8];
          v26 = &v42;
          v27 = &v41;
          goto LABEL_31;
        }
        goto LABEL_32;
      }
    }
    else if (a3)
    {
      goto LABEL_29;
    }
LABEL_40:
    BOOL v22 = 0;
    goto LABEL_41;
  }
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v15 closeOnDealloc:1];
  id v39 = 0;
  [v16 writeData:v13 error:&v39];
  id v17 = v39;
  [v16 closeFile];
  if (self->_rpiEnabled)
  {
    v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    plistFilePath = self->_plistFilePath;
    rpiPlistFilePath = self->_rpiPlistFilePath;
    id v38 = v17;
    [v18 copyItemAtPath:plistFilePath toPath:rpiPlistFilePath error:&v38];
    id v21 = v38;

    id v17 = v21;
  }
  BOOL v22 = v17 == 0;
  if (!v17) {
    goto LABEL_22;
  }
  v23 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    v32 = v23;
    v33 = [(CSUncompressedAudioLogging *)self samplingString];
    v34 = [v17 localizedDescription];
    *(_DWORD *)buf = 136315650;
    v46 = "-[CSUncompressedAudioLogging _writePlistFile:]";
    __int16 v47 = 2112;
    v48 = v33;
    __int16 v49 = 2114;
    v50 = v34;
    _os_log_error_impl(&dword_1BA1A5000, v32, OS_LOG_TYPE_ERROR, "%s %@: Unable to writeData : %{public}@", buf, 0x20u);

    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (a3)
  {
LABEL_21:
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:2356 userInfo:0];
  }
LABEL_22:

LABEL_34:
LABEL_41:

  return v22;
}

- (int)_createFileDescriptor:(id)a3 protectionClass:(int)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = [(CSUncompressedAudioLogging *)self samplingString];
    *(_DWORD *)buf = 136315650;
    id v14 = "-[CSUncompressedAudioLogging _createFileDescriptor:protectionClass:]";
    __int16 v15 = 2112;
    v16 = v9;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s %@: Creating logging file : %@", buf, 0x20u);
  }
  id v10 = v6;
  int v11 = open_dprotected_np((const char *)[v10 UTF8String], 514, a4, 0, 420);

  return v11;
}

- (void)endAudioWithCancellation:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__CSUncompressedAudioLogging_endAudioWithCancellation_completion___block_invoke;
  v14[3] = &unk_1E62011D8;
  id v15 = v6;
  id v7 = v6;
  v8 = (void *)MEMORY[0x1BA9E7570](v14);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CSUncompressedAudioLogging_endAudioWithCancellation_completion___block_invoke_2;
  v11[3] = &unk_1E61FF900;
  BOOL v13 = a3;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

uint64_t __66__CSUncompressedAudioLogging_endAudioWithCancellation_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __66__CSUncompressedAudioLogging_endAudioWithCancellation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) audioFileHandle];
  [v2 closeFile];

  if (([*(id *)(a1 + 32) isCancelled] & 1) != 0 || *(unsigned char *)(a1 + 48))
  {
    v3 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      id v6 = [v4 samplingString];
      *(_DWORD *)buf = 136315394;
      id v21 = "-[CSUncompressedAudioLogging endAudioWithCancellation:completion:]_block_invoke_2";
      __int16 v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s %@: Request is cancelled remove logging", buf, 0x16u);
    }
    [*(id *)(a1 + 32) _removeTmpAudioFile];
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    id v19 = 0;
    char v8 = [v7 _moveAudioLoggingToCollectionDirectory:&v19];
    id v9 = v19;
    if (v8)
    {
      id v10 = *(void **)(a1 + 32);
      id v18 = 0;
      char v11 = [v10 _writePlistFile:&v18];
      id v12 = v18;
      if (v11)
      {
        BOOL v13 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEBUG))
        {
          id v15 = *(void **)(a1 + 32);
          v16 = v13;
          __int16 v17 = [v15 samplingString];
          *(_DWORD *)buf = 136315394;
          id v21 = "-[CSUncompressedAudioLogging endAudioWithCancellation:completion:]_block_invoke";
          __int16 v22 = 2112;
          v23 = v17;
          _os_log_debug_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEBUG, "%s %@: Done with audio logging", buf, 0x16u);
        }
        id v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      }
      else
      {
        id v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      }
      v14();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (BOOL)_moveAudioLoggingToCollectionDirectory:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [(CSUncompressedAudioLogging *)self tmpAudioFilePath];
  int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    char v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = [(CSUncompressedAudioLogging *)self tmpAudioFilePath];
    id v10 = [(CSUncompressedAudioLogging *)self audioFilePath];
    id v28 = 0;
    char v11 = [v8 moveItemAtPath:v9 toPath:v10 error:&v28];
    id v12 = v28;

    if (v11)
    {
      BOOL v13 = [(CSUncompressedAudioLogging *)self rpiAudioFilePath];

      if (v13)
      {
        id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v15 = [(CSUncompressedAudioLogging *)self audioFilePath];
        v16 = [(CSUncompressedAudioLogging *)self rpiAudioFilePath];
        id v27 = v12;
        char v17 = [v14 copyItemAtPath:v15 toPath:v16 error:&v27];
        id v18 = v27;

        if (v17)
        {
          BOOL v19 = 1;
        }
        else
        {
          __int16 v22 = CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v32 = "-[CSUncompressedAudioLogging _moveAudioLoggingToCollectionDirectory:]";
            __int16 v33 = 2112;
            id v34 = v18;
            _os_log_error_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_ERROR, "%s audio move for rpi failed with: %@", buf, 0x16u);
          }
          BOOL v19 = 0;
        }
        id v12 = v18;
      }
      else
      {
        BOOL v19 = 1;
      }
      goto LABEL_21;
    }
    v20 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = v20;
      v25 = [(CSUncompressedAudioLogging *)self samplingString];
      v26 = [v12 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v32 = "-[CSUncompressedAudioLogging _moveAudioLoggingToCollectionDirectory:]";
      __int16 v33 = 2112;
      id v34 = v25;
      __int16 v35 = 2112;
      v36 = v26;
      _os_log_error_impl(&dword_1BA1A5000, v24, OS_LOG_TYPE_ERROR, "%s %@: Failed to move audio logging %@", buf, 0x20u);

      if (a3) {
        goto LABEL_10;
      }
    }
    else if (a3)
    {
LABEL_10:
      if (v12)
      {
        uint64_t v29 = *MEMORY[0x1E4F28A50];
        id v30 = v12;
        id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      }
      else
      {
        id v21 = 0;
      }
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:2357 userInfo:v21];
    }
    BOOL v19 = 0;
LABEL_21:

    return v19;
  }
  if (!a3) {
    return 0;
  }
  [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:2353 userInfo:0];
  BOOL v19 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v19;
}

- (void)_removeTmpAudioFile
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CSUncompressedAudioLogging__removeTmpAudioFile__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__CSUncompressedAudioLogging__removeTmpAudioFile__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = [*(id *)(a1 + 32) tmpAudioFilePath];
  int v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = [*(id *)(a1 + 32) tmpAudioFilePath];
    id v14 = 0;
    char v7 = [v5 removeItemAtPath:v6 error:&v14];
    id v8 = v14;

    if ((v7 & 1) == 0)
    {
      id v9 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        id v10 = *(void **)(a1 + 32);
        char v11 = v9;
        id v12 = [v10 samplingString];
        BOOL v13 = [v8 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v16 = "-[CSUncompressedAudioLogging _removeTmpAudioFile]_block_invoke";
        __int16 v17 = 2112;
        id v18 = v12;
        __int16 v19 = 2112;
        v20 = v13;
        _os_log_error_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_ERROR, "%s %@: Failed to remove audio logging in the tmp : %@", buf, 0x20u);
      }
    }
  }
}

- (void)cancelAudioLogging
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CSUncompressedAudioLogging_cancelAudioLogging__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __48__CSUncompressedAudioLogging_cancelAudioLogging__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    int v4 = v2;
    v5 = [v3 samplingString];
    int v7 = 136315394;
    id v8 = "-[CSUncompressedAudioLogging cancelAudioLogging]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s %@: Cancelling audio logging", (uint8_t *)&v7, 0x16u);
  }
  return [*(id *)(a1 + 32) setIsCancelled:1];
}

- (void)appendAudioData:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__CSUncompressedAudioLogging_appendAudioData___block_invoke;
    v7[3] = &unk_1E6201030;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(queue, v7);
  }
}

void __46__CSUncompressedAudioLogging_appendAudioData___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) audioFileHandle];
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = 0;
  [v2 writeData:v3 error:&v10];
  id v4 = v10;

  if (v4)
  {
    v5 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      id v6 = *(void **)(a1 + 32);
      int v7 = v5;
      id v8 = [v6 samplingString];
      __int16 v9 = [v4 localizedDescription];
      *(_DWORD *)buf = 136315650;
      id v12 = "-[CSUncompressedAudioLogging appendAudioData:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2114;
      v16 = v9;
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s %@: Unable to writeData : %{public}@", buf, 0x20u);
    }
  }
}

- (BOOL)isRPISamplingEnabled
{
  return self->_rpiEnabled;
}

- (id)getLoggingDate
{
  return self->_loggingDate;
}

- (BOOL)_setupFilePath:(id *)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1C9C8] date];
  loggingDate = self->_loggingDate;
  self->_loggingDate = v5;

  [(NSDate *)self->_loggingDate timeIntervalSince1970];
  uint64_t v8 = v7;
  __int16 v9 = +[CSUtils defaultDateFormatter];
  id v10 = [v9 stringFromDate:self->_loggingDate];
  samplingDate = self->_samplingDate;
  self->_samplingDate = v10;

  objc_msgSend(NSString, "stringWithFormat:", @"%.0f", v8);
  id v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  samplingTimestamp = self->_samplingTimestamp;
  self->_samplingTimestamp = v12;

  objc_msgSend(NSString, "stringWithFormat:", @"%.6f", v8);
  id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  samplingTimestampDetail = self->_samplingTimestampDetail;
  self->_samplingTimestampDetail = v14;

  samplingDirectory = self->_samplingDirectory;
  self->_samplingDirectory = 0;

  uint64_t v17 = (id *)0x1E4F4E3D0;
  if (self->_isSamplingForDictation) {
    uint64_t v17 = (id *)0x1E4F4E468;
  }
  id v18 = [*v17 createSamplingDirectory];
  __int16 v19 = self->_samplingDirectory;
  self->_samplingDirectory = v18;

  if (self->_rpiEnabled)
  {
    v20 = +[CSFPreferences sharedPreferences];
    uint64_t v21 = [v20 getRPIAssistantAudioSamplingDateSubDirectory:self->_loggingDate];
    rpiSamplingDirectory = self->_rpiSamplingDirectory;
    self->_rpiSamplingDirectory = v21;

    v23 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = self->_rpiSamplingDirectory;
      *(_DWORD *)buf = 136315394;
      v77 = "-[CSUncompressedAudioLogging _setupFilePath:]";
      __int16 v78 = 2112;
      v79 = v24;
      _os_log_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Setting rpi sampling directory as: %@", buf, 0x16u);
    }
    v25 = [MEMORY[0x1E4F28CB8] defaultManager];
    v26 = self->_rpiSamplingDirectory;
    id v73 = 0;
    char v27 = [v25 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:&v73];
    id v28 = (NSString *)v73;

    if ((v27 & 1) == 0)
    {
      v63 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v77 = "-[CSUncompressedAudioLogging _setupFilePath:]";
        __int16 v78 = 2112;
        v79 = v28;
        _os_log_error_impl(&dword_1BA1A5000, v63, OS_LOG_TYPE_ERROR, "%s error when creating directory: %@", buf, 0x16u);
      }
      goto LABEL_21;
    }
  }
  uint64_t v29 = self->_samplingDirectory;
  if (!v29)
  {
    v64 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v77 = "-[CSUncompressedAudioLogging _setupFilePath:]";
      __int16 v78 = 2112;
      v79 = 0;
      _os_log_error_impl(&dword_1BA1A5000, v64, OS_LOG_TYPE_ERROR, "%s Failed to get SamplingDirectory : %@", buf, 0x16u);
      if (!a3) {
        return 0;
      }
    }
    else if (!a3)
    {
      return 0;
    }
    id v65 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:2351 userInfo:0];
    BOOL result = 0;
    *a3 = v65;
    return result;
  }
  id v30 = [(NSString *)v29 stringByAppendingPathComponent:self->_samplingDate];
  v31 = self->_samplingDirectory;
  self->_samplingDirectory = v30;

  v32 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v33 = [v32 fileExistsAtPath:self->_samplingDirectory];

  if ((v33 & 1) == 0)
  {
    id v34 = [MEMORY[0x1E4F28CB8] defaultManager];
    __int16 v35 = self->_samplingDirectory;
    id v72 = 0;
    char v36 = [v34 createDirectoryAtPath:v35 withIntermediateDirectories:1 attributes:0 error:&v72];
    id v28 = (NSString *)v72;

    if (v36)
    {

      goto LABEL_12;
    }
    v66 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v69 = v66;
      v70 = [(CSUncompressedAudioLogging *)self samplingString];
      v71 = [(NSString *)v28 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v77 = "-[CSUncompressedAudioLogging _setupFilePath:]";
      __int16 v78 = 2112;
      v79 = v70;
      __int16 v80 = 2112;
      v81 = v71;
      _os_log_error_impl(&dword_1BA1A5000, v69, OS_LOG_TYPE_ERROR, "%s %@: Failed to create directory : %@", buf, 0x20u);

      if (a3) {
        goto LABEL_28;
      }
    }
    else if (a3)
    {
LABEL_28:
      if (v28)
      {
        uint64_t v74 = *MEMORY[0x1E4F28A50];
        v75 = v28;
        v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      }
      else
      {
        v67 = 0;
      }
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:2352 userInfo:v67];
    }
LABEL_21:

    return 0;
  }
LABEL_12:
  NSTemporaryDirectory();
  uint64_t v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  tmpDirectory = self->_tmpDirectory;
  self->_tmpDirectory = v37;

  uint64_t v39 = 40;
  if (!self->_isSamplingForDictation) {
    uint64_t v39 = 24;
  }
  id v40 = *(id *)((char *)&self->super.isa + v39);
  uint64_t v41 = self->_tmpDirectory;
  id v42 = [NSString stringWithFormat:@"%@_%@_%@.pcm", v40, self->_samplingDate, self->_samplingTimestamp];
  uint64_t v43 = [(NSString *)v41 stringByAppendingPathComponent:v42];
  tmpAudioFilePath = self->_tmpAudioFilePath;
  self->_tmpAudioFilePath = v43;

  v45 = self->_samplingDirectory;
  v46 = [NSString stringWithFormat:@"%@_%@_%@.pcm", v40, self->_samplingDate, self->_samplingTimestamp];
  __int16 v47 = [(NSString *)v45 stringByAppendingPathComponent:v46];
  audioFilePath = self->_audioFilePath;
  self->_audioFilePath = v47;

  __int16 v49 = self->_samplingDirectory;
  v50 = [NSString stringWithFormat:@"%@_%@_%@.plist", v40, self->_samplingDate, self->_samplingTimestamp];
  uint64_t v51 = [(NSString *)v49 stringByAppendingPathComponent:v50];
  plistFilePath = self->_plistFilePath;
  self->_plistFilePath = v51;

  if (self->_rpiEnabled)
  {
    v53 = self->_rpiSamplingDirectory;
    v54 = [NSString stringWithFormat:@"%@_%@_%@.pcm", v40, self->_samplingDate, self->_samplingTimestamp];
    v55 = [(NSString *)v53 stringByAppendingPathComponent:v54];
    rpiAudioFilePath = self->_rpiAudioFilePath;
    self->_rpiAudioFilePath = v55;

    v57 = self->_rpiSamplingDirectory;
    v58 = [NSString stringWithFormat:@"%@_%@_%@.plist", v40, self->_samplingDate, self->_samplingTimestamp];
    v59 = [(NSString *)v57 stringByAppendingPathComponent:v58];
    rpiPlistFilePath = self->_rpiPlistFilePath;
    self->_rpiPlistFilePath = v59;
  }
  v61 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEBUG))
  {
    v68 = self->_audioFilePath;
    *(_DWORD *)buf = 136315394;
    v77 = "-[CSUncompressedAudioLogging _setupFilePath:]";
    __int16 v78 = 2112;
    v79 = v68;
    _os_log_debug_impl(&dword_1BA1A5000, v61, OS_LOG_TYPE_DEBUG, "%s CSUncompressedAudioLogging file path : %@", buf, 0x16u);
  }

  return 1;
}

- (BOOL)_prepareFileForLogging:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(CSUncompressedAudioLogging *)self _createFileDescriptor:self->_tmpAudioFilePath protectionClass:+[CSUncompressedAudioLogging loggingFileProtectionClass]];
  if ((int)v5 <= 0)
  {
    id v10 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = v10;
      id v12 = [(CSUncompressedAudioLogging *)self samplingString];
      tmpAudioFilePath = self->_tmpAudioFilePath;
      int v15 = 136315650;
      v16 = "-[CSUncompressedAudioLogging _prepareFileForLogging:]";
      __int16 v17 = 2114;
      id v18 = v12;
      __int16 v19 = 2114;
      v20 = tmpAudioFilePath;
      _os_log_error_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_ERROR, "%s %{public}@: Unable to create FD on audioFilePath : (%{public}@)", (uint8_t *)&v15, 0x20u);

      if (!a3) {
        return 0;
      }
    }
    else if (!a3)
    {
      return 0;
    }
    uint64_t v9 = 2355;
    goto LABEL_8;
  }
  BOOL v6 = 1;
  uint64_t v7 = (NSFileHandle *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v5 closeOnDealloc:1];
  audioFileHandle = self->_audioFileHandle;
  self->_audioFileHandle = v7;

  if (!self->_audioFileHandle)
  {
    if (a3)
    {
      uint64_t v9 = 2356;
LABEL_8:
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:v9 userInfo:0];
      BOOL v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    return 0;
  }
  return v6;
}

- (void)prepareLogging:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__CSUncompressedAudioLogging_prepareLogging___block_invoke;
  v11[3] = &unk_1E62011D8;
  id v12 = v4;
  id v5 = v4;
  BOOL v6 = (void *)MEMORY[0x1BA9E7570](v11);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CSUncompressedAudioLogging_prepareLogging___block_invoke_2;
  block[3] = &unk_1E62012B0;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __45__CSUncompressedAudioLogging_prepareLogging___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __45__CSUncompressedAudioLogging_prepareLogging___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4E540] sharedPreferences];
  uint64_t v3 = [v2 siriDataSharingOptInStatus];

  if (v3 == 1)
  {
    id v4 = *(void **)(a1 + 32);
    id v20 = 0;
    char v5 = [v4 _setupFilePath:&v20];
    id v6 = v20;
    if (v5)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      id v19 = 0;
      char v8 = [v7 _prepareFileForLogging:&v19];
      id v9 = v19;
      if (v8)
      {
        id v10 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void **)(a1 + 32);
          id v12 = v10;
          __int16 v13 = [v11 samplingString];
          *(_DWORD *)buf = 136315394;
          __int16 v22 = "-[CSUncompressedAudioLogging prepareLogging:]_block_invoke_2";
          __int16 v23 = 2112;
          uint64_t v24 = v13;
          _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s %@: uncompressed audio logging will be enabled for this request", buf, 0x16u);
        }
        id v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      }
      else
      {
        id v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      }
      v14();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    int v15 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(void **)(a1 + 32);
      __int16 v17 = v15;
      id v18 = [v16 samplingString];
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[CSUncompressedAudioLogging prepareLogging:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      _os_log_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_DEFAULT, "%s %@: uncompressed audio logging will be disabled for this request", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (CSUncompressedAudioLogging)initWithRequestId:(id)a3 asrId:(id)a4 languageCode:(id)a5 task:(id)a6
{
  return [(CSUncompressedAudioLogging *)self initWithRequestId:a3 asrId:a4 dictationInteractionId:0 languageCode:a5 task:a6 isSamplingForDictation:0];
}

- (CSUncompressedAudioLogging)initWithRequestId:(id)a3 asrId:(id)a4 languageCode:(id)a5 task:(id)a6 rpiEnabled:(BOOL)a7
{
  LOBYTE(v8) = a7;
  return [(CSUncompressedAudioLogging *)self initWithRequestId:a3 asrId:a4 dictationInteractionId:0 languageCode:a5 task:a6 isSamplingForDictation:0 rpiEnabled:v8];
}

- (CSUncompressedAudioLogging)initWithRequestId:(id)a3 languageCode:(id)a4 task:(id)a5
{
  return [(CSUncompressedAudioLogging *)self initWithRequestId:a3 asrId:0 dictationInteractionId:0 languageCode:a4 task:a5 isSamplingForDictation:0];
}

- (CSUncompressedAudioLogging)initWithDictationInteractionId:(id)a3 asrId:(id)a4 languageCode:(id)a5 task:(id)a6
{
  return [(CSUncompressedAudioLogging *)self initWithRequestId:0 asrId:a4 dictationInteractionId:a3 languageCode:a5 task:a6 isSamplingForDictation:1];
}

- (CSUncompressedAudioLogging)initWithDictationInteractionId:(id)a3 languageCode:(id)a4 task:(id)a5
{
  return [(CSUncompressedAudioLogging *)self initWithRequestId:0 asrId:0 dictationInteractionId:a3 languageCode:a4 task:a5 isSamplingForDictation:1];
}

- (CSUncompressedAudioLogging)initWithRequestId:(id)a3 asrId:(id)a4 dictationInteractionId:(id)a5 languageCode:(id)a6 task:(id)a7 isSamplingForDictation:(BOOL)a8
{
  LOBYTE(v9) = 0;
  return [(CSUncompressedAudioLogging *)self initWithRequestId:a3 asrId:a4 dictationInteractionId:a5 languageCode:a6 task:a7 isSamplingForDictation:a8 rpiEnabled:v9];
}

- (CSUncompressedAudioLogging)initWithRequestId:(id)a3 asrId:(id)a4 dictationInteractionId:(id)a5 languageCode:(id)a6 task:(id)a7 isSamplingForDictation:(BOOL)a8 rpiEnabled:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v33 = a6;
  id v32 = a7;
  v34.receiver = self;
  v34.super_class = (Class)CSUncompressedAudioLogging;
  id v19 = [(CSUncompressedAudioLogging *)&v34 init];
  if (v19)
  {
    dispatch_queue_t v20 = dispatch_queue_create("CSUncompressedAudioLogging", 0);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    id v31 = v17;
    char v22 = a8;
    id v23 = v16;
    uint64_t v24 = v19->_queue;
    dispatch_get_global_queue(17, 0);
    id obj = a7;
    v26 = id v25 = v18;
    char v27 = v24;
    id v16 = v23;
    dispatch_set_target_queue(v27, v26);

    id v18 = v25;
    objc_storeStrong((id *)&v19->_asrId, a4);
    objc_storeStrong((id *)&v19->_requestId, a3);
    objc_storeStrong((id *)&v19->_dictationInteractionId, a5);
    objc_storeStrong((id *)&v19->_languageCode, a6);
    objc_storeStrong((id *)&v19->_task, obj);
    v19->_isSamplingForDictation = v22;
    BOOL v28 = a9 & ~v22;
    id v17 = v31;
    v19->_rpiEnabled = v28;
  }

  return v19;
}

+ (int)loggingFileProtectionClass
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    return 6;
  }
  else {
    return 3;
  }
}

@end