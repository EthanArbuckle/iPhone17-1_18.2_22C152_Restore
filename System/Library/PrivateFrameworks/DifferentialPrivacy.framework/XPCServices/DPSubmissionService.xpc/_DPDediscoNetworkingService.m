@interface _DPDediscoNetworkingService
+ (id)new;
- (NSURL)configurationURL;
- (_DPDediscoNetworkingService)init;
- (_DPDediscoNetworkingService)initWithDomain:(id)a3 configurationURL:(id)a4;
- (_DPSubmissionServiceHTTPClient)networkingClient;
- (id)downloadConfigSynchronouslyWithError:(id *)a3;
- (void)setConfigurationURL:(id)a3;
- (void)setNetworkingClient:(id)a3;
@end

@implementation _DPDediscoNetworkingService

+ (id)new
{
  return 0;
}

- (_DPDediscoNetworkingService)init
{
  return 0;
}

- (_DPDediscoNetworkingService)initWithDomain:(id)a3 configurationURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DPDediscoNetworkingService;
  v8 = [(_DPDediscoNetworkingService *)&v12 init];
  if (v8)
  {
    v9 = [[_DPSubmissionServiceHTTPClient alloc] initWithDomain:v6 retries:3];
    networkingClient = v8->_networkingClient;
    v8->_networkingClient = v9;

    objc_storeStrong((id *)&v8->_configurationURL, a4);
  }

  return v8;
}

- (id)downloadConfigSynchronouslyWithError:(id *)a3
{
  v5 = +[_DPLog service];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(_DPDediscoNetworkingService *)self configurationURL];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting to download config file from %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v45 = 0x3032000000;
  v46 = sub_10000BED8;
  v47 = sub_10000BEE8;
  id v48 = 0;
  uint64_t v37 = 0;
  v38[0] = &v37;
  v38[1] = 0x3032000000;
  v38[2] = sub_10000BED8;
  v38[3] = sub_10000BEE8;
  id v39 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v8 = [(_DPDediscoNetworkingService *)self networkingClient];
  v9 = [(_DPDediscoNetworkingService *)self configurationURL];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000BEF0;
  v32[3] = &unk_100075170;
  p_long long buf = &buf;
  v35 = &v37;
  v36 = &v40;
  v10 = v7;
  v33 = v10;
  [v8 downloadConfigFromURL:v9 completion:v32];

  dispatch_time_t v11 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    objc_super v12 = +[_DPLog service];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100056D70(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    if (a3)
    {
      id v20 = +[_DPDediscoError errorWithCode:200 description:@"Timeout while downloading config on client"];
LABEL_8:
      id v21 = 0;
      *a3 = v20;
      goto LABEL_18;
    }
LABEL_17:
    id v21 = 0;
    goto LABEL_18;
  }
  if (!*((unsigned char *)v41 + 24))
  {
    v23 = +[_DPLog service];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100056CFC((uint64_t)v38, v23, v24, v25, v26, v27, v28, v29);
    }

    if (a3)
    {
      id v20 = +[_DPDediscoError errorWithCode:201 underlyingError:*(void *)(v38[0] + 40) description:@"Networking client returned an error"];
      goto LABEL_8;
    }
    goto LABEL_17;
  }
  v22 = +[_DPLog service];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Finished downloading config successfully", v31, 2u);
  }

  id v21 = *(id *)(*((void *)&buf + 1) + 40);
LABEL_18:

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v40, 8);
  return v21;
}

- (_DPSubmissionServiceHTTPClient)networkingClient
{
  return self->_networkingClient;
}

- (void)setNetworkingClient:(id)a3
{
}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (void)setConfigurationURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_networkingClient, 0);
}

@end