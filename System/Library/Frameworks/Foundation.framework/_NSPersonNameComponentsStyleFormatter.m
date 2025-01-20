@interface _NSPersonNameComponentsStyleFormatter
- (BOOL)fullComponentsAreValid:(id)a3;
- (BOOL)isEnabled;
- (BOOL)shouldFallBack;
- (BOOL)shouldIgnoreComponentsContainingSpecialCharacters;
- (NSArray)fallbackDescriptor;
- (NSArray)orderedKeysOfInterest;
- (NSArray)orderedTemplate;
- (NSPersonNameComponentsFormatter)masterFormatter;
- (NSSet)abbreviatedKeys;
- (NSSet)keysOfInterest;
- (_NSPersonNameComponentsStyleFormatter)fallbackStyleFormatter;
- (_NSPersonNameComponentsStyleFormatter)initWithMasterFormatter:(id)a3;
- (id)_delimiterBetweenString:(id)a3 andString:(id)a4 isPhonetic:(BOOL)a5;
- (id)_formattedStringFromOrderedKeys:(id)a3 components:(id)a4 attributesByRange:(id)a5;
- (id)_orderedNonEmptyKeysFromComponents:(id)a3;
- (id)annotatedStringFromPersonNameComponents:(id)a3;
- (id)stringFromComponents:(id)a3 attributesByRange:(id)a4;
- (int64_t)ordering;
- (void)_releaseIvars;
- (void)dealloc;
- (void)setFallbackStyleFormatter:(id)a3;
- (void)setOrdering:(int64_t)a3;
@end

@implementation _NSPersonNameComponentsStyleFormatter

- (BOOL)isEnabled
{
  return ![(NSPersonNameComponentsFormatter *)[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter] __localizedRestrictionExistsForStyle:[(NSPersonNameComponentsFormatter *)[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter] style]];
}

- (id)stringFromComponents:(id)a3 attributesByRange:(id)a4
{
  id v7 = -[_NSPersonNameComponentsStyleFormatter _orderedNonEmptyKeysFromComponents:](self, "_orderedNonEmptyKeysFromComponents:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && +[NSPersonNameComponentsFormatter __shortStyleRestrictionExistsForComponents:a3 shortStyle:[(_NSPersonNameComponentsStyleFormatter *)self shortNameFormat]]|| ![(_NSPersonNameComponentsStyleFormatter *)self fullComponentsAreValid:a3]|| ![(_NSPersonNameComponentsStyleFormatter *)self isEnabled]|| [(NSPersonNameComponentsFormatter *)[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter] __localizedRestrictionExistsForComponents:a3 ignoreUndeterminedComponents:[(_NSPersonNameComponentsStyleFormatter *)self shouldIgnoreComponentsContainingSpecialCharacters]])
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [(_NSPersonNameComponentsStyleFormatter *)self _formattedStringFromOrderedKeys:v7 components:a3 attributesByRange:a4];
  }
  if ([v8 length]) {
    return v8;
  }
  if (![(_NSPersonNameComponentsStyleFormatter *)self shouldFallBack]
    || [(NSPersonNameComponentsFormatter *)[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter] _ignoresFallbacks]|| ![(_NSPersonNameComponentsStyleFormatter *)self fallbackStyleFormatter])
  {
    return 0;
  }
  v9 = [(_NSPersonNameComponentsStyleFormatter *)self fallbackStyleFormatter];

  return [(_NSPersonNameComponentsStyleFormatter *)v9 stringFromComponents:a3 attributesByRange:a4];
}

- (BOOL)fullComponentsAreValid:(id)a3
{
  return 1;
}

- (id)_orderedNonEmptyKeysFromComponents:(id)a3
{
  v7[5] = *MEMORY[0x1E4F143B8];
  [(_NSPersonNameComponentsStyleFormatter *)self setOrdering:[(NSPersonNameComponentsFormatter *)[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter] __computedNameOrderForComponents:a3]];
  v5 = [(_NSPersonNameComponentsStyleFormatter *)self orderedKeysOfInterest];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76___NSPersonNameComponentsStyleFormatter__orderedNonEmptyKeysFromComponents___block_invoke;
  v7[3] = &unk_1E51FE7D8;
  v7[4] = a3;
  return [(NSArray *)[(_NSPersonNameComponentsStyleFormatter *)self orderedKeysOfInterest] objectsAtIndexes:[(NSArray *)v5 indexesOfObjectsPassingTest:v7]];
}

- (NSArray)orderedKeysOfInterest
{
  v10[5] = *MEMORY[0x1E4F143B8];
  if (![(_NSPersonNameComponentsStyleFormatter *)self keysOfInterest]) {
    return 0;
  }
  v3 = [(_NSPersonNameComponentsStyleFormatter *)self orderedTemplate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62___NSPersonNameComponentsStyleFormatter_orderedKeysOfInterest__block_invoke;
  v10[3] = &unk_1E51FE7D8;
  v10[4] = self;
  v4 = [(NSArray *)v3 indexesOfObjectsPassingTest:v10];
  v5 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  BOOL v6 = [(NSPersonNameComponentsFormatter *)[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter] isPhonetic];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62___NSPersonNameComponentsStyleFormatter_orderedKeysOfInterest__block_invoke_2;
  v8[3] = &unk_1E51FE800;
  BOOL v9 = v6;
  v8[4] = self;
  v8[5] = v5;
  [(NSIndexSet *)v4 enumerateIndexesUsingBlock:v8];
  return v5;
}

- (NSPersonNameComponentsFormatter)masterFormatter
{
  return (NSPersonNameComponentsFormatter *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)orderedTemplate
{
  result = self->_orderedTemplate;
  if (!result)
  {
    if ([(_NSPersonNameComponentsStyleFormatter *)self ordering] == 2) {
      id v4 = +[NSPersonNameComponentsFormatter __familyNameFirstOrdering];
    }
    else {
      id v4 = +[NSPersonNameComponentsFormatter __givenNameFirstOrdering];
    }
    result = (NSArray *)(id)[v4 copy];
    self->_orderedTemplate = result;
  }
  return result;
}

- (void)setOrdering:(int64_t)a3
{
  self->_ordering = a3;
}

- (BOOL)shouldIgnoreComponentsContainingSpecialCharacters
{
  return 0;
}

- (id)_formattedStringFromOrderedKeys:(id)a3 components:(id)a4 attributesByRange:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__33;
  v16 = __Block_byref_object_dispose__33;
  v17 = 0;
  v17 = +[NSString string];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102___NSPersonNameComponentsStyleFormatter__formattedStringFromOrderedKeys_components_attributesByRange___block_invoke;
  v11[3] = &unk_1E51FE828;
  v11[4] = a4;
  v11[5] = self;
  v11[7] = a5;
  v11[8] = &v12;
  v11[6] = a3;
  [a3 enumerateObjectsUsingBlock:v11];
  BOOL v9 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (_NSPersonNameComponentsStyleFormatter)fallbackStyleFormatter
{
  return (_NSPersonNameComponentsStyleFormatter *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)ordering
{
  return self->_ordering;
}

- (BOOL)shouldFallBack
{
  return 1;
}

- (_NSPersonNameComponentsStyleFormatter)initWithMasterFormatter:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_NSPersonNameComponentsStyleFormatter;
  v5 = [(_NSPersonNameComponentsStyleFormatter *)&v7 init];
  if (v5)
  {
    if (!a3) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v5 file:@"NSPersonNameComponentsFormatter.m" lineNumber:746 description:@"We should never have a nil master formatter"];
    }
    v5->_masterFormatter = (NSPersonNameComponentsFormatter *)[a3 copy];
  }
  return v5;
}

- (void)setFallbackStyleFormatter:(id)a3
{
}

- (NSSet)abbreviatedKeys
{
  return 0;
}

- (id)_delimiterBetweenString:(id)a3 andString:(id)a4 isPhonetic:(BOOL)a5
{
  if (a5) {
    goto LABEL_9;
  }
  unint64_t v7 = +[NSPersonNameComponentsFormatter __inferredScriptIndexFromString:](NSPersonNameComponentsFormatter, "__inferredScriptIndexFromString:");
  unint64_t v8 = +[NSPersonNameComponentsFormatter __inferredScriptIndexFromString:a4];
  if (v7 - 2 > 3) {
    goto LABEL_9;
  }
  if (v8 - 3 < 3)
  {
LABEL_4:
    BOOL v9 = &stru_1ECA5C228;
    goto LABEL_10;
  }
  if (v8 != 2)
  {
LABEL_9:
    BOOL v9 = @" ";
  }
  else
  {
    if (!+[NSPersonNameComponentsFormatter isKatakana:](NSPersonNameComponentsFormatter, "isKatakana:", a3)|| !+[NSPersonNameComponentsFormatter isKatakana:a4])
    {
      goto LABEL_4;
    }
    BOOL v9 = @"・";
  }
LABEL_10:
  v10 = (void *)[(__CFString *)v9 copy];

  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(_NSPersonNameComponentsStyleFormatter *)self _releaseIvars];
  v3.receiver = self;
  v3.super_class = (Class)_NSPersonNameComponentsStyleFormatter;
  [(_NSPersonNameComponentsStyleFormatter *)&v3 dealloc];
}

- (void)_releaseIvars
{
  masterFormatter = self->_masterFormatter;
}

- (NSSet)keysOfInterest
{
  return 0;
}

- (id)annotatedStringFromPersonNameComponents:(id)a3
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  BOOL v6 = [(_NSPersonNameComponentsStyleFormatter *)self stringFromComponents:a3 attributesByRange:v5];
  if (!v6)
  {
    if (qword_1EB1ED0E8 != -1) {
      dispatch_once(&qword_1EB1ED0E8, &__block_literal_global_1459);
    }
    if (byte_1EB1ED049) {
      BOOL v6 = &stru_1ECA5C228;
    }
    else {
      BOOL v6 = 0;
    }
  }
  unint64_t v7 = [NSMutableAttributedString alloc];
  unint64_t v8 = [(NSMutableAttributedString *)v7 initWithString:v6 attributes:MEMORY[0x1E4F1CC08]];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81___NSPersonNameComponentsStyleFormatter_annotatedStringFromPersonNameComponents___block_invoke;
  v10[3] = &unk_1E51F7840;
  v10[4] = v8;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];
  return (id)[(NSMutableAttributedString *)v8 copy];
}

- (NSArray)fallbackDescriptor
{
  result = self->_fallbackDescriptor;
  if (!result)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[_NSPersonNameComponentsStyleFormatter orderedKeysOfInterest](self, "orderedKeysOfInterest"));
    if (v5) {
      [v4 addObject:v5];
    }
    BOOL v6 = [(_NSPersonNameComponentsStyleFormatter *)self fallbackStyleFormatter];
    if (v6)
    {
      unint64_t v7 = v6;
      do
      {
        unint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[_NSPersonNameComponentsStyleFormatter orderedKeysOfInterest](v7, "orderedKeysOfInterest"));
        if (v8)
        {
          BOOL v9 = v8;
          if ([v8 count])
          {
            if (([v4 containsObject:v9] & 1) == 0) {
              [v4 addObject:v9];
            }
          }
        }
        unint64_t v7 = [(_NSPersonNameComponentsStyleFormatter *)v7 fallbackStyleFormatter];
      }
      while (v7);
    }
    result = v4;
    self->_fallbackDescriptor = result;
  }
  return result;
}

@end