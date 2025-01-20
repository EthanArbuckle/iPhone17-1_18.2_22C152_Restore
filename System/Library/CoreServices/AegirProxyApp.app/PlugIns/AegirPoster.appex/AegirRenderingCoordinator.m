@interface AegirRenderingCoordinator
- (void)astronomyVistaViewContentsAnimationFinished:(id)a3;
- (void)pulseAnimationDidFinish;
@end

@implementation AegirRenderingCoordinator

- (void)pulseAnimationDidFinish
{
  uint64_t v2 = qword_100044920;
  v3 = off_100044928;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v5._countAndFlagsBits = v2;
  v5._object = v3;
  sub_100031928(v5);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100014818(0);

  swift_release();
}

- (void)astronomyVistaViewContentsAnimationFinished:(id)a3
{
  uint64_t v4 = sub_100031B18();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  swift_retain();
  sub_100031AD8();
  v9 = sub_100031AF8();
  os_log_type_t v10 = sub_100031F18();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "astronomyVistaViewContentsAnimationFinished", v11, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
}

@end