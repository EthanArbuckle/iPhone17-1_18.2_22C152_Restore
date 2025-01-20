@interface IDSQuickRelayFixedTokenAllocator
- (BOOL)_isSessionInfoValid:(id)a3;
- (IDSQuickRelayFixedTokenAllocator)initWithDefaults;
- (IDSQuickRelayFixedTokenAllocator)initWithDictionary:(id)a3;
- (NSData)appleID;
- (NSData)relayIP;
- (NSData)relayIPv6;
- (NSData)relaySessionID;
- (NSData)relaySessionKey;
- (NSData)relaySessionToken;
- (NSNumber)relayCombinedSoftwareID;
- (NSNumber)relayPort;
- (id)_parseQuickRelayDefaults;
- (void)_setAllValuesFromDictionary:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setRelayCombinedSoftwareID:(id)a3;
- (void)setRelayIP:(id)a3;
- (void)setRelayIPv6:(id)a3;
- (void)setRelayPort:(id)a3;
- (void)setRelaySessionID:(id)a3;
- (void)setRelaySessionKey:(id)a3;
- (void)setRelaySessionToken:(id)a3;
@end

@implementation IDSQuickRelayFixedTokenAllocator

- (IDSQuickRelayFixedTokenAllocator)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (_IDSRunningInDaemon())
  {
    v5 = +[IDSTransportLog QRAllocator];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2DE10();
    }

    goto LABEL_9;
  }
  v9.receiver = self;
  v9.super_class = (Class)IDSQuickRelayFixedTokenAllocator;
  v6 = [(IDSQuickRelayFixedTokenAllocator *)&v9 init];
  self = v6;
  if (v6)
  {
    if (![(IDSQuickRelayFixedTokenAllocator *)v6 _isSessionInfoValid:v4])
    {
LABEL_9:
      v7 = 0;
      goto LABEL_10;
    }
    [(IDSQuickRelayFixedTokenAllocator *)self _setAllValuesFromDictionary:v4];
  }
  self = self;
  v7 = self;
LABEL_10:

  return v7;
}

- (IDSQuickRelayFixedTokenAllocator)initWithDefaults
{
  if (_IDSRunningInDaemon())
  {
    v3 = +[IDSTransportLog QRAllocator];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_191A2DE10();
    }
    id v4 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IDSQuickRelayFixedTokenAllocator;
    v5 = [(IDSQuickRelayFixedTokenAllocator *)&v8 init];
    if (!v5) {
      return 0;
    }
    v6 = v5;
    v3 = [(IDSQuickRelayFixedTokenAllocator *)v5 _parseQuickRelayDefaults];
    self = [(IDSQuickRelayFixedTokenAllocator *)v6 initWithDictionary:v3];
    id v4 = self;
  }

  return v4;
}

- (void)_setAllValuesFromDictionary:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F6B6C8];
  id v5 = a3;
  v6 = [v5 objectForKey:v4];
  [(IDSQuickRelayFixedTokenAllocator *)self setRelayIP:v6];

  v7 = [v5 objectForKey:*MEMORY[0x1E4F6B6D8]];
  [(IDSQuickRelayFixedTokenAllocator *)self setRelayPort:v7];

  objc_super v8 = [v5 objectForKey:*MEMORY[0x1E4F6B6F0]];
  [(IDSQuickRelayFixedTokenAllocator *)self setRelaySessionToken:v8];

  objc_super v9 = [v5 objectForKey:*MEMORY[0x1E4F6B6E8]];
  [(IDSQuickRelayFixedTokenAllocator *)self setRelaySessionKey:v9];

  v10 = [v5 objectForKey:*MEMORY[0x1E4F6B6E0]];
  [(IDSQuickRelayFixedTokenAllocator *)self setRelaySessionID:v10];

  v11 = [v5 objectForKey:*MEMORY[0x1E4F6B6D0]];
  [(IDSQuickRelayFixedTokenAllocator *)self setRelayCombinedSoftwareID:v11];

  id v12 = [v5 objectForKey:*MEMORY[0x1E4F6B6B0]];

  [(IDSQuickRelayFixedTokenAllocator *)self setAppleID:v12];
}

- (BOOL)_isSessionInfoValid:(id)a3
{
  v20[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = *MEMORY[0x1E4F6B6D8];
    v20[0] = *MEMORY[0x1E4F6B6C8];
    v20[1] = v4;
    uint64_t v5 = *MEMORY[0x1E4F6B6E8];
    v20[2] = *MEMORY[0x1E4F6B6F0];
    v20[3] = v5;
    uint64_t v6 = *MEMORY[0x1E4F6B6D0];
    v20[4] = *MEMORY[0x1E4F6B6E0];
    v20[5] = v6;
    v20[6] = *MEMORY[0x1E4F6B6B0];
    [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:7];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = objc_msgSend(v3, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);

          if (!v12)
          {
            BOOL v13 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_12:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)_parseQuickRelayDefaults
{
  v32[2] = *MEMORY[0x1E4F143B8];
  v2 = MEMORY[0x192FDF2C0](@"com.apple.ids", @"FixedQuickRelayServerAddress");
  id v3 = [v2 componentsSeparatedByString:@":"];
  if ([v3 count] == 2)
  {
    [v3 objectAtIndex:0];
    v32[0] = 0xAAAAAAAAAAAAAAAALL;
    v32[1] = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v4 = objc_claimAutoreleasedReturnValue();
    if (inet_pton(2, (const char *)[v4 UTF8String], (char *)v32 + 4) == 1)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:(char *)v32 + 4 length:4];
      uint64_t v6 = [v3 objectAtIndex:1];
      unsigned __int16 v7 = [v6 integerValue];

      uint64_t v8 = +[IDSTransportLog QRAllocator];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v4;
        __int16 v30 = 1024;
        int v31 = v7;
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Decoded relay-server-address %@:%u", buf, 0x12u);
      }

      v27 = MEMORY[0x192FDF2C0](@"com.apple.ids", @"FixedQuickRelaySessionID");
      id v9 = (id) [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v27 options:0];
      uint64_t v10 = (void *)[v9 bytes];
      if (v10) {
        uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v9, "bytes"));
      }
      v25 = v10;
      v11 = [v10 UUIDString];
      id v12 = +[IDSTransportLog QRAllocator];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v11;
        _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Decoded base64 relay-session-id %@", buf, 0xCu);
      }
      v26 = v9;

      v24 = MEMORY[0x192FDF2C0](@"com.apple.ids", @"FixedQuickRelaySessionToken");
      BOOL v13 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v24 options:0];
      v14 = +[IDSTransportLog QRAllocator];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v13;
        _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Decoded base64 relay-session-token %@", buf, 0xCu);
      }

      long long v15 = MEMORY[0x192FDF2C0](@"com.apple.ids", @"FixedQuickRelaySessionKey");
      long long v16 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v15 options:0];
      long long v17 = +[IDSTransportLog QRAllocator];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v16;
        _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "Decoded base64 relay-session-key %@", buf, 0xCu);
      }

      if (v5 && v7 && v11 && v13 && v16)
      {
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6B6C8], v5);
        v19 = [NSNumber numberWithUnsignedShort:v7];
        if (v19)
        {
          CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6B6D8], v19);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_191A31D24();
        }

        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6B6E0], v11);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6B6F0], v13);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6B6E8], v16);
        v21 = _IDSQuickRelayProtocolVersionNumber();
        if (v21)
        {
          CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6B6D0], v21);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_191A31C9C();
        }

        id v22 = (id)*MEMORY[0x1E4F6B6F8];
        if (v22)
        {
          CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6B6B0], v22);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_191A31C14();
        }

        v20 = +[IDSTransportLog QRAllocator];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Using preallocated tokens from user defaults", buf, 2u);
        }
      }
      else
      {
        v20 = +[IDSTransportLog QRAllocator];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Missing a defaults for hardcoded QR session info", buf, 2u);
        }
        Mutable = 0;
      }
    }
    else
    {
      uint64_t v5 = +[IDSTransportLog QRAllocator];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Faied to get address in FixedQuickRelayServerAddress defaults", buf, 2u);
      }
      Mutable = 0;
    }
  }
  else
  {
    uint64_t v4 = +[IDSTransportLog QRAllocator];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "Faied to get address in FixedQuickRelayServerAddress defaults", buf, 2u);
    }
    Mutable = 0;
  }

  return Mutable;
}

- (NSData)relayIP
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRelayIP:(id)a3
{
}

- (NSNumber)relayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRelayPort:(id)a3
{
}

- (NSData)relaySessionKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRelaySessionKey:(id)a3
{
}

- (NSData)relaySessionToken
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRelaySessionToken:(id)a3
{
}

- (NSData)relaySessionID
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRelaySessionID:(id)a3
{
}

- (NSNumber)relayCombinedSoftwareID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRelayCombinedSoftwareID:(id)a3
{
}

- (NSData)appleID
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAppleID:(id)a3
{
}

- (NSData)relayIPv6
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRelayIPv6:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayIPv6, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_relayCombinedSoftwareID, 0);
  objc_storeStrong((id *)&self->_relaySessionID, 0);
  objc_storeStrong((id *)&self->_relaySessionKey, 0);
  objc_storeStrong((id *)&self->_relaySessionToken, 0);
  objc_storeStrong((id *)&self->_relayPort, 0);

  objc_storeStrong((id *)&self->_relayIP, 0);
}

@end