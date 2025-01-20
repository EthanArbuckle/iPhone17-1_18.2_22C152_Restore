@interface ADDictationSession
- (ADDictationSession)init;
- (ADDictationSession)initWithUUID:(id)a3 timestamp:(unint64_t)a4 languageCode:(id)a5 options:(id)a6 speechRequestOptions:(id)a7;
- (AFDictationOptions)options;
- (AFSpeechRequestOptions)speechRequestOptions;
- (NSString)languageCode;
- (NSString)uuid;
- (int64_t)audioFileIOTransactionState;
- (int64_t)speechRecognitionTransactionState;
- (unint64_t)timestamp;
- (void)_setAudioFileIOTransactionState:(int64_t)a3;
- (void)_setSpeechRecognitionTransactionState:(int64_t)a3;
- (void)dealloc;
@end

@implementation ADDictationSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechRequestOptions, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_transactionObjects, 0);
}

- (int64_t)audioFileIOTransactionState
{
  return self->_audioFileIOTransactionState;
}

- (int64_t)speechRecognitionTransactionState
{
  return self->_speechRecognitionTransactionState;
}

- (AFSpeechRequestOptions)speechRequestOptions
{
  return self->_speechRequestOptions;
}

- (AFDictationOptions)options
{
  return self->_options;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)_setAudioFileIOTransactionState:(int64_t)a3
{
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int64_t audioFileIOTransactionState = self->_audioFileIOTransactionState;
    int v20 = 136315650;
    v21 = "-[ADDictationSession _setAudioFileIOTransactionState:]";
    __int16 v22 = 2048;
    int64_t v23 = audioFileIOTransactionState;
    __int16 v24 = 2048;
    int64_t v25 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s (oldState = %ld, newState = %ld)", (uint8_t *)&v20, 0x20u);
  }
  int64_t v7 = self->_audioFileIOTransactionState;
  if (v7 != a3)
  {
    if (!v7)
    {
      v8 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315138;
        v21 = "-[ADDictationSession _setAudioFileIOTransactionState:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s will call os_transaction_create()", (uint8_t *)&v20, 0xCu);
      }
      transactionObjects = self->_transactionObjects;
      if (!transactionObjects)
      {
        v10 = (AFQueue *)objc_alloc_init((Class)AFQueue);
        v11 = self->_transactionObjects;
        self->_transactionObjects = v10;

        transactionObjects = self->_transactionObjects;
      }
      v12 = (void *)os_transaction_create();
      [(AFQueue *)transactionObjects enqueueObject:v12];

      uint64_t v13 = ++qword_100585A58;
      v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315394;
        v21 = "-[ADDictationSession _setAudioFileIOTransactionState:]";
        __int16 v22 = 2048;
        int64_t v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Did call os_transaction_create() with new XPC transaction count %ld", (uint8_t *)&v20, 0x16u);
      }
    }
    self->_int64_t audioFileIOTransactionState = a3;
    if (!a3)
    {
      v15 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315138;
        v21 = "-[ADDictationSession _setAudioFileIOTransactionState:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Will destroy os_transaction_t object", (uint8_t *)&v20, 0xCu);
      }
      v16 = [(AFQueue *)self->_transactionObjects dequeueObject];
      if (!v16)
      {
        v17 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v20 = 136315138;
          v21 = "-[ADDictationSession _setAudioFileIOTransactionState:]";
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Transaction object nil", (uint8_t *)&v20, 0xCu);
        }
      }

      uint64_t v18 = --qword_100585A58;
      v19 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315394;
        v21 = "-[ADDictationSession _setAudioFileIOTransactionState:]";
        __int16 v22 = 2048;
        int64_t v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Did destroy os_transaction_t object with new XPC transaction count %ld", (uint8_t *)&v20, 0x16u);
      }
    }
  }
}

- (void)_setSpeechRecognitionTransactionState:(int64_t)a3
{
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int64_t speechRecognitionTransactionState = self->_speechRecognitionTransactionState;
    int v20 = 136315650;
    v21 = "-[ADDictationSession _setSpeechRecognitionTransactionState:]";
    __int16 v22 = 2048;
    int64_t v23 = speechRecognitionTransactionState;
    __int16 v24 = 2048;
    int64_t v25 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s (oldState = %ld, newState = %ld)", (uint8_t *)&v20, 0x20u);
  }
  int64_t v7 = self->_speechRecognitionTransactionState;
  if (v7 != a3)
  {
    if (!v7)
    {
      v8 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315138;
        v21 = "-[ADDictationSession _setSpeechRecognitionTransactionState:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Will call os_transaction_create()", (uint8_t *)&v20, 0xCu);
      }
      transactionObjects = self->_transactionObjects;
      if (!transactionObjects)
      {
        v10 = (AFQueue *)objc_alloc_init((Class)AFQueue);
        v11 = self->_transactionObjects;
        self->_transactionObjects = v10;

        transactionObjects = self->_transactionObjects;
      }
      v12 = (void *)os_transaction_create();
      [(AFQueue *)transactionObjects enqueueObject:v12];

      uint64_t v13 = ++qword_100585A58;
      v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315394;
        v21 = "-[ADDictationSession _setSpeechRecognitionTransactionState:]";
        __int16 v22 = 2048;
        int64_t v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Did call os_transaction_create() with new XPC transaction count %ld", (uint8_t *)&v20, 0x16u);
      }
    }
    self->_int64_t speechRecognitionTransactionState = a3;
    if (!a3)
    {
      v15 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315138;
        v21 = "-[ADDictationSession _setSpeechRecognitionTransactionState:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Will destroy os_transaction_t object", (uint8_t *)&v20, 0xCu);
      }
      v16 = [(AFQueue *)self->_transactionObjects dequeueObject];
      if (!v16)
      {
        v17 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v20 = 136315138;
          v21 = "-[ADDictationSession _setSpeechRecognitionTransactionState:]";
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Transaction object nil", (uint8_t *)&v20, 0xCu);
        }
      }

      uint64_t v18 = --qword_100585A58;
      v19 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315394;
        v21 = "-[ADDictationSession _setSpeechRecognitionTransactionState:]";
        __int16 v22 = 2048;
        int64_t v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Did destroy os_transaction_t object with new XPC transaction count %ld", (uint8_t *)&v20, 0x16u);
      }
    }
  }
}

- (void)dealloc
{
  if (self->_speechRecognitionTransactionState)
  {
    v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[ADDictationSession dealloc]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Will destroy os_transaction_t object", buf, 0xCu);
    }
    v4 = [(AFQueue *)self->_transactionObjects dequeueObject];
    if (!v4)
    {
      v5 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[ADDictationSession dealloc]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Transaction object nil", buf, 0xCu);
      }
    }

    uint64_t v6 = --qword_100585A58;
    int64_t v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[ADDictationSession dealloc]";
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Did destroy os_transaction_t object with new XPC transaction count %ld", buf, 0x16u);
    }
  }
  if (self->_audioFileIOTransactionState)
  {
    v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[ADDictationSession dealloc]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Will destroy os_transaction_t object", buf, 0xCu);
    }
    v9 = [(AFQueue *)self->_transactionObjects dequeueObject];
    if (!v9)
    {
      v10 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[ADDictationSession dealloc]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Transaction object nil", buf, 0xCu);
      }
    }

    uint64_t v11 = --qword_100585A58;
    v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[ADDictationSession dealloc]";
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Did destroy os_transaction_t object with new XPC transaction count %ld", buf, 0x16u);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)ADDictationSession;
  [(ADDictationSession *)&v13 dealloc];
}

- (ADDictationSession)initWithUUID:(id)a3 timestamp:(unint64_t)a4 languageCode:(id)a5 options:(id)a6 speechRequestOptions:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ADDictationSession;
  __int16 v16 = [(ADDictationSession *)&v22 init];
  if (v16)
  {
    uint64_t v17 = (NSString *)[v12 copy];
    uuid = v16->_uuid;
    v16->_uuid = v17;

    v16->_timestamp = a4;
    v19 = (NSString *)[v13 copy];
    languageCode = v16->_languageCode;
    v16->_languageCode = v19;

    objc_storeStrong((id *)&v16->_options, a6);
    objc_storeStrong((id *)&v16->_speechRequestOptions, a7);
    v16->_int64_t speechRecognitionTransactionState = 0;
    v16->_int64_t audioFileIOTransactionState = 0;
  }

  return v16;
}

- (ADDictationSession)init
{
  return 0;
}

@end