@interface BRLTJBrailleString
- (BOOL)isStageEmpty;
- (BRLTJBrailleString)initWithUnderlyingObject:(id)a3;
- (BRLTJBrailleStringInternal)underlyingObject;
- (NSString)stageSignalledString;
- (NSString)string;
- (_NSRange)NSFocus;
- (_NSRange)NSSelection;
- (_NSRange)NSStage;
- (_NSRange)NSSuggestion;
- (id)stageString;
@end

@implementation BRLTJBrailleString

- (BRLTJBrailleString)initWithUnderlyingObject:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTJBrailleString;
  v5 = [(BRLTJBrailleString *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    underlyingObject = v5->_underlyingObject;
    v5->_underlyingObject = (BRLTJBrailleStringInternal *)v6;
  }
  return v5;
}

- (NSString)string
{
  return [(BRLTJEditableStringInternal *)self->_underlyingObject string];
}

- (_NSRange)NSSelection
{
  v3 = [(BRLTJEditableStringInternal *)self->_underlyingObject string];
  uint64_t v4 = [(BRLTJEditableStringInternal *)self->_underlyingObject NSSelection];
  unint64_t v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)NSFocus
{
  v3 = [(BRLTJEditableStringInternal *)self->_underlyingObject string];
  uint64_t v4 = [(BRLTJEditableStringInternal *)self->_underlyingObject NSFocus];
  unint64_t v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)NSSuggestion
{
  v3 = [(BRLTJEditableStringInternal *)self->_underlyingObject string];
  uint64_t v4 = [(BRLTJEditableStringInternal *)self->_underlyingObject NSSuggestion];
  unint64_t v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)NSStage
{
  v3 = [(BRLTJEditableStringInternal *)self->_underlyingObject string];
  uint64_t v4 = [(BRLTJBrailleStringInternal *)self->_underlyingObject NSStage];
  unint64_t v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (NSString)stageSignalledString
{
  return [(BRLTJBrailleStringInternal *)self->_underlyingObject stageSignalledString];
}

- (BOOL)isStageEmpty
{
  return [(BRLTJBrailleStringInternal *)self->_underlyingObject isStageEmpty];
}

- (id)stageString
{
  return [(BRLTJBrailleStringInternal *)self->_underlyingObject stageString];
}

- (BRLTJBrailleStringInternal)underlyingObject
{
  return (BRLTJBrailleStringInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end