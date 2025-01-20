@interface NEIKEv2NotifyPayload
+ (NEIKEv2NotifyPayload)createNotifyPayloadType:;
+ (NEIKEv2NotifyPayload)createNotifyPayloadType:(void *)a3 data:;
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (__CFString)copyError;
- (__CFString)copyTypeDescription;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (uint64_t)copyPPKID;
- (uint64_t)getPPKIDType;
- (unint64_t)type;
- (void)copyServerRedirectNonce;
@end

@implementation NEIKEv2NotifyPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spi, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (BOOL)parsePayloadData
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      buf[0] = 136315138;
      *(void *)&buf[1] = "-[NEIKEv2NotifyPayload parsePayloadData]";
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "%s called with null self.payloadData", (uint8_t *)buf, 0xCu);
    }
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") <= 3)
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      buf[0] = 136315138;
      *(void *)&buf[1] = "-[NEIKEv2NotifyPayload parsePayloadData]";
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "BACKTRACE %s called with null (self.payloadData.length >= sizeof(ikev2_payload_notify_hdr_t))", (uint8_t *)buf, 0xCu);
    }
LABEL_8:

    return 0;
  }
  int v29 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v29, 4);
  self->_notifyType = bswap32(HIWORD(v29)) >> 16;
  if (v29 == 3)
  {
    if (BYTE1(v29) != 4)
    {
      p_super = ne_log_obj();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        buf[0] = 67109120;
        buf[1] = BYTE1(v29);
        v13 = "Invalid Notify ESP SPI length %u";
        goto LABEL_24;
      }
      goto LABEL_28;
    }
    unint64_t v14 = objc_msgSend(objc_getProperty(self, v7, 16, 1), "length");
    if (v14 < (unint64_t)BYTE1(v29) + 4)
    {
      p_super = ne_log_obj();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      goto LABEL_28;
    }
    buf[0] = 0;
    objc_msgSend(objc_getProperty(self, v15, 16, 1), "getBytes:range:", buf, 4, 4);
    v16 = [NEIKEv2ESPSPI alloc];
    v17 = [(NEIKEv2ESPSPI *)v16 initWithValue:buf[0]];
LABEL_27:
    p_super = &v17->super.super;
    objc_setProperty_atomic(self, v18, v17, 40);
    goto LABEL_28;
  }
  if (v29 != 1 || !BYTE1(v29)) {
    goto LABEL_29;
  }
  if (BYTE1(v29) != 8)
  {
    p_super = ne_log_obj();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      buf[0] = 67109120;
      buf[1] = BYTE1(v29);
      v13 = "Invalid Notify IKE SPI length %u";
      goto LABEL_24;
    }
    goto LABEL_28;
  }
  unint64_t v8 = objc_msgSend(objc_getProperty(self, v7, 16, 1), "length");
  if (v8 >= (unint64_t)BYTE1(v29) + 4)
  {
    *(void *)buf = 0;
    objc_msgSend(objc_getProperty(self, v9, 16, 1), "getBytes:range:", buf, 4, 8);
    v19 = [NEIKEv2IKESPI alloc];
    v17 = [(NEIKEv2IKESPI *)v19 initWithValue:*(void *)buf];
    goto LABEL_27;
  }
  p_super = ne_log_obj();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
  {
LABEL_15:
    unsigned int v12 = objc_msgSend(objc_getProperty(self, v11, 16, 1), "length");
    buf[0] = 67109120;
    buf[1] = v12;
    v13 = "Invalid Notify payload length %u cannot hold SPI";
LABEL_24:
    _os_log_error_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_ERROR, v13, (uint8_t *)buf, 8u);
  }
LABEL_28:

LABEL_29:
  unint64_t v20 = objc_msgSend(objc_getProperty(self, v7, 16, 1), "length");
  if (v20 > (unint64_t)BYTE1(v29) + 4)
  {
    id v22 = objc_getProperty(self, v21, 16, 1);
    uint64_t v23 = BYTE1(v29);
    id v25 = objc_getProperty(self, v24, 16, 1);
    uint64_t v26 = [v25 length];
    v27 = objc_msgSend(v22, "subdataWithRange:", v23 + 4, v26 - BYTE1(v29) - 4);

    objc_setProperty_atomic(self, v28, v27, 32);
  }
  return [(NEIKEv2NotifyPayload *)self hasRequiredFields];
}

- (BOOL)generatePayloadData
{
  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1)) {
      goto LABEL_23;
    }
    if ([(NEIKEv2NotifyPayload *)self hasRequiredFields])
    {
      unint64_t notifyType = self->_notifyType;
      LOWORD(v31) = 0;
      HIWORD(v31) = bswap32(notifyType) >> 16;
      id Property = objc_getProperty(self, v4, 32, 1);
      uint64_t v7 = (unsigned __int16)notifyType;
LABEL_5:
      uint64_t v9 = [Property length];
      if (self) {
        id v10 = objc_getProperty(self, v8, 40, 1);
      }
      else {
        id v10 = 0;
      }
      id v11 = v10;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        if (self) {
          id v14 = objc_getProperty(self, v13, 40, 1);
        }
        else {
          id v14 = 0;
        }
        uint64_t v30 = [v14 value];
        LOWORD(v31) = 2049;
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", v9 + 12, v30);
        [v15 appendBytes:&v31 length:4];
        v16 = &v30;
        v17 = v15;
        uint64_t v18 = 8;
      }
      else
      {
        if (self) {
          id v19 = objc_getProperty(self, v13, 40, 1);
        }
        else {
          id v19 = 0;
        }
        id v20 = v19;
        objc_opt_class();
        char v21 = objc_opt_isKindOfClass();

        if (v21)
        {
          if (self) {
            id v23 = objc_getProperty(self, v22, 40, 1);
          }
          else {
            id v23 = 0;
          }
          LODWORD(v30) = [v23 value];
          LOWORD(v31) = 1027;
          v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", v9 + 8, v30);
          [v15 appendBytes:&v31 length:4];
          v16 = &v30;
          v17 = v15;
        }
        else
        {
          uint64_t v24 = v9 + 4;
          if (v7 == 16418) {
            LOBYTE(v31) = 1;
          }
          v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v24];
          v15 = v17;
          v16 = (uint64_t *)&v31;
        }
        uint64_t v18 = 4;
      }
      [v17 appendBytes:v16 length:v18];
      if (!self)
      {
        [v15 appendData:0];

        id v27 = 0;
        return v27 != 0;
      }
      objc_msgSend(v15, "appendData:", objc_getProperty(self, v25, 32, 1));
      objc_setProperty_atomic(self, v26, v15, 16);

LABEL_23:
      id v27 = objc_getProperty(self, v3, 16, 1);
      return v27 != 0;
    }
  }
  else if ([0 hasRequiredFields])
  {
    uint64_t v7 = 0;
    id Property = 0;
    int v31 = 0;
    goto LABEL_5;
  }
  int v29 = ne_log_obj();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v30) = 0;
    _os_log_error_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_ERROR, "Notify payload missing required fields", (uint8_t *)&v30, 2u);
  }

  return 0;
}

- (BOOL)hasRequiredFields
{
  if (self) {
    LOBYTE(self) = self->_notifyType != 0;
  }
  return (char)self;
}

- (id)description
{
  return [(NEIKEv2NotifyPayload *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  unint64_t v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  uint64_t v9 = -[NEIKEv2NotifyPayload copyTypeDescription]((__CFString *)self);
  [v7 appendPrettyObject:v9 withName:@"Notify Type" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v10, 32, 1), @"Notify Data", v5, a4);
    id Property = objc_getProperty(self, v11, 40, 1);
  }
  else
  {
    [v7 appendPrettyObject:0 withName:@"Notify Data" andIndent:v5 options:a4];
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"SPI" andIndent:v5 options:a4];

  return v7;
}

- (__CFString)copyTypeDescription
{
  if (result)
  {
    v1 = result;
    uint64_t length = result->length;
    if (length <= 41040)
    {
      uint64_t v3 = length - 0x4000;
      switch(v3)
      {
        case 0:
          result = @"InitialContact";
          break;
        case 1:
          result = @"SetWindowSize";
          break;
        case 2:
          result = @"AdditionalTSPossible";
          break;
        case 3:
          result = @"IPCOMPSupported";
          break;
        case 4:
          result = @"NATDetectionSourceIP";
          break;
        case 5:
          result = @"NATDetectionDestinationIP";
          break;
        case 6:
          result = @"Cookie";
          break;
        case 7:
          result = @"UseTransportMode";
          break;
        case 8:
          result = @"HTTPCertLookupSupported";
          break;
        case 9:
          result = @"RekeySA";
          break;
        case 10:
          result = @"ESPTFCPaddingNotSupported";
          break;
        case 11:
          result = @"NonFirstFragmentsAlso";
          break;
        case 12:
          result = @"MOBIKESupported";
          break;
        case 13:
          result = @"AdditionalIP4Address";
          break;
        case 14:
          result = @"AdditionalIP6Address";
          break;
        case 15:
          result = @"NoAdditionalAddresses";
          break;
        case 16:
          result = @"UpdateSAAddresses";
          break;
        case 17:
          result = @"Cookie2";
          break;
        case 18:
          result = @"NoNATSAllowed";
          break;
        case 19:
          result = @"AuthLifetime";
          break;
        case 20:
          result = @"MultipleAuthSupported";
          break;
        case 21:
          result = @"AnotherAuthFollows";
          break;
        case 22:
          result = @"RedirectSupported";
          break;
        case 23:
          result = @"ServerRedirect";
          break;
        case 24:
          result = @"RedirectedFrom";
          break;
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 48:
        case 49:
        case 50:
        case 55:
        case 56:
          return (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%u", v1->length);
        case 33:
          result = @"EAPOnlyAuthentication";
          break;
        case 34:
          result = @"ChildlessIKEv2Supported";
          break;
        case 40:
          result = @"SecurePasswordMethods";
          break;
        case 46:
          result = @"IKEv2FragmentationSupported";
          break;
        case 47:
          result = @"SignatureHashAlgorithms";
          break;
        case 51:
          result = @"UsePPK";
          break;
        case 52:
          result = @"PPKIdentity";
          break;
        case 53:
          result = @"NoPPKAuth";
          break;
        case 54:
          result = @"IntermediateExchangeSupported";
          break;
        case 57:
          result = @"AdditionalKeyExchange";
          break;
        default:
          result = @"None";
          switch(v3)
          {
            case 0:
              return result;
            case 1:
              result = @"UnsupportedCriticalPayload";
              break;
            case 2:
            case 3:
            case 6:
            case 8:
            case 10:
            case 12:
            case 13:
            case 15:
            case 16:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
            case 25:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 42:
            case 45:
            case 46:
              return (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%u", v1->length);
            case 4:
              result = @"InvalidIKESPI";
              break;
            case 5:
              result = @"InvalidMajorVersion";
              break;
            case 7:
              result = @"InvalidSyntax";
              break;
            case 9:
              result = @"InvalidMessageID";
              break;
            case 11:
              result = @"InvalidSPI";
              break;
            case 14:
              result = @"NoProposalChosen";
              break;
            case 17:
              result = @"InvalidKEPayload";
              break;
            case 24:
              result = @"AuthenticationFailed";
              break;
            case 34:
              result = @"SinglePairRequired";
              break;
            case 35:
              result = @"NoAdditionalSAs";
              break;
            case 36:
              result = @"InternalAddressFailure";
              break;
            case 37:
              result = @"FailedCPRequired";
              break;
            case 38:
              result = @"TSUnacceptable";
              break;
            case 39:
              result = @"InvalidSelectors";
              break;
            case 40:
              result = @"UnacceptableAddresses";
              break;
            case 41:
              result = @"UnexpectedNATDetected";
              break;
            case 43:
              result = @"TemporaryFailure";
              break;
            case 44:
              result = @"ChildSANotFound";
              break;
            case 47:
              result = @"StateNotFound";
              break;
            default:
              if (v3 != 10500) {
                return (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%u", v1->length);
              }
              result = @"NetworkFailure";
              break;
          }
          break;
      }
    }
    else
    {
      if (length <= 49999)
      {
        if (length == 41041) {
          return @"BackoffTimer";
        }
        if (length == 41101) {
          return @"DeviceIdentity";
        }
      }
      else
      {
        switch(length)
        {
          case 50000:
            return @"SequencePerTrafficClass";
          case 51015:
            return @"N1ModeCapability";
          case 51115:
            return @"N1ModeInformation";
        }
      }
      return (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%u", v1->length);
    }
  }
  return result;
}

- (unint64_t)type
{
  return 41;
}

+ (id)copyTypeDescription
{
  return @"Notify";
}

+ (NEIKEv2NotifyPayload)createNotifyPayloadType:
{
  self;
  result = objc_alloc_init(NEIKEv2NotifyPayload);
  if (result) {
    result->_unint64_t notifyType = 50000;
  }
  return result;
}

+ (NEIKEv2NotifyPayload)createNotifyPayloadType:(void *)a3 data:
{
  id v4 = a3;
  self;
  uint64_t v5 = objc_alloc_init(NEIKEv2NotifyPayload);
  uint64_t v7 = v5;
  if (v5)
  {
    v5->_unint64_t notifyType = a2;
    objc_setProperty_atomic(v5, v6, v4, 32);
  }

  return v7;
}

- (__CFString)copyError
{
  v1 = a1;
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ((unint64_t)(a1->length - 1) > 0x3FFE)
    {
      return 0;
    }
    else
    {
      id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t length = v1->length;
      uint64_t v7 = *MEMORY[0x1E4F28228];
      id v4 = -[NEIKEv2NotifyPayload copyTypeDescription](v1);
      v8[0] = v4;
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      v1 = (__CFString *)[v2 initWithDomain:@"NEIKEv2ProtocolErrorDomain" code:length userInfo:v5];
    }
  }
  return v1;
}

- (void)copyServerRedirectNonce
{
  id v2 = self;
  *(void *)&v14[5] = *MEMORY[0x1E4F143B8];
  if (self)
  {
    if (self[3] != 16407)
    {
      uint64_t v3 = ne_log_obj();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        *(void *)id v14 = v2;
        _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "BACKTRACE Cannot copy server redirect nonce from notification %@", (uint8_t *)&v13, 0xCu);
      }
      goto LABEL_16;
    }
    uint64_t v3 = objc_getProperty(self, a2, 32, 1);
    if ((unint64_t)[v3 length] > 1)
    {
      uint64_t v8 = [v3 bytes];
      if ([v3 length] - 2 < (unint64_t)*(unsigned __int8 *)(v8 + 1))
      {
        uint64_t v9 = ne_log_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v11 = [v3 length];
          int v12 = *(unsigned __int8 *)(v8 + 1);
          int v13 = 67109376;
          v14[0] = v11;
          LOWORD(v14[1]) = 1024;
          *(_DWORD *)((char *)&v14[1] + 2) = v12;
          _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "Server redirect has invalid length %u (gateway length %u)", (uint8_t *)&v13, 0xEu);
        }

        goto LABEL_16;
      }
      if ([v3 length] != *(unsigned __int8 *)(v8 + 1) + 2)
      {
        id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", v8 + *(unsigned __int8 *)(v8 + 1) + 2, -[NSObject length](v3, "length") - *(unsigned __int8 *)(v8 + 1) - 2);
        goto LABEL_17;
      }
      id v4 = ne_log_obj();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        uint64_t v5 = "Server redirect has no nonce";
        v6 = v4;
        uint32_t v7 = 2;
        goto LABEL_6;
      }
    }
    else
    {
      id v4 = ne_log_obj();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v13 = 134217984;
        *(void *)id v14 = [v3 length];
        uint64_t v5 = "Server redirect has invalid length %llu";
        v6 = v4;
        uint32_t v7 = 12;
LABEL_6:
        _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v13, v7);
      }
    }

LABEL_16:
    id v2 = 0;
LABEL_17:
  }
  return v2;
}

- (uint64_t)getPPKIDType
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*((void *)self + 3) == 16436)
  {
    if (objc_msgSend(objc_getProperty(self, a2, 32, 1), "length"))
    {
      LOBYTE(v6) = 0;
      objc_msgSend(objc_getProperty(self, v3, 32, 1), "getBytes:length:", &v6, 1);
      return v6;
    }
    uint64_t v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "Cannot get PPK ID type from too short notification %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "Cannot get PPK ID type from notification %@", (uint8_t *)&v6, 0xCu);
    }
  }

  return 0;
}

- (uint64_t)copyPPKID
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self[3] != 16436)
  {
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, "Cannot copy PPK ID from notification %@", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_8;
  }
  if (!objc_msgSend(objc_getProperty(self, a2, 32, 1), "length"))
  {
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "Cannot copy PPK ID from too short notification %@", (uint8_t *)&v9, 0xCu);
    }
LABEL_8:

    return 0;
  }
  id v4 = objc_getProperty(self, v3, 32, 1);
  uint64_t v6 = objc_msgSend(v4, "subdataWithRange:", 1, objc_msgSend(objc_getProperty(self, v5, 32, 1), "length") - 1);

  return v6;
}

@end