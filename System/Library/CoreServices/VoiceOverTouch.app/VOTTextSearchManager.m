@interface VOTTextSearchManager
+ (id)sharedManager;
+ (void)initialize;
- (BOOL)textSearchModeIsOn;
- (NSString)currentSearchValue;
- (VOTBrailleManager)brailleManager;
- (VOTTextSearchManager)init;
- (void)_handleArrowKey:(id)a3;
- (void)_handleDelete:(id)a3;
- (void)_handleLetter:(id)a3;
- (void)_handleRightLeftMovement:(id)a3;
- (void)_handleUpDownMovement:(id)a3;
- (void)_syncSearchBufferHistory;
- (void)_updateBrailleWithBuffer;
- (void)beginNewTextSearchSession;
- (void)endTextSearchSession;
- (void)handleReplaceRange:(_NSRange)a3 withString:(id)a4 cursor:(int64_t)a5;
- (void)handleTextSearchEvent:(id)a3;
- (void)setBrailleManager:(id)a3;
- (void)setCurrentSearchValue:(id)a3;
@end

@implementation VOTTextSearchManager

+ (void)initialize
{
  id v2 = [objc_allocWithZone((Class)VOTTextSearchManager) init];
  uint64_t v3 = qword_1001EBC90;
  qword_1001EBC90 = (uint64_t)v2;

  _objc_release_x1(v2, v3);
}

+ (id)sharedManager
{
  return (id)qword_1001EBC90;
}

- (VOTTextSearchManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)VOTTextSearchManager;
  id v2 = [(VOTTextSearchManager *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[VOTConfiguration rootConfiguration];
    v4 = [v3 preferenceForKey:@"SearchBufferHistory"];
    v5 = (NSMutableArray *)[v4 mutableCopyWithZone:0];
    history = v2->_history;
    v2->_history = v5;

    if (!v2->_history)
    {
      v7 = (NSMutableArray *)[objc_allocWithZone((Class)NSMutableArray) init];
      v8 = v2->_history;
      v2->_history = v7;
    }
    v9 = (NSMutableString *)[objc_allocWithZone((Class)NSMutableString) init];
    buffer = v2->_buffer;
    v2->_buffer = v9;

    v2->_textSearchModeIsOn = 0;
    v11 = v2;
  }

  return v2;
}

- (void)_syncSearchBufferHistory
{
  if ((unint64_t)[(NSMutableArray *)self->_history count] >= 0x1F) {
    -[NSMutableArray removeObjectsInRange:](self->_history, "removeObjectsInRange:", 30, (char *)[(NSMutableArray *)self->_history count] - 30);
  }
  id v3 = +[VOTConfiguration rootConfiguration];
  [v3 setPreference:self->_history forKey:@"SearchBufferHistory"];
}

- (void)beginNewTextSearchSession
{
  [(NSMutableString *)self->_buffer setString:&stru_1001B7888];
  self->_bufferIndex = 0;
  self->_textSearchModeIsOn = 1;

  [(VOTTextSearchManager *)self _updateBrailleWithBuffer];
}

- (void)endTextSearchSession
{
  self->_textSearchModeIsOn = 0;
  history = self->_history;
  id v4 = [(NSMutableString *)self->_buffer copy];
  [(NSMutableArray *)history insertObject:v4 atIndex:0];

  [(VOTTextSearchManager *)self performSelector:"_syncSearchBufferHistory" withObject:0 afterDelay:0.5];
}

- (void)setCurrentSearchValue:(id)a3
{
  [(NSMutableString *)self->_buffer setString:a3];

  [(VOTTextSearchManager *)self _updateBrailleWithBuffer];
}

- (NSString)currentSearchValue
{
  return (NSString *)self->_buffer;
}

- (void)_handleRightLeftMovement:(id)a3
{
  id v4 = a3;
  int64_t bufferIndex = self->_bufferIndex;
  id v21 = v4;
  v6 = [v4 keyInfo];
  unsigned int v7 = [v6 keyCode];

  if (v7 == 80)
  {
    objc_super v13 = [v21 keyInfo];
    unsigned int v14 = [v13 isCommandKeyPressed];

    if (v14)
    {
      if (self->_bufferIndex) {
        int64_t bufferIndex = 0;
      }
      else {
        int64_t bufferIndex = -1;
      }
    }
    else
    {
      --bufferIndex;
    }
  }
  else if (v7 == 79)
  {
    v8 = [v21 keyInfo];
    unsigned int v9 = [v8 isCommandKeyPressed];

    if (v9)
    {
      int64_t v10 = self->_bufferIndex;
      id v11 = [(NSMutableString *)self->_buffer length];
      id v12 = [(NSMutableString *)self->_buffer length];
      if ((id)v10 == v11) {
        int64_t bufferIndex = (int64_t)v12 + 1;
      }
      else {
        int64_t bufferIndex = (int64_t)v12;
      }
    }
    else
    {
      ++bufferIndex;
    }
  }
  id v15 = [(NSMutableString *)self->_buffer length];
  if (bufferIndex < 0 || bufferIndex > (unint64_t)v15)
  {
    v18 = +[VOTOutputManager outputManager];
    v19 = +[VOSOutputEvent BoundaryEncountered];
    [v18 sendEvent:v19];

    goto LABEL_22;
  }
  int64_t v16 = self->_bufferIndex;
  int64_t v17 = bufferIndex - v16;
  if (bufferIndex >= v16)
  {
    if (bufferIndex <= v16)
    {
      v18 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    int64_t v17 = v16 - bufferIndex;
    int64_t v16 = bufferIndex;
  }
  v18 = -[NSMutableString substringWithRange:](self->_buffer, "substringWithRange:", v16, v17);
LABEL_21:
  id v20 = sub_10000ABF8(v18, 0, 0);
  self->_int64_t bufferIndex = bufferIndex;
LABEL_22:
}

- (void)_handleUpDownMovement:(id)a3
{
  id v4 = [a3 keyInfo];
  unsigned int v5 = [v4 keyCode];
  int64_t historyIndex = self->_historyIndex;
  if (v5 == 82) {
    unint64_t v7 = historyIndex + 1;
  }
  else {
    unint64_t v7 = historyIndex - 1;
  }

  if ((v7 & 0x8000000000000000) != 0)
  {
    [(NSMutableString *)self->_buffer setString:&stru_1001B7888];
    self->_int64_t bufferIndex = 0;
  }
  else if (v7 < (unint64_t)[(NSMutableArray *)self->_history count])
  {
    id v10 = [(NSMutableArray *)self->_history objectAtIndex:v7];
    id v8 = sub_10000ABF8(v10, 0, 0);
    [(NSMutableString *)self->_buffer setString:v10];
    self->_int64_t bufferIndex = (int64_t)[v10 length];
    self->_int64_t historyIndex = v7;
    goto LABEL_9;
  }
  id v10 = +[VOTOutputManager outputManager];
  unsigned int v9 = +[VOSOutputEvent BoundaryEncountered];
  [v10 sendEvent:v9];

LABEL_9:
}

- (void)_handleArrowKey:(id)a3
{
  id v7 = a3;
  id v4 = [v7 keyInfo];
  unsigned int v5 = [v4 keyCode];

  if (v5 - 81 < 2)
  {
    [(VOTTextSearchManager *)self _handleUpDownMovement:v7];
  }
  else
  {
    v6 = v7;
    if (v5 - 79 > 1) {
      goto LABEL_6;
    }
    [(VOTTextSearchManager *)self _handleRightLeftMovement:v7];
  }
  v6 = v7;
LABEL_6:
}

- (void)_handleDelete:(id)a3
{
  id v20 = a3;
  id v4 = [v20 keyInfo];
  unsigned int v5 = [v4 keyCode];

  if (v5 == 42)
  {
    int64_t bufferIndex = self->_bufferIndex;
    if (bufferIndex)
    {
      int64_t v7 = bufferIndex - 1;
LABEL_9:
      uint64_t v13 = 1;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  id v8 = [v20 keyInfo];
  unsigned int v9 = [v8 keyCode];

  if (v9 == 76)
  {
    id v10 = self->_bufferIndex;
    if (v10 != [(NSMutableString *)self->_buffer length])
    {
      int64_t v7 = self->_bufferIndex;
      goto LABEL_9;
    }
LABEL_6:
    id v11 = +[VOTOutputManager outputManager];
    id v12 = +[VOSOutputEvent BoundaryEncountered];
    [v11 sendEvent:v12];
    goto LABEL_15;
  }
  int64_t v7 = 0;
  uint64_t v13 = 0;
LABEL_10:
  unsigned int v14 = [v20 keyInfo];
  unsigned int v15 = [v14 isCommandKeyPressed];

  if (v15) {
    uint64_t v13 = (uint64_t)[(NSMutableString *)self->_buffer length] - v7;
  }
  id v11 = -[NSMutableString substringWithRange:](self->_buffer, "substringWithRange:", v7, v13);
  -[NSMutableString replaceCharactersInRange:withString:](self->_buffer, "replaceCharactersInRange:withString:", v7, v13, &stru_1001B7888);
  self->_int64_t bufferIndex = v7;
  id v12 = [objc_allocWithZone((Class)VOTOutputRequest) init];
  id v16 = [v12 addString:v11];
  if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
  {
    int64_t v17 = [v12 lastAction];
    LODWORD(v18) = 0.75;
    v19 = +[NSNumber numberWithFloat:v18];
    [v17 setObject:v19 forVariant:32];
  }
  [v12 send];
LABEL_15:
}

- (void)_handleLetter:(id)a3
{
  id v4 = [a3 keyInfo];
  id v26 = [v4 characters];

  if ([v26 length])
  {
    int64_t bufferIndex = self->_bufferIndex;
    id v6 = [(NSMutableString *)self->_buffer length];
    buffer = self->_buffer;
    if ((id)bufferIndex == v6)
    {
      [(NSMutableString *)buffer appendString:v26];
      id v8 = [(NSMutableString *)self->_buffer length];
    }
    else
    {
      [(NSMutableString *)buffer insertString:v26 atIndex:self->_bufferIndex];
      id v8 = (id)(self->_bufferIndex + 1);
    }
    self->_int64_t bufferIndex = (int64_t)v8;
    unsigned int v9 = +[AXSettings sharedInstance];
    unint64_t v10 = (unint64_t)[v9 voiceOverHardwareTypingFeedback];

    id v11 = [objc_allocWithZone((Class)VOTOutputRequest) init];
    id v12 = v11;
    if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      id v13 = [v11 addString:v26];
      if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
      {
        unsigned int v14 = [v12 lastAction];
        LODWORD(v15) = 1.5;
        id v16 = +[NSNumber numberWithFloat:v15];
        [v14 setObject:v16 forVariant:32];
      }
    }
    if (v10 - 1 <= 1)
    {
      int64_t v17 = +[NSCharacterSet wordBreakCharacterSet];
      if (objc_msgSend(v17, "characterIsMember:", objc_msgSend(v26, "characterAtIndex:", 0))
        && (unint64_t)[(NSMutableString *)self->_buffer length] >= 2)
      {
        double v18 = -[NSMutableString rangeOfCharacterFromSet:options:range:](self->_buffer, "rangeOfCharacterFromSet:options:range:", v17, 4, 0, (char *)[(NSMutableString *)self->_buffer length] - 1);
        if (v18 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v19 = 0;
          id v20 = (char *)(self->_bufferIndex - 1);
        }
        else
        {
          v19 = v18;
          id v20 = (char *)((unsigned char *)[(NSMutableString *)self->_buffer length] - v18);
        }
        id v21 = -[NSMutableString substringWithRange:](self->_buffer, "substringWithRange:", v19, v20);
        v22 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
        v23 = [v21 stringByTrimmingCharactersInSet:v22];
        id v24 = [v23 length];

        if (v24) {
          id v25 = [v12 addString:v21];
        }
      }
    }
    [v12 send];
  }
}

- (void)handleTextSearchEvent:(id)a3
{
  id v9 = a3;
  id v4 = [v9 keyInfo];
  unsigned int v5 = [v4 keyDown];

  id v6 = v9;
  if (v5)
  {
    int64_t v7 = [v9 keyInfo];
    unsigned int v8 = [v7 keyCode];

    if (v8 - 79 >= 4)
    {
      if (v8 == 42 || v8 == 76) {
        [(VOTTextSearchManager *)self _handleDelete:v9];
      }
      else {
        [(VOTTextSearchManager *)self _handleLetter:v9];
      }
    }
    else
    {
      [(VOTTextSearchManager *)self _handleArrowKey:v9];
    }
    [(VOTTextSearchManager *)self _updateBrailleWithBuffer];
    id v6 = v9;
  }
}

- (void)handleReplaceRange:(_NSRange)a3 withString:(id)a4 cursor:(int64_t)a5
{
  length = (char *)a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  if (&length[location] > [(NSMutableString *)self->_buffer length]) {
    length = (char *)[(NSMutableString *)self->_buffer length] - location;
  }
  -[NSMutableString replaceCharactersInRange:withString:](self->_buffer, "replaceCharactersInRange:withString:", location, length, v9);
  if (a5 < 0 || (unint64_t)[(NSMutableString *)self->_buffer length] <= a5) {
    a5 = (int64_t)[(NSMutableString *)self->_buffer length];
  }
  self->_int64_t bufferIndex = a5;
}

- (void)_updateBrailleWithBuffer
{
  id v3 = [(VOTTextSearchManager *)self brailleManager];

  if (v3)
  {
    id v4 = [objc_alloc((Class)NSMutableAttributedString) initWithString:self->_buffer];
    id v5 = objc_alloc((Class)NSAttributedString);
    uint64_t v10 = kSCROEditableTextPaddingAttribute;
    id v11 = &__kCFBooleanTrue;
    id v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v7 = [v5 initWithString:@" " attributes:v6];
    [v4 appendAttributedString:v7];

    objc_msgSend(v4, "addAttribute:value:range:", kSCROEditableTextAttribute, &__kCFBooleanTrue, 0, objc_msgSend(v4, "length"));
    objc_msgSend(v4, "addAttribute:value:range:", kSCROCursorAttribute, &__kCFBooleanTrue, self->_bufferIndex, 1);
    unsigned int v8 = [(VOTTextSearchManager *)self brailleManager];
    id v9 = [(id)VOTSharedWorkspace selectedLanguage];
    objc_msgSend(v8, "setBrailleString:type:timeout:langCode:brailleLineRange:isBrailleLineRangeKnown:", v4, 1, v9, self->_bufferIndex, 1, 1, 1.0);
  }
}

- (VOTBrailleManager)brailleManager
{
  return self->_brailleManager;
}

- (void)setBrailleManager:(id)a3
{
}

- (BOOL)textSearchModeIsOn
{
  return self->_textSearchModeIsOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brailleManager, 0);
  objc_storeStrong((id *)&self->_buffer, 0);

  objc_storeStrong((id *)&self->_history, 0);
}

@end