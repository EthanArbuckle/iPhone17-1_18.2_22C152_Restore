@interface PKMathVariable
+ (id)variablesForTokens:(void *)a3 item:;
@end

@implementation PKMathVariable

+ (id)variablesForTokens:(void *)a3 item:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  v29 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
        if ([v11 type] == 1)
        {
          v12 = [v5 expression];
          uint64_t v13 = [v11 characterRange];
          if (v13 + v14 <= (unint64_t)[v12 length])
          {
            uint64_t v16 = [v11 characterRange];
            v15 = objc_msgSend(v12, "substringWithRange:", v16, v17);
            uint64_t v18 = objc_opt_new();
            [v15 doubleValue];
            if (v18) {
              *(void *)(v18 + 24) = v19;
            }
            v20 = [MEMORY[0x1E4F29128] UUID];
            v21 = v20;
            if (v18)
            {
              objc_storeStrong((id *)(v18 + 8), v20);

              *(void *)(v18 + 40) = [v11 characterRange];
              *(void *)(v18 + 48) = v22;
            }
            else
            {

              [v11 characterRange];
            }
            uint64_t v23 = [v11 characterRange];
            v25 = [(PKMathRecognitionItem *)(uint64_t)v5 _strokeIndexesForCharacterRange:v24];
            if (v18) {
              objc_storeStrong((id *)(v18 + 32), v25);
            }

            [v29 addObject:v18];
          }
          else
          {
            v15 = os_log_create("com.apple.pencilkit", "Math");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "Invalid character range detected for token", buf, 2u);
            }
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v26 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
      uint64_t v8 = v26;
    }
    while (v26);
  }

  v27 = (void *)[v29 copy];

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIndexes, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end