@interface PHASEEnvelopeDistanceModelParameters
+ (PHASEEnvelopeDistanceModelParameters)new;
- (PHASEEnvelope)envelope;
- (PHASEEnvelopeDistanceModelParameters)init;
- (PHASEEnvelopeDistanceModelParameters)initWithEnvelope:(PHASEEnvelope *)envelope;
@end

@implementation PHASEEnvelopeDistanceModelParameters

- (PHASEEnvelopeDistanceModelParameters)init
{
  return 0;
}

+ (PHASEEnvelopeDistanceModelParameters)new
{
  return 0;
}

- (PHASEEnvelopeDistanceModelParameters)initWithEnvelope:(PHASEEnvelope *)envelope
{
  *(void *)&v46[5] = *MEMORY[0x263EF8340];
  v5 = envelope;
  v40.receiver = self;
  v40.super_class = (Class)PHASEEnvelopeDistanceModelParameters;
  v6 = [(PHASEDistanceModelParameters *)&v40 initInternal];
  if (v6)
  {
    v7 = (Phase::Logger *)[(PHASEEnvelope *)v5 startPoint];
    if (v8 >= 0.0)
    {
      v11 = (Phase::Logger *)[(PHASEEnvelope *)v5 startPoint];
      if (v12 >= 0.0
        && (v11 = (Phase::Logger *)[(PHASEEnvelope *)v5 startPoint], double v14 = v13, v13 <= 1.0))
      {
        for (unint64_t i = 0; ; ++i)
        {
          v18 = [(PHASEEnvelope *)v5 segments];
          BOOL v19 = [v18 count] > i;

          if (!v19)
          {
            objc_storeStrong(v6 + 2, envelope);
            goto LABEL_18;
          }
          v20 = [(PHASEEnvelope *)v5 segments];
          v21 = [v20 objectAtIndexedSubscript:i];
          [v21 endPoint];
          BOOL v23 = v22 < 0.0;

          if (v23) {
            break;
          }
          v25 = [(PHASEEnvelope *)v5 segments];
          v26 = [v25 objectAtIndexedSubscript:i];
          [v26 endPoint];
          if (v27 < 0.0)
          {

LABEL_24:
            v9 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v32)
                                                                                               + 432)));
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              v37 = [(PHASEEnvelope *)v5 segments];
              v38 = [v37 objectAtIndexedSubscript:i];
              [v38 endPoint];
              *(_DWORD *)buf = 136315906;
              v42 = "PHASEDistanceModel.mm";
              __int16 v43 = 1024;
              int v44 = 192;
              __int16 v45 = 1024;
              v46[0] = i;
              LOWORD(v46[1]) = 2048;
              *(void *)((char *)&v46[1] + 2) = v39;
              _os_log_impl(&dword_221E5E000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d PHASEEnvelopeDistanceModelParameters:initWithEnvelope: envelope.segments[%d].endPoint.y (%f) is out-of-range [0, 1]. Returning nil.", buf, 0x22u);
            }
            goto LABEL_10;
          }
          v28 = [(PHASEEnvelope *)v5 segments];
          v29 = [v28 objectAtIndexedSubscript:i];
          [v29 endPoint];
          BOOL v31 = v30 > 1.0;

          if (v31) {
            goto LABEL_24;
          }
        }
        v9 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v24)
                                                                                           + 432)));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v34 = [(PHASEEnvelope *)v5 segments];
          v35 = [v34 objectAtIndexedSubscript:i];
          [v35 endPoint];
          *(_DWORD *)buf = 136315906;
          v42 = "PHASEDistanceModel.mm";
          __int16 v43 = 1024;
          int v44 = 182;
          __int16 v45 = 1024;
          v46[0] = i;
          LOWORD(v46[1]) = 2048;
          *(void *)((char *)&v46[1] + 2) = v36;
          _os_log_impl(&dword_221E5E000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d PHASEEnvelopeDistanceModelParameters:initWithEnvelope: envelope.segments[%d].endPoint.x (%f) is negative. Returning nil.", buf, 0x22u);
        }
      }
      else
      {
        v9 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v11)
                                                                                           + 432)));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          [(PHASEEnvelope *)v5 startPoint];
          *(_DWORD *)buf = 136315650;
          v42 = "PHASEDistanceModel.mm";
          __int16 v43 = 1024;
          int v44 = 170;
          __int16 v45 = 2048;
          *(void *)v46 = v15;
          _os_log_impl(&dword_221E5E000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d PHASEEnvelopeDistanceModelParameters:initWithEnvelope: envelope.startPoint.y (%f) is out-of-range [0, 1]. Returning nil.", buf, 0x1Cu);
        }
      }
    }
    else
    {
      v9 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v7)
                                                                                         + 432)));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        [(PHASEEnvelope *)v5 startPoint];
        *(_DWORD *)buf = 136315650;
        v42 = "PHASEDistanceModel.mm";
        __int16 v43 = 1024;
        int v44 = 160;
        __int16 v45 = 2048;
        *(void *)v46 = v10;
        _os_log_impl(&dword_221E5E000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d PHASEEnvelopeDistanceModelParameters:initWithEnvelope: envelope.startPoint.x (%f) is negative. Returning nil.", buf, 0x1Cu);
      }
    }
LABEL_10:

    v16 = 0;
  }
  else
  {
LABEL_18:
    v16 = v6;
  }

  return v16;
}

- (PHASEEnvelope)envelope
{
  return self->_envelope;
}

- (void).cxx_destruct
{
}

@end