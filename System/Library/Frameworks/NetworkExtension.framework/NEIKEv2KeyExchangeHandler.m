@interface NEIKEv2KeyExchangeHandler
+ (NEIKEv2KeyExchangeHandlerMLKEM)handlerForKEMethod:(void *)a3 peerPayload:;
+ (NSObject)handlerForKEMethod:(uint64_t)a1;
- (BOOL)processPeerPayload:(id)a3;
- (void)initWithMethod:(void *)a1;
- (void)setSharedSecret:(uint64_t)a1;
@end

@implementation NEIKEv2KeyExchangeHandler

- (void)setSharedSecret:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedSecret, 0);

  objc_storeStrong((id *)&self->_keyExchangeData, 0);
}

- (BOOL)processPeerPayload:(id)a3
{
  return 0;
}

+ (NSObject)handlerForKEMethod:(uint64_t)a1
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  self;
  if (a2 > 0x25) {
    goto LABEL_28;
  }
  if (((1 << a2) & 0x7C026) != 0)
  {
    v3 = [NEIKEv2KeyExchangeHandlerMODP alloc];
    if (!v3)
    {
      v4 = 0;
      goto LABEL_36;
    }
    v4 = -[NEIKEv2KeyExchangeHandler initWithMethod:](v3, a2);
    if (!v4)
    {
LABEL_52:
      v4 = v4;
      v9 = v4;
      goto LABEL_53;
    }
    switch(a2)
    {
      case 1uLL:
        id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v6 = &NEIKEv2CryptoDHPrimeMODP768;
        uint64_t v7 = 96;
        break;
      case 2uLL:
        id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v6 = &NEIKEv2CryptoDHPrimeMODP1024;
        uint64_t v7 = 128;
        break;
      case 5uLL:
        id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v6 = &NEIKEv2CryptoDHPrimeMODP1536;
        uint64_t v7 = 192;
        break;
      case 0xEuLL:
        id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v6 = &NEIKEv2CryptoDHPrimeMODP2048;
        uint64_t v7 = 256;
        break;
      case 0xFuLL:
        id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v6 = &NEIKEv2CryptoDHPrimeMODP3072;
        uint64_t v7 = 384;
        break;
      case 0x10uLL:
        id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v6 = &NEIKEv2CryptoDHPrimeMODP4096;
        uint64_t v7 = 512;
        break;
      case 0x11uLL:
        id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v6 = &NEIKEv2CryptoDHPrimeMODP6144;
        uint64_t v7 = 768;
        break;
      case 0x12uLL:
        id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v6 = &NEIKEv2CryptoDHPrimeMODP8192;
        uint64_t v7 = 1024;
        break;
      default:
        v18 = ne_log_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v67 = a2;
          _os_log_fault_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_FAULT, "Unsupported KE method %zu", buf, 0xCu);
        }

        goto LABEL_36;
    }
    uint64_t v19 = [v5 initWithBytesNoCopy:v6 length:v7 freeWhenDone:0];
    Class isa = v4[4].isa;
    v4[4].Class isa = (Class)v19;

    v21 = ne_log_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      Class v46 = v4[1].isa;
      *(_DWORD *)buf = 134217984;
      unint64_t v67 = (unint64_t)v46;
      _os_log_debug_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_DEBUG, "Generate MODP DH %zu key", buf, 0xCu);
    }

    v22 = v4[4].isa;
    v65 = 0;
    [(objc_class *)v22 bytes];
    [(objc_class *)v22 length];
    int v23 = SecDHCreate();
    if (v23)
    {
      int v54 = v23;
      v27 = ne_log_obj();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        Class v55 = v4[1].isa;
        *(_DWORD *)buf = 134218240;
        unint64_t v67 = (unint64_t)v55;
        __int16 v68 = 1024;
        LODWORD(v69) = v54;
        v56 = "Failed to create MODP DH %zu context: %d";
        v57 = v27;
        uint32_t v58 = 18;
LABEL_81:
        _os_log_fault_impl(&dword_19DDAF000, v57, OS_LOG_TYPE_FAULT, v56, buf, v58);
      }
    }
    else
    {
      v4[5].Class isa = v65;
      unint64_t v24 = [(objc_class *)v22 length];
      unint64_t v25 = SecDHGetMaxKeyLength();
      if (v25 <= v24)
      {
        v26 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E4F1CA58], v24);
        if (v26)
        {
          v27 = v26;
          [(__CFData *)v26 mutableBytes];
          int v28 = SecDHGenerateKeypair();
          if (!v28)
          {
            objc_storeStrong((id *)&v4[2].isa, v27);
            v29 = ne_log_obj();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              Class v47 = v4[1].isa;
              *(_DWORD *)buf = 134217984;
              unint64_t v67 = (unint64_t)v47;
              _os_log_debug_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_DEBUG, "Generated MODP DH %zu key", buf, 0xCu);
            }

            goto LABEL_52;
          }
          int v62 = v28;
          v63 = ne_log_obj();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
          {
            Class v64 = v4[1].isa;
            *(_DWORD *)buf = 134218240;
            unint64_t v67 = (unint64_t)v64;
            __int16 v68 = 1024;
            LODWORD(v69) = v62;
            _os_log_fault_impl(&dword_19DDAF000, v63, OS_LOG_TYPE_FAULT, "Failed to generate MODP DH %zu key pair: %d", buf, 0x12u);
          }
        }
        else
        {
          v61 = ne_log_obj();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v67 = v24;
            _os_log_fault_impl(&dword_19DDAF000, v61, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed", buf, 0xCu);
          }

          v27 = 0;
        }
        goto LABEL_88;
      }
      unint64_t v59 = v25;
      v27 = ne_log_obj();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        Class v60 = v4[1].isa;
        *(_DWORD *)buf = 134218496;
        unint64_t v67 = (unint64_t)v60;
        __int16 v68 = 2048;
        v69 = v59;
        __int16 v70 = 2048;
        unint64_t v71 = v24;
        v56 = "Max MODP DH %zu key length (%zu) is greater than prime length (%zu)";
        v57 = v27;
        uint32_t v58 = 32;
        goto LABEL_81;
      }
    }
LABEL_88:

LABEL_36:
    v9 = 0;
LABEL_53:

    return v9;
  }
  if (((1 << a2) & 0x180380000) == 0)
  {
    if (((1 << a2) & 0x3000000000) != 0)
    {
      v13 = [NEIKEv2KeyExchangeHandlerMLKEM alloc];
      if (!v13) {
        return 0;
      }
      v9 = -[NEIKEv2KeyExchangeHandler initWithMethod:](v13, a2);
      if (!v9) {
        return v9;
      }
      v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v50 = (unint64_t)v9[1].isa;
        *(_DWORD *)buf = 134217984;
        unint64_t v67 = v50;
        _os_log_debug_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_DEBUG, "Generate ML-KEM %zu key", buf, 0xCu);
      }

      Class v15 = v9[1].isa;
      if (v15 == (Class)37)
      {
        v16 = _TtC16NetworkExtension25NEIKEv2CryptoKitMLKEM1024;
      }
      else
      {
        if (v15 != (Class)36)
        {
          v42 = ne_log_obj();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
          {
            unint64_t v45 = (unint64_t)v9[1].isa;
            *(_DWORD *)buf = 134217984;
            unint64_t v67 = v45;
            _os_log_fault_impl(&dword_19DDAF000, v42, OS_LOG_TYPE_FAULT, "Invalid ML-KEM type %zu", buf, 0xCu);
          }
          goto LABEL_75;
        }
        v16 = _TtC16NetworkExtension24NEIKEv2CryptoKitMLKEM768;
      }
      v65 = 0;
      uint64_t v37 = [[v16 alloc] initAndReturnError:&v65];
      v4 = v65;
      Class v38 = v9[4].isa;
      v9[4].Class isa = (Class)v37;

      Class v39 = v9[4].isa;
      v40 = ne_log_obj();
      v41 = v40;
      if (v39)
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v52 = (unint64_t)v9[1].isa;
          *(_DWORD *)buf = 134217984;
          unint64_t v67 = v52;
          _os_log_debug_impl(&dword_19DDAF000, v41, OS_LOG_TYPE_DEBUG, "Generated ML-KEM %zu key", buf, 0xCu);
        }

        v42 = v9[4].isa;
        uint64_t v43 = [v42 keyExchangeData];
        Class v44 = v9[2].isa;
        v9[2].Class isa = (Class)v43;

        goto LABEL_76;
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        unint64_t v53 = (unint64_t)v9[1].isa;
        *(_DWORD *)buf = 134218242;
        unint64_t v67 = v53;
        __int16 v68 = 2112;
        v69 = v4;
        _os_log_fault_impl(&dword_19DDAF000, v41, OS_LOG_TYPE_FAULT, "Failed to create ML-KEM %zu key: %@", buf, 0x16u);
      }

      v42 = v4;
LABEL_75:
      v4 = v9;
      v9 = 0;
LABEL_76:

      goto LABEL_53;
    }
LABEL_28:
    v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v67) = a2;
      _os_log_fault_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_FAULT, "Unknown KE method %u", buf, 8u);
    }

    return 0;
  }
  v8 = [NEIKEv2KeyExchangeHandlerECDH alloc];
  if (!v8) {
    return 0;
  }
  v9 = -[NEIKEv2KeyExchangeHandler initWithMethod:](v8, a2);
  if (v9)
  {
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v48 = (unint64_t)v9[1].isa;
      *(_DWORD *)buf = 134217984;
      unint64_t v67 = v48;
      _os_log_debug_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEBUG, "Generate ECDH %zu key", buf, 0xCu);
    }

    uint64_t v11 = (uint64_t)v9[1].isa;
    if (v11 <= 20)
    {
      if (v11 == 19)
      {
        v12 = _TtC16NetworkExtension20NEIKEv2CryptoKitP256;
        goto LABEL_57;
      }
      if (v11 == 20)
      {
        v12 = _TtC16NetworkExtension20NEIKEv2CryptoKitP384;
        goto LABEL_57;
      }
    }
    else
    {
      switch(v11)
      {
        case 21:
          v12 = _TtC16NetworkExtension20NEIKEv2CryptoKitP521;
          goto LABEL_57;
        case 31:
          v12 = _TtC16NetworkExtension22NEIKEv2CryptoKitX25519;
          goto LABEL_57;
        case 32:
          v12 = _TtC16NetworkExtension20NEIKEv2CryptoKitX448;
LABEL_57:
          v30 = (objc_class *)objc_alloc_init(v12);
          Class v31 = v9[4].isa;
          v9[4].Class isa = v30;

          v32 = ne_log_obj();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v49 = (unint64_t)v9[1].isa;
            *(_DWORD *)buf = 134217984;
            unint64_t v67 = v49;
            _os_log_debug_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_DEBUG, "Generated ECDH %zu key", buf, 0xCu);
          }

          v33 = v9[4].isa;
          uint64_t v34 = [(objc_class *)v33 keyExchangeData];
          v35 = v9[2].isa;
          v9[2].Class isa = (Class)v34;
LABEL_60:

          return v9;
      }
    }
    v35 = ne_log_obj();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      unint64_t v51 = (unint64_t)v9[1].isa;
      *(_DWORD *)buf = 134217984;
      unint64_t v67 = v51;
      _os_log_fault_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_FAULT, "Invalid ECDH type %zu", buf, 0xCu);
    }
    v33 = (objc_class *)v9;
    v9 = 0;
    goto LABEL_60;
  }
  return v9;
}

- (void)initWithMethod:(void *)a1
{
  v6.receiver = a1;
  v6.super_class = (Class)NEIKEv2KeyExchangeHandler;
  result = objc_msgSendSuper2(&v6, sel_init);
  if (result)
  {
    result[1] = a2;
  }
  else
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, "[super init] failed", v5, 2u);
    }

    return 0;
  }
  return result;
}

+ (NEIKEv2KeyExchangeHandlerMLKEM)handlerForKEMethod:(void *)a3 peerPayload:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  if (a2 <= 0x25)
  {
    if (((1 << a2) & 0x1803FC026) != 0)
    {
      objc_super v6 = +[NEIKEv2KeyExchangeHandler handlerForKEMethod:](v5, a2);
      if ([v6 processPeerPayload:v4])
      {
        uint64_t v7 = v6;
LABEL_5:

        goto LABEL_6;
      }
LABEL_32:
      uint64_t v7 = 0;
      goto LABEL_5;
    }
    if (((1 << a2) & 0x3000000000) != 0)
    {
      v9 = [NEIKEv2KeyExchangeHandlerMLKEM alloc];
      v10 = v4;
      objc_super v6 = v10;
      if (!v9) {
        goto LABEL_32;
      }
      if (!v10)
      {
        p_super = ne_log_obj();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v32 = "-[NEIKEv2KeyExchangeHandlerMLKEM initWithMLKEMMethod:peerPayload:]";
          _os_log_fault_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_FAULT, "%s called with null peerPayload", buf, 0xCu);
        }
        goto LABEL_30;
      }
      uint64_t v7 = (NEIKEv2KeyExchangeHandlerMLKEM *)-[NEIKEv2KeyExchangeHandler initWithMethod:](v9, a2);
      if (!v7) {
        goto LABEL_5;
      }
      uint64_t v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        method = (const char *)v7->super._method;
        *(_DWORD *)buf = 134217984;
        v32 = method;
        _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "Encapsulate ML-KEM %zu secret", buf, 0xCu);
      }

      unint64_t v12 = v7->super._method;
      if (v12 == 37)
      {
        v13 = _TtC16NetworkExtension25NEIKEv2CryptoKitMLKEM1024;
      }
      else
      {
        if (v12 != 36)
        {
          p_super = ne_log_obj();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
          {
            v26 = (const char *)v7->super._method;
            *(_DWORD *)buf = 134217984;
            v32 = v26;
            _os_log_fault_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_FAULT, "Invalid ML-KEM type %zu", buf, 0xCu);
          }
LABEL_29:
          v9 = v7;
LABEL_30:
          uint64_t v7 = 0;
LABEL_31:

          goto LABEL_5;
        }
        v13 = _TtC16NetworkExtension24NEIKEv2CryptoKitMLKEM768;
      }
      id v30 = 0;
      uint64_t v15 = [[v13 alloc] initWithPublicKeyData:v6 error:&v30];
      v9 = (NEIKEv2KeyExchangeHandlerMLKEM *)v30;
      mlkemHandler = v7->_mlkemHandler;
      v7->_mlkemHandler = (_TtC16NetworkExtension19NEIKEv2CryptoKitKEM *)v15;

      v17 = v7->_mlkemHandler;
      v18 = ne_log_obj();
      uint64_t v19 = v18;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          int v28 = (const char *)v7->super._method;
          *(_DWORD *)buf = 134217984;
          v32 = v28;
          _os_log_debug_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEBUG, "Encapsulated ML-KEM %zu secret", buf, 0xCu);
        }

        v20 = v7->_mlkemHandler;
        uint64_t v21 = [(NEIKEv2CryptoKitKEM *)v20 keyExchangeData];
        keyExchangeData = v7->super._keyExchangeData;
        v7->super._keyExchangeData = (NSData *)v21;

        p_super = v7->_mlkemHandler;
        uint64_t v24 = [p_super sharedSecret];
        sharedSecret = v7->super._sharedSecret;
        v7->super._sharedSecret = (NSData *)v24;

        goto LABEL_31;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v29 = (const char *)v7->super._method;
        *(_DWORD *)buf = 134218242;
        v32 = v29;
        __int16 v33 = 2112;
        uint64_t v34 = v9;
        _os_log_fault_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_FAULT, "Failed to encapsulate ML-KEM %zu secret: %@", buf, 0x16u);
      }

      p_super = &v9->super.super;
      goto LABEL_29;
    }
  }
  v14 = ne_log_obj();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v32) = a2;
    _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, "Unknown KE method %u", buf, 8u);
  }

  uint64_t v7 = 0;
LABEL_6:

  return v7;
}

@end