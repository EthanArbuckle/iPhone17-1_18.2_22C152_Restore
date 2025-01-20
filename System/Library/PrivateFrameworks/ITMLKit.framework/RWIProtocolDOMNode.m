@interface RWIProtocolDOMNode
@end

@implementation RWIProtocolDOMNode

__CFString *__86__RWIProtocolDOMNode_IKJSInspector__ik_updateWithDOMNode_fullfillChildren_dispatcher___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = NSString;
    uint64_t v4 = [v2 nodeId];
LABEL_5:
    objc_msgSend(v3, "stringWithFormat:", @"%i", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = NSString;
    uint64_t v4 = [v2 ITMLID];
    goto LABEL_5;
  }
  v5 = &stru_1F3E09950;
LABEL_7:

  return v5;
}

@end