@interface DMCHTTPLog
+ (id)_logDirectoryForIdentifier:(id)a3;
+ (void)_writeRequestLogToURL:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7;
+ (void)logHTTPDetailsForIdentifier:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7;
+ (void)logHTTPDetailsForIdentifier:(id)a3 request:(id)a4 response:(id)a5 responseURL:(id)a6 responseError:(id)a7;
@end

@implementation DMCHTTPLog

+ (void)logHTTPDetailsForIdentifier:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (+[DMCFeatureOverrides useHTTPLogging])
  {
    v16 = [a1 _logDirectoryForIdentifier:v17];
    if (v16) {
      [a1 _writeRequestLogToURL:v16 request:v12 response:v13 responseData:v14 responseError:v15];
    }
  }
}

+ (void)logHTTPDetailsForIdentifier:(id)a3 request:(id)a4 response:(id)a5 responseURL:(id)a6 responseError:(id)a7
{
  id v20 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (+[DMCFeatureOverrides useHTTPLogging])
  {
    v16 = NSString;
    id v17 = [v14 absoluteString];
    v18 = [v16 stringWithFormat:@"Downloaded data to file: %@", v17];

    v19 = [v18 dataUsingEncoding:4];
    [a1 logHTTPDetailsForIdentifier:v20 request:v12 response:v13 responseData:v19 responseError:v15];
  }
}

+ (void)_writeRequestLogToURL:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v79 = a5;
  id v78 = a6;
  id v80 = a7;
  id v13 = (void *)MEMORY[0x1E4F28D48];
  id v14 = objc_opt_new();
  id v15 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v16 = [v13 stringFromDate:v14 timeZone:v15 formatOptions:3955];

  id v17 = NSString;
  v18 = v12;
  v19 = [v12 HTTPMethod];
  id v20 = [v17 stringWithFormat:@"%@-%@.txt", v16, v19];

  v81 = v11;
  v21 = [v11 URLByAppendingPathComponent:v20 isDirectory:0];
  for (uint64_t i = 1; ; ++i)
  {
    v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    v24 = [v21 path];
    int v25 = [v23 fileExistsAtPath:v24];

    if (!v25 || (unint64_t)(i - 1) > 0x63) {
      break;
    }
    v26 = NSString;
    v27 = [v18 HTTPMethod];
    uint64_t v28 = [v26 stringWithFormat:@"%@-%@-%lu.txt", v16, v27, i];

    uint64_t v29 = [v11 URLByAppendingPathComponent:v28 isDirectory:0];

    v21 = (void *)v29;
    id v20 = (void *)v28;
  }
  v30 = [MEMORY[0x1E4F28CB8] defaultManager];
  v31 = [v21 path];
  char v32 = [v30 createFileAtPath:v31 contents:0 attributes:0];

  if (v32)
  {
    id v90 = 0;
    v33 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:v21 error:&v90];
    id v34 = v90;
    if (v33)
    {
      v35 = [MEMORY[0x1E4F1CA48] array];
      [v35 addObject:@"<<<<< Request"];
      v75 = v34;
      v36 = NSString;
      v37 = [v18 HTTPMethod];
      [v18 URL];
      uint64_t v38 = v77 = v33;
      v39 = [(id)v38 path];
      v40 = [v36 stringWithFormat:@"%@ %@ HTTP/1.1", v37, v39];
      [v35 addObject:v40];

      v41 = [v18 allHTTPHeaderFields];
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __80__DMCHTTPLog__writeRequestLogToURL_request_response_responseData_responseError___block_invoke;
      v88[3] = &unk_1E5CFDD88;
      id v42 = v35;
      id v89 = v42;
      [v41 enumerateKeysAndObjectsUsingBlock:v88];

      [v42 addObject:@"\n"];
      v43 = [v42 componentsJoinedByString:@"\n"];
      v44 = [v43 dataUsingEncoding:4];
      id v87 = 0;
      LOBYTE(v38) = [v77 writeData:v44 error:&v87];
      id v45 = v87;

      if ((v38 & 1) == 0)
      {
        v46 = *DMCLogObjects();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v92 = v21;
          __int16 v93 = 2112;
          id v94 = v45;
          _os_log_impl(&dword_1A7863000, v46, OS_LOG_TYPE_ERROR, "Could not write HTTP request headers to file %@: %@", buf, 0x16u);
        }
      }
      uint64_t v47 = [v18 HTTPBody];
      v48 = v79;
      v76 = (void *)v47;
      if (v47)
      {
        id v86 = 0;
        char v49 = [v77 writeData:v47 error:&v86];
        id v50 = v86;
        v51 = v45;
        id v45 = v50;

        if ((v49 & 1) == 0)
        {
          v52 = *DMCLogObjects();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v92 = v21;
            __int16 v93 = 2112;
            id v94 = v45;
            _os_log_impl(&dword_1A7863000, v52, OS_LOG_TYPE_ERROR, "Could not write HTTP request body to file %@: %@", buf, 0x16u);
          }
        }
      }
      v73 = v45;
      v53 = [MEMORY[0x1E4F1CA48] array];

      [v53 addObject:@"\n>>>>> Response"];
      if (v79)
      {
        v54 = NSString;
        uint64_t v55 = [v79 statusCode];
        v56 = objc_msgSend(MEMORY[0x1E4F28D20], "localizedStringForStatusCode:", objc_msgSend(v79, "statusCode"));
        v57 = [v54 stringWithFormat:@"HTTP/1.1 %ld %@", v55, v56];
        [v53 addObject:v57];

        v58 = [v79 allHeaderFields];
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __80__DMCHTTPLog__writeRequestLogToURL_request_response_responseData_responseError___block_invoke_37;
        v84[3] = &unk_1E5CFDD88;
        id v59 = v53;
        id v85 = v59;
        [v58 enumerateKeysAndObjectsUsingBlock:v84];

        [v59 addObject:@"\n"];
      }
      else if (v80)
      {
        [v53 addObject:@"--- Error ---"];
        v64 = [v80 description];
        [v53 addObject:v64];
      }
      else
      {
        [v53 addObject:@"--- Unknown Error ---"];
      }
      v65 = [v53 componentsJoinedByString:@"\n"];
      v66 = [v65 dataUsingEncoding:4];
      id v83 = 0;
      char v67 = [v77 writeData:v66 error:&v83];
      id v34 = v83;

      if ((v67 & 1) == 0)
      {
        v68 = *DMCLogObjects();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v92 = v21;
          __int16 v93 = 2112;
          id v94 = v34;
          _os_log_impl(&dword_1A7863000, v68, OS_LOG_TYPE_ERROR, "Could not write HTTP response headers to file %@: %@", buf, 0x16u);
        }
      }
      v62 = v78;
      if (v78)
      {
        v74 = v53;
        id v82 = 0;
        v33 = v77;
        char v69 = [v77 writeData:v78 error:&v82];
        id v70 = v82;

        if ((v69 & 1) != 0 || (v71 = *DMCLogObjects(), !os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)))
        {
          id v34 = v70;
        }
        else
        {
          *(_DWORD *)buf = 138412546;
          v92 = v21;
          __int16 v93 = 2112;
          id v94 = v70;
          v72 = v71;
          id v34 = v70;
          _os_log_impl(&dword_1A7863000, v72, OS_LOG_TYPE_ERROR, "Could not write HTTP response body to file %@: %@", buf, 0x16u);
        }
        v53 = v74;
      }
      else
      {
        v33 = v77;
      }
      [v33 closeFile];
    }
    else
    {
      v63 = *DMCLogObjects();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v92 = v21;
        __int16 v93 = 2112;
        id v94 = v34;
        _os_log_impl(&dword_1A7863000, v63, OS_LOG_TYPE_ERROR, "Could not open HTTP request log file %@: %@", buf, 0x16u);
      }
      v62 = v78;
      v48 = v79;
    }
    v61 = v80;
  }
  else
  {
    v60 = *DMCLogObjects();
    v61 = v80;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v92 = v21;
      _os_log_impl(&dword_1A7863000, v60, OS_LOG_TYPE_ERROR, "Could not create HTTP request log file %@", buf, 0xCu);
    }
    id v34 = 0;
    v62 = v78;
    v48 = v79;
  }
}

void __80__DMCHTTPLog__writeRequestLogToURL_request_response_responseData_responseError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [NSString stringWithFormat:@"%@: %@", a2, a3];
  [v3 addObject:v4];
}

void __80__DMCHTTPLog__writeRequestLogToURL_request_response_responseData_responseError___block_invoke_37(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [NSString stringWithFormat:@"%@: %@", a2, a3];
  [v3 addObject:v4];
}

+ (id)_logDirectoryForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a3;
  v5 = [v3 fileURLWithPath:@"/tmp/DMCHTTPLogs"];
  v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:1];

  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = 0;
  int v8 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v9 = v13;

  if (v8)
  {
    id v10 = v6;
  }
  else
  {
    id v11 = *DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_ERROR, "Could not create HTTP logs directory %@: %@", buf, 0x16u);
    }
    id v10 = 0;
  }

  return v10;
}

@end