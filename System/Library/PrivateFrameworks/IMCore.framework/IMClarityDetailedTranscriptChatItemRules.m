@interface IMClarityDetailedTranscriptChatItemRules
- (BOOL)_shouldAppendDateForItem:(id)a3 previousItem:(id)a4;
- (id)chatItemForIMChatItem:(id)a3;
@end

@implementation IMClarityDetailedTranscriptChatItemRules

- (id)chatItemForIMChatItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IMClarityDetailedTranscriptChatItemRules;
    id v5 = [(IMClarityTranscriptChatItemRules *)&v8 chatItemForIMChatItem:v4];
  }
  v6 = v5;

  return v6;
}

- (BOOL)_shouldAppendDateForItem:(id)a3 previousItem:(id)a4
{
  if (a4)
  {
    id v16 = a3;
    objc_super v8 = objc_msgSend_time(a4, v5, v6, v7);
    v12 = objc_msgSend_time(v16, v9, v10, v11);

    LOBYTE(v16) = 1;
    if (v8 && v12)
    {
      v17 = objc_msgSend_currentCalendar(MEMORY[0x1E4F1C9A8], v13, v14, v15);
      v19 = objc_msgSend_components_fromDate_(v17, v18, 30, (uint64_t)v8);
      v21 = objc_msgSend_components_fromDate_(v17, v20, 30, (uint64_t)v12);
      LODWORD(v16) = objc_msgSend_isEqual_(v19, v22, (uint64_t)v21, v23) ^ 1;
    }
  }
  else
  {
    LOBYTE(v16) = 1;
  }
  return (char)v16;
}

@end