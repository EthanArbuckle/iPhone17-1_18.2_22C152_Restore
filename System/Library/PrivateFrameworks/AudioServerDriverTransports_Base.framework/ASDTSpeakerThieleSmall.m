@interface ASDTSpeakerThieleSmall
- (ASDTSpeakerThieleSmall)initWithSysCfgData:(id)a3;
@end

@implementation ASDTSpeakerThieleSmall

- (ASDTSpeakerThieleSmall)initWithSysCfgData:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASDTSpeakerThieleSmall;
  v5 = [(ASDTAcousticData *)&v21 initWithSysCfgData:v4 andType:1399870547];
  if (v5)
  {
    id v6 = v4;
    int v7 = *(unsigned __int16 *)[v6 bytes];
    if (v7 == 2)
    {
      id v8 = v6;
      v9 = (unsigned __int8 *)[v8 bytes];
      if (ASDT::Acoustic::Base::valid((ASDT::Acoustic::Base *)v9, [v8 length], 0x16uLL, 2))
      {
        uint64_t v10 = ASDT::Acoustic::Data<ASDT::Acoustic::SpeakerThieleSmallV2,(unsigned short)2>::entries(v9);
        if (v10)
        {
          v11 = (void *)v10;
          [(ASDTAcousticData *)v5 setEntries:v10];
          v12 = ASDTBaseLogType();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = [(ASDTAcousticData *)v5 name];
            v14 = [(ASDTAcousticData *)v5 entries];
            *(_DWORD *)buf = 138412546;
            v23 = v13;
            __int16 v24 = 2112;
            v25 = v14;
            _os_log_impl(&dword_2489BC000, v12, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
          }
          goto LABEL_8;
        }
        v16 = ASDTBaseLogType();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v19 = [(ASDTAcousticData *)v5 name];
          [(ASDTSpeakerThieleSmall *)v19 initWithSysCfgData:v16];
        }
      }
      else
      {
        v16 = ASDTBaseLogType();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v18 = [(ASDTAcousticData *)v5 name];
          [(ASDTSpeakerThieleSmall *)v18 initWithSysCfgData:v16];
        }
      }
    }
    else
    {
      v16 = ASDTBaseLogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = [(ASDTAcousticData *)v5 name];
        -[ASDTSpeakerThieleSmall initWithSysCfgData:](v17, buf, v7, v16);
      }
    }

    v15 = 0;
    goto LABEL_16;
  }
LABEL_8:
  v15 = v5;
LABEL_16:

  return v15;
}

- (void)initWithSysCfgData:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%@: Could not generate entries from data.", buf, 0xCu);
}

- (void)initWithSysCfgData:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%@: Invalid data.", buf, 0xCu);
}

- (void)initWithSysCfgData:(int)a3 .cold.3(void *a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%@: Unsupported data version: %hu", buf, 0x12u);
}

@end