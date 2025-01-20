@interface NSString(SGNSString)
- (_SGNSStringEncodingEnumerator)sg_dataEnumeratorUsingEncoding:()SGNSString nullTerminated:;
- (id)sg_md5Hash;
- (uint64_t)sg_dataEnumeratorUsingEncoding:()SGNSString;
- (uint64_t)sg_streamBytesUsingEncoding:()SGNSString toBlock:;
- (void)sg_streamBytesUsingEncoding:()SGNSString nullTerminated:toBlock:;
@end

@implementation NSString(SGNSString)

- (id)sg_md5Hash
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = (const char *)[a1 UTF8String];
  *(void *)md = 0;
  uint64_t v7 = 0;
  CC_LONG v2 = strlen(v1);
  CC_MD5(v1, v2, md);
  id v3 = [NSString alloc];
  v4 = objc_msgSend(v3, "initWithFormat:", @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X", md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], v7, BYTE1(v7), BYTE2(v7), BYTE3(v7), BYTE4(v7), BYTE5(v7), BYTE6(v7), HIBYTE(v7));

  return v4;
}

- (_SGNSStringEncodingEnumerator)sg_dataEnumeratorUsingEncoding:()SGNSString nullTerminated:
{
  v55[1] = *MEMORY[0x1E4F143B8];
  if (a4 && (nullTerminationSupportedForEncoding(a3) & 1) == 0)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, a1, @"NSString+SGNSString.m", 142, @"Invalid parameter not satisfying: %@", @"nullTerminationSupportedForEncoding(encoding)" object file lineNumber description];
  }
  uint64_t v8 = [(__CFString *)a1 length];
  if (!v8)
  {
    v15 = (void *)MEMORY[0x1A6265250]();
    if ((a4 & 1) == 0)
    {
      v23 = [MEMORY[0x1E4F1CBF0] objectEnumerator];
      goto LABEL_30;
    }
    v21 = nullByteData();
    v55[0] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
    v23 = [v22 objectEnumerator];
    goto LABEL_21;
  }
  uint64_t v9 = v8;
  if (a3 != 10 && a3 != 2483028224 && a3 != 2415919360)
  {
    if (a3 != 4 && a3 != 1) {
      goto LABEL_44;
    }
    v15 = (void *)MEMORY[0x1A6265250]();
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
    if (CStringPtr)
    {
      v25 = CStringPtr;
      v26 = (void *)MEMORY[0x1A6265250]();
      id v27 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_2;
      v49[3] = &unk_1E5B90018;
      v49[4] = a1;
      v28 = (void *)[v27 initWithBytesNoCopy:v25 length:v9 + a4 deallocator:v49];
      v52 = v28;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
      v23 = [v29 objectEnumerator];

      goto LABEL_30;
    }
    if (a3 != 4 || [(__CFString *)a1 fastestEncoding] != 4)
    {
      goto LABEL_44;
    }
    v30 = (void *)MEMORY[0x1A6265250]();
    v21 = [(__CFString *)a1 dataUsingEncoding:4];
    uint64_t v31 = [v21 length];
    if (v31)
    {
      uint64_t v32 = v31;
      v33 = nullByteData();
      uint64_t v34 = v32 - 1;
      uint64_t v35 = objc_msgSend(v21, "rangeOfData:options:range:", v33, 0, v32 - 1, 1);

      if (v35 == 0x7FFFFFFFFFFFFFFFLL) {
        int v36 = 1;
      }
      else {
        int v36 = a4;
      }
      if (v36) {
        uint64_t v34 = v32;
      }
      v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_3;
      v43[3] = &unk_1E5B90040;
      uint64_t v46 = 0;
      uint64_t v47 = v34;
      uint64_t v48 = v32;
      id v38 = v37;
      id v44 = v38;
      id v45 = v21;
      [v45 enumerateByteRangesUsingBlock:v43];
      if (a4 && v35 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v39 = nullByteData();
        [v38 addObject:v39];
      }
      v23 = [v38 objectEnumerator];

      goto LABEL_22;
    }
    if ((a4 & 1) == 0)
    {
      v23 = [MEMORY[0x1E4F1CBF0] objectEnumerator];
      goto LABEL_22;
    }
    v22 = nullByteData();
    v51 = v22;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    v23 = [v41 objectEnumerator];

LABEL_21:
LABEL_22:

LABEL_30:
    goto LABEL_45;
  }
  uint64_t v10 = [(__CFString *)a1 fastestEncoding];
  BOOL v12 = a3 != 2483028224 || v10 != 10;
  if (v10 == a3 || !v12)
  {
    CharactersPtr = CFStringGetCharactersPtr(a1);
    if (CharactersPtr)
    {
      v14 = CharactersPtr;
      v15 = (void *)MEMORY[0x1A6265250]();
      id v16 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke;
      v50[3] = &unk_1E5B90018;
      v50[4] = a1;
      uint64_t v17 = [v16 initWithBytesNoCopy:v14 length:2 * v9 deallocator:v50];
      v18 = (void *)v17;
      if (a3 == 10)
      {
        v19 = bomData();
        v54[0] = v19;
        v54[1] = v18;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
      }
      else
      {
        uint64_t v53 = v17;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
      }
      v23 = [v20 objectEnumerator];

      goto LABEL_30;
    }
  }
LABEL_44:
  v23 = [[_SGNSStringEncodingEnumerator alloc] initWithString:a1 encoding:a3 nullTerminated:a4];
LABEL_45:

  return v23;
}

- (uint64_t)sg_dataEnumeratorUsingEncoding:()SGNSString
{
  uint64_t v5 = nullTerminationSupportedForEncoding(a3);

  return objc_msgSend(a1, "sg_dataEnumeratorUsingEncoding:nullTerminated:", a3, v5);
}

- (void)sg_streamBytesUsingEncoding:()SGNSString nullTerminated:toBlock:
{
  v15 = a5;
  uint64_t v8 = objc_msgSend(a1, "sg_dataEnumeratorUsingEncoding:nullTerminated:", a3, a4);
  id v9 = 0;
  uint64_t v10 = v15;
  while (1)
  {
    v11 = (void *)MEMORY[0x1A6265250](v10);
    BOOL v12 = [v8 nextObject];

    if (!v12) {
      break;
    }
    v13 = (void *)MEMORY[0x1A6265250]();
    id v9 = v12;
    char v14 = v15[2](v15, [v9 bytes], objc_msgSend(v9, "length"));
    if ((v14 & 1) == 0) {
      goto LABEL_6;
    }
  }
  id v9 = 0;
LABEL_6:
}

- (uint64_t)sg_streamBytesUsingEncoding:()SGNSString toBlock:
{
  uint64_t v7 = nullTerminationSupportedForEncoding(a3);

  return objc_msgSend(a1, "sg_streamBytesUsingEncoding:nullTerminated:toBlock:", a3, v7, a4);
}

@end