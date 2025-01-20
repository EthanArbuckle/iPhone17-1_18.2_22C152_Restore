@interface CNQuickFaceTimeAction
+ (id)defaultFaceTimeAudioTitle;
+ (id)defaultFaceTimeTitle;
- (BOOL)audioOnly;
- (id)_coreDuetInteractionMechanisms;
- (id)_coreDuetValue;
- (id)category;
- (id)identifier;
- (id)subtitleForContext:(int64_t)a3;
- (id)titleForContext:(int64_t)a3;
- (unint64_t)score;
- (void)performWithCompletionBlock:(id)a3;
- (void)setAudioOnly:(BOOL)a3;
@end

@implementation CNQuickFaceTimeAction

- (void)setAudioOnly:(BOOL)a3
{
  self->_audioOnly = a3;
}

- (BOOL)audioOnly
{
  return self->_audioOnly;
}

- (void)performWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (+[CNQuickAction reallyPerform])
  {
    v5 = [(CNQuickPropertyAction *)self propertyAction];
    if ([(CNQuickFaceTimeAction *)self audioOnly]) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 3;
    }
    [v5 setType:v6];
    [v5 performActionForItem:0 sender:self];
    [(CNQuickContactAction *)self setCompletionBlock:v4];
    [(CNQuickContactAction *)self actionDidFinish:v5];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNQuickFaceTimeAction;
    [(CNQuickPropertyAction *)&v7 performWithCompletionBlock:v4];
  }
}

- (unint64_t)score
{
  v3.receiver = self;
  v3.super_class = (Class)CNQuickFaceTimeAction;
  return [(CNQuickPropertyAction *)&v3 score] + 100;
}

- (id)subtitleForContext:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) < 2)
  {
    v7.receiver = self;
    v7.super_class = (Class)CNQuickFaceTimeAction;
    v5 = [(CNQuickPropertyAction *)&v7 subtitleForContext:0];
  }
  else if (a3 == 4 || a3 == 1)
  {
    BOOL v3 = [(CNQuickFaceTimeAction *)self audioOnly];
    id v4 = objc_opt_class();
    if (v3) {
      [v4 defaultFaceTimeAudioTitle];
    }
    else {
    v5 = [v4 defaultFaceTimeTitle];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)titleForContext:(int64_t)a3
{
  id v4 = 0;
  switch(a3)
  {
    case 0:
    case 2:
    case 3:
      BOOL v5 = [(CNQuickFaceTimeAction *)self audioOnly];
      uint64_t v6 = objc_opt_class();
      if (!v5) {
        goto LABEL_5;
      }
      id v4 = [v6 defaultFaceTimeAudioTitle];
      break;
    case 1:
      v8.receiver = self;
      v8.super_class = (Class)CNQuickFaceTimeAction;
      id v4 = [(CNQuickPropertyAction *)&v8 titleForContext:1];
      break;
    case 5:
    case 6:
      uint64_t v6 = objc_opt_class();
LABEL_5:
      id v4 = [v6 defaultFaceTimeTitle];
      break;
    default:
      break;
  }

  return v4;
}

- (id)_coreDuetInteractionMechanisms
{
  BOOL v3 = [MEMORY[0x1E4F28E60] indexSet];
  if ([(CNQuickFaceTimeAction *)self audioOnly]) {
    uint64_t v4 = 11;
  }
  else {
    uint64_t v4 = 17;
  }
  [v3 addIndex:v4];
  [v3 addIndex:10];

  return v3;
}

- (id)_coreDuetValue
{
  return 0;
}

- (id)category
{
  BOOL v2 = [(CNQuickFaceTimeAction *)self audioOnly];
  BOOL v3 = &CNQuickActionCategoryVideoCall;
  if (v2) {
    BOOL v3 = &CNQuickActionCategoryAudioCall;
  }
  uint64_t v4 = (void *)*v3;

  return v4;
}

- (id)identifier
{
  if ([(CNQuickFaceTimeAction *)self audioOnly]) {
    return @"facetime-audio";
  }
  else {
    return @"facetime-video";
  }
}

+ (id)defaultFaceTimeAudioTitle
{
  BOOL v2 = CNContactsUIBundle();
  BOOL v3 = [v2 localizedStringForKey:@"FACETIME_AUDIO_ACTION_TITLE" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

+ (id)defaultFaceTimeTitle
{
  BOOL v2 = CNContactsUIBundle();
  BOOL v3 = [v2 localizedStringForKey:@"FACETIME_ACTION_TITLE" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

@end