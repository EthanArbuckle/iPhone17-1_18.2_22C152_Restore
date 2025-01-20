@interface CNPropertyFaceTimeAction
- (BOOL)canPerformAction;
- (CNPropertyBestIDSValueQuery)bestFaceTimeQuery;
- (CNPropertyFaceTimeAction)initWithContact:(id)a3 propertyItems:(id)a4;
- (int64_t)type;
- (void)_queryFaceTimeStatus;
- (void)dealloc;
- (void)performActionForItem:(id)a3 sender:(id)a4;
- (void)queryComplete;
- (void)setBestFaceTimeQuery:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CNPropertyFaceTimeAction

- (void).cxx_destruct
{
}

- (void)setBestFaceTimeQuery:(id)a3
{
}

- (CNPropertyBestIDSValueQuery)bestFaceTimeQuery
{
  return self->_bestFaceTimeQuery;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)queryComplete
{
  v3 = [(CNContactAction *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CNContactAction *)self delegate];
    [v5 actionDidUpdate:self];
  }
}

- (void)_queryFaceTimeStatus
{
  v3 = [CNPropertyBestIDSValueQuery alloc];
  char v4 = [(CNPropertyAction *)self propertyItems];
  id v5 = getIDSServiceNameFaceTime_30609();
  v6 = [(CNPropertyBestIDSValueQuery *)v3 initWithPropertyItems:v4 service:v5];
  [(CNPropertyFaceTimeAction *)self setBestFaceTimeQuery:v6];

  id v7 = [(CNPropertyFaceTimeAction *)self bestFaceTimeQuery];
  [v7 setDelegate:self];
}

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = [(CNPropertyFaceTimeAction *)self bestFaceTimeQuery];
  v6 = [v5 bestIDSProperty];

  if (!v6)
  {
    id v7 = [(CNPropertyAction *)self propertyItems];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      v9 = [(CNPropertyAction *)self propertyItems];
      v6 = [v9 objectAtIndexedSubscript:0];
    }
    else
    {
      v6 = 0;
    }
  }
  v10 = CNUILogContactCard();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_log_impl(&dword_18B625000, v10, OS_LOG_TYPE_DEFAULT, "[CNPropertyFaceTimeAction performActionForItem:sender:], bestFaceTimePropertyItem = %@", buf, 0xCu);
  }

  if (v6)
  {
    v11 = [v6 labeledValue];
    v12 = [v11 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      id v14 = [v12 stringValue];
      uint64_t v15 = 2;
    }
    else
    {
      id v14 = v12;
      uint64_t v15 = 3;
    }
    int64_t v16 = [(CNPropertyFaceTimeAction *)self type];
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F5A600]) initWithStringValue:v14 type:v15];
    v18 = (void *)MEMORY[0x1E4F1CB10];
    v19 = [(CNContactAction *)self contact];
    if (v16 == 1) {
      objc_msgSend(v18, "_cnui_faceTimeAudioURLWithHandle:contact:", v17, v19);
    }
    else {
    v20 = objc_msgSend(v18, "_cnui_faceTimeVideoURLWithHandle:contact:", v17, v19);
    }

    v21 = CNUILogContactCard();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v20;
      _os_log_impl(&dword_18B625000, v21, OS_LOG_TYPE_DEFAULT, "[CNPropertyFaceTimeAction performActionForItem:sender:], url = %@", buf, 0xCu);
    }

    if (v20)
    {
      v22 = +[CNUIDataCollector sharedCollector];
      uint64_t v28 = CNUIContactActionFaceTimeMediaType;
      uint64_t v23 = CNUIContactActionTypeFaceTime;
      if (v16 == 1) {
        v24 = &CNUIContactActionFaceTimeMediaTypeAudioOnly;
      }
      else {
        v24 = &CNUIContactActionFaceTimeMediaTypeVideo;
      }
      v25 = *v24;
      uint64_t v29 = CNUIContactActionDestinationType;
      v30[0] = v25;
      v26 = &CNUIContactActionDestinationTypePhoneNumber;
      if ((isKindOfClass & 1) == 0) {
        v26 = (uint64_t *)&CNUIContactActionDestinationTypeEmail;
      }
      v30[1] = *v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v28 count:2];
      objc_msgSend(v22, "logContactActionType:attributes:", v23, v27, v28, v29, v30[0]);

      [(id)*MEMORY[0x1E4FB2608] openURL:v20 withCompletionHandler:&__block_literal_global_30631];
    }
  }
}

void __56__CNPropertyFaceTimeAction_performActionForItem_sender___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = CNUILogContactCard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = @"failure";
    if (a2) {
      char v4 = @"success";
    }
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_DEFAULT, "[CNPropertyFaceTimeAction performActionForItem:sender:], UIApp openURL = %@", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)canPerformAction
{
  v2 = [(CNPropertyFaceTimeAction *)self bestFaceTimeQuery];
  v3 = [v2 bestIDSProperty];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)dealloc
{
  [(CNPropertyBestIDSValueQuery *)self->_bestFaceTimeQuery cancel];
  v3.receiver = self;
  v3.super_class = (Class)CNPropertyFaceTimeAction;
  [(CNPropertyFaceTimeAction *)&v3 dealloc];
}

- (CNPropertyFaceTimeAction)initWithContact:(id)a3 propertyItems:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CNPropertyFaceTimeAction;
  BOOL v4 = [(CNPropertyAction *)&v7 initWithContact:a3 propertyItems:a4];
  int v5 = v4;
  if (v4) {
    [(CNPropertyFaceTimeAction *)v4 performSelector:sel__queryFaceTimeStatus withObject:0 afterDelay:0.0];
  }
  return v5;
}

@end