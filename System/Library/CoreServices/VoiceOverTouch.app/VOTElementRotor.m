@interface VOTElementRotor
- (BOOL)_customPublicRotorInRotor:(id)a3;
- (BOOL)customActionsAreDragDrop:(id)a3;
- (BOOL)customActionsAreValid:(id)a3;
- (BOOL)ignoreDefaultTypeAutofill;
- (BOOL)rotorTypeIsValid:(int64_t)a3 eventOrigin:(int64_t)a4;
- (BOOL)showsWebSearchResults;
- (VOTElementRotor)init;
- (id)_currentAvailableRotorItems;
- (id)_currentEnabledWebRotorItems;
- (id)updatedWebRotorItemsCallback;
- (int64_t)_firstNonGesturedTextInputRotorTypeWithFallback:(int64_t)a3;
- (void)_depromoteMLElementSupport;
- (void)_promoteGesturedTextInputRotorIfNeeded;
- (void)_updateWebRotorItems;
- (void)dealloc;
- (void)nanoUpdateRotorForElement:(id)a3;
- (void)setIgnoreDefaultTypeAutofill:(BOOL)a3;
- (void)setShowsWebSearchResults:(BOOL)a3;
- (void)setUpdatedWebRotorItemsCallback:(id)a3;
- (void)updateRotorForElement:(id)a3 shouldPreserveRotorNavigation:(BOOL)a4;
- (void)updateRotorForElement:(id)a3 shouldPreserveRotorNavigation:(BOOL)a4 firstResponder:(id)a5;
@end

@implementation VOTElementRotor

- (VOTElementRotor)init
{
  v14.receiver = self;
  v14.super_class = (Class)VOTElementRotor;
  v2 = [(VOTRotor *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("vot-web-rotor-item-access-queue", 0);
    enabledWebRotorItemsQueue = v2->_enabledWebRotorItemsQueue;
    v2->_enabledWebRotorItemsQueue = (OS_dispatch_queue *)v3;

    [(VOTElementRotor *)v2 _updateWebRotorItems];
    v5 = +[VOTConfiguration rootConfiguration];
    v6 = [v5 preferenceForKey:@"CurrentRotorTypeSimple"];
    uint64_t v7 = (int)[v6 intValue];

    if (sub_1000F2B98(v7)) {
      uint64_t v7 = [(VOTElementRotor *)v2 _firstNonGesturedTextInputRotorTypeWithFallback:v7];
    }
    [(VOTRotor *)v2 setCurrentRotorType:v7 saveToPreferences:1 userInitiated:0];
    objc_initWeak(&location, v2);
    v8 = +[AXSettings sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000AEC54;
    v11[3] = &unk_1001B35A8;
    objc_copyWeak(&v12, &location);
    [v8 registerUpdateBlock:v11 forRetrieveSelector:"voiceOverRotorItems" withListener:v2];

    objc_destroyWeak(&v12);
    v9 = v2;
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  enabledWebRotorItemsQueue = self->_enabledWebRotorItemsQueue;
  self->_enabledWebRotorItemsQueue = 0;

  v4.receiver = self;
  v4.super_class = (Class)VOTElementRotor;
  [(VOTRotor *)&v4 dealloc];
}

- (int64_t)_firstNonGesturedTextInputRotorTypeWithFallback:(int64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v4 = [(VOTElementRotor *)self _currentAvailableRotorItems];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 objectForKey:@"VOTRotorType"];
        int64_t v11 = (int)[v10 intValue];

        if (!sub_1000F2B98(v11))
        {
          id v12 = [v9 objectForKeyedSubscript:@"Enabled"];
          unsigned __int8 v13 = [v12 BOOLValue];

          if (v13)
          {
            a3 = v11;
            goto LABEL_12;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return a3;
}

- (BOOL)_customPublicRotorInRotor:(id)a3
{
  id v4 = a3;
  if (sub_1000F31E0(self->super._currentRotors, (const void *)+[VOTRotor rotorTypeForSystemRotorType:v4]) == -1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(VOTRotor *)self customPublicRotors];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          int64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) objectForKeyedSubscript:@"name"];
          unsigned __int8 v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            BOOL v5 = 1;
            goto LABEL_13;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v5 = 0;
LABEL_13:
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)_updateWebRotorItems
{
  v2 = +[NSMutableArray array];
  dispatch_queue_t v3 = +[AXSettings sharedInstance];
  id v4 = [v3 voiceOverRotorItems];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v10 = [v9 mutableCopy];
        int64_t v11 = [v9 objectForKey:@"RotorItem"];
        unsigned __int8 v12 = +[VOTRotor rotorTypeForPreferenceString:v11];

        if (v12)
        {
          [v10 setObject:v12 forKeyedSubscript:@"VOTRotorType"];
          unsigned __int8 v13 = [v9 objectForKeyedSubscript:@"Enabled"];
          [v10 setObject:v13 forKeyedSubscript:@"Enabled"];
        }
        [v2 addObject:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  enabledWebRotorItemsQueue = self->_enabledWebRotorItemsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AF268;
  block[3] = &unk_1001B3448;
  block[4] = self;
  id v21 = v2;
  id v15 = v2;
  dispatch_sync(enabledWebRotorItemsQueue, block);
  long long v16 = [(VOTElementRotor *)self updatedWebRotorItemsCallback];

  if (v16)
  {
    long long v17 = [(VOTElementRotor *)self updatedWebRotorItemsCallback];
    ((void (**)(void, VOTElementRotor *))v17)[2](v17, self);
  }
}

- (id)_currentEnabledWebRotorItems
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1000AF374;
  id v10 = sub_1000AF384;
  id v11 = 0;
  enabledWebRotorItemsQueue = self->_enabledWebRotorItemsQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AF38C;
  v5[3] = &unk_1001B34C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(enabledWebRotorItemsQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_currentAvailableRotorItems
{
  v2 = [(VOTElementRotor *)self _currentEnabledWebRotorItems];
  id v3 = [v2 mutableCopy];

  unint64_t v4 = 0;
  id v5 = 0;
  if ([v3 count])
  {
    do
    {
      uint64_t v6 = v5;
      id v5 = [v3 objectAtIndex:v4];

      uint64_t v7 = [v5 objectForKey:@"VOTRotorType"];
      unsigned int v8 = [v7 intValue];

      if (v8 == 24) {
        break;
      }
      ++v4;
    }
    while (v4 < (unint64_t)[v3 count]);
  }
  if (v4 < (unint64_t)[v3 count])
  {
    id v9 = [v5 mutableCopy];
    [v9 setObject:kAXSVoiceOverTouchRotorItemBrailleInputLanguage forKeyedSubscript:@"RotorItem"];
    [v9 setObject:&off_1001C55D8 forKeyedSubscript:@"VOTRotorType"];
    [v3 insertObject:v9 atIndex:v4 + 1];
  }

  return v3;
}

- (void)_depromoteMLElementSupport
{
  CFIndex Count = CFArrayGetCount(self->super._currentRotors);
  CFIndex v4 = sub_1000F31E0(self->super._currentRotors, (const void *)0x43);
  if (v4 != -1 && Count >= 3 && v4 == Count - 1)
  {
    sub_1000F4A84(self->super._currentRotors, (const void *)0x43);
    currentRotors = self->super._currentRotors;
    sub_1000F4A70(currentRotors, (void *)0x43, Count - 2);
  }
}

- (void)_promoteGesturedTextInputRotorIfNeeded
{
  if (sub_1000F31E0(self->super._currentRotors, (const void *)0x3D) != -1)
  {
    sub_1000F4A84(self->super._currentRotors, (const void *)0x3D);
    CFIndex v3 = sub_1000F31E0(self->super._currentRotors, (const void *)[(VOTRotor *)self currentRotorType]);
    sub_1000F4A70(self->super._currentRotors, (void *)0x3D, v3 + 1);
  }
  temporaryRotorTypeNeedingPromotion = (const void *)self->_temporaryRotorTypeNeedingPromotion;
  if (temporaryRotorTypeNeedingPromotion)
  {
    if (sub_1000F31E0(self->super._currentRotors, temporaryRotorTypeNeedingPromotion) != -1)
    {
      sub_1000F4A84(self->super._currentRotors, (const void *)self->_temporaryRotorTypeNeedingPromotion);
      CFIndex v5 = sub_1000F31E0(self->super._currentRotors, (const void *)[(VOTRotor *)self currentRotorType]);
      sub_1000F4A70(self->super._currentRotors, (void *)self->_temporaryRotorTypeNeedingPromotion, v5 + 1);
    }
    self->_temporaryRotorTypeNeedingPromotion = 0;
  }
}

- (void)nanoUpdateRotorForElement:(id)a3
{
  id v4 = a3;
  currentRotors = self->super._currentRotors;
  if (currentRotors) {
    CFArrayRef Copy = CFArrayCreateCopy(kCFAllocatorDefault, currentRotors);
  }
  else {
    CFArrayRef Copy = CFArrayCreate(kCFAllocatorDefault, 0, 0, 0);
  }
  CFArrayRef v7 = Copy;
  CFArrayRemoveAllValues(self->super._currentRotors);
  if ([v4 doesHaveTraits:kAXAdjustableTrait]) {
    CFArrayAppendValue(self->super._currentRotors, (const void *)1);
  }
  uint64_t v33 = [v4 customRotorActions];
  v32 = +[VOTElement organizedActionsByCategory:](VOTElement, "organizedActionsByCategory:");
  objc_storeStrong((id *)&self->super._customRotorActionCategories, v32);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unsigned int v8 = self->super._customRotorActionCategories;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v9)
  {
    id v10 = v9;
    CFArrayRef v29 = v7;
    v30 = self;
    id v31 = v4;
    char v35 = 0;
    uint64_t v36 = *(void *)v42;
    uint64_t v11 = UIAccessibilityCustomActionCategoryEdit;
    id obj = v8;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v14 = [v13 actions];
        id v15 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v38;
          do
          {
            for (j = 0; j != v16; j = (char *)j + 1)
            {
              if (*(void *)v38 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
              v20 = [v19 name];
              if ([v20 length])
              {
                id v21 = [v19 categoryName];
                unsigned int v22 = [v21 isEqualToString:v11];

                if (!v22)
                {
                  char v35 = 1;
                  goto LABEL_22;
                }
              }
              else
              {
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v16);
        }
LABEL_22:
      }
      id v10 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v10);

    self = v30;
    id v4 = v31;
    CFArrayRef v7 = v29;
    if (v35) {
      CFArrayAppendValue(v30->super._currentRotors, (const void *)0x37);
    }
  }
  else
  {
  }
  CFIndex Count = CFArrayGetCount(self->super._currentRotors);
  if (CFArrayGetCount(v7) == Count && Count >= 1)
  {
    CFIndex v24 = 0;
    while (1)
    {
      unsigned int ValueAtIndex = CFArrayGetValueAtIndex(v7, v24);
      if (ValueAtIndex != CFArrayGetValueAtIndex(self->super._currentRotors, v24)) {
        break;
      }
      if (Count == ++v24)
      {
        CFIndex v24 = Count;
        break;
      }
    }
    if (v24 == Count)
    {
      v27 = v32;
      v26 = (void *)v33;
      if (!v7) {
        goto LABEL_41;
      }
      goto LABEL_40;
    }
  }
  if (CFArrayGetCount(self->super._currentRotors) < 1) {
    uint64_t v28 = 55;
  }
  else {
    uint64_t v28 = (int)CFArrayGetValueAtIndex(self->super._currentRotors, 0);
  }
  v27 = v32;
  v26 = (void *)v33;
  [(VOTRotor *)self setCurrentRotorType:v28 saveToPreferences:0 userInitiated:0];
  if (v7) {
LABEL_40:
  }
    CFRelease(v7);
LABEL_41:
}

- (BOOL)rotorTypeIsValid:(int64_t)a3 eventOrigin:(int64_t)a4
{
  if (a3 == 55
    && a4 == 2
    && ([(VOTRotor *)self delegate],
        CFArrayRef v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 actionsRotorAddBehaviorForElementRotor:self],
        v7,
        v8 != (id)1))
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = self->super._customRotorActionCategories;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      id v12 = v11;
      unsigned __int8 v9 = 0;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v16 = [v15 actions];
          id v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v24;
            while (2)
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v24 != v19) {
                  objc_enumerationMutation(v16);
                }
                if (![*(id *)(*((void *)&v23 + 1) + 8 * (void)j) ignoreWhenVoiceOverTouches])
                {
                  unsigned __int8 v9 = 1;
                  goto LABEL_20;
                }
              }
              id v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }
LABEL_20:
        }
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)VOTElementRotor;
    unsigned __int8 v9 = [(VOTRotor *)&v22 rotorTypeIsValid:a3 eventOrigin:a4];
  }
  return v9 & 1;
}

- (void)updateRotorForElement:(id)a3 shouldPreserveRotorNavigation:(BOOL)a4
{
}

- (void)updateRotorForElement:(id)a3 shouldPreserveRotorNavigation:(BOOL)a4 firstResponder:(id)a5
{
  BOOL v154 = a4;
  id v7 = a3;
  id v8 = a5;
  [(VOTRotor *)self setCurrentRotorElement:v7];
  CFArrayRef Copy = CFArrayCreateCopy(kCFAllocatorDefault, self->super._currentRotors);
  CFIndex v158 = sub_1000F31E0(Copy, (const void *)0x36);
  CFArrayRemoveAllValues(self->super._currentRotors);
  [(VOTRotor *)self setCustomActionIndex:0];
  typeKey = self->super._typeKey;
  v185 = self;
  self->super._typeKey = (NSString *)@"CurrentRotorTypeSimple";

  uint64_t v168 = 0;
  unsigned int v159 = [v7 doesHaveTraits:kAXAdjustableTrait];
  if (v159)
  {
    id v11 = VOTLogRotor();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100121530();
    }

    uint64_t v168 = 1;
    j__CFArrayAppendValue(self->super._currentRotors, (const void *)1);
  }
  if (AXDeviceSupportsSonification() && [v7 supportsAudiographs])
  {
    id v12 = VOTLogRotor();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1001214FC();
    }

    uint64_t v168 = 66;
    j__CFArrayAppendValue(self->super._currentRotors, (const void *)0x42);
  }
  unsigned int v174 = [v7 doesHaveTraits:kAXMathEquationTrait];
  if (v174 && [v7 canNavigateMathSegments])
  {
    uint64_t v168 = [(VOTRotor *)self currentRotorType];
    if (!sub_1000F4A60(v168))
    {
      uint64_t v13 = VOTLogRotor();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1001214C8();
      }

      uint64_t v168 = 56;
    }
    j__CFArrayAppendValue(self->super._currentRotors, (const void *)0x38);
    j__CFArrayAppendValue(self->super._currentRotors, (const void *)0x39);
    j__CFArrayAppendValue(self->super._currentRotors, (const void *)0x3A);
    j__CFArrayAppendValue(self->super._currentRotors, (const void *)0x3B);
  }
  v166 = [v7 application];
  long long v14 = [v166 typingCandidateElements];
  id v15 = [v14 count];

  if (v15)
  {
    if (![(VOTElementRotor *)v185 ignoreDefaultTypeAutofill])
    {
      id v16 = VOTLogRotor();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100121494();
      }

      uint64_t v168 = 2;
    }
    j__CFArrayAppendValue(v185->super._currentRotors, (const void *)2);
  }
  CFArrayRef cf = Copy;
  uint64_t v17 = kAXWebContentTrait;
  unsigned int v167 = [v7 doesHaveTraits:kAXWebContentTrait];
  if (((v174 | v167) & 1) == 0)
  {
    j__CFArrayAppendValue(v185->super._currentRotors, (const void *)3);
    j__CFArrayAppendValue(v185->super._currentRotors, (const void *)4);
  }
  uint64_t v18 = kAXTextEntryTrait;
  uint64_t v165 = kAXIsEditingTrait;
  unsigned int v181 = [v7 doesHaveAllTraits:kAXIsEditingTrait | kAXTextEntryTrait];
  unsigned int v19 = [v7 isReadingContent];
  v163 = [v7 label];
  uint64_t v20 = kAXTextAreaTrait;
  v184 = v7;
  unsigned int v170 = v19;
  if ([v7 doesHaveTraits:kAXTextAreaTrait])
  {
    uint64_t v23 = +[NSNumber numberWithInteger:1];
    id v21 = +[NSNumber numberWithInteger:0];
    objc_super v22 = +[NSDictionary dictionaryWithObjectsAndKeys:v23, @"lineNumber", v21, @"lineColumn", 0];

    LOBYTE(v23) = [v7 rangeForLineNumberAndColumn:v22] != (id)0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (v19)
    {
      long long v24 = [v7 stringForLineNumber:0];
      long long v25 = +[NSCharacterSet whitespaceCharacterSet];
      long long v26 = [v24 stringByTrimmingCharactersInSet:v25];

      long long v27 = [v7 pageContent];
      long long v28 = +[NSCharacterSet whitespaceCharacterSet];
      long long v29 = [v27 stringByTrimmingCharactersInSet:v28];

      if ([v26 length] && objc_msgSend(v29, "length")) {
        LODWORD(v23) = [v29 isEqualToString:v26] ^ 1;
      }
      else {
        LOBYTE(v23) = 0;
      }
      id v7 = v184;
      long long v30 = v185;

      [v184 doesHaveTraits:v20];
      goto LABEL_37;
    }
    LOBYTE(v23) = 0;
  }
  if (([v7 doesHaveTraits:v20] | v19) != 1)
  {
    BOOL v31 = 0;
    long long v30 = v185;
    goto LABEL_41;
  }
  long long v30 = v185;
LABEL_37:
  v32 = [v7 previousTextNavigationElement];
  if (v32)
  {
    BOOL v31 = 1;
  }
  else
  {
    uint64_t v33 = [v7 nextTextNavigationElement];
    BOOL v31 = v33 != 0;
  }
LABEL_41:
  char v34 = v23 | v31;
  uint64_t v160 = kAXKeyboardKeyTrait;
  unsigned int v176 = objc_msgSend(v7, "doesHaveTraits:");
  if (!v176)
  {
    char v35 = [v7 textInputElement];
    uint64_t v36 = v35;
    if (!v35) {
      char v35 = v7;
    }
    v164 = [v35 value];

    if (v34) {
      goto LABEL_57;
    }
LABEL_47:
    if (v181)
    {
      if (!v164) {
        goto LABEL_55;
      }
    }
    else
    {
      if (v164) {
        char v37 = v176;
      }
      else {
        char v37 = 0;
      }
      if ((v37 & 1) == 0) {
        goto LABEL_55;
      }
    }
    if ([v164 rangeOfString:@"\n"] != (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_57;
    }
LABEL_55:
    if (!v163 || [v163 rangeOfString:@"\n"] == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_59;
    }
    goto LABEL_57;
  }
  v164 = [v8 value];
  if ((v34 & 1) == 0) {
    goto LABEL_47;
  }
LABEL_57:
  if (((v174 | (v167 ^ 1 | v181 | v170) ^ 1) & 1) == 0) {
    j__CFArrayAppendValue(v30->super._currentRotors, (const void *)5);
  }
LABEL_59:
  long long v38 = [v7 customRotorActions];
  long long v39 = objc_msgSend(v38, "ax_firstObjectUsingBlock:", &stru_1001B5FF0);

  if ((v176 | [v7 textOperationsAvailable]) != 1)
  {
    if (!v39) {
      goto LABEL_65;
    }
    currentRotors = v30->super._currentRotors;
LABEL_64:
    j__CFArrayAppendValue(currentRotors, (const void *)0x12);
    goto LABEL_65;
  }
  unsigned int v40 = [v7 doesHaveTraits:kAXMenuItemTrait];
  currentRotors = v30->super._currentRotors;
  if (!v40) {
    goto LABEL_64;
  }
  sub_1000F4A70(currentRotors, (void *)0x12, 0);
LABEL_65:
  uint64_t v42 = kAXMapTrait;
  if (([v7 doesHaveTraits:kAXMapTrait] & 1) != 0
    || ([v7 touchContainer],
        long long v43 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v44 = [v43 doesHaveTraits:v42],
        v43,
        (v44 & 1) != 0))
  {
    v45 = VOTLogRotor();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
      sub_100121460();
    }

    uint64_t v168 = 19;
  }
  else if (([v7 doesHaveTraits:kAXSupportsZoomTrait] & 1) == 0)
  {
    goto LABEL_71;
  }
  j__CFArrayAppendValue(v30->super._currentRotors, (const void *)0x13);
LABEL_71:
  uint64_t v46 = kAXSupportsTrackingDetailTrait;
  if (([v7 doesHaveTraits:kAXSupportsTrackingDetailTrait] & 1) != 0
    || ([v7 touchContainer],
        v47 = objc_claimAutoreleasedReturnValue(),
        unsigned int v48 = [v47 doesHaveTraits:v46],
        v47,
        v48))
  {
    j__CFArrayAppendValue(v30->super._currentRotors, (const void *)0x3F);
  }
  v49 = [v7 containerTypes];
  unsigned int v50 = [v49 containsObject:&off_1001C55F0];

  if (v50) {
    j__CFArrayAppendValue(v30->super._currentRotors, (const void *)0x25);
  }
  id v162 = v8;
  if ((v167 & 1) != 0
    || [v166 isSafari]
    && (([v7 doesHaveTraits:v165] | v170) & 1) == 0)
  {
    v51 = v30->super._typeKey;
    v30->super._typeKey = (NSString *)@"CurrentRotorTypeWeb";

    int v179 = 1;
  }
  else
  {
    int v179 = 0;
  }
  [(VOTElementRotor *)v30 _currentAvailableRotorItems];
  long long v191 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v52 = [obj countByEnumeratingWithState:&v191 objects:v195 count:16];
  if (v52)
  {
    id v53 = v52;
    uint64_t v54 = *(void *)v192;
    uint64_t v171 = v18 | v17 | v20;
    uint64_t v172 = kAXStatusBarElementTrait | v165;
    do
    {
      v55 = 0;
      do
      {
        if (*(void *)v192 != v54) {
          objc_enumerationMutation(obj);
        }
        v56 = *(void **)(*((void *)&v191 + 1) + 8 * (void)v55);
        v57 = [v56 valueForKey:@"RotorItem"];
        v58 = +[VOTRotor rotorTypeForPreferenceString:v57];
        signed int v59 = [v58 intValue];
        int64_t v60 = v59;

        if (v59 == 61)
        {
          v61 = [v56 valueForKey:@"Enabled"];
          unsigned int v62 = [v61 BOOLValue];

          if (v62)
          {
            if (([v184 doesHaveTraitsForGesturedTextInput] & 1) != 0
              || ([v184 application],
                  v63 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v64 = [v63 isSoftwareKeyboardActive],
                  v63,
                  v64))
            {
              if (![obj indexOfObject:v56]) {
                v30->_temporaryRotorTypeNeedingPromotion = v60;
              }
              j__CFArrayAppendValue(v30->super._currentRotors, (const void *)v60);
            }
          }
        }
        v65 = [v56 valueForKey:@"Enabled"];
        unsigned int v66 = [v65 BOOLValue];

        if (v60 == 25)
        {
          v67 = +[AXSettings sharedInstance];
          unsigned int v68 = [v67 voiceOverTouchBrailleDisplaySyncInputOutputTables] ^ 1;
        }
        else
        {
          unsigned int v68 = 0;
        }
        if (v60 == 24) {
          int v69 = 1;
        }
        else {
          int v69 = v68;
        }
        if v60 != 70 && ((v69 | v66))
        {
          long long v30 = v185;
          if (v176 | v181)
          {
            if (v60 != 6)
            {
              if (v60 != 20)
              {
                if (v60 == 21)
                {
                  uint64_t v70 = 21;
                  goto LABEL_116;
                }
LABEL_117:
                if ((v174 | v167 ^ 1))
                {
                  if ((int)v60 > 67)
                  {
                    switch((int)v60)
                    {
                      case 'Q':
                        goto LABEL_122;
                      case 'R':
                        goto LABEL_143;
                      case 'S':
                      case 'T':
                      case 'U':
                      case 'Z':
                      case '[':
                      case ']':
                      case '^':
                      case '_':
                        goto LABEL_140;
                      case 'V':
                        goto LABEL_144;
                      case 'W':
                        goto LABEL_146;
                      case 'X':
                        goto LABEL_147;
                      case 'Y':
                        goto LABEL_148;
                      case '\\':
                        goto LABEL_149;
                        goto LABEL_151;
                      default:
                        goto LABEL_137;
                    }
                  }
                  switch(v60)
                  {
                    case 7:
LABEL_133:
                      v73 = v185->super._currentRotors;
                      uint64_t v74 = 7;
                      goto LABEL_153;
                    case 8:
LABEL_134:
                      if ((v170 & 1) == 0)
                      {
                        v73 = v185->super._currentRotors;
                        uint64_t v74 = 8;
                        goto LABEL_153;
                      }
LABEL_135:
                      sub_100050E5C();
                      goto LABEL_154;
                    case 0x3C:
LABEL_139:
                      v73 = v185->super._currentRotors;
                      uint64_t v74 = 60;
                      goto LABEL_153;
                  }
LABEL_140:
                  if (sub_100050E5C() && v60 == 38)
                  {
                    v73 = v185->super._currentRotors;
                    uint64_t v74 = 38;
                    goto LABEL_153;
                  }
                  switch(v60)
                  {
                    case 0x17:
                      if (_os_feature_enabled_impl())
                      {
                        v82 = [(id)VOTSharedWorkspace votSettings];
                        v83 = [v82 voiceRotors];
                        id v84 = [v83 count];

                        if (v84)
                        {
                          v73 = v185->super._currentRotors;
                          uint64_t v74 = 23;
                          break;
                        }
                      }
LABEL_154:
                      if (v179 && ((v174 | v176 | [v184 doesHaveTraits:v172]) & 1) == 0)
                      {
                        switch((int)v60)
                        {
                          case 5:
                            sub_1000F4A84(v185->super._currentRotors, (const void *)5);
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 5;
                            goto LABEL_159;
                          case 6:
                          case 7:
                          case 8:
                          case 12:
                          case 18:
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
                          case 37:
                          case 38:
                          case 39:
                          case 43:
                            goto LABEL_160;
                          case 9:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 9;
                            goto LABEL_159;
                          case 10:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 10;
                            goto LABEL_159;
                          case 11:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 11;
                            goto LABEL_159;
                          case 13:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 13;
                            goto LABEL_159;
                          case 14:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 14;
                            goto LABEL_159;
                          case 15:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 15;
                            goto LABEL_159;
                          case 16:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 16;
                            goto LABEL_159;
                          case 17:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 17;
                            goto LABEL_159;
                          case 19:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 19;
                            goto LABEL_159;
                          case 33:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 33;
                            goto LABEL_159;
                          case 34:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 34;
                            goto LABEL_159;
                          case 35:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 35;
                            goto LABEL_159;
                          case 36:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 36;
                            goto LABEL_159;
                          case 40:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 40;
                            goto LABEL_159;
                          case 41:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 41;
                            goto LABEL_159;
                          case 42:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 42;
                            goto LABEL_159;
                          case 44:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 44;
                            goto LABEL_159;
                          case 45:
                            v80 = v185->super._currentRotors;
                            uint64_t v81 = 45;
                            goto LABEL_159;
                          default:
                            goto LABEL_156;
                        }
                      }
                      else
                      {
LABEL_156:
                        if (v60 == 94 && AXIsBuddyCompleted())
                        {
                          v80 = v185->super._currentRotors;
                          uint64_t v81 = 94;
LABEL_159:
                          j__CFArrayAppendValue(v80, (const void *)v81);
                        }
                      }
                      goto LABEL_160;
                    case 0x18:
                      v85 = [(id)VOTSharedWorkspace brailleLanguageRotorItems];
                      if ((unint64_t)[v85 count] > 1)
                      {
                        v86 = +[VOTBrailleManager manager];
                        if ([v86 brailleEnabled])
                        {
                          v87 = [v56 valueForKey:@"Enabled"];
                          unsigned int v155 = [v87 BOOLValue];

                          if (!v155) {
                            goto LABEL_154;
                          }
                          v73 = v185->super._currentRotors;
                          uint64_t v74 = 24;
                          break;
                        }
LABEL_203:

                        goto LABEL_154;
                      }
LABEL_198:

                      goto LABEL_154;
                    case 0x19:
                      v88 = +[AXSettings sharedInstance];
                      unsigned __int8 v89 = [v88 voiceOverTouchBrailleDisplaySyncInputOutputTables];

                      if (v89) {
                        goto LABEL_154;
                      }
                      v85 = [(id)VOTSharedWorkspace brailleLanguageRotorItems];
                      if ((unint64_t)[v85 count] <= 1) {
                        goto LABEL_198;
                      }
                      v86 = +[VOTBrailleManager manager];
                      if (([v86 brailleEnabled] & 1) == 0) {
                        goto LABEL_203;
                      }
                      v90 = [v56 valueForKey:@"Enabled"];
                      unsigned int v156 = [v90 BOOLValue];

                      if (!v156) {
                        goto LABEL_154;
                      }
                      v73 = v185->super._currentRotors;
                      uint64_t v74 = 25;
                      break;
                    default:
                      if ((int)v60 <= 61)
                      {
                        switch((int)v60)
                        {
                          case 26:
                            v91 = +[VOTBrailleManager manager];
                            unsigned int v92 = [v91 brailleEnabled];

                            if (v92)
                            {
                              v73 = v185->super._currentRotors;
                              uint64_t v74 = 26;
                              goto LABEL_153;
                            }
                            break;
                          case 27:
                            if ([(id)VOTSharedWorkspace hasActive2DBrailleDisplay])
                            {
                              v73 = v185->super._currentRotors;
                              uint64_t v74 = 27;
                              goto LABEL_153;
                            }
                            break;
                          case 28:
                            if ([(id)VOTSharedWorkspace hasActive2DBrailleDisplay])
                            {
                              v73 = v185->super._currentRotors;
                              uint64_t v74 = 28;
                              goto LABEL_153;
                            }
                            break;
                          case 29:
                            if ([(id)VOTSharedWorkspace hasActive2DBrailleDisplay])
                            {
                              v73 = v185->super._currentRotors;
                              uint64_t v74 = 29;
                              goto LABEL_153;
                            }
                            break;
                          case 30:
                            if ([(id)VOTSharedWorkspace hasActive2DBrailleDisplay])
                            {
                              v73 = v185->super._currentRotors;
                              uint64_t v74 = 30;
                              goto LABEL_153;
                            }
                            break;
                          case 31:
                            if ([(id)VOTSharedWorkspace hasActive2DBrailleDisplay])
                            {
                              v73 = v185->super._currentRotors;
                              uint64_t v74 = 31;
                              goto LABEL_153;
                            }
                            break;
                          case 32:
                            if ([(id)VOTSharedWorkspace hasActive2DBrailleDisplay])
                            {
                              v73 = v185->super._currentRotors;
                              uint64_t v74 = 32;
                              goto LABEL_153;
                            }
                            break;
                          case 43:
                            if (([(id)VOTSharedWorkspace directTouchElementsPresent] & 1) != 0
                              || [v184 isInAppSwitcher])
                            {
                              v73 = v185->super._currentRotors;
                              uint64_t v74 = 43;
                              goto LABEL_153;
                            }
                            break;
                          default:
                            goto LABEL_154;
                        }
                        goto LABEL_154;
                      }
                      if ((int)v60 <= 68)
                      {
                        if (v60 == 62)
                        {
                          v73 = v185->super._currentRotors;
                          uint64_t v74 = 62;
                        }
                        else
                        {
                          if (v60 != 67
                            || ![(id)VOTSharedWorkspace automaticAccessibilityEnabled])
                          {
                            goto LABEL_154;
                          }
                          if (v184)
                          {
                            v93 = [v184 application];
                            v94 = [v93 bundleIdentifier];
                            if ((j__VOSProcessAllowsScreenRecognition() & 1) != 0
                              || [v184 isInAppSwitcher])
                            {
                            }
                            else
                            {
                              unsigned int v98 = [v184 isInStatusBar];

                              if (!v98) {
                                goto LABEL_154;
                              }
                            }
                          }
                          v73 = v185->super._currentRotors;
                          uint64_t v74 = 67;
                        }
                      }
                      else
                      {
                        switch(v60)
                        {
                          case 'E':
                            v73 = v185->super._currentRotors;
                            uint64_t v74 = 69;
                            break;
                          case 'Z':
                            v95 = +[VOTOutputManager outputManager];
                            if (([v95 externalAudioRoutesAvailable] & 1) == 0)
                            {

                              goto LABEL_154;
                            }
                            v96 = +[VOTOutputManager outputManager];
                            if ([v96 externalAudioRoutesContainHDMIRoute])
                            {

                              goto LABEL_154;
                            }
                            v97 = +[VOTOutputManager outputManager];
                            unsigned __int8 v157 = [v97 externalAudioRouteIsHearingAid];

                            if (v157) {
                              goto LABEL_154;
                            }
                            v73 = v185->super._currentRotors;
                            uint64_t v74 = 90;
                            break;
                          case '[':
                            v73 = v185->super._currentRotors;
                            uint64_t v74 = 91;
                            break;
                          default:
                            goto LABEL_154;
                        }
                      }
                      break;
                  }
                }
                else if ((int)v60 <= 80)
                {
                  uint64_t v75 = v60;
                  switch((int)v60)
                  {
                    case 3:
                      goto LABEL_125;
                    case 4:
                      uint64_t v75 = 4;
LABEL_125:
                      j__CFArrayAppendValue(v185->super._currentRotors, (const void *)v75);
                      goto LABEL_135;
                    case 5:
                    case 6:
                      goto LABEL_140;
                    case 7:
                      goto LABEL_133;
                    case 8:
                      goto LABEL_134;
                    default:
                      if (v60 == 60) {
                        goto LABEL_139;
                      }
LABEL_137:
                      if (v60 != 68) {
                        goto LABEL_140;
                      }
                      v73 = v185->super._currentRotors;
                      uint64_t v74 = 68;
                      break;
                  }
                }
                else
                {
                  switch((int)v60)
                  {
                    case 'Q':
LABEL_122:
                      v73 = v185->super._currentRotors;
                      uint64_t v74 = 81;
                      break;
                    case 'R':
LABEL_143:
                      v73 = v185->super._currentRotors;
                      uint64_t v74 = 82;
                      break;
                    case 'V':
LABEL_144:
                      v76 = [(id)VOTSharedWorkspace punctuationGroups];
                      id v77 = [v76 count];

                      if (!v77) {
                        goto LABEL_154;
                      }
                      v73 = v185->super._currentRotors;
                      uint64_t v74 = 86;
                      break;
                    case 'W':
LABEL_146:
                      v73 = v185->super._currentRotors;
                      uint64_t v74 = 87;
                      break;
                    case 'X':
LABEL_147:
                      v73 = v185->super._currentRotors;
                      uint64_t v74 = 88;
                      break;
                    case 'Y':
LABEL_148:
                      v73 = v185->super._currentRotors;
                      uint64_t v74 = 89;
                      break;
                    case '\\':
LABEL_149:
                      v78 = [(id)VOTSharedWorkspace activities];
                      id v79 = [v78 count];

                      if (!v79) {
                        goto LABEL_135;
                      }
                      v73 = v185->super._currentRotors;
                      uint64_t v74 = 92;
                      break;
LABEL_151:
                      v73 = v185->super._currentRotors;
                      uint64_t v74 = 96;
                      break;
                    default:
                      goto LABEL_140;
                  }
                }
LABEL_153:
                j__CFArrayAppendValue(v73, (const void *)v74);
                goto LABEL_154;
              }
              uint64_t v70 = 20;
LABEL_116:
              j__CFArrayAppendValue(v185->super._currentRotors, (const void *)v70);
              goto LABEL_117;
            }
          }
          else if (v60 != 6)
          {
            goto LABEL_117;
          }
          if (((v176 | [v184 doesHaveTraits:v171]) & 1) == 0
            && ![v184 supportsTextSelection])
          {
            goto LABEL_117;
          }
          uint64_t v70 = 6;
          goto LABEL_116;
        }
        long long v30 = v185;
        if (v181) {
          goto LABEL_160;
        }
        switch(v60)
        {
          case 5:
            CFArrayRef v71 = v185->super._currentRotors;
            uint64_t v72 = 5;
            break;
          case 4:
            CFArrayRef v71 = v185->super._currentRotors;
            uint64_t v72 = 4;
            break;
          case 3:
            CFArrayRef v71 = v185->super._currentRotors;
            uint64_t v72 = 3;
            break;
          default:
            goto LABEL_160;
        }
        sub_1000F4A84(v71, (const void *)v72);
LABEL_160:

        v55 = (char *)v55 + 1;
      }
      while (v53 != v55);
      id v99 = [obj countByEnumeratingWithState:&v191 objects:v195 count:16];
      id v53 = v99;
    }
    while (v99);
  }

  if (([v184 shouldIncludeMediaDescriptionsRotor] & 1) != 0
    || ([v184 application],
        v100 = objc_claimAutoreleasedReturnValue(),
        unsigned int v101 = [v100 areMediaLegibilityEventsBeingTapped],
        v100,
        v101))
  {
    j__CFArrayAppendValue(v30->super._currentRotors, (const void *)0x40);
  }
  v102 = [v184 customRotorActions];
  v177 = +[VOTElement organizedActionsByCategory:v102];
  unsigned int v103 = -[VOTElementRotor customActionsAreDragDrop:](v30, "customActionsAreDragDrop:");
  unsigned int v173 = [v184 shouldAddAlternateActionForLinkElement];
  v104 = [v184 customContent];
  v105 = [(id)VOTSharedWorkspace elementManager];
  unsigned int v106 = [v105 dragSessionActive];

  uint64_t v107 = v168;
  if ([v184 doesHaveTraits:v160 | v165] && !v168)
  {
    uint64_t v107 = [(VOTRotor *)v30 currentRotorType];
    if (sub_1000F2514(v107))
    {
      v108 = VOTLogRotor();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG)) {
        sub_10012135C(v107, v108);
      }
    }
    else
    {
      if (![v184 doesHaveTraits:v160]
        || ![(VOTRotor *)v30 currentSelectionRotorType])
      {
        if ([v102 count] && ((v103 ^ 1 | v106) & 1) != 0)
        {
          uint64_t v107 = 55;
        }
        else if ([v104 count])
        {
          uint64_t v107 = 93;
        }
        else
        {
          uint64_t v107 = 3;
        }
LABEL_265:
        CFArrayRef v109 = v30->super._currentRotors;
        v196.length = CFArrayGetCount(v109);
        v196.id location = 0;
        if (CFArrayGetFirstIndexOfValue(v109, v196, (const void *)3) == -1) {
          j__CFArrayAppendValue(v30->super._currentRotors, (const void *)3);
        }
        goto LABEL_267;
      }
      uint64_t v107 = [(VOTRotor *)v30 currentSelectionRotorType];
      v108 = VOTLogRotor();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG)) {
        sub_1001213D4(v30, v108);
      }
    }

    goto LABEL_265;
  }
LABEL_267:
  if ([(VOTElementRotor *)v30 showsWebSearchResults])
  {
    uint64_t v107 = 39;
    j__CFArrayAppendValue(v30->super._currentRotors, (const void *)0x27);
  }
  if ((v167 & [v166 isSafariScribbleActive]) == 1)
  {
    uint64_t v107 = 95;
    j__CFArrayAppendValue(v30->super._currentRotors, (const void *)0x5F);
  }
  unsigned int v175 = v103;
  v178 = v104;
  v180 = v102;
  uint64_t v169 = v107;
  v182 = v30->super._customPublicRotors;
  v110 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  customPublicRotors = v30->super._customPublicRotors;
  v30->super._customPublicRotors = v110;

  if ([obj count])
  {
    unint64_t v112 = 0;
    do
    {
      v113 = [obj objectAtIndex:v112];
      v114 = [v113 objectForKey:@"VOTRotorType"];
      unsigned int v115 = [v114 intValue];

      v116 = [v113 objectForKey:@"Enabled"];
      unsigned int v117 = [v116 BOOLValue];

      if (v115 != 70) {
        unsigned int v117 = 0;
      }

      if (v117 == 1) {
        break;
      }
      ++v112;
    }
    while (v112 < (unint64_t)[obj count]);
  }
  else
  {
    LOBYTE(v117) = 0;
  }
  v188[0] = _NSConcreteStackBlock;
  v188[1] = 3221225472;
  v188[2] = sub_1000B1B64;
  v188[3] = &unk_1001B6018;
  char v190 = v117;
  v188[4] = v30;
  id v118 = v184;
  id v189 = v118;
  v119 = objc_retainBlock(v188);
  ((void (*)(void *, id, void))v119[2])(v119, v118, 0);
  v120 = v162;
  if (v176) {
    ((void (*)(void *, id, uint64_t))v119[2])(v119, v162, 1);
  }
  uint64_t v121 = v169;
  if ([(NSMutableArray *)v185->super._customPublicRotors count])
  {
    j__CFArrayAppendValue(v185->super._currentRotors, (const void *)0x36);
    if ([(VOTRotor *)v185 publicCustomRotorIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v122 = 0;
    }
    else
    {
      v122 = (char *)[(NSMutableArray *)v182 count] - 1;
      v124 = [(VOTRotor *)v185 publicCustomRotorIndex];
      if (v122 >= v124) {
        v122 = v124;
      }
    }
    if ((id)[(VOTRotor *)v185 currentRotorType] == (id)54
      && [(NSMutableArray *)v182 count]
      && (id v125 = [(NSMutableArray *)v182 count],
          v125 == [(NSMutableArray *)v185->super._customPublicRotors count]))
    {
      v126 = [(NSMutableArray *)v182 objectAtIndexedSubscript:v122];
      v127 = [(NSMutableArray *)v185->super._customPublicRotors objectAtIndexedSubscript:v122];
      unsigned int v128 = [v126 isEqual:v127];
    }
    else
    {
      unsigned int v128 = 0;
    }
    if (v169) {
      BOOL v129 = 0;
    }
    else {
      BOOL v129 = v158 == -1;
    }
    CFArrayRef v123 = cf;
    if (v129 || v128)
    {
      v130 = VOTLogRotor();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG)) {
        sub_100121328();
      }

      uint64_t v121 = 54;
    }
  }
  else
  {
    CFArrayRef v123 = cf;
  }
  v131 = [v118 customContent];
  if ([v131 count])
  {
    uint64_t v121 = 93;
    j__CFArrayAppendValue(v185->super._currentRotors, (const void *)0x5D);
  }
  v187[0] = _NSConcreteStackBlock;
  v187[1] = 3221225472;
  v187[2] = sub_1000B1D54;
  v187[3] = &unk_1001B3890;
  v187[4] = v185;
  v132 = objc_msgSend(v177, "ax_filteredArrayUsingBlock:", v187);

  objc_storeStrong((id *)&v185->super._customRotorActionCategories, v132);
  if (-[VOTElementRotor customActionsAreValid:](v185, "customActionsAreValid:", v185->super._customRotorActionCategories)|| (-[VOTRotor delegate](v185, "delegate"), v133 = objc_claimAutoreleasedReturnValue(), id v134 = [v133 actionsRotorAddBehaviorForElementRotor:v185], v133, v134 == (id)1))
  {
    j__CFArrayAppendValue(v185->super._currentRotors, (const void *)0x37);
    if (((v159 | v175 | v173) & 1) == 0)
    {
      v135 = VOTLogRotor();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG)) {
        sub_1001212F4();
      }

      uint64_t v121 = 55;
    }
  }
  v186[0] = _NSConcreteStackBlock;
  v186[1] = 3221225472;
  v186[2] = sub_1000B1DF8;
  v186[3] = &unk_1001B6040;
  v186[4] = v185;
  [obj enumerateObjectsWithOptions:2 usingBlock:v186];
  uint64_t Count = CFArrayGetCount(v185->super._currentRotors);
  if (([(id)VOTSharedWorkspace updateRotorWithElement] & 1) != 0
    || sub_1000F31E0(v185->super._currentRotors, (const void *)v185->super._currentRotorType) == -1)
  {
    if (CFArrayGetCount(v123) == Count && !v121)
    {
      if (Count < 1)
      {
        CFIndex v137 = 0;
      }
      else
      {
        CFIndex v137 = 0;
        while (1)
        {
          unsigned int ValueAtIndex = CFArrayGetValueAtIndex(v123, v137);
          if (ValueAtIndex != CFArrayGetValueAtIndex(v185->super._currentRotors, v137)) {
            break;
          }
          if (Count == ++v137) {
            goto LABEL_319;
          }
        }
      }
      if (v137 == Count)
      {
LABEL_319:
        v139 = v185;
        goto LABEL_328;
      }
    }
    unint64_t v140 = [(VOTRotor *)v185 currentRotorType];
    if (v140 <= 0x36 && ((1 << v140) & 0x40006000000180) != 0 && v154)
    {
      v141 = v185;
      id v142 = [(VOTRotor *)v185 currentRotorType];
      v143 = VOTLogRotor();
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG)) {
        sub_1001212C0();
      }

      [(VOTElementRotor *)v185 _depromoteMLElementSupport];
      goto LABEL_327;
    }
    id v142 = (id)v121;
    v141 = v185;
    [(VOTElementRotor *)v185 _depromoteMLElementSupport];
    if (v142)
    {
LABEL_327:
      [(VOTRotor *)v141 setCurrentRotorType:v142 saveToPreferences:0 userInitiated:0];
      v139 = v141;
LABEL_328:
      [(VOTElementRotor *)v139 _promoteGesturedTextInputRotorIfNeeded];
      if (v123) {
        CFRelease(v123);
      }
      goto LABEL_349;
    }
    v144 = +[VOTConfiguration rootConfiguration];
    v145 = [v144 preferenceForKey:v185->super._typeKey];

    if (v145
      && (uint64_t v146 = (int)[v145 intValue],
          v197.id location = 0,
          v197.length = Count,
          CFArrayContainsValue(v185->super._currentRotors, v197, (const void *)v146))
      && !sub_1000F2B98(v146))
    {
      [(VOTRotor *)v185 setCurrentRotorType:v146 saveToPreferences:0 userInitiated:0];
      [(VOTElementRotor *)v185 _promoteGesturedTextInputRotorIfNeeded];
    }
    else
    {
      if ([(NSString *)v185->super._typeKey isEqualToString:@"CurrentRotorTypeSimple"])
      {
LABEL_340:
        v120 = v162;
        if (CFArrayGetCount(v185->super._currentRotors) < 1)
        {
          [(VOTRotor *)v185 setCurrentRotorType:3 saveToPreferences:0 userInitiated:0];
        }
        else
        {
          [(VOTRotor *)v185 setCurrentRotorType:[(VOTElementRotor *)v185 _firstNonGesturedTextInputRotorTypeWithFallback:CFArrayGetValueAtIndex(v185->super._currentRotors, 0)] saveToPreferences:0 userInitiated:0];
          v150 = +[VOTConfiguration rootConfiguration];
          v151 = +[NSNumber numberWithInteger:v185->super._currentRotorType];
          [v150 setPreference:v151 forKey:v185->super._typeKey];
        }
        [(VOTElementRotor *)v185 _promoteGesturedTextInputRotorIfNeeded];
        goto LABEL_346;
      }
      v147 = +[VOTConfiguration rootConfiguration];
      v148 = [v147 preferenceForKey:@"CurrentRotorTypeSimple"];

      if (!v148)
      {
        v145 = 0;
        goto LABEL_340;
      }
      uint64_t v149 = (int)[v148 intValue];
      v198.id location = 0;
      v198.length = Count;
      if (!CFArrayContainsValue(v185->super._currentRotors, v198, (const void *)v149) || sub_1000F2B98(v149))
      {
        v145 = v148;
        goto LABEL_340;
      }
      [(VOTRotor *)v185 setCurrentRotorType:v149 saveToPreferences:0 userInitiated:0];
      v152 = +[VOTConfiguration rootConfiguration];
      v153 = +[NSNumber numberWithInteger:v185->super._currentRotorType];
      [v152 setPreference:v153 forKey:v185->super._typeKey];

      [(VOTElementRotor *)v185 _promoteGesturedTextInputRotorIfNeeded];
      v145 = v148;
    }
    v120 = v162;
LABEL_346:
    if (cf) {
      CFRelease(cf);
    }
  }
LABEL_349:
}

- (BOOL)customActionsAreValid:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned __int8 v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) actions];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1000B2040;
        v14[3] = &unk_1001B5860;
        v14[4] = self;
        id v10 = [v9 indexesOfObjectsPassingTest:v14];
        id v11 = [v10 count];

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)customActionsAreDragDrop:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v3;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v4);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          BOOL v12 = [v11 actions];
          uint64_t v13 = [v12 indexesOfObjectsPassingTest:&stru_1001B6080];
          v7 += (uint64_t)[v13 count];

          long long v14 = [v11 actions];
          v8 += (uint64_t)[v14 count];
        }
        id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
    }

    BOOL v15 = v7 == v8;
    id v3 = v17;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)showsWebSearchResults
{
  return self->_showsWebSearchResults;
}

- (void)setShowsWebSearchResults:(BOOL)a3
{
  self->_showsWebSearchResults = a3;
}

- (BOOL)ignoreDefaultTypeAutofill
{
  return self->_ignoreDefaultTypeAutofill;
}

- (void)setIgnoreDefaultTypeAutofill:(BOOL)a3
{
  self->_ignoreDefaultTypeAutofill = a3;
}

- (id)updatedWebRotorItemsCallback
{
  return self->_updatedWebRotorItemsCallback;
}

- (void)setUpdatedWebRotorItemsCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatedWebRotorItemsCallback, 0);
  objc_storeStrong((id *)&self->_enabledWebRotorItemsQueue, 0);

  objc_storeStrong((id *)&self->_enabledWebRotorItems, 0);
}

@end