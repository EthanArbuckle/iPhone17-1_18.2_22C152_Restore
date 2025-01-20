@interface ICSettingsDefaultParagraphStyleController
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICSettingsDefaultParagraphStyleController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSettingsDefaultParagraphStyleController;
  [(ICSettingsDefaultParagraphStyleController *)&v4 viewDidAppear:a3];
  [(ICSettingsDefaultParagraphStyleController *)self ic_submitNavigationEventForIdentifier:@"DEFAULT_STYLE" titleStringKey:@"NOTE_DEFAULT_STYLE" navigationComponents:&off_1F148];
}

@end