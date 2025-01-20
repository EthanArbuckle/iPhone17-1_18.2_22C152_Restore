@interface INObjectWithTypedObject
@end

@implementation INObjectWithTypedObject

id ___INObjectWithTypedObject_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = _INObjectWithTypedObject(v3, *(void *)(a1 + 32));
    char v6 = 0;
    v7 = v3;
  }
  else
  {

    v7 = 0;
    v5 = 0;
    v4 = (void *)MEMORY[0x1E4F1C978];
    char v6 = 1;
  }
  v8 = objc_msgSend(v4, "if_arrayWithObjectIfNonNil:", v5);
  v9 = v8;
  if (!v8) {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v8;

  if ((v6 & 1) == 0) {
  return v10;
  }
}

@end