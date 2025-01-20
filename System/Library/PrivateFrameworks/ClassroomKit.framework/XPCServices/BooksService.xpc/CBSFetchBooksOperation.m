@interface CBSFetchBooksOperation
- (BOOL)isAsynchronous;
- (CBSFetchBooksOperation)initWithRequest:(id)a3;
- (void)finishOperation;
- (void)main;
- (void)parseBookMetadataOperationDidFail:(id)a3;
- (void)parsePDFMetadataOperationDidFail:(id)a3;
- (void)run;
@end

@implementation CBSFetchBooksOperation

- (CBSFetchBooksOperation)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CBSFetchBooksOperation;
  v6 = [(CBSFetchBooksOperation *)&v9 init];
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
  mRequest = self->mRequest;
  id v56 = 0;
  unsigned __int8 v4 = [(CRKFetchBooksRequest *)mRequest isValidWithError:&v56];
  id v5 = v56;
  v6 = v5;
  if (v4)
  {
    if ([(CBSFetchBooksOperation *)self isCanceled])
    {
      uint64_t v7 = CATErrorWithCodeAndUserInfo();
LABEL_50:
      v46 = (void *)v7;
      [(CBSFetchBooksOperation *)self endOperationWithError:v7];

      goto LABEL_53;
    }
    v8 = (NSMutableArray *)objc_opt_new();
    mBooks = self->mBooks;
    self->mBooks = v8;

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v10 = sub_100005874();
    id v50 = [v10 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (!v50)
    {

      goto LABEL_52;
    }
    v47 = v6;
    v11 = 0;
    uint64_t v49 = *(void *)v53;
    id obj = v10;
LABEL_8:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v53 != v49) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v52 + 1) + 8 * v12);
      if (qword_1000121C8 != -1) {
        dispatch_once(&qword_1000121C8, &stru_10000C348);
      }
      v14 = qword_1000121C0;
      if (os_log_type_enabled((os_log_t)qword_1000121C0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v58 = v13;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      v15 = objc_opt_new();
      v16 = [v13 title];
      [v15 setTitle:v16];

      v17 = [v13 author];
      [v15 setAuthor:v17];

      objc_msgSend(v15, "setType:", objc_msgSend(v13, "type"));
      if ([v13 type]) {
        BOOL v18 = [v13 type] == (id)1;
      }
      else {
        BOOL v18 = 1;
      }
      [v15 setHasChapters:v18];
      v19 = [v13 path];
      [v15 setPath:v19];

      if ([(CRKFetchBooksRequest *)self->mRequest includeImages])
      {
        v20 = [v13 path];
        v21 = [v20 stringByAppendingPathComponent:@"iTunesArtwork"];
        v22 = +[NSData dataWithContentsOfFile:v21];
        [v15 setImage:v22];
      }
      v23 = [v13 storeIdentifier];
      id v24 = [v23 length];

      if (v24) {
        break;
      }
      v26 = [v13 identifier];
      id v27 = [v26 length];

      if (v27)
      {
        v25 = [v13 identifier];
        +[NSString stringWithFormat:@"ibooks://assetid/%@", v25];
        goto LABEL_24;
      }
      v41 = [v13 legacyUniqueIdentifier];
      id v42 = [v41 length];

      if (v42)
      {
        v25 = [v13 legacyUniqueIdentifier];
        v28 = +[NSString stringWithFormat:@"ibooks://assetid/%@", v25];
        goto LABEL_25;
      }
      v25 = [v13 path];
      v28 = [v25 lastPathComponent];
      v43 = +[NSString stringWithFormat:@"ibooks://filename/%@", v28];
      v29 = +[NSURL URLWithString:v43];

LABEL_26:
      [v15 setWebURL:v29];
      [(NSMutableArray *)self->mBooks addObject:v15];
      uint64_t v30 = [v15 title];
      if (!v30) {
        goto LABEL_32;
      }
      v31 = (CBSParsePDFMetadataOperation *)v30;
      uint64_t v32 = [v15 author];
      if (!v32)
      {

LABEL_32:
        if ([v13 type] && objc_msgSend(v13, "type") != (id)1)
        {
          v38 = [CBSParsePDFMetadataOperation alloc];
          v39 = [v13 path];
          v31 = [(CBSParsePDFMetadataOperation *)v38 initWithPDFBook:v15 filePath:v39 parseImage:[(CRKFetchBooksRequest *)self->mRequest includeImages]];

          v35 = (CBSParseBookMetadataOperation *)v31;
          v36 = self;
          v37 = "parsePDFMetadataOperationDidFail:";
        }
        else
        {
          v35 = [[CBSParseBookMetadataOperation alloc] initWithBook:v15 parseImage:[(CRKFetchBooksRequest *)self->mRequest includeImages]];
          v31 = (CBSParsePDFMetadataOperation *)v35;
          v36 = self;
          v37 = "parseBookMetadataOperationDidFail:";
        }
        [(CBSParseBookMetadataOperation *)v35 addTarget:v36 selector:v37 forOperationEvents:4];
        v40 = +[CATOperationQueue crk_backgroundQueue];
        [v40 addOperation:v31];

        if (!v11)
        {
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472;
          v51[2] = sub_100005AD4;
          v51[3] = &unk_10000C328;
          v51[4] = self;
          v11 = +[NSBlockOperation blockOperationWithBlock:v51];
        }
        [v11 addDependency:v31];
LABEL_40:

        goto LABEL_41;
      }
      v33 = (void *)v32;
      if (![(CRKFetchBooksRequest *)self->mRequest includeImages])
      {

        goto LABEL_40;
      }
      v34 = [v15 image];

      if (!v34) {
        goto LABEL_32;
      }
LABEL_41:

      if (v50 == (id)++v12)
      {
        id v44 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
        id v50 = v44;
        if (!v44)
        {

          v6 = v47;
          if (v11)
          {
            v45 = +[CATOperationQueue crk_backgroundQueue];
            [v45 addOperation:v11];

            goto LABEL_53;
          }
LABEL_52:
          [(CBSFetchBooksOperation *)self finishOperation];
          goto LABEL_53;
        }
        goto LABEL_8;
      }
    }
    v25 = [v13 storeIdentifier];
    +[NSString stringWithFormat:@"ibooks://storeid/%@", v25];
    v28 = LABEL_24:;
LABEL_25:
    v29 = +[NSURL URLWithString:v28];
    goto LABEL_26;
  }
  if (!v5)
  {
    uint64_t v7 = CRKErrorWithCodeAndUserInfo();
    goto LABEL_50;
  }
  [(CBSFetchBooksOperation *)self endOperationWithError:v5];
LABEL_53:
}

- (void)finishOperation
{
  mSandboxExtension = self->mSandboxExtension;
  self->mSandboxExtension = 0;

  id v4 = (id)objc_opt_new();
  [v4 setBooks:self->mBooks];
  [(CBSFetchBooksOperation *)self endOperationWithResultObject:v4];
}

- (void)parseBookMetadataOperationDidFail:(id)a3
{
  mBooks = self->mBooks;
  id v4 = [a3 book];
  [(NSMutableArray *)mBooks removeObject:v4];
}

- (void)parsePDFMetadataOperationDidFail:(id)a3
{
  mBooks = self->mBooks;
  id v4 = [a3 book];
  [(NSMutableArray *)mBooks removeObject:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBooks, 0);
  objc_storeStrong((id *)&self->mSandboxExtension, 0);

  objc_storeStrong((id *)&self->mRequest, 0);
}

@end