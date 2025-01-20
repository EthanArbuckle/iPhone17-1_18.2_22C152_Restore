@interface ZipDataStreamAdapter
- (NSString)description;
- (void)consumeData:(id)a3 andWaitWithCompletionHandler:(id)a4;
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation ZipDataStreamAdapter

- (void)consumeData:(id)a3 andWaitWithCompletionHandler:(id)a4
{
}

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_extractor)
  {
    dispatch_group_wait((dispatch_group_t)self->_consistencyGroup, 0xFFFFFFFFFFFFFFFFLL);
    extractor = self->_extractor;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100224254;
    v7[3] = &unk_100521898;
    id v8 = v4;
    [(SZExtractor *)extractor finishStreamWithCompletionBlock:v7];
  }
  else
  {
    v6 = ASDErrorWithTitleAndMessage();
    (*((void (**)(id, void *))v4 + 2))(v4, v6);
  }
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  extractor = self->_extractor;
  if (extractor)
  {
    path = self->_path;
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_100224418;
    v15 = &unk_100522808;
    v16 = self;
    id v17 = v4;
    id v8 = path;
    v9 = &v12;
    v10 = extractor;
    self;
    if (v8) {
      -[SZExtractor prepareForExtractionToPath:completionBlock:](v10, "prepareForExtractionToPath:completionBlock:", v8, v9, v12, v13, v14, v15, v16, v17);
    }
    else {
      -[SZExtractor prepareForExtraction:](v10, "prepareForExtraction:", v9, v12, v13, v14, v15, v16, v17);
    }
  }
  else
  {
    v11 = ASDErrorWithTitleAndMessage();
    ((void (**)(void, void, void *))v5)[2](v5, 0, v11);
  }
}

- (void)suspendWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_extractor)
  {
    dispatch_group_wait((dispatch_group_t)self->_consistencyGroup, 0xFFFFFFFFFFFFFFFFLL);
    extractor = self->_extractor;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10022452C;
    v7[3] = &unk_100522808;
    void v7[4] = self;
    id v8 = v4;
    [(SZExtractor *)extractor suspendStreamWithCompletionBlock:v7];
  }
  else
  {
    v6 = ASDErrorWithTitleAndMessage();
    (*((void (**)(id, void *))v4 + 2))(v4, v6);
  }
}

- (void)resetWithCompletionHandler:(id)a3
{
}

- (void)truncateWithCompletionHandler:(id)a3
{
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@: %p> { %@ }", objc_opt_class(), self, self->_extractor];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locked_streamStatus, 0);
  objc_storeStrong((id *)&self->_consistencyGroup, 0);
  objc_storeStrong((id *)&self->_backpressureSemaphore, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_extractor, 0);
}

@end