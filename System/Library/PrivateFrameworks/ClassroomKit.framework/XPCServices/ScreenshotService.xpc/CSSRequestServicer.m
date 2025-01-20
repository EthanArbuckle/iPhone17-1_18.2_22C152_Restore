@interface CSSRequestServicer
- (CRKInternetDateProvider)internetDateProvider;
- (CSSApplicationProvider)applicationProvider;
- (CSSConcreteScreenshotter)screenshotter;
- (CSSRequestServicer)init;
- (void)fetchApplicationWithDescriptor:(id)a3 completion:(id)a4;
- (void)fetchInternetDateWithCompletion:(id)a3;
- (void)fetchScreenshotDataWithMaximumSizeInPixels:(CGSize)a3 completion:(id)a4;
@end

@implementation CSSRequestServicer

- (CSSRequestServicer)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSSRequestServicer;
  v2 = [(CSSRequestServicer *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    applicationProvider = v2->_applicationProvider;
    v2->_applicationProvider = (CSSApplicationProvider *)v3;

    uint64_t v5 = objc_opt_new();
    screenshotter = v2->_screenshotter;
    v2->_screenshotter = (CSSConcreteScreenshotter *)v5;

    uint64_t v7 = objc_opt_new();
    internetDateProvider = v2->_internetDateProvider;
    v2->_internetDateProvider = (CRKInternetDateProvider *)v7;
  }
  return v2;
}

- (void)fetchScreenshotDataWithMaximumSizeInPixels:(CGSize)a3 completion:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005880;
  v5[3] = &unk_10000C6E8;
  CGSize v7 = a3;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)fetchApplicationWithDescriptor:(id)a3 completion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000599C;
  block[3] = &unk_10000C710;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)fetchInternetDateWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005A88;
  v4[3] = &unk_10000C738;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (CSSApplicationProvider)applicationProvider
{
  return self->_applicationProvider;
}

- (CSSConcreteScreenshotter)screenshotter
{
  return self->_screenshotter;
}

- (CRKInternetDateProvider)internetDateProvider
{
  return self->_internetDateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internetDateProvider, 0);
  objc_storeStrong((id *)&self->_screenshotter, 0);

  objc_storeStrong((id *)&self->_applicationProvider, 0);
}

@end