@interface SGAhoCorasick
- (BOOL)existsInString:(id)a3;
- (SGAhoCorasick)initWithBytecode:(id)a3;
@end

@implementation SGAhoCorasick

- (void).cxx_destruct
{
}

- (BOOL)existsInString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v29 = 0;
    goto LABEL_57;
  }
  v6 = [(NSData *)self->_bytecode bytes];
  if (!v6)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"SGAhoCorasick.m", 59, @"Invalid parameter not satisfying: %@", @"bytecode" object file lineNumber description];
  }
  v7 = (__CFString *)v5;
  v8 = self;

  if (!v8)
  {
    BOOL v29 = 0;
    goto LABEL_56;
  }
  id v32 = v5;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v35 = 0u;
  CFIndex Length = CFStringGetLength(v7);
  CFStringRef theString = v7;
  uint64_t v45 = 0;
  CFIndex v46 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v7);
  CStringPtr = 0;
  v43 = (UniChar *)CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  }
  int64_t v47 = 0;
  int64_t v48 = 0;
  v44 = CStringPtr;
  if (Length < 1)
  {
LABEL_54:
    BOOL v29 = 0;
    goto LABEL_55;
  }
  LOWORD(v12) = 0;
  int64_t v13 = 0;
  CFIndex v33 = Length;
  while (1)
  {
    CFIndex v14 = v46;
    if (v46 <= v13)
    {
      UniChar v17 = 0;
    }
    else
    {
      v15 = v43;
      if (v43)
      {
        int64_t v16 = v45 + v13;
LABEL_12:
        UniChar v17 = v15[v16];
        goto LABEL_14;
      }
      if (!v44)
      {
        int64_t v26 = v47;
        if (v48 <= v13 || v47 > v13)
        {
          int64_t v28 = v13 - 4;
          if ((unint64_t)v13 < 4) {
            int64_t v28 = 0;
          }
          if (v28 + 64 < v46) {
            CFIndex v14 = v28 + 64;
          }
          int64_t v47 = v28;
          int64_t v48 = v14;
          v49.location = v45 + v28;
          v49.length = v14 - v28;
          CFStringGetCharacters(theString, v49, buffer);
          int64_t v26 = v47;
        }
        int64_t v16 = v13 - v26;
        v15 = buffer;
        goto LABEL_12;
      }
      UniChar v17 = v44[v45 + v13];
    }
LABEL_14:
    uint64_t endPtr = self->_endPtr;
    if (self->_endPtr) {
      break;
    }
LABEL_34:
    [MEMORY[0x1E4F1CA00] raise:@"SGAhoCorasickMaxIter" format:@"Exceeded iteration limit"];
LABEL_39:
    if (++v13 == v33) {
      goto LABEL_54;
    }
  }
  unsigned int v19 = 0;
  while (1)
  {
    if ((unsigned __int16)v12 >= (unsigned __int16)endPtr) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"SGAhoCorasickBoundsCheck", @"Node %u beyond bound %u", (unsigned __int16)v12, endPtr);
    }
    int v20 = v6[2 * (unsigned __int16)v12 + 1];
    int v21 = 1;
    if (v20 >= 2)
    {
      do
      {
        uint64_t v22 = self->_endPtr;
        if (v22 <= (unsigned __int16)(v12 + ((v20 + v21) >> 1))) {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"SGAhoCorasickBoundsCheck", @"Node %u beyond bound %u", (unsigned __int16)(v12 + ((v20 + v21) >> 1)), v22);
        }
        if (v6[2 * (unsigned __int16)(v12 + ((v20 + v21) >> 1))] >= v17) {
          int v20 = (v20 + v21) >> 1;
        }
        else {
          int v21 = ((v20 + v21) >> 1) + 1;
        }
      }
      while (v21 < v20);
    }
    if (v21 == v20)
    {
      unsigned __int16 v23 = v12 + v21;
      uint64_t v24 = self->_endPtr;
      if (v24 <= v23) {
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"SGAhoCorasickBoundsCheck", @"Node %u beyond bound %u", v23, v24);
      }
      if (v6[2 * v23] == v17) {
        break;
      }
    }
    if (!(_WORD)v12)
    {
      LOWORD(v12) = 0;
      goto LABEL_39;
    }
    uint64_t v25 = self->_endPtr;
    if (v25 <= (unsigned __int16)v12) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"SGAhoCorasickBoundsCheck", @"Node %u beyond bound %u", (unsigned __int16)v12, v25);
    }
    int v12 = v6[2 * (unsigned __int16)v12];
    if (v12 == 0xFFFF) {
      goto LABEL_53;
    }
    ++v19;
    uint64_t endPtr = self->_endPtr;
    if (v19 >= endPtr) {
      goto LABEL_34;
    }
  }
  int v12 = v6[2 * v23 + 1];
  if (v12 != 0xFFFF) {
    goto LABEL_39;
  }
LABEL_53:
  BOOL v29 = 1;
LABEL_55:
  id v5 = v32;
LABEL_56:

LABEL_57:
  return v29;
}

- (SGAhoCorasick)initWithBytecode:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGAhoCorasick.m", 40, @"Invalid parameter not satisfying: %@", @"bytecode" object file lineNumber description];
  }
  if (![v6 length])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGAhoCorasick.m", 41, @"Invalid parameter not satisfying: %@", @"bytecode.length > 0" object file lineNumber description];
  }
  if (([v6 length] & 3) != 0)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGAhoCorasick.m", 42, @"Invalid parameter not satisfying: %@", @"bytecode.length % sizeof(op_t) == 0" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SGAhoCorasick;
  v7 = [(SGAhoCorasick *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_bytecode, a3);
    v8->_uint64_t endPtr = (unint64_t)[v6 length] >> 2;
  }

  return v8;
}

@end