@interface NSString(MimeHeaderEncoding)
- (__CFString)mf_decodeMimeHeaderValueWithEncodingHint:()MimeHeaderEncoding;
- (id)mf_decodeMimeHeaderValueWithCharsetHint:()MimeHeaderEncoding;
- (id)mf_encodedHeaderDataWithEncodingHint:()MimeHeaderEncoding;
@end

@implementation NSString(MimeHeaderEncoding)

- (__CFString)mf_decodeMimeHeaderValueWithEncodingHint:()MimeHeaderEncoding
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  [(__CFString *)a1 rangeOfString:@"=?"];
  BOOL v5 = v4 == 0;
  if (v4
    || [(__CFString *)a1 hasPrefix:@"?"]
    && ([(__CFString *)a1 hasSuffix:@"?="] & 1) != 0)
  {
    id v35 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if (!mf_decodeMimeHeaderValueWithEncodingHint__quSet) {
      mf_decodeMimeHeaderValueWithEncodingHint__quSet = (uint64_t)CFCharacterSetCreateWithCharactersInString(0, @"?_");
    }
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:a1];
    [v6 setCharactersToBeSkipped:0];
    v32 = a1;
    v7 = 0;
    char v8 = 0;
    while (([v6 isAtEnd] & 1) == 0)
    {
      if (v5) {
        v9 = @"?";
      }
      else {
        v9 = @"=?";
      }
      v39 = v7;
      int v10 = [v6 scanUpToString:v9 intoString:&v39];
      v11 = v39;

      v7 = v11;
      if (v10)
      {
        if ((v8 & 1) == 0
          || ([MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet],
              v12 = objc_claimAutoreleasedReturnValue(),
              [(__CFString *)v11 stringByTrimmingCharactersInSet:v12],
              v13 = objc_claimAutoreleasedReturnValue(),
              BOOL v14 = [v13 length] == 0,
              v13,
              v12,
              !v14))
        {
          [v35 appendString:v7];
        }
      }
      if (objc_msgSend(v6, "mf_scanUpAndOverString:", v9))
      {
        id v38 = 0;
        int v15 = [v6 scanUpToString:@"?" intoString:&v38];
        v16 = (__CFString *)v38;
        if (v15 && objc_msgSend(v6, "mf_scanUpAndOverString:", @"?"))
        {
          unsigned int v17 = MFEncodingForCharsetWithFallback(v16, a3);
          if (v17 == -1) {
            uint64_t v18 = a3;
          }
          else {
            uint64_t v18 = v17;
          }
          id v37 = 0;
          char v8 = [v6 scanUpToString:@"?" intoString:&v37];
          v33 = (__CFString *)v37;
          if (v8)
          {
            objc_msgSend(v6, "mf_scanUpAndOverString:", @"?");
            uint64_t v19 = [(__CFString *)v33 compare:@"Q" options:1];
            if (!v19) {
              goto LABEL_25;
            }
            if ([(__CFString *)v33 compare:@"B" options:1])
            {
              v20 = MFLogGeneral();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v33;
                _os_log_impl(&dword_1AFB03000, v20, OS_LOG_TYPE_DEFAULT, "#Warning Never heard of a \"%@\" type encoding--treating as unencoded", buf, 0xCu);
              }

LABEL_25:
              int v21 = 0;
              goto LABEL_34;
            }
            int v21 = 1;
LABEL_34:
            while (1)
            {
              objc_msgSend(v6, "mf_nextTokenWithPunctuation:", mf_decodeMimeHeaderValueWithEncodingHint__quSet);
              v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

              if (!v23) {
                break;
              }
              if ([(__CFString *)v23 isEqual:@"_"])
              {

                v23 = @" ";
              }
              else if ([(__CFString *)v23 isEqual:@"?"] {
                     && (objc_msgSend(v6, "mf_scanUpAndOverString:", @"=") & 1) != 0)
              }
              {
                break;
              }
              v24 = (void *)MFCreateDataWithString(v23, SystemEncoding, 0);
              v25 = v24;
              if (v19)
              {
                if (v21)
                {
                  objc_msgSend(v24, "mf_decodeBase64");
                  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v26 = v24;
                }
              }
              else
              {
                objc_msgSend(v24, "mf_decodeQuotedPrintableForText:", 1);
                v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              v27 = v26;
              if (v26)
              {
                v28 = MFCreateStringWithData(v26, v18, 0);
                if (v28 || v18 != a3 && (v28 = MFCreateStringWithData(v27, a3, 0)) != 0)
                {
                  [v35 appendString:v28];
                }
                else
                {
                  v29 = MFLogGeneral();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v41 = v27;
                    _os_log_impl(&dword_1AFB03000, v29, OS_LOG_TYPE_DEFAULT, "#Warning was unable to convert decoded data to a string: %@", buf, 0xCu);
                  }

                  v28 = 0;
                }
              }
              v7 = v23;
            }
          }
          else
          {
            v22 = MFLogGeneral();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v32;
              _os_log_impl(&dword_1AFB03000, v22, OS_LOG_TYPE_DEFAULT, "#Warning Missing encoding char (Q or B) in MIME header: \"%@\"", buf, 0xCu);
            }

            v23 = v7;
          }

          BOOL v5 = 0;
          v7 = v23;
        }
        else
        {
          char v8 = 0;
        }
      }
      else
      {
        char v8 = 0;
        v16 = 0;
      }
    }
    v30 = (__CFString *)v35;
  }
  else
  {
    v30 = a1;
  }
  return v30;
}

- (id)mf_decodeMimeHeaderValueWithCharsetHint:()MimeHeaderEncoding
{
  uint64_t v4 = a3;
  BOOL v5 = objc_msgSend(a1, "mf_decodeMimeHeaderValueWithEncodingHint:", MFEncodingForCharset(v4));

  return v5;
}

- (id)mf_encodedHeaderDataWithEncodingHint:()MimeHeaderEncoding
{
  uint64_t v3 = a3;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if (a3 == -1)
  {
    BOOL v5 = [(__CFString *)a1 mf_bestMimeCharset];
    uint64_t v3 = [v5 cfStringEncoding];
  }
  if (v3 != 1536)
  {
    if (MFStringCanBeConvertedLosslessly(a1, 0x600u))
    {
      uint64_t v3 = 1536;
      goto LABEL_7;
    }
    if (MFStringCanBeConvertedLosslessly(a1, v3))
    {
LABEL_7:
      v6 = +[MFMimeCharset charsetForEncoding:v3];
      if (v6) {
        goto LABEL_9;
      }
    }
  }
  v6 = [(__CFString *)a1 mf_bestMimeCharset];
LABEL_9:
  v74 = v6;
  if ([v6 cfStringEncoding] != 1536
    || (unint64_t)[(__CFString *)a1 length] >= 2
    && ([(__CFString *)a1 hasPrefix:@"=?"] & 1) != 0
    || ([(__CFString *)a1 rangeOfString:@" =?"], v7)
    || ([(__CFString *)a1 rangeOfString:@"\t=?"], v8))
  {
    if ([v74 useBase64InHeaders])
    {
      v75 = 0;
      BOOL v9 = 1;
    }
    else
    {
      int v10 = (void *)MFCreateDataWithString(a1, [v74 cfStringEncoding], 0);
      uint64_t v11 = [v10 length];
      id v12 = v10;
      uint64_t v13 = [v12 bytes];
      v75 = v12;
      if (v11 < 1)
      {
        int v15 = 0;
      }
      else
      {
        BOOL v14 = (char *)v13;
        int v15 = 0;
        unint64_t v16 = v13 + v11;
        uint64_t v17 = MEMORY[0x1E4F14390];
        do
        {
          unsigned int v18 = *v14;
          if ((v18 & 0x80000000) != 0) {
            int v19 = __maskrune(v18, 0x40000uLL);
          }
          else {
            int v19 = *(_DWORD *)(v17 + 4 * v18 + 60) & 0x40000;
          }
          if (!v19) {
            ++v15;
          }
          ++v14;
        }
        while ((unint64_t)v14 < v16);
      }
      BOOL v9 = 3 * v11 < (unint64_t)(4 * v15);
    }
    v20 = (void *)[@"=?" mutableCopyWithZone:0];
    int v21 = [v74 charsetName];
    [v20 appendString:v21];

    [v20 appendString:@"?"];
    if (v9) {
      v22 = @"B";
    }
    else {
      v22 = @"Q";
    }
    [v20 appendString:v22];
    [v20 appendString:@"?"];
    v69 = v20;
    v70 = (void *)MFCreateDataWithString(v20, 0x600u, 0);
    CFStringRef theString = a1;
    if (v9)
    {
      CFStringEncoding v23 = [v74 cfStringEncoding];
      uint64_t v24 = [v70 length];
      id v76 = v75;
      id v78 = v70;
      v25 = (MFBufferedDataConsumer *)[objc_allocWithZone(MEMORY[0x1E4F1CA58]) init];
      unint64_t v26 = 3 * ((unint64_t)(64 - v24) >> 2);
      if (v76 && [v76 length] <= v26)
      {
        [(MFBufferedDataConsumer *)v25 appendData:v78];
        v57 = objc_msgSend(v76, "mf_encodeBase64HeaderData");
        [(MFBufferedDataConsumer *)v25 appendData:v57];

        [(MFBufferedDataConsumer *)v25 mf_appendCString:"?="];
      }
      else
      {
        Mutable = CFDataCreateMutable(0, 3 * ((unint64_t)(64 - v24) >> 2));
        uint64_t v28 = CFStringGetLength(theString);
        CFIndex length = 0xAAAAAAAAAAAAAAAALL;
        if (v28 >= 1)
        {
          CFIndex v29 = 0;
          while (1)
          {
            CFDataSetLength(Mutable, v26);
            MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
            v91.CFIndex location = v29;
            v91.CFIndex length = v28;
            CFIndex Bytes = MFStringGetBytes(theString, v91, v23, 0, 0, MutableBytePtr, v26, &length);
            CFIndex v32 = Bytes;
            if (Bytes < v28)
            {
              CFIndex v33 = Bytes + v29;
              CFIndex location = CFStringGetRangeOfComposedCharactersAtIndex(theString, Bytes + v29).location;
              if (location < v33)
              {
                CFIndex v35 = location - v29;
                if (location > v29)
                {
                  v36 = CFDataGetMutableBytePtr(Mutable);
                  v92.CFIndex location = v29;
                  v92.CFIndex length = v35;
                  MFStringGetBytes(theString, v92, v23, 0, 0, v36, v26, &length);
                  CFIndex v32 = v35;
                }
              }
            }
            if (length > v26) {
              break;
            }
            CFDataSetLength(Mutable, length);
            if ([(MFBufferedDataConsumer *)v25 length]) {
              [(MFBufferedDataConsumer *)v25 mf_appendCString:"\n "];
            }
            [(MFBufferedDataConsumer *)v25 appendData:v78];
            id v37 = [(__CFData *)Mutable mf_encodeBase64HeaderData];
            [(MFBufferedDataConsumer *)v25 appendData:v37];

            [(MFBufferedDataConsumer *)v25 mf_appendCString:"?="];
            BOOL v38 = v28 <= v32;
            v28 -= v32;
            if (v38) {
              CFIndex v39 = 0;
            }
            else {
              CFIndex v39 = v32;
            }
            if (!v38)
            {
              v29 += v39;
              if (v28 > 0) {
                continue;
              }
            }
            goto LABEL_47;
          }
          CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], theString, v23, 0x3Fu);
          v64 = [(__CFData *)ExternalRepresentation ef_hexString];
          v65 = MFLogGeneral();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)extraLength = 134218754;
            *(void *)&extraLength[4] = length;
            __int16 v83 = 2048;
            unint64_t v84 = v26;
            __int16 v85 = 1024;
            CFStringEncoding v86 = v23;
            __int16 v87 = 2112;
            v88 = v64;
            _os_log_error_impl(&dword_1AFB03000, v65, OS_LOG_TYPE_ERROR, "Error during base64 encoding: chunkLength=%ld maxInputBytesPerChunk=%lu encoding=%d str=%@", extraLength, 0x26u);
          }

          CFRelease(ExternalRepresentation);
          CFRelease(Mutable);
          v66 = MFLogGeneral();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT)) {
            -[NSString(MimeHeaderEncoding) mf_encodedHeaderDataWithEncodingHint:](v66);
          }

          v59 = 0;
          v58 = v25;
          goto LABEL_70;
        }
LABEL_47:
        if (Mutable) {
          CFRelease(Mutable);
        }
      }
      v58 = v25;
      v59 = v58;
    }
    else
    {
      CFStringEncoding v77 = [v74 cfStringEncoding];
      uint64_t v40 = [v70 length];
      id v67 = v75;
      id v71 = v70;
      v79 = objc_alloc_init(MFBufferedDataConsumer);
      v72 = [[MFData alloc] initWithBytesNoCopy:"?=" length:2 freeWhenDone:0];
      unint64_t v73 = 64 - v40;
      if (v67
        && (id v41 = v67,
            +[MFQuotedPrintableEncoder requiredSizeToEncodeHeaderBytes:length:](MFQuotedPrintableEncoder, "requiredSizeToEncodeHeaderBytes:length:", [v41 bytes], objc_msgSend(v41, "length")) <= v73))
      {
        [(MFBufferedDataConsumer *)v79 appendData:v71];
        v60 = [(MFBaseFilterDataConsumer *)[MFQuotedPrintableEncoder alloc] initWithConsumer:v79];
        [(MFQuotedPrintableEncoder *)v60 setForHeader:1];
        [(MFQuotedPrintableEncoder *)v60 appendData:v41];
        [(MFQuotedPrintableEncoder *)v60 done];
        [(MFBufferedDataConsumer *)v79 appendData:v72];
      }
      else
      {
        CFIndex v42 = CFStringGetLength(a1);
        v43 = CFDataCreateMutable(0, 0);
        v68 = [[MFData alloc] initWithBytesNoCopy:"\n " length:2 freeWhenDone:0];
        if (v42 >= 1)
        {
          char v44 = 0;
          unint64_t v45 = 0;
          CFIndex v46 = 0;
          CFIndex v47 = 0;
          do
          {
            CFRange RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(theString, v47);
            *(void *)extraLength = 0xAAAAAAAAAAAAAAAALL;
            MFStringGetBytes(theString, RangeOfComposedCharactersAtIndex, v77, 0, 0, 0, 0, (CFIndex *)extraLength);
            CFDataIncreaseLength(v43, *(CFIndex *)extraLength);
            v49 = &CFDataGetMutableBytePtr(v43)[v46];
            MFStringGetBytes(theString, RangeOfComposedCharactersAtIndex, v77, 0, 0, v49, *(CFIndex *)extraLength, 0);
            unint64_t v50 = +[MFQuotedPrintableEncoder requiredSizeToEncodeHeaderBytes:v49 length:*(void *)extraLength];
            v45 += v50;
            if (v45 <= v73)
            {
              CFIndex v46 = CFDataGetLength(v43);
            }
            else
            {
              if (v44) {
                [(MFBufferedDataConsumer *)v79 appendData:v68];
              }
              [(MFBufferedDataConsumer *)v79 appendData:v71];
              v51 = [(MFBaseFilterDataConsumer *)[MFQuotedPrintableEncoder alloc] initWithConsumer:v79];
              [(MFQuotedPrintableEncoder *)v51 setForHeader:1];
              v52 = [[MFData alloc] initWithBytesNoCopy:CFDataGetBytePtr(v43) length:v46 freeWhenDone:0];
              [(MFQuotedPrintableEncoder *)v51 appendData:v52];
              [(MFQuotedPrintableEncoder *)v51 done];
              [(MFBufferedDataConsumer *)v79 appendData:v72];
              v53 = CFDataGetMutableBytePtr(v43);
              memmove(v53, v49, *(size_t *)extraLength);
              CFDataSetLength(v43, *(CFIndex *)extraLength);
              CFIndex v46 = *(void *)extraLength;

              char v44 = 1;
              unint64_t v45 = v50;
            }
            CFIndex v54 = v42 + v47;
            CFIndex v47 = RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length;
            CFIndex v42 = v54 - (RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length);
          }
          while (v42 > 0);
          if (v46)
          {
            if (v44) {
              [(MFBufferedDataConsumer *)v79 appendData:v68];
            }
            [(MFBufferedDataConsumer *)v79 appendData:v71];
            v55 = [(MFBaseFilterDataConsumer *)[MFQuotedPrintableEncoder alloc] initWithConsumer:v79];
            [(MFQuotedPrintableEncoder *)v55 setForHeader:1];
            v56 = [[MFData alloc] initWithBytesNoCopy:CFDataGetBytePtr(v43) length:v46 freeWhenDone:0];
            [(MFQuotedPrintableEncoder *)v55 appendData:v56];
            [(MFQuotedPrintableEncoder *)v55 done];
            [(MFBufferedDataConsumer *)v79 appendData:v72];
          }
        }
        if (v43) {
          CFRelease(v43);
        }
      }
      [(MFBufferedDataConsumer *)v79 done];
      v59 = [(MFBufferedDataConsumer *)v79 data];

      v58 = v79;
    }
LABEL_70:

    id v61 = v59;
    goto LABEL_71;
  }
  id v61 = (id)MFCreateDataWithString(a1, [v74 cfStringEncoding], 0);
LABEL_71:

  return v61;
}

- (void)mf_encodedHeaderDataWithEncodingHint:()MimeHeaderEncoding .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AFB03000, log, OS_LOG_TYPE_FAULT, "Error during base64 encoding, check logs for more information (<rdar://problem/27502664>)", v1, 2u);
}

@end