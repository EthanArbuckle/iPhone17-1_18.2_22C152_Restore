@interface CalDAVTrafficLogScrubber
+ (BOOL)redactLog:(id)a3 toOutputFile:(id)a4 context:(id)a5;
+ (BOOL)sortICSDocuments;
+ (id)log;
+ (void)setSortICSDocuments:(BOOL)a3;
- (BOOL)scrub;
- (CADDiagnosticLogContext)context;
- (CalDAVTrafficLogScrubber)init;
- (NSURL)inputURL;
- (NSURL)outputURL;
- (id)decompressedInputFile;
- (id)temporaryUncompressedFile;
- (void)cleanUp;
- (void)compressFileAt:(id)a3 to:(id)a4;
- (void)decompressedInputFile;
- (void)scrub;
- (void)setContext:(id)a3;
- (void)setInputURL:(id)a3;
- (void)setOutputURL:(id)a3;
@end

@implementation CalDAVTrafficLogScrubber

+ (id)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)log_log;
  return v2;
}

uint64_t __31__CalDAVTrafficLogScrubber_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar", "CalDAVTrafficLogScrubber");
  log_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

+ (BOOL)sortICSDocuments
{
  return _sortICSDocuments;
}

+ (void)setSortICSDocuments:(BOOL)a3
{
  _sortICSDocuments = a3;
}

+ (BOOL)redactLog:(id)a3 toOutputFile:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(CalDAVTrafficLogScrubber);
  [(CalDAVTrafficLogScrubber *)v10 setContext:v7];
  [(CalDAVTrafficLogScrubber *)v10 setInputURL:v9];

  [(CalDAVTrafficLogScrubber *)v10 setOutputURL:v8];
  if ([(CalDAVTrafficLogScrubber *)v10 scrub])
  {
    [(CalDAVTrafficLogScrubber *)v10 cleanUp];
    int v11 = [v7 canceled] ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (CalDAVTrafficLogScrubber)init
{
  v6.receiver = self;
  v6.super_class = (Class)CalDAVTrafficLogScrubber;
  v2 = [(CalDAVTrafficLogScrubber *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    urlsToCleanUp = v2->_urlsToCleanUp;
    v2->_urlsToCleanUp = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)cleanUp
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_urlsToCleanUp;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[CADDiagnosticLogContext deleteTemporaryFile:](self->_context, "deleteTemporaryFile:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_urlsToCleanUp removeAllObjects];
}

- (BOOL)scrub
{
  v2 = self;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CalDAVTrafficLogScrubber *)self decompressedInputFile];
  uint64_t v4 = [(CalDAVTrafficLogScrubber *)v2 temporaryUncompressedFile];
  [(NSMutableArray *)v2->_urlsToCleanUp addObject:v4];
  uint64_t v5 = [(CalDAVTrafficLogScrubber *)v2 context];
  [v5 log:@"Redacting log at %@...", v3];

  if (!v3) {
    goto LABEL_89;
  }
  id v6 = [v3 path];
  uint64_t v7 = fopen((const char *)[v6 fileSystemRepresentation], "r");

  if (!v7)
  {
    long long v8 = +[CalDAVTrafficLogScrubber log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CalDAVTrafficLogScrubber scrub]();
    }
  }
  v70 = v4;
  v71 = v2;
  v69 = v3;
  id v9 = [v4 path];
  long long v10 = fopen((const char *)[v9 fileSystemRepresentation], "w");

  if (v10)
  {
    if (v7)
    {
      if ([(CADDiagnosticLogContext *)v2->_context canceled]) {
        goto LABEL_84;
      }
      v72 = v7;
      while (1)
      {
        long long v11 = (void *)MEMORY[0x1C1867850]();
        int v12 = writeNextTaskHeader(v7, v10);
        int v13 = v12;
        if (v12 != 1) {
          break;
        }
        if (writeRequest_onceToken != -1) {
          dispatch_once(&writeRequest_onceToken, &__block_literal_global_289);
        }
        v38 = readFromFileUntilStringAndReturnData(v7, "\n", 0);
        v39 = v38;
        if (!v38)
        {
          fputs("Failed to parse request.\n", v10);
          goto LABEL_51;
        }
        v40 = v11;
        uint64_t v41 = [v38 rangeOfString:@" "];
        if (v41 == 0x7FFFFFFFFFFFFFFFLL)
        {
          fprintf(v10, "Request line (length %lu) did not have a space.\n", [v39 length]);
LABEL_51:

          goto LABEL_52;
        }
        uint64_t v49 = v41;
        uint64_t v50 = v42;
        v51 = [v39 substringToIndex:v41];
        char v78 = [(id)writeRequest_knownMethods containsObject:v51];
        if (v78)
        {
          fputNSString(v10, v51);
          id v52 = v51;
          fputc(32, v10);
          v53 = [v39 substringFromIndex:v49 + v50];
          v54 = CalRedactURLString();
          fputNSString(v10, v54);
          fputc(10, v10);
        }
        else
        {
          fprintf(v10, "Request with unknown method. (Method length=%lu, line length=%lu)\n", [v51 length], objc_msgSend(v39, "length"));
          id v52 = 0;
        }
        long long v11 = v40;
        int v13 = 1;

        id v14 = v52;
        if (v78) {
          goto LABEL_14;
        }
LABEL_62:
      }
      if (v12 == 2)
      {
        v43 = readFromFileUntilStringAndReturnData(v7, "\n", 0);
        v44 = "Unparseable response status length %lu; no HTTP version\n";
        if (![v43 hasPrefix:@"HTTP/"]
          || (uint64_t v45 = [v43 rangeOfString:@" "],
              v44 = "Unparseable response status length %lu; no code\n",
              v45 == 0x7FFFFFFFFFFFFFFFLL)
          || (uint64_t v47 = objc_msgSend(v43, "rangeOfString:options:range:", @" ("), 0, v45 + v46, objc_msgSend(v43, "length") - (v45 + v46), v44 = "Unparseable response status length %lu; no space after code\n",
              v47 == 0x7FFFFFFFFFFFFFFFLL))
        {
          fprintf(v10, v44, [v43 length]);
          goto LABEL_48;
        }
        uint64_t v59 = v47;
        uint64_t v60 = v48;
        if (writeHttpStatus_onceToken != -1) {
          dispatch_once(&writeHttpStatus_onceToken, &__block_literal_global_399);
        }
        v61 = objc_msgSend(v43, "substringWithRange:", 5, v59 - 5);
        if ([v61 rangeOfCharacterFromSet:writeHttpStatus_disallowedCharacters] != 0x7FFFFFFFFFFFFFFFLL) {
          fprintf(v10, "Unparseable response status length %lu; http version or response code (length %lu) contained things that are not numbers\n",
        }
            [v43 length],
            [v61 length]);
        if (([v43 hasSuffix:@""]) & 1) == 0)
        {
          fprintf(v10, "Unparseable response status length %lu; no \")\" at end of line\n", [v43 length]);
          goto LABEL_80;
        }
        uint64_t v62 = v59 + v60;
        v63 = [v43 substringToIndex:v59 + v60];
        fputNSString(v10, v63);
        v64 = objc_msgSend(v43, "substringWithRange:", v62, objc_msgSend(v43, "length") + ~v62);
        if ([(id)writeHttpStatus_expectedStatusDescriptions containsObject:v64]) {
          fputNSString(v10, v64);
        }
        else {
          fprintf(v10, "<unexpected description length %lu>", [v64 length]);
        }
        fputs(")\n", v10);
        int v65 = fgetc(v7);
        if (v65 == -1) {
          goto LABEL_79;
        }
        if (v65 != 10)
        {
          ungetc(v65, v7);
LABEL_79:
          fputs("[Parse failure: missing newline]\n", v10);

LABEL_80:
LABEL_48:

LABEL_52:
          id v14 = 0;
          goto LABEL_62;
        }
      }
      else if (!v12)
      {
        goto LABEL_84;
      }
      id v14 = 0;
LABEL_14:
      v75 = v11;
      if (getHeaderRedactionBehaviors_onceToken != -1) {
        dispatch_once(&getHeaderRedactionBehaviors_onceToken, &__block_literal_global_560);
      }
      id v15 = (id)getHeaderRedactionBehaviors_headerRedactionBehaviors;
      v16 = readFromFileUntilStringAndReturnData(v7, "\n\n", 0);
      if (!v16)
      {
        fputs("[Parse failure: Failed to parse headers]\n", v10);

        goto LABEL_62;
      }
      v77 = v15;
      v73 = v16;
      v74 = v14;
      int v76 = v13;
      v17 = [v16 componentsSeparatedByString:@"\n"];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v79 objects:v83 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v80;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v80 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v79 + 1) + 8 * i);
            if ([v22 length])
            {
              uint64_t v23 = [v22 rangeOfString:@": "];
              if (v23 == 0x7FFFFFFFFFFFFFFFLL)
              {
                fprintf(v10, "[Parse failure: unparseable header of length %lu]\n", [v22 length]);
              }
              else
              {
                uint64_t v25 = v23;
                uint64_t v26 = v24;
                v27 = [v22 substringToIndex:v23];
                fputNSString(v10, v27);
                fputs(": ", v10);
                v28 = [v22 substringFromIndex:v25 + v26];
                v29 = [v27 lowercaseString];
                v30 = [v77 objectForKeyedSubscript:v29];
                int v31 = [v30 integerValue];

                v32 = CalRedactString(v31, v28);
                fputNSString(v10, v32);
                fputc(10, v10);
              }
            }
            else
            {
              fputc(10, v10);
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v79 objects:v83 count:16];
        }
        while (v19);
      }
      fputc(10, v10);

      id v14 = v74;
      uint64_t v7 = v72;
      if (checkForString(v72, "[compression: gzip]\n", 1)) {
        fputs("[compression: gzip]\n", v10);
      }
      char v33 = checkForString(v72, "\nTask ", 0);
      if (v76 == 1) {
        v34 = "\n>>>>>\n";
      }
      else {
        v34 = "\n<<<<<\n";
      }
      long long v11 = v75;
      if (v33)
      {
LABEL_61:
        fputs(v34, v10);

        goto LABEL_62;
      }
      int v35 = fgetc(v72);
      ungetc(v35, v72);
      if (v35 != 60 && (v35 == 66 || [v14 isEqualToString:@"PUT"]))
      {
        v36 = readFromFileUntilStringAndReturnData(v72, v34, 0);
        v37 = CalRedactString(3, v36);
        fputNSString(v10, v37);
      }
      else
      {
        v36 = readFromFileUntilStringAndReturnData(v72, v34, 1);
        if (![v36 length])
        {
LABEL_60:

          goto LABEL_61;
        }
        id v55 = v14;
        v37 = (void *)[objc_alloc(MEMORY[0x1E4F29250]) initWithData:v36];
        [v37 setShouldProcessNamespaces:1];
        v56 = objc_alloc_init(CalXMLSanitizer);
        [(CalXMLSanitizer *)v56 setOutput:v10];
        [v37 setDelegate:v56];
        char v57 = [v37 parse];
        v58 = [(CalXMLSanitizer *)v56 scrubbedXML];
        fputNSString(v10, v58);

        if ((v57 & 1) == 0) {
          fputNSString(v10, @"[Parse failure: -[NSXMLParser parse] returned NO]\n");
        }

        id v14 = v55;
      }

      goto LABEL_60;
    }
  }
  else
  {
    v66 = +[CalDAVTrafficLogScrubber log];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      -[CalDAVTrafficLogScrubber scrub]();
    }

    if (v7) {
LABEL_84:
    }
      fclose(v7);
    if (!v10) {
      goto LABEL_87;
    }
  }
  fclose(v10);
LABEL_87:
  v2 = v71;
  uint64_t v3 = v69;
  uint64_t v4 = v70;
  if (([(CADDiagnosticLogContext *)v71->_context canceled] & 1) == 0) {
    +[CADDiagnosticsUtils compressFileAt:v70 to:v71->_outputURL context:v71->_context];
  }
LABEL_89:
  v67 = [(CalDAVTrafficLogScrubber *)v2 context];
  [v67 log:@"...finished redacting log from %@", v3];

  return 1;
}

- (id)temporaryUncompressedFile
{
  uint64_t v3 = [(NSURL *)self->_outputURL URLByDeletingPathExtension];
  uint64_t v4 = [v3 lastPathComponent];

  uint64_t v5 = [v4 stringByAppendingString:@"~temp"];

  id v6 = [(CADDiagnosticLogContext *)self->_context temporaryFileForName:v5];

  return v6;
}

- (id)decompressedInputFile
{
  v2 = (id *)MEMORY[0x1F4188790](self);
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = v2 + 2;
  uint64_t v4 = [v2[2] pathExtension];
  char v5 = [v4 isEqualToString:@"gz"];

  if ((v5 & 1) == 0)
  {
    id v17 = *v3;
    goto LABEL_45;
  }
  id v6 = [v2[3] URLByDeletingPathExtension];
  uint64_t v7 = [v6 lastPathComponent];

  v36 = (void *)v7;
  long long v8 = [v2[4] temporaryFileForName:v7];
  id v9 = [v2[2] path];
  long long v10 = [v8 path];
  id v11 = v9;
  id v12 = v10;
  memset(&strm.avail_out + 1, 0, 76);
  *(_OWORD *)&strm.avail_in = 0u;
  strm.next_in = v43;
  strm.next_out = __ptr;
  strm.avail_in = 0;
  strm.avail_out = 0x8000;
  id v35 = v11;
  int v13 = fopen((const char *)[v35 fileSystemRepresentation], "r");
  id v14 = v12;
  id v15 = fopen((const char *)[v14 fileSystemRepresentation], "w");
  if (!inflateInit2_(&strm, 47, "1.2.12", 112))
  {
    v34 = v2;
    char v33 = &v41;
    char v18 = 1;
    next_in = strm.next_in;
    while (1)
    {
      if (next_in != v43) {
        -[CalDAVTrafficLogScrubber decompressedInputFile].cold.4();
      }
      size_t v20 = fread(&v43[strm.avail_in], 1uLL, 0x8000 - strm.avail_in, v13);
      if (v20) {
        break;
      }
      int v26 = ferror(v13);
      if (v26)
      {
        int v27 = v26;
        v28 = +[CalDAVTrafficLogScrubber log];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v41 = v27;
          _os_log_error_impl(&dword_1BBC88000, v28, OS_LOG_TYPE_ERROR, "error reading file: %i", buf, 8u);
        }
LABEL_31:

        char v18 = 0;
      }
      else if (strm.avail_in)
      {
        goto LABEL_10;
      }
LABEL_32:
      char v21 = 1;
LABEL_33:
      if (strm.next_in == v43)
      {
        v16 = +[CalDAVTrafficLogScrubber log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          [(CalDAVTrafficLogScrubber *)buf decompressedInputFile];
        }
        goto LABEL_40;
      }
      next_in = v43;
      __memmove_chk();
      strm.next_in = v43;
      if (v21)
      {
        inflateEnd(&strm);
        fclose(v13);
        fclose(v15);

        v30 = v8;
        v29 = v36;
        if (v18)
        {
          [v34[1] addObject:v8];
          id v17 = v8;
          goto LABEL_44;
        }
        goto LABEL_41;
      }
    }
    strm.avail_in += v20;
LABEL_10:
    char v21 = 0;
    while (1)
    {
      int v22 = inflate(&strm, 0);
      if (v22)
      {
        int v23 = v22;
        if (v22 == 1)
        {
          char v24 = 0;
        }
        else
        {
          uint64_t v25 = +[CalDAVTrafficLogScrubber log];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            int v41 = v23;
            _os_log_error_impl(&dword_1BBC88000, v25, OS_LOG_TYPE_ERROR, "zlib gave an error: %i", buf, 8u);
          }

          char v18 = 0;
          char v24 = 1;
        }
        char v21 = 1;
      }
      else
      {
        char v24 = 1;
      }
      if (strm.avail_out >> 15) {
        goto LABEL_33;
      }
      if (fwrite(__ptr, 0x8000 - strm.avail_out, 1uLL, v15) != 1)
      {
        v28 = +[CalDAVTrafficLogScrubber log];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          [(CalDAVTrafficLogScrubber *)v38 decompressedInputFile];
        }
        goto LABEL_31;
      }
      if (v21)
      {
        if ((v24 & 1) == 0) {
          goto LABEL_32;
        }
      }
      else
      {
        strm.next_out = __ptr;
        strm.avail_out = 0x8000;
        if (!strm.avail_in)
        {
          char v21 = 0;
          goto LABEL_33;
        }
      }
    }
  }
  v16 = +[CalDAVTrafficLogScrubber log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[CalDAVTrafficLogScrubber decompressedInputFile].cold.5();
  }
LABEL_40:
  v30 = v8;
  v29 = v36;

  inflateEnd(&strm);
  fclose(v13);
  fclose(v15);

LABEL_41:
  int v31 = +[CalDAVTrafficLogScrubber log];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    [(CalDAVTrafficLogScrubber *)(uint64_t *)v3 decompressedInputFile];
  }

  id v17 = 0;
LABEL_44:

LABEL_45:
  return v17;
}

- (void)compressFileAt:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 path];
  long long v8 = fopen((const char *)[v7 fileSystemRepresentation], "r");

  if (!v8)
  {
    id v9 = +[CalDAVTrafficLogScrubber log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CalDAVTrafficLogScrubber scrub]();
    }
  }
  id v10 = [v6 path];
  id v11 = fopen((const char *)[v10 fileSystemRepresentation], "w");

  if (!v11)
  {
    id v12 = +[CalDAVTrafficLogScrubber log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CalDAVTrafficLogScrubber scrub]();
    }
  }
  if (CPFileCompressionZDeflate())
  {
    int v13 = +[CalDAVTrafficLogScrubber log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CalDAVTrafficLogScrubber compressFileAt:to:]();
    }
  }
  if (v8) {
    fclose(v8);
  }
  if (v11) {
    fclose(v11);
  }
}

- (NSURL)inputURL
{
  return self->_inputURL;
}

- (void)setInputURL:(id)a3
{
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
}

- (CADDiagnosticLogContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_inputURL, 0);
  objc_storeStrong((id *)&self->_urlsToCleanUp, 0);
}

- (void)scrub
{
  OUTLINED_FUNCTION_5_0();
  __error();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BBC88000, v0, v1, "Failed to open input file \"%@\": %{errno}d", v2, v3, v4, v5, v6);
}

- (void)decompressedInputFile
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_1BBC88000, v0, v1, "Error initializing inflate: %i", v2);
}

- (void)compressFileAt:to:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_1BBC88000, v0, v1, "Compressing file failed: %i", v2);
}

@end