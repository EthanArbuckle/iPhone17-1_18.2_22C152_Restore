@interface CNPropertyTTYAction
- (void)performActionForItem:(id)a3 sender:(id)a4;
@end

@implementation CNPropertyTTYAction

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  id v19 = a3;
  v4 = [v19 labeledValue];
  v5 = [v4 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v7 = v19;
  if (isKindOfClass)
  {
    v8 = [v19 labeledValue];
    v9 = [v8 value];

    v10 = [v9 stringValue];
    v11 = [v19 contact];
    if (![v10 length])
    {
LABEL_9:

      v7 = v19;
      goto LABEL_10;
    }
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F5A600]) initWithStringValue:v10 type:2];
    v13 = [v19 delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [v19 delegate];
      v16 = [v15 geminiDataSource];
      v17 = [v16 channelIdentifier];

      if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
      {
      }
      else
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CB10], "_cnui_ttyURLWithHandle:contact:channelIdentifier:", v12, v11, v17);

        if (v18)
        {
LABEL_8:
          [(id)*MEMORY[0x1E4FB2608] openURL:v18 withCompletionHandler:0];

          goto LABEL_9;
        }
      }
    }
    v18 = objc_msgSend(MEMORY[0x1E4F1CB10], "_cnui_ttyURLWithHandle:contact:", v12, v11);
    goto LABEL_8;
  }
LABEL_10:
}

@end