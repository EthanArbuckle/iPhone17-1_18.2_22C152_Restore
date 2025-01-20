@interface EDSearchableIndexDiagnosticsSnapshot
- (BOOL)turboMode;
- (EDSearchableIndexDiagnosticsSnapshot)initWithDate:(id)a3 indexableMessages:(id)a4 messagesIndexed:(id)a5 turboMode:(BOOL)a6;
- (EDSearchableIndexDiagnosticsSnapshot)initWithDictionary:(id)a3;
- (NSDate)date;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)indexableMessages;
- (NSNumber)messagesIndexed;
- (void)setDate:(id)a3;
- (void)setIndexableMessages:(id)a3;
- (void)setMessagesIndexed:(id)a3;
- (void)setTurboMode:(BOOL)a3;
@end

@implementation EDSearchableIndexDiagnosticsSnapshot

- (EDSearchableIndexDiagnosticsSnapshot)initWithDate:(id)a3 indexableMessages:(id)a4 messagesIndexed:(id)a5 turboMode:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EDSearchableIndexDiagnosticsSnapshot;
  v14 = [(EDSearchableIndexDiagnosticsSnapshot *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_date, a3);
    objc_storeStrong((id *)&v15->_indexableMessages, a4);
    objc_storeStrong((id *)&v15->_messagesIndexed, a5);
    v15->_turboMode = a6;
  }

  return v15;
}

- (EDSearchableIndexDiagnosticsSnapshot)initWithDictionary:(id)a3
{
  v19 = self;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v4 = [v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    v21 = 0;
    v22 = 0;
    v20 = 0;
    char v6 = 0;
    uint64_t v7 = *(void *)v24;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", @"Date", v19)
          && ([v3 objectForKeyedSubscript:v9],
              v10 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char v11 = objc_opt_isKindOfClass(),
              v10,
              (v11 & 1) != 0))
        {
          [v3 objectForKeyedSubscript:v9];
          v22 = id v12 = v22;
        }
        else if ([v9 isEqualToString:@"MessagesIndexed"] {
               && ([v3 objectForKeyedSubscript:v9],
        }
                   id v13 = objc_claimAutoreleasedReturnValue(),
                   objc_opt_class(),
                   char v14 = objc_opt_isKindOfClass(),
                   v13,
                   (v14 & 1) != 0))
        {
          [v3 objectForKeyedSubscript:v9];
          v21 = id v12 = v21;
        }
        else if ([v9 isEqualToString:@"IndexableMessages"] {
               && ([v3 objectForKeyedSubscript:v9],
        }
                   v15 = objc_claimAutoreleasedReturnValue(),
                   objc_opt_class(),
                   char isKindOfClass = objc_opt_isKindOfClass(),
                   v15,
                   (isKindOfClass & 1) != 0))
        {
          [v3 objectForKeyedSubscript:v9];
          v20 = id v12 = v20;
        }
        else
        {
          if (![v9 isEqualToString:@"Turbo"]) {
            continue;
          }
          id v12 = [v3 objectForKeyedSubscript:v9];
          char v6 = [v12 BOOLValue];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v5) {
        goto LABEL_22;
      }
    }
  }
  v21 = 0;
  v22 = 0;
  v20 = 0;
  char v6 = 0;
LABEL_22:

  objc_super v17 = 0;
  if (v22 && v21 && v20)
  {
    objc_super v17 = [(EDSearchableIndexDiagnosticsSnapshot *)v19 initWithDate:v22 indexableMessages:v20 messagesIndexed:v21 turboMode:v6 & 1];
    v19 = v17;
  }

  return v17;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(EDSearchableIndexDiagnosticsSnapshot *)self date];
  [v3 setObject:v4 forKeyedSubscript:@"Date"];

  uint64_t v5 = [(EDSearchableIndexDiagnosticsSnapshot *)self indexableMessages];
  [v3 setObject:v5 forKeyedSubscript:@"IndexableMessages"];

  char v6 = [(EDSearchableIndexDiagnosticsSnapshot *)self messagesIndexed];
  [v3 setObject:v6 forKeyedSubscript:@"MessagesIndexed"];

  if ([(EDSearchableIndexDiagnosticsSnapshot *)self turboMode])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[EDSearchableIndexDiagnosticsSnapshot turboMode](self, "turboMode"));
    [v3 setObject:v7 forKeyedSubscript:@"Turbo"];
  }

  return (NSDictionary *)v3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSNumber)indexableMessages
{
  return self->_indexableMessages;
}

- (void)setIndexableMessages:(id)a3
{
}

- (NSNumber)messagesIndexed
{
  return self->_messagesIndexed;
}

- (void)setMessagesIndexed:(id)a3
{
}

- (BOOL)turboMode
{
  return self->_turboMode;
}

- (void)setTurboMode:(BOOL)a3
{
  self->_turboMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesIndexed, 0);
  objc_storeStrong((id *)&self->_indexableMessages, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end