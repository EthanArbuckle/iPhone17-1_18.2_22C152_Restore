@interface CBSFetchChaptersOperation
- (BOOL)isAsynchronous;
- (CBSFetchChaptersOperation)initWithRequest:(id)a3;
- (void)cleanUp;
- (void)finishOperation:(id)a3;
- (void)finishOperationWithError:(id)a3;
- (void)main;
- (void)parseOFPPackageContentsOperationDidFinish:(id)a3;
- (void)parseOPFFilePathOperationDidFinish:(id)a3;
- (void)run;
@end

@implementation CBSFetchChaptersOperation

- (CBSFetchChaptersOperation)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CBSFetchChaptersOperation;
  v6 = [(CBSFetchChaptersOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mRequest, a3);
  }

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
}

- (void)run
{
  if ([(CBSFetchChaptersOperation *)self isCanceled])
  {
    CATErrorWithCodeAndUserInfo();
    v6 = (CBSParseOPFFilePathOperation *)objc_claimAutoreleasedReturnValue();
    -[CBSFetchChaptersOperation endOperationWithError:](self, "endOperationWithError:");
  }
  else
  {
    v3 = [CBSParseOPFFilePathOperation alloc];
    v4 = [(CRKFetchChaptersRequest *)self->mRequest path];
    v6 = [(CBSParseOPFFilePathOperation *)v3 initWithBookFilePath:v4];

    [(CBSParseOPFFilePathOperation *)v6 addTarget:self selector:"parseOPFFilePathOperationDidFinish:" forOperationEvents:6];
    id v5 = +[CATOperationQueue crk_backgroundQueue];
    [v5 addOperation:v6];
  }
}

- (void)parseOPFFilePathOperationDidFinish:(id)a3
{
  id v11 = a3;
  v4 = [v11 resultObject];

  if (v4)
  {
    id v5 = [CBSParseOPFPackageContentsOperation alloc];
    v6 = [v11 resultObject];
    v7 = [(CRKFetchChaptersRequest *)self->mRequest identifierType];
    v8 = [(CRKFetchChaptersRequest *)self->mRequest identifier];
    objc_super v9 = [(CBSParseOPFPackageContentsOperation *)v5 initWithOPFFilePath:v6 identifierType:v7 identifier:v8];

    [(CBSParseOPFPackageContentsOperation *)v9 addTarget:self selector:"parseOFPPackageContentsOperationDidFinish:" forOperationEvents:6];
    v10 = +[CATOperationQueue crk_backgroundQueue];
    [v10 addOperation:v9];
  }
  else
  {
    [(CBSFetchChaptersOperation *)self finishOperation:v11];
  }
}

- (void)parseOFPPackageContentsOperationDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [v4 resultObject];

  if (v5)
  {
    v6 = [v4 resultObject];

    v7 = [v6 tableOfContentsMediaType];
    unsigned int v8 = [v7 isEqualToString:@"application/x-dtbncx+xml"];

    if (v8)
    {
      objc_super v9 = CBSParseNCXTableOfContentsOperation;
    }
    else
    {
      v10 = [v6 tableOfContentsMediaType];
      unsigned int v11 = [v10 isEqualToString:@"application/xhtml+xml"];

      if (!v11)
      {
        if (qword_1000121B8 != -1) {
          dispatch_once(&qword_1000121B8, &stru_10000C300);
        }
        v16 = (void *)qword_1000121B0;
        if (os_log_type_enabled((os_log_t)qword_1000121B0, OS_LOG_TYPE_ERROR)) {
          sub_1000084D0(v16, v6);
        }
        CRKErrorWithCodeAndUserInfo();
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        [(CBSFetchChaptersOperation *)self finishOperationWithError:v14];
        goto LABEL_13;
      }
      objc_super v9 = CBSParseHTMLTableOfContentsOperation;
    }
    id v12 = [v9 alloc];
    v13 = [v6 tableOfContentsFilePath];
    id v14 = [v12 initWithFilePath:v13 packageContents:v6];

    [v14 addTarget:self selector:"parseTableOfContentsOperationDidFinish:" forOperationEvents:6];
    v15 = +[CATOperationQueue crk_backgroundQueue];
    [v15 addOperation:v14];

LABEL_13:
    goto LABEL_14;
  }
  [(CBSFetchChaptersOperation *)self finishOperation:v4];
  v6 = v4;
LABEL_14:
}

- (void)finishOperation:(id)a3
{
  id v9 = a3;
  [(CBSFetchChaptersOperation *)self cleanUp];
  id v4 = [v9 error];

  if (v4)
  {
    id v5 = [v9 error];
    [(CBSFetchChaptersOperation *)self endOperationWithError:v5];
  }
  else
  {
    id v5 = objc_opt_new();
    uint64_t v6 = [v9 resultObject];
    v7 = (void *)v6;
    if (v6) {
      unsigned int v8 = (void *)v6;
    }
    else {
      unsigned int v8 = &__NSArray0__struct;
    }
    [v5 setChapters:v8];

    [(CBSFetchChaptersOperation *)self endOperationWithResultObject:v5];
  }
}

- (void)finishOperationWithError:(id)a3
{
  id v4 = a3;
  [(CBSFetchChaptersOperation *)self cleanUp];
  [(CBSFetchChaptersOperation *)self endOperationWithError:v4];
}

- (void)cleanUp
{
  self->mSandboxExtension = 0;
  _objc_release_x1();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSandboxExtension, 0);

  objc_storeStrong((id *)&self->mRequest, 0);
}

@end