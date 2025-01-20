@interface _DPDediscoPayloadUploader
- (BOOL)useOHTTP;
- (NSString)baseURL;
- (_DPDediscoPayloadUploader)initWithBaseURL:(id)a3 useOHTTP:(BOOL)a4;
- (id)buildHTTPHeadersWithPayload:(id)a3 withEncoder:(id)a4 withError:(id *)a5;
- (id)createUploadClientWithURL:(id)a3 withHeaders:(id)a4 uploadWithOHTTP:(BOOL)a5;
- (id)uploadPayload:(id)a3 withEncoder:(id)a4;
- (id)uploadWithHTTPBody:(id)a3 withHTTPHeaders:(id)a4 withFullURL:(id)a5;
- (void)setBaseURL:(id)a3;
- (void)setUseOHTTP:(BOOL)a3;
@end

@implementation _DPDediscoPayloadUploader

- (_DPDediscoPayloadUploader)initWithBaseURL:(id)a3 useOHTTP:(BOOL)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_DPDediscoPayloadUploader;
  v8 = [(_DPDediscoPayloadUploader *)&v15 init];
  if (!v8)
  {
LABEL_6:
    v12 = v8;
    goto LABEL_10;
  }
  if ([v7 length])
  {
    p_baseURL = (id *)&v8->_baseURL;
    objc_storeStrong((id *)&v8->_baseURL, a3);
    if ([(NSString *)v8->_baseURL hasSuffix:@"/"])
    {
      uint64_t v10 = objc_msgSend(*p_baseURL, "substringToIndex:", (char *)objc_msgSend(*p_baseURL, "length") - 1);
      id v11 = *p_baseURL;
      id *p_baseURL = (id)v10;
    }
    v8->_useOHTTP = a4;
    goto LABEL_6;
  }
  v13 = +[_DPLog service];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100058784(v13);
  }

  v12 = 0;
LABEL_10:

  return v12;
}

- (id)createUploadClientWithURL:(id)a3 withHeaders:(id)a4 uploadWithOHTTP:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[_DPSubmissionServiceHTTPClient alloc] initWithDomain:v8 retries:0 method:@"PUT" tlsTrustPinningPolicyName:0 defaultHeaders:v7 uploadWithOHTTP:v5];

  return v9;
}

- (id)uploadWithHTTPBody:(id)a3 withHTTPHeaders:(id)a4 withFullURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v46 = 0;
  v47[0] = &v46;
  v47[1] = 0x3032000000;
  v47[2] = sub_1000134F8;
  v47[3] = sub_100013508;
  id v48 = 0;
  if (v8)
  {
    id v11 = +[_DPLog service];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [v8 length];
      *(_DWORD *)buf = 134218242;
      id v50 = v12;
      __int16 v51 = 2112;
      id v52 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Upload via HTTP body size: %lu - uploading to %@", buf, 0x16u);
    }

    v13 = [(_DPDediscoPayloadUploader *)self createUploadClientWithURL:v10 withHeaders:v9 uploadWithOHTTP:[(_DPDediscoPayloadUploader *)self useOHTTP]];
    if (v13)
    {
      v14 = +[NSProcessInfo processInfo];
      [v14 systemUptime];

      objc_super v15 = +[NSString stringWithFormat:@"Timeout uploading: %@", v10];
      uint64_t v16 = +[_DPDediscoError errorWithCode:200 description:v15];
      v17 = *(void **)(v47[0] + 40);
      *(void *)(v47[0] + 40) = v16;

      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100013510;
      v43[3] = &unk_100075208;
      v45 = &v46;
      v18 = dispatch_semaphore_create(0);
      v44 = v18;
      [v13 uploadData:v8 withHeaders:v9 onCompletion:v43];
      dispatch_time_t v19 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v18, v19);
      if (*(void *)(v47[0] + 40))
      {
        v20 = +[_DPLog service];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10005883C();
        }
      }
      else
      {
        v20 = +[_DPLog service];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = v10;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Successfully uploaded DAP report to %@", buf, 0xCu);
        }
      }

      reportCoreAnalyticsUploadEvent();
      id v31 = *(id *)(v47[0] + 40);
    }
    else
    {
      v32 = +[NSString stringWithFormat:@"Failed to create HTTP client"];
      uint64_t v33 = +[_DPDediscoError errorWithCode:201 description:v32];
      v34 = *(void **)(v47[0] + 40);
      *(void *)(v47[0] + 40) = v33;

      v35 = +[_DPLog service];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_1000587C8((uint64_t)v47, v35, v36, v37, v38, v39, v40, v41);
      }

      id v31 = *(id *)(v47[0] + 40);
    }
  }
  else
  {
    v21 = +[NSString stringWithFormat:@"Nothing to upload: serialized report is empty: %@", v10];
    uint64_t v22 = +[_DPDediscoError errorWithCode:201 description:v21];
    v23 = *(void **)(v47[0] + 40);
    *(void *)(v47[0] + 40) = v22;

    v24 = +[_DPLog service];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000587C8((uint64_t)v47, v24, v25, v26, v27, v28, v29, v30);
    }

    id v31 = *(id *)(v47[0] + 40);
  }
  _Block_object_dispose(&v46, 8);

  return v31;
}

- (id)uploadPayload:(id)a3 withEncoder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 getReport];
  id v9 = [v6 getCollectionId];
  if (v8)
  {
    id v10 = +[_DPLog service];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Bypassing SGX for collectionID %@ - Sending DAP report only", buf, 0xCu);
    }

    id v23 = 0;
    id v11 = [(_DPDediscoPayloadUploader *)self buildHTTPHeadersWithPayload:v6 withEncoder:v7 withError:&v23];
    id v12 = v23;
    if (v12)
    {
      id v13 = v12;
      id v14 = v13;
    }
    else
    {
      id v22 = 0;
      uint64_t v16 = [v7 taskIDWithError:&v22];
      id v17 = v22;
      id v13 = v17;
      if (v17)
      {
        id v14 = v17;
      }
      else
      {
        v21 = [(_DPDediscoPayloadUploader *)self baseURL];
        v18 = +[_DPDediscoUtils toBase64URLEncoded:v16];
        dispatch_time_t v19 = +[NSString stringWithFormat:@"%@/tasks/%@/reports", v21, v18];

        id v14 = [(_DPDediscoPayloadUploader *)self uploadWithHTTPBody:v8 withHTTPHeaders:v11 withFullURL:v19];
      }
    }
  }
  else
  {
    id v13 = +[NSString stringWithFormat:@"Failed to send V1 payloads collectionID %@ - http upload is forbidden", v9];
    objc_super v15 = +[_DPLog service];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000579F4();
    }

    id v14 = +[_DPDediscoError errorWithCode:203 description:v13];
  }

  return v14;
}

- (id)buildHTTPHeadersWithPayload:(id)a3 withEncoder:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 encodedReportAuthExtensionDataWithError:a5];
  if (a5 && *a5)
  {
    id v10 = 0;
  }
  else
  {
    id v11 = [v8 encodedTaskProvExtensionDataWithError:a5];
    if (v11)
    {
      id v12 = [v8 dapVersion];
      unsigned int v13 = +[_DPDeviceInfo isInternalBuild];
      CFStringRef v14 = @"0";
      if (v13) {
        CFStringRef v14 = @"1";
      }
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"application/dap-report;version=%@;build-type=%@",
        v12,
      objc_super v15 = v14);

      uint64_t v16 = [v7 getCollectionId];
      v23[0] = v16;
      v23[1] = v15;
      id v17 = +[NSArray arrayWithObjects:v23 count:2];
      id v10 = +[NSMutableDictionary dictionaryWithObjects:v17 forKeys:&off_100079A00];
      if (v9)
      {
        v18 = +[_DPDediscoUtils toBase64URLEncoded:v9];
        [v10 setObject:v18 forKeyedSubscript:@"dap-reportauth"];
        dispatch_time_t v19 = +[_DPLog service];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_10005893C();
        }
      }
      v20 = +[_DPDediscoUtils toBase64URLEncoded:v11];
      [v10 setObject:v20 forKeyedSubscript:@"dap-taskprov"];
      v21 = +[_DPLog service];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_1000588C8();
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  return v10;
}

- (NSString)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (BOOL)useOHTTP
{
  return self->_useOHTTP;
}

- (void)setUseOHTTP:(BOOL)a3
{
  self->_useOHTTP = a3;
}

- (void).cxx_destruct
{
}

@end