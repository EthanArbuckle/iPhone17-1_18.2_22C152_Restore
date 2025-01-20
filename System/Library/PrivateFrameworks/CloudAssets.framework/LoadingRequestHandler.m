@interface LoadingRequestHandler
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (BOOL)resourceLoader:(id)a3 shouldWaitForRenewalOfRequestedResource:(id)a4;
- (BOOL)resourceLoader:(id)a3 shouldWaitForResponseToAuthenticationChallenge:(id)a4;
- (_TtC11CloudAssets21LoadingRequestHandler)init;
- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4;
@end

@implementation LoadingRequestHandler

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6 = a3;
  v7 = (AVAssetResourceLoaderInternal *)a4;
  v8.super.Class isa = (Class)self;
  Class isa = v8.super.isa;
  v8._resourceLoader = v7;
  LoadingRequestHandler.resourceLoader(_:shouldWaitForLoadingOfRequestedResource:)(v8, v10);

  return 1;
}

- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4
{
  id v10 = a3;
  id v6 = (AVAssetResourceLoaderInternal *)a4;
  v7.super.Class isa = (Class)self;
  Class isa = v7.super.isa;
  v7._resourceLoader = v6;
  LoadingRequestHandler.resourceLoader(_:didCancel:)(v7, v9);
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForRenewalOfRequestedResource:(id)a4
{
  id v6 = a3;
  AVAssetResourceLoader v7 = (AVAssetResourceLoaderInternal *)a4;
  v8.super.Class isa = (Class)self;
  Class isa = v8.super.isa;
  v8._resourceLoader = v7;
  LoadingRequestHandler.resourceLoader(_:shouldWaitForRenewalOfRequestedResource:)(v8, v10);

  return 1;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForResponseToAuthenticationChallenge:(id)a4
{
  id v6 = a3;
  AVAssetResourceLoader v7 = (AVAssetResourceLoaderInternal *)a4;
  v8.super.Class isa = (Class)self;
  Class isa = v8.super.isa;
  v8._resourceLoader = v7;
  LoadingRequestHandler.resourceLoader(_:shouldWaitForResponseTo:)(v8, v10);

  return 1;
}

- (_TtC11CloudAssets21LoadingRequestHandler)init
{
}

- (void).cxx_destruct
{
  sub_24A123580((uint64_t)self + OBJC_IVAR____TtC11CloudAssets21LoadingRequestHandler_assetStreamHandle);
  sub_24A144190((uint64_t)self + OBJC_IVAR____TtC11CloudAssets21LoadingRequestHandler_type, &qword_26976B4A0);
  swift_release();
  swift_release();
}

@end