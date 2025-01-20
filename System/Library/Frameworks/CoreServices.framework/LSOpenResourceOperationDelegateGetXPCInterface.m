@interface LSOpenResourceOperationDelegateGetXPCInterface
@end

@implementation LSOpenResourceOperationDelegateGetXPCInterface

void ___LSOpenResourceOperationDelegateGetXPCInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ECB5ABB0];
  v1 = (void *)_LSOpenResourceOperationDelegateGetXPCInterface::result;
  _LSOpenResourceOperationDelegateGetXPCInterface::result = v0;

  v2 = (void *)_LSOpenResourceOperationDelegateGetXPCInterface::result;
  if (_LSOpenResourceOperationDelegateGetXPCInterface::result) {
    goto LABEL_2;
  }
  v5 = [MEMORY[0x1E4F28B00] currentHandler];
  v6 = [NSString stringWithUTF8String:"NSXPCInterface *_LSOpenResourceOperationDelegateGetXPCInterface()_block_invoke"];
  [v5 handleFailureInFunction:v6 file:@"LSOpenOperation.mm" lineNumber:131 description:@"Failed to create XPC interface object."];

  v2 = (void *)_LSOpenResourceOperationDelegateGetXPCInterface::result;
  if (_LSOpenResourceOperationDelegateGetXPCInterface::result)
  {
LABEL_2:
    [v2 setClass:objc_opt_class() forSelector:sel_openResourceOperation_didFinishCopyingResource_ argumentIndex:0 ofReply:0];
    v3 = (void *)_LSOpenResourceOperationDelegateGetXPCInterface::result;
    uint64_t v4 = objc_opt_class();
    [v3 setClass:v4 forSelector:sel_openResourceOperation_didFinishCopyingResource_ argumentIndex:1 ofReply:0];
  }
}

@end