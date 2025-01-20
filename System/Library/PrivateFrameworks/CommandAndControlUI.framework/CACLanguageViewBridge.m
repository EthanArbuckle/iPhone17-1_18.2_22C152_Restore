@interface CACLanguageViewBridge
- (_TtC19CommandAndControlUI21CACLanguageViewBridge)init;
- (_TtP19CommandAndControlUI23CACLanguageViewDelegate_)delegate;
- (id)makeLanguageUI;
- (id)makeLanguageUIWithLocales:(id)a3;
- (void)cancelDownloadWithIdentifier:(id)a3;
- (void)downloadLanguageWithIdentifier:(id)a3;
- (void)selectedLanguageWithIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedWithLanguageIdentifier:(id)a3;
- (void)updateDownloadStatusWith:(id)a3;
- (void)updateInstallationStatusWith:(id)a3;
@end

@implementation CACLanguageViewBridge

- (_TtP19CommandAndControlUI23CACLanguageViewDelegate_)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP19CommandAndControlUI23CACLanguageViewDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC19CommandAndControlUI21CACLanguageViewBridge)init
{
  return (_TtC19CommandAndControlUI21CACLanguageViewBridge *)CACLanguageViewBridge.init()();
}

- (id)makeLanguageUI
{
  v2 = self;
  swift_retain();
  sub_23AADAE44(0, (uint64_t)v6);
  id v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_268A58940));
  v4 = (void *)sub_23AAE3C50();

  return v4;
}

- (id)makeLanguageUIWithLocales:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_23AAE4010();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  v6 = (void *)sub_23AADC978(v4);

  swift_bridgeObjectRelease();

  return v6;
}

- (void)setSelectedWithLanguageIdentifier:(id)a3
{
}

- (void)updateInstallationStatusWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23AADCCD8(v4);
}

- (void)updateDownloadStatusWith:(id)a3
{
  id v4 = a3;
  v14 = self;
  uint64_t v5 = sub_23AADE408(v4);
  if (v6)
  {
    uint64_t v9 = v5;
    uint64_t v10 = v6;
    uint64_t v11 = v7;
    char v12 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A58948);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23AAE4830;
    *(void *)(inited + 32) = v9;
    *(void *)(inited + 40) = v10;
    *(void *)(inited + 48) = v11;
    *(unsigned char *)(inited + 56) = v12 & 1;
    swift_retain();
    sub_23AAE23F4(inited);
    swift_setDeallocating();
    swift_arrayDestroy();

    swift_release();
  }
  else
  {
  }
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectRelease();
}

- (void)downloadLanguageWithIdentifier:(id)a3
{
}

- (void)cancelDownloadWithIdentifier:(id)a3
{
}

- (void)selectedLanguageWithIdentifier:(id)a3
{
}

@end