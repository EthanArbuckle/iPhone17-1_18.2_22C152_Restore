@interface AVAirMessage
+ (BOOL)isAirMessagingEnabled;
+ (id)_decompressBodyData:(id)a3 forCompressionAlgorithm:(id)a4;
+ (id)_nameForDataCompressionAlgorithm:(int64_t)a3;
+ (id)buildVersion;
+ (id)commonDictionaryRepresentationKeys;
+ (id)currentAppIdentifier;
+ (id)currentOSIdentifier;
+ (id)dictionaryRepresentationCommon;
+ (id)messageWithExternalMetadata:(id)a3 itemIdentifier:(id)a4;
+ (id)messageWithParts:(id)a3;
+ (id)messageWithPosterArtworkMetadata:(id)a3 itemIdentifier:(id)a4;
+ (id)messageWithRequiresLinearPlayback:(BOOL)a3 itemIdentifier:(id)a4;
+ (id)messageWithUserScrubToAssetTime:(double)a3 itemIdentifier:(id)a4;
- (AVAirMessage)initWithMessageType:(unsigned int)a3 itemIdentifier:(id)a4;
- (AVAirMessage)initWithMessageType:(unsigned int)a3 itemIdentifier:(id)a4 dictionaryRepresentation:(id)a5;
- (BOOL)shouldUseJSONForBody;
- (NSArray)array;
- (NSData)jsonDataRepresentation;
- (NSData)rawData;
- (NSDictionary)dictionary;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)initialRepresentation;
- (NSString)MIMEType;
- (NSString)extendedLanguageTag;
- (NSString)itemIdentifier;
- (NSValue)value;
- (id)allRecognizedKeysForDictionaryRepresentation;
- (id)description;
- (id)headerTextRepresenationForBodyDataLength:(unint64_t)a3 extraHeaders:(id)a4;
- (id)messageDataRepresentation;
- (id)number;
- (unsigned)type;
- (void)setArray:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setExtendedLanguageTag:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setMIMEType:(id)a3;
- (void)setRawData:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation AVAirMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialRepresentation, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_extendedLanguageTag, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (NSDictionary)initialRepresentation
{
  return self->_initialRepresentation;
}

- (void)setDictionary:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setArray:(id)a3
{
}

- (NSArray)array
{
  return self->_array;
}

- (void)setRawData:(id)a3
{
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setValue:(id)a3
{
}

- (NSValue)value
{
  return self->_value;
}

- (void)setExtendedLanguageTag:(id)a3
{
}

- (NSString)extendedLanguageTag
{
  return self->_extendedLanguageTag;
}

- (void)setMIMEType:(id)a3
{
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (unsigned)type
{
  return self->_type;
}

- (id)number
{
  v3 = [(AVAirMessage *)self value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(AVAirMessage *)self value];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)messageDataRepresentation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(AVAirMessage *)self shouldUseJSONForBody])
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = [(AVAirMessage *)self MIMEType];
    v5 = (void *)v4;
    v6 = @"application/octet-stream";
    if (v4) {
      v6 = (__CFString *)v4;
    }
    v3 = v6;
  }
  if ([(AVAirMessage *)self shouldUseJSONForBody]) {
    [(AVAirMessage *)self jsonDataRepresentation];
  }
  else {
  v7 = [(AVAirMessage *)self rawData];
  }
  v8 = +[AVAirMessage _nameForDataCompressionAlgorithm:0];
  if (v8)
  {
    id v25 = 0;
    v9 = [(__CFString *)v7 compressedDataUsingAlgorithm:0 error:&v25];
    id v10 = v25;
    if (v9)
    {
      v11 = v9;
      v12 = v7;
      v7 = v11;
    }
    else
    {
      v13 = _avairlog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v29 = "-[AVAirMessage messageDataRepresentation]";
        __int16 v30 = 2048;
        uint64_t v31 = 0;
        __int16 v32 = 2114;
        v33 = v8;
        __int16 v34 = 2114;
        id v35 = v10;
        _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%s failed to compress data (%ld/%{public}@): %{public}@", buf, 0x2Au);
      }

      v12 = v8;
      v8 = 0;
    }
  }
  uint64_t v14 = [(__CFString *)v7 length];
  if (v8) {
    v15 = v8;
  }
  else {
    v15 = &stru_1F09185C8;
  }
  v27[0] = v15;
  v26[0] = @"compression";
  v26[1] = @"languagetag";
  uint64_t v16 = [(AVAirMessage *)self extendedLanguageTag];
  v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = &stru_1F09185C8;
  }
  v26[2] = @"mimetype";
  if (v3) {
    v19 = v3;
  }
  else {
    v19 = &stru_1F09185C8;
  }
  v27[1] = v18;
  v27[2] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  v21 = [(AVAirMessage *)self headerTextRepresenationForBodyDataLength:v14 extraHeaders:v20];

  v22 = [v21 dataUsingEncoding:4 allowLossyConversion:1];
  v23 = (void *)[v22 mutableCopy];

  [v23 appendData:v7];

  return v23;
}

- (BOOL)shouldUseJSONForBody
{
  v3 = [(AVAirMessage *)self rawData];
  if (v3)
  {
    uint64_t v4 = [(AVAirMessage *)self array];
    if (v4)
    {
      BOOL v5 = 1;
    }
    else
    {
      v6 = [(AVAirMessage *)self dictionary];
      if (v6)
      {
        BOOL v5 = 1;
      }
      else
      {
        v7 = [(AVAirMessage *)self value];
        BOOL v5 = v7 != 0;
      }
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)headerTextRepresenationForBodyDataLength:(unint64_t)a3 extraHeaders:(id)a4
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:@"AVKitAir/1"];
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v38[0] = @"length";
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  id v10 = [v9 stringValue];
  v39[0] = v10;
  v38[1] = @"messagetype";
  v11 = v6;
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[AVAirMessage type](self, "type"));
  v13 = [v12 stringValue];
  v39[1] = v13;
  v38[2] = @"item";
  uint64_t v14 = [(AVAirMessage *)self itemIdentifier];
  v15 = (void *)v14;
  uint64_t v16 = @"nil";
  if (v14) {
    uint64_t v16 = (__CFString *)v14;
  }
  v39[2] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
  v18 = (void *)[v8 initWithDictionary:v17];

  if ([v11 count])
  {
    v19 = [v11 airMessageCanonicalForm];
    [v18 addEntriesFromDictionary:v19];
  }
  __int16 v32 = v11;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        v26 = NSString;
        v27 = [v20 objectForKeyedSubscript:v25];
        v28 = [v26 stringWithFormat:@"%@:%@", v25, v27];
        [v7 addObject:v28];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v22);
  }

  v29 = [v7 componentsJoinedByString:@"\n"];
  __int16 v30 = [v29 stringByAppendingString:@"\n\n"];

  return v30;
}

- (NSData)jsonDataRepresentation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(AVAirMessage *)self dictionaryRepresentation];
  if (v3)
  {
    id v8 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v8];
    id v5 = v8;
    if (!v4)
    {
      id v6 = _avairlog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v10 = "-[AVAirMessage jsonDataRepresentation]";
        __int16 v11 = 2114;
        v12 = self;
        __int16 v13 = 2114;
        id v14 = v5;
        _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s failed to serialize %{public}@ to JSON (%{public}@)", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSData *)v4;
}

- (id)description
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(AVAirMessage *)self dictionaryRepresentation];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [v4 allKeys];
  id v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        __int16 v11 = *(__CFString **)(*((void *)&v21 + 1) + 8 * i);
        v12 = NSString;
        if ([(__CFString *)v11 length]) {
          __int16 v13 = v11;
        }
        else {
          __int16 v13 = @"''";
        }
        id v14 = [v4 objectForKeyedSubscript:v11];
        uint64_t v15 = [v12 stringWithFormat:@" %@: %@", v13, v14];
        [v3 addObject:v15];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  uint64_t v16 = NSString;
  v17 = [v3 componentsJoinedByString:@",\n"];
  v18 = [v16 stringWithFormat:@"{\n%@\n}", v17];

  return v18;
}

- (id)allRecognizedKeysForDictionaryRepresentation
{
  v2 = +[AVAirMessage commonDictionaryRepresentationKeys];
  v3 = [v2 arrayByAddingObjectsFromArray:&unk_1F094A2F8];

  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [(id)objc_opt_class() dictionaryRepresentationCommon];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[AVAirMessage type](self, "type"));
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  id v5 = [(AVAirMessage *)self itemIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"item"];

  id v6 = [(AVAirMessage *)self value];
  [v3 setObject:v6 forKeyedSubscript:@"v"];

  uint64_t v7 = [(AVAirMessage *)self array];

  if (v7)
  {
    uint64_t v8 = [(AVAirMessage *)self array];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      [v3 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:@"a"];
      goto LABEL_9;
    }
    id v10 = [(AVAirMessage *)self array];
    uint64_t v11 = [v10 objectAtIndexedSubscript:0];
    v12 = objc_opt_class();

    LOBYTE(v11) = objc_opt_respondsToSelector();
    __int16 v13 = [(AVAirMessage *)self array];
    id v14 = v13;
    if (v11)
    {
      uint64_t v15 = [v12 airRepresentationForArray:v13];
      [v3 setObject:v15 forKeyedSubscript:@"a"];
    }
    else
    {
      uint64_t v16 = [v13 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_9;
      }
      id v14 = [(AVAirMessage *)self array];
      [v3 setObject:v14 forKeyedSubscript:@"a"];
    }
  }
LABEL_9:
  v18 = [(AVAirMessage *)self dictionary];
  [v3 setObject:v18 forKeyedSubscript:@"d"];

  v19 = [(AVAirMessage *)self rawData];

  if (v19)
  {
    id v20 = [(AVAirMessage *)self rawData];
    long long v21 = [v20 base64EncodedStringWithOptions:32];

    [v3 setObject:v21 forKeyedSubscript:@"raw"];
  }

  return (NSDictionary *)v3;
}

- (AVAirMessage)initWithMessageType:(unsigned int)a3 itemIdentifier:(id)a4 dictionaryRepresentation:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v62.receiver = self;
  v62.super_class = (Class)AVAirMessage;
  id v10 = [(AVAirMessage *)&v62 init];
  uint64_t v11 = v10;
  if (!v10)
  {
LABEL_61:
    v51 = v11;
    goto LABEL_62;
  }
  if (v6 == 999)
  {
    v12 = [v9 objectForKeyedSubscript:@"type"];
    if (objc_opt_respondsToSelector())
    {
      __int16 v13 = [v9 objectForKeyedSubscript:@"type"];
      v11->_type = [v13 integerValue];
      p_type = &v11->_type;
    }
    else
    {
      v11->_type = 999;
      p_type = &v11->_type;
    }

    uint64_t v6 = *p_type;
  }
  else
  {
    v10->_type = v6;
    p_type = &v10->_type;
  }
  if ((int)v6 <= 299)
  {
    if (v6 != 100 && v6 != 200 && v6 != 210) {
      goto LABEL_63;
    }
    goto LABEL_19;
  }
  if ((int)v6 > 499)
  {
    if (v6 != 500 && v6 != 999) {
      goto LABEL_63;
    }
LABEL_19:
    if (v8)
    {
      int v15 = 0;
      uint64_t v16 = v8;
    }
    else
    {
      uint64_t v6 = [v9 objectForKeyedSubscript:@"item"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = [v9 objectForKeyedSubscript:@"item"];
        int v15 = 1;
      }
      else
      {
        int v15 = 0;
        uint64_t v16 = 0;
      }
    }
    uint64_t v17 = [v16 copy];
    itemIdentifier = v11->_itemIdentifier;
    v11->_itemIdentifier = (NSString *)v17;

    if (v15) {
    if (!v8)
    }

    v19 = [v9 objectForKeyedSubscript:@"v"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      long long v21 = [v9 objectForKeyedSubscript:@"v"];
    }
    else
    {
      long long v21 = 0;
    }
    uint64_t v22 = [v21 copy];
    value = v11->_value;
    v11->_value = (NSValue *)v22;

    if (isKindOfClass) {
    long long v24 = [v9 objectForKeyedSubscript:@"a"];
    }
    objc_opt_class();
    char v25 = objc_opt_isKindOfClass();
    if (v25)
    {
      uint64_t v26 = [v9 objectForKeyedSubscript:@"a"];
    }
    else
    {
      uint64_t v26 = 0;
    }
    uint64_t v27 = [v26 copy];
    array = v11->_array;
    v11->_array = (NSArray *)v27;

    if (v25) {
    v29 = [v9 objectForKeyedSubscript:@"d"];
    }
    objc_opt_class();
    char v30 = objc_opt_isKindOfClass();
    if (v30)
    {
      uint64_t v31 = [v9 objectForKeyedSubscript:@"d"];
    }
    else
    {
      uint64_t v31 = 0;
    }
    uint64_t v32 = [v31 copy];
    dictionary = v11->_dictionary;
    v11->_dictionary = (NSDictionary *)v32;

    if (v30) {
    id v34 = [v9 objectForKeyedSubscript:@"raw"];
    }
    objc_opt_class();
    id v57 = v8;
    if (objc_opt_isKindOfClass())
    {
      long long v35 = (NSData *)v34;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v36 = 0;
        goto LABEL_49;
      }
      long long v35 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v34 options:0];
    }
    long long v36 = v35;
LABEL_49:

    rawData = v11->_rawData;
    v11->_rawData = v36;

    v38 = (void *)[v9 mutableCopy];
    v39 = (void *)MEMORY[0x1E4F1CAD0];
    v55 = v11;
    v40 = [(AVAirMessage *)v11 allRecognizedKeysForDictionaryRepresentation];
    v41 = [v39 setWithArray:v40];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v56 = v9;
    v42 = [v9 allKeys];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v59 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          if (([v41 containsObject:v47] & 1) == 0)
          {
            v48 = _avairlog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v64 = "-[AVAirMessage initWithMessageType:itemIdentifier:dictionaryRepresentation:]";
              __int16 v65 = 2114;
              uint64_t v66 = v47;
              _os_log_impl(&dword_1B05B7000, v48, OS_LOG_TYPE_DEFAULT, "%s removing unrecognized key '%{public}@'", buf, 0x16u);
            }

            [v38 setObject:0 forKeyedSubscript:v47];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }
      while (v44);
    }

    uint64_t v49 = [v38 copy];
    uint64_t v11 = v55;
    initialRepresentation = v55->_initialRepresentation;
    v55->_initialRepresentation = (NSDictionary *)v49;

    id v9 = v56;
    id v8 = v57;
    goto LABEL_61;
  }
  if (v6 == 300 || v6 == 400) {
    goto LABEL_19;
  }
LABEL_63:
  v53 = _avairlog();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v54 = *p_type;
    *(_DWORD *)buf = 136315394;
    v64 = "-[AVAirMessage initWithMessageType:itemIdentifier:dictionaryRepresentation:]";
    __int16 v65 = 1024;
    LODWORD(v66) = v54;
    _os_log_impl(&dword_1B05B7000, v53, OS_LOG_TYPE_DEFAULT, "%s incoming message type %d is unrecognized!", buf, 0x12u);
  }

  v51 = 0;
LABEL_62:

  return v51;
}

- (AVAirMessage)initWithMessageType:(unsigned int)a3 itemIdentifier:(id)a4
{
  id v6 = a4;
  if (+[AVAirMessage isAirMessagingEnabled])
  {
    v13.receiver = self;
    v13.super_class = (Class)AVAirMessage;
    uint64_t v7 = [(AVAirMessage *)&v13 init];
    id v8 = v7;
    if (v7)
    {
      v7->_type = a3;
      uint64_t v9 = [v6 copy];
      itemIdentifier = v8->_itemIdentifier;
      v8->_itemIdentifier = (NSString *)v9;
    }
    self = v8;
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)messageWithParts:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 expectedBodyLength] < 0
    || ([v3 isIncomplete] & 1) != 0
    || ([v3 uncompressedBodyData], uint64_t v4 = objc_claimAutoreleasedReturnValue(),
                                                  v4,
                                                  !v4))
  {
    uint64_t v9 = 0;
    goto LABEL_7;
  }
  id v5 = [v3 bodyAsJSONDictionary];
  id v6 = [v3 uncompressedBodyData];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v3 rawBodyData];
  }
  uint64_t v11 = v8;

  v12 = [v3 rawBodyData];
  uint64_t v13 = [v12 length];

  if (v13 && !v5 && !v11)
  {
    id v14 = _avairlog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315138;
      v28 = "+[AVAirMessage messageWithParts:]";
      _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, "%s error: json deserialization failed", (uint8_t *)&v27, 0xCu);
    }

    uint64_t v9 = 0;
    goto LABEL_26;
  }
  int v15 = [v3 uniqueHeaders];
  uint64_t v16 = [v15 objectForKeyedSubscript:@"messagetype"];
  unsigned int v17 = [v16 intValue];

  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 999;
  }
  v19 = [v3 uniqueHeaders];
  id v20 = [v19 objectForKeyedSubscript:@"item"];

  long long v21 = [v3 uniqueHeaders];
  uint64_t v22 = [v21 objectForKeyedSubscript:@"response-status"];

  if (v22)
  {
    uint64_t v23 = +[AVAirMessageResponse responseWithParts:v3];
  }
  else
  {
    long long v24 = [AVAirMessage alloc];
    if (!v5)
    {
      uint64_t v9 = [(AVAirMessage *)v24 initWithMessageType:v18 itemIdentifier:v20];
      [(AVAirMessage *)v9 setRawData:v11];
      char v25 = [v3 uniqueHeaders];
      uint64_t v26 = [v25 objectForKeyedSubscript:@"mimetype"];
      [(AVAirMessage *)v9 setMIMEType:v26];

      goto LABEL_25;
    }
    uint64_t v23 = [(AVAirMessage *)v24 initWithMessageType:v18 itemIdentifier:v20 dictionaryRepresentation:v5];
  }
  uint64_t v9 = (AVAirMessage *)v23;
LABEL_25:

LABEL_26:
LABEL_7:

  return v9;
}

+ (id)messageWithPosterArtworkMetadata:(id)a3 itemIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithMessageType:210 itemIdentifier:v6];

  uint64_t v9 = [v7 dataValue];
  [v8 setRawData:v9];

  id v10 = [v7 extendedLanguageTag];

  [v8 setExtendedLanguageTag:v10];

  return v8;
}

+ (id)messageWithExternalMetadata:(id)a3 itemIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithMessageType:200 itemIdentifier:v6];

  [v8 setArray:v7];

  return v8;
}

+ (id)messageWithUserScrubToAssetTime:(double)a3 itemIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithMessageType:500 itemIdentifier:v6];

  id v8 = [NSNumber numberWithDouble:a3];
  [v7 setValue:v8];

  return v7;
}

+ (id)messageWithRequiresLinearPlayback:(BOOL)a3 itemIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithMessageType:100 itemIdentifier:v6];

  id v8 = [NSNumber numberWithBool:v4];
  [v7 setValue:v8];

  return v7;
}

+ (id)_nameForDataCompressionAlgorithm:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 < 4) {
    return off_1E5FC2D00[a3];
  }
  if (a3 < 0) {
    return @"none";
  }
  id v5 = _avairlog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "+[AVAirMessage _nameForDataCompressionAlgorithm:]";
    __int16 v8 = 2048;
    int64_t v9 = a3;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s This code has not been updated to handle algorithm %ld!", (uint8_t *)&v6, 0x16u);
  }

  return 0;
}

+ (id)_decompressBodyData:(id)a3 forCompressionAlgorithm:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 lowercaseString];
  if (![v6 length] || (objc_msgSend(v7, "isEqualToString:", @"none") & 1) == 0)
  {
    id v9 = v5;
    goto LABEL_17;
  }
  if ([v7 isEqualToString:@"lzfse"])
  {
    uint64_t v8 = 0;
LABEL_12:
    id v14 = 0;
    id v9 = [v5 decompressedDataUsingAlgorithm:v8 error:&v14];
    id v10 = v14;
    if (!v9)
    {
      uint64_t v11 = _avairlog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = "+[AVAirMessage _decompressBodyData:forCompressionAlgorithm:]";
        __int16 v17 = 2114;
        id v18 = v6;
        __int16 v19 = 2114;
        id v20 = v10;
        _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s failed to decompress data (%{public}@ algorithm): %{public}@", buf, 0x20u);
      }
    }
    goto LABEL_17;
  }
  if ([v7 isEqualToString:@"lz4"])
  {
    uint64_t v8 = 1;
    goto LABEL_12;
  }
  if ([v7 isEqualToString:@"zlib"])
  {
    uint64_t v8 = 3;
    goto LABEL_12;
  }
  if ([v7 isEqualToString:@"lzma"])
  {
    uint64_t v8 = 2;
    goto LABEL_12;
  }
  uint64_t v13 = _avairlog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "+[AVAirMessage _decompressBodyData:forCompressionAlgorithm:]";
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%s failed to decompress data; algorithm name '%{public}@' is not recognized",
      buf,
      0x16u);
  }

  id v9 = 0;
LABEL_17:

  return v9;
}

+ (BOOL)isAirMessagingEnabled
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.avkit"];
  id v3 = [v2 objectForKey:@"airmessaging"];
  BOOL v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = [v4 objectForKey:@"airmessaging"];

  id v6 = [MEMORY[0x1E4F28F80] processInfo];
  id v7 = [v6 environment];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"airmessaging"];

  if (v3)
  {
    int v9 = [v3 BOOLValue];
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v9 = 0;
  if (v5) {
LABEL_3:
  }
    int v9 = [v5 BOOLValue];
LABEL_4:
  if (v8) {
    char v10 = [v8 BOOLValue];
  }
  else {
    char v10 = v9 != 0;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__AVAirMessage_isAirMessagingEnabled__block_invoke;
  v16[3] = &unk_1E5FC2CE0;
  char v20 = v10;
  id v17 = v3;
  id v18 = v5;
  id v19 = v8;
  uint64_t v11 = isAirMessagingEnabled_onceToken;
  id v12 = v8;
  id v13 = v5;
  id v14 = v3;
  if (v11 != -1) {
    dispatch_once(&isAirMessagingEnabled_onceToken, v16);
  }

  return v10;
}

void __37__AVAirMessage_isAirMessagingEnabled__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = _avairlog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = @"YES";
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (!*(unsigned char *)(a1 + 56)) {
      id v3 = @"NO";
    }
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 136316162;
    uint64_t v8 = "+[AVAirMessage isAirMessagingEnabled]_block_invoke";
    __int16 v9 = 2112;
    char v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2114;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1B05B7000, v2, OS_LOG_TYPE_DEFAULT, "%s isAirMessageEnabled %@; global %@; app %@; environ %{public}@",
      (uint8_t *)&v7,
      0x34u);
  }
}

+ (id)commonDictionaryRepresentationKeys
{
  if (commonDictionaryRepresentationKeys_onceToken != -1) {
    dispatch_once(&commonDictionaryRepresentationKeys_onceToken, &__block_literal_global_56);
  }
  v2 = (void *)commonDictionaryRepresentationKeys__keys;

  return v2;
}

void __50__AVAirMessage_commonDictionaryRepresentationKeys__block_invoke()
{
  id v2 = +[AVAirMessage dictionaryRepresentationCommon];
  uint64_t v0 = [v2 allKeys];
  v1 = (void *)commonDictionaryRepresentationKeys__keys;
  commonDictionaryRepresentationKeys__keys = v0;
}

+ (id)dictionaryRepresentationCommon
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:@"com.apple.avkit" forKeyedSubscript:@"sender"];
  id v3 = [(id)objc_opt_class() currentOSIdentifier];
  [v2 setObject:v3 forKeyedSubscript:@"os"];

  uint64_t v4 = [(id)objc_opt_class() buildVersion];
  [v2 setObject:v4 forKeyedSubscript:@"build"];

  uint64_t v5 = [(id)objc_opt_class() currentAppIdentifier];
  [v2 setObject:v5 forKeyedSubscript:@"app"];

  return v2;
}

+ (id)buildVersion
{
  if (buildVersion_onceToken != -1) {
    dispatch_once(&buildVersion_onceToken, &__block_literal_global_9345);
  }
  id v2 = (void *)buildVersion__build;

  return v2;
}

void __28__AVAirMessage_buildVersion__block_invoke()
{
  size_t size = 0;
  if (sysctlbyname("kern.osversion", 0, &size, 0, 0)) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = size == 0;
  }
  if (!v0)
  {
    v1 = malloc_type_malloc(size, 0x100004077774924uLL);
    sysctlbyname("kern.osversion", v1, &size, 0, 0);
    uint64_t v2 = [NSString stringWithUTF8String:v1];
    id v3 = (void *)buildVersion__build;
    buildVersion__build = v2;

    free(v1);
  }
}

+ (id)currentAppIdentifier
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

+ (id)currentOSIdentifier
{
  return @"iOS";
}

@end