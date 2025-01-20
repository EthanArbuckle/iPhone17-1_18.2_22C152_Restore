@interface INCreateNoteIntent
@end

@implementation INCreateNoteIntent

void __69__INCreateNoteIntent_ACSCardRequesting___buildCardFromRequest_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = (void *)MEMORY[0x263F0FCE0];
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = objc_opt_class();
  objc_msgSend(NSString, "stringWithFormat:", @"createdNote.contents[%zd]", a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = [v4 parameterForClass:v7 keyPath:v9];
  [v5 setObject:v8 forKey:v6];
}

@end