@interface NEIKEv2IKESA
+ (NSObject)createAuthenticationDataForSharedSecret:(void *)a3 octets:(void *)a4 prfProtocol:;
+ (void)copyPPKFromConfig:(uint64_t)a1;
+ (void)copySharedSecretFromConfig:(uint64_t)a1;
- (CFMutableDataRef)createIntAuthOctets;
- (CFTypeRef)copyCertSigningKey;
- (NEIKEv2AddressIdentifier)localIdentifier;
- (NEIKEv2AuthPayload)copyAuthenticationPayloadUsingPrimeKey:(id *)self;
- (NSObject)copyForRekey;
- (NSObject)copyLocalCertificateData;
- (NSObject)createAuthenticationDataForSharedSecret:(void *)a3 octets:;
- (NSObject)createInitiatorEAPAuthenticationDataUsingPrimeKey:(NSObject *)self;
- (NSObject)createInitiatorGSPMAuthenticationDataUsingPrimeKey:(NSObject *)self;
- (NSObject)createInitiatorSignedOctetsUsingPrimeKey:(uint64_t)a1;
- (NSObject)createResponderGSPMAuthenticationDataUsingPrimeKey:(NSObject *)self;
- (NSObject)createResponderSignedOctetsUsingPrimeKey:(unsigned char *)a1;
- (NSObject)initIKESAWithConfiguration:(void *)a3 sessionConfiguration:(void *)a4 queue:(void *)a5 initialTransport:(void *)a6 transportDelegate:(void *)a7 socketGetBlock:(void *)a8 packetDelegate:(void *)a9 configurationDelegate:(objc_class *)a10 ikeSessionUniqueIndex:;
- (SecKeyRef)checkValidityOfCertificates:(void *)a1;
- (_BYTE)copyInitiatorIdentifier;
- (_BYTE)copyResponderIdentifier;
- (_BYTE)hasTransport;
- (_BYTE)headerOverhead;
- (_BYTE)initiatorSPI;
- (_BYTE)responderSPI;
- (__CFData)deriveKeyFromPrimeKey:(void *)a1 hmacContext:(void *)a2;
- (id)authenticationProtocol;
- (id)copyRemoteCertificateAuthorityArray;
- (id)copyRemoteCertificateAuthorityHashData;
- (id)copyTransport;
- (id)description;
- (id)initiatorFirstMessage;
- (id)initiatorNonce;
- (id)ppk;
- (id)preferredKEMProtocol;
- (id)remoteAuthentication;
- (id)remoteIdentifier;
- (id)responderFirstMessage;
- (id)responderNonce;
- (id)sharedSecret;
- (uint64_t)checkSharedKeyAuthData:(const char *)a3 usingPrimeKey:;
- (uint64_t)copyLocalSecIdentity;
- (uint64_t)createRemoteSignedOctetsUsingPrimeKey:(uint64_t)a1;
- (uint64_t)generateAllValuesForSAInit;
- (uint64_t)generateAllValuesUsingSA:(unsigned char *)a1;
- (uint64_t)generateDerivativesFromPPK:(uint64_t)a1;
- (uint64_t)generateInitialValues;
- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a1;
- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a3 peerPayload:;
- (uint64_t)maximumPacketSize;
- (uint64_t)processCurrentKeyExchange;
- (uint64_t)processPrimaryKeyExchange;
- (uint64_t)updateIntAuthWithPacket:(uint64_t)a1;
- (uint64_t)usesEAPOnlyAuthentication;
- (unint64_t)selectSecurePasswordMethod:(void *)a1;
- (void)assignRemoteSPI:(void *)a1;
- (void)clearAuthenticationSecrets;
- (void)createConcatedNoncesAndReturnError:(unsigned char *)a1;
- (void)createConcatenatedSPIsAndReturnError:(unsigned char *)a1;
- (void)dealloc;
- (void)detachTransportWithShouldInvalidate:(void *)a1;
- (void)restorePrimeKeys;
- (void)resyncAddress;
- (void)setAuthProtocolFromPacket:(uint64_t)a1;
- (void)setLocalAuthProtocolUsed:(uint64_t)a1;
- (void)setPpkIDFromPacket:(uint64_t)a1;
- (void)setPrimeAuthenticationDataFromPacket:(uint64_t)a1;
- (void)setRemoteAuthProtocolUsed:(uint64_t)a1;
- (void)setState:(void *)a3 error:;
- (void)switchToNATTraversalPorts;
@end

@implementation NEIKEv2IKESA

- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    id v5 = objc_getProperty(a1, v3, 160, 1);

    if (v5)
    {
      v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v13 = 136315138;
        v14 = "-[NEIKEv2IKESA(Crypto) generateLocalValuesForKEMProtocol:]";
        _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "%s called with null !self.currentKEHandler", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      v8 = +[NEIKEv2KeyExchangeHandler handlerForKEMethod:]((uint64_t)NEIKEv2KeyExchangeHandler, [v4 method]);
      objc_setProperty_atomic(a1, v9, v8, 160);

      uint64_t v7 = 1;
      id v11 = objc_getProperty(a1, v10, 160, 1);

      if (v11) {
        goto LABEL_8;
      }
      v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        v14 = (const char *)v4;
        _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "Failed to get handler for KE method %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  uint64_t v7 = 0;
LABEL_8:

  return v7;
}

- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a3 peerPayload:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id v8 = objc_getProperty(a1, v6, 160, 1);

    if (v8)
    {
      SEL v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        int v16 = 136315138;
        v17 = "-[NEIKEv2IKESA(Crypto) generateLocalValuesForKEMProtocol:peerPayload:]";
        _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, "%s called with null !self.currentKEHandler", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      id v11 = +[NEIKEv2KeyExchangeHandler handlerForKEMethod:peerPayload:]((uint64_t)NEIKEv2KeyExchangeHandler, [v5 method], v7);
      objc_setProperty_atomic(a1, v12, v11, 160);

      uint64_t v10 = 1;
      id v14 = objc_getProperty(a1, v13, 160, 1);

      if (v14) {
        goto LABEL_8;
      }
      SEL v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138412290;
        v17 = (const char *)v5;
        _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "Failed to get handler for KE method %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

- (uint64_t)generateInitialValues
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v2 = a1;
  v3 = [(NEIKEv2IKESA *)a1 preferredKEMProtocol];
  id v4 = v3;
  if (!v3 || [v3 method] == 36 || objc_msgSend(v4, "method") == 37)
  {
    v45 = ne_log_obj();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v58 = v4;
      _os_log_fault_impl(&dword_19DDAF000, v45, OS_LOG_TYPE_FAULT, "KE method %@ is not Diffie-Hellman", buf, 0xCu);
    }

    return 0;
  }
  uint64_t v5 = -[NEIKEv2IKESA generateLocalValuesForKEMProtocol:](v2, v4);

  if (v5)
  {
    id v7 = objc_getProperty(v2, v6, 80, 1);
    unsigned int v8 = [v7 nonceSize];

    if (v8 - 257 <= 0xFFFFFF0E)
    {
      v32 = ne_log_obj();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v58 = v8;
      v42 = "Invalid nonce size %u";
      v43 = v32;
      uint32_t v44 = 8;
      goto LABEL_36;
    }
    id v10 = objc_getProperty(v2, v9, 80, 1);
    int v11 = [v10 strictNonceSizeChecks];

    if (v11)
    {
      id v13 = objc_getProperty(v2, v12, 96, 1);

      if (v13)
      {
        id v15 = objc_getProperty(v2, v14, 96, 1);
        v17 = [(NEIKEv2IKESAProposal *)v15 prfProtocol];
        unsigned int v18 = [v17 nonceSize];
      }
      else
      {
        unsigned int v46 = v8;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        v47 = v2;
        id v19 = objc_getProperty(v2, v14, 80, 1);
        v20 = [v19 proposals];

        unsigned int v18 = 16;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:buf count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v53;
          unsigned int v18 = 16;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v53 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              long long v48 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              long long v51 = 0u;
              v26 = [v25 prfProtocols];
              uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v56 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v49;
                do
                {
                  for (uint64_t j = 0; j != v28; ++j)
                  {
                    if (*(void *)v49 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    v31 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                    if ([v31 nonceSize] > v18) {
                      unsigned int v18 = [v31 nonceSize];
                    }
                  }
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v48 objects:v56 count:16];
                }
                while (v28);
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v52 objects:buf count:16];
          }
          while (v22);
        }

        v2 = v47;
        unsigned int v8 = v46;
      }
      if (v8 < v18)
      {
        v32 = ne_log_obj();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
LABEL_29:

          return 0;
        }
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v58 = v8;
        *(_WORD *)&v58[4] = 1024;
        *(_DWORD *)&v58[6] = v18;
        v42 = "Nonce size %u < minimum %u";
        v43 = v32;
        uint32_t v44 = 14;
LABEL_36:
        _os_log_fault_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_FAULT, v42, buf, v44);
        goto LABEL_29;
      }
    }
    id v33 = objc_getProperty(v2, v12, 280, 1);
    if (!v33
      || (v35 = v33,
          uint64_t v5 = 1,
          id v36 = objc_getProperty(v2, v34, 128, 1),
          v36,
          v35,
          !v36))
    {
      v37 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)NEIKEv2Crypto, v8);
      objc_setProperty_atomic(v2, v38, v37, 128);

      id v40 = objc_getProperty(v2, v39, 128, 1);
      uint64_t v5 = v40 != 0;
    }
  }
  return v5;
}

- (uint64_t)processCurrentKeyExchange
{
  id v2 = self;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = objc_getProperty(self, a2, 160, 1);
  }
  id v3 = self;

  if (!v3)
  {
    id v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
LABEL_11:

      return 0;
    }
    int v16 = 136315138;
    v17 = "-[NEIKEv2IKESA(Crypto) processCurrentKeyExchange]";
    id v15 = "%s called with null self.currentKEHandler";
LABEL_14:
    _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_11;
  }
  uint64_t v5 = objc_getProperty(v2, v4, 152, 1);

  if (!v5)
  {
    id v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    int v16 = 136315138;
    v17 = "-[NEIKEv2IKESA(Crypto) processCurrentKeyExchange]";
    id v15 = "%s called with null self.remoteKeyExchangeData";
    goto LABEL_14;
  }
  unsigned int v8 = objc_getProperty(v2, v6, 152, 1);
  if (v2)
  {
    objc_setProperty_atomic(v2, v7, 0, 152);
    id Property = objc_getProperty(v2, v9, 160, 1);
  }
  else
  {
    id Property = 0;
  }
  id v11 = Property;
  uint64_t v12 = [v11 processPeerPayload:v8];

  return v12;
}

- (uint64_t)processPrimaryKeyExchange
{
  if (result)
  {
    id v2 = (void *)result;
    result = [(NEIKEv2IKESA *)(id)result processCurrentKeyExchange];
    if (result)
    {
      id v4 = objc_getProperty(v2, v3, 160, 1);
      v6 = v4;
      if (v4) {
        id v7 = (void *)*((void *)v4 + 3);
      }
      else {
        id v7 = 0;
      }
      objc_setProperty_atomic(v2, v5, v7, 168);

      objc_setProperty_atomic(v2, v8, 0, 160);
      return 1;
    }
  }
  return result;
}

- (uint64_t)generateAllValuesForSAInit
{
  if (!a1) {
    return 0;
  }
  if (([(NEIKEv2IKESA *)(uint64_t)a1 processPrimaryKeyExchange] & 1) == 0)
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Failed to process KE data", v5, 2u);
    }

    return 0;
  }

  return -[NEIKEv2IKESA generateAllValuesUsingSA:](a1, 0);
}

- (uint64_t)generateAllValuesUsingSA:(unsigned char *)a1
{
  uint64_t v246 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 96, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = Property;

  if (!v6)
  {
    uint64_t v29 = ne_log_obj();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null self.chosenProposal";
LABEL_109:
    _os_log_fault_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_FAULT, v30, buf, 0xCu);
    goto LABEL_110;
  }
  SEL v8 = [(NEIKEv2IKESA *)a1 initiatorNonce];

  if (!v8)
  {
    uint64_t v29 = ne_log_obj();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null self.initiatorNonce";
    goto LABEL_109;
  }
  id v10 = [(NEIKEv2IKESA *)a1 responderNonce];

  if (!v10)
  {
    uint64_t v29 = ne_log_obj();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null self.responderNonce";
    goto LABEL_109;
  }
  uint64_t v12 = objc_getProperty(a1, v11, 168, 1);

  if (!v12)
  {
    uint64_t v29 = ne_log_obj();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null self.primarySharedSecret";
    goto LABEL_109;
  }
  BOOL v14 = v4 != a1;
  if (!v4) {
    BOOL v14 = 0;
  }
  BOOL v222 = v14;
  BOOL v15 = v4 == a1 || v4 != 0;
  v221 = v4;
  if (!v15)
  {
    v20 = objc_getProperty(a1, v13, 168, 1);
    if (a1) {
      objc_setProperty_atomic(a1, v31, 0, 168);
    }
    v32 = [(NEIKEv2IKESA *)a1 initiatorNonce];
    uint64_t v33 = [v32 length];
    v35 = [(NEIKEv2IKESA *)a1 responderNonce];
    CFIndex v36 = [v35 length] + v33;

    CFMutableDataRef v37 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E4F1CA58], v36);
    if (v37)
    {
      CFMutableDataRef v39 = v37;
      id v40 = [(NEIKEv2IKESA *)a1 initiatorNonce];
      [(__CFData *)v39 appendData:v40];

      v42 = [(NEIKEv2IKESA *)a1 responderNonce];
      [(__CFData *)v39 appendData:v42];

      CFMutableDataRef v44 = v20;
      CFMutableDataRef v219 = v44;
      goto LABEL_38;
    }
    v198 = ne_log_obj();
    if (os_log_type_enabled(v198, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v241 = (const char *)v36;
      goto LABEL_234;
    }
LABEL_191:

    CFMutableDataRef v39 = 0;
    CFMutableDataRef v44 = 0;
    unsigned __int8 v238 = 0;
    goto LABEL_150;
  }
  if (v4) {
    id v16 = objc_getProperty(v4, v13, 216, 1);
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    v20 = objc_getProperty(a1, v18, 168, 1);
    if (a1)
    {
      objc_setProperty_atomic(a1, v19, 0, 168);
      long long v237 = 0u;
      long long v235 = 0u;
      long long v236 = 0u;
      long long v234 = 0u;
      id v22 = objc_getProperty(a1, v21, 184, 1);
    }
    else
    {
      id v22 = 0;
      long long v237 = 0u;
      long long v235 = 0u;
      long long v236 = 0u;
      long long v234 = 0u;
    }
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v234 objects:v245 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = 0;
      uint64_t v27 = *(void *)v235;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v235 != v27) {
            objc_enumerationMutation(v23);
          }
          v26 += [*(id *)(*((void *)&v234 + 1) + 8 * i) length];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v234 objects:v245 count:16];
      }
      while (v25);
    }
    else
    {
      uint64_t v26 = 0;
    }

    uint64_t v169 = [v20 length];
    v171 = [(NEIKEv2IKESA *)a1 initiatorNonce];
    uint64_t v172 = [v171 length];
    v174 = [(NEIKEv2IKESA *)a1 responderNonce];
    CFIndex v175 = v169 + [v174 length] + v26 + v172;

    CFMutableDataRef v176 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E4F1CA58], v175);
    if (v176)
    {
      CFMutableDataRef v44 = v176;
      [(__CFData *)v176 appendData:v20];
      v178 = [(NEIKEv2IKESA *)a1 initiatorNonce];
      [(__CFData *)v44 appendData:v178];

      v180 = [(NEIKEv2IKESA *)a1 responderNonce];
      [(__CFData *)v44 appendData:v180];

      long long v232 = 0u;
      long long v233 = 0u;
      long long v230 = 0u;
      long long v231 = 0u;
      if (a1) {
        id v182 = objc_getProperty(a1, v181, 184, 1);
      }
      else {
        id v182 = 0;
      }
      id v183 = v182;
      uint64_t v184 = [v183 countByEnumeratingWithState:&v230 objects:v244 count:16];
      if (v184)
      {
        uint64_t v185 = v184;
        uint64_t v186 = *(void *)v231;
        do
        {
          for (uint64_t j = 0; j != v185; ++j)
          {
            if (*(void *)v231 != v186) {
              objc_enumerationMutation(v183);
            }
            [(__CFData *)v44 appendData:*(void *)(*((void *)&v230 + 1) + 8 * j)];
          }
          uint64_t v185 = [v183 countByEnumeratingWithState:&v230 objects:v244 count:16];
        }
        while (v185);
      }

      if (a1) {
        objc_setProperty_atomic(a1, v188, 0, 184);
      }
      if (v4) {
        id v189 = objc_getProperty(v4, v188, 216, 1);
      }
      else {
        id v189 = 0;
      }
      CFMutableDataRef v219 = (CFMutableDataRef)v20;
      CFMutableDataRef v39 = (CFMutableDataRef)v189;
LABEL_38:
      v45 = [(NEIKEv2IKESA *)a1 initiatorNonce];
      uint64_t v46 = [v45 length];
      long long v48 = [(NEIKEv2IKESA *)a1 responderNonce];
      CFIndex v49 = v46 + [v48 length] + 16;

      CFMutableDataRef v50 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E4F1CA58], v49);
      if (v50)
      {
        CFMutableDataRef v52 = v50;
        long long v53 = [(NEIKEv2IKESA *)a1 initiatorSPI];
        uint64_t v54 = [v53 value];

        uint64_t v229 = v54;
        v56 = [(NEIKEv2IKESA *)a1 responderSPI];
        uint64_t v57 = [v56 value];

        uint64_t v228 = v57;
        uint64_t v59 = [(NEIKEv2IKESA *)a1 initiatorNonce];
        [(__CFData *)v52 appendData:v59];

        v61 = [(NEIKEv2IKESA *)a1 responderNonce];
        [(__CFData *)v52 appendData:v61];

        [(__CFData *)v52 appendBytes:&v229 length:8];
        [(__CFData *)v52 appendBytes:&v228 length:8];
        [(__CFData *)v39 bytes];
        [(__CFData *)v39 length];
        [(__CFData *)v52 bytes];
        [(__CFData *)v52 length];
        int Hkdf = CCKDFParametersCreateHkdf();
        if (!Hkdf)
        {
          if (a1) {
            id v64 = objc_getProperty(a1, v63, 96, 1);
          }
          else {
            id v64 = 0;
          }
          id v65 = v64;
          v67 = [(NEIKEv2IKESAProposal *)v65 prfProtocol];
          unsigned int v224 = -[NEIKEv2PRFProtocol length]((uint64_t)v67);

          if (a1) {
            id v69 = objc_getProperty(a1, v68, 96, 1);
          }
          else {
            id v69 = 0;
          }
          id v70 = v69;
          uint64_t v72 = [(NEIKEv2IKESAProposal *)v70 encryptionProtocol];
          v74 = (void *)v72;
          if (v72 && (unint64_t v75 = *(void *)(v72 + 16), v75 <= 0x1F) && ((0xD01C0000 >> v75) & 1) != 0)
          {
            unsigned int v80 = 0;
          }
          else
          {
            if (a1) {
              id v76 = objc_getProperty(a1, v73, 96, 1);
            }
            else {
              id v76 = 0;
            }
            id v77 = v76;
            v79 = [(NEIKEv2IKESAProposal *)v77 integrityProtocol];
            unsigned int v80 = -[NEIKEv2IntegrityProtocol keyLength]((uint64_t)v79);
          }
          CFMutableDataRef v226 = v52;
          if (a1) {
            id v82 = objc_getProperty(a1, v81, 96, 1);
          }
          else {
            id v82 = 0;
          }
          id v83 = v82;
          v85 = [(NEIKEv2IKESAProposal *)v83 encryptionProtocol];
          unsigned int v86 = -[NEIKEv2EncryptionProtocol keyLength]((uint64_t)v85);

          if (v222) {
            int v87 = 1;
          }
          else {
            int v87 = 3;
          }
          unsigned int v88 = v224 * v87 + 2 * (v80 + v86);
          v89 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E4F1CA58], v88);
          if (!v89)
          {
            v196 = ne_log_obj();
            if (os_log_type_enabled(v196, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v241) = v88;
              _os_log_fault_impl(&dword_19DDAF000, v196, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%u] failed", buf, 8u);
            }

            v91 = 0;
            unsigned __int8 v238 = 0;
            v20 = v219;
            id v4 = v221;
            goto LABEL_148;
          }
          v91 = v89;
          unsigned int v216 = v80;
          unsigned int v214 = v86;
          if (a1) {
            id v92 = objc_getProperty(a1, v90, 96, 1);
          }
          else {
            id v92 = 0;
          }
          id v93 = v92;
          v95 = [(NEIKEv2IKESAProposal *)v93 prfProtocol];
          -[NEIKEv2PRFProtocol ccDigest](v95);
          [(__CFData *)v44 bytes];
          [(__CFData *)v44 length];
          [(__CFData *)v91 mutableBytes];
          [(__CFData *)v91 length];
          int v96 = CCDeriveKey();

          CCKDFParametersDestroy();
          if (v96)
          {
            v197 = ne_log_obj();
            if (os_log_type_enabled(v197, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v241) = v96;
              _os_log_fault_impl(&dword_19DDAF000, v197, OS_LOG_TYPE_FAULT, "CCDeriveKey failed %d", buf, 8u);
            }

            unsigned __int8 v238 = 0;
            v20 = v219;
            id v4 = v221;
            goto LABEL_148;
          }

          v97 = (const UInt8 *)[(__CFData *)v91 bytes];
          CFDataRef v98 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E4F1C9B8], v97, v224);
          objc_setProperty_atomic(a1, v99, v98, 216);

          id v4 = v221;
          if (a1) {
            id v101 = objc_getProperty(a1, v100, 216, 1);
          }
          else {
            id v101 = 0;
          }
          id v102 = v101;

          if (!v102)
          {
            v111 = ne_log_obj();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v241) = v224;
              _os_log_fault_impl(&dword_19DDAF000, v111, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
            }

            CFMutableDataRef v226 = 0;
            CFMutableDataRef v39 = 0;
            CFMutableDataRef v44 = 0;
            v20 = 0;
            unsigned __int8 v238 = 0;
            goto LABEL_148;
          }
          v212 = v91;
          if (v216)
          {
            CFDataRef v103 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E4F1C9B8], &v97[v224], v216);
            if (!v103)
            {
              v202 = ne_log_obj();
              if (os_log_type_enabled(v202, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v241) = v216;
                _os_log_fault_impl(&dword_19DDAF000, v202, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
              }

              CFMutableDataRef v226 = 0;
              CFMutableDataRef v39 = 0;
              CFMutableDataRef v44 = 0;
              v20 = 0;
              unsigned __int8 v238 = 0;
              goto LABEL_206;
            }
            CFDataRef v104 = v103;
            uint64_t v105 = v216 + v224;
            self;
            CFAllocatorRef v106 = (const __CFAllocator *)SecCFAllocatorZeroize();
            CFDataRef v107 = CFDataCreate(v106, &v97[v105], v216);
            if (!v107)
            {
              v203 = ne_log_obj();
              if (os_log_type_enabled(v203, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v241) = v216;
                _os_log_fault_impl(&dword_19DDAF000, v203, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
              }

              unsigned __int8 v238 = 0;
LABEL_205:

              CFMutableDataRef v226 = 0;
              CFMutableDataRef v39 = 0;
              CFMutableDataRef v44 = 0;
              v20 = 0;
LABEL_206:
              id v4 = v221;
              goto LABEL_147;
            }
            uint64_t v108 = v105 + v216;
            unsigned int v109 = v105 + v216;
            CFDataRef v110 = v107;
          }
          else
          {
            CFDataRef v104 = 0;
            CFDataRef v110 = 0;
            uint64_t v108 = v224;
            unsigned int v109 = v224;
          }
          CFDataRef v227 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E4F1C9B8], &v97[v108], v214);
          if (v227)
          {
            uint64_t v112 = v109 + v214;
            CFDataRef v113 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E4F1C9B8], &v97[v112], v214);
            if (v113)
            {
              CFDataRef v114 = v113;
              CFDataRef v220 = v113;
              if (v222) {
                goto LABEL_76;
              }
              int v115 = v112 + v214;
              CFDataRef v116 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E4F1C9B8], &v97[v112 + v214], v224);
              objc_setProperty_atomic(a1, v117, v116, 232);

              v119 = objc_getProperty(a1, v118, 232, 1);

              if (v119)
              {
                CFDataRef v120 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E4F1C9B8], &v97[v115 + v224], v224);
                objc_setProperty_atomic(a1, v121, v120, 248);

                v123 = objc_getProperty(a1, v122, 248, 1);

                CFDataRef v114 = v220;
                if (v123)
                {
LABEL_76:

                  v124 = ne_log_obj();
                  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
                  {
                    v190 = "SA Init";
                    if (v221) {
                      v190 = "SA Rekey";
                    }
                    if (v221 == a1) {
                      v190 = "Intermediate";
                    }
                    *(_DWORD *)buf = 136315138;
                    v241 = v190;
                    _os_log_debug_impl(&dword_19DDAF000, v124, OS_LOG_TYPE_DEBUG, "Calculated sKeySeed derivatives for %s", buf, 0xCu);
                  }

                  if (a1)
                  {
                    int v126 = a1[9] & 1;
                    id v127 = objc_getProperty(a1, v125, 96, 1);
                  }
                  else
                  {
                    int v126 = 0;
                    id v127 = 0;
                  }
                  id v128 = v127;
                  v130 = [(NEIKEv2IKESAProposal *)v128 encryptionProtocol];

                  CFDataRef v131 = v227;
                  if (v126) {
                    CFDataRef v132 = v114;
                  }
                  else {
                    CFDataRef v132 = v227;
                  }
                  if (!v126) {
                    CFDataRef v131 = v114;
                  }
                  CFDataRef v225 = v131;
                  CFDataRef v223 = v132;
                  CFDataRef v211 = v110;
                  if (!v130 || (unint64_t v134 = v130[2], v134 > 0x1F) || ((0xD01C0000 >> v134) & 1) == 0)
                  {
                    CFDataRef v135 = v110;
                    if (a1) {
                      id v136 = objc_getProperty(a1, v133, 96, 1);
                    }
                    else {
                      id v136 = 0;
                    }
                    id v137 = v136;
                    v139 = [(NEIKEv2IKESAProposal *)v137 integrityProtocol];

                    if (v126) {
                      CFDataRef v140 = v104;
                    }
                    else {
                      CFDataRef v140 = v110;
                    }
                    CFDataRef v215 = v104;
                    if (!v126) {
                      CFDataRef v135 = v104;
                    }
                    CFDataRef v141 = v140;
                    CFDataRef v142 = v135;
                    v143 = [NEIKEv2SecurityContextCBCPlusHMAC alloc];
                    v144 = v130;
                    CFDataRef v218 = v225;
                    CFDataRef v217 = v223;
                    id v145 = v139;
                    CFDataRef v146 = v141;
                    CFDataRef v147 = v142;
                    CFDataRef v148 = v147;
                    if (!v143) {
                      goto LABEL_230;
                    }
                    if (v130)
                    {
                      if (v145)
                      {
                        if (v146)
                        {
                          if (v147)
                          {
                            unint64_t v149 = v144[2];
                            if (v149 <= 0x1F && ((0xD01C0000 >> v149) & 1) != 0) {
                              goto LABEL_230;
                            }
                            int v150 = +[NEIKEv2SecurityContextCBCPlusHMAC overheadForPlaintextLength:encryptionProtocol:integrityProtocol:]((uint64_t)NEIKEv2SecurityContextCBCPlusHMAC, 0, v144, v145);
                            v151 = (NEIKEv2SecurityContextCBCPlusHMAC *)-[NEIKEv2SecurityContext initWithMinimumEncryptedPayloadSize:](v143, v150);
                            v143 = v151;
                            if (!v151) {
                              goto LABEL_230;
                            }
                            objc_storeStrong((id *)&v151->_encryptionProtocol, v130);
                            encryptionProtocol = v143->_encryptionProtocol;
                            CFDataRef v213 = v146;
                            if (!encryptionProtocol) {
                              goto LABEL_120;
                            }
                            unint64_t wireType = encryptionProtocol->_wireType;
                            switch(wireType)
                            {
                              case 2uLL:
                                v154 = v144;
                                CCAlgorithm v155 = 1;
                                goto LABEL_126;
                              case 0xCuLL:
LABEL_120:
                                v154 = v144;
                                break;
                              case 3uLL:
                                v154 = v144;
                                CCAlgorithm v155 = 2;
LABEL_126:
                                CCCryptorRef cryptorRef = 0;
                                CCCryptorStatus v163 = CCCryptorCreate(0, v155, 0, (const void *)[(__CFData *)v218 bytes], [(__CFData *)v218 length], 0, &cryptorRef);
                                if (v163 || !cryptorRef)
                                {
                                  v209 = ne_log_obj();
                                  if (!os_log_type_enabled(v209, OS_LOG_TYPE_FAULT)) {
                                    goto LABEL_222;
                                  }
                                  *(_DWORD *)buf = 67109120;
                                  LODWORD(v241) = v163;
                                  v210 = "CCCryptorCreate(kCCEncrypt) failed: %d";
                                }
                                else
                                {
                                  v143->_outgoingEncryptionContext = cryptorRef;
                                  CCCryptorRef cryptorRef = 0;
                                  CCCryptorStatus v164 = CCCryptorCreate(1u, v155, 0, (const void *)[(__CFData *)v217 bytes], [(__CFData *)v217 length], 0, &cryptorRef);
                                  if (!v164 && cryptorRef)
                                  {
                                    v143->_incomingEncryptionContext = cryptorRef;
                                    objc_storeStrong((id *)&v143->_integrityProtocol, v139);
                                    unint64_t v165 = [v145 type] - 1;
                                    if (v165 < 0xE && ((0x3863u >> v165) & 1) != 0)
                                    {
                                      v144 = v154;
                                    }
                                    else
                                    {
                                      v166 = ne_log_obj();
                                      v144 = v154;
                                      if (os_log_type_enabled(v166, OS_LOG_TYPE_FAULT))
                                      {
                                        int v191 = [v145 type];
                                        *(_DWORD *)buf = 67109120;
                                        LODWORD(v241) = v191;
                                        _os_log_fault_impl(&dword_19DDAF000, v166, OS_LOG_TYPE_FAULT, "Unknown PRF type %u", buf, 8u);
                                      }
                                    }
                                    CFDataRef v146 = v213;
                                    [(__CFData *)v213 bytes];
                                    [(__CFData *)v213 length];
                                    uint64_t v167 = CCHmacCreate();
                                    if (v167)
                                    {
                                      v143->_outgoingHMACBaseContext = ($1DC23E134A5F43A06C89BE309303CDCF *)v167;
                                      [(__CFData *)v148 bytes];
                                      [(__CFData *)v148 length];
                                      uint64_t v168 = CCHmacCreate();
                                      if (v168)
                                      {
                                        v143->_incomingHMACBaseContext = ($1DC23E134A5F43A06C89BE309303CDCF *)v168;
                                        v160 = v143;
LABEL_139:
                                        CFDataRef v114 = v220;
LABEL_140:

                                        if (!v160)
                                        {
                                          v206 = ne_log_obj();
                                          if (os_log_type_enabled(v206, OS_LOG_TYPE_ERROR))
                                          {
                                            *(_DWORD *)buf = 138412546;
                                            v241 = (const char *)v144;
                                            __int16 v242 = 2112;
                                            id v243 = v145;
                                            _os_log_error_impl(&dword_19DDAF000, v206, OS_LOG_TYPE_ERROR, "Failed to create security context for %@, %@", buf, 0x16u);
                                          }

                                          unsigned __int8 v238 = 0;
                                          CFDataRef v114 = v220;
                                          id v4 = v221;
                                          CFDataRef v104 = v215;
                                          goto LABEL_143;
                                        }

                                        id v4 = v221;
                                        CFDataRef v104 = v215;
                                        goto LABEL_142;
                                      }
                                      v204 = ne_log_obj();
                                      if (!os_log_type_enabled(v204, OS_LOG_TYPE_FAULT)) {
                                        goto LABEL_229;
                                      }
                                      *(_WORD *)buf = 0;
                                      v205 = "CCHmacCreate failed";
                                      goto LABEL_227;
                                    }
                                    v204 = ne_log_obj();
                                    if (os_log_type_enabled(v204, OS_LOG_TYPE_FAULT))
                                    {
                                      *(_WORD *)buf = 0;
                                      v205 = "CCHmacCreate failed";
LABEL_227:
                                      v207 = v204;
                                      uint32_t v208 = 2;
                                      goto LABEL_228;
                                    }
LABEL_229:

LABEL_230:
                                    v160 = 0;
                                    goto LABEL_139;
                                  }
                                  v209 = ne_log_obj();
                                  if (!os_log_type_enabled(v209, OS_LOG_TYPE_FAULT))
                                  {
LABEL_222:

                                    v160 = 0;
                                    CFDataRef v114 = v220;
                                    v144 = v154;
                                    CFDataRef v146 = v213;
                                    goto LABEL_140;
                                  }
                                  *(_DWORD *)buf = 67109120;
                                  LODWORD(v241) = v164;
                                  v210 = "CCCryptorCreate(kCCDecrypt) failed: %d";
                                }
                                _os_log_fault_impl(&dword_19DDAF000, v209, OS_LOG_TYPE_FAULT, v210, buf, 8u);
                                goto LABEL_222;
                              default:
                                v162 = ne_log_obj();
                                if (os_log_type_enabled(v162, OS_LOG_TYPE_FAULT))
                                {
                                  String = NEIKEv2EncryptionWireTypeCreateString(encryptionProtocol->_wireType);
                                  *(_DWORD *)buf = 138412290;
                                  v241 = (const char *)String;
                                  _os_log_fault_impl(&dword_19DDAF000, v162, OS_LOG_TYPE_FAULT, "No CCAlgorithm for encryption wire type %@", buf, 0xCu);
                                }
                                v154 = v144;

                                break;
                            }
                            CCAlgorithm v155 = 0;
                            goto LABEL_126;
                          }
                          v204 = ne_log_obj();
                          if (!os_log_type_enabled(v204, OS_LOG_TYPE_FAULT)) {
                            goto LABEL_229;
                          }
                          *(_DWORD *)buf = 136315138;
                          v241 = "-[NEIKEv2SecurityContextCBCPlusHMAC initWithEncryptionProtocol:outgoingEncryptionKey:in"
                                 "comingEncryptionKey:integrityProtocol:outgoingIntegrityKey:incomingIntegrityKey:]";
                          v205 = "%s called with null incomingIntegrityKey";
                        }
                        else
                        {
                          v204 = ne_log_obj();
                          if (!os_log_type_enabled(v204, OS_LOG_TYPE_FAULT)) {
                            goto LABEL_229;
                          }
                          *(_DWORD *)buf = 136315138;
                          v241 = "-[NEIKEv2SecurityContextCBCPlusHMAC initWithEncryptionProtocol:outgoingEncryptionKey:in"
                                 "comingEncryptionKey:integrityProtocol:outgoingIntegrityKey:incomingIntegrityKey:]";
                          v205 = "%s called with null outgoingIntegrityKey";
                        }
                      }
                      else
                      {
                        v204 = ne_log_obj();
                        if (!os_log_type_enabled(v204, OS_LOG_TYPE_FAULT)) {
                          goto LABEL_229;
                        }
                        *(_DWORD *)buf = 136315138;
                        v241 = "-[NEIKEv2SecurityContextCBCPlusHMAC initWithEncryptionProtocol:outgoingEncryptionKey:inco"
                               "mingEncryptionKey:integrityProtocol:outgoingIntegrityKey:incomingIntegrityKey:]";
                        v205 = "%s called with null integrityProtocol";
                      }
                    }
                    else
                    {
                      v204 = ne_log_obj();
                      if (!os_log_type_enabled(v204, OS_LOG_TYPE_FAULT)) {
                        goto LABEL_229;
                      }
                      *(_DWORD *)buf = 136315138;
                      v241 = "-[NEIKEv2SecurityContextCBCPlusHMAC initWithEncryptionProtocol:outgoingEncryptionKey:incomi"
                             "ngEncryptionKey:integrityProtocol:outgoingIntegrityKey:incomingIntegrityKey:]";
                      v205 = "%s called with null encryptionProtocol";
                    }
                    v207 = v204;
                    uint32_t v208 = 12;
LABEL_228:
                    _os_log_fault_impl(&dword_19DDAF000, v207, OS_LOG_TYPE_FAULT, v205, buf, v208);
                    goto LABEL_229;
                  }
                  if (v134 <= 0x1E && ((0x401C0000u >> v134) & 1) != 0)
                  {
                    v160 = -[NEIKEv2SecurityContextAESGCM initWithEncryptionProtocol:outgoingEncryptionKey:incomingEncryptionKey:]((id *)[NEIKEv2SecurityContextAESGCM alloc], v130, v225, v223);
                    if (!v160)
                    {
                      v161 = ne_log_obj();
                      if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v241 = (const char *)v130;
                        goto LABEL_170;
                      }
LABEL_171:

                      unsigned __int8 v238 = 0;
                      CFDataRef v114 = v220;
                      id v4 = v221;
                      goto LABEL_143;
                    }
                  }
                  else
                  {
                    v160 = -[NEIKEv2SecurityContextChaCha20Poly1305 initWithEncryptionProtocol:outgoingEncryptionKey:incomingEncryptionKey:]((id *)[NEIKEv2SecurityContextChaCha20Poly1305 alloc], v130, v225, v223);
                    if (!v160)
                    {
                      v161 = ne_log_obj();
                      if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v241 = (const char *)v130;
LABEL_170:
                        _os_log_error_impl(&dword_19DDAF000, v161, OS_LOG_TYPE_ERROR, "Failed to create security context for %@", buf, 0xCu);
                        goto LABEL_171;
                      }
                      goto LABEL_171;
                    }
                  }
LABEL_142:
                  objc_setProperty_atomic(a1, v159, v160, 208);
                  unsigned __int8 v238 = 1;

LABEL_143:
                  v91 = 0;
                  CFMutableDataRef v226 = 0;
                  CFMutableDataRef v39 = 0;
                  CFMutableDataRef v44 = 0;
                  v20 = 0;
LABEL_148:

                  CFMutableDataRef v52 = v226;
LABEL_149:

LABEL_150:
                  uint64_t v156 = v238;
                  goto LABEL_111;
                }
                v158 = ne_log_obj();
                if (os_log_type_enabled(v158, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v241) = v224;
                  _os_log_fault_impl(&dword_19DDAF000, v158, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
                }
              }
              else
              {
                v158 = ne_log_obj();
                if (os_log_type_enabled(v158, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v241) = v224;
                  _os_log_fault_impl(&dword_19DDAF000, v158, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
                }
              }

              unsigned __int8 v238 = 0;
              CFMutableDataRef v226 = 0;
              CFMutableDataRef v39 = 0;
              CFMutableDataRef v44 = 0;
              v20 = 0;
LABEL_147:
              v91 = v212;
              goto LABEL_148;
            }
            CFDataRef v199 = v110;
            v201 = ne_log_obj();
            if (os_log_type_enabled(v201, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v241) = v214;
              _os_log_fault_impl(&dword_19DDAF000, v201, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
            }

            unsigned __int8 v238 = 0;
          }
          else
          {
            CFDataRef v199 = v110;
            v200 = ne_log_obj();
            if (os_log_type_enabled(v200, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v241) = v214;
              _os_log_fault_impl(&dword_19DDAF000, v200, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
            }

            unsigned __int8 v238 = 0;
          }

          goto LABEL_205;
        }
        int v194 = Hkdf;
        v195 = ne_log_obj();
        if (os_log_type_enabled(v195, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v241) = v194;
          _os_log_fault_impl(&dword_19DDAF000, v195, OS_LOG_TYPE_FAULT, "CCKDFParametersCreateHkdf failed %d", buf, 8u);
        }
      }
      else
      {
        v193 = ne_log_obj();
        if (os_log_type_enabled(v193, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          v241 = (const char *)v49;
          _os_log_fault_impl(&dword_19DDAF000, v193, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed", buf, 0xCu);
        }

        CFMutableDataRef v52 = 0;
      }
      unsigned __int8 v238 = 0;
      v20 = v219;
      goto LABEL_149;
    }
    v198 = ne_log_obj();
    if (os_log_type_enabled(v198, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v241 = (const char *)v175;
LABEL_234:
      _os_log_fault_impl(&dword_19DDAF000, v198, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed", buf, 0xCu);
      goto LABEL_191;
    }
    goto LABEL_191;
  }
  uint64_t v29 = ne_log_obj();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null ikeSA.skD";
    goto LABEL_109;
  }
LABEL_110:

  uint64_t v156 = 0;
LABEL_111:

  return v156;
}

- (__CFData)deriveKeyFromPrimeKey:(void *)a1 hmacContext:(void *)a2
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 96, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = Property;
  SEL v8 = [(NEIKEv2IKESAProposal *)v6 prfProtocol];
  unsigned int v9 = -[NEIKEv2PRFProtocol length]((uint64_t)v8);

  uint64_t v10 = CCHmacOutputSizeFromRef();
  if (v10 != v9)
  {
    uint64_t v15 = v10;
    id v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v18) = 67109376;
      HIDWORD(v18) = v9;
      __int16 v19 = 2048;
      uint64_t v20 = v15;
      _os_log_fault_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_FAULT, "PRF length %u != HMAC output size %zu", (uint8_t *)&v18, 0x12u);
    }
  }
  id v11 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E4F1CA58], v9);
  if (v11)
  {
    uint64_t v12 = (CCHmacContext *)CCHmacClone();
    LOBYTE(v18) = 1;
    CCHmacUpdate(v12, (const void *)objc_msgSend(v4, "bytes", v18), objc_msgSend(v4, "length"));
    CCHmacUpdate(v12, &v18, 1uLL);
    CCHmacFinal(v12, (void *)[(__CFData *)v11 mutableBytes]);
    CCHmacDestroy();
    id v13 = v11;
  }
  else
  {
    id v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v18) = 67109120;
      HIDWORD(v18) = v9;
      _os_log_fault_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%u] failed", (uint8_t *)&v18, 8u);
    }

    id v13 = 0;
  }

  return v13;
}

- (uint64_t)generateDerivativesFromPPK:(uint64_t)a1
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v5 = v3;
  if (!a1) {
    goto LABEL_24;
  }
  if (!v3)
  {
    CFMutableDataRef v44 = ne_log_obj();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    int v50 = 136315138;
    long long v51 = "-[NEIKEv2IKESA(Crypto) generateDerivativesFromPPK:]";
    v45 = "%s called with null ppk";
    goto LABEL_20;
  }
  id v6 = objc_getProperty((id)a1, v4, 216, 1);

  if (!v6)
  {
    CFMutableDataRef v44 = ne_log_obj();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    int v50 = 136315138;
    long long v51 = "-[NEIKEv2IKESA(Crypto) generateDerivativesFromPPK:]";
    v45 = "%s called with null self.skD";
LABEL_20:
    v47 = v44;
    uint32_t v48 = 12;
LABEL_21:
    _os_log_fault_impl(&dword_19DDAF000, v47, OS_LOG_TYPE_FAULT, v45, (uint8_t *)&v50, v48);
    goto LABEL_22;
  }
  SEL v8 = objc_getProperty((id)a1, v7, 232, 1);

  if (!v8)
  {
    CFMutableDataRef v44 = ne_log_obj();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    int v50 = 136315138;
    long long v51 = "-[NEIKEv2IKESA(Crypto) generateDerivativesFromPPK:]";
    v45 = "%s called with null self.skPi";
    goto LABEL_20;
  }
  uint64_t v10 = objc_getProperty((id)a1, v9, 248, 1);

  if (!v10)
  {
    CFMutableDataRef v44 = ne_log_obj();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
    {
      int v50 = 136315138;
      long long v51 = "-[NEIKEv2IKESA(Crypto) generateDerivativesFromPPK:]";
      v45 = "%s called with null self.skPr";
      goto LABEL_20;
    }
LABEL_22:

    goto LABEL_23;
  }
  id v12 = objc_getProperty((id)a1, v11, 96, 1);
  BOOL v14 = [(NEIKEv2IKESAProposal *)v12 prfProtocol];
  -[NEIKEv2PRFProtocol ccDigest](v14);
  [v5 bytes];
  [v5 length];
  uint64_t v15 = CCHmacCreate();

  if (!v15)
  {
    CFMutableDataRef v44 = ne_log_obj();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    LOWORD(v50) = 0;
    v45 = "CCHmacCreate failed";
    v47 = v44;
    uint32_t v48 = 2;
    goto LABEL_21;
  }
  id v17 = objc_getProperty((id)a1, v16, 216, 1);
  objc_setProperty_atomic((id)a1, v18, v17, 224);

  uint64_t v20 = objc_getProperty((id)a1, v19, 224, 1);
  uint64_t v21 = -[NEIKEv2IKESA deriveKeyFromPrimeKey:hmacContext:]((void *)a1, v20);
  objc_setProperty_atomic((id)a1, v22, v21, 216);

  id v24 = objc_getProperty((id)a1, v23, 216, 1);
  if (!v24) {
    goto LABEL_17;
  }
  uint64_t v26 = objc_getProperty((id)a1, v25, 232, 1);
  objc_setProperty_atomic((id)a1, v27, v26, 240);

  uint64_t v29 = objc_getProperty((id)a1, v28, 240, 1);
  v30 = -[NEIKEv2IKESA deriveKeyFromPrimeKey:hmacContext:]((void *)a1, v29);
  objc_setProperty_atomic((id)a1, v31, v30, 232);

  uint64_t v33 = objc_getProperty((id)a1, v32, 232, 1);

  if (!v33) {
    goto LABEL_17;
  }
  v35 = objc_getProperty((id)a1, v34, 248, 1);
  objc_setProperty_atomic((id)a1, v36, v35, 256);

  SEL v38 = objc_getProperty((id)a1, v37, 256, 1);
  CFMutableDataRef v39 = -[NEIKEv2IKESA deriveKeyFromPrimeKey:hmacContext:]((void *)a1, v38);
  objc_setProperty_atomic((id)a1, v40, v39, 248);

  v42 = objc_getProperty((id)a1, v41, 248, 1);

  if (!v42)
  {
LABEL_17:
    CCHmacDestroy();
    [(NEIKEv2IKESA *)(void *)a1 restorePrimeKeys];
LABEL_23:
    a1 = 0;
    goto LABEL_24;
  }
  v43 = ne_log_obj();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v50) = 0;
    _os_log_debug_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_DEBUG, "Calculated PPK derivatives", (uint8_t *)&v50, 2u);
  }

  CCHmacDestroy();
  a1 = 1;
LABEL_24:

  return a1;
}

- (void)restorePrimeKeys
{
  if (a1)
  {
    id v3 = objc_getProperty(a1, a2, 224, 1);

    if (v3)
    {
      uint64_t v5 = objc_getProperty(a1, v4, 224, 1);
      objc_setProperty_atomic(a1, v6, v5, 216);

      objc_setProperty_atomic(a1, v7, 0, 224);
    }
    SEL v8 = objc_getProperty(a1, v4, 240, 1);

    if (v8)
    {
      uint64_t v10 = objc_getProperty(a1, v9, 240, 1);
      objc_setProperty_atomic(a1, v11, v10, 232);

      objc_setProperty_atomic(a1, v12, 0, 240);
    }
    id v13 = objc_getProperty(a1, v9, 256, 1);

    if (v13)
    {
      uint64_t v15 = objc_getProperty(a1, v14, 256, 1);
      objc_setProperty_atomic(a1, v16, v15, 248);

      objc_setProperty_atomic(a1, v17, 0, 256);
    }
    SEL v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)SEL v19 = 0;
      _os_log_debug_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_DEBUG, "Restored prime keys", v19, 2u);
    }
  }
}

- (id)copyRemoteCertificateAuthorityArray
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v3)
  {
    SEL v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "[[NSMutableArray alloc] init] failed", (uint8_t *)&buf, 2u);
    }
    goto LABEL_55;
  }
  if (a1) {
    id Property = objc_getProperty(a1, v2, 88, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  SEL v6 = [v5 remoteCertificateAuthorityReferences];

  if (v6)
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    SEL v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v75 objects:v84 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v76 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = +[NEIKEv2Crypto copyCertificateFromPersistentData:isModernSystem:]((uint64_t)NEIKEv2Crypto, *(void **)(*((void *)&v75 + 1) + 8 * i), 0);
          if (v13)
          {
            BOOL v14 = (const void *)v13;
            [v3 addObject:v13];
            CFRelease(v14);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v75 objects:v84 count:16];
      }
      while (v10);
    }

    if (![v3 count] && -[NSObject count](v8, "count"))
    {
      uint64_t v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, "failed to retrieve remote CA cert data by references", (uint8_t *)&buf, 2u);
      }
      goto LABEL_53;
    }
    goto LABEL_54;
  }
  if (a1) {
    id v16 = objc_getProperty(a1, v7, 88, 1);
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;
  SEL v18 = [v17 remoteCertificateAuthorityName];

  if (a1) {
    id v20 = objc_getProperty(a1, v19, 88, 1);
  }
  else {
    id v20 = 0;
  }
  id v21 = v20;
  SEL v22 = [v21 remoteCertificateAuthorityHash];

  SEL v23 = v18;
  id v24 = v22;
  uint64_t v25 = v23;
  id v26 = v24;
  self;
  v74 = v23;
  if (!v23)
  {
    id v38 = 0;
    goto LABEL_38;
  }
  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v66)
  {
    SEL v37 = ne_log_obj();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_FAULT, "[[NSMutableArray alloc] init] failed", (uint8_t *)&buf, 2u);
    }
    goto LABEL_36;
  }
  self;
  uint64_t v27 = *MEMORY[0x1E4F3B980];
  uint64_t v28 = *MEMORY[0x1E4F3BC80];
  uint64_t v72 = *MEMORY[0x1E4F3B978];
  *(void *)&long long v89 = *MEMORY[0x1E4F3B978];
  *((void *)&v89 + 1) = v28;
  uint64_t v29 = *MEMORY[0x1E4F1CFD0];
  uint64_t v71 = v27;
  *(void *)&long long buf = v27;
  *((void *)&buf + 1) = v29;
  uint64_t v30 = *MEMORY[0x1E4F3BB88];
  uint64_t v31 = *MEMORY[0x1E4F3BD20];
  *(void *)&long long v90 = *MEMORY[0x1E4F3BB80];
  *((void *)&v90 + 1) = v31;
  uint64_t v69 = v31;
  uint64_t v70 = v29;
  uint64_t v87 = v30;
  uint64_t v88 = v29;
  CFDictionaryRef v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v89 count:4];
  *(void *)&long long result = 0;
  OSStatus v33 = SecItemCopyMatching(v32, (CFTypeRef *)&result);
  v34 = (void *)result;
  id v73 = v26;
  if (v33 || ![(id)result count])
  {
    v35 = ne_log_obj();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v93 = 67109120;
      *(_DWORD *)&v93[4] = v33;
      _os_log_error_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_ERROR, "failed to retrieve all certificate (%d)", v93, 8u);
    }

    id v26 = v73;
    goto LABEL_30;
  }
  id v49 = v34;

  if (!v49)
  {
LABEL_30:
    SEL v36 = ne_log_obj();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_ERROR, "[NEIKEv2Crypto copyAllCertificates]", (uint8_t *)&buf, 2u);
    }

    SEL v37 = 0;
LABEL_36:
    id v38 = 0;
    goto LABEL_37;
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  SEL v37 = v49;
  uint64_t v50 = [v37 countByEnumeratingWithState:&v89 objects:&buf count:16];
  if (!v50) {
    goto LABEL_84;
  }
  uint64_t v51 = v50;
  uint64_t v52 = *(void *)v90;
  uint64_t v68 = *MEMORY[0x1E4F3BC78];
  uint64_t v67 = *MEMORY[0x1E4F3BD48];
  do
  {
    uint64_t v53 = 0;
    do
    {
      if (*(void *)v90 != v52) {
        objc_enumerationMutation(v37);
      }
      uint64_t v54 = *(void *)(*((void *)&v89 + 1) + 8 * v53);
      long long v55 = (void *)SecCertificateCopyCommonNames();
      v56 = v55;
      if (v55 && [v55 containsObject:v25])
      {
        if (v73
          && (uint64_t v57 = (void *)SecCertificateCopySHA256Digest(),
              int v58 = [v57 isEqualToData:v73],
              v57,
              !v58))
        {
          v63 = ne_log_obj();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_76;
          }
          LODWORD(result) = 138412290;
          uint64_t v25 = v74;
          *(void *)((char *)&result + 4) = v74;
          _os_log_impl(&dword_19DDAF000, v63, OS_LOG_TYPE_DEFAULT, "certificate hash did not match for CN (%@)", (uint8_t *)&result, 0xCu);
        }
        else
        {
          self;
          if (v54)
          {
            *(void *)id v93 = v68;
            uint64_t v94 = v67;
            *(void *)&long long result = v70;
            *((void *)&result + 1) = v54;
            uint64_t v95 = v72;
            uint64_t v96 = v69;
            uint64_t v98 = v71;
            uint64_t v99 = v70;
            CFDictionaryRef v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&result forKeys:v93 count:4];
            *(void *)v100 = 0;
            OSStatus v60 = SecItemCopyMatching(v59, (CFTypeRef *)v100);
            v61 = *(void **)v100;
            if (v60)
            {
              v62 = ne_log_obj();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)id v83 = 0;
                _os_log_fault_impl(&dword_19DDAF000, v62, OS_LOG_TYPE_FAULT, "SecItemCopyMatching failed", v83, 2u);
              }

              v63 = 0;
            }
            else
            {
              v63 = *(id *)v100;

              if (v63) {
                [v66 addObject:v63];
              }
            }
LABEL_76:
            uint64_t v25 = v74;
          }
          else
          {
            id v64 = ne_log_obj();
            uint64_t v25 = v74;
            if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v100 = 136315138;
              *(void *)&v100[4] = "+[NEIKEv2Crypto copyPersistentDataForCertificate:]";
              _os_log_fault_impl(&dword_19DDAF000, v64, OS_LOG_TYPE_FAULT, "%s called with null certificate", v100, 0xCu);
            }

            v63 = 0;
          }
        }
      }
      ++v53;
    }
    while (v51 != v53);
    uint64_t v65 = [v37 countByEnumeratingWithState:&v89 objects:&buf count:16];
    uint64_t v51 = v65;
  }
  while (v65);
LABEL_84:

  id v38 = v66;
  SEL v6 = 0;
  id v26 = v73;
LABEL_37:

LABEL_38:
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v39 = v38;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v79 objects:v85 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v80;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v80 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = +[NEIKEv2Crypto copyCertificateFromPersistentData:isModernSystem:]((uint64_t)NEIKEv2Crypto, *(void **)(*((void *)&v79 + 1) + 8 * j), 0);
        if (v44)
        {
          v45 = (const void *)v44;
          [v3 addObject:v44];
          CFRelease(v45);
        }
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v79 objects:v85 count:16];
    }
    while (v41);
  }

  if (![v3 count] && v74)
  {
    uint64_t v46 = ne_log_obj();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v74;
      _os_log_fault_impl(&dword_19DDAF000, v46, OS_LOG_TYPE_FAULT, "failed to retrieve remote CA cert data by CN (%@)", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v15 = v74;
LABEL_53:

LABEL_54:
  id v47 = v3;
LABEL_55:

  return v3;
}

- (id)copyRemoteCertificateAuthorityHashData
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  if (!v2)
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, "[[NSMutableData alloc] init] failed", buf, 2u);
    }
    goto LABEL_26;
  }
  id v3 = -[NEIKEv2IKESA copyRemoteCertificateAuthorityArray](a1);
  if (!v3)
  {
    uint64_t v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, "[self copyRemoteCertificateAuthorityArray] failed", buf, 2u);
    }

    id v4 = 0;
    goto LABEL_26;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v5) {
    goto LABEL_19;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v18;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v8);
      self;
      if (v9)
      {
        uint64_t v10 = SecCertificateCopySubjectPublicKeyInfoSHA1Digest();
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          [v2 appendData:v10];
          goto LABEL_17;
        }
      }
      else
      {
        SEL v12 = ne_log_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          SEL v23 = "+[NEIKEv2Crypto createCertificateAuthorityPublicKeyHash:]";
          _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "%s called with null certificate", buf, 0xCu);
        }
      }
      uint64_t v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createCertificateAuthorityPublicKeyHash:] failed", buf, 2u);
      }

      uint64_t v11 = 0;
LABEL_17:

      ++v8;
    }
    while (v6 != v8);
    uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v6);
LABEL_19:

  if (![v2 length])
  {
LABEL_26:
    id v14 = 0;
    goto LABEL_27;
  }
  id v14 = v2;
LABEL_27:

  return v14;
}

- (uint64_t)copyLocalSecIdentity
{
  id v3 = objc_getProperty(a1, a2, 264, 1);
  uint64_t v5 = objc_getProperty(a1, v4, 272, 1);
  if (v3)
  {
    uint64_t v6 = +[NEIKEv2Crypto copySecIdentity:keyData:isModernSystem:]((uint64_t)NEIKEv2Crypto, v3, v5, a1[22] & 1);
  }
  else
  {
    uint64_t v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, "No configured local certificate identity", v9, 2u);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (NSObject)copyLocalCertificateData
{
  id v2 = (__SecIdentity *)[(NEIKEv2IKESA *)a1 copyLocalSecIdentity];
  if (v2)
  {
    id v3 = v2;
    SecCertificateRef certificateRef = 0;
    OSStatus v4 = SecIdentityCopyCertificate(v2, &certificateRef);
    CFRelease(v3);
    if (!certificateRef || v4)
    {
      if (certificateRef)
      {
        CFRelease(certificateRef);
        SecCertificateRef certificateRef = 0;
      }
      uint64_t v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "SecIdentityCopyCertificate failed", buf, 2u);
      }
    }
    else
    {
      CFDataRef v5 = SecCertificateCopyData(certificateRef);
      if (certificateRef)
      {
        CFRelease(certificateRef);
        SecCertificateRef certificateRef = 0;
      }
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = v6;
LABEL_19:

        return v7;
      }
      uint64_t v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v11[0] = 0;
        _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, "SecCertificateCopyData failed", (uint8_t *)v11, 2u);
      }

      uint64_t v6 = 0;
    }
    uint64_t v7 = 0;
    goto LABEL_19;
  }
  uint64_t v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v14 = 0;
    _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "[self copyLocalSecIdentity]", v14, 2u);
  }

  return 0;
}

- (CFTypeRef)copyCertSigningKey
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = (__SecIdentity *)[(NEIKEv2IKESA *)a1 copyLocalSecIdentity];
  if (!v2)
  {
    uint64_t v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(cf[0]) = 0;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "[self copyLocalSecIdentity]", (uint8_t *)cf, 2u);
    }

    return 0;
  }
  id v3 = v2;
  cf[0] = 0;
  OSStatus v4 = SecIdentityCopyPrivateKey(v2, (SecKeyRef *)cf);
  CFRelease(v3);
  CFTypeRef result = cf[0];
  if (!cf[0] || v4)
  {
    if (cf[0])
    {
      CFRelease(cf[0]);
      cf[0] = 0;
    }
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      OSStatus v10 = v4;
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "SecIdentityCopyPrivateKey (%d) failed", buf, 8u);
    }

    return 0;
  }
  return result;
}

- (uint64_t)updateIntAuthWithPacket:(uint64_t)a1
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  OSStatus v4 = a2;
  if (a1)
  {
    id v5 = objc_getProperty((id)a1, v3, 96, 1);
    uint64_t v7 = [(NEIKEv2IKESAProposal *)v5 prfProtocol];

    if (v7)
    {
      uint64_t v9 = [(NEIKEv2IntermediatePacket *)v4 authenticatedData];

      if (v9)
      {
        SEL v12 = [(NEIKEv2IntermediatePacket *)v4 authenticatedData];
        if (v4 && (objc_setProperty_atomic(v4, v11, 0, 96), (v4[11] & 1) != 0))
        {
          v34 = objc_getProperty((id)a1, v11, 232, 1);

          if (v34)
          {
            SEL v36 = objc_getProperty((id)a1, v35, 192, 1);
            uint64_t v37 = [v36 length];
            CFIndex v38 = [v12 length] + v37;

            CFMutableDataRef v19 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E4F1CA58], v38);
            if (v19)
            {
              uint64_t v40 = objc_getProperty((id)a1, v39, 192, 1);
              [(__CFData *)v19 appendData:v40];

              [(__CFData *)v19 appendData:v12];
              uint64_t v42 = objc_getProperty((id)a1, v41, 232, 1);
              id v44 = objc_getProperty((id)a1, v43, 96, 1);
              uint64_t v46 = [(NEIKEv2IKESAProposal *)v44 prfProtocol];
              id v47 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v19, v42, v46);
              objc_setProperty_atomic((id)a1, v48, v47, 192);

              uint64_t v50 = objc_getProperty((id)a1, v49, 192, 1);

              if (!v50)
              {
                uint64_t v31 = ne_log_obj();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                {
                  LOWORD(v56) = 0;
                  CFDictionaryRef v32 = "[NEIKEv2Crypto createHMACFromData:key:prfProtocol:] failed";
                  goto LABEL_32;
                }
LABEL_25:

                goto LABEL_26;
              }
LABEL_19:

              a1 = 1;
LABEL_27:

              goto LABEL_28;
            }
            uint64_t v31 = ne_log_obj();
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
              goto LABEL_25;
            }
            int v56 = 134217984;
            uint64_t v57 = (const char *)v38;
            CFDictionaryRef v32 = "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed";
LABEL_38:
            uint64_t v54 = v31;
            uint32_t v55 = 12;
            goto LABEL_33;
          }
          uint64_t v51 = ne_log_obj();
          if (!os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
            goto LABEL_23;
          }
          int v56 = 136315138;
          uint64_t v57 = "-[NEIKEv2IKESA(Crypto) updateIntAuthWithPacket:]";
          uint64_t v52 = "%s called with null self.skPi";
        }
        else
        {
          uint64_t v13 = objc_getProperty((id)a1, v11, 248, 1);

          if (v13)
          {
            uint64_t v15 = objc_getProperty((id)a1, v14, 200, 1);
            uint64_t v16 = [v15 length];
            CFIndex v17 = [v12 length] + v16;

            CFMutableDataRef v19 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E4F1CA58], v17);
            if (v19)
            {
              long long v20 = objc_getProperty((id)a1, v18, 200, 1);
              [(__CFData *)v19 appendData:v20];

              [(__CFData *)v19 appendData:v12];
              SEL v22 = objc_getProperty((id)a1, v21, 248, 1);
              id v24 = objc_getProperty((id)a1, v23, 96, 1);
              id v26 = [(NEIKEv2IKESAProposal *)v24 prfProtocol];
              uint64_t v27 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v19, v22, v26);
              objc_setProperty_atomic((id)a1, v28, v27, 200);

              uint64_t v30 = objc_getProperty((id)a1, v29, 200, 1);

              if (!v30)
              {
                uint64_t v31 = ne_log_obj();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                {
                  LOWORD(v56) = 0;
                  CFDictionaryRef v32 = "[NEIKEv2Crypto createHMACFromData:key:prfProtocol:] failed";
LABEL_32:
                  uint64_t v54 = v31;
                  uint32_t v55 = 2;
LABEL_33:
                  _os_log_fault_impl(&dword_19DDAF000, v54, OS_LOG_TYPE_FAULT, v32, (uint8_t *)&v56, v55);
                  goto LABEL_25;
                }
                goto LABEL_25;
              }
              goto LABEL_19;
            }
            uint64_t v31 = ne_log_obj();
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
              goto LABEL_25;
            }
            int v56 = 134217984;
            uint64_t v57 = (const char *)v17;
            CFDictionaryRef v32 = "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed";
            goto LABEL_38;
          }
          uint64_t v51 = ne_log_obj();
          if (!os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
            goto LABEL_23;
          }
          int v56 = 136315138;
          uint64_t v57 = "-[NEIKEv2IKESA(Crypto) updateIntAuthWithPacket:]";
          uint64_t v52 = "%s called with null self.skPr";
        }
        _os_log_fault_impl(&dword_19DDAF000, v51, OS_LOG_TYPE_FAULT, v52, (uint8_t *)&v56, 0xCu);
LABEL_23:

        goto LABEL_26;
      }
      SEL v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v56 = 136315138;
        uint64_t v57 = "-[NEIKEv2IKESA(Crypto) updateIntAuthWithPacket:]";
        OSStatus v33 = "%s called with null packet.authenticatedData";
        goto LABEL_15;
      }
    }
    else
    {
      SEL v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v56 = 136315138;
        uint64_t v57 = "-[NEIKEv2IKESA(Crypto) updateIntAuthWithPacket:]";
        OSStatus v33 = "%s called with null self.chosenProposal.prfProtocol";
LABEL_15:
        _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, v33, (uint8_t *)&v56, 0xCu);
      }
    }
LABEL_26:
    a1 = 0;
    goto LABEL_27;
  }
LABEL_28:

  return a1;
}

- (CFMutableDataRef)createIntAuthOctets
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id Property = objc_getProperty(self, a2, 96, 1);
    id v5 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v4, 120, 1);
    }
  }
  else
  {
    id v5 = 0;
    id Property = 0;
  }
  id v6 = Property;

  if (v6)
  {
    uint64_t v8 = objc_getProperty(self, v7, 192, 1);

    if (v8)
    {
      OSStatus v10 = objc_getProperty(self, v9, 200, 1);

      if (v10)
      {
        unsigned int v28 = bswap32(self[7]);
        SEL v12 = objc_getProperty(self, v11, 192, 1);
        uint64_t v13 = [v12 length];
        uint64_t v15 = objc_getProperty(self, v14, 200, 1);
        CFIndex v16 = v13 + [v15 length] + 4;

        CFMutableDataRef v18 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E4F1CA58], v16);
        if (v18)
        {
          CFMutableDataRef v19 = objc_getProperty(self, v17, 192, 1);
          [(__CFData *)v18 appendData:v19];

          SEL v21 = objc_getProperty(self, v20, 200, 1);
          [(__CFData *)v18 appendData:v21];

          [(__CFData *)v18 appendBytes:&v28 length:4];
          SEL v22 = v18;
        }
        else
        {
          uint64_t v27 = ne_log_obj();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)long long buf = 134217984;
            uint64_t v30 = (const char *)v16;
            _os_log_fault_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed", buf, 0xCu);
          }
        }
        return v18;
      }
      uint64_t v25 = ne_log_obj();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
LABEL_16:

        return 0;
      }
      *(_DWORD *)long long buf = 136315138;
      uint64_t v30 = "-[NEIKEv2IKESA(Crypto) createIntAuthOctets]";
      id v26 = "%s called with null self.intAuthR";
    }
    else
    {
      uint64_t v25 = ne_log_obj();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        goto LABEL_16;
      }
      *(_DWORD *)long long buf = 136315138;
      uint64_t v30 = "-[NEIKEv2IKESA(Crypto) createIntAuthOctets]";
      id v26 = "%s called with null self.intAuthI";
    }
    _os_log_fault_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_FAULT, v26, buf, 0xCu);
    goto LABEL_16;
  }
  SEL v23 = (objc_class *)MEMORY[0x1E4F1C9B8];

  return (CFMutableDataRef)objc_alloc_init(v23);
}

- (NSObject)createAuthenticationDataForSharedSecret:(void *)a3 octets:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (!v5)
  {
    SEL v21 = ne_log_obj();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_14;
    }
    int v24 = 136315138;
    uint64_t v25 = "-[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:]";
    SEL v22 = "%s called with null sharedSecretData";
    goto LABEL_17;
  }
  if (a1) {
    id Property = objc_getProperty(a1, v6, 96, 1);
  }
  else {
    id Property = 0;
  }
  id v9 = Property;

  if (!v9)
  {
    SEL v21 = ne_log_obj();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
LABEL_14:

      SEL v20 = 0;
      goto LABEL_15;
    }
    int v24 = 136315138;
    uint64_t v25 = "-[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:]";
    SEL v22 = "%s called with null self.chosenProposal";
LABEL_17:
    _os_log_fault_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_FAULT, v22, (uint8_t *)&v24, 0xCu);
    goto LABEL_14;
  }
  if (a1) {
    id v11 = objc_getProperty(a1, v10, 96, 1);
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  SEL v14 = [(NEIKEv2IKESAProposal *)v12 prfProtocol];

  if (!v14)
  {
    SEL v21 = ne_log_obj();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_14;
    }
    int v24 = 136315138;
    uint64_t v25 = "-[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:]";
    SEL v22 = "%s called with null self.chosenProposal.prfProtocol";
    goto LABEL_17;
  }
  if (a1) {
    id v16 = objc_getProperty(a1, v15, 96, 1);
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;
  CFMutableDataRef v19 = [(NEIKEv2IKESAProposal *)v17 prfProtocol];
  SEL v20 = +[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:prfProtocol:]((uint64_t)NEIKEv2IKESA, v5, v7, v19);

LABEL_15:
  return v20;
}

+ (NSObject)createAuthenticationDataForSharedSecret:(void *)a3 octets:(void *)a4 prfProtocol:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  if (!v6)
  {
    id v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
LABEL_10:
      id v11 = 0;
      goto LABEL_6;
    }
    int v15 = 136315138;
    id v16 = "+[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:prfProtocol:]";
    uint64_t v13 = "%s called with null sharedSecretData";
LABEL_15:
    _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v15, 0xCu);
    goto LABEL_10;
  }
  if (!v8)
  {
    id v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v15 = 136315138;
    id v16 = "+[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:prfProtocol:]";
    uint64_t v13 = "%s called with null prfProtocol";
    goto LABEL_15;
  }
  id v9 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:"Key Pad for IKEv2" length:17 freeWhenDone:0];
  OSStatus v10 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v9, v6, v8);
  if (v10)
  {
    id v11 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v7, v10, v8);
  }
  else
  {
    SEL v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createHMACFromData:key:prfProtocol:] failed", (uint8_t *)&v15, 2u);
    }

    id v11 = 0;
  }

LABEL_6:
  return v11;
}

- (NSObject)createInitiatorSignedOctetsUsingPrimeKey:(uint64_t)a1
{
  int v2 = (int)a2;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  OSStatus v4 = [(NEIKEv2IKESA *)(unsigned char *)a1 initiatorFirstMessage];

  if (v4)
  {
    id v6 = [(NEIKEv2IKESA *)(unsigned char *)a1 responderNonce];

    if (!v6)
    {
      OSStatus v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v54 = 136315138;
        uint32_t v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
        id v11 = "%s called with null self.responderNonce";
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    if (v2)
    {
      id v8 = objc_getProperty((id)a1, v7, 240, 1);

      if (!v8)
      {
        OSStatus v10 = ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          int v54 = 136315138;
          uint32_t v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
          id v11 = "%s called with null self.skPiPrime";
LABEL_26:
          _os_log_fault_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_FAULT, v11, (uint8_t *)&v54, 0xCu);
          goto LABEL_27;
        }
        goto LABEL_27;
      }
    }
    else
    {
      id v12 = objc_getProperty((id)a1, v7, 232, 1);

      if (!v12)
      {
        OSStatus v10 = ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          int v54 = 136315138;
          uint32_t v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
          id v11 = "%s called with null self.skPi";
          goto LABEL_26;
        }
        goto LABEL_27;
      }
    }
    if (a1) {
      id Property = objc_getProperty((id)a1, v9, 96, 1);
    }
    else {
      id Property = 0;
    }
    id v14 = Property;

    if (!v14)
    {
      OSStatus v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v54 = 136315138;
        uint32_t v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
        id v11 = "%s called with null self.chosenProposal";
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    if (a1 && (*(unsigned char *)(a1 + 9) & 1) != 0)
    {
      WeakRetained = (NEIKEv2IdentifierPayload *)objc_loadWeakRetained((id *)(a1 + 328));
      if (WeakRetained)
      {
        CFMutableDataRef v18 = WeakRetained;
        goto LABEL_31;
      }
    }
    else
    {
      int v15 = *(id *)(a1 + 344);
      if (v15)
      {
        OSStatus v10 = v15;
        id v16 = objc_alloc_init(NEIKEv2IdentifierPayload);
        if (v16)
        {
          CFMutableDataRef v18 = v16;
          objc_setProperty_atomic(v16, v17, v10, 24);
          goto LABEL_32;
        }
LABEL_59:
        ne_log_obj();
        CFMutableDataRef v18 = (NEIKEv2IdentifierPayload *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v18->super.super, OS_LOG_TYPE_FAULT))
        {
          int v54 = 136315138;
          uint32_t v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
          _os_log_fault_impl(&dword_19DDAF000, &v18->super.super, OS_LOG_TYPE_FAULT, "%s called with null idPayload", (uint8_t *)&v54, 0xCu);
        }
        SEL v20 = 0;
        goto LABEL_43;
      }
    }
    CFMutableDataRef v18 = objc_alloc_init(NEIKEv2IdentifierPayload);
    SEL v23 = [(NEIKEv2IKESA *)(unsigned char *)a1 copyInitiatorIdentifier];
    uint64_t v25 = v23;
    if (!v18)
    {

      OSStatus v10 = 0;
      goto LABEL_59;
    }
    objc_setProperty_atomic(v18, v24, v23, 24);

LABEL_31:
    OSStatus v10 = 0;
LABEL_32:
    id v27 = -[NEIKEv2Payload copyPayloadData](v18);
    if (!v27)
    {
      v34 = ne_log_obj();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v54) = 0;
        _os_log_fault_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_FAULT, "[idPayload copyPayloadData] failed", (uint8_t *)&v54, 2u);
      }
      SEL v20 = 0;
      goto LABEL_42;
    }
    if (v2) {
      ptrdiff_t v28 = 240;
    }
    else {
      ptrdiff_t v28 = 232;
    }
    SEL v29 = objc_getProperty((id)a1, v26, v28, 1);
    id v31 = objc_getProperty((id)a1, v30, 96, 1);
    OSStatus v33 = [(NEIKEv2IKESAProposal *)v31 prfProtocol];
    v34 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v27, v29, v33);

    if (!v34)
    {
      uint64_t v37 = ne_log_obj();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v54) = 0;
        _os_log_fault_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createHMACFromData:key:prfProtocol:] failed", (uint8_t *)&v54, 2u);
      }
      SEL v20 = 0;
      goto LABEL_41;
    }
    uint64_t v37 = [(NEIKEv2IKESA *)(unsigned int *)a1 createIntAuthOctets];
    if (v37)
    {
      CFIndex v38 = [(NEIKEv2IKESA *)(unsigned char *)a1 initiatorFirstMessage];
      uint64_t v39 = [v38 length];
      SEL v41 = [(NEIKEv2IKESA *)(unsigned char *)a1 responderNonce];
      uint64_t v42 = [v41 length] + v39;
      uint64_t v43 = [v34 length];
      CFIndex v44 = v42 + [v37 length] + v43;

      CFMutableDataRef v45 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E4F1CA58], v44);
      if (v45)
      {
        CFMutableDataRef v47 = v45;
        SEL v48 = [(NEIKEv2IKESA *)(unsigned char *)a1 initiatorFirstMessage];
        [(__CFData *)v47 appendData:v48];

        uint64_t v50 = [(NEIKEv2IKESA *)(unsigned char *)a1 responderNonce];
        [(__CFData *)v47 appendData:v50];

        [(__CFData *)v47 appendData:v34];
        [(__CFData *)v47 appendData:v37];
        uint64_t v51 = v47;
        SEL v20 = v51;
LABEL_40:

LABEL_41:
LABEL_42:

LABEL_43:
        goto LABEL_28;
      }
      uint64_t v53 = ne_log_obj();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        int v54 = 134217984;
        uint32_t v55 = (const char *)v44;
        _os_log_fault_impl(&dword_19DDAF000, v53, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed", (uint8_t *)&v54, 0xCu);
      }

      uint64_t v51 = 0;
    }
    else
    {
      uint64_t v52 = ne_log_obj();
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        SEL v20 = 0;
        uint64_t v51 = v52;
        goto LABEL_40;
      }
      LOWORD(v54) = 0;
      _os_log_fault_impl(&dword_19DDAF000, v52, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createIntAuthOctets] failed", (uint8_t *)&v54, 2u);
      uint64_t v51 = v52;
    }
    SEL v20 = 0;
    goto LABEL_40;
  }
  OSStatus v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    int v54 = 136315138;
    uint32_t v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
    id v11 = "%s called with null self.initiatorFirstMessage";
    goto LABEL_26;
  }
LABEL_27:
  SEL v20 = 0;
LABEL_28:

  return v20;
}

- (NSObject)createResponderSignedOctetsUsingPrimeKey:(unsigned char *)a1
{
  int v2 = (int)a2;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  OSStatus v4 = [(NEIKEv2IKESA *)a1 responderFirstMessage];

  if (!v4)
  {
    ne_log_obj();
    OSStatus v10 = (NEIKEv2IdentifierPayload *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_FAULT))
    {
      int v49 = 136315138;
      uint64_t v50 = "-[NEIKEv2IKESA(Crypto) createResponderSignedOctetsUsingPrimeKey:]";
      id v11 = "%s called with null self.responderFirstMessage";
      goto LABEL_34;
    }
LABEL_35:
    CFMutableDataRef v45 = 0;
    goto LABEL_36;
  }
  id v6 = [(NEIKEv2IKESA *)a1 initiatorNonce];

  if (!v6)
  {
    ne_log_obj();
    OSStatus v10 = (NEIKEv2IdentifierPayload *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_FAULT))
    {
      int v49 = 136315138;
      uint64_t v50 = "-[NEIKEv2IKESA(Crypto) createResponderSignedOctetsUsingPrimeKey:]";
      id v11 = "%s called with null self.initiatorNonce";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (v2)
  {
    id v8 = objc_getProperty(a1, v7, 256, 1);

    if (!v8)
    {
      ne_log_obj();
      OSStatus v10 = (NEIKEv2IdentifierPayload *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_FAULT))
      {
        int v49 = 136315138;
        uint64_t v50 = "-[NEIKEv2IKESA(Crypto) createResponderSignedOctetsUsingPrimeKey:]";
        id v11 = "%s called with null self.skPrPrime";
LABEL_34:
        _os_log_fault_impl(&dword_19DDAF000, &v10->super.super, OS_LOG_TYPE_FAULT, v11, (uint8_t *)&v49, 0xCu);
        goto LABEL_35;
      }
      goto LABEL_35;
    }
  }
  else
  {
    id v12 = objc_getProperty(a1, v7, 248, 1);

    if (!v12)
    {
      ne_log_obj();
      OSStatus v10 = (NEIKEv2IdentifierPayload *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_FAULT))
      {
        int v49 = 136315138;
        uint64_t v50 = "-[NEIKEv2IKESA(Crypto) createResponderSignedOctetsUsingPrimeKey:]";
        id v11 = "%s called with null self.skPr";
        goto LABEL_34;
      }
      goto LABEL_35;
    }
  }
  if (a1) {
    id Property = objc_getProperty(a1, v9, 96, 1);
  }
  else {
    id Property = 0;
  }
  id v14 = Property;

  if (!v14)
  {
    ne_log_obj();
    OSStatus v10 = (NEIKEv2IdentifierPayload *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_FAULT))
    {
      int v49 = 136315138;
      uint64_t v50 = "-[NEIKEv2IKESA(Crypto) createResponderSignedOctetsUsingPrimeKey:]";
      id v11 = "%s called with null self.chosenProposal";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  OSStatus v10 = objc_alloc_init(NEIKEv2IdentifierPayload);
  uint64_t v17 = [(NEIKEv2IKESA *)a1 copyResponderIdentifier];
  if (v10) {
    objc_setProperty_atomic(v10, v16, v17, 24);
  }

  id v19 = -[NEIKEv2Payload copyPayloadData](v10);
  if (!v19)
  {
    id v27 = ne_log_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v49) = 0;
      _os_log_fault_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_FAULT, "[idPayload copyPayloadData] failed", (uint8_t *)&v49, 2u);
    }
    CFMutableDataRef v45 = 0;
    goto LABEL_29;
  }
  if (v2) {
    ptrdiff_t v20 = 256;
  }
  else {
    ptrdiff_t v20 = 248;
  }
  SEL v22 = objc_getProperty(a1, v18, v20, 1);
  if (a1) {
    id v23 = objc_getProperty(a1, v21, 96, 1);
  }
  else {
    id v23 = 0;
  }
  id v24 = v23;
  uint64_t v26 = [(NEIKEv2IKESAProposal *)v24 prfProtocol];
  id v27 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v19, v22, v26);

  if (!v27)
  {
    SEL v30 = ne_log_obj();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v49) = 0;
      _os_log_fault_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createHMACFromData:key:prfProtocol:] failed", (uint8_t *)&v49, 2u);
    }
    CFMutableDataRef v45 = 0;
    goto LABEL_28;
  }
  SEL v30 = [(NEIKEv2IKESA *)(unsigned int *)a1 createIntAuthOctets];
  if (!v30)
  {
    CFMutableDataRef v47 = ne_log_obj();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
    {
      CFMutableDataRef v45 = 0;
      CFIndex v44 = v47;
      goto LABEL_27;
    }
    LOWORD(v49) = 0;
    _os_log_fault_impl(&dword_19DDAF000, v47, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createIntAuthOctets] failed", (uint8_t *)&v49, 2u);
    CFIndex v44 = v47;
LABEL_48:
    CFMutableDataRef v45 = 0;
    goto LABEL_27;
  }
  id v31 = [(NEIKEv2IKESA *)a1 responderFirstMessage];
  uint64_t v32 = [v31 length];
  v34 = [(NEIKEv2IKESA *)a1 initiatorNonce];
  uint64_t v35 = [v34 length] + v32;
  uint64_t v36 = [v27 length];
  CFIndex v37 = v35 + [v30 length] + v36;

  CFMutableDataRef v38 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E4F1CA58], v37);
  if (!v38)
  {
    SEL v48 = ne_log_obj();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      int v49 = 134217984;
      uint64_t v50 = (const char *)v37;
      _os_log_fault_impl(&dword_19DDAF000, v48, OS_LOG_TYPE_FAULT, "[NESensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed", (uint8_t *)&v49, 0xCu);
    }

    CFIndex v44 = 0;
    goto LABEL_48;
  }
  CFMutableDataRef v40 = v38;
  SEL v41 = [(NEIKEv2IKESA *)a1 responderFirstMessage];
  [(__CFData *)v40 appendData:v41];

  uint64_t v43 = [(NEIKEv2IKESA *)a1 initiatorNonce];
  [(__CFData *)v40 appendData:v43];

  [(__CFData *)v40 appendData:v27];
  [(__CFData *)v40 appendData:v30];
  CFIndex v44 = v40;
  CFMutableDataRef v45 = v44;
LABEL_27:

LABEL_28:
LABEL_29:

LABEL_36:
  return v45;
}

- (uint64_t)createRemoteSignedOctetsUsingPrimeKey:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 9)) {
      return (uint64_t)-[NEIKEv2IKESA createResponderSignedOctetsUsingPrimeKey:]((unsigned char *)a1, a2);
    }
    else {
      return (uint64_t)-[NEIKEv2IKESA createInitiatorSignedOctetsUsingPrimeKey:](a1, a2);
    }
  }
  return a1;
}

- (SecKeyRef)checkValidityOfCertificates:(void *)a1
{
  trust[1] = *(SecTrustRef *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  OSStatus v4 = v3;
  if (!a1)
  {
    SecKeyRef v51 = 0;
    goto LABEL_53;
  }
  if (![v3 count])
  {
    int v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NEIKEv2IKESA(Crypto) checkValidityOfCertificates:]";
      _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, "%s called with null certificateDataArray.count", buf, 0xCu);
    }
    SecKeyRef v51 = 0;
    goto LABEL_52;
  }
  id v6 = objc_getProperty(a1, v5, 88, 1);
  id v7 = [v6 remoteCertificateHostname];

  if (![(__CFString *)v7 length])
  {
    id v9 = objc_getProperty(a1, v8, 88, 1);
    OSStatus v10 = [v9 remoteIdentifier];
    id v11 = [v10 stringValue];

    if ([(__CFString *)v11 length])
    {
      id v7 = v11;
    }
    else
    {
      uint64_t v13 = [(NEIKEv2IKESA *)a1 remoteIdentifier];
      id v7 = [v13 stringValue];
    }
  }
  if (![(__CFString *)v7 length])
  {

    id v7 = 0;
  }
  id v14 = ne_log_obj();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v54 = @"<not set>";
    if (v7) {
      int v54 = v7;
    }
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v54;
    _os_log_debug_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_DEBUG, "Matching remote hostname %@ with remote certificate", buf, 0xCu);
  }

  int v15 = v7;
  self;
  if (v15)
  {
    trust[0] = *(SecTrustRef *)MEMORY[0x1E4F3BBD8];
    *(void *)long long buf = v15;
    CFDictionaryRef v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:trust count:1];
  }
  else
  {
    CFDictionaryRef v16 = 0;
  }
  SecPolicyRef v17 = SecPolicyCreateWithProperties((CFTypeRef)*MEMORY[0x1E4F3BBB8], v16);
  if (v17)
  {
    SecPolicyRef v18 = v17;

    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v19)
    {
      ptrdiff_t v20 = v19;
      CFAllocatorRef v106 = v15;
      SecPolicyRef cf = v18;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      unsigned int v109 = v4;
      id v21 = v4;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v110 objects:v115 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v111;
        CFAllocatorRef v25 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        while (2)
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v111 != v24) {
              objc_enumerationMutation(v21);
            }
            SecCertificateRef v27 = SecCertificateCreateWithData(v25, *(CFDataRef *)(*((void *)&v110 + 1) + 8 * v26));
            if (!v27)
            {
              uint64_t v50 = ne_log_obj();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_fault_impl(&dword_19DDAF000, v50, OS_LOG_TYPE_FAULT, "SecCertificateCreateWithData failed", buf, 2u);
              }

              CFRelease(cf);
              goto LABEL_46;
            }
            SecCertificateRef v28 = v27;
            if (nelog_is_debug_logging_enabled())
            {
              CFAbsoluteTimeGetCurrent();
              SEL v29 = (const void *)SecCertificateCopySummaryProperties();
              SEL v30 = ne_log_large_obj();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = 138412290;
                *(void *)&uint8_t buf[4] = v29;
                _os_log_debug_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_DEBUG, "Certificate Properties:\n%@", buf, 0xCu);
              }

              if (v29) {
                CFRelease(v29);
              }
            }
            NECertificateDateIsValid((uint64_t)v28);
            [v20 addObject:v28];
            CFRelease(v28);
            ++v26;
          }
          while (v23 != v26);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v110 objects:v115 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      if (![v20 count])
      {
        uint32_t v55 = ne_log_obj();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v55, OS_LOG_TYPE_ERROR, "No valid remote certificate", buf, 2u);
        }

        CFRelease(cf);
LABEL_46:
        SecKeyRef v51 = 0;
        OSStatus v4 = v109;
        int v15 = v106;
        goto LABEL_51;
      }
      id v31 = -[NEIKEv2IKESA copyRemoteCertificateAuthorityArray](a1);
      if ([v31 count])
      {
LABEL_30:
        id v33 = objc_getProperty(a1, v32, 88, 1);
        int v34 = [v33 enableCertificateRevocationCheck];
        id v36 = objc_getProperty(a1, v35, 88, 1);
        int v37 = [v36 strictCertificateRevocationCheck];
        CFMutableDataRef v38 = v20;
        id v105 = v31;
        self;
        trust[0] = 0;
        certificates = v38;
        if (v34)
        {
          key = v31;
          id v39 = v36;
          id v40 = v33;
          SEL v41 = ne_log_obj();
          int v15 = v106;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_debug_impl(&dword_19DDAF000, v41, OS_LOG_TYPE_DEBUG, "Request certificate revocation check", buf, 2u);
          }

          if (v37) {
            CFOptionFlags v42 = 11;
          }
          else {
            CFOptionFlags v42 = 3;
          }
          SecPolicyRef Revocation = SecPolicyCreateRevocation(v42);
          CFIndex v44 = v105;
          if (Revocation)
          {
            SecPolicyRef v45 = Revocation;
            id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            if (v46)
            {
              CFMutableDataRef v47 = v46;
              [v46 addObject:cf];
              [v47 addObject:v45];
              CFRelease(v45);
              OSStatus v48 = SecTrustCreateWithCertificates(certificates, v47, trust);

              id v33 = v40;
              id v36 = v39;
              id v31 = key;
LABEL_63:
              if (v48 || !trust[0])
              {
                if (trust[0])
                {
                  CFRelease(trust[0]);
                  trust[0] = 0;
                }
                v62 = ne_log_obj();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_fault_impl(&dword_19DDAF000, v62, OS_LOG_TYPE_FAULT, "SecTrustCreateWithCertificates failed", buf, 2u);
                }

                SecKeyRef v51 = 0;
                CFIndex v44 = v105;
                goto LABEL_94;
              }
              CFIndex v44 = v105;
              if ([v105 count] && (OSStatus v59 = SecTrustSetAnchorCertificates(trust[0], (CFArrayRef)v105)) != 0)
              {
                OSStatus v60 = v59;
                if (trust[0])
                {
                  CFRelease(trust[0]);
                  trust[0] = 0;
                }
                v61 = ne_log_obj();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)long long buf = 67109120;
                  *(_DWORD *)&uint8_t buf[4] = v60;
                  _os_log_fault_impl(&dword_19DDAF000, v61, OS_LOG_TYPE_FAULT, "Failed to set anchor CA certificates for remote certificate validation (%d)", buf, 8u);
                }
              }
              else
              {
                *(_DWORD *)CFDataRef v114 = 0;
                int v63 = MEMORY[0x19F3B7080](trust[0], v114);
                if (!v63)
                {
                  switch(*(_DWORD *)v114)
                  {
                    case 0:
                      id v73 = ne_log_obj();
                      if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_124;
                      }
                      *(_WORD *)long long buf = 0;
                      v74 = "Certificate evaluation error = kSecTrustResultInvalid";
                      goto LABEL_122;
                    case 1:
                    case 4:
                      if ((v34 & v37) == 1)
                      {
                        uint64_t v72 = ne_log_obj();
                        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)long long buf = 0;
                          _os_log_impl(&dword_19DDAF000, v72, OS_LOG_TYPE_INFO, "Strict Certificate Revocation Check is not supported", buf, 2u);
                        }
                      }
                      SecKeyRef v51 = SecTrustCopyKey(trust[0]);
                      if (!trust[0]) {
                        goto LABEL_94;
                      }
                      CFRelease(trust[0]);
                      goto LABEL_152;
                    case 3:
                      id v73 = ne_log_obj();
                      if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_124;
                      }
                      *(_WORD *)long long buf = 0;
                      v74 = "Certificate evaluation error = kSecTrustResultDeny";
                      goto LABEL_122;
                    case 5:
                      id v73 = ne_log_obj();
                      if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_124;
                      }
                      *(_WORD *)long long buf = 0;
                      v74 = "Certificate evaluation error = kSecTrustResultRecoverableTrustFailure";
                      goto LABEL_122;
                    case 6:
                      id v73 = ne_log_obj();
                      if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_124;
                      }
                      *(_WORD *)long long buf = 0;
                      v74 = "Certificate evaluation error = kSecTrustResultFatalTrustFailure";
                      goto LABEL_122;
                    case 7:
                      id v73 = ne_log_obj();
                      if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_124;
                      }
                      *(_WORD *)long long buf = 0;
                      v74 = "Certificate evaluation error = kSecTrustResultOtherError";
LABEL_122:
                      long long v75 = v73;
                      uint32_t v76 = 2;
                      break;
                    default:
                      id v73 = ne_log_obj();
                      if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_124;
                      }
                      *(_DWORD *)long long buf = 67109120;
                      *(_DWORD *)&uint8_t buf[4] = *(_DWORD *)v114;
                      v74 = "Certificate evaluation error = Unknown (%d)";
                      long long v75 = v73;
                      uint32_t v76 = 8;
                      break;
                  }
                  _os_log_error_impl(&dword_19DDAF000, v75, OS_LOG_TYPE_ERROR, v74, buf, v76);
LABEL_124:

                  if (nelog_is_debug_logging_enabled())
                  {
                    CFArrayRef v77 = SecTrustCopyProperties(trust[0]);
                    if (v77)
                    {
                      id v99 = v36;
                      CFArrayRef theArray = v77;
                      long long v78 = ne_log_obj();
                      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)long long buf = 0;
                        _os_log_debug_impl(&dword_19DDAF000, v78, OS_LOG_TYPE_DEBUG, "---------------Returned error strings: ---------------", buf, 2u);
                      }

                      CFIndex Count = CFArrayGetCount(theArray);
                      if (Count >= 1)
                      {
                        CFIndex v79 = 0;
                        keya = (void *)*MEMORY[0x1E4F3BC30];
                        uint64_t v101 = (void *)*MEMORY[0x1E4F3BC38];
                        do
                        {
                          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v79);
                          if (ValueAtIndex)
                          {
                            CFDictionaryRef v81 = ValueAtIndex;
                            CFTypeID v82 = CFGetTypeID(ValueAtIndex);
                            if (v82 == CFDictionaryGetTypeID())
                            {
                              CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v81, keya);
                              if (Value)
                              {
                                CFStringRef v84 = Value;
                                id v85 = v33;
                                CFTypeID v86 = CFGetTypeID(Value);
                                BOOL v87 = v86 == CFStringGetTypeID();
                                id v33 = v85;
                                if (v87)
                                {
                                  CStringPtr = CFStringGetCStringPtr(v84, 0);
                                  if (CStringPtr)
                                  {
                                    long long v89 = CStringPtr;
                                    long long v90 = ne_log_obj();
                                    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_DWORD *)long long buf = 136315138;
                                      *(void *)&uint8_t buf[4] = v89;
                                      _os_log_debug_impl(&dword_19DDAF000, v90, OS_LOG_TYPE_DEBUG, "type = %s", buf, 0xCu);
                                    }

                                    id v33 = v85;
                                  }
                                }
                              }
                              CFStringRef v91 = (const __CFString *)CFDictionaryGetValue(v81, v101);
                              if (v91)
                              {
                                CFStringRef v92 = v91;
                                id v93 = v33;
                                CFTypeID v94 = CFGetTypeID(v91);
                                BOOL v87 = v94 == CFStringGetTypeID();
                                id v33 = v93;
                                if (v87)
                                {
                                  uint64_t v95 = CFStringGetCStringPtr(v92, 0);
                                  if (v95)
                                  {
                                    uint64_t v96 = v95;
                                    v97 = ne_log_obj();
                                    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_DWORD *)long long buf = 136315138;
                                      *(void *)&uint8_t buf[4] = v96;
                                      _os_log_debug_impl(&dword_19DDAF000, v97, OS_LOG_TYPE_DEBUG, "value = %s", buf, 0xCu);
                                    }

                                    id v33 = v93;
                                  }
                                }
                              }
                            }
                          }
                          ++v79;
                        }
                        while (Count != v79);
                      }
                      uint64_t v98 = ne_log_obj();
                      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)long long buf = 0;
                        _os_log_debug_impl(&dword_19DDAF000, v98, OS_LOG_TYPE_DEBUG, "-----------------------------------------------------", buf, 2u);
                      }

                      CFRelease(theArray);
                      id v36 = v99;
                      CFIndex v44 = v105;
                    }
                  }
                  if (trust[0])
                  {
                    CFRelease(trust[0]);
                    SecKeyRef v51 = 0;
LABEL_152:
                    trust[0] = 0;
                    goto LABEL_94;
                  }
                  goto LABEL_82;
                }
                int v64 = v63;
                if (trust[0])
                {
                  CFRelease(trust[0]);
                  trust[0] = 0;
                }
                v61 = ne_log_obj();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 67109120;
                  *(_DWORD *)&uint8_t buf[4] = v64;
                  _os_log_error_impl(&dword_19DDAF000, v61, OS_LOG_TYPE_ERROR, "Remote certificate evaluation error (%d)", buf, 8u);
                }
              }

LABEL_82:
              SecKeyRef v51 = 0;
LABEL_94:

              CFRelease(cf);
              uint64_t v70 = ne_log_obj();
              uint64_t v71 = v70;
              if (v51)
              {
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 138412290;
                  *(void *)&uint8_t buf[4] = v51;
                  _os_log_debug_impl(&dword_19DDAF000, v71, OS_LOG_TYPE_DEBUG, "Certificate public key: %@", buf, 0xCu);
                }

                goto LABEL_102;
              }
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)long long buf = 0;
                _os_log_error_impl(&dword_19DDAF000, v71, OS_LOG_TYPE_ERROR, "Certificate is not trusted", buf, 2u);
              }

LABEL_101:
              SecKeyRef v51 = 0;
LABEL_102:

              OSStatus v4 = v109;
              goto LABEL_51;
            }
            CFRelease(v45);
            uint64_t v69 = ne_log_obj();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_fault_impl(&dword_19DDAF000, v69, OS_LOG_TYPE_FAULT, "[[NSMutableArray alloc] init] failed", buf, 2u);
            }

            SecKeyRef v51 = 0;
            id v33 = v40;
          }
          else
          {
            uint64_t v68 = ne_log_obj();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_fault_impl(&dword_19DDAF000, v68, OS_LOG_TYPE_FAULT, "SecPolicyCreateRevocation failed", buf, 2u);
            }

            SecKeyRef v51 = 0;
          }
          id v36 = v39;
          id v31 = key;
          goto LABEL_94;
        }
        OSStatus v48 = SecTrustCreateWithCertificates(v38, cf, trust);
        int v15 = v106;
        goto LABEL_63;
      }
      id v56 = objc_getProperty(a1, v32, 88, 1);
      uint64_t v57 = [v56 remoteCertificateAuthorityReferences];
      if (v57)
      {
      }
      else
      {
        id v65 = objc_getProperty(a1, v58, 88, 1);
        id v66 = [v65 remoteCertificateAuthorityName];

        if (!v66) {
          goto LABEL_30;
        }
      }
      uint64_t v67 = ne_log_obj();
      int v15 = v106;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v67, OS_LOG_TYPE_ERROR, "remoteCertAuthorityArray missing from config", buf, 2u);
      }

      CFRelease(cf);
      goto LABEL_101;
    }
    CFRelease(v18);
    uint64_t v52 = ne_log_obj();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v52, OS_LOG_TYPE_FAULT, "[[NSMutableArray alloc] init] failed", buf, 2u);
    }

    ptrdiff_t v20 = 0;
  }
  else
  {
    int v49 = ne_log_obj();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)CFDataRef v114 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v49, OS_LOG_TYPE_FAULT, "SecPolicyCreateWithProperties failed", v114, 2u);
    }

    ptrdiff_t v20 = ne_log_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_fault_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_FAULT, "Could not create secure policy with hostname %@", buf, 0xCu);
    }
  }
  SecKeyRef v51 = 0;
LABEL_51:

LABEL_52:
LABEL_53:

  return v51;
}

- (NEIKEv2AuthPayload)copyAuthenticationPayloadUsingPrimeKey:(id *)self
{
  id v3 = self;
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (id *)objc_getProperty(self, a2, 96, 1);
  }
  OSStatus v4 = self;

  if (v4)
  {
    if (v3 && (*((unsigned char *)v3 + 9) & 1) != 0) {
      id v5 = -[NEIKEv2IKESA createInitiatorSignedOctetsUsingPrimeKey:]((uint64_t)v3, a2);
    }
    else {
      id v5 = -[NEIKEv2IKESA createResponderSignedOctetsUsingPrimeKey:](v3, a2);
    }
    id v7 = v5;
    if (!v5)
    {
      id v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, "[self createLocalSignedOctetsUsingPrimeKey:] failed", buf, 2u);
      }
      goto LABEL_66;
    }
    id v9 = [(NEIKEv2IKESA *)v3 authenticationProtocol];
    if ([v9 method] == 2)
    {
      id v11 = [(NEIKEv2IKESA *)v3 sharedSecret];
      id v12 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:](v3, v11, v7);

      if (!v12)
      {
        uint64_t v13 = ne_log_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          id v14 = "createAuthenticationDataForSharedSecret: failed";
LABEL_16:
          int v15 = v13;
          uint32_t v16 = 2;
LABEL_31:
          _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, v14, buf, v16);
        }
LABEL_65:

LABEL_66:
        id v8 = 0;
LABEL_145:

        goto LABEL_146;
      }
LABEL_144:
      id v8 = objc_alloc_init(NEIKEv2AuthPayload);
      -[NEIKEv2AuthPayload setAuthProtocol:]((uint64_t)v8, v9);
      -[NEIKEv2AuthPayload setAuthenticationData:]((uint64_t)v8, v12);

      goto LABEL_145;
    }
    if ([v9 method] == 13)
    {
      if (v3 && (*((unsigned char *)v3 + 9) & 1) != 0)
      {
        BOOL v18 = a2 == 0;
        uint64_t v19 = 232;
        uint64_t v20 = 240;
      }
      else
      {
        BOOL v18 = a2 == 0;
        uint64_t v19 = 248;
        uint64_t v20 = 256;
      }
      if (v18) {
        ptrdiff_t v26 = v19;
      }
      else {
        ptrdiff_t v26 = v20;
      }
      uint64_t v13 = objc_getProperty(v3, v17, v26, 1);
      SecCertificateRef v27 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:](v3, v13, v7);
      if (!v27)
      {
        SecCertificateRef v28 = ne_log_obj();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_FAULT, "createAuthenticationDataForSharedSecret: failed", buf, 2u);
        }

        goto LABEL_65;
      }
      id v12 = v27;

      goto LABEL_144;
    }
    if (![v9 isSignature])
    {
      uint64_t v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        long long v113 = (const char *)v9;
        id v14 = "Unknown auth protocol %@";
        int v15 = v13;
        uint32_t v16 = 12;
        goto LABEL_31;
      }
      goto LABEL_65;
    }
    if (v3)
    {
      id v22 = objc_getProperty(v3, v21, 88, 1);
      uint64_t v23 = v22;
      if (v22 && [v22 localPrivateKeyRef])
      {
        uint64_t v24 = (void *)[v23 localPrivateKeyRef];
        CFRetain(v24);

        if (v24) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v23 = 0;
    }

LABEL_43:
    uint64_t v24 = (void *)[(NEIKEv2IKESA *)v3 copyCertSigningKey];
    if (!v24)
    {
      uint64_t v13 = ne_log_obj();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        goto LABEL_65;
      }
      *(_WORD *)long long buf = 0;
      id v14 = "[self copyCertSigningKey] failed";
      goto LABEL_16;
    }
LABEL_44:
    SEL v29 = [(NEIKEv2IKESA *)v3 authenticationProtocol];
    SEL v30 = &off_1E598D000;
    if ([v29 method] == 1 || (objc_msgSend(v29, "isSignature") & 1) == 0)
    {
      int v34 = v29;
      goto LABEL_50;
    }
    if ([v29 isDigitalSignature])
    {
      id v31 = (char *)+[NEIKEv2Crypto copySignHashProtocolForAuth:]((uint64_t)NEIKEv2Crypto, v29);
      id v32 = v3[14];
      int v33 = [v32 containsObject:v31];

      if (v33)
      {
        int v34 = v29;
      }
      else
      {
        id v56 = ne_log_obj();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          id v93 = v3[14];
          *(_DWORD *)long long buf = 138412546;
          long long v113 = v31;
          __int16 v114 = 2112;
          id v115 = v93;
          _os_log_error_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_ERROR, "Digital signature hash protocol %@ is not supported by peer, supports %@", buf, 0x16u);
        }
        int v34 = 0;
      }

LABEL_50:
      if (!v34)
      {
        CFTypeID v94 = ne_log_obj();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_19DDAF000, v94, OS_LOG_TYPE_FAULT, "Failed to select auth protocol for signature generation", buf, 2u);
        }

        CFRelease(v24);
        id v9 = 0;
        goto LABEL_66;
      }
      SEL v35 = v7;
      id v9 = v34;
      self;
      if ([v35 length])
      {
        uint64_t v36 = +[NEIKEv2Crypto signatureAlgorithmTypeForAuthentication:]((uint64_t)v30[106], v9);
        if (v36)
        {
          CFStringRef v37 = (const __CFString *)v36;
          CFDataRef v38 = v35;
          self;
          error[0] = 0;
          CFDataRef Signature = SecKeyCreateSignature((SecKeyRef)v24, v37, v38, error);

          if (Signature && !error[0])
          {
            id v40 = Signature;

            if ([v9 isDigitalSignature])
            {
              LOBYTE(error[0]) = 0;
              SEL v41 = v9;
              self;
              switch([v41 digitalSignatureAlgorithm])
              {
                case 1:
                  id v42 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                  uint64_t v43 = &NEIKEv2ASN1AlgorithmIdRSAPKCS256;
                  goto LABEL_101;
                case 2:
                  id v42 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                  uint64_t v43 = &NEIKEv2ASN1AlgorithmIdECDSA256;
                  goto LABEL_104;
                case 3:
                  int v70 = [v41 isNonStandard];
                  id v42 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                  if (v70)
                  {
                    uint64_t v43 = &NEIKEv2ASN1AlgorithmIdED25519NonStandard;
                    uint64_t v71 = 4;
                  }
                  else
                  {
                    uint64_t v43 = &NEIKEv2ASN1AlgorithmIdED25519;
LABEL_138:
                    uint64_t v71 = 7;
                  }
                  goto LABEL_139;
                case 4:
                  id v42 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                  uint64_t v43 = &NEIKEv2ASN1AlgorithmIdED448;
                  goto LABEL_138;
                case 5:
                  id v42 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                  uint64_t v43 = &NEIKEv2ASN1AlgorithmIdRSAPKCS384;
                  goto LABEL_101;
                case 6:
                  id v42 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                  uint64_t v43 = &NEIKEv2ASN1AlgorithmIdRSAPKCS512;
LABEL_101:
                  uint64_t v71 = 15;
                  goto LABEL_139;
                case 7:
                  id v42 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                  uint64_t v43 = &NEIKEv2ASN1AlgorithmIdECDSA384;
                  goto LABEL_104;
                case 8:
                  id v42 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                  uint64_t v43 = &NEIKEv2ASN1AlgorithmIdECDSA512;
LABEL_104:
                  uint64_t v71 = 12;
                  goto LABEL_139;
                case 9:
                  id v42 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                  uint64_t v43 = &NEIKEv2ASN1AlgorithmIdRSAPSS256;
                  goto LABEL_108;
                case 10:
                  id v42 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                  uint64_t v43 = &NEIKEv2ASN1AlgorithmIdRSAPSS384;
                  goto LABEL_108;
                case 11:
                  id v42 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                  uint64_t v43 = &NEIKEv2ASN1AlgorithmIdRSAPSS512;
LABEL_108:
                  uint64_t v71 = 67;
LABEL_139:
                  uint64_t v69 = (void *)[v42 initWithBytesNoCopy:v43 length:v71 freeWhenDone:0];

                  if (!v69) {
                    goto LABEL_94;
                  }
                  unint64_t v86 = [v69 length];
                  BOOL v87 = (const char *)v86;
                  if (v86 >= 0x100)
                  {
                    uint64_t v96 = ne_log_obj();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)long long buf = 134217984;
                      long long v113 = v87;
                      _os_log_fault_impl(&dword_19DDAF000, v96, OS_LOG_TYPE_FAULT, "Encoded signature algorithm data length %zu is too long", buf, 0xCu);
                    }

LABEL_94:
                    id v12 = 0;
                  }
                  else
                  {
                    LOBYTE(error[0]) = v86;
                    uint64_t v88 = v86 + [v40 length] + 1;
                    id v12 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v88];
                    [v12 appendBytes:error length:1];
                    [v12 appendData:v69];
                    [v12 appendData:v40];
                  }

                  break;
                default:
                  uint64_t v68 = ne_log_obj();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    long long v113 = (const char *)v41;
                    _os_log_fault_impl(&dword_19DDAF000, v68, OS_LOG_TYPE_FAULT, "Cannot create algorithm identifier for authentication protocol %@", buf, 0xCu);
                  }

                  uint64_t v69 = 0;
                  goto LABEL_94;
              }
            }
            else
            {
              id v40 = v40;
              id v12 = v40;
            }
LABEL_143:

            CFRelease(v24);
            if (!v12) {
              goto LABEL_66;
            }
            goto LABEL_144;
          }
          CFIndex v44 = ne_log_obj();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            long long v113 = (const char *)error[0];
            _os_log_fault_impl(&dword_19DDAF000, v44, OS_LOG_TYPE_FAULT, "Failed to sign with private key: %@", buf, 0xCu);
          }

          if (error[0])
          {
            CFRelease(error[0]);
            error[0] = 0;
          }

          id v40 = 0;
LABEL_63:
          id v12 = 0;
          goto LABEL_143;
        }
        id v40 = ne_log_obj();
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
          goto LABEL_63;
        }
        *(_DWORD *)long long buf = 138412290;
        long long v113 = (const char *)v9;
        uint64_t v95 = "Invalid signature protcol %@";
      }
      else
      {
        id v40 = ne_log_obj();
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
          goto LABEL_63;
        }
        *(_DWORD *)long long buf = 136315138;
        long long v113 = "+[NEIKEv2Crypto copySignatureForData:authProtocol:privateKey:]";
        uint64_t v95 = "%s called with null inputData.length";
      }
      _os_log_fault_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_FAULT, v95, buf, 0xCu);
      goto LABEL_63;
    }
    id v45 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v46 = v3[14];
    CFMutableDataRef v47 = (void *)[v45 initWithSet:v46];

    id v48 = v29;
    self;
    int v49 = v48;
    uint64_t v50 = (void *)+[NEIKEv2Crypto copySignHashSetForAuthMethod:]((uint64_t)NEIKEv2Crypto, v48);
    uint64_t v101 = v29;
    id v102 = v49;
    if (v49
      && ((uint64_t v51 = [v49 method], v51 == 245)
       || v51 == 14 && (unint64_t)([v49 digitalSignatureAlgorithm] - 9) <= 2)
      && (size_t BlockSize = SecKeyGetBlockSize((SecKeyRef)v24), BlockSize <= 0x81))
    {
      unint64_t v57 = BlockSize;
      uint64_t v98 = v47;
      id v99 = v24;
      v97 = v50;
      uint64_t v58 = (void *)[v50 mutableCopy];
      *(_OWORD *)error = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      obuint64_t j = (id)[v58 copy];
      uint64_t v59 = [obj countByEnumeratingWithState:error objects:buf count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v105;
        uint64_t v100 = 8 * v57;
        while (2)
        {
          for (uint64_t i = 0; i != v60; ++i)
          {
            if (*(void *)v105 != v61) {
              objc_enumerationMutation(obj);
            }
            int v63 = (void *)*((void *)error[1] + i);
            unint64_t v64 = [v63 hashType] - 2;
            if (v64 >= 3)
            {
              uint64_t v72 = ne_log_obj();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)uint64_t v108 = 138412290;
                unsigned int v109 = v63;
                _os_log_fault_impl(&dword_19DDAF000, v72, OS_LOG_TYPE_FAULT, "Unexpected hash protocol %@ in RSA-PSS set", v108, 0xCu);
              }

              uint32_t v55 = 0;
              goto LABEL_112;
            }
            if (v57 < 32 * v64 + 66)
            {
              unint64_t v65 = v57;
              id v66 = v58;
              uint64_t v67 = ne_log_obj();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)uint64_t v108 = 138412546;
                unsigned int v109 = v63;
                __int16 v110 = 2048;
                uint64_t v111 = v100;
                _os_log_impl(&dword_19DDAF000, v67, OS_LOG_TYPE_INFO, "Removing too large hash protocol %@ from set for RSA key size %zu", v108, 0x16u);
              }

              uint64_t v58 = v66;
              [v66 removeObject:v63];
              unint64_t v57 = v65;
            }
          }
          uint64_t v60 = [obj countByEnumeratingWithState:error objects:buf count:16];
          if (v60) {
            continue;
          }
          break;
        }
      }

      uint32_t v55 = v58;
LABEL_112:
      uint64_t v24 = v99;
      int v49 = v102;

      int v54 = v97;
      CFMutableDataRef v47 = v98;
    }
    else
    {
      uint64_t v53 = v50;
      int v54 = v50;
      uint32_t v55 = v53;
    }

    id v73 = ne_log_obj();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v91 = v47;
      CFStringRef v92 = (char *)v3[14];
      *(_DWORD *)long long buf = 138412290;
      long long v113 = v92;
      _os_log_debug_impl(&dword_19DDAF000, v73, OS_LOG_TYPE_DEBUG, "Peer hashes: %@", buf, 0xCu);

      CFMutableDataRef v47 = v91;
    }

    v74 = ne_log_obj();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v113 = v55;
      _os_log_debug_impl(&dword_19DDAF000, v74, OS_LOG_TYPE_DEBUG, "Protocol hashes: %@", buf, 0xCu);
    }

    [v47 intersectSet:v55];
    long long v75 = [v47 allObjects];
    uint32_t v76 = [v75 sortedArrayUsingSelector:sel_compare_];

    CFArrayRef v77 = [v76 lastObject];
    if ([v102 method] == 245)
    {
      if (!v77)
      {
        CFTypeID v82 = ne_log_obj();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v82, OS_LOG_TYPE_ERROR, "Unable to find acceptable hash algorithm for generating RSA-PSS signature", buf, 2u);
        }
        goto LABEL_156;
      }
      uint64_t v78 = [v77 hashType];
      switch(v78)
      {
        case 4:
          CFIndex v79 = [NEIKEv2AuthenticationProtocol alloc];
          uint64_t v80 = 11;
          goto LABEL_153;
        case 3:
          CFIndex v79 = [NEIKEv2AuthenticationProtocol alloc];
          uint64_t v80 = 10;
          goto LABEL_153;
        case 2:
          CFIndex v79 = [NEIKEv2AuthenticationProtocol alloc];
          uint64_t v80 = 9;
LABEL_153:
          id v85 = [(NEIKEv2AuthenticationProtocol *)v79 initWithDigitalSignature:v80];
LABEL_154:
          int v34 = v85;
LABEL_157:

          SEL v30 = &off_1E598D000;
          SEL v29 = v101;
          goto LABEL_50;
      }
      CFTypeID v82 = ne_log_obj();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        long long v113 = (const char *)v77;
        long long v90 = "Unexpected hash protocol %@ when selecting RSA-PSS protocol";
LABEL_167:
        _os_log_fault_impl(&dword_19DDAF000, v82, OS_LOG_TYPE_FAULT, v90, buf, 0xCu);
      }
    }
    else
    {
      if (!-[NEIKEv2AuthenticationProtocol isECDSA]((uint64_t)v102))
      {
        CFTypeID v82 = ne_log_obj();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
        {
          id v83 = v3[14];
          *(_DWORD *)long long buf = 138412546;
          long long v113 = (const char *)v102;
          __int16 v114 = 2112;
          id v115 = v83;
          _os_log_fault_impl(&dword_19DDAF000, v82, OS_LOG_TYPE_FAULT, "Unable to determine authentication protocol to use, configured %@ hashes %@", buf, 0x16u);
        }
        goto LABEL_156;
      }
      if (!v77)
      {
        CFStringRef v84 = ne_log_obj();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19DDAF000, v84, OS_LOG_TYPE_INFO, "Unable to find acceptable hash algorithm for generating ECDSA signature", buf, 2u);
        }

        id v85 = v102;
        goto LABEL_154;
      }
      uint64_t v81 = [v77 hashType];
      switch(v81)
      {
        case 4:
          CFIndex v79 = [NEIKEv2AuthenticationProtocol alloc];
          uint64_t v80 = 8;
          goto LABEL_153;
        case 3:
          CFIndex v79 = [NEIKEv2AuthenticationProtocol alloc];
          uint64_t v80 = 7;
          goto LABEL_153;
        case 2:
          CFIndex v79 = [NEIKEv2AuthenticationProtocol alloc];
          uint64_t v80 = 2;
          goto LABEL_153;
      }
      CFTypeID v82 = ne_log_obj();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        long long v113 = (const char *)v77;
        long long v90 = "Unexpected hash protocol %@ when selecting ECDSA protocol";
        goto LABEL_167;
      }
    }
LABEL_156:

    int v34 = 0;
    goto LABEL_157;
  }
  id v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    long long v113 = "-[NEIKEv2IKESA(Crypto) copyAuthenticationPayloadUsingPrimeKey:]";
    _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, "%s called with null self.chosenProposal", buf, 0xCu);
  }
  id v8 = 0;
LABEL_146:

  return v8;
}

- (uint64_t)checkSharedKeyAuthData:(const char *)a3 usingPrimeKey:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = v5;
  if (a1)
  {
    if (v5)
    {
      id v8 = objc_getProperty((id)a1, v6, 96, 1);

      if (v8)
      {
        OSStatus v10 = [(NEIKEv2IKESA *)(id)a1 remoteAuthentication];
        id v11 = v10;
        if (v10)
        {
          if (([v10 isSignature] & 1) == 0
            && ![v11 isSecurePassword])
          {
            uint64_t v16 = -[NEIKEv2IKESA createRemoteSignedOctetsUsingPrimeKey:](a1, a3);
            if (!v16)
            {
              uint64_t v19 = ne_log_obj();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
              {
                LOWORD(v29) = 0;
                _os_log_fault_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_FAULT, "[self createRemoteSignedOctetsUsingPrimeKey:] failed", (uint8_t *)&v29, 2u);
              }

              id v12 = 0;
              goto LABEL_39;
            }
            id v12 = v16;
            if ([v11 method] == 2)
            {
              BOOL v18 = [(NEIKEv2IKESA *)(void *)a1 sharedSecret];
            }
            else
            {
              if ([v11 method] != 13)
              {
LABEL_36:
                SecCertificateRef v27 = ne_log_obj();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
                {
                  int v29 = 136315138;
                  SEL v30 = "-[NEIKEv2IKESA(Crypto) checkSharedKeyAuthData:usingPrimeKey:]";
                  _os_log_fault_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_FAULT, "%s called with null sharedSecret", (uint8_t *)&v29, 0xCu);
                }

                goto LABEL_39;
              }
              if (*(unsigned char *)(a1 + 9))
              {
                id v21 = (void *)a1;
                if (a3) {
                  ptrdiff_t v22 = 256;
                }
                else {
                  ptrdiff_t v22 = 248;
                }
              }
              else
              {
                id v21 = (void *)a1;
                if (a3) {
                  ptrdiff_t v22 = 240;
                }
                else {
                  ptrdiff_t v22 = 232;
                }
              }
              BOOL v18 = objc_getProperty(v21, v20, v22, 1);
            }
            uint64_t v24 = v18;
            if (v18)
            {
              CFAllocatorRef v25 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:]((void *)a1, v18, v12);
              if (v25)
              {
                a1 = +[NEIKEv2Crypto validateCalculatedSharedKeyAuthData:remoteAuthData:]((uint64_t)NEIKEv2Crypto, v25, v7);
              }
              else
              {
                ptrdiff_t v26 = ne_log_obj();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
                {
                  LOWORD(v29) = 0;
                  _os_log_fault_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_FAULT, "createAuthenticationDataForSharedSecret: failed", (uint8_t *)&v29, 2u);
                }

                a1 = 0;
              }

              goto LABEL_40;
            }
            goto LABEL_36;
          }
          id v12 = ne_log_obj();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
LABEL_39:
            a1 = 0;
LABEL_40:

            goto LABEL_41;
          }
          LOWORD(v29) = 0;
          uint64_t v13 = "Do not call checkSharedKeyAuthData with signature/GSPM auth";
          id v14 = v12;
          uint32_t v15 = 2;
        }
        else
        {
          id v12 = ne_log_obj();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            goto LABEL_39;
          }
          int v29 = 136315138;
          SEL v30 = "-[NEIKEv2IKESA(Crypto) checkSharedKeyAuthData:usingPrimeKey:]";
          uint64_t v13 = "%s called with null authentication";
          id v14 = v12;
          uint32_t v15 = 12;
        }
        _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v29, v15);
        goto LABEL_39;
      }
      id v11 = ne_log_obj();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
LABEL_10:
        a1 = 0;
LABEL_41:

        goto LABEL_42;
      }
      int v29 = 136315138;
      SEL v30 = "-[NEIKEv2IKESA(Crypto) checkSharedKeyAuthData:usingPrimeKey:]";
      uint64_t v23 = "%s called with null self.chosenProposal";
    }
    else
    {
      id v11 = ne_log_obj();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        goto LABEL_10;
      }
      int v29 = 136315138;
      SEL v30 = "-[NEIKEv2IKESA(Crypto) checkSharedKeyAuthData:usingPrimeKey:]";
      uint64_t v23 = "%s called with null authenticationData";
    }
    _os_log_fault_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_FAULT, v23, (uint8_t *)&v29, 0xCu);
    goto LABEL_10;
  }
LABEL_42:

  return a1;
}

BOOL __45__NEIKEv2IKESA_Crypto__copyValidateAuthBlock__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  OSStatus v4 = [v3 remoteAuthentication];

  if (v4)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = (uint64_t)WeakRetained;
    if (WeakRetained)
    {
      id v7 = WeakRetained[47];
      if (!v7)
      {
        id v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          uint64_t v58 = "-[NEIKEv2IKESA(Crypto) copyValidateAuthBlock]_block_invoke";
          _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "%s called with null authenticationData", buf, 0xCu);
        }
        BOOL v11 = 0;
        goto LABEL_63;
      }
      id v8 = v7;
      id v9 = *(id *)(v6 + 368);
      OSStatus v10 = v9;
      if (v9)
      {
        if ([v9 isSecurePassword])
        {
          BOOL v11 = 1;
LABEL_62:

LABEL_63:
          goto LABEL_64;
        }
        id v12 = [v3 remoteAuthentication];
        char v13 = +[NEIKEv2Crypto isRemoteAuthenticationPacketProtocol:compatibleWithConfiguredProtocol:]((uint64_t)NEIKEv2Crypto, v10, v12);

        if ((v13 & 1) == 0)
        {
          uint64_t v16 = ne_log_obj();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v48 = [v3 remoteAuthentication];
            *(_DWORD *)long long buf = 138412546;
            uint64_t v58 = v48;
            __int16 v59 = 2112;
            uint64_t v60 = (uint64_t)v10;
            _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "Auth protocols are not compatible between config %@ and packet %@", buf, 0x16u);
          }
          goto LABEL_23;
        }
        if ((*(unsigned char *)(v6 + 24) & 1) == 0)
        {
LABEL_12:
          int v14 = 0;
LABEL_13:
          uint64_t v15 = -[NEIKEv2IKESA createRemoteSignedOctetsUsingPrimeKey:](v6, 0);
          if (v15)
          {
            uint64_t v16 = v15;
            id v17 = v10;
            BOOL v18 = [v3 remoteAuthentication];
            int v19 = [v18 isNonStandard];

            if (v19)
            {
              uint64_t v20 = [v3 remoteAuthentication];

              id v17 = (id)v20;
            }
            if ([v17 isSignature])
            {
              ptrdiff_t v22 = (__SecKey *)-[NEIKEv2SessionConfiguration copyRemoteAuthKey](v3);
              if (v22)
              {
                uint64_t v23 = v22;
                int v24 = +[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]((uint64_t)NEIKEv2Crypto, v8, v16, v17, v22);
                CFRelease(v23);
                if (v24)
                {
                  BOOL v11 = 1;
                  *(unsigned char *)(v6 + 18) = 1;
                  if (v14) {
                    *(unsigned char *)(v6 + 19) = 1;
                  }
                  goto LABEL_60;
                }
                if (!v14)
                {
LABEL_43:
                  BOOL v11 = 0;
LABEL_60:

                  goto LABEL_61;
                }
              }
              else
              {
                uint64_t v53 = ne_log_obj();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_fault_impl(&dword_19DDAF000, v53, OS_LOG_TYPE_FAULT, "Responder configuration is missing remote public key", buf, 2u);
                }
              }
              [(NEIKEv2IKESA *)(void *)v6 restorePrimeKeys];
              goto LABEL_43;
            }
            id v56 = v16;
            id v33 = objc_getProperty((id)v6, v21, 96, 1);
            SEL v35 = [(NEIKEv2IKESAProposal *)v33 prfProtocol];

            int v36 = v14;
            if ([v17 method] == 2)
            {
              uint64_t v37 = (uint64_t)+[NEIKEv2IKESA copySharedSecretFromConfig:]((uint64_t)NEIKEv2IKESA, v3);
            }
            else
            {
              if ([v17 method] != 13)
              {
                id v39 = 0;
                goto LABEL_54;
              }
              uint64_t v37 = objc_getProperty((id)v6, v38, 232, 1);
            }
            id v39 = (void *)v37;
LABEL_54:
            id v45 = +[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:prfProtocol:]((uint64_t)NEIKEv2IKESA, v39, v56, v35);
            BOOL v11 = +[NEIKEv2Crypto validateCalculatedSharedKeyAuthData:remoteAuthData:]((uint64_t)NEIKEv2Crypto, v45, v8);
            if (v11)
            {
              *(unsigned char *)(v6 + 18) = 1;
              if (v36) {
                *(unsigned char *)(v6 + 19) = 1;
              }
            }
            else if (v36)
            {
              [(NEIKEv2IKESA *)(void *)v6 restorePrimeKeys];
            }

            uint64_t v16 = v56;
            goto LABEL_60;
          }
          uint64_t v51 = ne_log_obj();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            uint64_t v58 = "-[NEIKEv2IKESA(Crypto) copyValidateAuthBlock]_block_invoke";
            _os_log_fault_impl(&dword_19DDAF000, v51, OS_LOG_TYPE_FAULT, "%s called with null remoteSignedOctets", buf, 0xCu);
          }

          [(NEIKEv2IKESA *)(void *)v6 restorePrimeKeys];
          uint64_t v16 = 0;
LABEL_23:
          BOOL v11 = 0;
LABEL_61:

          goto LABEL_62;
        }
        if (!*(void *)(v6 + 416))
        {
          if ([v3 ppkMandatory])
          {
            uint64_t v16 = ne_log_obj();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long buf = 0;
              _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "No PPK ID received with mandatory PPK auth", buf, 2u);
            }
            goto LABEL_23;
          }
          goto LABEL_12;
        }
        if ([v3 ppkIDType] != 2
          || ([v3 ppkID], ptrdiff_t v26 = objc_claimAutoreleasedReturnValue(), v26, v26))
        {
          uint64_t v27 = [v3 ppkIDType];
          uint64_t v16 = [v3 ppkID];
          if (*(void *)(v6 + 416) == v27)
          {
            id v28 = *(id *)(v6 + 424);
            if ([v28 length] || -[NSObject length](v16, "length"))
            {
              id v29 = *(id *)(v6 + 424);
              char v30 = [v29 isEqualToData:v16];

              if ((v30 & 1) == 0)
              {
                uint64_t v31 = ne_log_obj();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  id v32 = (char *)*(id *)(v6 + 424);
                  *(_DWORD *)long long buf = 138412546;
                  uint64_t v58 = v32;
                  __int16 v59 = 2112;
                  uint64_t v60 = (uint64_t)v16;
                  _os_log_error_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_ERROR, "PPK ID %@ != Expected %@", buf, 0x16u);
                }
LABEL_46:

                if ([v3 ppkMandatory])
                {
                  id v40 = ne_log_obj();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)long long buf = 0;
                    SEL v41 = "Wrong PPK ID received with mandatory PPK auth";
LABEL_76:
                    _os_log_error_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_ERROR, v41, buf, 2u);
                    goto LABEL_69;
                  }
                  goto LABEL_69;
                }
                id v42 = *(id *)(v6 + 384);

                uint64_t v43 = ne_log_obj();
                id v40 = v43;
                if (!v42)
                {
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)long long buf = 0;
                    SEL v41 = "Wrong PPK ID received and no non-PPK AUTH data received";
                    goto LABEL_76;
                  }
LABEL_69:

                  goto LABEL_23;
                }
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_DEFAULT, "Wrong PPK ID received, falling back to non-PPK AUTH data", buf, 2u);
                }

                CFIndex v44 = *(id *)(v6 + 384);
                int v14 = 0;
                id v8 = v44;
LABEL_74:

                goto LABEL_13;
              }
            }
            else
            {
            }
            id v40 = +[NEIKEv2IKESA copyPPKFromConfig:]((uint64_t)NEIKEv2IKESA, v3);
            if (v40)
            {
              if (-[NEIKEv2IKESA generateDerivativesFromPPK:](v6, v40))
              {

                int v14 = 1;
                goto LABEL_74;
              }
              int v54 = ne_log_obj();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                uint32_t v55 = *(const char **)(a1 + 32);
                *(_DWORD *)long long buf = 138412290;
                uint64_t v58 = v55;
                _os_log_error_impl(&dword_19DDAF000, v54, OS_LOG_TYPE_ERROR, "%@ Failed to generate PPK-derived keys", buf, 0xCu);
              }
            }
            else
            {
              int v54 = ne_log_obj();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_fault_impl(&dword_19DDAF000, v54, OS_LOG_TYPE_FAULT, "PPK use negotiated but PPK not present in configuration", buf, 2u);
              }
            }

            goto LABEL_69;
          }
          uint64_t v31 = ne_log_obj();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            uint64_t v50 = *(const char **)(v6 + 416);
            *(_DWORD *)long long buf = 134218240;
            uint64_t v58 = v50;
            __int16 v59 = 2048;
            uint64_t v60 = v27;
            _os_log_error_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_ERROR, "PPK Type %zu != Expected Type %zu", buf, 0x16u);
          }
          goto LABEL_46;
        }
        uint64_t v16 = ne_log_obj();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          goto LABEL_23;
        }
        *(_DWORD *)long long buf = 136315138;
        uint64_t v58 = "-[NEIKEv2IKESA(Crypto) copyValidateAuthBlock]_block_invoke";
        int v49 = "%s called with null authCheckConfig.ppkID";
      }
      else
      {
        uint64_t v16 = ne_log_obj();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          goto LABEL_23;
        }
        *(_DWORD *)long long buf = 136315138;
        uint64_t v58 = "-[NEIKEv2IKESA(Crypto) copyValidateAuthBlock]_block_invoke";
        int v49 = "%s called with null packetAuthentication";
      }
      _os_log_fault_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_FAULT, v49, buf, 0xCu);
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v58 = "-[NEIKEv2IKESA(Crypto) copyValidateAuthBlock]_block_invoke";
      _os_log_fault_impl(&dword_19DDAF000, (os_log_t)v6, OS_LOG_TYPE_FAULT, "%s called with null authCheckConfig.remoteAuthentication", buf, 0xCu);
    }
  }
  BOOL v11 = 0;
LABEL_64:

  return v11;
}

- (NSObject)createInitiatorEAPAuthenticationDataUsingPrimeKey:(NSObject *)self
{
  int v2 = self;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id v4 = objc_getProperty(self, a2, 448, 1);

    if (v4)
    {
      id v6 = objc_getProperty(v2, v5, 96, 1);

      if (v6)
      {
        id v8 = -[NEIKEv2IKESA createInitiatorSignedOctetsUsingPrimeKey:]((uint64_t)v2, a2);
        if (v8)
        {
          id v9 = objc_getProperty(v2, v7, 448, 1);
          OSStatus v10 = -[NEIKEv2EAP sessionKey]((uint64_t)v9);

          if (v10
            || (!a2 ? (ptrdiff_t v12 = 232) : (ptrdiff_t v12 = 240),
                objc_getProperty(v2, v11, v12, 1),
                (OSStatus v10 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            char v13 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:](v2, v10, v8);
            if (v13)
            {
              int v2 = v13;
LABEL_24:

              goto LABEL_25;
            }
            uint64_t v16 = ne_log_obj();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              LOWORD(v18) = 0;
              _os_log_fault_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_FAULT, "createAuthenticationDataForSharedSecret failed", (uint8_t *)&v18, 2u);
            }

LABEL_23:
            int v2 = 0;
            goto LABEL_24;
          }
          OSStatus v10 = ne_log_obj();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
            goto LABEL_23;
          }
          LOWORD(v18) = 0;
          uint64_t v15 = "skPi failed";
        }
        else
        {
          OSStatus v10 = ne_log_obj();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
            goto LABEL_23;
          }
          LOWORD(v18) = 0;
          uint64_t v15 = "createInitiatorSignedOctetsUsingPrimeKey: failed";
        }
        _os_log_fault_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v18, 2u);
        goto LABEL_23;
      }
      id v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
LABEL_15:
        int v2 = 0;
LABEL_25:

        return v2;
      }
      int v18 = 136315138;
      int v19 = "-[NEIKEv2IKESA(Crypto) createInitiatorEAPAuthenticationDataUsingPrimeKey:]";
      int v14 = "%s called with null self.chosenProposal";
    }
    else
    {
      id v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        goto LABEL_15;
      }
      int v18 = 136315138;
      int v19 = "-[NEIKEv2IKESA(Crypto) createInitiatorEAPAuthenticationDataUsingPrimeKey:]";
      int v14 = "%s called with null self.eapClient";
    }
    _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v18, 0xCu);
    goto LABEL_15;
  }
  return v2;
}

- (NSObject)createInitiatorGSPMAuthenticationDataUsingPrimeKey:(NSObject *)self
{
  int v2 = self;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id v4 = objc_getProperty(self, a2, 456, 1);

    if (v4)
    {
      id v6 = objc_getProperty(v2, v5, 96, 1);

      if (v6)
      {
        id v8 = -[NEIKEv2IKESA createInitiatorSignedOctetsUsingPrimeKey:]((uint64_t)v2, a2);
        if (!v8)
        {
          int v14 = ne_log_obj();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v30) = 0;
            _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, "createInitiatorSignedOctets failed", (uint8_t *)&v30, 2u);
          }
          int v2 = 0;
          goto LABEL_25;
        }
        char v9 = BYTE1(v2[1].isa);
        id v10 = objc_getProperty(v2, v7, 456, 1);
        BOOL v11 = v10;
        if (v9) {
          ptrdiff_t v12 = -[NEIKEv2GSPM createLocalSignedOctets]((uint64_t)v10);
        }
        else {
          ptrdiff_t v12 = -[NEIKEv2GSPM createRemoteSignedOctets]((uint64_t)v10);
        }
        int v14 = v12;

        if (!v14)
        {
          id v17 = ne_log_obj();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v30) = 0;
            _os_log_fault_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_FAULT, "creatInitiatorSignedOctets(GSPM) failed", (uint8_t *)&v30, 2u);
          }
          int v2 = 0;
          goto LABEL_24;
        }
        uint64_t v15 = [v8 length];
        uint64_t v16 = [v14 length];
        id v17 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E4F1CA58], v16 + v15);
        [v17 appendData:v8];
        [v17 appendData:v14];
        id v19 = objc_getProperty(v2, v18, 456, 1);
        uint64_t v20 = v19;
        if (v19) {
          id v21 = (void *)*((void *)v19 + 1);
        }
        else {
          id v21 = 0;
        }
        id v22 = v21;

        if (v22)
        {
          id v24 = objc_getProperty(v2, v23, 96, 1);
          ptrdiff_t v26 = [(NEIKEv2IKESAProposal *)v24 prfProtocol];
          int v2 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v17, v22, v26);

          if (v2)
          {
LABEL_20:

LABEL_24:
LABEL_25:

            goto LABEL_26;
          }
          id v28 = ne_log_obj();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
LABEL_33:

            int v2 = 0;
            goto LABEL_20;
          }
          LOWORD(v30) = 0;
          id v29 = "createAuthenticationDataForSharedSecret failed";
        }
        else
        {
          id v28 = ne_log_obj();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          LOWORD(v30) = 0;
          id v29 = "GSPM.sessionKey failed";
        }
        _os_log_fault_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_FAULT, v29, (uint8_t *)&v30, 2u);
        goto LABEL_33;
      }
      id v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
LABEL_10:
        int v2 = 0;
LABEL_26:

        return v2;
      }
      int v30 = 136315138;
      uint64_t v31 = "-[NEIKEv2IKESA(Crypto) createInitiatorGSPMAuthenticationDataUsingPrimeKey:]";
      char v13 = "%s called with null self.chosenProposal";
    }
    else
    {
      id v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        goto LABEL_10;
      }
      int v30 = 136315138;
      uint64_t v31 = "-[NEIKEv2IKESA(Crypto) createInitiatorGSPMAuthenticationDataUsingPrimeKey:]";
      char v13 = "%s called with null self.gspmHandler";
    }
    _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v30, 0xCu);
    goto LABEL_10;
  }
  return v2;
}

- (NSObject)createResponderGSPMAuthenticationDataUsingPrimeKey:(NSObject *)self
{
  int v2 = self;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id v4 = objc_getProperty(self, a2, 456, 1);

    if (v4)
    {
      id v6 = objc_getProperty(v2, v5, 96, 1);

      if (v6)
      {
        id v8 = -[NEIKEv2IKESA createResponderSignedOctetsUsingPrimeKey:](v2, a2);
        if (!v8)
        {
          int v14 = ne_log_obj();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v30) = 0;
            _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, "createResponderSignedOctets failed", (uint8_t *)&v30, 2u);
          }
          int v2 = 0;
          goto LABEL_25;
        }
        char v9 = BYTE1(v2[1].isa);
        id v10 = objc_getProperty(v2, v7, 456, 1);
        BOOL v11 = v10;
        if (v9) {
          ptrdiff_t v12 = -[NEIKEv2GSPM createRemoteSignedOctets]((uint64_t)v10);
        }
        else {
          ptrdiff_t v12 = -[NEIKEv2GSPM createLocalSignedOctets]((uint64_t)v10);
        }
        int v14 = v12;

        if (!v14)
        {
          id v17 = ne_log_obj();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v30) = 0;
            _os_log_fault_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_FAULT, "createResponderSignedOctets(GSPM) failed", (uint8_t *)&v30, 2u);
          }
          int v2 = 0;
          goto LABEL_24;
        }
        uint64_t v15 = [v8 length];
        uint64_t v16 = [v14 length];
        id v17 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E4F1CA58], v16 + v15);
        [v17 appendData:v8];
        [v17 appendData:v14];
        id v19 = objc_getProperty(v2, v18, 456, 1);
        uint64_t v20 = v19;
        if (v19) {
          id v21 = (void *)*((void *)v19 + 1);
        }
        else {
          id v21 = 0;
        }
        id v22 = v21;

        if (v22)
        {
          id v24 = objc_getProperty(v2, v23, 96, 1);
          ptrdiff_t v26 = [(NEIKEv2IKESAProposal *)v24 prfProtocol];
          int v2 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v17, v22, v26);

          if (v2)
          {
LABEL_20:

LABEL_24:
LABEL_25:

            goto LABEL_26;
          }
          id v28 = ne_log_obj();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
LABEL_33:

            int v2 = 0;
            goto LABEL_20;
          }
          LOWORD(v30) = 0;
          id v29 = "createAuthenticationDataForSharedSecret failed";
        }
        else
        {
          id v28 = ne_log_obj();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          LOWORD(v30) = 0;
          id v29 = "GSPM.sessionKey failed";
        }
        _os_log_fault_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_FAULT, v29, (uint8_t *)&v30, 2u);
        goto LABEL_33;
      }
      id v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
LABEL_10:
        int v2 = 0;
LABEL_26:

        return v2;
      }
      int v30 = 136315138;
      uint64_t v31 = "-[NEIKEv2IKESA(Crypto) createResponderGSPMAuthenticationDataUsingPrimeKey:]";
      char v13 = "%s called with null self.chosenProposal";
    }
    else
    {
      id v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        goto LABEL_10;
      }
      int v30 = 136315138;
      uint64_t v31 = "-[NEIKEv2IKESA(Crypto) createResponderGSPMAuthenticationDataUsingPrimeKey:]";
      char v13 = "%s called with null self.gspmHandler";
    }
    _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v30, 0xCu);
    goto LABEL_10;
  }
  return v2;
}

- (void)createConcatenatedSPIsAndReturnError:(unsigned char *)a1
{
  id v4 = [(NEIKEv2IKESA *)a1 initiatorSPI];
  uint64_t v5 = [v4 value];

  uint64_t v22 = v5;
  id v7 = [(NEIKEv2IKESA *)a1 responderSPI];
  uint64_t v8 = [v7 value];

  uint64_t v21 = v8;
  if (!v5)
  {
    SEL v18 = @"Missing initiator SPI";
LABEL_7:
    uint64_t ErrorInternal = NEIKEv2CreateErrorInternal(v18, v9, v10, v11, v12, v13, v14, v15, v21);
    uint64_t v20 = *(void **)a2;
    *(void *)a2 = ErrorInternal;

    return 0;
  }
  if (!v8)
  {
    SEL v18 = @"Missing responder SPI";
    goto LABEL_7;
  }
  uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", 16, v21, v22);
  [v16 appendBytes:&v22 length:8];
  [v16 appendBytes:&v21 length:8];
  return v16;
}

- (void)createConcatedNoncesAndReturnError:(unsigned char *)a1
{
  id v4 = [(NEIKEv2IKESA *)a1 initiatorNonce];
  id v6 = [(NEIKEv2IKESA *)a1 responderNonce];
  if (![v4 length])
  {
    uint64_t v16 = @"Missing initiator nonce";
LABEL_7:
    uint64_t ErrorInternal = NEIKEv2CreateErrorInternal(v16, v7, v8, v9, v10, v11, v12, v13, v19);
    SEL v18 = *(void **)a2;
    *(void *)a2 = ErrorInternal;

    uint64_t v14 = 0;
    goto LABEL_4;
  }
  if (![v6 length])
  {
    uint64_t v16 = @"Missing responder nonce";
    goto LABEL_7;
  }
  uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v6, "length") + objc_msgSend(v4, "length"));
  [v14 appendData:v4];
  [v14 appendData:v6];
LABEL_4:

  return v14;
}

- (unint64_t)selectSecurePasswordMethod:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 80, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = Property;
  uint64_t v7 = [v6 supportedSecurePasswordMethods];

  if ([v7 count])
  {
    if (v4) {
      id v9 = objc_getProperty(v4, v8, 32, 1);
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
    uint64_t v11 = [v10 length];
    unint64_t v12 = v11;
    if (!v11) {
      goto LABEL_17;
    }
    if (v11)
    {
      id v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v19 = 134217984;
        unint64_t v20 = v12;
        _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "Secure password methods data length %zu is not divisible by sizeof(uint16_t)", (uint8_t *)&v19, 0xCu);
      }
      unint64_t v12 = 0;
    }
    else
    {
      uint64_t v13 = [v10 bytes];
      if (v12 < 2)
      {
LABEL_12:
        unint64_t v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v14 = (unsigned __int16 *)v13;
      unint64_t v15 = v12 >> 1;
      while (1)
      {
        unsigned int v16 = *v14++;
        unint64_t v12 = [[NEIKEv2AuthenticationProtocol alloc] initWithSecurePassword:bswap32(v16) >> 16];
        if ([v7 containsObject:v12]) {
          break;
        }

        if (!--v15) {
          goto LABEL_12;
        }
      }
      id v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        unint64_t v20 = v12;
        _os_log_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_INFO, "Found supported %@ in notify", (uint8_t *)&v19, 0xCu);
      }
    }

    goto LABEL_17;
  }
  unint64_t v12 = 0;
LABEL_18:

  return v12;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_configurationDelegate);
  objc_destroyWeak((id *)&self->_packetDelegate);
  objc_storeStrong(&self->_socketGetBlock, 0);
  objc_destroyWeak((id *)&self->_transportDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fetchedPPK, 0);
  objc_storeStrong((id *)&self->_fetchedSharedSecret, 0);
  objc_storeStrong((id *)&self->_fetchedPassword, 0);
  objc_storeStrong((id *)&self->_internalRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_receivedDestinationHash, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_tcpTransport, 0);
  objc_storeStrong((id *)&self->_natTransport, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_gspmHandler, 0);
  objc_storeStrong((id *)&self->_eapClient, 0);
  objc_storeStrong((id *)&self->_remoteAuthProtocolUsed, 0);
  objc_storeStrong((id *)&self->_localAuthProtocolUsed, 0);
  objc_storeStrong((id *)&self->_ppkIDFromPacket, 0);
  objc_storeStrong((id *)&self->_responderTrafficSelectorsFromPacket, 0);
  objc_storeStrong((id *)&self->_initiatorTrafficSelectorsFromPacket, 0);
  objc_storeStrong((id *)&self->_configMessageFromPacket, 0);
  objc_storeStrong((id *)&self->_primeAuthenticationDataFromPacket, 0);
  objc_storeStrong((id *)&self->_authenticationDataFromPacket, 0);
  objc_storeStrong((id *)&self->_authProtocolFromPacket, 0);
  objc_storeStrong((id *)&self->_childSAProposalsFromPacket, 0);
  objc_storeStrong((id *)&self->_remoteIdentifierFromPacket, 0);
  objc_storeStrong((id *)&self->_localIdentifierFromPacket, 0);
  objc_destroyWeak((id *)&self->_initiatorIdentifierPayload);
  objc_storeStrong((id *)&self->_remoteFirstMessage, 0);
  objc_storeStrong((id *)&self->_localFirstMessage, 0);
  objc_storeStrong((id *)&self->_outgoingInterfaceName, 0);
  objc_storeStrong((id *)&self->_initiatorCookie2, 0);
  objc_storeStrong((id *)&self->_responderCookie2, 0);
  objc_storeStrong((id *)&self->_cookie, 0);
  objc_storeStrong((id *)&self->_localCertificateKey, 0);
  objc_storeStrong((id *)&self->_localCertificateIdentity, 0);
  objc_storeStrong((id *)&self->_skPrPrime, 0);
  objc_storeStrong((id *)&self->_skPr, 0);
  objc_storeStrong((id *)&self->_skPiPrime, 0);
  objc_storeStrong((id *)&self->_skPi, 0);
  objc_storeStrong((id *)&self->_skDPrime, 0);
  objc_storeStrong((id *)&self->_skD, 0);
  objc_storeStrong((id *)&self->_securityContext, 0);
  objc_storeStrong((id *)&self->_intAuthR, 0);
  objc_storeStrong((id *)&self->_intAuthI, 0);
  objc_storeStrong((id *)&self->_followupSharedSecrets, 0);
  objc_storeStrong((id *)&self->_additionalKENotify, 0);
  objc_storeStrong((id *)&self->_primarySharedSecret, 0);
  objc_storeStrong((id *)&self->_currentKEHandler, 0);
  objc_storeStrong((id *)&self->_remoteKeyExchangeData, 0);
  objc_storeStrong((id *)&self->_remotePreferredKEMProtocol, 0);
  objc_storeStrong((id *)&self->_remoteNonce, 0);
  objc_storeStrong((id *)&self->_localNonce, 0);
  objc_storeStrong((id *)&self->_remoteSignHashSet, 0);
  objc_storeStrong((id *)&self->_remoteSecurePasswordMethod, 0);
  objc_storeStrong((id *)&self->_chosenProposal, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_localAddress, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_remoteSPI, 0);

  objc_storeStrong((id *)&self->_localSPI, 0);
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (nelog_is_debug_logging_enabled())
  {
    id v4 = ne_log_large_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (self) {
        id Property = objc_getProperty(self, v5, 32, 1);
      }
      else {
        id Property = 0;
      }
      *(_DWORD *)long long buf = 138412290;
      id v20 = Property;
      _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "Deallocating ikeSA %@", buf, 0xCu);
    }
  }
  if (self)
  {
    id v6 = objc_getProperty(self, v3, 464, 1);
    id v8 = objc_getProperty(self, v7, 32, 1);
    -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v6, v8, 0);

    id v10 = objc_getProperty(self, v9, 472, 1);
    id v12 = objc_getProperty(self, v11, 32, 1);
  }
  else
  {
    -[NEIKEv2Transport cancelClient:shouldInvalidate:](0, 0, 0);
    id v10 = 0;
    id v12 = 0;
  }
  -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v10, v12, 0);

  if (self)
  {
    id v14 = objc_getProperty(self, v13, 480, 1);
    id v16 = objc_getProperty(self, v15, 32, 1);
  }
  else
  {
    id v14 = 0;
    id v16 = 0;
  }
  -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v14, v16, 0);

  v18.receiver = self;
  v18.super_class = (Class)NEIKEv2IKESA;
  [(NEIKEv2IKESA *)&v18 dealloc];
}

- (id)description
{
  id v3 = [(NEIKEv2IKESA *)self initiatorSPI];
  uint64_t v5 = [(NEIKEv2IKESA *)self responderSPI];
  id v6 = [NSString alloc];
  if (self)
  {
    unint64_t ikeSAUniqueIndex = self->_ikeSAUniqueIndex;
    unint64_t ikeSessionUniqueIndex = self->_ikeSessionUniqueIndex;
  }
  else
  {
    unint64_t ikeSAUniqueIndex = 0;
    unint64_t ikeSessionUniqueIndex = 0;
  }
  SEL v9 = @"0000000000000000";
  if (v3) {
    id v10 = v3;
  }
  else {
    id v10 = @"0000000000000000";
  }
  if (v5) {
    SEL v9 = v5;
  }
  SEL v11 = (void *)[v6 initWithFormat:@"IKEv2IKESA[%llu.%llu, %@-%@]", ikeSAUniqueIndex, ikeSessionUniqueIndex, v10, v9];

  return v11;
}

- (_BYTE)initiatorSPI
{
  if (a1)
  {
    if (a1[9]) {
      ptrdiff_t v3 = 32;
    }
    else {
      ptrdiff_t v3 = 40;
    }
    a1 = objc_getProperty(a1, a2, v3, 1);
    uint64_t v2 = vars8;
  }
  return a1;
}

- (_BYTE)responderSPI
{
  if (a1)
  {
    if (a1[9]) {
      ptrdiff_t v3 = 40;
    }
    else {
      ptrdiff_t v3 = 32;
    }
    a1 = objc_getProperty(a1, a2, v3, 1);
    uint64_t v2 = vars8;
  }
  return a1;
}

- (NSObject)initIKESAWithConfiguration:(void *)a3 sessionConfiguration:(void *)a4 queue:(void *)a5 initialTransport:(void *)a6 transportDelegate:(void *)a7 socketGetBlock:(void *)a8 packetDelegate:(void *)a9 configurationDelegate:(objc_class *)a10 ikeSessionUniqueIndex:
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v18 = a3;
  id v19 = a4;
  newCFStringRef Value = a5;
  obuint64_t j = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (!a1)
  {
    CFAllocatorRef v25 = 0;
    goto LABEL_88;
  }
  if (!v17)
  {
    id v117 = v21;
    SEL v118 = ne_log_obj();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      CFDataRef v132 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate:soc"
             "ketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
      _os_log_fault_impl(&dword_19DDAF000, v118, OS_LOG_TYPE_FAULT, "%s called with null configuration", buf, 0xCu);
    }

    CFAllocatorRef v25 = 0;
    id v21 = v117;
    goto LABEL_87;
  }
  v130.receiver = a1;
  v130.super_class = (Class)NEIKEv2IKESA;
  uint64_t v23 = [&v130 init];
  if (!v23)
  {
    a1 = ne_log_obj();
    if (os_log_type_enabled(a1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, a1, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
    CFAllocatorRef v25 = 0;
    goto LABEL_87;
  }
  CFAllocatorRef v25 = v23;
  objc_setProperty_atomic(v23, v24, v19, 536);
  v25[73].isa = (Class)atomic_fetch_add_explicit(&sNEIKEv2IKESAIndex, 1uLL, memory_order_relaxed);
  v25[72].isa = a10;
  objc_setProperty_atomic(v25, v26, v17, 80);
  objc_setProperty_atomic(v25, v27, v18, 88);
  id v123 = v22;
  if ([v17 randomizeLocalPort])
  {
    unsigned int v28 = 0;
    if (!v21) {
      goto LABEL_12;
    }
  }
  else
  {
    if ([v17 forceUDPEncapsulation]) {
      unsigned int v28 = 4500;
    }
    else {
      unsigned int v28 = 500;
    }
    if (!v21)
    {
LABEL_12:
      id v30 = v21;
      uint64_t v31 = [v17 remoteEndpoint];

      if (!v31)
      {
        uint32_t v76 = ne_log_obj();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          CFDataRef v132 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate"
                 ":socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
          _os_log_fault_impl(&dword_19DDAF000, v76, OS_LOG_TYPE_FAULT, "%s called with null configuration.remoteEndpoint", buf, 0xCu);
        }
        goto LABEL_57;
      }
      uint64_t v32 = [v17 remoteEndpoint];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        int v34 = [v17 remoteEndpoint];
        SEL v35 = (unsigned __int8 *)[v34 address];

        if (!v35)
        {
          uint32_t v76 = ne_log_obj();
          if (!os_log_type_enabled(v76, OS_LOG_TYPE_FAULT)) {
            goto LABEL_57;
          }
          *(_DWORD *)long long buf = 136315138;
          CFDataRef v132 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate"
                 ":socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
          CFArrayRef v77 = "%s called with null remoteAddress";
          goto LABEL_56;
        }
        if (*v35 <= 0xFu)
        {
          uint32_t v76 = ne_log_obj();
          if (!os_log_type_enabled(v76, OS_LOG_TYPE_FAULT)) {
            goto LABEL_57;
          }
          *(_DWORD *)long long buf = 136315138;
          CFDataRef v132 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate"
                 ":socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
          CFArrayRef v77 = "%s called with null (remoteAddress->sa_len >= sizeof(struct sockaddr_in))";
          goto LABEL_56;
        }
        int v36 = [v17 localEndpoint];

        if (!v36)
        {
LABEL_23:
          CFMutableDataRef v47 = (void *)MEMORY[0x1E4F38BC8];
          id v48 = [v17 remoteEndpoint];
          int v49 = objc_msgSend(v47, "endpointWithAddress:", objc_msgSend(v48, "address"));
          objc_setProperty_atomic(v25, v50, v49, 72);

          if (!*(_WORD *)(objc_msgSend(objc_getProperty(v25, v51, 72, 1), "address") + 2))
          {
            if ([v17 forceUDPEncapsulation]) {
              unsigned int v53 = 4500;
            }
            else {
              unsigned int v53 = 500;
            }
            *(_WORD *)(objc_msgSend(objc_getProperty(v25, v52, 72, 1), "address") + 2) = __rev16(v53);
          }
          id v21 = v30;
          goto LABEL_29;
        }
        uint64_t v37 = [v17 localEndpoint];
        objc_opt_class();
        char v38 = objc_opt_isKindOfClass();

        if (v38)
        {
          id v39 = [v17 localEndpoint];
          id v40 = (unsigned __int8 *)[v39 address];

          if (!v40)
          {
            uint32_t v76 = ne_log_obj();
            if (!os_log_type_enabled(v76, OS_LOG_TYPE_FAULT)) {
              goto LABEL_57;
            }
            *(_DWORD *)long long buf = 136315138;
            CFDataRef v132 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelega"
                   "te:socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
            CFArrayRef v77 = "%s called with null localAddress";
            goto LABEL_56;
          }
          if (*v40 > 0xFu)
          {
            unsigned int v41 = __rev16(*((unsigned __int16 *)v40 + 1));
            if (*((_WORD *)v40 + 1)) {
              unsigned int v28 = v41;
            }
            id v42 = (void *)MEMORY[0x1E4F38BC8];
            uint64_t v43 = [v17 localEndpoint];
            CFIndex v44 = objc_msgSend(v42, "endpointWithAddress:", objc_msgSend(v43, "address"));
            objc_setProperty_atomic(v25, v45, v44, 64);

            *(_WORD *)(objc_msgSend(objc_getProperty(v25, v46, 64, 1), "address") + 2) = __rev16(v28);
            goto LABEL_23;
          }
          uint32_t v76 = ne_log_obj();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            CFDataRef v132 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelega"
                   "te:socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
            CFArrayRef v77 = "%s called with null (localAddress->sa_len >= sizeof(struct sockaddr_in))";
            goto LABEL_56;
          }
LABEL_57:

          a1 = v25;
          CFAllocatorRef v25 = 0;
          id v21 = v30;
          goto LABEL_58;
        }
        uint32_t v76 = ne_log_obj();
        if (!os_log_type_enabled(v76, OS_LOG_TYPE_FAULT)) {
          goto LABEL_57;
        }
        *(_DWORD *)long long buf = 136315138;
        CFDataRef v132 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate:s"
               "ocketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
        CFArrayRef v77 = "%s called with null [configuration.localEndpoint isKindOfClass:[NWAddressEndpoint class]]";
      }
      else
      {
        uint32_t v76 = ne_log_obj();
        if (!os_log_type_enabled(v76, OS_LOG_TYPE_FAULT)) {
          goto LABEL_57;
        }
        *(_DWORD *)long long buf = 136315138;
        CFDataRef v132 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate:s"
               "ocketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
        CFArrayRef v77 = "%s called with null [configuration.remoteEndpoint isKindOfClass:[NWAddressEndpoint class]]";
      }
LABEL_56:
      _os_log_fault_impl(&dword_19DDAF000, v76, OS_LOG_TYPE_FAULT, v77, buf, 0xCu);
      goto LABEL_57;
    }
  }
  id v29 = [v17 remoteEndpoint];

  if (v29) {
    goto LABEL_12;
  }
LABEL_29:
  objc_storeWeak((id *)&v25[68].isa, obj);
  objc_setProperty_atomic_copy(v25, v54, v20, 552);
  objc_storeWeak((id *)&v25[70].isa, v21);
  SEL v122 = v21;
  id v22 = v123;
  if (v21) {
    BYTE1(v25[3].isa) = 1;
  }
  objc_storeWeak((id *)&v25[71].isa, v123);
  uint32_t v55 = [v17 outgoingInterfaceName];
  objc_setProperty_atomic(v25, v56, v55, 304);

  BYTE1(v25[1].isa) = [v17 serverMode] ^ 1;
  v25[6].isa = (Class)3;
  objc_setProperty_atomic(v25, v57, 0, 56);
  uint64_t v58 = objc_alloc_init(NEIKEv2IKESPI);
  objc_setProperty_atomic(v25, v59, v58, 32);

  SEL v121 = v18;
  if (BYTE1(v25[3].isa) & 1) != 0 && (BYTE1(v25[1].isa))
  {
    id v61 = objc_getProperty(v25, v60, 72, 1);
    if (!v61 || (v62 = v61, id v63 = objc_getProperty(v25, v60, 64, 1), v62, !v63))
    {
      unsigned int v120 = v28;
      char v64 = 1;
      char v66 = 1;
      if ((objc_msgSend(objc_getProperty(v25, v60, 80, 1), "requestChildlessSA") & 1) == 0)
      {
        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        id Property = [v121 configurationRequest];
        uint64_t v69 = Property;
        if (Property) {
          id Property = objc_getProperty(Property, v68, 16, 1);
        }
        id v119 = v19;
        id v70 = Property;

        uint64_t v71 = [v70 countByEnumeratingWithState:&v126 objects:v137 count:16];
        if (v71)
        {
          uint64_t v72 = v71;
          char v64 = 0;
          char v66 = 0;
          uint64_t v73 = *(void *)v127;
          do
          {
            for (uint64_t i = 0; i != v72; ++i)
            {
              if (*(void *)v127 != v73) {
                objc_enumerationMutation(v70);
              }
              long long v75 = *(void **)(*((void *)&v126 + 1) + 8 * i);
              if ([v75 attributeType] == 25958) {
                char v64 = 1;
              }
              else {
                v66 |= [v75 attributeType] == 25959;
              }
            }
            uint64_t v72 = [v70 countByEnumeratingWithState:&v126 objects:v137 count:16];
          }
          while (v72);
        }
        else
        {
          char v64 = 0;
          char v66 = 0;
        }

        id v19 = v119;
        id v22 = v123;
      }
      if (!objc_getProperty(v25, v65, 64, 1) && (v64 & 1) != 0)
      {
        CFIndex v79 = [MEMORY[0x1E4F38BC8] endpointWithHostname:@"::" port:@"500"];
        objc_setProperty_atomic(v25, v80, v79, 64);
      }
      unsigned int v28 = v120;
      if (((objc_getProperty(v25, v78, 72, 1) == 0) & v66) == 1)
      {
        uint64_t v81 = [MEMORY[0x1E4F38BC8] endpointWithHostname:@"::1" port:@"500"];
        objc_setProperty_atomic(v25, v82, v81, 72);
      }
    }
  }
  id v83 = newValue;
  if (newValue)
  {
    unint64_t transportType = newValue->_transportType;
    if (transportType - 2 < 2)
    {
      BYTE5(v25[1].isa) = 1;
      id v85 = v25;
      unint64_t v86 = newValue;
      ptrdiff_t v87 = 480;
    }
    else if (transportType == 1)
    {
      BYTE4(v25[1].isa) = 1;
      id v85 = v25;
      unint64_t v86 = newValue;
      ptrdiff_t v87 = 472;
    }
    else
    {
      if (transportType)
      {
LABEL_82:
        id v101 = objc_getProperty(v25, v60, 32, 1);
        -[NEIKEv2Transport addClient:delegate:](v83, v101, obj);
        id v103 = objc_getProperty(v83, v102, 24, 1);
        objc_setProperty_atomic(v25, v104, v103, 72);

        newCFStringRef Value = v83;
        id v106 = objc_getProperty(v83, v105, 16, 1);
        objc_setProperty_atomic(v25, v107, v106, 64);

        uint64_t v108 = ne_log_large_obj();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
        {
          id v110 = objc_getProperty(v25, v109, 72, 1);
          id v112 = objc_getProperty(v25, v111, 80, 1);
          *(_DWORD *)long long buf = 138412802;
          CFDataRef v132 = (const char *)v25;
          __int16 v133 = 2112;
          id v134 = v110;
          __int16 v135 = 2112;
          id v136 = v112;
          _os_log_impl(&dword_19DDAF000, v108, OS_LOG_TYPE_INFO, "Created %@ to %@ with configuration %@", buf, 0x20u);
        }

        a1 = ne_log_large_obj();
        if (os_log_type_enabled(a1, OS_LOG_TYPE_INFO))
        {
          __int16 v114 = (const char *)objc_getProperty(v25, v113, 88, 1);
          *(_DWORD *)long long buf = 138412290;
          CFDataRef v132 = v114;
          _os_log_impl(&dword_19DDAF000, a1, OS_LOG_TYPE_INFO, "Session configuration %@", buf, 0xCu);
        }
        id v18 = v121;
        id v21 = v122;
        goto LABEL_87;
      }
      id v85 = v25;
      unint64_t v86 = newValue;
      ptrdiff_t v87 = 464;
    }
    objc_setProperty_atomic(v85, v60, v86, v87);
    goto LABEL_82;
  }
  unint64_t v88 = [v17 forceUDPEncapsulation];
  id v90 = objc_getProperty(v25, v89, 72, 1);
  id v92 = objc_getProperty(v25, v91, 64, 1);
  id v94 = objc_getProperty(v25, v93, 304, 1);
  id v83 = +[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]((uint64_t)NEIKEv2Transport, v88, v90, v92, v28, v94, v19, v20, v122);

  if (v83)
  {
    if ([v17 forceUDPEncapsulation])
    {
      BYTE4(v25[1].isa) = 1;
      uint64_t v96 = v25;
      v97 = v83;
      ptrdiff_t v98 = 472;
    }
    else
    {
      uint64_t v96 = v25;
      v97 = v83;
      ptrdiff_t v98 = 464;
    }
    objc_setProperty_atomic(v96, v95, v97, v98);
    id v22 = v123;
    goto LABEL_82;
  }
  id v99 = ne_log_obj();
  id v18 = v121;
  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
  {
    id v116 = objc_getProperty(v25, v100, 72, 1);
    *(_DWORD *)long long buf = 138412546;
    CFDataRef v132 = (const char *)v25;
    __int16 v133 = 2112;
    id v134 = v116;
    _os_log_error_impl(&dword_19DDAF000, v99, OS_LOG_TYPE_ERROR, "%@ failed to create transport for %@", buf, 0x16u);
  }

  newCFStringRef Value = 0;
  a1 = v25;
  CFAllocatorRef v25 = 0;
  id v21 = v122;
LABEL_58:
  id v22 = v123;
LABEL_87:

LABEL_88:
  return v25;
}

- (id)preferredKEMProtocol
{
  if (objc_getProperty(a1, a2, 144, 1))
  {
    id v4 = objc_getProperty(a1, v3, 144, 1);
LABEL_6:
    uint64_t v13 = v4;
    goto LABEL_8;
  }
  id v5 = objc_getProperty(a1, v3, 96, 1);
  if (v5)
  {
    SEL v7 = v5;
    id Property = objc_getProperty(a1, v6, 96, 1);
    id v10 = [(NEIKEv2IKESAProposal *)Property kemProtocol];

    if (v10)
    {
      id v11 = objc_getProperty(a1, v6, 96, 1);
      id v4 = [(NEIKEv2IKESAProposal *)v11 kemProtocol];
      goto LABEL_6;
    }
  }
  id v14 = objc_msgSend(objc_getProperty(a1, v6, 80, 1), "proposals");
  SEL v15 = [v14 firstObject];
  uint64_t v13 = [(NEIKEv2IKESAProposal *)v15 kemProtocol];

LABEL_8:

  return v13;
}

- (NSObject)copyForRekey
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 560));
  id v3 = objc_loadWeakRetained((id *)(a1 + 544));
  id v4 = [NEIKEv2IKESA alloc];
  id v6 = objc_getProperty((id)a1, v5, 80, 1);
  id v8 = objc_getProperty((id)a1, v7, 88, 1);
  id v10 = objc_getProperty((id)a1, v9, 536, 1);
  id v12 = objc_getProperty((id)a1, v11, 552, 1);
  id v13 = objc_loadWeakRetained((id *)(a1 + 568));
  id v14 = -[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate:socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:](&v4->super, v6, v8, v10, 0, v3, v12, WeakRetained, v13, *(objc_class **)(a1 + 576));

  if (v14)
  {
    id Property = objc_getProperty((id)a1, v15, 464, 1);
    objc_setProperty_atomic(v14, v17, Property, 464);
    id v19 = objc_getProperty((id)a1, v18, 472, 1);
    objc_setProperty_atomic(v14, v20, v19, 472);
    id v22 = objc_getProperty((id)a1, v21, 480, 1);
    objc_setProperty_atomic(v14, v23, v22, 480);
    id v25 = objc_getProperty(v14, v24, 464, 1);
    id v27 = objc_getProperty(v14, v26, 32, 1);
    -[NEIKEv2Transport addClient:delegate:](v25, v27, v3);

    id v29 = objc_getProperty(v14, v28, 472, 1);
    id v31 = objc_getProperty(v14, v30, 32, 1);
    -[NEIKEv2Transport addClient:delegate:](v29, v31, v3);

    id v33 = objc_getProperty(v14, v32, 480, 1);
    id v35 = objc_getProperty(v14, v34, 32, 1);
    -[NEIKEv2Transport addClient:delegate:](v33, v35, v3);

    id v37 = objc_getProperty((id)a1, v36, 304, 1);
    objc_setProperty_atomic(v14, v38, v37, 304);
    id v40 = objc_getProperty((id)a1, v39, 64, 1);
    objc_setProperty_atomic(v14, v41, v40, 64);
    id v43 = objc_getProperty((id)a1, v42, 72, 1);
    objc_setProperty_atomic(v14, v44, v43, 72);
    objc_storeWeak((id *)&v14[70].isa, WeakRetained);
    BYTE1(v14[3].isa) = *(unsigned char *)(a1 + 25) & 1;
    BYTE4(v14[1].isa) = *(unsigned char *)(a1 + 12) & 1;
    HIBYTE(v14[1].isa) = *(unsigned char *)(a1 + 15) & 1;
    BYTE6(v14[1].isa) = *(unsigned char *)(a1 + 14) & 1;
    id v46 = objc_getProperty((id)a1, v45, 488, 1);
    objc_setProperty_atomic(v14, v47, v46, 488);
    id v49 = objc_getProperty((id)a1, v48, 96, 1);
    objc_setProperty_atomic(v14, v50, v49, 96);
    BYTE3(v14[1].isa) = *(unsigned char *)(a1 + 11) & 1;
    id v52 = objc_getProperty((id)a1, v51, 144, 1);
    objc_setProperty_atomic(v14, v53, v52, 144);
    id v55 = objc_getProperty((id)a1, v54, 496, 1);
    objc_setProperty_atomic(v14, v56, v55, 496);
    SEL v57 = ne_log_large_obj();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      v62 = v14;
      __int16 v63 = 2112;
      uint64_t v64 = a1;
      _os_log_impl(&dword_19DDAF000, v57, OS_LOG_TYPE_INFO, "Created %@ for rekey from %@", buf, 0x16u);
    }

    uint64_t v58 = v14;
  }
  else
  {
    SEL v59 = ne_log_obj();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v59, OS_LOG_TYPE_ERROR, "[[NEIKEv2IKESA alloc] initIKESAWithConfiguration]", buf, 2u);
    }
  }
  return v14;
}

- (void)detachTransportWithShouldInvalidate:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = a1;
      _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating transports for %@", (uint8_t *)&v21, 0xCu);
    }

    id v6 = objc_getProperty(a1, v5, 464, 1);
    id Property = objc_getProperty(a1, v7, 32, 1);
    -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v6, Property, a2);

    id v10 = objc_getProperty(a1, v9, 472, 1);
    id v12 = objc_getProperty(a1, v11, 32, 1);
    -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v10, v12, a2);

    id v14 = objc_getProperty(a1, v13, 480, 1);
    id v16 = objc_getProperty(a1, v15, 32, 1);
    -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v14, v16, a2);

    objc_setProperty_atomic(a1, v17, 0, 464);
    objc_setProperty_atomic(a1, v18, 0, 472);
    objc_setProperty_atomic(a1, v19, 0, 480);
    objc_setProperty_atomic(a1, v20, 0, 64);
  }
}

- (void)clearAuthenticationSecrets
{
  if (a1)
  {
    objc_setProperty_atomic(a1, a2, 0, 192);
    objc_setProperty_atomic(a1, v3, 0, 200);
    objc_setProperty_atomic(a1, v4, 0, 232);
    objc_setProperty_atomic(a1, v5, 0, 248);
    objc_setProperty_atomic(a1, v6, 0, 224);
    objc_setProperty_atomic(a1, v7, 0, 240);
    objc_setProperty_atomic(a1, v8, 0, 256);
    objc_setProperty_atomic(a1, v9, 0, 264);
    objc_setProperty_atomic(a1, v10, 0, 512);
    objc_setProperty_atomic(a1, v11, 0, 520);
    objc_setProperty_atomic(a1, v12, 0, 528);
    objc_setProperty_atomic(a1, v13, 0, 448);
    objc_setProperty_atomic(a1, v14, 0, 456);
  }
}

- (void)setState:(void *)a3 error:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a3;
  if (!a1) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)(a1 + 48);
  unint64_t Property = (unint64_t)objc_getProperty((id)a1, v5, 56, 1);
  SEL v9 = ne_log_obj();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7 != a2)
  {
    if (v6 | Property)
    {
      if (v10)
      {
        SessionStateString = NEIKEv2CreateSessionStateString(*(void *)(a1 + 48));
        id v14 = NEIKEv2CreateSessionStateString(a2);
        int v22 = 138413314;
        uint64_t v23 = a1;
        __int16 v24 = 2112;
        id v25 = SessionStateString;
        __int16 v26 = 2112;
        unint64_t v27 = (unint64_t)v14;
        __int16 v28 = 2112;
        unint64_t v29 = (unint64_t)objc_getProperty((id)a1, v15, 56, 1);
        __int16 v30 = 2112;
        unint64_t v31 = v6;
        id v16 = "%@ state %@ -> %@ error %@ -> %@";
        SEL v17 = v9;
        uint32_t v18 = 52;
LABEL_16:
        _os_log_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, v18);
      }
    }
    else if (v10)
    {
      SessionStateString = NEIKEv2CreateSessionStateString(*(void *)(a1 + 48));
      id v14 = NEIKEv2CreateSessionStateString(a2);
      int v22 = 138412802;
      uint64_t v23 = a1;
      __int16 v24 = 2112;
      id v25 = SessionStateString;
      __int16 v26 = 2112;
      unint64_t v27 = (unint64_t)v14;
      id v16 = "%@ state %@ -> %@";
      SEL v17 = v9;
      uint32_t v18 = 32;
      goto LABEL_16;
    }

    *(void *)(a1 + 48) = a2;
    objc_setProperty_atomic((id)a1, v21, (id)v6, 56);
    *(unsigned char *)(a1 + 8) = 1;
    goto LABEL_18;
  }
  if (!v6 || Property)
  {
    if (v10)
    {
      SEL v19 = NEIKEv2CreateSessionStateString(a2);
      int v22 = 138413058;
      uint64_t v23 = a1;
      __int16 v24 = 2112;
      id v25 = v19;
      __int16 v26 = 2112;
      unint64_t v27 = (unint64_t)objc_getProperty((id)a1, v20, 56, 1);
      __int16 v28 = 2112;
      unint64_t v29 = v6;
      _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "%@ not changing state %@ nor error %@ -> %@", (uint8_t *)&v22, 0x2Au);
    }
  }
  else
  {
    if (v10)
    {
      SEL v11 = NEIKEv2CreateSessionStateString(a2);
      int v22 = 138412802;
      uint64_t v23 = a1;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2112;
      unint64_t v27 = v6;
      _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "%@ not changing state %@ but new error %@", (uint8_t *)&v22, 0x20u);
    }
    objc_setProperty_atomic((id)a1, v12, (id)v6, 56);
  }
LABEL_18:
}

- (void)assignRemoteSPI:(void *)a1
{
  id v17 = a2;
  objc_setProperty_atomic(a1, v3, v17, 40);
  if (objc_getProperty(a1, v4, 464, 1))
  {
    id v6 = objc_getProperty(a1, v5, 464, 1);
    id Property = objc_getProperty(a1, v7, 32, 1);
    -[NEIKEv2Transport setRemoteSPI:forClient:](v6, v17, Property);
  }
  if (objc_getProperty(a1, v5, 472, 1))
  {
    id v10 = objc_getProperty(a1, v9, 472, 1);
    id v12 = objc_getProperty(a1, v11, 32, 1);
    -[NEIKEv2Transport setRemoteSPI:forClient:](v10, v17, v12);
  }
  if (objc_getProperty(a1, v9, 480, 1))
  {
    id v14 = objc_getProperty(a1, v13, 480, 1);
    id v16 = objc_getProperty(a1, v15, 32, 1);
    -[NEIKEv2Transport setRemoteSPI:forClient:](v14, v17, v16);
  }
}

- (void)switchToNATTraversalPorts
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)(a1 + 13) & 1) == 0)
  {
    *(unsigned char *)(a1 + 12) = 1;
    SEL v3 = (unsigned __int8 *)objc_msgSend(objc_getProperty((id)a1, a2, 72, 1), "address");
    if (v3)
    {
      SEL v5 = v3;
      if (*v3 <= 0xFu)
      {
        SEL v9 = ne_log_obj();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          goto LABEL_23;
        }
        *(_DWORD *)long long buf = 136315138;
        id v35 = "-[NEIKEv2IKESA switchToNATTraversalPorts]";
        uint64_t v32 = "%s called with null (remoteAddress->sa_len >= sizeof(struct sockaddr_in))";
      }
      else
      {
        if (objc_msgSend(objc_getProperty((id)a1, v4, 80, 1), "randomizeLocalPort")) {
          unsigned int v7 = 0;
        }
        else {
          unsigned int v7 = 4500;
        }
        SEL v8 = (unsigned __int8 *)objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "address");
        if (v8)
        {
          if (*v8 > 0xFu)
          {
            SEL v9 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v8];
            id v10 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v5];
            if (*(__int16 *)([v10 address] + 2) == -3071) {
              *(_WORD *)([v10 address] + 2) = -27631;
            }
            int v11 = *(__int16 *)([v9 address] + 2);
            uint64_t v12 = [v9 address];
            if (v11 == -3071) {
              *(_WORD *)(v12 + 2) = -27631;
            }
            else {
              unsigned int v7 = bswap32(*(unsigned __int16 *)(v12 + 2)) >> 16;
            }
            if (!objc_getProperty((id)a1, v13, 472, 1))
            {
              id WeakRetained = objc_loadWeakRetained((id *)(a1 + 560));
              id v17 = objc_loadWeakRetained((id *)(a1 + 544));
              if ((*(unsigned char *)(a1 + 25) & 1) != 0 && !WeakRetained)
              {
                uint32_t v18 = ne_log_obj();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "Cannot create transport for packet delegate, delegate no longer valid", buf, 2u);
                }

                goto LABEL_22;
              }
              id v19 = objc_getProperty((id)a1, v16, 304, 1);
              id v21 = objc_getProperty((id)a1, v20, 536, 1);
              id Property = objc_getProperty((id)a1, v22, 552, 1);
              __int16 v24 = +[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]((uint64_t)NEIKEv2Transport, 1uLL, v10, v9, v7, v19, v21, Property, WeakRetained);

              objc_setProperty_atomic((id)a1, v25, v24, 472);
              id v27 = objc_getProperty((id)a1, v26, 472, 1);
              id v29 = objc_getProperty((id)a1, v28, 32, 1);
              -[NEIKEv2Transport addClient:delegate:](v27, v29, v17);

              id v31 = objc_getProperty((id)a1, v30, 472, 1);
              v33[0] = MEMORY[0x1E4F143A8];
              v33[1] = 3221225472;
              v33[2] = __41__NEIKEv2IKESA_switchToNATTraversalPorts__block_invoke;
              v33[3] = &unk_1E59932C0;
              v33[4] = a1;
              -[NEIKEv2Transport waitForTransport:]((uint64_t)v31, v33);
            }
            objc_getProperty((id)a1, v14, 472, 1);
LABEL_22:

LABEL_23:
            return;
          }
          SEL v9 = ne_log_obj();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
            goto LABEL_23;
          }
          *(_DWORD *)long long buf = 136315138;
          id v35 = "-[NEIKEv2IKESA switchToNATTraversalPorts]";
          uint64_t v32 = "%s called with null (localAddress->sa_len >= sizeof(struct sockaddr_in))";
        }
        else
        {
          SEL v9 = ne_log_obj();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
            goto LABEL_23;
          }
          *(_DWORD *)long long buf = 136315138;
          id v35 = "-[NEIKEv2IKESA switchToNATTraversalPorts]";
          uint64_t v32 = "%s called with null localAddress";
        }
      }
    }
    else
    {
      SEL v9 = ne_log_obj();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)long long buf = 136315138;
      id v35 = "-[NEIKEv2IKESA switchToNATTraversalPorts]";
      uint64_t v32 = "%s called with null remoteAddress";
    }
    _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, v32, buf, 0xCu);
    goto LABEL_23;
  }
}

uint64_t __41__NEIKEv2IKESA_switchToNATTraversalPorts__block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property)
  {
    id Property = objc_getProperty(Property, a2, 472, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v4, 24, 1);
    }
  }
  id v6 = Property;
  unsigned int v7 = *(void **)(a1 + 32);
  if (v7) {
    objc_setProperty_atomic(v7, v5, v6, 72);
  }

  id v9 = *(id *)(a1 + 32);
  if (v9)
  {
    id v9 = objc_getProperty(v9, v8, 472, 1);
    if (v9) {
      id v9 = objc_getProperty(v9, v10, 16, 1);
    }
  }
  int v11 = (char *)v9;
  uint64_t v12 = *(void **)(a1 + 32);
  if (v12)
  {
    id v14 = v11;
    objc_setProperty_atomic(v12, v11, v11, 64);
    int v11 = v14;
  }

  return MEMORY[0x1F41817F8](v12, v11);
}

uint64_t __40__NEIKEv2IKESA_switchToTCPEncapsulation__block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property)
  {
    id Property = objc_getProperty(Property, a2, 480, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v4, 24, 1);
    }
  }
  id v6 = Property;
  unsigned int v7 = *(void **)(a1 + 32);
  if (v7) {
    objc_setProperty_atomic(v7, v5, v6, 72);
  }

  id v9 = *(id *)(a1 + 32);
  if (v9)
  {
    id v9 = objc_getProperty(v9, v8, 480, 1);
    if (v9) {
      id v9 = objc_getProperty(v9, v10, 16, 1);
    }
  }
  int v11 = (char *)v9;
  uint64_t v12 = *(void **)(a1 + 32);
  if (v12)
  {
    id v14 = v11;
    objc_setProperty_atomic(v12, v11, v11, 64);
    int v11 = v14;
  }

  return MEMORY[0x1F41817F8](v12, v11);
}

- (_BYTE)hasTransport
{
  if (result)
  {
    if (result[13])
    {
      ptrdiff_t v2 = 480;
    }
    else if (result[12])
    {
      ptrdiff_t v2 = 472;
    }
    else
    {
      ptrdiff_t v2 = 464;
    }
    return (unsigned char *)(objc_getProperty(result, a2, v2, 1) != 0);
  }
  return result;
}

- (void)resyncAddress
{
  if (a1)
  {
    self = [(NEIKEv2IKESA *)a1 copyTransport];
    id WeakRetained = objc_loadWeakRetained(a1 + 70);

    SEL v5 = self;
    if (!WeakRetained)
    {
      if (self)
      {
        id v6 = objc_getProperty(self, v4, 16, 1);
        objc_setProperty_atomic(a1, v7, v6, 64);

        id Property = objc_getProperty(self, v8, 24, 1);
      }
      else
      {
        objc_setProperty_atomic(a1, v4, 0, 64);
        id Property = 0;
      }
      id v10 = Property;
      objc_setProperty_atomic(a1, v11, v10, 72);

      SEL v5 = self;
    }
  }
}

- (id)copyTransport
{
  if (!self) {
    return 0;
  }
  if (*((unsigned char *)self + 13))
  {
    id Property = objc_getProperty(self, a2, 480, 1);
  }
  else if (*((unsigned char *)self + 12))
  {
    if (!objc_getProperty(self, a2, 472, 1))
    {
      id WeakRetained = objc_loadWeakRetained(self + 70);
      id v6 = objc_loadWeakRetained(self + 68);
      if ((*((unsigned char *)self + 25) & 1) != 0 && !WeakRetained)
      {
        SEL v7 = ne_log_obj();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          SEL v8 = buf;
          goto LABEL_30;
        }
LABEL_14:

        return 0;
      }
      int v32 = objc_msgSend(objc_getProperty(self, v12, 80, 1), "randomizeLocalPort");
      id v34 = objc_getProperty(self, v33, 72, 1);
      id v36 = objc_getProperty(self, v35, 64, 1);
      id v38 = objc_getProperty(self, v37, 304, 1);
      id v40 = objc_getProperty(self, v39, 536, 1);
      id v42 = objc_getProperty(self, v41, 552, 1);
      if (v32) {
        unsigned int v43 = 0;
      }
      else {
        unsigned int v43 = 4500;
      }
      SEL v44 = +[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]((uint64_t)NEIKEv2Transport, 1uLL, v34, v36, v43, v38, v40, v42, WeakRetained);

      objc_setProperty_atomic(self, v45, v44, 472);
      id v47 = objc_getProperty(self, v46, 472, 1);
      id v49 = objc_getProperty(self, v48, 32, 1);
      -[NEIKEv2Transport addClient:delegate:](v47, v49, v6);
    }
    id Property = objc_getProperty(self, v10, 472, 1);
  }
  else
  {
    if (!objc_getProperty(self, a2, 464, 1))
    {
      id v4 = objc_loadWeakRetained(self + 70);
      id v6 = objc_loadWeakRetained(self + 68);
      if ((*((unsigned char *)self + 25) & 1) != 0 && !v4)
      {
        SEL v7 = ne_log_obj();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          __int16 v50 = 0;
          SEL v8 = (uint8_t *)&v50;
LABEL_30:
          _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "Cannot create transport for packet delegate, delegate no longer valid", v8, 2u);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      int v14 = objc_msgSend(objc_getProperty(self, v5, 80, 1), "randomizeLocalPort");
      id v16 = objc_getProperty(self, v15, 72, 1);
      id v18 = objc_getProperty(self, v17, 64, 1);
      id v20 = objc_getProperty(self, v19, 304, 1);
      id v22 = objc_getProperty(self, v21, 536, 1);
      id v24 = objc_getProperty(self, v23, 552, 1);
      if (v14) {
        unsigned int v25 = 0;
      }
      else {
        unsigned int v25 = 500;
      }
      SEL v26 = +[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]((uint64_t)NEIKEv2Transport, 0, v16, v18, v25, v20, v22, v24, v4);

      objc_setProperty_atomic(self, v27, v26, 464);
      id v29 = objc_getProperty(self, v28, 464, 1);
      id v31 = objc_getProperty(self, v30, 32, 1);
      -[NEIKEv2Transport addClient:delegate:](v29, v31, v6);
    }
    id Property = objc_getProperty(self, v3, 464, 1);
  }

  return Property;
}

- (id)initiatorFirstMessage
{
  if (a1[9]) {
    ptrdiff_t v2 = 312;
  }
  else {
    ptrdiff_t v2 = 320;
  }
  id v3 = objc_getProperty(a1, a2, v2, 1);

  return v3;
}

- (id)responderFirstMessage
{
  if (a1[9]) {
    ptrdiff_t v2 = 320;
  }
  else {
    ptrdiff_t v2 = 312;
  }
  id v3 = objc_getProperty(a1, a2, v2, 1);

  return v3;
}

- (id)sharedSecret
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (objc_getProperty(a1, a2, 88, 1))
  {
    if (!objc_getProperty(a1, v3, 520, 1))
    {
      id Property = objc_getProperty(a1, v4, 88, 1);
      id v6 = +[NEIKEv2IKESA copySharedSecretFromConfig:]((uint64_t)NEIKEv2IKESA, Property);
      objc_setProperty_atomic(a1, v7, v6, 520);
    }
    id v8 = objc_getProperty(a1, v4, 520, 1);
  }
  else
  {
    id v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[NEIKEv2IKESA sharedSecret]";
      _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, "%s called with null self.sessionConfiguration", (uint8_t *)&v11, 0xCu);
    }

    id v8 = 0;
  }

  return v8;
}

+ (void)copySharedSecretFromConfig:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  if (!v2)
  {
    int v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315138;
      int v14 = "+[NEIKEv2IKESA copySharedSecretFromConfig:]";
      _os_log_fault_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_FAULT, "%s called with null sessionConfiguration", (uint8_t *)&v13, 0xCu);
    }
    SEL v7 = 0;
LABEL_9:

    goto LABEL_11;
  }
  id v4 = (const char *)v3;
  SEL v5 = [v2 sharedSecretReference];

  if (!v5)
  {
LABEL_7:
    id v9 = [v2 sharedSecret];

    if (!v9)
    {
      SEL v7 = 0;
      goto LABEL_11;
    }
    uint64_t v10 = MEMORY[0x1E4F1C9B8];
    int v11 = [v2 sharedSecret];
    SEL v7 = +[NSData sensitiveDataWithData:](v10, v11);
    goto LABEL_9;
  }
  id v6 = [v2 sharedSecretReference];
  SEL v7 = +[NEIKEv2Crypto copyDataFromPersistentReference:]((uint64_t)NEIKEv2Crypto, v6);

  if (!v7)
  {
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      int v14 = v4;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%@ Failed to retrieve shared secret by reference", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_11:

  return v7;
}

- (id)ppk
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = a1;
    if (objc_getProperty(a1, a2, 88, 1))
    {
      if (!objc_getProperty(v2, v3, 528, 1))
      {
        id Property = objc_getProperty(v2, v4, 88, 1);
        id v6 = +[NEIKEv2IKESA copyPPKFromConfig:]((uint64_t)NEIKEv2IKESA, Property);
        objc_setProperty_atomic(v2, v7, v6, 528);
      }
      a1 = objc_getProperty(v2, v4, 528, 1);
    }
    else
    {
      id v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v10 = 136315138;
        int v11 = "-[NEIKEv2IKESA ppk]";
        _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "%s called with null self.sessionConfiguration", (uint8_t *)&v10, 0xCu);
      }

      a1 = 0;
    }
  }

  return a1;
}

+ (void)copyPPKFromConfig:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  if (!v2)
  {
    int v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315138;
      int v14 = "+[NEIKEv2IKESA copyPPKFromConfig:]";
      _os_log_fault_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_FAULT, "%s called with null sessionConfiguration", (uint8_t *)&v13, 0xCu);
    }
    SEL v7 = 0;
LABEL_9:

    goto LABEL_11;
  }
  id v4 = (const char *)v3;
  SEL v5 = [v2 ppkReference];

  if (!v5)
  {
LABEL_7:
    id v9 = [v2 ppk];

    if (!v9)
    {
      SEL v7 = 0;
      goto LABEL_11;
    }
    uint64_t v10 = MEMORY[0x1E4F1C9B8];
    int v11 = [v2 ppk];
    SEL v7 = +[NSData sensitiveDataWithData:](v10, v11);
    goto LABEL_9;
  }
  id v6 = [v2 ppkReference];
  SEL v7 = +[NEIKEv2Crypto copyDataFromPersistentReference:]((uint64_t)NEIKEv2Crypto, v6);

  if (!v7)
  {
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      int v14 = v4;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%@ Failed to retrieve PPK by reference", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_11:

  return v7;
}

- (NEIKEv2AddressIdentifier)localIdentifier
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (objc_getProperty(a1, a2, 88, 1))
  {
    id v4 = objc_msgSend(objc_getProperty(a1, v3, 88, 1), "localIdentifier");

    if (v4)
    {
      objc_msgSend(objc_getProperty(a1, v5, 88, 1), "localIdentifier");
      id v6 = (NEIKEv2AddressIdentifier *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = [NEIKEv2AddressIdentifier alloc];
      id v6 = [(NEIKEv2AddressIdentifier *)v8 initWithAddress:objc_getProperty(a1, v9, 64, 1)];
    }
  }
  else
  {
    SEL v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[NEIKEv2IKESA localIdentifier]";
      _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, "%s called with null self.sessionConfiguration", (uint8_t *)&v11, 0xCu);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)remoteIdentifier
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!objc_getProperty(a1, a2, 88, 1))
  {
    id v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315138;
      int v11 = "-[NEIKEv2IKESA remoteIdentifier]";
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "%s called with null self.sessionConfiguration", (uint8_t *)&v10, 0xCu);
    }

LABEL_7:
    id v5 = 0;
    goto LABEL_10;
  }
  if (objc_getProperty(a1, v3, 504, 1))
  {
    id v5 = objc_getProperty(a1, v4, 504, 1);
    goto LABEL_10;
  }
  SEL v7 = objc_msgSend(objc_getProperty(a1, v4, 88, 1), "remoteIdentifier");

  if (!v7) {
    goto LABEL_7;
  }
  objc_msgSend(objc_getProperty(a1, v8, 88, 1), "remoteIdentifier");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

- (_BYTE)copyInitiatorIdentifier
{
  if (result)
  {
    if (result[9]) {
      [(NEIKEv2IKESA *)result localIdentifier];
    }
    else {
      [(NEIKEv2IKESA *)result remoteIdentifier];
    }
    return (unsigned char *)objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (_BYTE)copyResponderIdentifier
{
  if (result)
  {
    if (result[9]) {
      [(NEIKEv2IKESA *)result remoteIdentifier];
    }
    else {
      [(NEIKEv2IKESA *)result localIdentifier];
    }
    return (unsigned char *)objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (id)initiatorNonce
{
  if (a1[9]) {
    ptrdiff_t v2 = 128;
  }
  else {
    ptrdiff_t v2 = 136;
  }
  id v3 = objc_getProperty(a1, a2, v2, 1);

  return v3;
}

- (id)responderNonce
{
  if (a1[9]) {
    ptrdiff_t v2 = 136;
  }
  else {
    ptrdiff_t v2 = 128;
  }
  id v3 = objc_getProperty(a1, a2, v2, 1);

  return v3;
}

- (uint64_t)maximumPacketSize
{
  if (result)
  {
    ptrdiff_t v2 = (void *)result;
    CFTypeRef result = objc_msgSend(objc_getProperty((id)result, a2, 80, 1), "maximumPacketSize");
    if (!result)
    {
      if (objc_msgSend(objc_getProperty(v2, v3, 72, 1), "addressFamily") == 30) {
        return 1280;
      }
      else {
        return 576;
      }
    }
  }
  return result;
}

- (_BYTE)headerOverhead
{
  if (result)
  {
    ptrdiff_t v2 = result;
    CFTypeRef result = (unsigned char *)objc_msgSend(objc_getProperty(result, a2, 80, 1), "headerOverhead");
    if (result == -1)
    {
      if (v2[12]) {
        int v4 = 12;
      }
      else {
        int v4 = 8;
      }
      if (objc_msgSend(objc_getProperty(v2, v3, 72, 1), "addressFamily") == 30) {
        int v5 = 40;
      }
      else {
        int v5 = 20;
      }
      return (unsigned char *)(v5 + v4);
    }
  }
  return result;
}

- (id)authenticationProtocol
{
  if (a1)
  {
    id v3 = a1;
    int v4 = objc_msgSend(objc_getProperty(a1, a2, 88, 1), "authenticationProtocol");

    if (v4)
    {
      objc_msgSend(objc_getProperty(v3, v5, 88, 1), "authenticationProtocol");
      a1 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id Property = objc_getProperty(v3, v5, 96, 1);
      if (Property) {
        SEL v7 = (void *)Property[16];
      }
      else {
        SEL v7 = 0;
      }
      a1 = v7;
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)remoteAuthentication
{
  if (a1)
  {
    id v3 = a1;
    int v4 = objc_msgSend(objc_getProperty(a1, a2, 88, 1), "remoteAuthentication");

    if (v4)
    {
      objc_msgSend(objc_getProperty(v3, v5, 88, 1), "remoteAuthentication");
      a1 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id Property = objc_getProperty(v3, v5, 96, 1);
      if (Property) {
        SEL v7 = (void *)Property[16];
      }
      else {
        SEL v7 = 0;
      }
      a1 = v7;
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)usesEAPOnlyAuthentication
{
  id v3 = [(NEIKEv2IKESA *)a1 remoteAuthentication];
  if ([v3 method])
  {

    return 0;
  }
  uint64_t v5 = 1;
  id Property = objc_getProperty(a1, v4, 96, 1);
  char v7 = -[NEIKEv2IKESAProposal hasEAPMethods](Property);

  if ((v7 & 1) == 0) {
    return 0;
  }
  return v5;
}

- (void)setAuthProtocolFromPacket:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 368), a2);
  }
}

- (void)setPrimeAuthenticationDataFromPacket:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 384), a2);
  }
}

- (void)setPpkIDFromPacket:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 424), a2);
  }
}

- (void)setLocalAuthProtocolUsed:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 432), a2);
  }
}

- (void)setRemoteAuthProtocolUsed:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 440), a2);
  }
}

@end