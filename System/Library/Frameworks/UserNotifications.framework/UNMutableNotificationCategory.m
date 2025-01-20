@interface UNMutableNotificationCategory
- (UNMutableNotificationCategory)initWithIdentifier:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setActions:(id)a3;
- (void)setActionsMenuTitle:(id)a3;
- (void)setAlternateAction:(id)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setCategorySummaryFormat:(id)a3;
- (void)setHiddenPreviewsBodyPlaceholder:(id)a3;
- (void)setIntentIdentifiers:(id)a3;
- (void)setListPriority:(unint64_t)a3;
- (void)setMinimalActions:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation UNMutableNotificationCategory

- (void)setOptions:(unint64_t)a3
{
  self->super._options = a3;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->super._backgroundStyle = a3;
}

- (void)setMinimalActions:(id)a3
{
  self->super._minimalActions = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setIntentIdentifiers:(id)a3
{
  self->super._intentIdentifiers = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setHiddenPreviewsBodyPlaceholder:(id)a3
{
  self->super._hiddenPreviewsBodyPlaceholder = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setCategorySummaryFormat:(id)a3
{
  self->super._categorySummaryFormat = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setActions:(id)a3
{
  self->super._actions = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (UNMutableNotificationCategory)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UNMutableNotificationCategory;
  return (UNMutableNotificationCategory *)-[UNNotificationCategory _initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:](&v4, sel__initWithIdentifier_actions_minimalActions_alternateAction_intentIdentifiers_hiddenPreviewsBodyPlaceholder_categorySummaryFormat_actionsMenuTitle_options_backgroundStyle_listPriority_, a3, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], 0, MEMORY[0x1E4F1CBF0], &stru_1F062A810, &stru_1F062A810, 0, 0, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v14 = +[UNNotificationCategory allocWithZone:a3];
  v13 = [(UNNotificationCategory *)self identifier];
  objc_super v4 = [(UNNotificationCategory *)self actions];
  v5 = [(UNNotificationCategory *)self minimalActions];
  v6 = [(UNNotificationCategory *)self alternateAction];
  v7 = [(UNNotificationCategory *)self intentIdentifiers];
  v8 = [(UNNotificationCategory *)self hiddenPreviewsBodyPlaceholder];
  v9 = [(UNNotificationCategory *)self categorySummaryFormat];
  v10 = [(UNNotificationCategory *)self actionsMenuTitle];
  id v11 = [(UNNotificationCategory *)v14 _initWithIdentifier:v13 actions:v4 minimalActions:v5 alternateAction:v6 intentIdentifiers:v7 hiddenPreviewsBodyPlaceholder:v8 categorySummaryFormat:v9 actionsMenuTitle:v10 options:[(UNNotificationCategory *)self options] backgroundStyle:[(UNNotificationCategory *)self backgroundStyle] listPriority:[(UNNotificationCategory *)self listPriority]];

  return v11;
}

- (void)setAlternateAction:(id)a3
{
}

- (void)setActionsMenuTitle:(id)a3
{
  self->super._actionsMenuTitle = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setListPriority:(unint64_t)a3
{
  self->super._listPriority = a3;
}

@end