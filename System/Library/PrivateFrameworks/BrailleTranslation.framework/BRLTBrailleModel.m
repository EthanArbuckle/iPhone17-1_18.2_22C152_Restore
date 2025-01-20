@interface BRLTBrailleModel
+ (id)sharedModel;
- (BOOL)brailleStringDirty;
- (BOOL)editable;
- (BOOL)handleBrailleSelection:(_NSRange)a3;
- (BOOL)handleDelete;
- (BOOL)handleDeleteSilently;
- (BOOL)handleEscape;
- (BOOL)handleReturn;
- (BOOL)isCandidateSelectionActive;
- (BOOL)isWordDescriptionActive;
- (BOOL)technicalMode;
- (BRLTBrailleModel)initWithUnderlyingObject:(id)a3;
- (BRLTBrailleModelInternal)underlyingObject;
- (_NSRange)scriptRangeOfBrailleCellRepresentingCharacterAtScriptIndex:(int64_t)a3;
- (id)bufferBrailleString;
- (id)displayedBraille;
- (id)displayedScript;
- (int64_t)scriptLocationForBrailleLocation:(int64_t)a3;
- (void)_resetForTest;
- (void)forceTranslate;
- (void)handleBrailleDotPress:(id)a3;
- (void)handleWordDescriptionCommand;
- (void)setAlert:(id)a3;
- (void)setBackTranslateByCell:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setInputTableIdentifier:(id)a3 manager:(id)a4;
- (void)setOutputTableIdentifier:(id)a3 manager:(id)a4;
- (void)setScript:(id)a3;
- (void)setTechnicalMode:(BOOL)a3;
- (void)setTerminalOutput:(id)a3;
- (void)showNextCandidate;
- (void)showNextWordDescription;
- (void)showPreviousCandidate;
- (void)showPreviousWordDescription;
@end

@implementation BRLTBrailleModel

- (BRLTBrailleModel)initWithUnderlyingObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTBrailleModel;
  v6 = [(BRLTBrailleModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingObject, a3);
  }

  return v7;
}

+ (id)sharedModel
{
  v2 = [BRLTBrailleModel alloc];
  v3 = +[BRLTBrailleModelInternal shared];
  v4 = [(BRLTBrailleModel *)v2 initWithUnderlyingObject:v3];

  return v4;
}

- (void)setInputTableIdentifier:(id)a3 manager:(id)a4
{
}

- (void)setOutputTableIdentifier:(id)a3 manager:(id)a4
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setBackTranslateByCell:(BOOL)a3
{
}

- (BOOL)technicalMode
{
  return [(BRLTBrailleModelInternal *)self->_underlyingObject technicalMode];
}

- (void)setTechnicalMode:(BOOL)a3
{
}

- (BOOL)brailleStringDirty
{
  return [(BRLTBrailleModelInternal *)self->_underlyingObject brailleStringDirty];
}

- (BOOL)isCandidateSelectionActive
{
  return [(BRLTBrailleModelInternal *)self->_underlyingObject isCandidateSelectionActive];
}

- (id)displayedScript
{
  v3 = [BRLTEditString alloc];
  v4 = [(BRLTBrailleModelInternal *)self->_underlyingObject displayedScript];
  id v5 = [(BRLTEditString *)v3 initWithUnderlyingObject:v4];

  return v5;
}

- (id)displayedBraille
{
  v3 = [BRLTEditString alloc];
  v4 = [(BRLTBrailleModelInternal *)self->_underlyingObject displayedBraille];
  id v5 = [(BRLTEditString *)v3 initWithUnderlyingObject:v4];

  return v5;
}

- (id)bufferBrailleString
{
  return [(BRLTBrailleModelInternal *)self->_underlyingObject bufferBrailleString];
}

- (int64_t)scriptLocationForBrailleLocation:(int64_t)a3
{
  return [(BRLTBrailleModelInternal *)self->_underlyingObject scriptLocationForBrailleLocation:a3];
}

- (_NSRange)scriptRangeOfBrailleCellRepresentingCharacterAtScriptIndex:(int64_t)a3
{
  NSUInteger v3 = [(BRLTBrailleModelInternal *)self->_underlyingObject scriptRangeOfBrailleCellRepresentingCharacterAt:a3];
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)setScript:(id)a3
{
  underlyingObject = self->_underlyingObject;
  id v4 = [a3 underlyingObject];
  [(BRLTBrailleModelInternal *)underlyingObject setScript:v4];
}

- (void)setAlert:(id)a3
{
  underlyingObject = self->_underlyingObject;
  id v4 = [a3 underlyingObject];
  [(BRLTBrailleModelInternal *)underlyingObject setAlert:v4];
}

- (void)setTerminalOutput:(id)a3
{
  underlyingObject = self->_underlyingObject;
  id v4 = [a3 underlyingObject];
  [(BRLTBrailleModelInternal *)underlyingObject setTerminalOutput:v4];
}

- (BOOL)editable
{
  return [(BRLTBrailleModelInternal *)self->_underlyingObject editable];
}

- (void)setEditable:(BOOL)a3
{
}

- (void)forceTranslate
{
}

- (void)handleBrailleDotPress:(id)a3
{
}

- (BOOL)handleDelete
{
  return [(BRLTBrailleModelInternal *)self->_underlyingObject handleDeleteWithSilently:0];
}

- (BOOL)handleDeleteSilently
{
  return [(BRLTBrailleModelInternal *)self->_underlyingObject handleDeleteWithSilently:1];
}

- (BOOL)handleBrailleSelection:(_NSRange)a3
{
  return -[BRLTBrailleModelInternal handleBrailleSelectionWithNSSelection:](self->_underlyingObject, "handleBrailleSelectionWithNSSelection:", a3.location, a3.length);
}

- (BOOL)handleEscape
{
  return [(BRLTBrailleModelInternal *)self->_underlyingObject handleEscape];
}

- (BOOL)handleReturn
{
  return [(BRLTBrailleModelInternal *)self->_underlyingObject handleReturn];
}

- (void)showNextCandidate
{
}

- (void)showPreviousCandidate
{
}

- (BOOL)isWordDescriptionActive
{
  return [(BRLTBrailleModelInternal *)self->_underlyingObject isWordDescriptionActive];
}

- (void)showNextWordDescription
{
}

- (void)showPreviousWordDescription
{
}

- (void)handleWordDescriptionCommand
{
}

- (void)_resetForTest
{
}

- (BRLTBrailleModelInternal)underlyingObject
{
  return (BRLTBrailleModelInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end