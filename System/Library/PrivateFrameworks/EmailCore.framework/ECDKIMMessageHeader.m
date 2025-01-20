@interface ECDKIMMessageHeader
- (BOOL)_isValidDomain:(id)a3;
- (ECDKIMMessageHeader)initWithHeaderFieldName:(id)a3 headerBody:(id)a4 error:(id *)a5;
- (NSArray)copiedHeaderFields;
- (NSArray)queryMethods;
- (NSArray)signedHeaderFields;
- (NSData)signatureData;
- (NSNumber)bodyLength;
- (NSString)agentOrUserIdentifier;
- (NSString)bodyForCanonicalization;
- (NSString)canonicalizedBodyHash;
- (NSString)headerNameForCanonicalization;
- (NSString)selector;
- (NSString)signingDomainIdentifier;
- (NSString)version;
- (double)signatureExpiration;
- (double)signatureTimestamp;
- (id)_errorForInvalidOptionalKey:(id)a3 actualValue:(id)a4 expectedValue:(id)a5;
- (id)_errorForInvalidRequiredKey:(id)a3 actualValue:(id)a4 expectedValue:(id)a5;
- (id)_errorForMissingRequiredKey:(id)a3;
- (id)_parseAgentOrUserIdentifierWithSigningDomainIdentifier:(id)a3;
- (id)_parseBodyLength;
- (id)_parseCanonicalizedBodyHash;
- (id)_parseCopiedHeaderFields;
- (id)_parseMessageCanonicalizationAlgorithm;
- (id)_parseQueryMethod;
- (id)_parseSelector;
- (id)_parseSignatureDataWithHeaderBody:(id)a3;
- (id)_parseSignatureExpiration;
- (id)_parseSignatureTimestamp;
- (id)_parseSignedHeaderFields;
- (id)_parseSigningAlgorithm;
- (id)_parseSigningDomainIdentifier;
- (id)_parseVersion;
- (id)debugDescription;
- (unint64_t)bodyCanonicalizationAlgorithm;
- (unint64_t)hashingAlgorithm;
- (unint64_t)headerCanonicalizationAlgorithm;
- (unint64_t)signingAlgorithm;
@end

@implementation ECDKIMMessageHeader

- (ECDKIMMessageHeader)initWithHeaderFieldName:(id)a3 headerBody:(id)a4 error:(id *)a5
{
  v36[7] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)ECDKIMMessageHeader;
  v10 = [(ECDKIMMessageHeader *)&v34 init];
  if (!v10) {
    goto LABEL_63;
  }
  uint64_t v11 = [v8 copy];
  headerNameForCanonicalization = v10->_headerNameForCanonicalization;
  v10->_headerNameForCanonicalization = (NSString *)v11;

  id v33 = 0;
  uint64_t v13 = +[ECTagValueList tagValueListFromString:v9 error:&v33];
  id v14 = v33;
  tagValueList = v10->_tagValueList;
  v10->_tagValueList = (ECTagValueList *)v13;

  if (v14)
  {
    if (a5) {
      *a5 = v14;
    }

    goto LABEL_61;
  }
  v36[0] = @"v";
  v36[1] = @"a";
  v36[2] = @"b";
  v36[3] = @"bh";
  v36[4] = @"d";
  v36[5] = @"h";
  v36[6] = @"s";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:7];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v21 = -[ECTagValueList objectForKeyedSubscript:](v10->_tagValueList, "objectForKeyedSubscript:", v20, (void)v29);
        BOOL v22 = v21 == 0;

        if (v22)
        {
          if (a5)
          {
            *a5 = [(ECDKIMMessageHeader *)v10 _errorForMissingRequiredKey:v20];
          }

          v24 = 0;
          goto LABEL_60;
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  v23 = [(ECDKIMMessageHeader *)v10 _parseVersion];
  v24 = v23;
  if (v23)
  {
    if (a5) {
      goto LABEL_58;
    }
    goto LABEL_60;
  }
  v23 = [(ECDKIMMessageHeader *)v10 _parseSigningAlgorithm];
  v24 = v23;
  if (v23)
  {
    if (a5) {
      goto LABEL_58;
    }
    goto LABEL_60;
  }
  v23 = [(ECDKIMMessageHeader *)v10 _parseSignatureDataWithHeaderBody:v9];
  v24 = v23;
  if (v23)
  {
    if (a5) {
      goto LABEL_58;
    }
    goto LABEL_60;
  }
  v23 = [(ECDKIMMessageHeader *)v10 _parseCanonicalizedBodyHash];
  v24 = v23;
  if (v23)
  {
    if (a5) {
      goto LABEL_58;
    }
    goto LABEL_60;
  }
  v23 = [(ECDKIMMessageHeader *)v10 _parseMessageCanonicalizationAlgorithm];
  v24 = v23;
  if (v23)
  {
    if (a5) {
      goto LABEL_58;
    }
    goto LABEL_60;
  }
  v23 = [(ECDKIMMessageHeader *)v10 _parseSigningDomainIdentifier];
  v24 = v23;
  if (v23)
  {
    if (a5) {
      goto LABEL_58;
    }
    goto LABEL_60;
  }
  v23 = [(ECDKIMMessageHeader *)v10 _parseSignedHeaderFields];
  v24 = v23;
  if (v23)
  {
    if (a5) {
      goto LABEL_58;
    }
    goto LABEL_60;
  }
  v25 = [(ECDKIMMessageHeader *)v10 signingDomainIdentifier];
  v24 = [(ECDKIMMessageHeader *)v10 _parseAgentOrUserIdentifierWithSigningDomainIdentifier:v25];

  if (v24)
  {
    if (a5)
    {
      id v26 = v24;
LABEL_59:
      v24 = v26;
      *a5 = v26;
      goto LABEL_60;
    }
    goto LABEL_60;
  }
  v23 = [(ECDKIMMessageHeader *)v10 _parseBodyLength];
  v24 = v23;
  if (v23)
  {
    if (a5) {
      goto LABEL_58;
    }
    goto LABEL_60;
  }
  v23 = [(ECDKIMMessageHeader *)v10 _parseQueryMethod];
  v24 = v23;
  if (v23)
  {
    if (a5) {
      goto LABEL_58;
    }
    goto LABEL_60;
  }
  v23 = [(ECDKIMMessageHeader *)v10 _parseSelector];
  v24 = v23;
  if (v23)
  {
    if (a5) {
      goto LABEL_58;
    }
    goto LABEL_60;
  }
  v23 = [(ECDKIMMessageHeader *)v10 _parseSignatureTimestamp];
  v24 = v23;
  if (v23)
  {
    if (a5) {
      goto LABEL_58;
    }
    goto LABEL_60;
  }
  v23 = [(ECDKIMMessageHeader *)v10 _parseSignatureExpiration];
  v24 = v23;
  if (v23)
  {
    if (a5) {
      goto LABEL_58;
    }
    goto LABEL_60;
  }
  v23 = [(ECDKIMMessageHeader *)v10 _parseCopiedHeaderFields];
  v24 = v23;
  if (!v23)
  {

LABEL_63:
    v27 = v10;
    goto LABEL_64;
  }
  if (a5)
  {
LABEL_58:
    id v26 = v23;
    goto LABEL_59;
  }
LABEL_60:

LABEL_61:
  v27 = 0;
LABEL_64:

  return v27;
}

- (id)debugDescription
{
  return [(ECTagValueList *)self->_tagValueList stringRepresentation];
}

- (id)_parseVersion
{
  v3 = [(ECTagValueList *)self->_tagValueList objectForKeyedSubscript:@"v"];
  v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"1"])
    {
      objc_storeStrong((id *)&self->_version, v4);
      v5 = 0;
      goto LABEL_7;
    }
    uint64_t v6 = [(ECDKIMMessageHeader *)self _errorForInvalidRequiredKey:@"v" actualValue:v4 expectedValue:@"1"];
  }
  else
  {
    uint64_t v6 = [(ECDKIMMessageHeader *)self _errorForMissingRequiredKey:@"v"];
  }
  v5 = (void *)v6;
LABEL_7:

  return v5;
}

- (id)_parseSigningAlgorithm
{
  v3 = [(ECTagValueList *)self->_tagValueList objectForKeyedSubscript:@"a"];
  v4 = v3;
  if (!v3)
  {
    id v8 = [(ECDKIMMessageHeader *)self _errorForMissingRequiredKey:@"a"];
    goto LABEL_19;
  }
  v5 = [v3 componentsSeparatedByString:@"-"];
  if ([v5 count] == 2)
  {
    uint64_t v6 = [v5 firstObject];
    if ([v6 isEqualToString:@"rsa"])
    {
      unint64_t v7 = 0;
    }
    else
    {
      if (([v6 isEqualToString:@"ed25519"] & 1) == 0)
      {
        id v8 = [(ECDKIMMessageHeader *)self _errorForInvalidRequiredKey:@"a" actualValue:v6 expectedValue:@"rsa or ed25519"];
LABEL_17:

        goto LABEL_18;
      }
      unint64_t v7 = 1;
    }
    self->_signingAlgorithm = v7;
    id v9 = [v5 lastObject];
    if ([v9 isEqualToString:@"sha1"])
    {
      unint64_t v10 = 0;
    }
    else
    {
      if (([v9 isEqualToString:@"sha256"] & 1) == 0)
      {
        id v8 = [(ECDKIMMessageHeader *)self _errorForInvalidRequiredKey:@"a" actualValue:v9 expectedValue:@"sha1 or sha256"];
        goto LABEL_16;
      }
      unint64_t v10 = 1;
    }
    id v8 = 0;
    self->_hashingAlgorithm = v10;
LABEL_16:

    goto LABEL_17;
  }
  id v8 = [(ECDKIMMessageHeader *)self _errorForInvalidRequiredKey:@"a" actualValue:v4 expectedValue:0];
LABEL_18:

LABEL_19:
  return v8;
}

- (id)_parseSignatureDataWithHeaderBody:(id)a3
{
  id v4 = a3;
  v5 = [(ECTagValueList *)self->_tagValueList objectForKeyedSubscript:@"b"];
  if ([v5 length])
  {
    uint64_t v6 = [v4 rangeOfString:v5];
    objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v6, v7, &stru_1F1A635E8);
    id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    bodyForCanonicalization = self->_bodyForCanonicalization;
    self->_bodyForCanonicalization = v8;

    unint64_t v10 = self->_bodyForCanonicalization;
    uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v12 = [(NSString *)v10 ef_rangeOfCharactersFromSet:v11 options:12];
    uint64_t v14 = v13;

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = self->_bodyForCanonicalization;
      id v16 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      uint64_t v17 = -[NSString ef_rangeOfCharactersFromSet:options:range:](v15, "ef_rangeOfCharactersFromSet:options:range:", v16, 4, v12, v14);
      uint64_t v19 = v18;

      if (v17 != v12 || v19 != v14)
      {
        uint64_t v20 = -[NSString substringWithRange:](self->_bodyForCanonicalization, "substringWithRange:", v17, v19);
        -[NSString stringByReplacingCharactersInRange:withString:](self->_bodyForCanonicalization, "stringByReplacingCharactersInRange:withString:", v12, v14, v20);
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        BOOL v22 = self->_bodyForCanonicalization;
        self->_bodyForCanonicalization = v21;
      }
    }
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v5 options:1];
    if (v23)
    {
      objc_storeStrong((id *)&self->_signatureData, v23);
      v24 = 0;
    }
    else
    {
      v24 = [(ECDKIMMessageHeader *)self _errorForInvalidRequiredKey:@"b" actualValue:v5 expectedValue:0];
    }
  }
  else
  {
    v24 = [(ECDKIMMessageHeader *)self _errorForMissingRequiredKey:@"b"];
  }

  return v24;
}

- (id)_parseCanonicalizedBodyHash
{
  v3 = [(ECTagValueList *)self->_tagValueList objectForKeyedSubscript:@"bh"];
  id v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "ef_stringByRFC5322Unfolding");
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B88], "ef_rfc6376WhitespaceCharacterSet");
    uint64_t v7 = objc_msgSend(v5, "ef_stringByRemovingCharactersInSet:", v6);

    if ([v7 length])
    {
      objc_storeStrong((id *)&self->_canonicalizedBodyHash, v7);
      id v8 = 0;
    }
    else
    {
      id v8 = [(ECDKIMMessageHeader *)self _errorForInvalidRequiredKey:@"bh" actualValue:v7 expectedValue:0];
    }
  }
  else
  {
    id v8 = [(ECDKIMMessageHeader *)self _errorForMissingRequiredKey:@"bh"];
  }

  return v8;
}

- (id)_parseMessageCanonicalizationAlgorithm
{
  self->_bodyCanonicalizationAlgorithm = 0;
  self->_headerCanonicalizationAlgorithm = 0;
  p_bodyCanonicalizationAlgorithm = &self->_bodyCanonicalizationAlgorithm;
  id v4 = [(ECTagValueList *)self->_tagValueList objectForKeyedSubscript:@"c"];
  v5 = v4;
  if (!v4)
  {
    uint64_t v7 = 0;
    goto LABEL_21;
  }
  uint64_t v6 = [v4 componentsSeparatedByString:@"/"];
  if ((unint64_t)[v6 count] < 3)
  {
    if ([v6 count])
    {
      id v8 = [v6 firstObject];
      if ([v8 isEqualToString:@"simple"])
      {
        unint64_t v9 = 0;
      }
      else
      {
        if (([v8 isEqualToString:@"relaxed"] & 1) == 0) {
          goto LABEL_18;
        }
        unint64_t v9 = 1;
      }
      self->_headerCanonicalizationAlgorithm = v9;
    }
    if ([v6 count] != 2)
    {
      uint64_t v7 = 0;
      goto LABEL_20;
    }
    id v8 = [v6 lastObject];
    if ([v8 isEqualToString:@"simple"])
    {
      uint64_t v10 = 0;
LABEL_17:
      uint64_t v7 = 0;
      unint64_t *p_bodyCanonicalizationAlgorithm = v10;
LABEL_19:

      goto LABEL_20;
    }
    if ([v8 isEqualToString:@"relaxed"])
    {
      uint64_t v10 = 1;
      goto LABEL_17;
    }
LABEL_18:
    uint64_t v7 = [(ECDKIMMessageHeader *)self _errorForInvalidOptionalKey:@"c" actualValue:v8 expectedValue:@"simple or relaxed"];
    goto LABEL_19;
  }
  uint64_t v7 = [(ECDKIMMessageHeader *)self _errorForInvalidOptionalKey:@"c" actualValue:v5 expectedValue:0];
LABEL_20:

LABEL_21:
  return v7;
}

- (id)_parseSigningDomainIdentifier
{
  v3 = [(ECTagValueList *)self->_tagValueList objectForKeyedSubscript:@"d"];
  if (v3)
  {
    if ([(ECDKIMMessageHeader *)self _isValidDomain:v3])
    {
      objc_storeStrong((id *)&self->_signingDomainIdentifier, v3);
      id v4 = 0;
      goto LABEL_7;
    }
    uint64_t v5 = [(ECDKIMMessageHeader *)self _errorForInvalidRequiredKey:@"d" actualValue:v3 expectedValue:0];
  }
  else
  {
    uint64_t v5 = [(ECDKIMMessageHeader *)self _errorForMissingRequiredKey:@"d"];
  }
  id v4 = (void *)v5;
LABEL_7:

  return v4;
}

- (BOOL)_isValidDomain:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] < 3)
  {
LABEL_2:
    BOOL v4 = 0;
    goto LABEL_3;
  }
  uint64_t v6 = [v3 rangeOfString:@"."];
  int v7 = [v3 characterAtIndex:0];
  int v8 = objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1);
  BOOL v4 = 0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v7 != 46 && v7 != 45 && v8 != 46 && v8 != 45)
  {
    if ([v3 rangeOfString:@".-"] == 0x7FFFFFFFFFFFFFFFLL
      && [v3 rangeOfString:@"-."] == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v4 = +[ECEmailAddressParser validateDomain:v3];
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:

  return v4;
}

- (id)_parseSignedHeaderFields
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [(ECTagValueList *)self->_tagValueList objectForKeyedSubscript:@"h"];
  uint64_t v18 = v2;
  if (v2)
  {
    uint64_t v17 = [v2 componentsSeparatedByString:@":"];
    if ([v17 count])
    {
      id v3 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v4 = v17;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v20 != v6) {
              objc_enumerationMutation(v4);
            }
            int v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            unint64_t v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
            uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];
            uint64_t v11 = [v10 lowercaseString];
            uint64_t v12 = objc_msgSend(v11, "ef_stringByRFC5322Unfolding");

            [(NSArray *)v3 addObject:v12];
          }
          uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v5);
      }

      signedHeaderFields = self->_signedHeaderFields;
      self->_signedHeaderFields = v3;

      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = [(ECDKIMMessageHeader *)self _errorForInvalidRequiredKey:@"h" actualValue:v18 expectedValue:0];
    }
  }
  else
  {
    uint64_t v14 = [(ECDKIMMessageHeader *)self _errorForMissingRequiredKey:@"h"];
  }

  return v14;
}

- (id)_parseAgentOrUserIdentifierWithSigningDomainIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ECTagValueList *)self->_tagValueList objectForKeyedSubscript:@"i"];
  uint64_t v6 = v5;
  if (v5)
  {
    int v7 = v5;
LABEL_5:
    agentOrUserIdentifier = self->_agentOrUserIdentifier;
    self->_agentOrUserIdentifier = v7;

    goto LABEL_6;
  }
  if (v4)
  {
    int v7 = [NSString stringWithFormat:@"@%@", v4];
    goto LABEL_5;
  }
LABEL_6:

  return 0;
}

- (id)_parseBodyLength
{
  id v3 = [(ECTagValueList *)self->_tagValueList objectForKeyedSubscript:@"l"];
  id v4 = v3;
  if (v3)
  {
    if ((unint64_t)[v3 length] >= 0x4D)
    {
      uint64_t v5 = [(ECDKIMMessageHeader *)self _errorForInvalidOptionalKey:@"l" actualValue:v4 expectedValue:0];
      goto LABEL_9;
    }
    uint64_t v6 = objc_opt_new();
    [v6 setNumberStyle:0];
    [v6 setGeneratesDecimalNumbers:0];
    int v7 = [v6 numberFromString:v4];
    bodyLength = self->_bodyLength;
    self->_bodyLength = v7;

    if (self->_bodyLength)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [(ECDKIMMessageHeader *)self _errorForInvalidOptionalKey:@"l" actualValue:v4 expectedValue:0];
    }
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = self->_bodyLength;
    self->_bodyLength = 0;
  }

LABEL_9:
  return v5;
}

- (id)_parseQueryMethod
{
  return 0;
}

- (id)_parseSelector
{
  id v3 = [(ECTagValueList *)self->_tagValueList objectForKeyedSubscript:@"s"];
  if (v3) {
    objc_storeStrong((id *)&self->_selector, v3);
  }

  return 0;
}

- (id)_parseSignatureTimestamp
{
  id v3 = [(ECTagValueList *)self->_tagValueList objectForKeyedSubscript:@"t"];
  id v4 = v3;
  double v5 = 0.0;
  if (v3 && (unint64_t)[v3 length] <= 0xC)
  {
    [v4 doubleValue];
    double v5 = v6;
  }
  self->_signatureTimestamp = v5;

  return 0;
}

- (id)_parseSignatureExpiration
{
  id v3 = [(ECTagValueList *)self->_tagValueList objectForKeyedSubscript:@"x"];
  id v4 = v3;
  double v5 = 0.0;
  if (v3 && (unint64_t)[v3 length] <= 0xC)
  {
    [v4 doubleValue];
    double v5 = v6;
  }
  self->_signatureExpiration = v5;

  return 0;
}

- (id)_parseCopiedHeaderFields
{
  return 0;
}

- (id)_errorForMissingRequiredKey:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [NSString stringWithFormat:@"DKIM signature is missing required key '%@'", v3, *MEMORY[0x1E4F28588]];
  v9[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  double v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ECDKIMMessageHeaderParseError" code:100 userInfo:v5];

  return v6;
}

- (id)_errorForInvalidRequiredKey:(id)a3 actualValue:(id)a4 expectedValue:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = *MEMORY[0x1E4F28588];
  uint64_t v8 = [NSString stringWithFormat:@"DKIM signature required key '%@' has invalid value '%@'", v6, v7];
  v13[0] = v8;
  unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ECDKIMMessageHeaderParseError" code:101 userInfo:v9];

  return v10;
}

- (id)_errorForInvalidOptionalKey:(id)a3 actualValue:(id)a4 expectedValue:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = *MEMORY[0x1E4F28588];
  uint64_t v8 = [NSString stringWithFormat:@"DKIM signature optional key '%@' has invalid value '%@'", v6, v7];
  v13[0] = v8;
  unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ECDKIMMessageHeaderParseError" code:102 userInfo:v9];

  return v10;
}

- (NSString)version
{
  return self->_version;
}

- (unint64_t)signingAlgorithm
{
  return self->_signingAlgorithm;
}

- (unint64_t)hashingAlgorithm
{
  return self->_hashingAlgorithm;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (NSString)canonicalizedBodyHash
{
  return self->_canonicalizedBodyHash;
}

- (unint64_t)bodyCanonicalizationAlgorithm
{
  return self->_bodyCanonicalizationAlgorithm;
}

- (unint64_t)headerCanonicalizationAlgorithm
{
  return self->_headerCanonicalizationAlgorithm;
}

- (NSString)signingDomainIdentifier
{
  return self->_signingDomainIdentifier;
}

- (NSArray)signedHeaderFields
{
  return self->_signedHeaderFields;
}

- (NSString)agentOrUserIdentifier
{
  return self->_agentOrUserIdentifier;
}

- (NSNumber)bodyLength
{
  return self->_bodyLength;
}

- (NSArray)queryMethods
{
  return self->_queryMethods;
}

- (NSString)selector
{
  return self->_selector;
}

- (double)signatureTimestamp
{
  return self->_signatureTimestamp;
}

- (double)signatureExpiration
{
  return self->_signatureExpiration;
}

- (NSArray)copiedHeaderFields
{
  return self->_copiedHeaderFields;
}

- (NSString)headerNameForCanonicalization
{
  return self->_headerNameForCanonicalization;
}

- (NSString)bodyForCanonicalization
{
  return self->_bodyForCanonicalization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyForCanonicalization, 0);
  objc_storeStrong((id *)&self->_headerNameForCanonicalization, 0);
  objc_storeStrong((id *)&self->_copiedHeaderFields, 0);
  objc_storeStrong((id *)&self->_selector, 0);
  objc_storeStrong((id *)&self->_queryMethods, 0);
  objc_storeStrong((id *)&self->_bodyLength, 0);
  objc_storeStrong((id *)&self->_agentOrUserIdentifier, 0);
  objc_storeStrong((id *)&self->_signedHeaderFields, 0);
  objc_storeStrong((id *)&self->_signingDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_canonicalizedBodyHash, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_tagValueList, 0);
}

@end