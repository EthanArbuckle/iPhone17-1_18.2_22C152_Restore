@interface CSAudioTimeConversionProvidingProxy
- (void)_handleXPCTimeConvertProvidingTypeHostTimeFromSampleCountMessage:(id)a3 messageBody:(id)a4 client:(id)a5 streamHandleId:(unint64_t)a6;
- (void)_handleXPCTimeConvertProvidingTypeSampleCountFromHostTimeMessage:(id)a3 messageBody:(id)a4 client:(id)a5 streamHandleId:(unint64_t)a6;
- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5 audioStreamHandleId:(unint64_t)a6;
@end

@implementation CSAudioTimeConversionProvidingProxy

- (void)_handleXPCTimeConvertProvidingTypeSampleCountFromHostTimeMessage:(id)a3 messageBody:(id)a4 client:(id)a5 streamHandleId:(unint64_t)a6
{
  v9 = (_xpc_connection_s *)a5;
  id v10 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(a4, "hostTime");
  v12 = +[CSAudioTimeConverterPool sharedInstance];
  v13 = [v12 converterForAudioStreamId:a6];

  id v14 = [v13 sampleCountFromHostTime:uint64];
  v15 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315650;
    v18 = "-[CSAudioTimeConversionProvidingProxy _handleXPCTimeConvertProvidingTypeSampleCountFromHostTimeMessage:message"
          "Body:client:streamHandleId:]";
    __int16 v19 = 2050;
    uint64_t v20 = uint64;
    __int16 v21 = 2050;
    id v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s From hostTime %{public}llu fetched sampleCount = %{public}llu", (uint8_t *)&v17, 0x20u);
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v10);

  xpc_dictionary_set_BOOL(reply, "result", 1);
  xpc_dictionary_set_uint64(reply, "replySampleCount", (uint64_t)v14);
  xpc_connection_send_message(v9, reply);
}

- (void)_handleXPCTimeConvertProvidingTypeHostTimeFromSampleCountMessage:(id)a3 messageBody:(id)a4 client:(id)a5 streamHandleId:(unint64_t)a6
{
  v9 = (_xpc_connection_s *)a5;
  id v10 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(a4, "sampleCount");
  v12 = +[CSAudioTimeConverterPool sharedInstance];
  v13 = [v12 converterForAudioStreamId:a6];

  id v14 = [v13 hostTimeFromSampleCount:uint64];
  v15 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315650;
    v18 = "-[CSAudioTimeConversionProvidingProxy _handleXPCTimeConvertProvidingTypeHostTimeFromSampleCountMessage:message"
          "Body:client:streamHandleId:]";
    __int16 v19 = 2050;
    uint64_t v20 = uint64;
    __int16 v21 = 2050;
    id v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s From sampleCount %{public}llu fetched hostTime = %{public}llu", (uint8_t *)&v17, 0x20u);
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v10);

  xpc_dictionary_set_BOOL(reply, "result", 1);
  xpc_dictionary_set_uint64(reply, "replyHostTime", (uint64_t)v14);
  xpc_connection_send_message(v9, reply);
}

- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5 audioStreamHandleId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int64_t int64 = xpc_dictionary_get_int64(v11, "type");
  if (int64 == 2)
  {
    [(CSAudioTimeConversionProvidingProxy *)self _handleXPCTimeConvertProvidingTypeSampleCountFromHostTimeMessage:v10 messageBody:v11 client:v12 streamHandleId:a6];
  }
  else
  {
    int64_t v14 = int64;
    if (int64 == 1)
    {
      [(CSAudioTimeConversionProvidingProxy *)self _handleXPCTimeConvertProvidingTypeHostTimeFromSampleCountMessage:v10 messageBody:v11 client:v12 streamHandleId:a6];
    }
    else
    {
      v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315394;
        int v17 = "-[CSAudioTimeConversionProvidingProxy handleXPCMessage:messageBody:client:audioStreamHandleId:]";
        __int16 v18 = 2050;
        int64_t v19 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Unexpected XPC audioTimeConvert providing request : %{public}lld", (uint8_t *)&v16, 0x16u);
      }
    }
  }
}

@end