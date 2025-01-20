@interface SPCarrierBundleViewModel
- (_TtC13FTMInternal_424SPCarrierBundleViewModel)init;
- (void)carrierBundleDidUpdate;
@end

@implementation SPCarrierBundleViewModel

- (_TtC13FTMInternal_424SPCarrierBundleViewModel)init
{
  return (_TtC13FTMInternal_424SPCarrierBundleViewModel *)sub_1001AB08C();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC13FTMInternal_424SPCarrierBundleViewModel__dualSim;
  uint64_t v4 = sub_100157064((uint64_t *)&unk_1002DA220);
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v6((char *)self + OBJC_IVAR____TtC13FTMInternal_424SPCarrierBundleViewModel__slicingSetup, v4);
  v6((char *)self + OBJC_IVAR____TtC13FTMInternal_424SPCarrierBundleViewModel__slicingTestApp, v4);
  v5 = (char *)self + OBJC_IVAR____TtC13FTMInternal_424SPCarrierBundleViewModel__llphsTestApp;

  v6(v5, v4);
}

- (void)carrierBundleDidUpdate
{
  uint64_t v2 = qword_1002D7B38;
  v7 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_1001A9488(v3, (uint64_t)qword_1002E31F0);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "delegate callback received", v6, 2u);
    swift_slowDealloc();
  }

  sub_1001AA850();
}

@end