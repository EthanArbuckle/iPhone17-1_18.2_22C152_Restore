@interface DepthSettingsController
- (_TtC22DepthCompanionSettings23DepthSettingsController)initWithCoder:(id)a3;
- (_TtC22DepthCompanionSettings23DepthSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifiers;
- (void)openUserGuide;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DepthSettingsController

- (_TtC22DepthCompanionSettings23DepthSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_DAC8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC22DepthCompanionSettings23DepthSettingsController *)sub_97B4((uint64_t)a4, v6, a4);
}

- (_TtC22DepthCompanionSettings23DepthSettingsController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_ADB4();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DepthSettingsController();
  id v4 = v5.receiver;
  [(DepthSettingsController *)&v5 viewWillAppear:v3];
  objc_msgSend(v4, "reloadSpecifiers", v5.receiver, v5.super_class);
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = sub_9BC8();

  if (v3)
  {
    v4.super.isa = sub_DB38().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_D978();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_D968();
  id v10 = a3;
  v11 = self;
  sub_A290((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)openUserGuide
{
  sub_5A44(&qword_14CE0);
  __chkstk_darwin();
  v1 = (char *)v19 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_D928();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  objc_super v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v23 = 0xD000000000000025;
  unint64_t v24 = 0x800000000000F340;
  id v6 = [self sharedInstance];
  if (!v6)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v7 = v6;
  id v8 = [v6 getActivePairedDevice];

  if (!v8)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v9 = [v8 valueForProperty:NRDevicePropertyAbsoluteDepthLimit];

  if (v9)
  {
    sub_DC68();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }
  sub_59DC((uint64_t)&v20, (uint64_t)v22);
  sub_B268((uint64_t)v22, (uint64_t)&v20);
  if (!*((void *)&v21 + 1))
  {
    sub_B2D0((uint64_t)&v20, &qword_14960);
    goto LABEL_12;
  }
  sub_5DD8(0, &qword_14CE8);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    v26._object = (void *)0x800000000000F370;
    v26._countAndFlagsBits = 0xD000000000000013;
    sub_DB08(v26);
    goto LABEL_13;
  }
  id v10 = (void *)v19[1];
  Class isa = sub_DC08(6).super.super.isa;
  char v12 = sub_DC28();

  if ((v12 & 1) == 0)
  {

    goto LABEL_12;
  }
  v25._countAndFlagsBits = 0x333730396470612FLL;
  v25._object = (void *)0xED00003664333863;
  sub_DB08(v25);

LABEL_13:
  swift_bridgeObjectRetain();
  sub_D918();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_B2D0((uint64_t)v22, &qword_14960);
    swift_bridgeObjectRelease();
    v13 = &qword_14CE0;
    v14 = v1;
LABEL_17:
    sub_B2D0((uint64_t)v14, v13);
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v1, v2);
  if (UIApp)
  {
    id v15 = UIApp;
    swift_bridgeObjectRelease();
    sub_D908(v16);
    v18 = v17;
    [v15 openURL:v17 withCompletionHandler:0];

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v13 = &qword_14960;
    v14 = v22;
    goto LABEL_17;
  }
LABEL_20:
  __break(1u);
}

@end