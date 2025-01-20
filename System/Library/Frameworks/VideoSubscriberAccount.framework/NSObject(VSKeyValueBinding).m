@interface NSObject(VSKeyValueBinding)
- (id)vs_valueForBinding:()VSKeyValueBinding;
- (void)vs_bind:()VSKeyValueBinding toObject:withKeyPath:options:;
- (void)vs_setValue:()VSKeyValueBinding forBinding:;
- (void)vs_unbind:()VSKeyValueBinding;
@end

@implementation NSObject(VSKeyValueBinding)

- (void)vs_bind:()VSKeyValueBinding toObject:withKeyPath:options:
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v16)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The binding parameter must not be nil."];
    if (v10)
    {
LABEL_3:
      if (v11) {
        goto LABEL_4;
      }
LABEL_10:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The keyPath parameter must not be nil."];
      if (v12) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The observable parameter must not be nil."];
  if (!v11) {
    goto LABEL_10;
  }
LABEL_4:
  if (v12) {
    goto LABEL_5;
  }
LABEL_11:
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The options parameter must not be nil."];
LABEL_5:
  v13 = (void *)MEMORY[0x1E0173AA0]();
  v14 = objc_msgSend(a1, "vs_binderCreatingIfNeeded:", 1);
  v15 = [[VSBindingInfo alloc] initWithObservedObject:v10 keyPath:v11 options:v12];
  [v14 establishBinding:v16 withInfo:v15];
}

- (void)vs_unbind:()VSKeyValueBinding
{
  id v4 = a3;
  id v7 = v4;
  if (!v4) {
    id v4 = (id)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The binding parameter must not be nil."];
  }
  v5 = (void *)MEMORY[0x1E0173AA0](v4);
  v6 = objc_msgSend(a1, "vs_binderCreatingIfNeeded:", 0);
  [v6 tearDownBinding:v7];
}

- (id)vs_valueForBinding:()VSKeyValueBinding
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    id v4 = (id)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The binding parameter must not be nil."];
  }
  v6 = (void *)MEMORY[0x1E0173AA0](v4);
  id v7 = objc_msgSend(a1, "vs_binderCreatingIfNeeded:", 0);
  v8 = [v7 valueForBinding:v5];

  return v8;
}

- (void)vs_setValue:()VSKeyValueBinding forBinding:
{
  id v10 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v6) {
    id v6 = (id)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The binding parameter must not be nil."];
  }
  v8 = (void *)MEMORY[0x1E0173AA0](v6);
  v9 = objc_msgSend(a1, "vs_binderCreatingIfNeeded:", 0);
  [v9 setValue:v10 forBinding:v7];
}

@end