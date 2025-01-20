@interface VOTRotor
+ (BOOL)rotorIsUsedForSettingAdjustment:(int64_t)a3;
+ (id)rotorTypeForPreferenceString:(id)a3;
+ (id)stringForRotorType:(int64_t)a3;
+ (id)systemRotorTypeForRotorType:(int64_t)a3;
+ (id)systemRotorTypeForSearchType:(int64_t)a3;
+ (int64_t)rotorTypeForSearchType:(int64_t)a3;
+ (int64_t)rotorTypeForSystemRotorType:(id)a3;
- (BOOL)inMisspelledWordRotor;
- (BOOL)rotorTypeIsValid:(int64_t)a3 eventOrigin:(int64_t)a4;
- (BOOL)verifyNoDuplicatesInRotor;
- (VOTElement)currentRotorElement;
- (VOTRotor)init;
- (VOTRotorDelegate)delegate;
- (id)_currentCustomRotorString;
- (id)currentRotorHint;
- (id)currentRotorString;
- (id)currentVisualRotorString;
- (id)customPublicRotors;
- (id)generateRotorTypeRequest;
- (id)rotorItems;
- (int64_t)currentRotorType;
- (int64_t)currentSelectionRotorType;
- (int64_t)customActionIndex;
- (int64_t)customRotorIndex;
- (int64_t)indexOfRotorItem:(int64_t)a3;
- (int64_t)previousRotorType;
- (int64_t)publicCustomRotorIndex;
- (int64_t)rotorCount;
- (int64_t)rotorIndex;
- (void)_moveRotor:(BOOL)a3 didWrap:(BOOL *)a4 userInitiated:(BOOL)a5 eventOrigin:(int64_t)a6;
- (void)clearRotorTypes;
- (void)dealloc;
- (void)decrement:(BOOL *)a3 userInitiated:(BOOL)a4 eventOrigin:(int64_t)a5;
- (void)increment:(BOOL *)a3 userInitiated:(BOOL)a4 eventOrigin:(int64_t)a5;
- (void)incrementDetectionRotor:(int64_t)a3;
- (void)setCurrentRotorElement:(id)a3;
- (void)setCurrentRotorType:(int64_t)a3 saveToPreferences:(BOOL)a4 userInitiated:(BOOL)a5;
- (void)setCustomActionIndex:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setRotorItems:(id)a3;
@end

@implementation VOTRotor

- (VOTRotor)init
{
  v7.receiver = self;
  v7.super_class = (Class)VOTRotor;
  v2 = [(VOTRotor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    typeKey = v2->_typeKey;
    v2->_typeKey = (NSString *)@"CurrentRotorTypeSimple";

    v3->_currentRotors = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
    v5 = v3;
  }

  return v3;
}

- (void)dealloc
{
  customPublicRotors = self->_customPublicRotors;
  self->_customPublicRotors = 0;

  self->_currentRotors = 0;
  customRotorActionCategories = self->_customRotorActionCategories;
  self->_customRotorActionCategories = 0;

  customContent = self->_customContent;
  self->_customContent = 0;

  v6.receiver = self;
  v6.super_class = (Class)VOTRotor;
  [(VOTRotor *)&v6 dealloc];
}

- (int64_t)rotorCount
{
  return CFArrayGetCount(self->_currentRotors);
}

- (int64_t)rotorIndex
{
  currentRotors = self->_currentRotors;
  v5.length = [(VOTRotor *)self rotorCount];
  currentRotorType = (const void *)self->_currentRotorType;
  v5.location = 0;

  return CFArrayGetFirstIndexOfValue(currentRotors, v5, currentRotorType);
}

- (id)generateRotorTypeRequest
{
  v3 = [(VOTRotor *)self currentRotorString];
  if (v3)
  {
    id v4 = [objc_allocWithZone((Class)VOTOutputRequest) init];
    id v5 = [v4 addString:v3];
    if (([(id)VOTSharedWorkspace isBaseSystemSpokenEqualToLocalization] & 1) == 0)
    {
      objc_super v6 = [v4 lastAction];
      objc_super v7 = [(id)VOTSharedWorkspace systemSpokenLanguage];
      [v6 setObject:v7 forVariant:16];
    }
    if ([(id)VOTSharedWorkspace hintsEnabled])
    {
      v8 = [(VOTRotor *)self currentRotorHint];
      if (v8)
      {
        LODWORD(v9) = 1061997773;
        [v4 addPause:v9];
        id v10 = [v4 addString:v8];
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setCurrentRotorType:(int64_t)a3 saveToPreferences:(BOOL)a4 userInitiated:(BOOL)a5
{
  int64_t currentRotorType = self->_currentRotorType;
  if (currentRotorType != a3)
  {
    BOOL v7 = a5;
    BOOL v8 = a4;
    self->_previousRotorType = currentRotorType;
    v26[0] = @"kVOTRotorChangedNotificationOldRotor";
    id v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
    v27[0] = v10;
    v26[1] = @"kVOTRotorChangedNotificationNewRotor";
    v11 = +[NSNumber numberWithInteger:a3];
    v27[1] = v11;
    v12 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];

    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_1000F24B4;
    v23 = &unk_1001B3448;
    v24 = self;
    id v13 = v12;
    id v25 = v13;
    AXPerformBlockOnMainThreadAfterDelay();
    self->_int64_t currentRotorType = a3;
    if ((unint64_t)(a3 - 3) <= 2) {
      self->_currentSelectionRotorType = a3;
    }
    if (v8)
    {
      id v14 = [(NSString *)self->_typeKey copy];
      v15 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000F2524;
      block[3] = &unk_1001B3448;
      block[4] = self;
      id v19 = v14;
      id v16 = v14;
      dispatch_async(v15, block);

      a3 = self->_currentRotorType;
    }
    [(id)VOTSharedWorkspace setRotorType:a3];
    v17 = [(VOTRotor *)self delegate];
    [v17 rotor:self didChangeFrom:self->_previousRotorType to:self->_currentRotorType userInitiated:v7];
  }
}

- (int64_t)currentSelectionRotorType
{
  return self->_currentSelectionRotorType;
}

- (int64_t)currentRotorType
{
  return self->_currentRotorType;
}

- (int64_t)previousRotorType
{
  return self->_previousRotorType;
}

- (BOOL)rotorTypeIsValid:(int64_t)a3 eventOrigin:(int64_t)a4
{
  return a3 != 0;
}

- (id)customPublicRotors
{
  return self->_customPublicRotors;
}

- (void)_moveRotor:(BOOL)a3 didWrap:(BOOL *)a4 userInitiated:(BOOL)a5 eventOrigin:(int64_t)a6
{
  BOOL v7 = a5;
  BOOL v9 = a3;
  CFIndex Count = CFArrayGetCount(self->_currentRotors);
  if (!Count)
  {
    _AXAssert();
    return;
  }
  CFIndex v12 = Count;
  int64_t currentRotorType = self->_currentRotorType;
  if (currentRotorType != 54) {
    goto LABEL_9;
  }
  int64_t publicCustomRotorIndex = self->_publicCustomRotorIndex;
  if (v9) {
    unint64_t v15 = publicCustomRotorIndex + 1;
  }
  else {
    unint64_t v15 = publicCustomRotorIndex - 1;
  }
  self->_int64_t publicCustomRotorIndex = v15;
  if ((v15 & 0x8000000000000000) == 0)
  {
    if (v15 < (unint64_t)[(NSMutableArray *)self->_customPublicRotors count]) {
      goto LABEL_25;
    }
    int64_t currentRotorType = self->_currentRotorType;
LABEL_9:
    if (currentRotorType == 55)
    {
      int64_t customActionIndex = self->_customActionIndex;
      uint64_t v17 = v9 ? 1 : -1;
      self->_int64_t customActionIndex = customActionIndex + v17;
      if (customActionIndex + v17 >= 0
        && customActionIndex + v17 < [(NSArray *)self->_customRotorActionCategories count])
      {
        BOOL v44 = v7;
        v18 = [(NSArray *)self->_customRotorActionCategories objectAtIndexedSubscript:self->_customActionIndex];
        id v19 = [v18 categoryName];
        unsigned int v20 = [v19 isEqualToString:UIAccessibilityCustomActionCategoryEdit];

        unint64_t v21 = self->_customActionIndex;
        if (v20)
        {
          v21 += v17;
          self->_int64_t customActionIndex = v21;
        }
        BOOL v7 = v44;
        if ((v21 & 0x8000000000000000) == 0 && v21 < [(NSArray *)self->_customRotorActionCategories count]) {
          goto LABEL_25;
        }
      }
    }
  }
  if (self->_currentRotorType == 93)
  {
    int64_t customContentIndex = self->_customContentIndex;
    unint64_t v23 = v9 ? customContentIndex + 1 : customContentIndex - 1;
    self->_int64_t customContentIndex = v23;
    if ((v23 & 0x8000000000000000) == 0 && v23 < [(NSArray *)self->_customContent count])
    {
LABEL_25:
      if (_AXSAutomationEnabled())
      {
        id v45 = +[NSDistributedNotificationCenter defaultCenter];
        [v45 postNotificationName:@"VoiceOverEventOccurred" object:@"RotorTypeDidChange"];
      }
      return;
    }
  }
  BOOL v46 = v7;
  *a4 = 0;
  v48.location = 0;
  v48.length = v12;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(self->_currentRotors, v48, (const void *)self->_currentRotorType);
  CFIndex v25 = FirstIndexOfValue;
  ValueAtIndex = 0;
  BOOL v43 = v9;
  BOOL v27 = !v9;
  if (v9) {
    uint64_t v28 = 1;
  }
  else {
    uint64_t v28 = -1;
  }
  if (v27) {
    CFIndex v29 = v12 - 1;
  }
  else {
    CFIndex v29 = 0;
  }
  CFIndex v30 = FirstIndexOfValue;
  do
  {
    if ([(VOTRotor *)self rotorTypeIsValid:ValueAtIndex eventOrigin:a6]) {
      break;
    }
    if (v30 == -1) {
      CFIndex v30 = 0;
    }
    else {
      v30 += v28;
    }
    if (v30 < 0 || v30 >= v12)
    {
      *a4 = 1;
      CFIndex v30 = v29;
    }
    ValueAtIndex = CFArrayGetValueAtIndex(self->_currentRotors, v30);
  }
  while (v30 != v25);
  [(VOTRotor *)self setCurrentRotorType:(int)ValueAtIndex saveToPreferences:0 userInitiated:v46];
  int64_t v31 = self->_currentRotorType;
  if (v31 == 54)
  {
    if (v43)
    {
      v32 = 0;
      int64_t v31 = 54;
    }
    else
    {
      v32 = (char *)[(NSMutableArray *)self->_customPublicRotors count] - 1;
      int64_t v31 = self->_currentRotorType;
    }
    self->_int64_t publicCustomRotorIndex = (int64_t)v32;
  }
  if (v31 == 55)
  {
    v33 = v43 ? 0 : (char *)[(NSArray *)self->_customRotorActionCategories count] - 1;
    self->_int64_t customActionIndex = (int64_t)v33;
    v34 = -[NSArray objectAtIndexedSubscript:](self->_customRotorActionCategories, "objectAtIndexedSubscript:");
    v35 = [v34 categoryName];
    unsigned int v36 = [v35 isEqualToString:@"UIAccessibilityCustomActionCategoryEdit"];

    if (v36)
    {
      if (v43) {
        int64_t v37 = 1;
      }
      else {
        int64_t v37 = (int64_t)[(NSArray *)self->_customRotorActionCategories count] - 2;
      }
      self->_int64_t customActionIndex = v37;
    }
  }
  if (self->_currentRotorType == 93)
  {
    if (v43) {
      v38 = 0;
    }
    else {
      v38 = (char *)[(NSArray *)self->_customContent count] - 1;
    }
    self->_int64_t customContentIndex = (int64_t)v38;
  }
  v39 = +[VOTConfiguration rootConfiguration];
  v40 = +[NSNumber numberWithInteger:self->_currentRotorType];
  [v39 setPreference:v40 forKey:self->_typeKey];

  int64_t v41 = self->_currentRotorType;
  v42 = (void *)VOTSharedWorkspace;

  [v42 setRotorType:v41];
}

- (void)increment:(BOOL *)a3 userInitiated:(BOOL)a4 eventOrigin:(int64_t)a5
{
}

- (void)decrement:(BOOL *)a3 userInitiated:(BOOL)a4 eventOrigin:(int64_t)a5
{
}

- (void)incrementDetectionRotor:(int64_t)a3
{
  CFIndex Count = CFArrayGetCount(self->_currentRotors);
  if (!Count) {
    return;
  }
  CFIndex v6 = Count;
  v20.location = 0;
  v20.length = Count;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(self->_currentRotors, v20, (const void *)self->_currentRotorType);
  ValueAtIndex = 0;
  CFIndex v9 = FirstIndexOfValue;
  do
  {
    if ([(VOTRotor *)self rotorTypeIsValid:ValueAtIndex eventOrigin:a3]
      && (unint64_t)(ValueAtIndex - 63) < 0xFFFFFFFFFFFFFFFELL)
    {
      break;
    }
    if (v9 + 1 >= v6 || v9 + 1 <= -1) {
      CFIndex v9 = 0;
    }
    else {
      ++v9;
    }
    ValueAtIndex = (char *)CFArrayGetValueAtIndex(self->_currentRotors, v9);
  }
  while (v9 != FirstIndexOfValue);
  if (ValueAtIndex == (char *)94) {
    v11 = 0;
  }
  else {
    v11 = ValueAtIndex;
  }
  if ((unint64_t)(v11 - 61) >= 2) {
    uint64_t v12 = (int)v11;
  }
  else {
    uint64_t v12 = 0;
  }
  [(VOTRotor *)self setCurrentRotorType:v12 saveToPreferences:0 userInitiated:0];
  int64_t currentRotorType = self->_currentRotorType;
  switch(currentRotorType)
  {
    case '6':
      uint64_t v14 = 64;
      goto LABEL_25;
    case ']':
      uint64_t v14 = 56;
      goto LABEL_25;
    case '7':
      uint64_t v14 = 112;
LABEL_25:
      *(Class *)((char *)&self->super.isa + v14) = 0;
      break;
  }
  unint64_t v15 = +[VOTConfiguration rootConfiguration];
  id v16 = +[NSNumber numberWithInteger:self->_currentRotorType];
  [v15 setPreference:v16 forKey:self->_typeKey];

  int64_t v17 = self->_currentRotorType;
  v18 = (void *)VOTSharedWorkspace;

  [v18 setRotorType:v17];
}

+ (id)systemRotorTypeForSearchType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x21) {
    return 0;
  }
  else {
    return off_1001B6AB0[a3 - 1];
  }
}

+ (id)systemRotorTypeForRotorType:(int64_t)a3
{
  id result = 0;
  if (!v4 & v3)
  {
    switch(a3)
    {
      case 'G':
        id result = @"AXCustomSystemRotorTypeBoldText";
        break;
      case 'H':
        id result = @"AXCustomSystemRotorTypeItalicText";
        break;
      case 'I':
        id result = @"AXCustomSystemRotorTypeUnderlineText";
        break;
      case 'J':
        id result = @"AXCustomSystemRotorTypeMisspelledWord";
        break;
      case 'K':
        id result = @"AXCustomSystemRotorTypePlainText";
        break;
      case 'L':
        id result = @"AXCustomSystemRotorTypeColorChange";
        break;
      case 'M':
        id result = @"AXCustomSystemRotorTypeFontChange";
        break;
      case 'N':
        id result = @"AXCustomSystemRotorTypeStyleChange";
        break;
      default:
        switch(a3)
        {
          case 8:
            id result = @"AXCustomSystemRotorTypeHeading";
            break;
          case 9:
            id result = @"AXCustomSystemRotorTypeLink";
            break;
          case 11:
            id result = @"AXCustomSystemRotorTypeTable";
            break;
          case 13:
            id result = @"AXCustomSystemRotorTypeList";
            break;
          case 14:
            id result = @"AXCustomSystemRotorTypeVisitedLink";
            break;
          case 16:
            id result = @"AXCustomSystemRotorTypeImage";
            break;
          default:
            return result;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case '!':
        id result = @"AXCustomSystemRotorTypeLandmark";
        break;
      case '""':
        id result = @"AXCustomSystemRotorTypeArticle";
        break;
      case '#':
      case '%':
      case '&':
      case '\'':
      case '(':
      case ')':
      case '*':
      case '+':
      case ',':
      case '-':
        return result;
      case '$':
        id result = @"AXCustomSystemRotorTypeTextField";
        break;
      case '.':
        id result = @"AXCustomSystemRotorTypeHeadingLevel1";
        break;
      case '/':
        id result = @"AXCustomSystemRotorTypeHeadingLevel2";
        break;
      case '0':
        id result = @"AXCustomSystemRotorTypeHeadingLevel3";
        break;
      case '1':
        id result = @"AXCustomSystemRotorTypeHeadingLevel4";
        break;
      case '2':
        id result = @"AXCustomSystemRotorTypeHeadingLevel5";
        break;
      case '3':
        id result = @"AXCustomSystemRotorTypeHeadingLevel6";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return result;
}

+ (int64_t)rotorTypeForSearchType:(int64_t)a3
{
  char v3 = +[VOTRotor systemRotorTypeForSearchType:a3];
  int64_t v4 = +[VOTRotor rotorTypeForSystemRotorType:v3];

  return v4;
}

+ (int64_t)rotorTypeForSystemRotorType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeLink"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeArticle"])
  {
    int64_t v4 = 34;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeVisitedLink"])
  {
    int64_t v4 = 14;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeading"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel1"])
  {
    int64_t v4 = 46;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel2"])
  {
    int64_t v4 = 47;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel3"])
  {
    int64_t v4 = 48;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel4"])
  {
    int64_t v4 = 49;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel5"])
  {
    int64_t v4 = 50;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel6"])
  {
    int64_t v4 = 51;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeBoldText"])
  {
    int64_t v4 = 71;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeItalicText"])
  {
    int64_t v4 = 72;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeUnderlineText"])
  {
    int64_t v4 = 73;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeMisspelledWord"])
  {
    int64_t v4 = 74;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeImage"])
  {
    int64_t v4 = 16;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeTextField"])
  {
    int64_t v4 = 36;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeTable"])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeList"])
  {
    int64_t v4 = 13;
  }
  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeLandmark"])
  {
    int64_t v4 = 33;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)currentVisualRotorString
{
  id v3 = [(VOTRotor *)self _currentCustomRotorString];
  int64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[VOTRotor stringForRotorType:self->_currentRotorType];
  }
  CFIndex v6 = v5;

  return v6;
}

- (BOOL)verifyNoDuplicatesInRotor
{
  CFIndex Count = CFArrayGetCount(self->_currentRotors);
  if (Count < 1)
  {
    return 1;
  }
  else
  {
    CFIndex v4 = Count;
    BOOL v5 = 0;
    CFIndex v6 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(self->_currentRotors, v6++);
      CFIndex v8 = v6;
      if (v6 < v4) {
        break;
      }
LABEL_6:
      BOOL v5 = v6 >= v4;
      if (v6 == v4) {
        return v5;
      }
    }
    while (ValueAtIndex != CFArrayGetValueAtIndex(self->_currentRotors, v8))
    {
      if (v4 == ++v8) {
        goto LABEL_6;
      }
    }
  }
  return v5;
}

- (void)clearRotorTypes
{
  self->_int64_t currentRotorType = 0;
  self->_currentSelectionRotorType = 0;
}

- (int64_t)indexOfRotorItem:(int64_t)a3
{
  currentRotors = self->_currentRotors;
  v5.length = CFArrayGetCount(currentRotors);
  v5.location = 0;

  return CFArrayGetFirstIndexOfValue(currentRotors, v5, (const void *)a3);
}

+ (id)rotorTypeForPreferenceString:(id)a3
{
  uint64_t v3 = qword_1001EBC58;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1001EBC58, &stru_1001B6A90);
  }
  CFRange v5 = [(id)qword_1001EBC50 objectForKey:v4];

  return v5;
}

+ (id)stringForRotorType:(int64_t)a3
{
  id v4 = off_1001EA9E8;
  CFRange v5 = 0;
  switch(a3)
  {
    case 1:
      CFRange v5 = @"search.rotor.adjust";
      break;
    case 2:
      CFRange v5 = @"search.rotor.autofill";
      break;
    case 3:
      CFRange v5 = @"search.rotor.character";
      break;
    case 4:
      CFRange v5 = @"search.rotor.word";
      break;
    case 5:
      CFRange v5 = @"search.rotor.line";
      break;
    case 6:
      CFRange v5 = @"search.rotor.textselection";
      break;
    case 7:
      CFRange v5 = @"search.rotor.vertical.navigation";
      break;
    case 8:
      CFRange v5 = @"search.rotor.header";
      break;
    case 9:
      CFRange v5 = @"search.rotor.link";
      break;
    case 10:
      CFRange v5 = @"search.rotor.formelement";
      break;
    case 11:
      CFRange v5 = @"search.rotor.table";
      break;
    case 12:
      CFRange v5 = @"search.rotor.frame";
      break;
    case 13:
      CFRange v5 = @"search.rotor.list";
      break;
    case 14:
      CFRange v5 = @"search.rotor.visitedlink";
      break;
    case 15:
      CFRange v5 = @"search.rotor.nonvisitedlink";
      break;
    case 16:
      CFRange v5 = @"search.rotor.image";
      break;
    case 17:
      CFRange v5 = @"search.rotor.statictext";
      break;
    case 18:
      CFRange v5 = @"search.rotor.text.operation";
      break;
    case 19:
      CFRange v5 = @"search.rotor.zoom";
      break;
    case 20:
      CFRange v5 = @"search.rotor.typing.mode";
      break;
    case 21:
      CFRange v5 = @"search.rotor.slide.to.type";
      break;
    case 22:
      CFRange v5 = @"search.rotor.languages";
      break;
    case 23:
      CFRange v5 = @"search.rotor.voices";
      break;
    case 24:
      CFIndex v6 = +[AXSettings sharedInstance];
      unsigned int v7 = [v6 voiceOverTouchBrailleDisplaySyncInputOutputTables];

      if (v7) {
        CFRange v5 = @"search.rotor.braille.languages";
      }
      else {
        CFRange v5 = @"search.rotor.braille.output.languages";
      }
      break;
    case 25:
      CFRange v5 = @"search.rotor.braille.input.languages";
      break;
    case 26:
      CFRange v5 = @"search.rotor.auto.advance.speed";
      break;
    case 27:
      CFRange v5 = @"search.rotor.2dbraille.zoom";
      break;
    case 28:
      CFRange v5 = @"search.rotor.2dbraille.horizontal.pan";
      break;
    case 29:
      CFRange v5 = @"search.rotor.2dbraille.vertical.pan";
      break;
    case 30:
      CFRange v5 = @"search.rotor.2dbraille.invert";
      break;
    case 31:
      CFRange v5 = @"search.rotor.2dbraille.intensity";
      break;
    case 32:
      CFRange v5 = @"search.rotor.2dbraille.text.mode";
      break;
    case 33:
      CFRange v5 = @"search.rotor.landmark";
      break;
    case 34:
      CFRange v5 = @"search.rotor.article";
      break;
    case 35:
      CFRange v5 = @"search.rotor.button";
      break;
    case 36:
      CFRange v5 = @"search.rotor.textfield";
      break;
    case 37:
      CFRange v5 = @"search.rotor.table.row";
      break;
    case 38:
      CFRange v5 = @"search.rotor.container";
      break;
    case 39:
      CFRange v5 = @"search.rotor.searchresults";
      break;
    case 40:
      CFRange v5 = @"search.rotor.searchfield";
      break;
    case 41:
      CFRange v5 = @"search.rotor.radiobutton";
      break;
    case 42:
      CFRange v5 = @"search.rotor.checkbox";
      break;
    case 43:
      CFRange v5 = @"search.rotor.exploration.mode";
      break;
    case 44:
      CFRange v5 = @"search.rotor.same";
      break;
    case 45:
      CFRange v5 = @"search.rotor.allitems";
      break;
    case 46:
      CFRange v5 = @"search.rotor.heading.1";
      break;
    case 47:
      CFRange v5 = @"search.rotor.heading.2";
      break;
    case 48:
      CFRange v5 = @"search.rotor.heading.3";
      break;
    case 49:
      CFRange v5 = @"search.rotor.heading.4";
      break;
    case 50:
      CFRange v5 = @"search.rotor.heading.5";
      break;
    case 51:
      CFRange v5 = @"search.rotor.heading.6";
      break;
    case 52:
      CFRange v5 = @"search.rotor.same.heading";
      break;
    case 53:
      CFRange v5 = @"search.rotor.different.element";
      break;
    case 55:
      CFRange v5 = @"custom.actions.title";
      break;
    case 56:
      CFRange v5 = @"search.rotor.math.granularity.1";
      break;
    case 57:
      CFRange v5 = @"search.rotor.math.granularity.2";
      break;
    case 58:
      CFRange v5 = @"search.rotor.math.granularity.3";
      break;
    case 59:
      CFRange v5 = @"search.rotor.math.granularity.4";
      break;
    case 60:
      CFRange v5 = @"search.rotor.hints";
      break;
    case 61:
      CFRange v5 = @"search.rotor.handwriting";
      break;
    case 62:
      CFRange v5 = @"search.rotor.braille.gesture";
      break;
    case 63:
      CFRange v5 = @"search.rotor.tracking.detail";
      break;
    case 64:
      CFRange v5 = @"search.rotor.media.descriptions";
      break;
    case 65:
      CFRange v5 = @"search.rotor.maps.exploration";
      break;
    case 66:
      CFRange v5 = @"search.rotor.audiograph";
      break;
    case 67:
      CFRange v5 = @"search.rotor.neural.vision";
      break;
    case 68:
      CFRange v5 = @"search.rotor.image.descriptions";
      break;
    case 69:
      CFRange v5 = @"rotor.interaction.style";
      break;
    case 71:
      CFRange v5 = @"search.rotor.bold.text";
      break;
    case 72:
      CFRange v5 = @"search.rotor.italic.text";
      break;
    case 73:
      CFRange v5 = @"search.rotor.underline.text";
      break;
    case 74:
      CFRange v5 = @"search.rotor.misspelled.word";
      break;
    case 75:
      CFRange v5 = @"search.rotor.plain.text";
      break;
    case 76:
      CFRange v5 = @"search.rotor.color.change";
      break;
    case 77:
      CFRange v5 = @"search.rotor.font.change";
      break;
    case 78:
      CFRange v5 = @"search.rotor.style.change";
      break;
    case 79:
      CFRange v5 = @"search.rotor.blockquote";
      break;
    case 80:
      CFRange v5 = @"search.rotor.same.blockquote";
      break;
    case 81:
      CFRange v5 = @"search.rotor.volume";
      break;
    case 82:
      CFRange v5 = @"search.rotor.rate";
      break;
    case 83:
      CFRange v5 = @"search.rotor.typing.echo";
      break;
    case 84:
      CFRange v5 = @"search.rotor.phonetics";
      break;
    case 85:
      CFRange v5 = @"search.rotor.use.pitch";
      break;
    case 86:
      CFRange v5 = @"search.rotor.punctuation";
      break;
    case 87:
      CFRange v5 = @"search.rotor.sounds";
      break;
    case 88:
      CFRange v5 = @"search.rotor.audio.ducking";
      break;
    case 89:
      CFRange v5 = @"search.rotor.audio.ducking.amount";
      break;
    case 90:
      CFRange v5 = @"search.rotor.audio.destination";
      break;
    case 91:
      CFRange v5 = @"search.rotor.navigation.direction";
      break;
    case 92:
      CFRange v5 = @"search.rotor.activities";
      break;
    case 93:
      CFRange v5 = @"custom.content.title";
      break;
    case 94:
      CFRange v5 = @"search.rotor.detection.mode";
      break;
    case 95:
      CFIndex v8 = off_1001EA9F8;

      CFRange v5 = @"search.rotor.hide.distractions";
      id v4 = v8;
      break;
    case 96:
      CFRange v5 = @"search.rotor.toggle.live.regions";
      break;
    default:
      break;
  }
  CFIndex v9 = sub_100051804(v4, v5, 0);

  return v9;
}

- (id)_currentCustomRotorString
{
  int64_t currentRotorType = self->_currentRotorType;
  switch(currentRotorType)
  {
    case ']':
      uint64_t v12 = [(NSArray *)self->_customContent count];
      int64_t customContentIndex = v12 - 1;
      if (v12 >= 1)
      {
        if (self->_customContentIndex < customContentIndex) {
          int64_t customContentIndex = self->_customContentIndex;
        }
        self->_int64_t customContentIndex = customContentIndex;
        id v14 = objc_alloc((Class)AXAttributedString);
        CFIndex v9 = [(NSArray *)self->_customContent objectAtIndexedSubscript:self->_customContentIndex];
        unint64_t v15 = [v9 attributedLabel];
        id v16 = [v14 initWithStringOrAttributedString:v15];

        goto LABEL_21;
      }
      break;
    case '7':
      uint64_t v17 = [(NSArray *)self->_customRotorActionCategories count];
      if (v17 >= 1)
      {
        if (self->_customActionIndex >= v17 - 1) {
          int64_t customActionIndex = v17 - 1;
        }
        else {
          int64_t customActionIndex = self->_customActionIndex;
        }
        self->_int64_t customActionIndex = customActionIndex;
        CFIndex v9 = -[NSArray objectAtIndexedSubscript:](self->_customRotorActionCategories, "objectAtIndexedSubscript:");
        id v11 = [v9 categoryName];
        goto LABEL_20;
      }
      break;
    case '6':
      uint64_t v4 = (uint64_t)[(NSMutableArray *)self->_customPublicRotors count];
      int64_t v5 = v4 - 1;
      if (v4 >= 1)
      {
        customPublicRotors = self->_customPublicRotors;
        unint64_t v7 = self->_publicCustomRotorIndex >= v5 ? v5 : self->_publicCustomRotorIndex;
        self->_int64_t publicCustomRotorIndex = v7;
        if (v7 < (unint64_t)[(NSMutableArray *)customPublicRotors count])
        {
          CFIndex v8 = [(NSMutableArray *)self->_customPublicRotors objectAtIndex:self->_publicCustomRotorIndex];
          CFIndex v9 = [v8 objectForKey:@"name"];

          int64_t v10 = +[VOTRotor rotorTypeForSystemRotorType:v9];
          if (v10)
          {
            id v11 = +[VOTRotor stringForRotorType:v10];
          }
          else
          {
            id v11 = v9;
            CFIndex v9 = v11;
          }
LABEL_20:
          id v16 = v11;
LABEL_21:

          goto LABEL_23;
        }
      }
      break;
  }
  id v16 = 0;
LABEL_23:

  return v16;
}

- (BOOL)inMisspelledWordRotor
{
  if (self->_currentRotorType == 74)
  {
    uint64_t v3 = VOTLogRotor();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_100124060(v3);
    }

    if (self->_currentRotorType == 74) {
      return 0;
    }
  }
  if ((id)[(VOTRotor *)self currentRotorType] != (id)54
    || [(VOTRotor *)self publicCustomRotorIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    return 0;
  }
  CFIndex v6 = [(VOTRotor *)self customPublicRotors];
  id v7 = [v6 count];
  unint64_t v8 = [(VOTRotor *)self publicCustomRotorIndex];

  if ((unint64_t)v7 <= v8)
  {
    id v11 = VOTLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100123FA0(self, v11);
    }
    BOOL v4 = 0;
  }
  else
  {
    CFIndex v9 = [(VOTRotor *)self customPublicRotors];
    int64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", -[VOTRotor publicCustomRotorIndex](self, "publicCustomRotorIndex"));
    id v11 = [v10 objectForKeyedSubscript:@"name"];

    BOOL v4 = (id)+[VOTRotor rotorTypeForSystemRotorType:v11] == (id)74;
  }

  return v4;
}

- (id)currentRotorHint
{
  if (self->_currentRotorType == 6)
  {
    v2 = @"rotor.text.selection.hint";
LABEL_5:
    uint64_t v3 = sub_100051804(off_1001EA9E8, v2, 0);
    goto LABEL_7;
  }
  if ([(VOTRotor *)self inMisspelledWordRotor])
  {
    v2 = @"rotor.text.misspelled.word.hint";
    goto LABEL_5;
  }
  uint64_t v3 = 0;
LABEL_7:

  return v3;
}

- (id)currentRotorString
{
  uint64_t v3 = [(VOTRotor *)self _currentCustomRotorString];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[VOTRotor stringForRotorType:self->_currentRotorType];
  }
  CFIndex v6 = v5;

  return v6;
}

- (id)rotorItems
{
  id v3 = objc_alloc_init((Class)NSMutableIndexSet);
  CFIndex Count = CFArrayGetCount(self->_currentRotors);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    for (CFIndex i = 0; i != v5; ++i)
      objc_msgSend(v3, "addIndex:", CFArrayGetValueAtIndex(self->_currentRotors, i));
  }

  return v3;
}

- (void)setRotorItems:(id)a3
{
  id v6 = a3;
  CFArrayRemoveAllValues(self->_currentRotors);
  id v4 = [v6 firstIndex];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    for (id i = v4; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [v6 indexGreaterThanIndex:i])
      CFArrayAppendValue(self->_currentRotors, i);
  }
}

+ (BOOL)rotorIsUsedForSettingAdjustment:(int64_t)a3
{
  BOOL result = 1;
  switch(a3)
  {
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 43:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 67:
    case 68:
    case 69:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 96:
      return result;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (int64_t)customRotorIndex
{
  return self->_customRotorIndex;
}

- (VOTElement)currentRotorElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentRotorElement);

  return (VOTElement *)WeakRetained;
}

- (void)setCurrentRotorElement:(id)a3
{
}

- (VOTRotorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTRotorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)publicCustomRotorIndex
{
  return self->_publicCustomRotorIndex;
}

- (int64_t)customActionIndex
{
  return self->_customActionIndex;
}

- (void)setCustomActionIndex:(int64_t)a3
{
  self->_int64_t customActionIndex = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_currentRotorElement);
  objc_storeStrong((id *)&self->_customPublicRotors, 0);
  objc_storeStrong((id *)&self->_customContent, 0);
  objc_storeStrong((id *)&self->_customRotorActionCategories, 0);

  objc_storeStrong((id *)&self->_typeKey, 0);
}

@end