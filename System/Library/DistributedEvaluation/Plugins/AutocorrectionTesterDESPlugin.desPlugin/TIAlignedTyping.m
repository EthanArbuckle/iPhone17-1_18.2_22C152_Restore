@interface TIAlignedTyping
- (BOOL)isAutocompleteTriggerForPreviousEntry;
- (BOOL)isRevisedAutocompleteEntry;
- (NSArray)documentStates;
- (NSArray)inlineCompletions;
- (NSArray)inserted;
- (NSArray)predicted;
- (NSArray)touched;
- (TIContinuousPath)path;
- (void)setDocumentStates:(id)a3;
- (void)setInlineCompletions:(id)a3;
- (void)setInserted:(id)a3;
- (void)setPath:(id)a3;
- (void)setPredicted:(id)a3;
- (void)setTouched:(id)a3;
@end

@implementation TIAlignedTyping

- (BOOL)isAutocompleteTriggerForPreviousEntry
{
  v2 = [(TIAlignedTyping *)self touched];
  v3 = [v2 lastObject];
  unsigned __int8 v4 = [v3 isEqualToString:@"<Autocorrect>"];

  return v4;
}

- (BOOL)isRevisedAutocompleteEntry
{
  v3 = [(TIAlignedTyping *)self touched];
  if ([v3 containsObject:@"<Autocorrect>"]) {
    unsigned int v4 = ![(TIAlignedTyping *)self isAutocompleteTriggerForPreviousEntry];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (NSArray)touched
{
  return self->_touched;
}

- (void)setTouched:(id)a3
{
}

- (NSArray)predicted
{
  return self->_predicted;
}

- (void)setPredicted:(id)a3
{
}

- (NSArray)inlineCompletions
{
  return self->_inlineCompletions;
}

- (void)setInlineCompletions:(id)a3
{
}

- (NSArray)inserted
{
  return self->_inserted;
}

- (void)setInserted:(id)a3
{
}

- (NSArray)documentStates
{
  return self->_documentStates;
}

- (void)setDocumentStates:(id)a3
{
}

- (TIContinuousPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_documentStates, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
  objc_storeStrong((id *)&self->_inlineCompletions, 0);
  objc_storeStrong((id *)&self->_predicted, 0);

  objc_storeStrong((id *)&self->_touched, 0);
}

@end