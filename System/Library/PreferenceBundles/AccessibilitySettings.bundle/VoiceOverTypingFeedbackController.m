@interface VoiceOverTypingFeedbackController
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)feedbackTypeForString:(id)a3;
- (int64_t)rowForTypingFeedbackOption:(int64_t)a3 section:(int64_t)a4;
- (void)_updateSelectedRows;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VoiceOverTypingFeedbackController

- (id)specifiers
{
  v2 = self;
  v3 = (id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!*v3)
  {
    v4 = [(VoiceOverTypingFeedbackController *)self loadSpecifiersFromPlistName:@"VoiceOverTypingFeedback" target:self];
    v5 = +[AXSettings sharedInstance];
    unsigned int v6 = [v5 voiceOverBrailleGesturesEnabled];

    if (v6)
    {
      objc_storeStrong(v3, v4);
    }
    else
    {
      v20 = v3;
      v21 = v2;
      id v22 = objc_alloc_init((Class)NSMutableArray);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v19 = v4;
      id obj = v4;
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v25;
        uint64_t v10 = PSIDKey;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v25 != v9) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v13 = [v12 propertyForKey:@"layout_type"];
            if ([v13 isEqualToString:@"braille_gestures"])
            {
            }
            else
            {
              v14 = [v12 propertyForKey:v10];
              unsigned __int8 v15 = [v14 isEqualToString:@"BrailleGesturesGroup"];

              if ((v15 & 1) == 0) {
                [v22 addObject:v12];
              }
            }
          }
          id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v8);
      }

      v2 = v21;
      [(VoiceOverTypingFeedbackController *)v21 setAllSpecifiersUnsearchable:v22];
      v3 = v20;
      v16 = *v20;
      *v20 = v22;

      v4 = v19;
    }
  }
  [(VoiceOverTypingFeedbackController *)v2 _updateSelectedRows];
  id v17 = *v3;

  return v17;
}

- (int64_t)feedbackTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"off"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"characters"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"words"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"wordsAndCharacters"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)rowForTypingFeedbackOption:(int64_t)a3 section:(int64_t)a4
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v18 = self;
  id v5 = *(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v21;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
      v12 = objc_msgSend(v11, "propertyForKey:", @"layout_type", v18);
      v13 = v12;
      if (a4 == 2)
      {
        if ([v12 isEqualToString:@"braille_gestures"]) {
          goto LABEL_14;
        }
      }
      else
      {
        if (a4 == 1)
        {
          CFStringRef v14 = @"hardware";
        }
        else
        {
          if (a4) {
            goto LABEL_16;
          }
          CFStringRef v14 = @"software";
        }
        if ([v12 isEqualToString:v14])
        {
LABEL_14:
          unsigned __int8 v15 = [v11 propertyForKey:@"option"];
          id v16 = [(VoiceOverTypingFeedbackController *)v18 feedbackTypeForString:v15];

          if (v16 == (id)a3)
          {

            goto LABEL_20;
          }
          ++v8;
        }
      }
LABEL_16:

      if (v7 == (id)++v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_20:

  return v8;
}

- (void)_updateSelectedRows
{
  id v3 = +[AXSettings sharedInstance];
  self->_swSelectedRow = -[VoiceOverTypingFeedbackController rowForTypingFeedbackOption:section:](self, "rowForTypingFeedbackOption:section:", [v3 voiceOverSoftwareTypingFeedback], 0);
  self->_hwSelectedRow = -[VoiceOverTypingFeedbackController rowForTypingFeedbackOption:section:](self, "rowForTypingFeedbackOption:section:", [v3 voiceOverHardwareTypingFeedback], 1);
  if ([v3 voiceOverBrailleGesturesEnabled]) {
    self->_brailleGesturesSelectedRow = -[VoiceOverTypingFeedbackController rowForTypingFeedbackOption:section:](self, "rowForTypingFeedbackOption:section:", [v3 voiceOverBrailleGesturesTypingFeedback], 2);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VoiceOverTypingFeedbackController;
  id v7 = [(VoiceOverTypingFeedbackController *)&v14 tableView:a3 cellForRowAtIndexPath:v6];
  int64_t v8 = +[NSIndexPath indexPathForRow:self->_swSelectedRow inSection:0];
  if ([v8 isEqual:v6]) {
    goto LABEL_4;
  }
  uint64_t v9 = +[NSIndexPath indexPathForRow:self->_hwSelectedRow inSection:1];
  if ([v9 isEqual:v6])
  {

LABEL_4:
LABEL_5:
    [v7 setChecked:1];
    goto LABEL_6;
  }
  v11 = +[AXSettings sharedInstance];
  if ([v11 voiceOverBrailleGesturesEnabled])
  {
    v12 = +[NSIndexPath indexPathForRow:self->_brailleGesturesSelectedRow inSection:2];
    unsigned __int8 v13 = [v12 isEqual:v6];

    if (v13) {
      goto LABEL_5;
    }
  }
  else
  {
  }
LABEL_6:

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)VoiceOverTypingFeedbackController;
  [(VoiceOverTypingFeedbackController *)&v15 viewWillAppear:1];
  [(VoiceOverTypingFeedbackController *)self _updateSelectedRows];
  uint64_t v4 = OBJC_IVAR___PSListController__table;
  id v5 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table];
  id v6 = +[NSIndexPath indexPathForRow:self->_swSelectedRow inSection:0];
  id v7 = [v5 cellForRowAtIndexPath:v6];

  [v7 setChecked:1];
  int64_t v8 = *(void **)&self->AXUISettingsBaseListController_opaque[v4];
  uint64_t v9 = +[NSIndexPath indexPathForRow:self->_hwSelectedRow inSection:1];
  uint64_t v10 = [v8 cellForRowAtIndexPath:v9];

  [v10 setChecked:1];
  v11 = +[AXSettings sharedInstance];
  LODWORD(v7) = [v11 voiceOverBrailleGesturesEnabled];

  if (v7)
  {
    v12 = *(void **)&self->AXUISettingsBaseListController_opaque[v4];
    unsigned __int8 v13 = +[NSIndexPath indexPathForRow:self->_brailleGesturesSelectedRow inSection:2];
    objc_super v14 = [v12 cellForRowAtIndexPath:v13];

    [v14 setChecked:1];
    uint64_t v10 = v14;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VoiceOverTypingFeedbackController;
  [(VoiceOverTypingFeedbackController *)&v18 tableView:v6 didSelectRowAtIndexPath:v7];
  int64_t v8 = [v6 cellForRowAtIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(VoiceOverTypingFeedbackController *)self specifierForIndexPath:v7];
    uint64_t v10 = [v9 propertyForKey:@"layout_type"];
    v11 = [v9 propertyForKey:@"option"];
    int64_t v12 = [(VoiceOverTypingFeedbackController *)self feedbackTypeForString:v11];

    if ([v10 isEqualToString:@"software"])
    {
      int64_t swSelectedRow = self->_swSelectedRow;
      objc_super v14 = +[AXSettings sharedInstance];
      [v14 setVoiceOverSoftwareTypingFeedback:v12];
      uint64_t v15 = 0;
    }
    else if ([v10 isEqualToString:@"hardware"])
    {
      int64_t swSelectedRow = self->_hwSelectedRow;
      objc_super v14 = +[AXSettings sharedInstance];
      [v14 setVoiceOverHardwareTypingFeedback:v12];
      uint64_t v15 = 1;
    }
    else
    {
      int64_t swSelectedRow = self->_brailleGesturesSelectedRow;
      objc_super v14 = +[AXSettings sharedInstance];
      [v14 setVoiceOverBrailleGesturesTypingFeedback:v12];
      uint64_t v15 = 2;
    }

    id v16 = +[NSIndexPath indexPathForRow:swSelectedRow inSection:v15];
    id v17 = [v6 cellForRowAtIndexPath:v16];

    [v17 setChecked:0];
    [v8 setChecked:1];
    [(VoiceOverTypingFeedbackController *)self _updateSelectedRows];
  }
}

@end