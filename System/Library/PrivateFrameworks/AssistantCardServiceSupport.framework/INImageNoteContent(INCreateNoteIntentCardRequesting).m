@interface INImageNoteContent(INCreateNoteIntentCardRequesting)
- (id)acs_cardSection;
@end

@implementation INImageNoteContent(INCreateNoteIntentCardRequesting)

- (id)acs_cardSection
{
  v6[1] = *MEMORY[0x263EF8340];
  v1 = [a1 image];
  if (v1)
  {
    v2 = objc_msgSend(MEMORY[0x263F678E0], "acs_uniquelyIdentifiedCardSection");
    v3 = (void *)[objc_alloc(MEMORY[0x263F10340]) initWithIntentsImage:v1];
    v6[0] = v3;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    [v2 setImages:v4];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end