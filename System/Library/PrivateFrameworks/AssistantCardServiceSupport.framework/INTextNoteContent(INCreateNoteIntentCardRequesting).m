@interface INTextNoteContent(INCreateNoteIntentCardRequesting)
- (id)acs_cardSection;
@end

@implementation INTextNoteContent(INCreateNoteIntentCardRequesting)

- (id)acs_cardSection
{
  v1 = [a1 text];
  if ([v1 length])
  {
    v2 = objc_msgSend(MEMORY[0x263F67868], "acs_uniquelyIdentifiedCardSection");
    [v2 setTitle:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end