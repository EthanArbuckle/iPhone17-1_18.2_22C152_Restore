@interface AKAppleIDObjectModelFieldExtractor
- (AKAppleIDObjectModelFieldExtractor)initWithObjectModel:(id)a3;
- (id)_valueForFieldWithID:(id)a3 inObjectModel:(id)a4;
- (id)_valueForTextFieldFromPage:(id)a3 rowID:(id)a4;
- (id)valueForFieldWithID:(id)a3;
@end

@implementation AKAppleIDObjectModelFieldExtractor

- (AKAppleIDObjectModelFieldExtractor)initWithObjectModel:(id)a3
{
  id v5 = a3;
  v6 = [(AKAppleIDObjectModelFieldExtractor *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_objectModel, a3);
  }

  return v7;
}

- (id)valueForFieldWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AKAppleIDObjectModelFieldExtractor *)self _valueForFieldWithID:v4 inObjectModel:self->_objectModel];
    if (!v5)
    {
      v6 = [(RUIObjectModel *)self->_objectModel serverInfo];
      id v5 = [v6 objectForKeyedSubscript:v4];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_valueForFieldWithID:(id)a3 inObjectModel:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_1C38C1000, v8, OS_LOG_TYPE_DEFAULT, "Extracting value for row: %@", (uint8_t *)&v20, 0xCu);
  }

  v9 = [v7 displayedPages];

  v10 = [v9 lastObject];

  if ([v10 hasTableView])
  {
    v11 = [(AKAppleIDObjectModelFieldExtractor *)self _valueForTextFieldFromPage:v10 rowID:v6];
  }
  else
  {
    v12 = [v10 passcodeViewOM];
    if (!v12) {
      goto LABEL_10;
    }
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDObjectModelFieldExtractor _valueForFieldWithID:inObjectModel:](v12, v13);
    }

    v14 = [v12 attributes];
    v15 = [v14 objectForKeyedSubscript:@"id"];
    int v16 = [v15 isEqual:v6];

    if (v16)
    {
      v17 = [v12 passcodeField];
      v18 = [v17 stringValue];
      v11 = (void *)[v18 copy];
    }
    else
    {
LABEL_10:
      v11 = 0;
    }
  }

  return v11;
}

- (id)_valueForTextFieldFromPage:(id)a3 rowID:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 tableViewOM];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v8 = [v7 sections];
  uint64_t v29 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (!v29)
  {
    v9 = 0;
LABEL_25:
    uint64_t v22 = 0;
    goto LABEL_26;
  }
  v25 = v7;
  id v26 = v5;
  v9 = 0;
  uint64_t v27 = *(void *)v36;
  v28 = v8;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v36 != v27) {
        objc_enumerationMutation(v8);
      }
      uint64_t v30 = v10;
      v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v12 = objc_msgSend(v11, "rows", v25, v26);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            v18 = [v17 attributes];
            v19 = [v18 objectForKeyedSubscript:@"id"];
            int v20 = [v19 isEqual:v6];

            if (v20)
            {
              id v21 = v17;

              v9 = v21;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v14);
      }

      uint64_t v10 = v30 + 1;
      v8 = v28;
    }
    while (v30 + 1 != v29);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v35 objects:v40 count:16];
  }
  while (v29);

  if (!v9)
  {
    uint64_t v22 = 0;
    id v7 = v25;
    id v5 = v26;
    goto LABEL_27;
  }
  v8 = [v9 control];
  objc_opt_class();
  id v7 = v25;
  id v5 = v26;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDObjectModelFieldExtractor _valueForTextFieldFromPage:rowID:]((uint64_t)v6, v23);
    }

    goto LABEL_25;
  }
  uint64_t v22 = [v8 text];
LABEL_26:

LABEL_27:

  return v22;
}

- (void).cxx_destruct
{
}

- (void)_valueForFieldWithID:(void *)a1 inObjectModel:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [a1 attributes];
  id v4 = [v3 objectForKeyedSubscript:@"id"];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Passcode view with ID %@ found", (uint8_t *)&v5, 0xCu);
}

- (void)_valueForTextFieldFromPage:(uint64_t)a1 rowID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_ERROR, "BuddyML contained row with ID %{public}@ but it did not contain a text field.", (uint8_t *)&v2, 0xCu);
}

@end