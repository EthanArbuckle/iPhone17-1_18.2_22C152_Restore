@interface CSSecureSiriAudioProvidingProxy
- (BOOL)configAOPVoiceTrigger;
- (BOOL)fetchAndStoreAudioBuffer;
- (BOOL)initializeSecondPass;
- (BOOL)prepare:(int)a3;
- (BOOL)setSpeakerProfile:(id)a3 numEmbeddings:(unint64_t)a4 dimension:(unint64_t)a5 speakerRecognizerType:(unint64_t)a6;
- (CSSecureSiriAudioProvidingProxy)init;
- (unint64_t)convertAssetConfigurationError:(unint64_t)a3;
- (unint64_t)convertSecureBargeInVoiceTriggerResultType:(corespeechexclave_bargeinvoicetriggerresult_s *)a3;
- (unint64_t)convertSecureSecondPassVoiceTriggerResultType:(corespeechexclave_voicetriggersecondpassresult_s *)a3;
- (unint64_t)convertSecureSpeakerRecognitionType:(unint64_t)a3;
- (unint64_t)processBargeInVoiceTrigger;
- (void)adBlockerMatchingInProgress:(id)a3;
- (void)fetchAOPVoiceTriggerResult:(id)a3;
- (void)processBargeInVoiceTriggerWithResult:(id)a3;
- (void)processSecondPassVoiceTriggerWithShouldFlushAudio:(BOOL)a3 result:(id)a4;
- (void)requestHistoricalAudioBufferWithStartSample:(unint64_t)a3 completion:(id)a4;
- (void)resetFirstPassVoiceTrigger;
- (void)setAdBlockerAsset:(id)a3;
- (void)setAssetForLocale:(id)a3 isOTA:(BOOL)a4 completion:(id)a5;
- (void)startAdBlockerMatching;
- (void)startBargeInVoiceTrigger;
- (void)startSecondPassVoiceTriggerWithStartOption:(id)a3;
- (void)startSecureAdBlockerMobileAssetLoaderService:(id)a3;
- (void)startSecureMobileAssetLoaderService:(BOOL)a3 completion:(id)a4;
- (void)stopAdBlockerMatching;
- (void)stopBargeInVoiceTrigger;
- (void)stopSecondPassVoiceTrigger;
- (void)stopSecureAdBlockerMobileAssetLoaderService:(id)a3;
- (void)stopSecureMobileAssetLoaderService:(id)a3;
@end

@implementation CSSecureSiriAudioProvidingProxy

- (void)adBlockerMatchingInProgress:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __63__CSSecureSiriAudioProvidingProxy_adBlockerMatchingInProgress___block_invoke;
  v8 = &unk_2652EA808;
  id v9 = v3;
  id v4 = v3;
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  uint64_t v23 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    uint64_t v10 = 0;
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

uint64_t __63__CSSecureSiriAudioProvidingProxy_adBlockerMatchingInProgress___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)stopAdBlockerMatching
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24C764000, v2, OS_LOG_TYPE_DEFAULT, byte_24C76E621, buf, 2u);
  }
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  *(_OWORD *)buf = 0u;
  long long v4 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

- (void)startAdBlockerMatching
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24C764000, v2, OS_LOG_TYPE_DEFAULT, byte_24C76E621, buf, 2u);
  }
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  *(_OWORD *)buf = 0u;
  long long v4 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

- (void)setAdBlockerAsset:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24C764000, v5, OS_LOG_TYPE_DEFAULT, byte_24C76E621, buf, 2u);
  }
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __53__CSSecureSiriAudioProvidingProxy_setAdBlockerAsset___block_invoke;
  uint64_t v10 = &unk_2652EA7E0;
  long long v11 = self;
  id v12 = v4;
  id v6 = v4;
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)buf = 0u;
  long long v21 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    uint64_t v13 = 0;
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

uint64_t __53__CSSecureSiriAudioProvidingProxy_setAdBlockerAsset___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  if (v2)
  {
    uint64_t v3 = [*(id *)(result + 32) convertAssetConfigurationError:a2];
    id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

- (void)stopSecureAdBlockerMobileAssetLoaderService:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24C764000, v5, OS_LOG_TYPE_DEFAULT, byte_24C76E621, buf, 2u);
  }
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __79__CSSecureSiriAudioProvidingProxy_stopSecureAdBlockerMobileAssetLoaderService___block_invoke;
  uint64_t v10 = &unk_2652EA7E0;
  long long v11 = self;
  id v12 = v4;
  id v6 = v4;
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)buf = 0u;
  long long v21 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    uint64_t v13 = 0;
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

uint64_t __79__CSSecureSiriAudioProvidingProxy_stopSecureAdBlockerMobileAssetLoaderService___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  if (v2)
  {
    uint64_t v3 = [*(id *)(result + 32) convertAssetConfigurationError:a2];
    id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

- (void)startSecureAdBlockerMobileAssetLoaderService:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24C764000, v5, OS_LOG_TYPE_DEFAULT, byte_24C76E621, buf, 2u);
  }
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __80__CSSecureSiriAudioProvidingProxy_startSecureAdBlockerMobileAssetLoaderService___block_invoke;
  uint64_t v10 = &unk_2652EA7E0;
  long long v11 = self;
  id v12 = v4;
  id v6 = v4;
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)buf = 0u;
  long long v21 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    uint64_t v13 = 0;
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

uint64_t __80__CSSecureSiriAudioProvidingProxy_startSecureAdBlockerMobileAssetLoaderService___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  if (v2)
  {
    uint64_t v3 = [*(id *)(result + 32) convertAssetConfigurationError:a2];
    id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

- (void)stopSecureMobileAssetLoaderService:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24C764000, v5, OS_LOG_TYPE_DEFAULT, byte_24C76E621, buf, 2u);
  }
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __70__CSSecureSiriAudioProvidingProxy_stopSecureMobileAssetLoaderService___block_invoke;
  uint64_t v10 = &unk_2652EA7E0;
  long long v11 = self;
  id v12 = v4;
  id v6 = v4;
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)buf = 0u;
  long long v21 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    uint64_t v13 = 0;
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

uint64_t __70__CSSecureSiriAudioProvidingProxy_stopSecureMobileAssetLoaderService___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  if (v2)
  {
    uint64_t v3 = [*(id *)(result + 32) convertAssetConfigurationError:a2];
    id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

- (void)startSecureMobileAssetLoaderService:(BOOL)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24C764000, v6, OS_LOG_TYPE_DEFAULT, byte_24C76E621, buf, 2u);
  }
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __82__CSSecureSiriAudioProvidingProxy_startSecureMobileAssetLoaderService_completion___block_invoke;
  long long v11 = &unk_2652EA7E0;
  id v12 = self;
  id v13 = v5;
  id v7 = v5;
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  uint64_t v27 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  *(_OWORD *)buf = 0u;
  long long v22 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_encode_BOOL();
    tb_message_complete();
    uint64_t v14 = 0;
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

uint64_t __82__CSSecureSiriAudioProvidingProxy_startSecureMobileAssetLoaderService_completion___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  if (v2)
  {
    uint64_t v3 = [*(id *)(result + 32) convertAssetConfigurationError:a2];
    id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

- (void)setAssetForLocale:(id)a3 isOTA:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v6;
    _os_log_impl(&dword_24C764000, v10, OS_LOG_TYPE_DEFAULT, "Siri locale:%@, isOTA:%d", buf, 0x12u);
  }
  long long v11 = [v8 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  if ([v11 caseInsensitiveCompare:@"ar-AE"])
  {
    if ([v11 caseInsensitiveCompare:@"ar-SA"])
    {
      if ([v11 caseInsensitiveCompare:@"da-DK"])
      {
        if ([v11 caseInsensitiveCompare:@"de-AT"])
        {
          if ([v11 caseInsensitiveCompare:@"de-DE"])
          {
            if ([v11 caseInsensitiveCompare:@"de-CH"])
            {
              if ([v11 caseInsensitiveCompare:@"en-IN"])
              {
                uint64_t v12 = 0x7AB3544148B1E1B7;
                if ([v11 caseInsensitiveCompare:@"en-US"])
                {
                  if ([v11 caseInsensitiveCompare:@"en-CA"])
                  {
                    if ([v11 caseInsensitiveCompare:@"en-AU"])
                    {
                      if ([v11 caseInsensitiveCompare:@"en-GB"])
                      {
                        if ([v11 caseInsensitiveCompare:@"en-SG"])
                        {
                          if ([v11 caseInsensitiveCompare:@"en-IE"])
                          {
                            if ([v11 caseInsensitiveCompare:@"en-ZA"])
                            {
                              if ([v11 caseInsensitiveCompare:@"en-NZ"])
                              {
                                if ([v11 caseInsensitiveCompare:@"es-ES"])
                                {
                                  if ([v11 caseInsensitiveCompare:@"es-US"])
                                  {
                                    if ([v11 caseInsensitiveCompare:@"es-CL"])
                                    {
                                      if ([v11 caseInsensitiveCompare:@"es-MX"])
                                      {
                                        if ([v11 caseInsensitiveCompare:@"fi-FI"])
                                        {
                                          if ([v11 caseInsensitiveCompare:@"fr-BE"])
                                          {
                                            if ([v11 caseInsensitiveCompare:@"fr-CA"])
                                            {
                                              if ([v11 caseInsensitiveCompare:@"fr-CH"])
                                              {
                                                if ([v11 caseInsensitiveCompare:@"fr-FR"])
                                                {
                                                  if ([v11 caseInsensitiveCompare:@"he-IL"])
                                                  {
                                                    if ([v11 caseInsensitiveCompare:@"it-IT"])
                                                    {
                                                      if ([v11 caseInsensitiveCompare:@"it-CH"])
                                                      {
                                                        if ([v11 caseInsensitiveCompare:@"ja-JP"])
                                                        {
                                                          if ([v11 caseInsensitiveCompare:@"ko-KR"])
                                                          {
                                                            if ([v11 caseInsensitiveCompare:@"ms-MY"])
                                                            {
                                                              if ([v11 caseInsensitiveCompare:@"nb-NO"])
                                                              {
                                                                if ([v11 caseInsensitiveCompare:@"nl-BE"])
                                                                {
                                                                  if ([v11 caseInsensitiveCompare:@"nl-NL"])
                                                                  {
                                                                    if ([v11 caseInsensitiveCompare:@"pt-BR"])
                                                                    {
                                                                      if ([v11 caseInsensitiveCompare:@"ru-RU"])
                                                                      {
                                                                        if ([v11 caseInsensitiveCompare:@"sv-SE"])
                                                                        {
                                                                          if ([v11 caseInsensitiveCompare:@"th-TH"])
                                                                          {
                                                                            if ([v11 caseInsensitiveCompare:@"tr-TR"])
                                                                            {
                                                                              if ([v11 caseInsensitiveCompare:@"yue-CN"])
                                                                              {
                                                                                if ([v11 caseInsensitiveCompare:@"zh-CN"])
                                                                                {
                                                                                  if ([v11 caseInsensitiveCompare:@"zh-TW"])
                                                                                  {
                                                                                    if ([v11 caseInsensitiveCompare:@"zh-HK"])
                                                                                    {
                                                                                      if ([v11 caseInsensitiveCompare:@"vi-VN"])
                                                                                      {
                                                                                        id v13 = (void *)sLog;
                                                                                        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
                                                                                        {
                                                                                          id v14 = v8;
                                                                                          long long v15 = v13;
                                                                                          uint64_t v16 = [v14 UTF8String];
                                                                                          *(_DWORD *)buf = 136315138;
                                                                                          *(void *)&buf[4] = v16;
                                                                                          _os_log_impl(&dword_24C764000, v15, OS_LOG_TYPE_DEFAULT, "Error: Invalid locale %s. Falling back to en-US", buf, 0xCu);
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        uint64_t v12 = 0xDCCBE59234188423;
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      uint64_t v12 = 0x91EC7732FD261E2ELL;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    uint64_t v12 = 0x656AA29B2034004ELL;
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  uint64_t v12 = 0xA123AEFB86EACA53;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                uint64_t v12 = 0x113C060897761B63;
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              uint64_t v12 = 0x42841AE7412F624ELL;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            uint64_t v12 = 0x418732BF980FEFD2;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          uint64_t v12 = 0xE1B29391201EDA1DLL;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        uint64_t v12 = 0x3D3D863DC239E3ELL;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      uint64_t v12 = 0x6B4AA5139D1C4BLL;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    uint64_t v12 = 0xE5ABCB70FB0576BALL;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  uint64_t v12 = 0xA13AE2AABE773446;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                uint64_t v12 = 0xFC78C82705D56FD3;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              uint64_t v12 = 0xD124D0A81190947FLL;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            uint64_t v12 = 0x5DEB4BD3591B78E4;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          uint64_t v12 = 0x8F1538728B7CDEA4;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        uint64_t v12 = 0xD1729F554A45BDECLL;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      uint64_t v12 = 0x78DF870862C02B92;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    uint64_t v12 = 0xE1551273F2C8F91;
                                                  }
                                                }
                                                else
                                                {
                                                  uint64_t v12 = 0xD76D6E510A1C7BE3;
                                                }
                                              }
                                              else
                                              {
                                                uint64_t v12 = 0x9FB4FE7B8C107ED7;
                                              }
                                            }
                                            else
                                            {
                                              uint64_t v12 = 0xFBAF50BAF192177FLL;
                                            }
                                          }
                                          else
                                          {
                                            uint64_t v12 = 0x9D4B7954B05BFDBELL;
                                          }
                                        }
                                        else
                                        {
                                          uint64_t v12 = 0xAACEDDC4B24F04BBLL;
                                        }
                                      }
                                      else
                                      {
                                        uint64_t v12 = 0xCC92900C433FE06DLL;
                                      }
                                    }
                                    else
                                    {
                                      uint64_t v12 = 0xF939AE07D1B76443;
                                    }
                                  }
                                  else
                                  {
                                    uint64_t v12 = 0x19DBCC66CD1226D8;
                                  }
                                }
                                else
                                {
                                  uint64_t v12 = 0x1BF81CE64F07AF5FLL;
                                }
                              }
                              else
                              {
                                uint64_t v12 = 0xDA26D915BB129394;
                              }
                            }
                            else
                            {
                              uint64_t v12 = 0xB76BD80C1D29A5DDLL;
                            }
                          }
                          else
                          {
                            uint64_t v12 = 0xEBD1015A2B9EB77CLL;
                          }
                        }
                        else
                        {
                          uint64_t v12 = 0xD53D863AB432198BLL;
                        }
                      }
                      else
                      {
                        uint64_t v12 = 0x2AC83335E2A52E86;
                      }
                    }
                    else
                    {
                      uint64_t v12 = 0x84035BF99132125ELL;
                    }
                  }
                  else
                  {
                    uint64_t v12 = 0x2F2B502739B04599;
                  }
                }
              }
              else
              {
                uint64_t v12 = 0x88394872043826BDLL;
              }
            }
            else
            {
              uint64_t v12 = 0xC89696D3BDD2FCF0;
            }
          }
          else
          {
            uint64_t v12 = 0x8E9889B77234E947;
          }
        }
        else
        {
          uint64_t v12 = 0x7F5D3A1A2CB8F720;
        }
      }
      else
      {
        uint64_t v12 = 0x714EE36D8BEDD13ELL;
      }
    }
    else
    {
      uint64_t v12 = 0x1AC4EDF324CC3F83;
    }
  }
  else
  {
    uint64_t v12 = 0xF7A18E1D22D08A91;
  }
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  long long v21 = __70__CSSecureSiriAudioProvidingProxy_setAssetForLocale_isOTA_completion___block_invoke;
  long long v22 = &unk_2652EA7E0;
  long long v23 = self;
  id v24 = v9;
  id v17 = v9;
  uint64_t v31 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  uint64_t v37 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  memset(buf, 0, sizeof(buf));
  if (tb_client_connection_message_construct()) {
    goto LABEL_151;
  }
  tb_message_encode_u64();
  tb_message_encode_u64();
  if (v12 <= (uint64_t)0xEBD1015A2B9EB77BLL)
  {
    if (v12 <= (uint64_t)0xB76BD80C1D29A5DCLL)
    {
      if (v12 > (uint64_t)0x9D4B7954B05BFDBDLL)
      {
        if (v12 > (uint64_t)0xA123AEFB86EACA52)
        {
          if (v12 == 0xA123AEFB86EACA53 || v12 == 0xA13AE2AABE773446) {
            goto LABEL_150;
          }
          unint64_t v18 = 0xAACEDDC4B24F04BBLL;
          goto LABEL_149;
        }
        if (v12 != 0x9D4B7954B05BFDBELL)
        {
          unint64_t v18 = 0x9FB4FE7B8C107ED7;
          goto LABEL_149;
        }
      }
      else
      {
        if (v12 > (uint64_t)0x8E9889B77234E946)
        {
          if (v12 == 0x8E9889B77234E947 || v12 == 0x8F1538728B7CDEA4) {
            goto LABEL_150;
          }
          unint64_t v18 = 0x91EC7732FD261E2ELL;
          goto LABEL_149;
        }
        if (v12 != 0x84035BF99132125ELL)
        {
          unint64_t v18 = 0x88394872043826BDLL;
          goto LABEL_149;
        }
      }
    }
    else
    {
      if (v12 > (uint64_t)0xD53D863AB432198ALL)
      {
        if (v12 > (uint64_t)0xDCCBE59234188422)
        {
          if (v12 == 0xDCCBE59234188423 || v12 == 0xE1B29391201EDA1DLL) {
            goto LABEL_150;
          }
          unint64_t v18 = 0xE5ABCB70FB0576BALL;
        }
        else
        {
          if (v12 == 0xD53D863AB432198BLL || v12 == 0xD76D6E510A1C7BE3) {
            goto LABEL_150;
          }
          unint64_t v18 = 0xDA26D915BB129394;
        }
        goto LABEL_149;
      }
      if (v12 > (uint64_t)0xCC92900C433FE06CLL)
      {
        if (v12 == 0xCC92900C433FE06DLL || v12 == 0xD124D0A81190947FLL) {
          goto LABEL_150;
        }
        unint64_t v18 = 0xD1729F554A45BDECLL;
        goto LABEL_149;
      }
      if (v12 != 0xB76BD80C1D29A5DDLL)
      {
        unint64_t v18 = 0xC89696D3BDD2FCF0;
        goto LABEL_149;
      }
    }
    goto LABEL_150;
  }
  if (v12 > 0x1BF81CE64F07AF5ELL)
  {
    if (v12 > 0x5DEB4BD3591B78E3)
    {
      if (v12 > 0x78DF870862C02B91)
      {
        if (v12 == 0x78DF870862C02B92 || v12 == 0x7AB3544148B1E1B7) {
          goto LABEL_150;
        }
        unint64_t v18 = 0x7F5D3A1A2CB8F720;
      }
      else
      {
        if (v12 == 0x5DEB4BD3591B78E4 || v12 == 0x656AA29B2034004ELL) {
          goto LABEL_150;
        }
        unint64_t v18 = 0x714EE36D8BEDD13ELL;
      }
      goto LABEL_149;
    }
    if (v12 > 0x2F2B502739B04598)
    {
      if (v12 == 0x2F2B502739B04599 || v12 == 0x418732BF980FEFD2) {
        goto LABEL_150;
      }
      unint64_t v18 = 0x42841AE7412F624ELL;
      goto LABEL_149;
    }
    if (v12 != 0x1BF81CE64F07AF5FLL)
    {
      unint64_t v18 = 0x2AC83335E2A52E86;
      goto LABEL_149;
    }
    goto LABEL_150;
  }
  if (v12 <= 0x6B4AA5139D1C4ALL)
  {
    if (v12 > (uint64_t)0xF939AE07D1B76442)
    {
      if (v12 == 0xF939AE07D1B76443 || v12 == 0xFBAF50BAF192177FLL) {
        goto LABEL_150;
      }
      unint64_t v18 = 0xFC78C82705D56FD3;
      goto LABEL_149;
    }
    if (v12 != 0xEBD1015A2B9EB77CLL)
    {
      unint64_t v18 = 0xF7A18E1D22D08A91;
      goto LABEL_149;
    }
LABEL_150:
    tb_message_encode_BOOL();
    tb_message_complete();
    uint64_t v25 = 0;
    tb_connection_send_query();
    tb_client_connection_message_destruct();
LABEL_151:

    return;
  }
  if (v12 > 0x113C060897761B62)
  {
    if (v12 == 0x113C060897761B63 || v12 == 0x19DBCC66CD1226D8) {
      goto LABEL_150;
    }
    unint64_t v18 = 0x1AC4EDF324CC3F83;
  }
  else
  {
    if (v12 == 0x6B4AA5139D1C4BLL || v12 == 0x3D3D863DC239E3ELL) {
      goto LABEL_150;
    }
    unint64_t v18 = 0xE1551273F2C8F91;
  }
LABEL_149:
  if (v12 == v18) {
    goto LABEL_150;
  }
  printf("TB_FATAL: invalid value: unexpected case value, %llx (%s:%d)\n", v12, "/Library/Caches/com.apple.xbs/Binaries/CoreSpeech_Common/install/TempContent/Objects/CoreSpeech.build/CoreSpeechExclave.build/DerivedSources/CoreSpeechExclave_C.c", 460);
  _os_crash();
  __break(1u);
}

uint64_t __70__CSSecureSiriAudioProvidingProxy_setAssetForLocale_isOTA_completion___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  if (v2)
  {
    uint64_t v3 = [*(id *)(result + 32) convertAssetConfigurationError:a2];
    id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

- (unint64_t)convertAssetConfigurationError:(unint64_t)a3
{
  uint64_t v3 = 4;
  if (a3 != 0x59D7251024B02BCBLL) {
    uint64_t v3 = 0;
  }
  if (a3 == 0x497F1942F7514C1FLL) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = v3;
  }
  if (a3 == 0xA510336A75EF1B48) {
    unint64_t v5 = 3;
  }
  else {
    unint64_t v5 = a3 == 0xE3C7F6520C58DE7FLL;
  }
  if ((uint64_t)a3 <= 0x497F1942F7514C1ELL) {
    return v5;
  }
  else {
    return v4;
  }
}

- (BOOL)setSpeakerProfile:(id)a3 numEmbeddings:(unint64_t)a4 dimension:(unint64_t)a5 speakerRecognizerType:(unint64_t)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v23 = 0;
  v21[0] = 3;
  int v24 = a4;
  int v25 = a5;
  unint64_t v26 = [(CSSecureSiriAudioProvidingProxy *)self convertSecureSpeakerRecognitionType:a6];
  id v11 = v10;
  v21[1] = [v11 bytes];
  long long v22 = a5 * a4;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  unint64_t v18 = __99__CSSecureSiriAudioProvidingProxy_setSpeakerProfile_numEmbeddings_dimension_speakerRecognizerType___block_invoke;
  uint64_t v19 = &unk_2652EA718;
  uint64_t v20 = &v27;
  *(void *)&long long v31 = 0;
  *((void *)&v31 + 1) = &v31;
  long long v32 = 0x2000000000uLL;
  *(void *)&long long buf = MEMORY[0x263EF8330];
  *((void *)&buf + 1) = 0x40000000;
  *(void *)&long long v41 = __f32__v_sizeof_block_invoke;
  *((void *)&v41 + 1) = &unk_2652EA858;
  *(void *)&long long v42 = &v31;
  f32__v_visit((unsigned __int8 *)v21, (uint64_t)&buf);
  _Block_object_dispose(&v31, 8);
  uint64_t v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  uint64_t v46 = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long buf = 0u;
  long long v41 = 0u;
  if (tb_client_connection_message_construct()) {
    goto LABEL_6;
  }
  tb_message_encode_u64();
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2000000000;
  v39[3] = 0;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 0x40000000;
  v38[2] = __f32__v_encode_block_invoke;
  v38[3] = &unk_2652EA880;
  v38[4] = v39;
  f32__v_visit((unsigned __int8 *)v21, (uint64_t)v38);
  tb_message_encode_u64();
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 0x40000000;
  v37[2] = __f32__v_encode_block_invoke_2;
  v37[3] = &__block_descriptor_tmp_111;
  v37[4] = &v31;
  f32__v_visit((unsigned __int8 *)v21, (uint64_t)v37);
  _Block_object_dispose(v39, 8);
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u64();
  if (v26 == 0xB4634D822B7084E5 || v26 == 0x5FE91FEE7BE681E1)
  {
    tb_message_complete();
    v38[0] = 0;
    int v12 = tb_connection_send_query();
    if ((v12 & 0xFFFFFFF7) != 0 || (int v16 = v12, !v38[0]))
    {
      tb_client_connection_message_destruct();
    }
    else
    {
      LOBYTE(v37[0]) = 0;
      tb_message_decode_BOOL();
      v18((uint64_t)v17, v37[0]);
      tb_client_connection_message_destruct();
      if (!v16)
      {
        BOOL v14 = *((unsigned char *)v28 + 24) != 0;
LABEL_9:
        _Block_object_dispose(&v27, 8);

        return v14;
      }
    }
LABEL_6:
    id v13 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_24C764000, v13, OS_LOG_TYPE_ERROR, "Failed to setSpeakerProfileEmbedding", (uint8_t *)&buf, 2u);
    }
    BOOL v14 = 0;
    goto LABEL_9;
  }
  printf("TB_FATAL: invalid value: unexpected case value, %llx (%s:%d)\n", v26, "/Library/Caches/com.apple.xbs/Binaries/CoreSpeech_Common/install/TempContent/Objects/CoreSpeech.build/CoreSpeechExclave.build/DerivedSources/CoreSpeechExclave_C.c", 1408);
  BOOL result = _os_crash();
  __break(1u);
  return result;
}

uint64_t __99__CSSecureSiriAudioProvidingProxy_setSpeakerProfile_numEmbeddings_dimension_speakerRecognizerType___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)convertSecureSpeakerRecognitionType:(unint64_t)a3
{
  if (a3 == 1) {
    return 0xB4634D822B7084E5;
  }
  else {
    return 0x5FE91FEE7BE681E1;
  }
}

- (void)processSecondPassVoiceTriggerWithShouldFlushAudio:(BOOL)a3 result:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  unint64_t v5 = (void (**)(void, __n128, __n128, __n128, __n128))a4;
  uint64_t v17 = 0;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x5810000000;
  uint64_t v20 = "";
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v24 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  BOOL v14 = __92__CSSecureSiriAudioProvidingProxy_processSecondPassVoiceTriggerWithShouldFlushAudio_result___block_invoke;
  long long v15 = &unk_2652EA7B8;
  int v16 = &v17;
  uint64_t v37 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  uint64_t v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_encode_BOOL();
    tb_message_complete();
    uint64_t v31 = 0;
    if ((tb_connection_send_query() & 0xFFFFFFF7) != 0 || !v31)
    {
LABEL_15:
      tb_client_connection_message_destruct();
      if (!v5) {
        goto LABEL_20;
      }
      goto LABEL_16;
    }
    uint64_t v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    tb_message_decode_u64();
    if ((uint64_t)v27 > 0x43C058BACB7D6B7CLL)
    {
      if ((void)v27 == 0x43C058BACB7D6B7DLL) {
        goto LABEL_14;
      }
      unint64_t v6 = 0x6BD17EE2BE106C2DLL;
    }
    else
    {
      if ((void)v27 == 0x9D58721FFF2EF4B1)
      {
        tb_message_decode_u64();
        tb_message_decode_f64();
        tb_message_decode_u32();
        tb_message_decode_f32();
        tb_message_decode_f32();
        tb_message_decode_f32();
        tb_message_decode_u64();
        tb_message_decode_u64();
        goto LABEL_14;
      }
      unint64_t v6 = 0xDC70BE53C73C2A43;
    }
    if ((void)v27 != v6) {
      goto LABEL_15;
    }
LABEL_14:
    v25[0] = v27;
    v25[1] = v28;
    v25[2] = v29;
    uint64_t v26 = v30;
    v14((uint64_t)&v12, (uint64_t)v25);
    goto LABEL_15;
  }
  if (!v5) {
    goto LABEL_20;
  }
LABEL_16:
  long long v7 = *((_OWORD *)v18 + 3);
  long long v38 = *((_OWORD *)v18 + 2);
  long long v39 = v7;
  long long v40 = *((_OWORD *)v18 + 4);
  *(void *)&long long v41 = v18[10];
  if (-[CSSecureSiriAudioProvidingProxy convertSecureSecondPassVoiceTriggerResultType:](self, "convertSecureSecondPassVoiceTriggerResultType:", &v38, v12, v13))
  {
    v9.n128_u64[0] = 0;
    v8.n128_u64[0] = 0;
    v10.n128_u64[0] = 0;
    v11.n128_u64[0] = 0;
  }
  else
  {
    v8.n128_u64[0] = v18[6];
    v9.n128_u32[0] = *((_DWORD *)v18 + 15);
    v10.n128_u32[0] = *((_DWORD *)v18 + 16);
    v11.n128_u32[0] = *((_DWORD *)v18 + 17);
  }
  v5[2](v5, v8, v9, v10, v11);
LABEL_20:
  _Block_object_dispose(&v17, 8);
}

__n128 __92__CSSecureSiriAudioProvidingProxy_processSecondPassVoiceTriggerWithShouldFlushAudio_result___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)a2;
  long long v4 = *(_OWORD *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(void *)(v2 + 80) = *(void *)(a2 + 48);
  *(_OWORD *)(v2 + 48) = v4;
  *(_OWORD *)(v2 + 64) = v5;
  *(__n128 *)(v2 + 32) = result;
  return result;
}

- (unint64_t)convertSecureSecondPassVoiceTriggerResultType:(corespeechexclave_voicetriggersecondpassresult_s *)a3
{
  unint64_t var0 = a3->var0;
  unint64_t v4 = 2;
  if (a3->var0 == 0x9D58721FFF2EF4B1) {
    unint64_t v4 = 0;
  }
  if (var0 == 0xDC70BE53C73C2A43) {
    unint64_t v4 = 3;
  }
  if (var0 == 0x43C058BACB7D6B7DLL) {
    return 1;
  }
  else {
    return v4;
  }
}

- (void)stopSecondPassVoiceTrigger
{
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

- (void)startSecondPassVoiceTriggerWithStartOption:(id)a3
{
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_encode_u64();
    tb_message_encode_BOOL();
    tb_message_encode_BOOL();
    tb_message_encode_u32();
    tb_message_complete();
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

- (BOOL)initializeSecondPass
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  __n128 v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  long long v5 = __55__CSSecureSiriAudioProvidingProxy_initializeSecondPass__block_invoke;
  unint64_t v6 = &unk_2652EA718;
  long long v7 = &v8;
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    uint64_t v13 = 0;
    if ((tb_connection_send_query() & 0xFFFFFFF7) == 0 && v13)
    {
      char v12 = 0;
      tb_message_decode_BOOL();
      v5((uint64_t)v4, v12);
    }
    tb_client_connection_message_destruct();
  }
  char v2 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v2;
}

uint64_t __55__CSSecureSiriAudioProvidingProxy_initializeSecondPass__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)resetFirstPassVoiceTrigger
{
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

- (void)processBargeInVoiceTriggerWithResult:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3810000000;
  long long v17 = "";
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  char v11 = __72__CSSecureSiriAudioProvidingProxy_processBargeInVoiceTriggerWithResult___block_invoke;
  char v12 = &unk_2652EA790;
  uint64_t v13 = &v14;
  corespeechexclave_sirivoicetriggerservice_bargeinprocess();
  long long v7 = *((_OWORD *)v15 + 2);
  uint64_t v8 = v15[6];
  unint64_t v5 = [(CSSecureSiriAudioProvidingProxy *)self convertSecureBargeInVoiceTriggerResultType:&v7];
  if (v4)
  {
    if (v5)
    {
      (*((void (**)(id, unint64_t, void, void))v4 + 2))(v4, v5, 0, 0);
    }
    else
    {
      unint64_t v6 = v15 + 5;
      if (v15[4] != 0x1276D876C927FCBELL) {
        unint64_t v6 = 0;
      }
      (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, *v6, *((unsigned int *)v6 + 2));
    }
  }
  _Block_object_dispose(&v14, 8);
}

__n128 __72__CSSecureSiriAudioProvidingProxy_processBargeInVoiceTriggerWithResult___block_invoke(uint64_t a1, __n128 *a2)
{
  char v2 = *(__n128 **)(*(void *)(a1 + 32) + 8);
  __n128 result = *a2;
  v2[3].n128_u64[0] = a2[1].n128_u64[0];
  v2[2] = result;
  return result;
}

- (unint64_t)processBargeInVoiceTrigger
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3810000000;
  uint64_t v16 = "";
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_24C764000, v3, OS_LOG_TYPE_DEFAULT, "IsolatedCoreAudioClient process barge-in", (uint8_t *)&v6, 2u);
  }
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __61__CSSecureSiriAudioProvidingProxy_processBargeInVoiceTrigger__block_invoke;
  char v11 = &unk_2652EA790;
  char v12 = &v13;
  corespeechexclave_sirivoicetriggerservice_bargeinprocess();
  long long v6 = *((_OWORD *)v14 + 2);
  uint64_t v7 = v14[6];
  unint64_t v4 = [(CSSecureSiriAudioProvidingProxy *)self convertSecureBargeInVoiceTriggerResultType:&v6];
  _Block_object_dispose(&v13, 8);
  return v4;
}

__n128 __61__CSSecureSiriAudioProvidingProxy_processBargeInVoiceTrigger__block_invoke(uint64_t a1, __n128 *a2)
{
  char v2 = *(__n128 **)(*(void *)(a1 + 32) + 8);
  __n128 result = *a2;
  v2[3].n128_u64[0] = a2[1].n128_u64[0];
  v2[2] = result;
  return result;
}

- (unint64_t)convertSecureBargeInVoiceTriggerResultType:(corespeechexclave_bargeinvoicetriggerresult_s *)a3
{
  return a3->var0 != 0x1276D876C927FCBELL;
}

- (void)stopBargeInVoiceTrigger
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v2 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_24C764000, v2, OS_LOG_TYPE_DEFAULT, "IsolatedCoreAudioClient BargeIn stop", buf, 2u);
  }
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  *(_OWORD *)long long buf = 0u;
  long long v4 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

- (void)startBargeInVoiceTrigger
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v2 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_24C764000, v2, OS_LOG_TYPE_DEFAULT, "IsolatedCoreAudioClient BargeIn start", buf, 2u);
  }
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  *(_OWORD *)long long buf = 0u;
  long long v4 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

- (void)fetchAOPVoiceTriggerResult:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v4 = v3;
  if (v3)
  {
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    long long v7 = __62__CSSecureSiriAudioProvidingProxy_fetchAOPVoiceTriggerResult___block_invoke;
    long long v8 = &unk_2652EA768;
    id v9 = v3;
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    uint64_t v23 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    if (!tb_client_connection_message_construct())
    {
      tb_message_encode_u64();
      tb_message_complete();
      uint64_t v10 = 0;
      tb_connection_send_query();
      tb_client_connection_message_destruct();
    }
  }
}

uint64_t __62__CSSecureSiriAudioProvidingProxy_fetchAOPVoiceTriggerResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)configAOPVoiceTrigger
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  uint64_t v5 = __56__CSSecureSiriAudioProvidingProxy_configAOPVoiceTrigger__block_invoke;
  uint64_t v6 = &unk_2652EA718;
  long long v7 = &v8;
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    uint64_t v13 = 0;
    if ((tb_connection_send_query() & 0xFFFFFFF7) == 0 && v13)
    {
      char v12 = 0;
      tb_message_decode_BOOL();
      v5((uint64_t)v4, v12);
    }
    tb_client_connection_message_destruct();
  }
  char v2 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v2;
}

uint64_t __56__CSSecureSiriAudioProvidingProxy_configAOPVoiceTrigger__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)fetchAndStoreAudioBuffer
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  uint64_t v5 = __59__CSSecureSiriAudioProvidingProxy_fetchAndStoreAudioBuffer__block_invoke;
  uint64_t v6 = &unk_2652EA718;
  long long v7 = &v8;
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    uint64_t v13 = 0;
    if ((tb_connection_send_query() & 0xFFFFFFF7) == 0 && v13)
    {
      char v12 = 0;
      tb_message_decode_BOOL();
      v5((uint64_t)v4, v12);
    }
    tb_client_connection_message_destruct();
  }
  char v2 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v2;
}

uint64_t __59__CSSecureSiriAudioProvidingProxy_fetchAndStoreAudioBuffer__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)requestHistoricalAudioBufferWithStartSample:(unint64_t)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a4;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2810000000;
  char v12 = "";
  uint64_t v13 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  uint64_t v6 = __90__CSSecureSiriAudioProvidingProxy_requestHistoricalAudioBufferWithStartSample_completion___block_invoke;
  long long v7 = &unk_2652EA740;
  uint64_t v8 = &v9;
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  uint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  if (tb_client_connection_message_construct())
  {
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  tb_message_encode_u64();
  tb_message_encode_u64();
  tb_message_complete();
  uint64_t v15 = 0;
  if ((tb_connection_send_query() & 0xFFFFFFF7) == 0 && v15)
  {
    uint64_t v14 = 0;
    tb_message_decode_u32();
    tb_message_decode_u32();
    v6((uint64_t)v5, v14);
  }
  tb_client_connection_message_destruct();
  if (v4) {
LABEL_8:
  }
    (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned int *)v10 + 8), *((unsigned int *)v10 + 9));
LABEL_9:
  _Block_object_dispose(&v9, 8);
}

uint64_t __90__CSSecureSiriAudioProvidingProxy_requestHistoricalAudioBufferWithStartSample_completion___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 32) = a2;
  return result;
}

- (BOOL)prepare:(int)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  switch(a3)
  {
    case 14:
      uint64_t v3 = 0xD6613FF83D8E2F88;
      break;
    case 4:
      uint64_t v3 = 0x1469D4460360BC17;
      break;
    case 2:
      uint64_t v3 = 0x1BE64C0ED6CCA264;
      break;
    default:
      uint64_t v3 = 0x676FBAD1519B8185;
      break;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  uint64_t v8 = __43__CSSecureSiriAudioProvidingProxy_prepare___block_invoke;
  uint64_t v9 = &unk_2652EA718;
  uint64_t v10 = &v11;
  uint64_t v22 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  if (tb_client_connection_message_construct())
  {
LABEL_19:
    char v5 = *((unsigned char *)v12 + 24);
    _Block_object_dispose(&v11, 8);
    return v5;
  }
  tb_message_encode_u64();
  tb_message_encode_u64();
  if (v3 <= 0x1BE64C0ED6CCA263)
  {
    if (v3 != 0xD6613FF83D8E2F88)
    {
      uint64_t v4 = 0x1469D4460360BC17;
      goto LABEL_14;
    }
LABEL_15:
    tb_message_complete();
    uint64_t v16 = 0;
    if ((tb_connection_send_query() & 0xFFFFFFF7) == 0)
    {
      if (v16)
      {
        char v15 = 0;
        tb_message_decode_BOOL();
        v8((uint64_t)v7, v15);
      }
    }
    tb_client_connection_message_destruct();
    goto LABEL_19;
  }
  if (v3 == 0x1BE64C0ED6CCA264) {
    goto LABEL_15;
  }
  uint64_t v4 = 0x676FBAD1519B8185;
LABEL_14:
  if (v3 == v4) {
    goto LABEL_15;
  }
  printf("TB_FATAL: invalid value: unexpected case value, %llx (%s:%d)\n", v3, "/Library/Caches/com.apple.xbs/Binaries/CoreSpeech_Common/install/TempContent/Objects/CoreSpeech.build/CoreSpeechExclave.build/DerivedSources/CoreSpeechExclave_C.c", 2419);
  BOOL result = _os_crash();
  __break(1u);
  return result;
}

uint64_t __43__CSSecureSiriAudioProvidingProxy_prepare___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (CSSecureSiriAudioProvidingProxy)init
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ((os_variant_is_darwinos() & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)CSSecureSiriAudioProvidingProxy;
    self = [(CSSecureSiriAudioProvidingProxy *)&v11 init];
    if (self)
    {
      os_log_t v3 = os_log_create("com.apple.corespeech", "Framework");
      uint64_t v4 = (void *)sLog;
      sLog = (uint64_t)v3;

      int v5 = tb_conclave_endpoint_for_service();
      uint64_t v6 = sLog;
      if (v5)
      {
        int v7 = v5;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 67109120;
          int v13 = v7;
          _os_log_error_impl(&dword_24C764000, v6, OS_LOG_TYPE_ERROR, "IsolatedCoreAudioClient could not launch conclave with error %d!!!", buf, 8u);
        }
        goto LABEL_6;
      }
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_24C764000, v6, OS_LOG_TYPE_DEFAULT, "IsolatedCoreAudioClient conclave successfully launched!", buf, 2u);
      }
      tb_endpoint_set_interface_identifier();
      uint64_t v9 = (tb_connection_s *)tb_client_connection_create_with_endpoint();
      if (!tb_client_connection_activate()) {
        self->_service.connection = v9;
      }
    }
    self = self;
    uint64_t v8 = self;
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v8 = 0;
LABEL_12:

  return v8;
}

@end