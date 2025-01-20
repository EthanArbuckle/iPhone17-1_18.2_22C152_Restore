@interface ODRZipStreamDataConsumer
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation ODRZipStreamDataConsumer

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void, void))v7;
  if (self->_dataComplete)
  {
    (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0, 1);
  }
  else
  {
    extractor = self->_extractor;
    if (extractor)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10027E140;
      v11[3] = &unk_100522EC0;
      v11[4] = self;
      id v12 = v7;
      [(SZExtractor *)extractor supplyBytes:v6 withCompletionBlock:v11];
    }
    else
    {
      v10 = ASDErrorWithTitleAndMessage();
      ((void (**)(void, void *, void))v8)[2](v8, v10, 0);
    }
  }
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  extractor = self->_extractor;
  if (extractor)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10027E240;
    v8[3] = &unk_100521898;
    id v9 = v4;
    [(SZExtractor *)extractor finishStreamWithCompletionBlock:v8];
  }
  else
  {
    id v7 = ASDErrorWithTitleAndMessage();
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  extractor = self->_extractor;
  if (extractor)
  {
    id v6 = [(SZExtractor *)self->_extractor extractionPath];
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_10027E404;
    v14 = &unk_100522808;
    v15 = self;
    id v16 = v4;
    id v7 = extractor;
    id v8 = v6;
    id v9 = &v11;
    if (v8) {
      -[SZExtractor prepareForExtractionToPath:completionBlock:](v7, "prepareForExtractionToPath:completionBlock:", v8, v9, v11, v12, v13, v14, v15, v16);
    }
    else {
      -[SZExtractor prepareForExtraction:](v7, "prepareForExtraction:", v9, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    v10 = ASDErrorWithTitleAndMessage();
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
  }
}

- (void)suspendWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  extractor = self->_extractor;
  if (extractor)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10027E588;
    v8[3] = &unk_100522808;
    void v8[4] = self;
    id v9 = v4;
    [(SZExtractor *)extractor suspendStreamWithCompletionBlock:v8];
  }
  else
  {
    id v7 = ASDErrorWithTitleAndMessage();
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
}

- (void)resetWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  extractor = self->_extractor;
  if (extractor
    && ([(SZExtractor *)extractor extractionPath],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Extractor reset", v14, 2u);
    }

    id v8 = objc_alloc((Class)SZExtractor);
    id v9 = [(SZExtractor *)self->_extractor extractionPath];
    v10 = [(SZExtractor *)self->_extractor options];
    v11 = (SZExtractor *)[v8 initWithPath:v9 options:v10];
    uint64_t v12 = self->_extractor;
    self->_extractor = v11;

    v4[2](v4, 0);
  }
  else
  {
    v13 = ASDErrorWithTitleAndMessage();
    ((void (**)(id, void *))v4)[2](v4, v13);
  }
}

- (void)truncateWithCompletionHandler:(id)a3
{
  v3 = (void (**)(id, void))a3;
  id v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "TRUNCATE", v5, 2u);
  }

  v3[2](v3, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extractorDelegate);
  objc_storeStrong((id *)&self->_extractor, 0);
}

@end