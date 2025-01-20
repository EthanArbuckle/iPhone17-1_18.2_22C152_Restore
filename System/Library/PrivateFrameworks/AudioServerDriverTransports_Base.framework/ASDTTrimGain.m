@interface ASDTTrimGain
- (ASDTTrimGain)initWithSysCfgData:(id)a3 andType:(int)a4;
@end

@implementation ASDTTrimGain

- (ASDTTrimGain)initWithSysCfgData:(id)a3 andType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ASDTTrimGain;
  v7 = [(ASDTAcousticData *)&v22 initWithSysCfgData:v6 andType:v4];
  if (v7)
  {
    id v8 = v6;
    int v9 = *(unsigned __int16 *)[v8 bytes];
    if (v9 == 2)
    {
      id v10 = v8;
      v11 = (unsigned __int8 *)[v10 bytes];
      if (ASDT::Acoustic::Base::valid((ASDT::Acoustic::Base *)v11, [v10 length], 6uLL, 2))
      {
        uint64_t v12 = ASDT::Acoustic::Data<ASDT::Acoustic::TrimGainV2,(unsigned short)2>::entries(v11);
        if (v12)
        {
          v13 = (void *)v12;
          [(ASDTAcousticData *)v7 setEntries:v12];
          v14 = ASDTBaseLogType();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = [(ASDTAcousticData *)v7 name];
            v16 = [(ASDTAcousticData *)v7 entries];
            *(_DWORD *)buf = 138412546;
            v24 = v15;
            __int16 v25 = 2112;
            v26 = v16;
            _os_log_impl(&dword_2489BC000, v14, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
          }
          goto LABEL_8;
        }
        v18 = ASDTBaseLogType();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v20 = [(ASDTAcousticData *)v7 name];
          [(ASDTSpeakerThieleSmall *)v20 initWithSysCfgData:v18];
        }
      }
      else
      {
        v18 = ASDTBaseLogType();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[ASDTTrimGain initWithSysCfgData:andType:](v18);
        }
      }
    }
    else
    {
      v18 = ASDTBaseLogType();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = [(ASDTAcousticData *)v7 name];
        -[ASDTSpeakerThieleSmall initWithSysCfgData:](v19, buf, v9, v18);
      }
    }

    v17 = 0;
    goto LABEL_16;
  }
LABEL_8:
  v17 = v7;
LABEL_16:

  return v17;
}

- (void)initWithSysCfgData:(os_log_t)log andType:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "Invalid Trim data.", v1, 2u);
}

@end