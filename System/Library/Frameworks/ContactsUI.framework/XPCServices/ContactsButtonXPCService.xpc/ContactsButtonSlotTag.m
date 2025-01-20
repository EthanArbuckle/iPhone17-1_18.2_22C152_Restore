@interface ContactsButtonSlotTag
+ (int64_t)cacheLimit;
- ($BEA516A46C1BA1F84587E5D243A711F7)backgroundStatisticsRegionForStyle:(id)a3;
- (_TtC24ContactsButtonXPCService21ContactsButtonSlotTag)init;
- (id)resolvedStyleForStyle:(id)a3;
- (unint64_t)hitTestInformationMaskForStyle:(id)a3;
@end

@implementation ContactsButtonSlotTag

+ (int64_t)cacheLimit
{
  return 0;
}

- (unint64_t)hitTestInformationMaskForStyle:(id)a3
{
  return 14;
}

- (id)resolvedStyleForStyle:(id)a3
{
  v10[4] = sub_10000C0A4;
  v10[5] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_10000C0F4;
  v10[3] = &unk_1000295A8;
  v5 = _Block_copy(v10);
  id v6 = a3;
  v7 = self;
  id v8 = [v6 copyWithChangeBlock:v5];
  _Block_release(v5);

  return v8;
}

- ($BEA516A46C1BA1F84587E5D243A711F7)backgroundStatisticsRegionForStyle:(id)a3
{
  id v4 = a3;
  v5 = self;
  $BEA516A46C1BA1F84587E5D243A711F7 v6 = ($BEA516A46C1BA1F84587E5D243A711F7)[v4 displayScale];
  if ((v6.var0 & 0x80) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  char var0 = v6.var0;
  unsigned __int16 v8 = (unsigned __int16)[v4 displayScale];

  if (((20 * v8) & 0x1F00) != 0)
  {
LABEL_5:
    __break(1u);
    return v6;
  }
  return ($BEA516A46C1BA1F84587E5D243A711F7)(0x1000100010001 * (2 * (var0 & 0x7F) + (20 * v8)));
}

- (_TtC24ContactsButtonXPCService21ContactsButtonSlotTag)init
{
  result = (_TtC24ContactsButtonXPCService21ContactsButtonSlotTag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1000124F4(*(void *)&self->UISSlotTag_opaque[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData], *(void *)&self->frame[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData]);
  v3 = *(void **)&self->UISSlotTag_opaque[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_contactBadge];
}

@end