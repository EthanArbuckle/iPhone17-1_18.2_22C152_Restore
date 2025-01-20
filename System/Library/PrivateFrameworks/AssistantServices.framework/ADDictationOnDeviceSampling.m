@interface ADDictationOnDeviceSampling
+ (id)_readDictationSampledPlist;
+ (id)sharedManager;
- (ADDictationOnDeviceSampling)init;
- (BOOL)isRequestConsideredForSampling;
- (BOOL)isRequestSelectedForSampling;
- (BOOL)isSamplingDateCurrent;
- (NSDate)currentSamplingDate;
- (NSMutableDictionary)dictationSamplingVaribles;
- (OS_dispatch_queue)fileQueue;
- (int64_t)numberOfRequestsTillNow;
- (void)_createDictationSampledPlistIfItDoesNotExist;
- (void)_writeDictationSamplingVariablesToFile:(id)a3;
- (void)createDictationSampledPlistIfItDoesNotExist;
- (void)decrementRequestCount;
- (void)incrementRequestCount;
- (void)resetRequestCount;
- (void)setCurrentSamplingDate:(id)a3;
- (void)setDictationSamplingVaribles:(id)a3;
- (void)setFileQueue:(id)a3;
- (void)setIsRequestConsideredForSampling:(BOOL)a3;
- (void)setNumberOfRequestsTillNow:(int64_t)a3;
- (void)setRequestCount:(int64_t)a3;
- (void)updateDateToCurrent;
- (void)updateRequestCountWithFlag:(BOOL)a3;
@end

@implementation ADDictationOnDeviceSampling

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileQueue, 0);
  objc_storeStrong((id *)&self->_dictationSamplingVaribles, 0);
  objc_storeStrong((id *)&self->_currentSamplingDate, 0);
}

- (void)setFileQueue:(id)a3
{
}

- (OS_dispatch_queue)fileQueue
{
  return self->_fileQueue;
}

- (void)setIsRequestConsideredForSampling:(BOOL)a3
{
  self->_isRequestConsideredForSampling = a3;
}

- (BOOL)isRequestConsideredForSampling
{
  return self->_isRequestConsideredForSampling;
}

- (void)setDictationSamplingVaribles:(id)a3
{
}

- (NSMutableDictionary)dictationSamplingVaribles
{
  return self->_dictationSamplingVaribles;
}

- (void)setCurrentSamplingDate:(id)a3
{
}

- (NSDate)currentSamplingDate
{
  return self->_currentSamplingDate;
}

- (void)setNumberOfRequestsTillNow:(int64_t)a3
{
  self->_numberOfRequestsTillNow = a3;
}

- (int64_t)numberOfRequestsTillNow
{
  return self->_numberOfRequestsTillNow;
}

- (void)_writeDictationSamplingVariablesToFile:(id)a3
{
  id v4 = a3;
  if (([(NSMutableDictionary *)self->_dictationSamplingVaribles writeToFile:v4 atomically:1] & 1) == 0)
  {
    v5 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "-[ADDictationOnDeviceSampling _writeDictationSamplingVariablesToFile:]";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Error while writing _dictationSamplingVaribles to plist - %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_createDictationSampledPlistIfItDoesNotExist
{
  v3 = +[AFDictationSamplingUtilities createSamplingDirectory];
  if (v3)
  {
    id v4 = +[AFDictationSamplingUtilities sampledPlistFileName];
    v5 = [v3 stringByAppendingPathComponent:v4];

    char v11 = 0;
    int v6 = +[NSFileManager defaultManager];
    unsigned int v7 = [v6 fileExistsAtPath:v5 isDirectory:&v11];

    if (v7 && v11)
    {
      __int16 v8 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[ADDictationOnDeviceSampling _createDictationSampledPlistIfItDoesNotExist]";
        __int16 v14 = 2112;
        v15 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Error while creating plist file. The dictationSampledPlistPath - %@ - is returned as Directory. Should not happen.", buf, 0x16u);
      }
    }
    else
    {
      [(ADDictationOnDeviceSampling *)self _writeDictationSamplingVariablesToFile:v5];
    }
  }
  else
  {
    id v9 = (void *)AFSiriLogContextSpeech;
    if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    v5 = v9;
    v10 = +[AFDictationSamplingUtilities sampledLibraryDirectoryPath];
    *(_DWORD *)buf = 136315394;
    v13 = "-[ADDictationOnDeviceSampling _createDictationSampledPlistIfItDoesNotExist]";
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Error while creating directory - %@", buf, 0x16u);
  }
LABEL_9:
}

- (void)createDictationSampledPlistIfItDoesNotExist
{
  fileQueue = self->_fileQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002365C4;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(fileQueue, block);
}

- (BOOL)isRequestSelectedForSampling
{
  v3 = +[AFPreferences sharedPreferences];
  unsigned int v4 = [v3 isDictationHIPAACompliant];

  if (v4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
      int v6 = "%s Dictation Sampling: HIPAA Device, Sampling is DISABLED.";
LABEL_15:
      v16 = v5;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    unsigned int v7 = +[AFPreferences sharedPreferences];
    unsigned int v8 = [v7 isDictationOnDeviceSamplingDisabled];

    if (v8)
    {
      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
        int v6 = "%s Dictation Sampling: Sampling is DISABLED.";
        goto LABEL_15;
      }
    }
    else
    {
      id v9 = +[AFPreferences sharedPreferences];
      id v10 = [v9 siriDataSharingOptInStatus];

      if (v10 == (id)1)
      {
        if (self->_numberOfRequestsTillNow)
        {
          if ([(ADDictationOnDeviceSampling *)self isSamplingDateCurrent])
          {
            signed int v11 = arc4random_uniform(LODWORD(self->_numberOfRequestsTillNow) + 1) + 1;
            v12 = AFSiriLogContextConnection;
            BOOL v13 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
            if (v11 > 1)
            {
              if (!v13) {
                return 0;
              }
              int v18 = 136315138;
              v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
              int v6 = "%s Dictation Sampling: NOT Selected for sampling";
              v16 = v12;
              goto LABEL_16;
            }
            if (!v13) {
              return 1;
            }
            int v18 = 136315138;
            v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
            __int16 v14 = "%s Dictation Sampling: Selected for sampling.";
            BOOL v15 = 1;
          }
          else
          {
            [(ADDictationOnDeviceSampling *)self setRequestCount:0];
            [(ADDictationOnDeviceSampling *)self updateDateToCurrent];
            v12 = AFSiriLogContextConnection;
            BOOL v15 = 1;
            if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO)) {
              return v15;
            }
            int v18 = 136315138;
            v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
            __int16 v14 = "%s Dictation Sampling: Selected for sampling - Sampling Date has been changed.";
          }
        }
        else
        {
          v12 = AFSiriLogContextConnection;
          BOOL v15 = 1;
          if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO)) {
            return v15;
          }
          int v18 = 136315138;
          v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
          __int16 v14 = "%s Dictation Sampling: Selected for sampling - number of requests was 0.";
        }
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v18, 0xCu);
        return v15;
      }
      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
        int v6 = "%s Dictation Sampling: User is NOT opted in.";
        goto LABEL_15;
      }
    }
  }
  return 0;
}

- (BOOL)isSamplingDateCurrent
{
  v3 = +[NSCalendar currentCalendar];
  unsigned int v4 = [v3 components:28 fromDate:self->_currentSamplingDate];
  v5 = +[NSDate date];
  unsigned __int8 v6 = [v3 date:v5 matchesComponents:v4];

  return v6;
}

- (void)updateDateToCurrent
{
  v3 = +[NSDate date];
  currentSamplingDate = self->_currentSamplingDate;
  self->_currentSamplingDate = v3;

  v5 = self->_currentSamplingDate;
  dictationSamplingVaribles = self->_dictationSamplingVaribles;
  unsigned int v7 = +[AFDictationSamplingUtilities sampledCurrentSamplingDateKey];
  [(NSMutableDictionary *)dictationSamplingVaribles setObject:v5 forKeyedSubscript:v7];

  [(ADDictationOnDeviceSampling *)self createDictationSampledPlistIfItDoesNotExist];
}

- (void)setRequestCount:(int64_t)a3
{
  self->_numberOfRequestsTillNow = a3;
  unsigned int v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  [(NSMutableDictionary *)self->_dictationSamplingVaribles setObject:v4 forKeyedSubscript:@"numberOfRequestsTillNow"];

  [(ADDictationOnDeviceSampling *)self createDictationSampledPlistIfItDoesNotExist];
}

- (void)decrementRequestCount
{
  if (self->_isRequestConsideredForSampling)
  {
    int64_t numberOfRequestsTillNow = self->_numberOfRequestsTillNow;
    if (numberOfRequestsTillNow >= 1)
    {
      self->_int64_t numberOfRequestsTillNow = numberOfRequestsTillNow - 1;
      -[ADDictationOnDeviceSampling setRequestCount:](self, "setRequestCount:");
      v3 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v4 = 136315138;
        v5 = "-[ADDictationOnDeviceSampling decrementRequestCount]";
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Dictation Sampling: Done decrementing total number of dictation requests by 1, for the current sampling date.", (uint8_t *)&v4, 0xCu);
      }
    }
  }
}

- (void)updateRequestCountWithFlag:(BOOL)a3
{
  self->_isRequestConsideredForSampling = a3;
  if (a3) {
    [(ADDictationOnDeviceSampling *)self incrementRequestCount];
  }
}

- (void)incrementRequestCount
{
}

- (void)resetRequestCount
{
}

- (ADDictationOnDeviceSampling)init
{
  v14.receiver = self;
  v14.super_class = (Class)ADDictationOnDeviceSampling;
  v2 = [(ADDictationOnDeviceSampling *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADDictationOnDeviceSampling file queue", v3);
    fileQueue = v2->_fileQueue;
    v2->_fileQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [(id)objc_opt_class() _readDictationSampledPlist];
    dictationSamplingVaribles = v2->_dictationSamplingVaribles;
    v2->_dictationSamplingVaribles = (NSMutableDictionary *)v6;

    if ([(NSMutableDictionary *)v2->_dictationSamplingVaribles count])
    {
      unsigned int v8 = v2->_dictationSamplingVaribles;
      id v9 = +[AFDictationSamplingUtilities sampledCurrentSamplingDateKey];
      uint64_t v10 = [(NSMutableDictionary *)v8 objectForKey:v9];
      currentSamplingDate = v2->_currentSamplingDate;
      v2->_currentSamplingDate = (NSDate *)v10;

      v12 = [(NSMutableDictionary *)v2->_dictationSamplingVaribles objectForKey:@"numberOfRequestsTillNow"];
      v2->_int64_t numberOfRequestsTillNow = (int64_t)[v12 integerValue];
    }
    else
    {
      [(ADDictationOnDeviceSampling *)v2 updateDateToCurrent];
      [(ADDictationOnDeviceSampling *)v2 resetRequestCount];
    }
  }
  return v2;
}

+ (id)_readDictationSampledPlist
{
  v2 = +[AFDictationSamplingUtilities sampledLibraryDirectoryPath];
  v3 = +[AFDictationSamplingUtilities sampledPlistFileName];
  dispatch_queue_t v4 = +[NSString stringWithFormat:@"%@/%@", v2, v3];

  v5 = +[NSURL fileURLWithPath:v4];
  id v12 = 0;
  uint64_t v6 = +[NSMutableDictionary dictionaryWithContentsOfURL:v5 error:&v12];
  id v7 = v12;
  if (v7)
  {
    unsigned int v8 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      objc_super v14 = "+[ADDictationOnDeviceSampling _readDictationSampledPlist]";
      __int16 v15 = 2112;
      v16 = v4;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Error while reading plist at location %@ - %@", buf, 0x20u);
    }
    id v9 = +[NSMutableDictionary dictionary];
  }
  else
  {
    id v9 = [v6 mutableCopy];
  }
  uint64_t v10 = v9;

  return v10;
}

+ (id)sharedManager
{
  if (qword_100585F80 != -1) {
    dispatch_once(&qword_100585F80, &stru_1005077F8);
  }
  v2 = (void *)qword_100585F78;
  return v2;
}

@end