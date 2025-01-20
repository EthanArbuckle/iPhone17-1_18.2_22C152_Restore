@interface BRLTJBrailleStateManagerInternal
+ (BRLTJBrailleStateManagerInternal)manager;
- (BOOL)delete;
- (BOOL)forwardDelete;
- (BOOL)isCandidateSelectionActive;
- (BOOL)isEditing;
- (BOOL)isShowingAlert;
- (BOOL)isShowingTerminalOutput;
- (BOOL)isWordDescriptionActive;
- (BOOL)returnCommand;
- (BRLTJBrailleStateManagerInternal)init;
- (BRLTJBrailleStringInternal)displayedBraille;
- (BRLTJEditableStringInternal)displayedScript;
- (int64_t)scriptLocationForBrailleLocation:(int64_t)a3;
- (void)escapeCommand;
- (void)insertBrailleChar:(int64_t)a3;
- (void)selectCandidate;
- (void)setBrailleSelection:(_NSRange)a3;
- (void)setDelegate:(id)a3;
- (void)setIsShowingAlert:(BOOL)a3;
- (void)setIsShowingTerminalOutput:(BOOL)a3;
- (void)setIsWordDescriptionActive:(BOOL)a3;
- (void)setScript:(id)a3;
- (void)setTranslationDelegate:(id)a3 outputMode:(unint64_t)a4 inputMode:(unint64_t)a5 candidateSelectionLanguage:(id)a6;
- (void)showNextCandidate;
- (void)showNextWordDescription;
- (void)showPreviousCandidate;
- (void)showPreviousWordDescription;
- (void)startCandidateSelection;
- (void)wordDescriptionCommand;
@end

@implementation BRLTJBrailleStateManagerInternal

- (BRLTJBrailleStateManagerInternal)init
{
  return (BRLTJBrailleStateManagerInternal *)sub_21C57DB14();
}

+ (BRLTJBrailleStateManagerInternal)manager
{
  result = (BRLTJBrailleStateManagerInternal *)qword_267C89E20;
  if (qword_267C89E20
    || (id v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BRLTJBrailleStateManager()), sel_init),
        v4 = (void *)qword_267C89E20,
        qword_267C89E20 = (uint64_t)v3,
        v4,
        (result = (BRLTJBrailleStateManagerInternal *)qword_267C89E20) != 0))
  {
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)isEditing
{
  v2 = self;
  char v3 = sub_21C57DF3C();

  return v3 & 1;
}

- (void)setScript:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21C57E054(v4);
}

- (void)insertBrailleChar:(int64_t)a3
{
  id v4 = self;
  sub_21C57E5FC(a3);
}

- (BOOL)delete
{
  v2 = self;
  char v3 = sub_21C57F788();

  return v3 & 1;
}

- (BOOL)forwardDelete
{
  v2 = self;
  char v3 = sub_21C58005C();

  return v3 & 1;
}

- (void)escapeCommand
{
  v2 = self;
  sub_21C580580();
}

- (BOOL)returnCommand
{
  v2 = self;
  char v3 = sub_21C580720();

  return v3 & 1;
}

- (void)wordDescriptionCommand
{
  v2 = (void *)MEMORY[0x263F8EED0];
  char v3 = *(void (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x1E8);
  v5 = self;
  v3();
  if (v4)
  {
    swift_bridgeObjectRelease();
    if ((*(uint64_t (**)(void))((*v2 & (uint64_t)v5->super.isa) + 0x2F0))()) {
      sub_21C584EF0();
    }
    else {
      sub_21C5847E4();
    }
  }
}

- (void)setBrailleSelection:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6 = self;
  uint64_t v5 = sub_21C57BDD8(location, length);
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)v6->super.isa) + 0x1D0))(v5);
}

- (int64_t)scriptLocationForBrailleLocation:(int64_t)a3
{
  uint64_t v4 = self;
  int64_t v5 = sub_21C581820(a3);

  return v5;
}

- (BOOL)isCandidateSelectionActive
{
  void (*v2)(void *__return_ptr);
  BRLTJBrailleStateManagerInternal *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void v8[3];
  uint64_t v9;
  uint64_t v10;

  v2 = *(void (**)(void *__return_ptr))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x208);
  char v3 = self;
  v2(v8);
  uint64_t v4 = v9;
  int64_t v5 = v10;
  __swift_project_boxed_opaque_existential_0(v8, v9);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);

  return v6 & 1;
}

- (void)startCandidateSelection
{
  v2 = self;
  sub_21C58201C();
}

- (void)showNextCandidate
{
  v2 = self;
  sub_21C582550();
}

- (void)showPreviousCandidate
{
  v2 = self;
  sub_21C5826F8();
}

- (void)selectCandidate
{
  v2 = self;
  sub_21C5828A0();
}

- (BOOL)isShowingAlert
{
  v2 = (BOOL *)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingAlert;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShowingAlert:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingAlert;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BRLTJEditableStringInternal)displayedScript
{
  v2 = self;
  char v3 = (void *)sub_21C584290();

  return (BRLTJEditableStringInternal *)v3;
}

- (BRLTJBrailleStringInternal)displayedBraille
{
  v2 = self;
  id v3 = sub_21C58439C();

  return (BRLTJBrailleStringInternal *)v3;
}

- (BOOL)isWordDescriptionActive
{
  v2 = (BOOL *)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isWordDescriptionActive;
  swift_beginAccess();
  return *v2;
}

- (void)setIsWordDescriptionActive:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isWordDescriptionActive;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)showNextWordDescription
{
  v2 = self;
  sub_21C584C38();
}

- (void)showPreviousWordDescription
{
  v2 = self;
  sub_21C584D94();
}

- (BOOL)isShowingTerminalOutput
{
  v2 = (BOOL *)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingTerminalOutput;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShowingTerminalOutput:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingTerminalOutput;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateManager);

  swift_release();
}

- (void)setDelegate:(id)a3
{
  type metadata accessor for BRLTJStateNotifier();
  swift_unknownObjectRetain_n();
  int64_t v5 = self;
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier) = (Class)sub_21C586C8C((uint64_t)a3);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)setTranslationDelegate:(id)a3 outputMode:(unint64_t)a4 inputMode:(unint64_t)a5 candidateSelectionLanguage:(id)a6
{
  uint64_t v10 = sub_21C589C08();
  uint64_t v12 = v11;
  swift_unknownObjectRetain();
  v13 = self;
  BRLTJBrailleStateManager.setTranslationDelegate(_:outputMode:inputMode:candidateSelectionLanguage:)((uint64_t)a3, a4, a5, v10, v12);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end