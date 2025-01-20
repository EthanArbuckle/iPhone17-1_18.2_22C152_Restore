@interface PKTextInputFakeInteractions
+ (id)sharedInstance;
+ (void)attachFakeInteractionToViewIfNecessary:(id)a3;
- (void)_attachToView:(id)a3;
@end

@implementation PKTextInputFakeInteractions

+ (id)sharedInstance
{
  if (qword_1EB3C6310 != -1) {
    dispatch_once(&qword_1EB3C6310, &__block_literal_global_88);
  }
  v2 = (void *)_MergedGlobals_161;

  return v2;
}

void __45__PKTextInputFakeInteractions_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKTextInputFakeInteractions);
  v1 = (void *)_MergedGlobals_161;
  _MergedGlobals_161 = (uint64_t)v0;
}

+ (void)attachFakeInteractionToViewIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedInstance];
  [v5 _attachToView:v4];
}

- (void)_attachToView:(id)a3
{
  id v19 = a3;
  v3 = [v19 fakeScribbleInteractionDelegate];

  if (!v3 && (PKHasScribbleInteractionInView(v19) & 1) == 0)
  {
    id v4 = +[PKTextInputSettings sharedSettings];
    int v5 = [v4 enableTargetedAppWorkarounds];

    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v19;
        if ([v6 isStylusDrawingEnabled])
        {
          v7 = [[PKFakeNotesDelegate alloc] initWithTextView:v6];

          if (v7)
          {
LABEL_21:
            v16 = 0;
            goto LABEL_24;
          }
        }
        else
        {
        }
      }
      if (NSClassFromString(&cfstr_Rctextfield.isa))
      {
        if (objc_opt_isKindOfClass())
        {
          v8 = [[PKFakeVoiceMemosDelegate alloc] initWithView:v19];
          if (v8)
          {
LABEL_20:
            v7 = (PKFakeNotesDelegate *)v8;
            goto LABEL_21;
          }
        }
      }
      if (NSClassFromString(&cfstr_Ekuitableviewc.isa) && (objc_opt_isKindOfClass() & 1) != 0)
      {
        id v9 = v19;
        v10 = [v9 textLabel];
        v11 = [v10 text];
        char v12 = [v11 isEqualToString:@"Location"];

        if (v12)
        {
          v13 = [PKFakeCalendarLocationDelegate alloc];
          v14 = [v9 window];
          v15 = [(PKFakeCalendarLocationDelegate *)v13 initWithCell:v9 window:v14];

          v7 = v15;
          v16 = v7;
          if (v7)
          {
LABEL_24:
            [v19 setFakeScribbleInteractionDelegate:v7];
            v17 = objc_alloc_init(PKScribbleInteraction);
            v18 = [v19 fakeScribbleInteractionDelegate];
            [(PKScribbleInteraction *)v17 setDelegate:v18];

            [(PKScribbleInteraction *)v17 setElementSource:v16];
            [v19 addInteraction:v17];

            goto LABEL_25;
          }
        }
        else
        {
        }
      }
    }
    if (+[PKFakeDisableDelegate _shouldAttachForView:v19])
    {
      v8 = objc_alloc_init(PKFakeDisableDelegate);
      if (v8) {
        goto LABEL_20;
      }
    }
    if (+[PKFakeTapToFocusDelegate _shouldAttachForView:v19])
    {
      v7 = [[PKFakeTapToFocusDelegate alloc] initWithView:v19];
      v16 = v7;
      if (v7) {
        goto LABEL_24;
      }
    }
  }
LABEL_25:
}

@end