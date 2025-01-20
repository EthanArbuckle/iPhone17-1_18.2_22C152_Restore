@interface _UIKeyboardArbiterDebugEntryString
+ (id)entryWithMessage:(id)a3 type:(id)a4;
- (int)importance;
- (void)enumerateContents:(id)a3;
@end

@implementation _UIKeyboardArbiterDebugEntryString

+ (id)entryWithMessage:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (id *)objc_alloc_init((Class)a1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 2, a3);
    objc_storeStrong(v10 + 3, a4);
  }

  return v10;
}

- (int)importance
{
  return 1;
}

- (void)enumerateContents:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  v13[0] = @"Type";
  v13[1] = @"Message";
  message = self->_message;
  v14[0] = self->_type;
  v14[1] = message;
  v5 = NSDictionary;
  v6 = (void (**)(id, id))a3;
  id v7 = [v5 dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v8 = (void *)[v7 mutableCopy];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56___UIKeyboardArbiterDebugEntryString_enumerateContents___block_invoke;
  v11[3] = &unk_264721918;
  id v12 = v8;
  v10.receiver = self;
  v10.super_class = (Class)_UIKeyboardArbiterDebugEntryString;
  id v9 = v8;
  [(_UIKeyboardArbiterDebugEntry *)&v10 enumerateContents:v11];
  v6[2](v6, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end