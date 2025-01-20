@interface _DPDediscoPCCNetworkingService
- (_DPDediscoPCCNetworkingService)init;
- (id)submitSyncronouslyWithSerializedPayload:(id)a3 baaCertificateChain:(id)a4 baaSignature:(id)a5 options:(int64_t)a6;
@end

@implementation _DPDediscoPCCNetworkingService

- (_DPDediscoPCCNetworkingService)init
{
  return (_DPDediscoPCCNetworkingService *)_DPDediscoPCCNetworkingService.init()();
}

- (id)submitSyncronouslyWithSerializedPayload:(id)a3 baaCertificateChain:(id)a4 baaSignature:(id)a5 options:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  uint64_t v13 = sub_100058D80();
  unint64_t v15 = v14;

  uint64_t v16 = sub_100058D80();
  unint64_t v18 = v17;

  id v19 = _s19DPSubmissionService023_DPDediscoPCCNetworkingB0C18submitSyncronously17serializedPayload19baaCertificateChain0I9Signature7optionsSo7NSErrorCSg10Foundation4DataV_AA017_DPBAACertificateK0CANSo24DediscoNetworkingOptionsVtF_0(v13, v15, (uint64_t)v10, v16, v18);
  sub_100016B2C(v16, v18);
  sub_100016B2C(v13, v15);

  return v19;
}

- (void).cxx_destruct
{
  sub_100016B84((uint64_t)self + OBJC_IVAR____DPDediscoPCCNetworkingService_database);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____DPDediscoPCCNetworkingService_timeout;
  uint64_t v4 = sub_100059020();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end