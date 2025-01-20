@interface AFSpeakableUtteranceParser
+ (BOOL)_shouldAutomaticallyProvideFunctions;
+ (id)parseUserGeneratedMessage:(id)a3;
- (AFSpeakableUtteranceParser)init;
- (AFSpeakableUtteranceParser)initWithLocale:(id)a3;
- (BOOL)handleTTSCodes;
- (BOOL)handlesFunctions;
- (id)_handleControlCodeAtIndex:(unsigned int)a3 withBuffer:(id *)a4 totalLength:(unint64_t)a5 consumedLength:(unsigned int *)a6 hadEmpties:(BOOL *)a7 containsPrivacySensitiveContents:(BOOL *)a8 externalProviders:(BOOL *)a9;
- (id)_handleOptionalAtIndex:(unsigned int)a3 withBuffer:(id *)a4 totalLength:(unint64_t)a5 consumedLength:(unsigned int *)a6 containsPrivacySensitiveContents:(BOOL *)a7 externalProviders:(BOOL *)a8;
- (id)_handleProviderAtIndex:(unsigned int)a3 withBuffer:(id *)a4 totalLength:(unint64_t)a5 consumedLength:(unsigned int *)a6 containsPrivacySensitiveContents:(BOOL *)a7 hadEmpties:(BOOL *)a8 externalProviders:(BOOL *)a9;
- (id)_parseStringWithFormat:(id)a3 error:(id *)a4 hadEmpties:(BOOL *)a5 containsPrivacySensitiveContents:(BOOL *)a6 externalProviders:(BOOL *)a7;
- (id)parseStringRemovingControlCharacters:(id)a3 error:(id *)a4;
- (id)parseStringRemovingControlCharacters:(id)a3 error:(id *)a4 containsPrivacySensitiveContents:(BOOL *)a5;
- (id)parseStringWithFormat:(id)a3 error:(id *)a4;
- (id)parseStringWithFormat:(id)a3 error:(id *)a4 containsPrivacySensitiveContents:(BOOL *)a5;
- (id)parseStringWithFormat:(id)a3 error:(id *)a4 containsPrivacySensitiveContents:(BOOL *)a5 hasExternalDomains:(BOOL *)a6;
- (id)parseStringWithFormat:(id)a3 error:(id *)a4 hasExternalDomains:(BOOL *)a5;
- (id)parseStringWithFormat:(id)a3 includeControlCharacters:(BOOL)a4 error:(id *)a5 hadEmpties:(BOOL *)a6 containsPrivacySensitiveContents:(BOOL *)a7 externalProviders:(BOOL *)a8;
- (void)registerProvider:(id)a3 forNamespace:(id)a4;
- (void)setHandleTTSCodes:(BOOL)a3;
- (void)setHandlesFunctions:(BOOL)a3;
@end

@implementation AFSpeakableUtteranceParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong(&self->_functionHandler, 0);
  objc_storeStrong((id *)&self->_providers, 0);
}

- (id)parseStringRemovingControlCharacters:(id)a3 error:(id *)a4 containsPrivacySensitiveContents:(BOOL *)a5
{
  if (a5) {
    *a5 = 0;
  }
  char v7 = 0;
  v5 = -[AFSpeakableUtteranceParser parseStringWithFormat:includeControlCharacters:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:](self, "parseStringWithFormat:includeControlCharacters:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:", a3, 0, a4, &v7);
  return v5;
}

- (id)parseStringRemovingControlCharacters:(id)a3 error:(id *)a4
{
  char v6 = 0;
  v4 = [(AFSpeakableUtteranceParser *)self parseStringWithFormat:a3 includeControlCharacters:0 error:a4 hadEmpties:&v6 containsPrivacySensitiveContents:&v6 externalProviders:0];
  return v4;
}

- (id)parseStringWithFormat:(id)a3 error:(id *)a4 containsPrivacySensitiveContents:(BOOL *)a5 hasExternalDomains:(BOOL *)a6
{
  if (a5) {
    *a5 = 0;
  }
  char v8 = 0;
  char v6 = [(AFSpeakableUtteranceParser *)self _parseStringWithFormat:a3 error:a4 hadEmpties:&v8 containsPrivacySensitiveContents:a5 externalProviders:a6];
  return v6;
}

- (id)parseStringWithFormat:(id)a3 error:(id *)a4 containsPrivacySensitiveContents:(BOOL *)a5
{
  return [(AFSpeakableUtteranceParser *)self parseStringWithFormat:a3 error:a4 containsPrivacySensitiveContents:a5 hasExternalDomains:0];
}

- (id)parseStringWithFormat:(id)a3 error:(id *)a4 hasExternalDomains:(BOOL *)a5
{
  __int16 v7 = 0;
  v5 = [(AFSpeakableUtteranceParser *)self _parseStringWithFormat:a3 error:a4 hadEmpties:(char *)&v7 + 1 containsPrivacySensitiveContents:&v7 externalProviders:a5];
  return v5;
}

- (id)parseStringWithFormat:(id)a3 error:(id *)a4
{
  return [(AFSpeakableUtteranceParser *)self parseStringWithFormat:a3 error:a4 hasExternalDomains:0];
}

- (id)_parseStringWithFormat:(id)a3 error:(id *)a4 hadEmpties:(BOOL *)a5 containsPrivacySensitiveContents:(BOOL *)a6 externalProviders:(BOOL *)a7
{
  return [(AFSpeakableUtteranceParser *)self parseStringWithFormat:a3 includeControlCharacters:1 error:a4 hadEmpties:a5 containsPrivacySensitiveContents:a6 externalProviders:a7];
}

- (id)parseStringWithFormat:(id)a3 includeControlCharacters:(BOOL)a4 error:(id *)a5 hadEmpties:(BOOL *)a6 containsPrivacySensitiveContents:(BOOL *)a7 externalProviders:(BOOL *)a8
{
  BOOL v11 = a4;
  v13 = (__CFString *)a3;
  v14 = v13;
  if (a7) {
    *a7 = 0;
  }
  unint64_t v15 = [(__CFString *)v13 length];
  v16 = [MEMORY[0x1E4F28E78] stringWithCapacity:v15];
  if (v15)
  {
    v32 = a7;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v39 = 0u;
    theString[0] = v14;
    *((void *)&v47 + 1) = 0;
    *(void *)&long long v48 = v15;
    CFStringRef CharactersPtr = (const __CFString *)CFStringGetCharactersPtr(v14);
    CStringPtr = 0;
    theString[1] = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v14, 0x600u);
    }
    uint64_t v19 = 0;
    char v20 = 0;
    unsigned int v21 = 0;
    *((void *)&v48 + 1) = 0;
    uint64_t v49 = 0;
    *(void *)&long long v47 = CStringPtr;
    while (1)
    {
      UniChar chars = 0;
      uint64_t v22 = v48;
      if ((uint64_t)v48 <= v19) {
        goto LABEL_21;
      }
      v23 = (UniChar *)theString[1];
      if (theString[1]) {
        break;
      }
      if (!(void)v47)
      {
        uint64_t v28 = *((void *)&v48 + 1);
        if (v49 <= v19 || *((void *)&v48 + 1) > v19)
        {
          uint64_t v30 = v19 - 4;
          if (v21 < 4) {
            uint64_t v30 = 0;
          }
          if (v30 + 64 < (uint64_t)v48) {
            uint64_t v22 = v30 + 64;
          }
          *((void *)&v48 + 1) = v30;
          uint64_t v49 = v22;
          v51.location = *((void *)&v47 + 1) + v30;
          v51.length = v22 - v30;
          CFStringGetCharacters(theString[0], v51, buffer);
          uint64_t v28 = *((void *)&v48 + 1);
        }
        uint64_t v24 = v19 - v28;
        v23 = buffer;
        goto LABEL_10;
      }
      UniChar v25 = *(char *)(v47 + *((void *)&v47 + 1) + v19);
LABEL_13:
      UniChar chars = v25;
      if (v25 == 64)
      {
        int v36 = 0;
        char v35 = 0;
        v33[8] = *(_OWORD *)theString;
        v33[9] = v47;
        v33[10] = v48;
        uint64_t v34 = v49;
        v33[4] = v42;
        v33[5] = v43;
        v33[6] = v44;
        v33[7] = v45;
        v33[0] = *(_OWORD *)buffer;
        v33[1] = v39;
        v33[2] = v40;
        v33[3] = v41;
        v26 = [(AFSpeakableUtteranceParser *)self _handleControlCodeAtIndex:v21 + 1 withBuffer:v33 totalLength:v15 consumedLength:&v36 hadEmpties:a6 containsPrivacySensitiveContents:&v35 externalProviders:a8];
        v27 = v26;
        if (v11 && [v26 length]) {
          [(__CFString *)v16 appendString:v27];
        }
        if (v35) {
          char v20 = 1;
        }
        if (v36) {
          v21 += v36;
        }
        else {
          CFStringAppendCharacters(v16, &chars, 1);
        }

        goto LABEL_24;
      }
LABEL_21:
      CFStringAppendCharacters(v16, &chars, 1);
LABEL_24:
      uint64_t v19 = ++v21;
      if (v15 <= v21)
      {
        if (v32 && (v20 & 1) != 0) {
          BOOL *v32 = 1;
        }
        goto LABEL_39;
      }
    }
    uint64_t v24 = *((void *)&v47 + 1) + v19;
LABEL_10:
    UniChar v25 = v23[v24];
    goto LABEL_13;
  }
LABEL_39:

  return v16;
}

- (id)_handleControlCodeAtIndex:(unsigned int)a3 withBuffer:(id *)a4 totalLength:(unint64_t)a5 consumedLength:(unsigned int *)a6 hadEmpties:(BOOL *)a7 containsPrivacySensitiveContents:(BOOL *)a8 externalProviders:(BOOL *)a9
{
  if (!a6) {
    __assert_rtn("-[AFSpeakableUtteranceParser _handleControlCodeAtIndex:withBuffer:totalLength:consumedLength:hadEmpties:containsPrivacySensitiveContents:externalProviders:]", "AFSpeakableUtteranceParser.m", 270, "consumed && \"Need to provide a consumer.\"");
  }
  if (a8) {
    *a8 = 0;
  }
  if (a5 - 1 <= a3 || (uint64_t var1 = a4->var4.var1, var1 <= a3))
  {
LABEL_21:
    v27 = &stru_1EEE35D28;
    goto LABEL_22;
  }
  var2 = a4->var2;
  if (var2)
  {
    unsigned __int16 v18 = var2[a4->var4.var0 + a3];
  }
  else
  {
    var3 = a4->var3;
    if (var3)
    {
      unsigned __int16 v18 = var3[a4->var4.var0 + a3];
    }
    else
    {
      if (a4->var6 <= a3 || (int64_t var5 = a4->var5, var5 > a3))
      {
        int64_t v21 = a3 - 4;
        if (a3 < 4) {
          int64_t v21 = 0;
        }
        if (v21 + 64 < var1) {
          uint64_t var1 = v21 + 64;
        }
        a4->int64_t var5 = v21;
        a4->int64_t var6 = var1;
        v48.location = a4->var4.var0 + v21;
        v48.length = var1 - v21;
        CFStringGetCharacters(a4->var1, v48, a4->var0);
        int64_t var5 = a4->var5;
      }
      unsigned __int16 v18 = a4->var0[a3 - var5];
    }
  }
  if (v18 != 123)
  {
    if (v18 == 91)
    {
      ++*a6;
      long long v22 = *(_OWORD *)&a4->var3;
      long long v43 = *(_OWORD *)&a4->var1;
      long long v44 = v22;
      long long v45 = *(_OWORD *)&a4->var4.var1;
      int64_t var6 = a4->var6;
      long long v23 = *(_OWORD *)&a4->var0[40];
      long long v39 = *(_OWORD *)&a4->var0[32];
      long long v40 = v23;
      long long v24 = *(_OWORD *)&a4->var0[56];
      long long v41 = *(_OWORD *)&a4->var0[48];
      long long v42 = v24;
      long long v25 = *(_OWORD *)&a4->var0[8];
      long long v35 = *(_OWORD *)a4->var0;
      long long v36 = v25;
      long long v26 = *(_OWORD *)&a4->var0[24];
      long long v37 = *(_OWORD *)&a4->var0[16];
      long long v38 = v26;
      v27 = [(AFSpeakableUtteranceParser *)self _handleOptionalAtIndex:a3 + 1 withBuffer:&v35 totalLength:a5 consumedLength:a6 containsPrivacySensitiveContents:a8 externalProviders:a9];
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  ++*a6;
  long long v29 = *(_OWORD *)&a4->var3;
  long long v43 = *(_OWORD *)&a4->var1;
  long long v44 = v29;
  long long v45 = *(_OWORD *)&a4->var4.var1;
  int64_t var6 = a4->var6;
  long long v30 = *(_OWORD *)&a4->var0[40];
  long long v39 = *(_OWORD *)&a4->var0[32];
  long long v40 = v30;
  long long v31 = *(_OWORD *)&a4->var0[56];
  long long v41 = *(_OWORD *)&a4->var0[48];
  long long v42 = v31;
  long long v32 = *(_OWORD *)&a4->var0[8];
  long long v35 = *(_OWORD *)a4->var0;
  long long v36 = v32;
  long long v33 = *(_OWORD *)&a4->var0[24];
  long long v37 = *(_OWORD *)&a4->var0[16];
  long long v38 = v33;
  v27 = [(AFSpeakableUtteranceParser *)self _handleProviderAtIndex:a3 + 1 withBuffer:&v35 totalLength:a5 consumedLength:a6 containsPrivacySensitiveContents:a8 hadEmpties:a7 externalProviders:a9];
  uint64_t v34 = [(__CFString *)v27 length];
  if (a7 && !v34) {
    *a7 = 1;
  }
LABEL_22:
  return v27;
}

- (id)_handleOptionalAtIndex:(unsigned int)a3 withBuffer:(id *)a4 totalLength:(unint64_t)a5 consumedLength:(unsigned int *)a6 containsPrivacySensitiveContents:(BOOL *)a7 externalProviders:(BOOL *)a8
{
  if (a7) {
    *a7 = 0;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t v16 = a5 - 1;
  if (a5 - 1 <= a3)
  {
    unsigned __int16 v18 = &stru_1EEE35D28;
    goto LABEL_30;
  }
  uint64_t v28 = a8;
  int64_t v17 = a3;
  unsigned __int16 v18 = &stru_1EEE35D28;
  while (1)
  {
    int64_t var1 = a4->var4.var1;
    if (var1 > v17) {
      break;
    }
    unsigned __int16 v21 = 0;
    ++*a6;
LABEL_20:
    objc_msgSend(v15, "appendFormat:", @"%C", v21);
    int64_t v17 = ++a3;
    if (v16 <= a3) {
      goto LABEL_30;
    }
  }
  var2 = a4->var2;
  if (var2)
  {
    unsigned __int16 v21 = var2[a4->var4.var0 + v17];
  }
  else
  {
    var3 = a4->var3;
    if (var3)
    {
      unsigned __int16 v21 = var3[a4->var4.var0 + v17];
    }
    else
    {
      if (a4->var6 <= v17 || (int64_t var5 = a4->var5, var5 > v17))
      {
        int64_t v24 = v17 - 4;
        if (a3 < 4) {
          int64_t v24 = 0;
        }
        if (v24 + 64 < var1) {
          int64_t var1 = v24 + 64;
        }
        a4->int64_t var5 = v24;
        a4->int64_t var6 = var1;
        v31.location = a4->var4.var0 + v24;
        v31.length = var1 - v24;
        CFStringGetCharacters(a4->var1, v31, a4->var0);
        int64_t var5 = a4->var5;
      }
      unsigned __int16 v21 = a4->var0[v17 - var5];
    }
  }
  ++*a6;
  if (v21 != 93) {
    goto LABEL_20;
  }
  __int16 v29 = 0;
  long long v25 = [(AFSpeakableUtteranceParser *)self parseStringWithFormat:v15 includeControlCharacters:1 error:0 hadEmpties:(char *)&v29 + 1 containsPrivacySensitiveContents:&v29 externalProviders:v28];
  long long v26 = v25;
  if (HIBYTE(v29))
  {
    unsigned __int16 v18 = &stru_1EEE35D28;
  }
  else
  {
    if (a7 && (_BYTE)v29) {
      *a7 = 1;
    }
    unsigned __int16 v18 = v25;
  }

LABEL_30:
  return v18;
}

- (id)_handleProviderAtIndex:(unsigned int)a3 withBuffer:(id *)a4 totalLength:(unint64_t)a5 consumedLength:(unsigned int *)a6 containsPrivacySensitiveContents:(BOOL *)a7 hadEmpties:(BOOL *)a8 externalProviders:(BOOL *)a9
{
  if (a7) {
    *a7 = 0;
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  int64_t v17 = a3;
  if (a3 >= a5)
  {
    unsigned __int16 v18 = &stru_1EEE35D28;
    goto LABEL_24;
  }
  long long v43 = a8;
  long long v44 = self;
  long long v45 = a7;
  unsigned __int16 v18 = &stru_1EEE35D28;
  while (1)
  {
    int64_t var1 = a4->var4.var1;
    if (var1 > v17) {
      break;
    }
    uint64_t v21 = 0;
    ++*a6;
    ++a3;
LABEL_21:
    objc_msgSend(v16, "appendFormat:", @"%C", v21);
    int64_t v17 = a3;
    if (a3 >= a5) {
      goto LABEL_24;
    }
  }
  var2 = a4->var2;
  if (var2)
  {
    LOWORD(v21) = var2[a4->var4.var0 + v17];
  }
  else
  {
    var3 = a4->var3;
    if (var3)
    {
      LOWORD(v21) = var3[a4->var4.var0 + v17];
    }
    else
    {
      if (a4->var6 <= v17 || (int64_t var5 = a4->var5, var5 > v17))
      {
        int64_t v24 = v17 - 4;
        if (a3 < 4) {
          int64_t v24 = 0;
        }
        if (v24 + 64 < var1) {
          int64_t var1 = v24 + 64;
        }
        a4->int64_t var5 = v24;
        a4->int64_t var6 = var1;
        v50.location = a4->var4.var0 + v24;
        v50.length = var1 - v24;
        CFStringGetCharacters(a4->var1, v50, a4->var0);
        int64_t var5 = a4->var5;
      }
      LOWORD(v21) = a4->var0[v17 - var5];
    }
  }
  ++*a6;
  ++a3;
  uint64_t v21 = (unsigned __int16)v21;
  if ((unsigned __int16)v21 != 35)
  {
    if ((unsigned __int16)v21 == 125) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  if (a9
    && !*a9
    && ([v16 isEqualToString:@"tts"] & 1) == 0
    && ([v16 isEqualToString:@"fn"] & 1) == 0)
  {
    *a9 = 1;
  }
  id v26 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  int v27 = 0;
  while (2)
  {
    uint64_t v28 = a4->var4.var1;
    if (v28 <= a3)
    {
      int v31 = 0;
      unsigned __int16 v30 = 0;
      ++*a6;
LABEL_51:
      int v36 = v30;
      ++a3;
      objc_msgSend(v26, "appendFormat:", @"%C", v30);
      int v37 = v31 << 31 >> 31;
      if (v36 == 123) {
        int v37 = 1;
      }
      v27 += v37;
      continue;
    }
    break;
  }
  __int16 v29 = a4->var2;
  if (v29)
  {
    unsigned __int16 v30 = v29[a4->var4.var0 + a3];
  }
  else
  {
    long long v32 = a4->var3;
    if (v32)
    {
      unsigned __int16 v30 = v32[a4->var4.var0 + a3];
    }
    else
    {
      if (a4->var6 <= a3 || (int64_t v33 = a4->var5, v33 > a3))
      {
        int64_t v34 = a3 - 4;
        if (a3 < 4) {
          int64_t v34 = 0;
        }
        if (v34 + 64 < v28) {
          uint64_t v28 = v34 + 64;
        }
        a4->int64_t var5 = v34;
        a4->int64_t var6 = v28;
        v51.location = a4->var4.var0 + v34;
        v51.length = v28 - v34;
        CFStringGetCharacters(a4->var1, v51, a4->var0);
        int64_t v33 = a4->var5;
      }
      unsigned __int16 v30 = a4->var0[a3 - v33];
    }
  }
  ++*a6;
  int v31 = v30 == 125;
  if (v30 != 125 || v27 != 0) {
    goto LABEL_51;
  }
  char v48 = 0;
  id v47 = 0;
  long long v38 = [(AFSpeakableUtteranceParser *)self _parseStringWithFormat:v26 error:&v47 hadEmpties:v43 containsPrivacySensitiveContents:&v48 externalProviders:a9];
  id v39 = v47;
  long long v40 = v39;
  if (v39) {
    NSLog(&cfstr_ErrorParsingRe.isa, v39);
  }
  char v46 = 0;
  long long v41 = [(NSMutableDictionary *)v44->_providers objectForKey:v16];
  if (!v41) {
    goto LABEL_61;
  }
  if (objc_opt_respondsToSelector())
  {
    long long v42 = [v41 stringForExpression:v38 containsPrivacySensitiveContents:&v46];
    goto LABEL_62;
  }
  if (objc_opt_respondsToSelector())
  {
    long long v42 = [v41 stringForExpression:v38];
    char v46 = [v38 isEqualToString:v42] ^ 1;
  }
  else
  {
LABEL_61:
    long long v42 = 0;
  }
LABEL_62:
  if (v48)
  {
    if (!v45) {
      goto LABEL_68;
    }
LABEL_67:
    *long long v45 = 1;
    goto LABEL_68;
  }
  if (v45 && v46) {
    goto LABEL_67;
  }
LABEL_68:
  unsigned __int16 v18 = v42;

LABEL_24:
  return v18;
}

- (void)setHandlesFunctions:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 && ![(AFSpeakableUtteranceParser *)self handlesFunctions])
  {
    id functionHandler = self->_functionHandler;
    if (!functionHandler)
    {
      v5 = [[AFSUPFunctionProvider alloc] initWithLocale:self->_locale];
      id v6 = self->_functionHandler;
      self->_id functionHandler = v5;

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      __int16 v7 = self->_providers;
      uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            v13 = -[NSMutableDictionary objectForKey:](self->_providers, "objectForKey:", v12, (void)v14);
            [self->_functionHandler registerProvider:v13 forNamespace:v12];
          }
          uint64_t v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }

      id functionHandler = self->_functionHandler;
    }
    [(AFSpeakableUtteranceParser *)self registerProvider:functionHandler, @"fn", (void)v14 forNamespace];
  }
  else
  {
    [(AFSpeakableUtteranceParser *)self registerProvider:0 forNamespace:@"fn"];
  }
}

- (BOOL)handlesFunctions
{
  v2 = [(NSMutableDictionary *)self->_providers objectForKey:@"fn"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setHandleTTSCodes:(BOOL)a3
{
  if (a3 && ![(AFSpeakableUtteranceParser *)self handleTTSCodes])
  {
    v4 = objc_alloc_init(_AFSpeakableUtterancePassThroughProvider);
    [(AFSpeakableUtteranceParser *)self registerProvider:v4 forNamespace:@"tts"];
  }
  else
  {
    [(AFSpeakableUtteranceParser *)self registerProvider:0 forNamespace:@"tts"];
  }
}

- (BOOL)handleTTSCodes
{
  v2 = [(NSMutableDictionary *)self->_providers objectForKey:@"tts"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)registerProvider:(id)a3 forNamespace:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  providers = self->_providers;
  if (v9) {
    [(NSMutableDictionary *)providers setObject:v9 forKey:v6];
  }
  else {
    [(NSMutableDictionary *)providers removeObjectForKey:v6];
  }
  id functionHandler = self->_functionHandler;
  if (functionHandler && functionHandler != v9) {
    [functionHandler registerProvider:v9 forNamespace:v6];
  }
}

- (AFSpeakableUtteranceParser)initWithLocale:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFSpeakableUtteranceParser;
  v5 = [(AFSpeakableUtteranceParser *)&v11 init];
  if (v5)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    providers = v5->_providers;
    v5->_providers = v6;

    if (v4)
    {
      uint64_t v8 = (NSLocale *)v4;
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    }
    locale = v5->_locale;
    v5->_locale = v8;

    if ([(id)objc_opt_class() _shouldAutomaticallyProvideFunctions]) {
      [(AFSpeakableUtteranceParser *)v5 setHandlesFunctions:1];
    }
  }

  return v5;
}

- (AFSpeakableUtteranceParser)init
{
  BOOL v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [(AFSpeakableUtteranceParser *)self initWithLocale:v3];

  return v4;
}

+ (id)parseUserGeneratedMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (parseUserGeneratedMessage__onceToken != -1) {
    dispatch_once(&parseUserGeneratedMessage__onceToken, &__block_literal_global_13007);
  }
  if (parseUserGeneratedMessage__AXSpeechTransformTextHandle)
  {
    id v4 = parseUserGeneratedMessage__AXSpeechTransformTextHandle(v3, 3);
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      uint64_t v8 = "+[AFSpeakableUtteranceParser parseUserGeneratedMessage:]";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s User Generated Message: %@", (uint8_t *)&v7, 0x16u);
      v5 = AFSiriLogContextConnection;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      uint64_t v8 = "+[AFSpeakableUtteranceParser parseUserGeneratedMessage:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Transformed Text: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __56__AFSpeakableUtteranceParser_parseUserGeneratedMessage___block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!parseUserGeneratedMessage__AXSpeechTransformTextHandle)
  {
    v0 = dlopen("/usr/lib/libAXSpeechManager.dylib", 1);
    if (v0)
    {
      parseUserGeneratedMessage__AXSpeechTransformTextHandle = (uint64_t (*)(void, void))dlsym(v0, "AXSpeechTransformText");
      if (parseUserGeneratedMessage__AXSpeechTransformTextHandle) {
        return;
      }
      v1 = (void *)AFSiriLogContextConnection;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        return;
      }
      v2 = v1;
      int v5 = 136315394;
      id v6 = "+[AFSpeakableUtteranceParser parseUserGeneratedMessage:]_block_invoke";
      __int16 v7 = 2082;
      uint64_t v8 = dlerror();
      id v3 = "%s Could not find AXSpeechTransformText: %{public}s";
    }
    else
    {
      id v4 = (void *)AFSiriLogContextConnection;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        return;
      }
      v2 = v4;
      int v5 = 136315394;
      id v6 = "+[AFSpeakableUtteranceParser parseUserGeneratedMessage:]_block_invoke";
      __int16 v7 = 2082;
      uint64_t v8 = dlerror();
      id v3 = "%s Could not open speech manager dylib: %{public}s";
    }
    _os_log_error_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_ERROR, v3, (uint8_t *)&v5, 0x16u);
  }
}

+ (BOOL)_shouldAutomaticallyProvideFunctions
{
  return 1;
}

@end