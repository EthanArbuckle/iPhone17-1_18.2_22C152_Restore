@interface VOTBrailleGestureSpellingSuggestionHandler
- (id)_generateSpellingSuggestionsForResponder:(id)a3 languageCode:(id)a4;
- (id)_spellingSuggestionsForWord:(id)a3 languageCode:(id)a4;
- (id)_updateRangeToReplaceInContext:(id)a3 selectedRange:(_NSRange)a4;
- (id)applySpellingSuggestionForResponder:(id)a3 languageCode:(id)a4;
- (id)currentSpellingSuggestion;
- (void)clearSpellingSuggestions;
- (void)selectNextSpellingSuggestionInDirection:(int64_t)a3 responder:(id)a4 languageCode:(id)a5;
@end

@implementation VOTBrailleGestureSpellingSuggestionHandler

- (id)_updateRangeToReplaceInContext:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10003E060;
  v15 = sub_10003E070;
  id v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003E078;
  v10[3] = &unk_1001B3FB8;
  v10[6] = location;
  v10[7] = length;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, objc_msgSend(v7, "length"), 1027, v10);
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)_spellingSuggestionsForWord:(id)a3 languageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    textChecker = self->_textChecker;
    if (!textChecker)
    {
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x2050000000;
      v9 = (void *)qword_1001EB8C0;
      uint64_t v19 = qword_1001EB8C0;
      if (!qword_1001EB8C0)
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10003E76C;
        v15[3] = &unk_1001B3FE0;
        v15[4] = &v16;
        sub_10003E76C((uint64_t)v15);
        v9 = (void *)v17[3];
      }
      v10 = v9;
      _Block_object_dispose(&v16, 8);
      uint64_t v11 = (UITextChecker *)objc_alloc_init(v10);
      v12 = self->_textChecker;
      self->_textChecker = v11;

      textChecker = self->_textChecker;
    }
    uint64_t v13 = -[UITextChecker guessesForWordRange:inString:language:](textChecker, "guessesForWordRange:inString:language:", 0, [v6 length], v6, v7);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_generateSpellingSuggestionsForResponder:(id)a3 languageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 string];

    id v8 = (void *)v9;
  }
  id v10 = [v6 selectedTextRange];
  v12 = -[VOTBrailleGestureSpellingSuggestionHandler _updateRangeToReplaceInContext:selectedRange:](self, "_updateRangeToReplaceInContext:selectedRange:", v8, v10, v11);
  uint64_t v13 = [(VOTBrailleGestureSpellingSuggestionHandler *)self _spellingSuggestionsForWord:v12 languageCode:v7];

  if (v12)
  {
    if (v13)
    {
      v17 = v12;
      v14 = +[NSArray arrayWithObjects:&v17 count:1];
      v15 = [v14 arrayByAddingObjectsFromArray:v13];
    }
    else
    {
      uint64_t v18 = v12;
      v15 = +[NSArray arrayWithObjects:&v18 count:1];
    }
  }
  else
  {

    v15 = &__NSArray0__struct;
  }

  return v15;
}

- (void)selectNextSpellingSuggestionInDirection:(int64_t)a3 responder:(id)a4 languageCode:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  spellingSuggestions = self->_spellingSuggestions;
  if (!spellingSuggestions)
  {
    id v10 = [(VOTBrailleGestureSpellingSuggestionHandler *)self _generateSpellingSuggestionsForResponder:v16 languageCode:v8];
    uint64_t v11 = self->_spellingSuggestions;
    self->_spellingSuggestions = v10;

    self->_spellingSuggestionIndex = 0;
    spellingSuggestions = self->_spellingSuggestions;
  }
  if ([(NSArray *)spellingSuggestions count])
  {
    if (a3 == 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = self->_spellingSuggestionIndex + v12;
    self->_spellingSuggestionIndex = v13;
    NSUInteger v14 = [(NSArray *)self->_spellingSuggestions count];
    if ((v13 & 0x8000000000000000) != 0)
    {
      int64_t v15 = v14 - 1;
    }
    else
    {
      if (v13 < v14) {
        goto LABEL_12;
      }
      int64_t v15 = 0;
    }
    self->_spellingSuggestionIndex = v15;
  }
LABEL_12:
}

- (id)currentSpellingSuggestion
{
  unint64_t spellingSuggestionIndex = self->_spellingSuggestionIndex;
  if ((spellingSuggestionIndex & 0x8000000000000000) != 0
    || spellingSuggestionIndex >= [(NSArray *)self->_spellingSuggestions count])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NSArray *)self->_spellingSuggestions objectAtIndexedSubscript:self->_spellingSuggestionIndex];
  }

  return v4;
}

- (id)applySpellingSuggestionForResponder:(id)a3 languageCode:(id)a4
{
  id v5 = a3;
  id v6 = [(VOTBrailleGestureSpellingSuggestionHandler *)self currentSpellingSuggestion];
  if (v6)
  {
    objc_msgSend(v5, "setSelectedTextRange:refreshBraille:", self->_rangeToReplace.location, self->_rangeToReplace.length, 1);
    [v5 performTextOperation:kAXTextOperationActionDelete];
    id v7 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = NSStringFromRange(self->_rangeToReplace);
      int v12 = 138478083;
      unint64_t v13 = v11;
      __int16 v14 = 2113;
      int64_t v15 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Replaced word at range %{private}@ with \"%{private}@\"", (uint8_t *)&v12, 0x16u);
    }
    [v5 insertText:v6 source:3];
    id v8 = [(NSArray *)self->_spellingSuggestions objectAtIndexedSubscript:self->_spellingSuggestionIndex];
    self->_rangeToReplace.NSUInteger length = (NSUInteger)[v8 length];

    id v9 = v6;
  }

  return v6;
}

- (void)clearSpellingSuggestions
{
  spellingSuggestions = self->_spellingSuggestions;
  self->_spellingSuggestions = 0;

  self->_unint64_t spellingSuggestionIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_rangeToReplace = (_NSRange)xmmword_10016E5C0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spellingSuggestions, 0);

  objc_storeStrong((id *)&self->_textChecker, 0);
}

@end