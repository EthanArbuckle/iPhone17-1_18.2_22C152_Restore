@interface DAAudioDevice
- (BOOL)initilizeAudioSessionWithError:(id *)a3;
- (BOOL)isCancelled;
- (BOOL)isHeadphonesConnected;
- (BOOL)sendRawData;
- (BOOL)sequentialAudioInput;
- (BOOL)startPlayAndRecordWithError:(id *)a3;
- (DAAudioDevice)initWithSequentialAudioInput:(BOOL)a3 error:(id *)a4;
- (DAPlayAndRecord)playAndRecord;
- (NSError)error;
- (NSMutableArray)results;
- (NSURL)fileURL;
- (OS_dispatch_semaphore)audioPlayingSemaphore;
- (id)getAllMicrophoneSourceForPort:(id)a3 error:(id *)a4;
- (id)getBuiltInMicrophonePortWithError:(id *)a3;
- (id)numberOfInputComponents;
- (id)playSignalFile:(id)a3 fileName:(id)a4 fromOutput:(unint64_t)a5 atVolume:(id)a6 withChannel:(id)a7 sendRawData:(BOOL)a8 error:(id *)a9;
- (unint64_t)outputID;
- (unint64_t)volume;
- (void)cancel;
- (void)playAndRecordFinished;
- (void)setAudioPlayingSemaphore:(id)a3;
- (void)setError:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setOutputID:(unint64_t)a3;
- (void)setPlayAndRecord:(id)a3;
- (void)setResults:(id)a3;
- (void)setSendRawData:(BOOL)a3;
- (void)setSequentialAudioInput:(BOOL)a3;
- (void)setVolume:(unint64_t)a3;
@end

@implementation DAAudioDevice

- (DAAudioDevice)initWithSequentialAudioInput:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DAAudioDevice;
  v6 = [(DAAudioDevice *)&v14 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  [(DAAudioDevice *)v6 setSequentialAudioInput:v5];
  id v13 = 0;
  unsigned __int8 v8 = [(DAAudioDevice *)v7 initilizeAudioSessionWithError:&v13];
  id v9 = v13;
  v10 = v9;
  if (v8)
  {
    [(DAAudioDevice *)v7 setIsCancelled:0];

LABEL_4:
    v11 = v7;
    goto LABEL_8;
  }
  if (a4) {
    *a4 = v9;
  }

  v11 = 0;
LABEL_8:

  return v11;
}

- (id)playSignalFile:(id)a3 fileName:(id)a4 fromOutput:(unint64_t)a5 atVolume:(id)a6 withChannel:(id)a7 sendRawData:(BOOL)a8 error:(id *)a9
{
  id v43 = a3;
  id v42 = a4;
  id v41 = a6;
  id v40 = a7;
  id v15 = objc_alloc_init((Class)NSMutableArray);
  [(DAAudioDevice *)self setResults:v15];

  if (![(DAAudioDevice *)self sequentialAudioInput])
  {
    v26 = +[AVAudioSession sharedInstance];
    [v26 setAllowAllBuiltInDataSources:1];

    uint64_t v27 = [(DAAudioDevice *)self getBuiltInMicrophonePortWithError:a9];
    if (!v27)
    {
      id v34 = 0;
      goto LABEL_24;
    }
    v16 = (void *)v27;
    v17 = [(DAAudioDevice *)self getAllMicrophoneSourceForPort:v27 error:a9];
    if (!v17) {
      goto LABEL_22;
    }
    if ([v16 setPreferredDataSource:v17 error:0])
    {
      v28 = +[AVAudioSession sharedInstance];
      unsigned int v29 = [v28 setPreferredInput:v16 error:0];

      if (v29)
      {
        v30 = +[AVAudioSession sharedInstance];
        v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v30 inputNumberOfChannels]);

        v32 = [DAPlayAndRecord alloc];
        LOBYTE(v39) = [(DAAudioDevice *)self sequentialAudioInput];
        LOBYTE(v38) = a8;
        v33 = [(DAPlayAndRecord *)v32 initWithFileURL:v43 fileName:v42 numberOfInputs:v31 inputID:-1 outputID:a5 volume:v41 channel:v40 sendRawData:v38 delegate:self sequentialAudioInput:v39 error:a9];
        [(DAAudioDevice *)self setPlayAndRecord:v33];

        LOBYTE(v33) = [(DAAudioDevice *)self startPlayAndRecordWithError:a9];
        if (v33) {
          goto LABEL_14;
        }
LABEL_22:

        id v34 = 0;
        goto LABEL_23;
      }
      uint64_t v35 = -8;
    }
    else
    {
      uint64_t v35 = -7;
    }
    +[LegacyAudioSystemController setCode:v35 forError:a9];
    goto LABEL_22;
  }
  v16 = [(DAAudioDevice *)self getBuiltInMicrophonePortWithError:a9];
  v17 = [(DAAudioDevice *)self numberOfInputComponents];
  if ((int)[v17 intValue] >= 1)
  {
    uint64_t v18 = 0;
    while (1)
    {
      v19 = [DAPlayAndRecord alloc];
      LOBYTE(v39) = [(DAAudioDevice *)self sequentialAudioInput];
      LOBYTE(v38) = a8;
      v20 = [(DAPlayAndRecord *)v19 initWithFileURL:v43 fileName:v42 numberOfInputs:&off_1000108B8 inputID:v18 outputID:a5 volume:v41 channel:v40 sendRawData:v38 delegate:self sequentialAudioInput:v39 error:a9];
      [(DAAudioDevice *)self setPlayAndRecord:v20];

      v21 = [v16 dataSources];
      v22 = [v21 objectAtIndex:v18];

      if (![v16 setPreferredDataSource:v22 error:0])
      {
        uint64_t v36 = -7;
        goto LABEL_19;
      }
      v23 = +[AVAudioSession sharedInstance];
      unsigned int v24 = [v23 setPreferredInput:v16 error:0];

      if (!v24) {
        break;
      }
      unsigned __int8 v25 = [(DAAudioDevice *)self startPlayAndRecordWithError:a9];

      if ((v25 & 1) == 0) {
        goto LABEL_22;
      }
      if (++v18 >= (int)[v17 intValue]) {
        goto LABEL_14;
      }
    }
    uint64_t v36 = -8;
LABEL_19:
    +[LegacyAudioSystemController setCode:v36 forError:a9];

    goto LABEL_22;
  }
LABEL_14:

  v16 = [(DAAudioDevice *)self results];
  id v34 = [v16 copy];
LABEL_23:

LABEL_24:

  return v34;
}

- (BOOL)startPlayAndRecordWithError:(id *)a3
{
  BOOL v5 = [(DAAudioDevice *)self playAndRecord];

  if (!v5) {
    return 0;
  }
  if ([(DAAudioDevice *)self isHeadphonesConnected])
  {
    +[LegacyAudioSystemController setCode:-54 forError:a3];
    return 0;
  }
  v6 = self;
  objc_sync_enter(v6);
  unsigned __int8 v7 = [(DAAudioDevice *)v6 isCancelled];
  objc_sync_exit(v6);

  if (v7) {
    return 0;
  }
  unsigned __int8 v8 = [(DAAudioDevice *)v6 playAndRecord];
  unsigned int v9 = [v8 startAudioTestCase];

  if (v9) {
    return 0;
  }
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  [(DAAudioDevice *)v6 setAudioPlayingSemaphore:v11];

  v12 = [(DAAudioDevice *)v6 audioPlayingSemaphore];
  dispatch_time_t v13 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v12, v13);

  return 1;
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  [(DAAudioDevice *)v2 setIsCancelled:1];
  objc_sync_exit(v2);

  v3 = [(DAAudioDevice *)v2 playAndRecord];

  if (v3)
  {
    v4 = [(DAAudioDevice *)v2 playAndRecord];
    [v4 cancel];
  }
  BOOL v5 = [(DAAudioDevice *)v2 audioPlayingSemaphore];

  if (v5)
  {
    v6 = [(DAAudioDevice *)v2 audioPlayingSemaphore];
    dispatch_semaphore_signal(v6);
  }
}

- (void)playAndRecordFinished
{
  v3 = [(DAAudioDevice *)self results];
  v4 = [(DAAudioDevice *)self playAndRecord];
  BOOL v5 = [v4 results];
  [v3 addObject:v5];

  v6 = [(DAAudioDevice *)self audioPlayingSemaphore];

  if (v6)
  {
    unsigned __int8 v7 = [(DAAudioDevice *)self audioPlayingSemaphore];
    dispatch_semaphore_signal(v7);
  }
}

- (BOOL)initilizeAudioSessionWithError:(id *)a3
{
  v4 = +[AVAudioSession sharedInstance];
  if (![v4 setCategory:AVAudioSessionCategoryPlayAndRecord mode:AVAudioSessionModeRaw options:1 error:a3])
  {
    uint64_t v6 = -2;
    goto LABEL_7;
  }
  if (![v4 setMode:AVAudioSessionModeMeasurement error:0])
  {
    uint64_t v6 = -3;
    goto LABEL_7;
  }
  BOOL v5 = 1;
  if (([v4 setActive:1 error:0] & 1) == 0)
  {
    uint64_t v6 = -4;
LABEL_7:
    +[LegacyAudioSystemController setCode:v6 forError:a3];
    BOOL v5 = 0;
  }

  return v5;
}

- (id)numberOfInputComponents
{
  v2 = [(DAAudioDevice *)self getBuiltInMicrophonePortWithError:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [v2 dataSources];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    LODWORD(v6) = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        unsigned int v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) dataSourceID];
        unsigned int v10 = [v9 intValue];

        if (v10 == 1634495520) {
          uint64_t v6 = v6;
        }
        else {
          uint64_t v6 = (v6 + 1);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  dispatch_semaphore_t v11 = +[NSNumber numberWithInt:v6];

  return v11;
}

- (id)getBuiltInMicrophonePortWithError:(id *)a3
{
  id v4 = +[AVAudioSession sharedInstance];
  id v5 = [v4 availableInputs];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v6);
      }
      dispatch_semaphore_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
      v12 = [v11 portType:v16];
      unsigned __int8 v13 = [v12 isEqualToString:AVAudioSessionPortBuiltInMic];

      if (v13) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v11;

    if (v14) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -5, a3, (void)v16);
  id v14 = 0;
LABEL_12:

  return v14;
}

- (id)getAllMicrophoneSourceForPort:(id)a3 error:(id *)a4
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [a3 dataSources];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      dispatch_semaphore_t v11 = [v10 dataSourceID];
      unsigned int v12 = [v11 intValue];

      if (v12 == 1634495520) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (v13) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  +[LegacyAudioSystemController setCode:-6 forError:a4];
  id v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)isHeadphonesConnected
{
  v2 = +[AVAudioSession sharedInstance];
  v3 = [v2 currentRoute];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [v3 outputs];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 portType];
        if ([v10 isEqualToString:AVAudioSessionPortBuiltInReceiver])
        {
        }
        else
        {
          dispatch_semaphore_t v11 = [v9 portType];
          unsigned int v12 = [v11 isEqualToString:AVAudioSessionPortBuiltInSpeaker];

          if (!v12)
          {
            BOOL v13 = 1;
            goto LABEL_13;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (unint64_t)outputID
{
  return self->_outputID;
}

- (void)setOutputID:(unint64_t)a3
{
  self->_outputID = a3;
}

- (unint64_t)volume
{
  return self->_volume;
}

- (void)setVolume:(unint64_t)a3
{
  self->_volume = a3;
}

- (BOOL)sendRawData
{
  return self->_sendRawData;
}

- (void)setSendRawData:(BOOL)a3
{
  self->_sendRawData = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (OS_dispatch_semaphore)audioPlayingSemaphore
{
  return self->_audioPlayingSemaphore;
}

- (void)setAudioPlayingSemaphore:(id)a3
{
}

- (DAPlayAndRecord)playAndRecord
{
  return self->_playAndRecord;
}

- (void)setPlayAndRecord:(id)a3
{
}

- (BOOL)sequentialAudioInput
{
  return self->_sequentialAudioInput;
}

- (void)setSequentialAudioInput:(BOOL)a3
{
  self->_sequentialAudioInput = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_playAndRecord, 0);
  objc_storeStrong((id *)&self->_audioPlayingSemaphore, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end