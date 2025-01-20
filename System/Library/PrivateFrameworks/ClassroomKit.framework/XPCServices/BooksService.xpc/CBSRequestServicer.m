@interface CBSRequestServicer
- (void)fetchBooksWithRequest:(id)a3 completion:(id)a4;
- (void)fetchChaptersWithRequest:(id)a3 completion:(id)a4;
- (void)performOperation:(id)a3 completion:(id)a4;
@end

@implementation CBSRequestServicer

- (void)performOperation:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[CATOperationQueue crk_backgroundQueue];
  [v7 addOperation:v5];

  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_100007708;
  v15 = &unk_10000C390;
  id v16 = v5;
  id v17 = v6;
  id v8 = v5;
  id v9 = v6;
  v10 = +[NSBlockOperation blockOperationWithBlock:&v12];
  objc_msgSend(v10, "addDependency:", v8, v12, v13, v14, v15);
  v11 = +[NSOperationQueue mainQueue];
  [v11 addOperation:v10];
}

- (void)fetchBooksWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100007848;
    v8[3] = &unk_10000C3B8;
    id v9 = v6;
    v10 = self;
    id v11 = v7;
    +[NSRunLoop cat_performBlockOnMainRunLoop:v8];
  }
}

- (void)fetchChaptersWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100007970;
    v8[3] = &unk_10000C3B8;
    id v9 = v6;
    v10 = self;
    id v11 = v7;
    +[NSRunLoop cat_performBlockOnMainRunLoop:v8];
  }
}

@end