@interface BRLTBrailleModelInternal
+ (BRLTBrailleModelInternal)shared;
- (BOOL)backTranslateByCell;
- (BOOL)brailleStringDirty;
- (BOOL)editable;
- (BOOL)handleBrailleSelectionWithNSSelection:(_NSRange)a3;
- (BOOL)handleDeleteWithSilently:(BOOL)a3;
- (BOOL)handleEscape;
- (BOOL)handleReturn;
- (BOOL)isCandidateSelectionActive;
- (BOOL)isWordDescriptionActive;
- (BOOL)technicalMode;
- (BRLTBrailleModelDelegate)delegate;
- (BRLTBrailleModelInternal)init;
- (BRLTEditStringInternal)displayedBraille;
- (BRLTEditStringInternal)displayedScript;
- (NSString)bufferBrailleString;
- (_NSRange)scriptRangeOfBrailleCellRepresentingCharacterAt:(int64_t)a3;
- (int64_t)scriptLocationForBrailleLocation:(int64_t)a3;
- (void)_resetForTest;
- (void)forceTranslate;
- (void)handleBrailleDotPress:(id)a3;
- (void)handleWordDescriptionCommand;
- (void)selectCandidate;
- (void)setAlert:(id)a3;
- (void)setBackTranslateByCell:(BOOL)a3;
- (void)setBrailleStringDirty:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setInputTableIdentifier:(id)a3 manager:(id)a4;
- (void)setIsWordDescriptionActive:(BOOL)a3;
- (void)setOutputTableIdentifier:(id)a3 manager:(id)a4;
- (void)setScript:(id)a3;
- (void)setTechnicalMode:(BOOL)a3;
- (void)setTerminalOutput:(id)a3;
- (void)showNextCandidate;
- (void)showNextWordDescription;
- (void)showPreviousCandidate;
- (void)showPreviousWordDescription;
@end

@implementation BRLTBrailleModelInternal

- (BRLTBrailleModelDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (BRLTBrailleModelDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)backTranslateByCell
{
  v2 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_backTranslateByCell;
  swift_beginAccess();
  return *v2;
}

- (void)setBackTranslateByCell:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_backTranslateByCell;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)technicalMode
{
  v2 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_technicalMode;
  swift_beginAccess();
  return *v2;
}

- (void)setTechnicalMode:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_technicalMode;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)editable
{
  v2 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_editable;
  swift_beginAccess();
  return *v2;
}

- (void)setEditable:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_editable;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)brailleStringDirty
{
  v2 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty;
  swift_beginAccess();
  return *v2;
}

- (void)setBrailleStringDirty:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)setOutputTableIdentifier:(id)a3 manager:(id)a4
{
}

- (void)setInputTableIdentifier:(id)a3 manager:(id)a4
{
}

- (BOOL)isCandidateSelectionActive
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (v2)
  {
    v3 = *(uint64_t (**)(uint64_t))(*(void *)v2 + 136);
    v4 = self;
    uint64_t v5 = swift_retain();
    char v6 = v3(v5);

    swift_release();
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

- (BRLTEditStringInternal)displayedScript
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_showingAlert)) {
    uint64_t v2 = &OBJC_IVAR___BRLTBrailleModelInternal_alertScript;
  }
  else {
    uint64_t v2 = &OBJC_IVAR___BRLTBrailleModelInternal_script;
  }
  return (BRLTEditStringInternal *)*(id *)((char *)&self->super.isa + *v2);
}

- (BRLTEditStringInternal)displayedBraille
{
  uint64_t v2 = self;
  v3 = sub_21C56D848();

  return (BRLTEditStringInternal *)v3;
}

- (NSString)bufferBrailleString
{
  uint64_t v2 = self;
  sub_21C56D980();

  v3 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)scriptLocationForBrailleLocation:(int64_t)a3
{
  long long v7 = *(_OWORD *)&self->inputTranslator[OBJC_IVAR___BRLTBrailleModelInternal_translationResult];
  uint64_t v8 = *(void *)&self->candidateManager[OBJC_IVAR___BRLTBrailleModelInternal_translationResult];
  long long v9 = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
  long long v10 = v7;
  uint64_t v11 = v8;
  v4 = self;
  sub_21C571BC4((uint64_t)&v9);
  sub_21C571BC4((uint64_t)&v10);
  sub_21C569DCC((uint64_t)&v11);
  int64_t v5 = sub_21C569330(a3);
  sub_21C571BF0((uint64_t)&v9);
  sub_21C571BF0((uint64_t)&v10);
  sub_21C569DF8((uint64_t)&v11);

  return v5;
}

+ (BRLTBrailleModelInternal)shared
{
  if (qword_267C89DD0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_267C89DD8;
  return (BRLTBrailleModelInternal *)v2;
}

- (BRLTBrailleModelInternal)init
{
  return (BRLTBrailleModelInternal *)sub_21C56DD3C();
}

- (void)setScript:(id)a3
{
  id v4 = a3;
  int64_t v5 = self;
  sub_21C56E018(v4);
}

- (void)setAlert:(id)a3
{
  id v4 = a3;
  int64_t v5 = self;
  sub_21C56E4AC(v4);
}

- (void)setTerminalOutput:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_script);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_script) = (Class)a3;
  id v5 = a3;
  char v6 = self;

  *((unsigned char *)&v6->super.isa + OBJC_IVAR___BRLTBrailleModelInternal_showingTerminalOutput) = 1;
  sub_21C570F48();
  sub_21C5740A4();
}

- (void)forceTranslate
{
  uint64_t v2 = self;
  sub_21C56E6F4();
}

- (void)handleBrailleDotPress:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_21C56E84C(v4);
}

- (BOOL)handleDeleteWithSilently:(BOOL)a3
{
  id v4 = self;
  char v5 = sub_21C56F0F0(0, a3);

  return v5 & 1;
}

- (BOOL)handleBrailleSelectionWithNSSelection:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  char v5 = self;
  uint64_t v6 = sub_21C57BDD8(location, length);
  LOBYTE(length) = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)v5->super.isa) + 0x458))(v6);

  return length & 1;
}

- (BOOL)handleEscape
{
  uint64_t v2 = self;
  char v3 = sub_21C5712C4();

  return v3 & 1;
}

- (BOOL)handleReturn
{
  uint64_t v2 = self;
  char v3 = sub_21C571528();

  return v3 & 1;
}

- (void)handleWordDescriptionCommand
{
  uint64_t v2 = self;
  sub_21C571790();
}

- (_NSRange)scriptRangeOfBrailleCellRepresentingCharacterAt:(int64_t)a3
{
  id v4 = self;
  uint64_t v5 = sub_21C57196C(a3);
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (void)showNextCandidate
{
  uint64_t v2 = self;
  sub_21C572064();
}

- (void)showPreviousCandidate
{
  uint64_t v2 = self;
  sub_21C5721C8();
}

- (void)selectCandidate
{
  uint64_t v2 = self;
  sub_21C57232C();
}

- (BOOL)isWordDescriptionActive
{
  uint64_t v2 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_isWordDescriptionActive;
  swift_beginAccess();
  return *v2;
}

- (void)setIsWordDescriptionActive:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___BRLTBrailleModelInternal_isWordDescriptionActive;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)showNextWordDescription
{
  uint64_t v2 = self;
  sub_21C573624();
}

- (void)showPreviousWordDescription
{
  uint64_t v2 = self;
  sub_21C573780();
}

- (void)_resetForTest
{
  uint64_t v2 = self;
  sub_21C574210();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
}

@end