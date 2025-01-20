@interface _HFDeletableTransformItem
- (BOOL)hf_canDeleteItem;
- (id)hf_deleteItem;
@end

@implementation _HFDeletableTransformItem

- (BOOL)hf_canDeleteItem
{
  v2 = [(HFTransformItem *)self sourceItem];
  if ([v2 conformsToProtocol:&unk_26C124E28]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  char v5 = objc_msgSend(v4, "hf_canDeleteItem");
  return v5;
}

- (id)hf_deleteItem
{
  v2 = [(HFTransformItem *)self sourceItem];
  v3 = &unk_26C124E28;
  id v4 = v2;
  char v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:v3]) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    v7 = v5;
    if (v6) {
      goto LABEL_8;
    }
    v8 = [MEMORY[0x263F08690] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v10 = NSStringFromProtocol((Protocol *)v3);
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v10 file lineNumber description];
  }
  v7 = 0;
LABEL_8:

  v11 = objc_msgSend(v7, "hf_deleteItem");

  return v11;
}

@end