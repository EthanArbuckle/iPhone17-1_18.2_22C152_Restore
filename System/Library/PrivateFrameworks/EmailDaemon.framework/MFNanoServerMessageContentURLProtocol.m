@interface MFNanoServerMessageContentURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (NSString)scheme;
+ (_MFNanoServerMessageContentURLProtocolRegistry)registry;
+ (id)URLForLoadingContext:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
+ (id)loadingContextForURL:(id)a3;
+ (void)initialize;
+ (void)setRegistry:(id)a3;
- (EFCancelationToken)token;
- (EFPromise)promise;
- (MFMessageLoadingContext)loadingContext;
- (MFNanoServerMessageContentURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5;
- (id)_cachedResponseWithData:(id)a3 error:(id *)a4;
- (void)_didLoadContentEvent:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)setPromise:(id)a3;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation MFNanoServerMessageContentURLProtocol

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSURLProtocol registerClass:a1];
  }
}

+ (_MFNanoServerMessageContentURLProtocolRegistry)registry
{
  v2 = (void *)qword_10016BD58;
  if (!qword_10016BD58)
  {
    uint64_t v3 = +[_MFNanoServerMessageContentURLProtocolRegistry sharedRegistry];
    v4 = (void *)qword_10016BD58;
    qword_10016BD58 = v3;

    v2 = (void *)qword_10016BD58;
  }

  return (_MFNanoServerMessageContentURLProtocolRegistry *)v2;
}

+ (void)setRegistry:(id)a3
{
}

+ (NSString)scheme
{
  return (NSString *)@"x-apple-msg-load-wk2";
}

+ (id)URLForLoadingContext:(id)a3
{
  id v4 = a3;
  v5 = [a1 registry];
  v6 = [a1 scheme];
  v7 = [v5 URLForLoadingContext:v4 scheme:v6];

  return v7;
}

+ (id)loadingContextForURL:(id)a3
{
  id v4 = a3;
  v5 = [a1 registry];
  v6 = [v5 loadingContextForURL:v4];

  return v6;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v4 = [a3 URL];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 scheme];
    v7 = [a1 scheme];
    if ([v6 caseInsensitiveCompare:v7])
    {
      BOOL v8 = 0;
    }
    else
    {
      v9 = [a1 loadingContextForURL:v5];
      BOOL v8 = v9 != 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;

  return v3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

- (void)dealloc
{
  [(EFCancelationToken *)self->_token cancel];
  v3.receiver = self;
  v3.super_class = (Class)MFNanoServerMessageContentURLProtocol;
  [(MFNanoServerMessageContentURLProtocol *)&v3 dealloc];
}

- (MFNanoServerMessageContentURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)MFNanoServerMessageContentURLProtocol;
  v11 = [(MFNanoServerMessageContentURLProtocol *)&v31 initWithRequest:v8 cachedResponse:v9 client:v10];
  if (v11)
  {
    v12 = objc_opt_class();
    v13 = [v8 URL];
    uint64_t v14 = [v12 loadingContextForURL:v13];
    loadingContext = v11->_loadingContext;
    v11->_loadingContext = (MFMessageLoadingContext *)v14;

    v16 = (EFCancelationToken *)objc_alloc_init((Class)EFCancelationToken);
    token = v11->_token;
    v11->_token = v16;

    v18 = (EFPromise *)objc_alloc_init((Class)EFPromise);
    promise = v11->_promise;
    v11->_promise = v18;

    v20 = [(EFPromise *)v11->_promise future];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v11);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100094F88;
    v28[3] = &unk_10013D3F0;
    objc_copyWeak(&v29, &location);
    [v20 addSuccessBlock:v28];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000950B0;
    v26[3] = &unk_10013D418;
    objc_copyWeak(&v27, &location);
    [v20 addFailureBlock:v26];
    v21 = v11->_token;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10009514C;
    v24[3] = &unk_100139C48;
    id v22 = v20;
    id v25 = v22;
    [(EFCancelationToken *)v21 addCancelationBlock:v24];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v11;
}

- (id)_cachedResponseWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    v19 = NSURLErrorFailingURLErrorKey;
    v15 = [(MFNanoServerMessageContentURLProtocol *)self request];
    v16 = [v15 URL];
    v20 = v16;
    v17 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v14 = +[NSError errorWithDomain:NSURLErrorDomain code:-1008 userInfo:v17];

    id v13 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v7 = objc_alloc((Class)NSURLResponse);
  id v8 = [(MFNanoServerMessageContentURLProtocol *)self request];
  id v9 = [v8 URL];
  id v10 = [v6 length];
  v11 = MFCharsetForEncoding();
  id v12 = [v7 initWithURL:v9 MIMEType:@"text/html" expectedContentLength:v10 textEncodingName:v11];

  id v13 = [objc_alloc((Class)NSCachedURLResponse) initWithResponse:v12 data:v6 userInfo:0 storagePolicy:2];
  uint64_t v14 = 0;
  if (a4) {
LABEL_5:
  }
    *a4 = v14;
LABEL_6:

  return v13;
}

- (void)startLoading
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  token = self->_token;
  loadingContext = self->_loadingContext;
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_1000954B0;
  id v9 = &unk_10013D440;
  objc_copyWeak(&v10, &location);
  v5 = [(MFMessageLoadingContext *)loadingContext addLoadObserver:&v6];
  -[EFCancelationToken addCancelable:](token, "addCancelable:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)stopLoading
{
  objc_super v3 = [(MFNanoServerMessageContentURLProtocol *)self promise];
  id v8 = NSURLErrorFailingURLErrorKey;
  id v4 = [(MFNanoServerMessageContentURLProtocol *)self request];
  v5 = [v4 URL];
  id v9 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  uint64_t v7 = +[NSError errorWithDomain:NSURLErrorDomain code:-999 userInfo:v6];
  [v3 finishWithError:v7];

  [(EFCancelationToken *)self->_token cancel];
}

- (void)_didLoadContentEvent:(id)a3 error:(id)a4
{
  id v38 = a3;
  id v36 = a4;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100095E0C;
  v47[3] = &unk_10013D468;
  id v37 = objc_alloc_init((Class)MFBufferedDataConsumer);
  id v48 = v37;
  v49 = &v50;
  v39 = objc_retainBlock(v47);
  v5 = [v38 context];
  v40 = [v5 attachmentManager];

  id v6 = [v38 content];
  if (!v6)
  {
    uint64_t v7 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_super v31 = [(MFNanoServerMessageContentURLProtocol *)self loadingContext];
      v32 = [v31 message];
      v33 = [v32 messageID];
      v34 = objc_msgSend(v36, "ef_publicDescription");
      *(_DWORD *)buf = 138543618;
      v56 = v33;
      __int16 v57 = 2114;
      v58 = v34;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "loading message %{public}@ had error %{public}@", buf, 0x16u);
    }
    id v8 = objc_msgSend(v36, "mf_markupString");
    ((void (*)(void *, void *))v39[2])(v39, v8);

    id v6 = 0;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v44;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [v40 attachmentForTextAttachment:v12 error:0];
          v15 = v14;
          if (v14)
          {
            v16 = [v14 fetchLocalData];
            id v17 = [v15 markupStringForDisplayWithData:v16 allowAttachmentElement:1];
            v18 = +[NSUserDefaults em_userDefaults];
            unsigned int v19 = [v18 BOOLForKey:@"ShowAttachmentMarkup"];

            if (v19)
            {
              uint64_t v20 = _MFShowAttachmentMarkup();

              id v17 = (id)v20;
            }

            if (v17) {
              ((void (*)(void *, id))v39[2])(v39, v17);
            }
          }
          else
          {
            id v17 = 0;
          }
LABEL_27:

          goto LABEL_28;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v12;
          v15 = [v17 htmlData];
          if (v15)
          {
            v21 = [v17 preferredCharacterSet];
            int v22 = MFEncodingForCharset();
            *(_DWORD *)buf = -1;
            v23 = (void *)MFCreateStringWithData();
            if (!v23 && v22 != -1) {
              v23 = (void *)MFCreateStringWithData();
            }
            if (v23) {
              ((void (*)(void *, void *))v39[2])(v39, v23);
            }
          }
          goto LABEL_27;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          ((void (*)(void *, void *))v39[2])(v39, v12);
        }
LABEL_28:
      }
      id v9 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v9);
  }

  if (!*((unsigned char *)v51 + 24))
  {
    v24 = +[NSBundle bundleForClass:objc_opt_class()];
    id v25 = [v24 localizedStringForKey:@"NO_BODY" value:&stru_10013ED08 table:@"Main"];
    v26 = objc_msgSend(v25, "mf_stringByEscapingHTMLCodes");
    id v27 = +[NSString localizedStringWithFormat:@"<html dir=auto><body><i><font color=#888>%@</font></i></body></html>", v26];

    ((void (*)(void *, void *))v39[2])(v39, v27);
  }
  [v37 done];
  v28 = [v37 data];
  id v42 = 0;
  id v29 = [(MFNanoServerMessageContentURLProtocol *)self _cachedResponseWithData:v28 error:&v42];
  id v30 = v42;
  [(EFPromise *)self->_promise finishWithResult:v29 error:v30];

  _Block_object_dispose(&v50, 8);
}

- (EFCancelationToken)token
{
  return (EFCancelationToken *)objc_getProperty(self, a2, 16, 1);
}

- (MFMessageLoadingContext)loadingContext
{
  return (MFMessageLoadingContext *)objc_getProperty(self, a2, 24, 1);
}

- (EFPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_loadingContext, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end