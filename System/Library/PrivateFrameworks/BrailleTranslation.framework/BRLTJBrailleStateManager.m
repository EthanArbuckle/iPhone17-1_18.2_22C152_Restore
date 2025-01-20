@interface BRLTJBrailleStateManager
+ (id)manager;
- (BOOL)delete;
- (BOOL)forwardDelete;
- (BOOL)isCandidateSelectionActive;
- (BOOL)isEditing;
- (BOOL)isShowingAlert;
- (BOOL)isShowingTerminalOutput;
- (BOOL)isWordDescriptionActive;
- (BOOL)returnCommand;
- (BRLTJBrailleStateManager)initWithUnderlyingObject:(id)a3;
- (BRLTJBrailleStateManagerInternal)underlyingObject;
- (BRLTJBrailleString)displayedBraille;
- (BRLTJEditableString)displayedScript;
- (int64_t)scriptLocationForBrailleLocation:(int64_t)a3;
- (void)escapeCommand;
- (void)insertBrailleChar:(id)a3;
- (void)selectCandidate;
- (void)setBrailleSelection:(_NSRange)a3;
- (void)setDelegate:(id)a3;
- (void)setIsShowingAlert:(BOOL)a3;
- (void)setIsShowingTerminalOutput:(BOOL)a3;
- (void)setScript:(id)a3;
- (void)setTranslationDelegate:(id)a3 outputMode:(unint64_t)a4 inputMode:(unint64_t)a5 candidateSelectionLanguage:(id)a6;
- (void)showNextCandidate;
- (void)showNextWordDescription;
- (void)showPreviousCandidate;
- (void)showPreviousWordDescription;
- (void)startCandidateSelection;
- (void)wordDescriptionCommand;
@end

@implementation BRLTJBrailleStateManager

- (BRLTJBrailleStateManager)initWithUnderlyingObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTJBrailleStateManager;
  v6 = [(BRLTJBrailleStateManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingObject, a3);
  }

  return v7;
}

- (void)setDelegate:(id)a3
{
}

- (void)setTranslationDelegate:(id)a3 outputMode:(unint64_t)a4 inputMode:(unint64_t)a5 candidateSelectionLanguage:(id)a6
{
}

+ (id)manager
{
  v2 = [BRLTJBrailleStateManager alloc];
  v3 = +[BRLTJBrailleStateManagerInternal manager];
  v4 = [(BRLTJBrailleStateManager *)v2 initWithUnderlyingObject:v3];

  return v4;
}

- (BOOL)isEditing
{
  return [(BRLTJBrailleStateManagerInternal *)self->_underlyingObject isEditing];
}

- (void)setScript:(id)a3
{
  underlyingObject = self->_underlyingObject;
  id v4 = [a3 underlyingObject];
  [(BRLTJBrailleStateManagerInternal *)underlyingObject setScript:v4];
}

- (void)insertBrailleChar:(id)a3
{
  underlyingObject = self->_underlyingObject;
  uint64_t v4 = [a3 bits];
  [(BRLTJBrailleStateManagerInternal *)underlyingObject insertBrailleChar:v4];
}

- (BOOL)delete
{
  return [(BRLTJBrailleStateManagerInternal *)self->_underlyingObject delete];
}

- (BOOL)forwardDelete
{
  return [(BRLTJBrailleStateManagerInternal *)self->_underlyingObject forwardDelete];
}

- (void)escapeCommand
{
}

- (BOOL)returnCommand
{
  return [(BRLTJBrailleStateManagerInternal *)self->_underlyingObject returnCommand];
}

- (void)wordDescriptionCommand
{
}

- (void)setBrailleSelection:(_NSRange)a3
{
}

- (int64_t)scriptLocationForBrailleLocation:(int64_t)a3
{
  return [(BRLTJBrailleStateManagerInternal *)self->_underlyingObject scriptLocationForBrailleLocation:a3];
}

- (BOOL)isCandidateSelectionActive
{
  return [(BRLTJBrailleStateManagerInternal *)self->_underlyingObject isCandidateSelectionActive];
}

- (void)startCandidateSelection
{
}

- (void)showNextCandidate
{
}

- (void)showPreviousCandidate
{
}

- (void)selectCandidate
{
}

- (BOOL)isWordDescriptionActive
{
  return [(BRLTJBrailleStateManagerInternal *)self->_underlyingObject isWordDescriptionActive];
}

- (void)showNextWordDescription
{
}

- (void)showPreviousWordDescription
{
}

- (BOOL)isShowingAlert
{
  return [(BRLTJBrailleStateManagerInternal *)self->_underlyingObject isShowingAlert];
}

- (void)setIsShowingAlert:(BOOL)a3
{
}

- (BOOL)isShowingTerminalOutput
{
  return [(BRLTJBrailleStateManagerInternal *)self->_underlyingObject isShowingTerminalOutput];
}

- (void)setIsShowingTerminalOutput:(BOOL)a3
{
}

- (BRLTJEditableString)displayedScript
{
  v3 = [BRLTJEditableString alloc];
  uint64_t v4 = [(BRLTJBrailleStateManagerInternal *)self->_underlyingObject displayedScript];
  id v5 = [(BRLTJEditableString *)v3 initWithUnderlyingObject:v4];

  return v5;
}

- (BRLTJBrailleString)displayedBraille
{
  v3 = [BRLTJBrailleString alloc];
  uint64_t v4 = [(BRLTJBrailleStateManagerInternal *)self->_underlyingObject displayedBraille];
  id v5 = [(BRLTJBrailleString *)v3 initWithUnderlyingObject:v4];

  return v5;
}

- (BRLTJBrailleStateManagerInternal)underlyingObject
{
  return (BRLTJBrailleStateManagerInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end