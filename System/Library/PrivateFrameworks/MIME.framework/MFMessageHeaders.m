@interface MFMessageHeaders
+ (BOOL)isStructuredHeaderKey:(id)a3;
+ (BOOL)shouldDecodeHeaderForKey:(id)a3;
+ (id)addressListFromEncodedString:(id)a3;
+ (id)basicHeaders;
+ (id)copyAddressListFromEncodedData:(id)a3 encoding:(unsigned int)a4;
+ (id)encodedDataForAddressList:(id)a3 splittingAtLength:(unint64_t)a4 firstLineBuffer:(unint64_t)a5;
+ (id)uniqueHeaderKeyStringForString:(id)a3;
- (BOOL)hasHeaderForKey:(id)a3;
- (MFMessageHeaders)init;
- (MFMessageHeaders)initWithASCIIHeaderString:(id)a3;
- (MFMessageHeaders)initWithHeaderData:(id)a3 encoding:(unsigned int)a4;
- (NSArray)listUnsubscribeCommands;
- (NSData)data;
- (NSData)encodedHeaders;
- (NSString)description;
- (NSString)listUnsubscribePostContent;
- (id)_capitalizedKeyForKey:(id)a3;
- (id)_commaSeparatedValuesForKey:(id)a3 includeAngleBracket:(BOOL)a4;
- (id)_copyAddressListForKey:(id)a3;
- (id)_copyHeaderValueForKey:(id)a3;
- (id)_copyHeaderValueForKey:(id)a3 offset:(unint64_t *)a4 decoded:(BOOL)a5;
- (id)_decodeHeaderKeysFromData:(id)a3;
- (id)_headerValueForKey:(id)a3 offset:(unint64_t *)a4;
- (id)allHeaderKeys;
- (id)copyAddressListForBcc;
- (id)copyAddressListForCc;
- (id)copyAddressListForReplyTo;
- (id)copyAddressListForResentFrom;
- (id)copyAddressListForSender;
- (id)copyAddressListForTo;
- (id)copyDecodedStringFromHeaderData:(id)a3 withRange:(_NSRange)a4;
- (id)copyFirstHeaderForKey:(id)a3;
- (id)copyFirstNonDecodedHeaderForKey:(id)a3;
- (id)copyFirstStringValueForKey:(id)a3;
- (id)copyHeadersForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstAddressForKey:(id)a3;
- (id)firstHeaderForKey:(id)a3;
- (id)firstMessageIDForKey:(id)a3;
- (id)firstSenderAddress;
- (id)headerData;
- (id)headersDictionary;
- (id)headersForKey:(id)a3;
- (id)headersRequiringSMTPUTF8Support;
- (id)messageIDListForKey:(id)a3;
- (id)mutableCopy;
- (id)references;
- (unsigned)_contentTypeEncoding;
- (unsigned)preferredEncoding;
- (void)_setCapitalizedKey:(id)a3 forKey:(id)a4;
- (void)appendHeaderData:(id)a3 andRecipients:(id)a4;
- (void)enumerateKeysAndBytesUsingBlock:(id)a3;
- (void)setData:(id)a3;
- (void)setPreferredEncoding:(unsigned int)a3;
@end

@implementation MFMessageHeaders

- (void)enumerateKeysAndBytesUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, char *, void))a3;
  v5 = [(NSData *)self->_data bytes];
  [(NSData *)self->_data length];
  memset(v8, 170, sizeof(v8));
  while (ECGetNextHeaderFromDataInRange())
  {
    v6 = (void *)[[NSString alloc] initWithBytesNoCopy:&v5[v8[2]] length:v8[3] encoding:1 freeWhenDone:0];
    v7 = [v6 lowercaseString];

    v4[2](v4, v7, &v5[v8[0]], v8[1]);
  }
}

void __37__MFMessageHeaders_headersDictionary__block_invoke(uint64_t a1, void *a2, UInt8 *a3, size_t a4)
{
  id v14 = a2;
  id v7 = _MFCreateStringFromHeaderBytes(*(_DWORD *)(a1 + 40), a3, a4);
  if ([v14 length] && objc_msgSend(v7, "length"))
  {
    v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    v12 = [v8 objectForKeyedSubscript:v14];
    v13 = v12;
    if (v12)
    {
      [v12 addObject:v7];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:");
    }
  }
}

- (MFMessageHeaders)initWithHeaderData:(id)a3 encoding:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFMessageHeaders;
  id v7 = [(MFMessageHeaders *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MFMessageHeaders *)v7 setPreferredEncoding:v4];
    [(MFMessageHeaders *)v8 setData:v6];
  }

  return v8;
}

- (void)setPreferredEncoding:(unsigned int)a3
{
  self->_preferredEncoding = a3;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)firstHeaderForKey:(id)a3
{
  uint64_t v5 = 0;
  v3 = [(MFMessageHeaders *)self _headerValueForKey:a3 offset:&v5];
  return v3;
}

- (id)headersDictionary
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  unsigned int v3 = [(MFMessageHeaders *)self _contentTypeEncoding];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__MFMessageHeaders_headersDictionary__block_invoke;
  v6[3] = &unk_1E5F89830;
  unsigned int v7 = v3;
  v6[4] = &v8;
  [(MFMessageHeaders *)self enumerateKeysAndBytesUsingBlock:v6];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)_headerValueForKey:(id)a3 offset:(unint64_t *)a4
{
  id v4 = [(MFMessageHeaders *)self _copyHeaderValueForKey:a3 offset:a4 decoded:1];
  return v4;
}

- (unsigned)_contentTypeEncoding
{
  id v2 = [(MFMessageHeaders *)self copyFirstNonDecodedHeaderForKey:*MEMORY[0x1E4F60698]];
  unsigned int v3 = v2;
  if (v2)
  {
    id v4 = v2;
    id v5 = _MFCreateStringFromHeaderBytes(0xFFFFFFFF, (UInt8 *)[v4 bytes], objc_msgSend(v4, "length"));
    if (v5)
    {
      id v16 = 0;
      id v17 = 0;
      id v15 = 0;
      BOOL v6 = +[MFMimePart parseContentTypeHeader:v5 type:&v17 subtype:&v16 info:&v15];
      id v7 = v17;
      id v8 = v16;
      id v9 = v15;
      uint64_t v10 = v9;
      if (v6)
      {
        CFStringRef v11 = [v9 objectForKey:@"charset"];
        v12 = (__CFString *)v11;
        if (v11) {
          unsigned int v13 = MFEncodingForCharset(v11);
        }
        else {
          unsigned int v13 = -1;
        }
      }
      else
      {
        unsigned int v13 = -1;
      }
    }
    else
    {
      unsigned int v13 = -1;
    }
  }
  else
  {
    unsigned int v13 = -1;
  }

  return v13;
}

- (id)copyFirstNonDecodedHeaderForKey:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v5 = [(MFMessageHeaders *)self _copyHeaderValueForKey:v4 offset:&v7 decoded:0];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __assert_rtn("-[MFMessageHeaders copyFirstNonDecodedHeaderForKey:]", "MessageHeaders.m", 621, "!result || [result isKindOfClass:[NSData class]]");
    }
  }

  return v5;
}

- (id)_copyHeaderValueForKey:(id)a3 offset:(unint64_t *)a4 decoded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(NSData *)self->_data length];
  if (ECGetNextHeaderFromDataInRange())
  {
    if (v5)
    {
      id v9 = -[MFMessageHeaders copyDecodedStringFromHeaderData:withRange:](self, "copyDecodedStringFromHeaderData:withRange:", self->_data, 0, 0);
    }
    else
    {
      -[NSData subdataWithRange:](self->_data, "subdataWithRange:", 0, 0);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v10 = v9;
    *a4 = 0;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)copyDecodedStringFromHeaderData:(id)a3 withRange:(_NSRange)a4
{
  size_t length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      [(MFMessageHeaders *)isKindOfClass & 1 copyDecodedStringFromHeaderData:(uint64_t)v8 withRange:v9];
    }

    CFStringRef v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_opt_class();
    [v11 handleFailureInMethod:a2, self, @"MessageHeaders.m", 305, @"MFMessageHeaders::copyDecodedStringFromHeaderData invalid data, [data:%p] [data.isNSData:%i]", v8, objc_opt_isKindOfClass() & 1 object file lineNumber description];
  }
  if (location + length > [v8 length])
  {
    v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v19 = [v8 length];
      __int16 v20 = 2048;
      NSUInteger v21 = location;
      __int16 v22 = 2048;
      size_t v23 = length;
      _os_log_fault_impl(&dword_1AFB03000, v12, OS_LOG_TYPE_FAULT, "_MFCreateStringFromHeaderBytes buffer overflow preempt, [data.length:%lu] [range.location:%lu/length:%lu]", buf, 0x20u);
    }

    unsigned int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MessageHeaders.m", 312, @"_MFCreateStringFromHeaderBytes buffer overflow preempt, [data.length:%lu] [range.location:%lu/length:%lu]", objc_msgSend(v8, "length"), location, length object file lineNumber description];
  }
  unsigned int preferredEncoding = self->_preferredEncoding;
  if (preferredEncoding == -1)
  {
    unsigned int preferredEncoding = [(MFMessageHeaders *)self _contentTypeEncoding];
    self->_unsigned int preferredEncoding = preferredEncoding;
  }
  id v15 = v8;
  id v16 = _MFCreateStringFromHeaderBytes(preferredEncoding, (UInt8 *)([v15 bytes] + location), length);
  if (!v16)
  {
    if (self->_preferredEncoding == -1) {
      id v16 = 0;
    }
    else {
      id v16 = _MFCreateStringFromHeaderBytes(0xFFFFFFFF, (UInt8 *)([v15 bytes] + location), length);
    }
  }

  return v16;
}

- (BOOL)hasHeaderForKey:(id)a3
{
  id v4 = a3;
  [(NSData *)self->_data length];
  LOBYTE(self) = ECGetNextHeaderFromDataInRange();

  return (char)self;
}

+ (id)basicHeaders
{
  v9[10] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F606A8];
  v9[0] = *MEMORY[0x1E4F60720];
  v9[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F60730];
  v9[2] = *MEMORY[0x1E4F606A0];
  v9[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F60718];
  v9[4] = *MEMORY[0x1E4F60740];
  v9[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F60738];
  v9[6] = *MEMORY[0x1E4F60660];
  v9[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F60638];
  v9[8] = *MEMORY[0x1E4F60710];
  v9[9] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:10];
  return v7;
}

+ (BOOL)isStructuredHeaderKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = ![v3 caseInsensitiveCompare:*MEMORY[0x1E4F60740]]
    || ![v3 caseInsensitiveCompare:*MEMORY[0x1E4F606A8]]
    || ![v3 caseInsensitiveCompare:*MEMORY[0x1E4F60720]]
    || ![v3 caseInsensitiveCompare:*MEMORY[0x1E4F60730]]
    || ![v3 caseInsensitiveCompare:*MEMORY[0x1E4F60718]]
    || ![v3 caseInsensitiveCompare:*MEMORY[0x1E4F60660]]
    || ![v3 caseInsensitiveCompare:*MEMORY[0x1E4F60650]]
    || [v3 caseInsensitiveCompare:*MEMORY[0x1E4F60710]] == 0;

  return v4;
}

+ (BOOL)shouldDecodeHeaderForKey:(id)a3
{
  return [a1 isStructuredHeaderKey:a3] ^ 1;
}

- (MFMessageHeaders)init
{
  return [(MFMessageHeaders *)self initWithHeaderData:0 encoding:1536];
}

- (MFMessageHeaders)initWithASCIIHeaderString:(id)a3
{
  BOOL v4 = [a3 dataUsingEncoding:1];
  uint64_t v5 = [(MFMessageHeaders *)self initWithHeaderData:v4 encoding:1536];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = [MFMessageHeaders alloc];
  data = self->_data;
  uint64_t preferredEncoding = self->_preferredEncoding;
  return [(MFMessageHeaders *)v4 initWithHeaderData:data encoding:preferredEncoding];
}

- (id)mutableCopy
{
  id v3 = [MFMutableMessageHeaders alloc];
  data = self->_data;
  uint64_t preferredEncoding = self->_preferredEncoding;
  return [(MFMessageHeaders *)v3 initWithHeaderData:data encoding:preferredEncoding];
}

- (id)headerData
{
  return self->_data;
}

- (id)headersRequiringSMTPUTF8Support
{
  id v3 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MFMessageHeaders_headersRequiringSMTPUTF8Support__block_invoke;
  v7[3] = &unk_1E5F89808;
  id v4 = v3;
  id v8 = v4;
  [(MFMessageHeaders *)self enumerateKeysAndBytesUsingBlock:v7];
  uint64_t v5 = [v4 allObjects];

  return v5;
}

void __51__MFMessageHeaders_headersRequiringSMTPUTF8Support__block_invoke(uint64_t a1, void *a2, char *a3, uint64_t a4)
{
  id v9 = a2;
  uint64_t v7 = &a3[a4];
  while (a3 < v7)
  {
    int v8 = *a3++;
    if (v8 < 0)
    {
      [*(id *)(a1 + 32) addObject:v9];
      break;
    }
  }
}

- (unsigned)preferredEncoding
{
  return self->_preferredEncoding;
}

- (id)allHeaderKeys
{
  return [(MFMessageHeaders *)self _decodeHeaderKeysFromData:self->_data];
}

- (void)_setCapitalizedKey:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  _MFLockGlobalLock();
  CFDictionaryRef Mutable = (const __CFDictionary *)_capitalizedKeyCache;
  if (!_capitalizedKeyCache)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
    _capitalizedKeyCache = (uint64_t)Mutable;
  }
  if (!CFDictionaryGetValue(Mutable, v5))
  {
    uint64_t v7 = (void *)[[NSString alloc] initWithString:v8];
    CFDictionarySetValue((CFMutableDictionaryRef)_capitalizedKeyCache, v5, v7);
  }
  _MFUnlockGlobalLock();
}

- (id)_capitalizedKeyForKey:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (_capitalizedKeyCache)
  {
    _MFLockGlobalLock();
    uint64_t v6 = CFDictionaryGetValue((CFDictionaryRef)_capitalizedKeyCache, v5);
    _MFUnlockGlobalLock();
    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (!v4) {
      goto LABEL_7;
    }
  }
  if (!v6)
  {
    uint64_t v6 = [v5 capitalizedString];
    [(MFMessageHeaders *)self _setCapitalizedKey:v6 forKey:v5];
  }
LABEL_7:

  return v6;
}

- (id)_copyHeaderValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = 0;
  uint64_t v9 = 0;
  while (1)
  {
    id v7 = [(MFMessageHeaders *)self _copyHeaderValueForKey:v4 offset:&v9 decoded:1];

    if (!v7) {
      break;
    }
    uint64_t v6 = v7;
    [v5 addObject:v7];
  }

  return v5;
}

- (id)copyHeadersForKey:(id)a3
{
  id v3 = [(MFMessageHeaders *)self _copyHeaderValueForKey:a3];
  id v4 = v3;
  if (v3 && ![v3 count]) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }

  return v5;
}

- (id)headersForKey:(id)a3
{
  id v3 = [(MFMessageHeaders *)self copyHeadersForKey:a3];
  return v3;
}

+ (id)copyAddressListFromEncodedData:(id)a3 encoding:(unsigned int)a4
{
  id v4 = a3;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = objc_msgSend(v4, "length", v4);
  id v31 = v4;
  uint64_t v6 = [v31 bytes];
  id v7 = (UInt8 *)v6;
  if (v5 >= 1)
  {
    int v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = v6 + v5;
    CFStringRef v11 = (UInt8 *)v6;
    while (1)
    {
      if (v11 == v7)
      {
        unsigned int v12 = *v7;
        if (v12 > 0x20 || ((1 << v12) & 0x100000600) == 0) {
          goto LABEL_10;
        }
        ++v7;
      }
      unsigned int v12 = *v11;
LABEL_10:
      if (v12 == 34)
      {
        v8 ^= 1u;
LABEL_42:
        if ((unint64_t)++v11 >= v10) {
          break;
        }
      }
      else
      {
        LODWORD(v14) = (v12 == 41) & ~v8;
        if (v9) {
          uint64_t v14 = v14;
        }
        else {
          uint64_t v14 = 0;
        }
        uint64_t v15 = v14 << 63 >> 63;
        if ((v12 != 40) | v8 & 1) {
          uint64_t v16 = v15;
        }
        else {
          uint64_t v16 = 1;
        }
        v9 += v16;
        char v17 = (v12 == 44) & ~(_BYTE)v8;
        if (v9) {
          char v17 = 0;
        }
        if ((v17 & 1) == 0 && v11 + 1 != (UInt8 *)v10) {
          goto LABEL_42;
        }
        if (v12 == 44) {
          v18 = v11;
        }
        else {
          v18 = v11 + 1;
        }
        uint64_t v19 = v18;
        if (v18 > v7)
        {
          uint64_t v19 = v18;
          unint64_t v20 = (unint64_t)v18;
          while (1)
          {
            unsigned int v21 = *(unsigned __int8 *)--v20;
            uint64_t v22 = (1 << v21) & 0x100000600;
            if (v21 > 0x20 || v22 == 0) {
              break;
            }
            uint64_t v19 = (UInt8 *)v20;
            if (v20 <= (unint64_t)v7)
            {
              uint64_t v19 = v7;
              break;
            }
          }
        }
        if (v19 - v7 >= 1)
        {
          id v24 = _MFCreateStringFromHeaderBytes(a4, v7, v19 - v7);
          uint64_t v25 = [v24 emailAddressValue];
          v26 = [v25 stringValue];
          v27 = v26;
          if (v26)
          {
            id v28 = v26;
          }
          else
          {
            id v28 = [v24 stringValue];
          }
          v29 = v28;

          if ([v29 length]) {
            [v32 addObject:v29];
          }
        }
        id v7 = v18 + 1;
        CFStringRef v11 = v18 + 1;
        if ((unint64_t)(v18 + 1) >= v10) {
          break;
        }
      }
    }
  }

  return v32;
}

+ (id)addressListFromEncodedString:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  uint64_t v5 = (void *)[a1 copyAddressListFromEncodedData:v4 encoding:134217984];

  return v5;
}

+ (id)encodedDataForAddressList:(id)a3 splittingAtLength:(unint64_t)a4 firstLineBuffer:(unint64_t)a5
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v101 = objc_alloc_init(MFMutableData);
  unint64_t v8 = a4 - a5;
  unint64_t v96 = a4;
  long long v118 = 0u;
  long long v119 = 0u;
  if (!a4) {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v102 = v8;
  long long v116 = 0uLL;
  long long v117 = 0uLL;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v116 objects:v122 count:16];
  if (v9)
  {
    uint64_t v98 = *(void *)v117;
    do
    {
      uint64_t v99 = v9;
      for (uint64_t i = 0; i != v99; ++i)
      {
        if (*(void *)v117 != v98) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v116 + 1) + 8 * i);
        v100 = (void *)[objc_alloc(MEMORY[0x1E4F60808]) initWithStyle:1];
        [v100 setShouldIncludeDisplayName:1];
        unsigned int v12 = [v100 stringFromEmailAddressConvertible:v11];
        int64_t v115 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v113 = v13;
        long long v114 = v13;
        long long v111 = v13;
        *(_OWORD *)v112 = v13;
        long long v109 = v13;
        long long v110 = v13;
        long long v107 = v13;
        long long v108 = v13;
        long long v105 = v13;
        long long v106 = v13;
        *(_OWORD *)buffer = v13;
        theString = v12;
        uint64_t v14 = [(__CFString *)v12 length];
        v112[0] = v12;
        *((void *)&v113 + 1) = 0;
        *(void *)&long long v114 = v14;
        v112[1] = (CFStringRef)CFStringGetCharactersPtr(v12);
        if (v112[1]) {
          CStringPtr = 0;
        }
        else {
          CStringPtr = CFStringGetCStringPtr(v12, 0x600u);
        }
        *(void *)&long long v113 = CStringPtr;
        *((void *)&v114 + 1) = 0;
        int64_t v115 = 0;
        uint64_t v16 = objc_alloc_init(MFMutableData);
        unint64_t v17 = [(__CFString *)theString length];
        CFMutableStringRef Mutable = CFStringCreateMutable(0, v17);
        UniChar chars = -21846;
        if (!v17)
        {
LABEL_49:
          unsigned int v21 = 0;
          goto LABEL_50;
        }
        uint64_t v19 = 0;
        unsigned __int8 v20 = 0;
        unsigned int v21 = 0;
        int v22 = 0;
        unsigned __int8 v23 = 0;
        while (1)
        {
          int64_t v24 = v114;
          if ((uint64_t)v114 > v19) {
            break;
          }
          UniChar chars = 0;
LABEL_48:
          uint64_t v19 = ++v21;
          if (v17 <= v21) {
            goto LABEL_49;
          }
        }
        uint64_t v25 = (UniChar *)v112[1];
        if (v112[1])
        {
          uint64_t v26 = *((void *)&v113 + 1) + v19;
LABEL_16:
          UniChar v27 = v25[v26];
          goto LABEL_20;
        }
        if (!(void)v113)
        {
          uint64_t v30 = *((void *)&v114 + 1);
          if (v115 <= v19 || *((void *)&v114 + 1) > v19)
          {
            uint64_t v32 = v19 - 4;
            if (v21 < 4) {
              uint64_t v32 = 0;
            }
            if (v32 + 64 < (uint64_t)v114) {
              int64_t v24 = v32 + 64;
            }
            *((void *)&v114 + 1) = v32;
            int64_t v115 = v24;
            v125.NSUInteger location = *((void *)&v113 + 1) + v32;
            v125.size_t length = v24 - v32;
            CFStringGetCharacters(v112[0], v125, buffer);
            uint64_t v30 = *((void *)&v114 + 1);
          }
          uint64_t v26 = v19 - v30;
          uint64_t v25 = buffer;
          goto LABEL_16;
        }
        UniChar v27 = *(char *)(v113 + *((void *)&v113 + 1) + v19);
LABEL_20:
        UniChar chars = v27;
        if (v27 == 92 && v17 > v21 + 1)
        {
          ++v21;
          goto LABEL_48;
        }
        if (v27 == 34 && v22 == 0)
        {
          int v22 = 0;
          v20 ^= 1u;
          goto LABEL_48;
        }
        if (!((v27 != 40) | v20 & 1))
        {
          unsigned __int8 v20 = 0;
          ++v22;
          goto LABEL_48;
        }
        if (!((v27 != 41) | v20 & 1))
        {
          unsigned __int8 v20 = 0;
          --v22;
          goto LABEL_48;
        }
        if (v27 != 60 || ((v20 ^ 1) & 1) == 0 || v22)
        {
          v23 |= (v27 == 44) & (v20 ^ 1);
          goto LABEL_48;
        }
        if (!v21) {
          goto LABEL_202;
        }
        unint64_t v57 = v21;
        while (2)
        {
          uint64_t v58 = (v57 - 1);
          int64_t v59 = v114;
          if ((uint64_t)v114 > v58)
          {
            v60 = (UniChar *)v112[1];
            if (v112[1])
            {
              uint64_t v61 = *((void *)&v113 + 1) + v58;
              goto LABEL_127;
            }
            if ((void)v113)
            {
              UniChar v62 = *(char *)(v113 + *((void *)&v113 + 1) + v58);
            }
            else
            {
              uint64_t v63 = *((void *)&v114 + 1);
              if (v115 <= v58 || *((void *)&v114 + 1) > v58)
              {
                uint64_t v65 = v58 - 4;
                if (v57 < 5) {
                  uint64_t v65 = 0;
                }
                if (v65 + 64 < (uint64_t)v114) {
                  int64_t v59 = v65 + 64;
                }
                *((void *)&v114 + 1) = v65;
                int64_t v115 = v59;
                v130.NSUInteger location = *((void *)&v113 + 1) + v65;
                v130.size_t length = v59 - v65;
                CFStringGetCharacters(v112[0], v130, buffer);
                uint64_t v63 = *((void *)&v114 + 1);
              }
              uint64_t v61 = v58 - v63;
              v60 = buffer;
LABEL_127:
              UniChar v62 = v60[v61];
            }
            if (v62 != 9 && v62 != 32) {
              break;
            }
            --v57;
            if (!v58) {
              goto LABEL_202;
            }
            continue;
          }
          break;
        }
        if (v57)
        {
          uint64_t v66 = 0;
          uint64_t v67 = 0;
          uint64_t v68 = 64;
          while (1)
          {
            uint64_t v69 = (unint64_t)v67 >= 4 ? 4 : v67;
            uint64_t v70 = v114;
            if ((uint64_t)v114 <= v67) {
              break;
            }
            if (v112[1])
            {
              UniChar v71 = *((_WORD *)&v112[1]->isa + v67 + *((void *)&v113 + 1));
            }
            else if ((void)v113)
            {
              UniChar v71 = *(char *)(v113 + *((void *)&v113 + 1) + v67);
            }
            else
            {
              uint64_t v72 = *((void *)&v114 + 1);
              if (v115 <= v67 || *((void *)&v114 + 1) > v67)
              {
                uint64_t v94 = v66;
                uint64_t v74 = v69 + v66;
                uint64_t v75 = v68 - v69;
                uint64_t v76 = v67 - v69;
                int64_t v77 = v76 + 64;
                if (v76 + 64 >= (uint64_t)v114) {
                  int64_t v77 = v114;
                }
                *((void *)&v114 + 1) = v76;
                int64_t v115 = v77;
                if ((uint64_t)v114 >= v75) {
                  uint64_t v70 = v75;
                }
                v131.size_t length = v70 + v74;
                v131.NSUInteger location = v76 + *((void *)&v113 + 1);
                CFStringGetCharacters(v112[0], v131, buffer);
                uint64_t v72 = *((void *)&v114 + 1);
                uint64_t v66 = v94;
              }
              UniChar v71 = buffer[v67 - v72];
            }
            if (v71 != 32 && v71 != 9) {
              break;
            }
            ++v67;
            --v66;
            ++v68;
            if (v57 == v67) {
              goto LABEL_202;
            }
          }
          if (v23) {
            CFStringAppend(Mutable, @"\"");
          }
          uint64_t v79 = 0;
          uint64_t v80 = 0;
          if (v57 <= 1) {
            uint64_t v81 = 1;
          }
          else {
            uint64_t v81 = v57;
          }
          uint64_t v95 = v81;
          uint64_t v82 = 64;
          do
          {
            if ((unint64_t)v80 >= 4) {
              uint64_t v83 = 4;
            }
            else {
              uint64_t v83 = v80;
            }
            UniChar v120 = -21846;
            uint64_t v84 = v114;
            if ((uint64_t)v114 <= v80)
            {
              UniChar v120 = 0;
            }
            else
            {
              if (v112[1])
              {
                UniChar v85 = *((_WORD *)&v112[1]->isa + v80 + *((void *)&v113 + 1));
              }
              else if ((void)v113)
              {
                UniChar v85 = *(char *)(v113 + *((void *)&v113 + 1) + v80);
              }
              else
              {
                uint64_t v86 = *((void *)&v114 + 1);
                if (v115 <= v80 || *((void *)&v114 + 1) > v80)
                {
                  uint64_t v88 = v83 + v79;
                  uint64_t v89 = v82 - v83;
                  uint64_t v90 = v80 - v83;
                  int64_t v91 = v90 + 64;
                  if (v90 + 64 >= (uint64_t)v114) {
                    int64_t v91 = v114;
                  }
                  *((void *)&v114 + 1) = v90;
                  int64_t v115 = v91;
                  if ((uint64_t)v114 >= v89) {
                    uint64_t v84 = v89;
                  }
                  v132.size_t length = v84 + v88;
                  v132.NSUInteger location = v90 + *((void *)&v113 + 1);
                  CFStringGetCharacters(v112[0], v132, buffer);
                  uint64_t v86 = *((void *)&v114 + 1);
                }
                UniChar v85 = buffer[v80 - v86];
              }
              UniChar v120 = v85;
              if ((v23 & (v85 == 34)) == 1) {
                CFStringAppend(Mutable, @"\\"");
              }
            }
            CFStringAppendCharacters(Mutable, &v120, 1);
            ++v80;
            --v79;
            ++v82;
          }
          while (v95 != v80);
          if (v23) {
            CFStringAppend(Mutable, @"\"");
          }
          v92 = [(__CFString *)Mutable mf_encodedHeaderDataWithEncodingHint:0xFFFFFFFFLL];
          [(MFMutableData *)v16 appendData:v92];
        }
LABEL_202:
        [(NSMutableData *)v16 mf_appendCString:" "];
        v133.size_t length = CFStringGetLength(Mutable);
        v133.NSUInteger location = 0;
        CFStringDelete(Mutable, v133);
LABEL_50:
        if (v17 > v21)
        {
          char v33 = 0;
          int v34 = 0;
          uint64_t v35 = v21;
          while (1)
          {
            int64_t v36 = v114;
            if ((uint64_t)v114 <= v35)
            {
              UniChar chars = 0;
              goto LABEL_57;
            }
            v37 = (UniChar *)v112[1];
            if (v112[1]) {
              break;
            }
            if (!(void)v113)
            {
              uint64_t v47 = *((void *)&v114 + 1);
              if (v115 <= v35 || *((void *)&v114 + 1) > v35)
              {
                uint64_t v49 = v35 - 4;
                if (v21 < 4) {
                  uint64_t v49 = 0;
                }
                if (v49 + 64 < (uint64_t)v114) {
                  int64_t v36 = v49 + 64;
                }
                *((void *)&v114 + 1) = v49;
                int64_t v115 = v36;
                v127.NSUInteger location = *((void *)&v113 + 1) + v49;
                v127.size_t length = v36 - v49;
                CFStringGetCharacters(v112[0], v127, buffer);
                uint64_t v47 = *((void *)&v114 + 1);
              }
              uint64_t v38 = v35 - v47;
              v37 = buffer;
              goto LABEL_55;
            }
            UniChar v39 = *(char *)(v113 + *((void *)&v113 + 1) + v35);
LABEL_62:
            UniChar chars = v39;
            if (v39 == 92)
            {
              uint64_t v40 = v21 + 1;
              if (v17 > v40)
              {
                int64_t v41 = v114;
                if ((uint64_t)v114 <= v40)
                {
                  UniChar v44 = 0;
                }
                else
                {
                  v42 = (UniChar *)v112[1];
                  if (v112[1])
                  {
                    uint64_t v43 = *((void *)&v113 + 1) + v40;
                    goto LABEL_67;
                  }
                  if ((void)v113)
                  {
                    UniChar v44 = *(char *)(v113 + *((void *)&v113 + 1) + v40);
                  }
                  else
                  {
                    if (v115 <= v40 || (uint64_t v51 = *((void *)&v114 + 1), *((uint64_t *)&v114 + 1) > v40))
                    {
                      uint64_t v52 = v40 - 4;
                      if (v40 < 4) {
                        uint64_t v52 = 0;
                      }
                      if (v52 + 64 < (uint64_t)v114) {
                        int64_t v41 = v52 + 64;
                      }
                      *((void *)&v114 + 1) = v52;
                      int64_t v115 = v41;
                      v129.NSUInteger location = *((void *)&v113 + 1) + v52;
                      v129.size_t length = v41 - v52;
                      CFStringGetCharacters(v112[0], v129, buffer);
                      uint64_t v51 = *((void *)&v114 + 1);
                    }
                    uint64_t v43 = v40 - v51;
                    v42 = buffer;
LABEL_67:
                    UniChar v44 = v42[v43];
                  }
                }
                UniChar chars = v44;
                ++v21;
              }
            }
            else if (v39 == 34 && v34 == 0)
            {
              int v34 = 0;
              v33 ^= 1u;
            }
            else
            {
              if (!((v39 != 40) | v33 & 1))
              {
                if (v34 < 1) {
                  [(__CFString *)Mutable dataUsingEncoding:4 allowLossyConversion:0];
                }
                else {
                v50 = [(__CFString *)Mutable mf_encodedHeaderDataWithEncodingHint:0xFFFFFFFFLL];
                }
                [(MFMutableData *)v16 appendData:v50];

                v128.size_t length = CFStringGetLength(Mutable);
                v128.NSUInteger location = 0;
                CFStringDelete(Mutable, v128);
                -[NSMutableData mf_appendCString:](v16, "mf_appendCString:", "(");
                char v33 = 0;
                ++v34;
                goto LABEL_58;
              }
              if (!((v39 != 41) | v33 & 1) && v34 >= 1)
              {
                v46 = [(__CFString *)Mutable mf_encodedHeaderDataWithEncodingHint:0xFFFFFFFFLL];
                [(MFMutableData *)v16 appendData:v46];

                v126.size_t length = CFStringGetLength(Mutable);
                v126.NSUInteger location = 0;
                CFStringDelete(Mutable, v126);
                char v33 = 0;
                --v34;
              }
            }
LABEL_57:
            CFStringAppendCharacters(Mutable, &chars, 1);
LABEL_58:
            uint64_t v35 = ++v21;
            if (v17 <= v21) {
              goto LABEL_104;
            }
          }
          uint64_t v38 = *((void *)&v113 + 1) + v35;
LABEL_55:
          UniChar v39 = v37[v38];
          goto LABEL_62;
        }
        int v34 = 0;
        char v33 = 0;
LABEL_104:
        if (CFStringGetLength(Mutable))
        {
          if (v34 < 1) {
            [(__CFString *)Mutable dataUsingEncoding:4 allowLossyConversion:0];
          }
          else {
          v53 = [(__CFString *)Mutable mf_encodedHeaderDataWithEncodingHint:0xFFFFFFFFLL];
          }
          [(MFMutableData *)v16 appendData:v53];
        }
        if (v33) {
          [(NSMutableData *)v16 mf_appendCString:"\""];
        }
        int v54 = v34 + 1;
        while (--v54 >= 1)
          [(NSMutableData *)v16 mf_appendCString:"]");
        CFRelease(Mutable);

        unint64_t v55 = [(MFMutableData *)v16 length];
        if ([(MFMutableData *)v101 length])
        {
          if (v55 <= v102)
          {
            -[MFMutableData appendBytes:length:](v101, "appendBytes:length:", ", ", 2);
          }
          else
          {
            -[MFMutableData appendBytes:length:](v101, "appendBytes:length:", ",\n ", 3);
            unint64_t v102 = v96;
          }
        }
        [(MFMutableData *)v101 appendData:v16];
        unint64_t v56 = v102 - v55;
        if (v102 < v55) {
          unint64_t v56 = 0;
        }
        unint64_t v102 = v56;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v116 objects:v122 count:16];
    }
    while (v9);
  }

  return v101;
}

- (id)_copyAddressListForKey:(id)a3
{
  id v4 = a3;
  if (self->_preferredEncoding == -1) {
    self->_uint64_t preferredEncoding = [(MFMessageHeaders *)self _contentTypeEncoding];
  }
  uint64_t v8 = 0;
  id v5 = [(MFMessageHeaders *)self _copyHeaderValueForKey:v4 offset:&v8 decoded:0];
  uint64_t v6 = (void *)[(id)objc_opt_class() copyAddressListFromEncodedData:v5 encoding:self->_preferredEncoding];

  return v6;
}

- (id)copyAddressListForSender
{
  return [(MFMessageHeaders *)self _copyAddressListForKey:*MEMORY[0x1E4F606A8]];
}

- (id)firstSenderAddress
{
  id v2 = [(MFMessageHeaders *)self _copyAddressListForKey:*MEMORY[0x1E4F606A8]];
  if ([v2 count])
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)copyAddressListForTo
{
  return [(MFMessageHeaders *)self _copyAddressListForKey:*MEMORY[0x1E4F60740]];
}

- (id)copyAddressListForCc
{
  return [(MFMessageHeaders *)self _copyAddressListForKey:*MEMORY[0x1E4F60660]];
}

- (id)copyAddressListForBcc
{
  return [(MFMessageHeaders *)self _copyAddressListForKey:*MEMORY[0x1E4F60650]];
}

- (id)copyAddressListForResentFrom
{
  return [(MFMessageHeaders *)self _copyAddressListForKey:*MEMORY[0x1E4F60720]];
}

- (id)copyAddressListForReplyTo
{
  return [(MFMessageHeaders *)self _copyAddressListForKey:*MEMORY[0x1E4F60710]];
}

- (id)_commaSeparatedValuesForKey:(id)a3 includeAngleBracket:(BOOL)a4
{
  BOOL v29 = a4;
  id v28 = a3;
  id v5 = [(MFMessageHeaders *)self copyFirstHeaderForKey:v28];
  int64_t v41 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v39 = v6;
  long long v40 = v6;
  long long v37 = v6;
  *(_OWORD *)theString = v6;
  long long v35 = v6;
  long long v36 = v6;
  long long v33 = v6;
  long long v34 = v6;
  long long v31 = v6;
  long long v32 = v6;
  *(_OWORD *)buffer = v6;
  uint64_t v7 = [(__CFString *)v5 length];
  uint64_t v8 = v7;
  if (v7)
  {
    theString[0] = v5;
    *((void *)&v39 + 1) = 0;
    *(void *)&long long v40 = v7;
    theString[1] = (CFStringRef)CFStringGetCharactersPtr(v5);
    if (theString[1]) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    }
    uint64_t v12 = 0;
    unint64_t v10 = 0;
    uint64_t v13 = 0;
    *((void *)&v40 + 1) = 0;
    int64_t v41 = 0;
    uint64_t v14 = 64;
    *(void *)&long long v39 = CStringPtr;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if ((unint64_t)v13 >= 4) {
        uint64_t v16 = 4;
      }
      else {
        uint64_t v16 = v13;
      }
      if (v13 < 0 || (uint64_t v17 = v40, (uint64_t)v40 <= v13))
      {
        UniChar v18 = 0;
      }
      else if (theString[1])
      {
        UniChar v18 = *((_WORD *)&theString[1]->isa + v13 + *((void *)&v39 + 1));
      }
      else if ((void)v39)
      {
        UniChar v18 = *(char *)(v39 + *((void *)&v39 + 1) + v13);
      }
      else
      {
        if (v41 <= v13 || (uint64_t v22 = *((void *)&v40 + 1), *((uint64_t *)&v40 + 1) > v13))
        {
          uint64_t v23 = -v16;
          uint64_t v24 = v16 + v12;
          uint64_t v25 = v14 - v16;
          uint64_t v26 = v13 + v23;
          int64_t v27 = v26 + 64;
          if (v26 + 64 >= (uint64_t)v40) {
            int64_t v27 = v40;
          }
          *((void *)&v40 + 1) = v26;
          int64_t v41 = v27;
          if ((uint64_t)v40 >= v25) {
            uint64_t v17 = v25;
          }
          v43.size_t length = v17 + v24;
          v43.NSUInteger location = v26 + *((void *)&v39 + 1);
          CFStringGetCharacters(theString[0], v43, buffer);
          uint64_t v22 = *((void *)&v40 + 1);
        }
        UniChar v18 = buffer[v13 - v22];
      }
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v18 == 60) {
          uint64_t v15 = v13;
        }
        else {
          uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
        }
        goto LABEL_29;
      }
      if (v18 == 62) {
        break;
      }
LABEL_29:
      ++v13;
      --v12;
      ++v14;
      if (v8 == v13) {
        goto LABEL_5;
      }
    }
    if (v29)
    {
      uint64_t v19 = v13 - v15 + 1;
      if (!v10) {
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v20 = ~v15++;
      uint64_t v19 = v20 + v13;
      if (!v10)
      {
LABEL_27:
        unint64_t v10 = [MEMORY[0x1E4F1CA48] array];
      }
    }
    unsigned int v21 = -[__CFString substringWithRange:](v5, "substringWithRange:", v15, v19);
    [v10 addObject:v21];

    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_29;
  }
  unint64_t v10 = 0;
LABEL_5:

  return v10;
}

- (id)references
{
  return [(MFMessageHeaders *)self _commaSeparatedValuesForKey:*MEMORY[0x1E4F60700] includeAngleBracket:1];
}

- (NSArray)listUnsubscribeCommands
{
  return (NSArray *)[(MFMessageHeaders *)self _commaSeparatedValuesForKey:*MEMORY[0x1E4F606D8] includeAngleBracket:0];
}

- (NSString)listUnsubscribePostContent
{
  return (NSString *)[(MFMessageHeaders *)self firstHeaderForKey:*MEMORY[0x1E4F606E0]];
}

- (id)firstAddressForKey:(id)a3
{
  id v3 = [(MFMessageHeaders *)self firstHeaderForKey:a3];
  return v3;
}

- (id)copyFirstHeaderForKey:(id)a3
{
  uint64_t v4 = 0;
  return [(MFMessageHeaders *)self _copyHeaderValueForKey:a3 offset:&v4 decoded:1];
}

- (id)copyFirstStringValueForKey:(id)a3
{
  id v4 = [(MFMessageHeaders *)self copyFirstHeaderForKey:a3];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_msgSend([NSString alloc], "initWithData:encoding:", v4, -[MFMessageHeaders preferredEncoding](self, "preferredEncoding"));
  }
  return v5;
}

- (id)_decodeHeaderKeysFromData:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MFMessageHeaders__decodeHeaderKeysFromData___block_invoke;
  v7[3] = &unk_1E5F89808;
  id v5 = v4;
  id v8 = v5;
  [(MFMessageHeaders *)self enumerateKeysAndBytesUsingBlock:v7];

  return v5;
}

void __46__MFMessageHeaders__decodeHeaderKeysFromData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 lowercaseString];
  objc_msgSend(v2, "addObject:");
}

- (NSData)encodedHeaders
{
  return self->_data;
}

- (void)appendHeaderData:(id)a3 andRecipients:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v57 = a4;
  uint64_t v49 = [(MFMessageHeaders *)self allHeaderKeys];
  unint64_t v50 = [v49 count];
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (v50)
  {
    uint64_t v6 = 0;
    unsigned int v52 = 0;
    uint64_t v48 = *MEMORY[0x1E4F60650];
    uint64_t v47 = *MEMORY[0x1E4F60740];
    uint64_t v42 = *MEMORY[0x1E4F60660];
    uint64_t v46 = *MEMORY[0x1E4F60730];
    uint64_t v41 = *MEMORY[0x1E4F60718];
    uint64_t v40 = *MEMORY[0x1E4F606A8];
    uint64_t v38 = *MEMORY[0x1E4F60720];
    uint64_t v37 = *MEMORY[0x1E4F60710];
    v53 = self;
    while (1)
    {
      uint64_t v7 = [v49 objectAtIndex:v6];
      int v8 = [v7 isEqualToString:v48];
      int v9 = ([v7 isEqualToString:v47] & 1) != 0 ? 1 : objc_msgSend(v7, "isEqualToString:", v42);
      if ([v7 isEqualToString:v46]) {
        break;
      }
      int v10 = [v7 isEqualToString:v41];
      if ((v8 | v9 | v10)) {
        goto LABEL_12;
      }
      if ([v7 isEqualToString:v40] & 1) != 0 || (objc_msgSend(v7, "isEqualToString:", v38))
      {
        int v10 = 0;
LABEL_12:
        int v54 = 1;
        if ((v8 & 1) == 0) {
          goto LABEL_13;
        }
        goto LABEL_14;
      }
      int v54 = [v7 isEqualToString:v37];
      int v10 = 0;
      if ((v8 & 1) == 0)
      {
LABEL_13:
        if ([v7 isEqualToString:@"from "]) {
          goto LABEL_41;
        }
      }
LABEL_14:
      id v55 = [(MFMessageHeaders *)self _capitalizedKeyForKey:v7];
      uint64_t v51 = v7;
      uint64_t v11 = [(MFMessageHeaders *)self headersForKey:v7];
      uint64_t v12 = [v11 count];
      if (v12)
      {
        uint64_t v13 = 0;
        int v14 = v9 | v10 | v8;
        id v15 = v44;
        if (!v10) {
          id v15 = v45;
        }
        if (v9) {
          uint64_t v16 = v43;
        }
        else {
          uint64_t v16 = v15;
        }
        while (1)
        {
          uint64_t v17 = [v11 objectAtIndex:v13];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v22 = v17;
            uint64_t v20 = v22;
            if (v54) {
              __assert_rtn("-[MFMessageHeaders appendHeaderData:andRecipients:]", "MessageHeaders.m", 1046, "0 && \"We have already decoded this, so we can't actually grab the address here.\"");
            }
            if (v22) {
              char v23 = v8;
            }
            else {
              char v23 = 1;
            }
            if (v23)
            {
              id v18 = 0;
            }
            else
            {
              objc_msgSend(v22, "mf_encodedHeaderDataWithEncodingHint:", 0xFFFFFFFFLL);
              id v18 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_33:

LABEL_34:
            if (v18) {
              char v24 = v8;
            }
            else {
              char v24 = 1;
            }
            if ((v24 & 1) == 0)
            {
              objc_msgSend(v56, "mf_appendCString:", objc_msgSend(v55, "ef_lossyDefaultCStringBytes"));
              [v56 appendBytes:": " length:2];
              [v56 appendData:v18];
              [v56 appendBytes:"\n" length:1];
            }
            goto LABEL_39;
          }
          id v18 = 0;
LABEL_39:

          if (v12 == ++v13) {
            goto LABEL_40;
          }
        }
        id v18 = v17;
        if (v14)
        {
          id v19 = v16;
          if (v16)
          {
            uint64_t v20 = v19;
            unsigned int v21 = (void *)[(id)objc_opt_class() copyAddressListFromEncodedData:v18 encoding:134217984];
            [v20 addObjectsFromArray:v21];

            goto LABEL_33;
          }
        }
        goto LABEL_34;
      }
LABEL_40:

      uint64_t v7 = v51;
      self = v53;
LABEL_41:

      uint64_t v6 = ++v52;
      if (v50 <= v52) {
        goto LABEL_45;
      }
    }
    int v10 = 1;
    goto LABEL_12;
  }
LABEL_45:
  [v56 appendBytes:"\n" length:1];
  if ([v44 count])
  {
    uint64_t v25 = [v44 allObjects];
    [v39 addObjectsFromArray:v25];
  }
  else
  {
    if (![v43 count]) {
      goto LABEL_50;
    }
    uint64_t v25 = [v43 allObjects];
    [v39 addObjectsFromArray:v25];
  }

LABEL_50:
  if ([v45 count])
  {
    uint64_t v26 = [v45 allObjects];
    [v39 addObjectsFromArray:v26];
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v27 = v39;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v59 != v29) {
          objc_enumerationMutation(v27);
        }
        id v31 = *(id *)(*((void *)&v58 + 1) + 8 * i);
        long long v32 = [v31 emailAddressValue];
        long long v33 = [v32 simpleAddress];
        long long v34 = v33;
        if (v33)
        {
          id v35 = v33;
        }
        else
        {
          id v35 = [v31 stringValue];
        }
        long long v36 = v35;

        [v57 addObject:v36];
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v28);
  }
}

+ (id)uniqueHeaderKeyStringForString:(id)a3
{
  id v3 = a3;
  id v4 = (void *)*MEMORY[0x1E4F606A8];
  if (![v3 caseInsensitiveCompare:*MEMORY[0x1E4F606A8]]
    || (id v4 = (void *)*MEMORY[0x1E4F60738], v5 = v3, ![v3 caseInsensitiveCompare:*MEMORY[0x1E4F60738]]))
  {
    id v5 = v4;
  }
  return v5;
}

- (id)messageIDListForKey:(id)a3
{
  id v3 = [(MFMessageHeaders *)self headersForKey:a3];
  return v3;
}

- (id)firstMessageIDForKey:(id)a3
{
  id v3 = [(MFMessageHeaders *)self firstHeaderForKey:a3];
  return v3;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> %s\n", objc_opt_class(), self, -[NSData bytes](self->_data, "bytes")];
}

- (NSData)data
{
  return self->_data;
}

- (void)copyDecodedStringFromHeaderData:(uint64_t)a3 withRange:(os_log_t)log .cold.1(char a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a1 & 1;
  _os_log_fault_impl(&dword_1AFB03000, log, OS_LOG_TYPE_FAULT, "MFMessageHeaders::copyDecodedStringFromHeaderData invalid data, [data:%p] [data.isNSData:%i]", buf, 0x12u);
}

@end