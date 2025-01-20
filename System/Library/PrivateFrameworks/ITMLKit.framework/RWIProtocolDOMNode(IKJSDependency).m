@interface RWIProtocolDOMNode(IKJSDependency)
+ (id)safe_initWithNodeId:()IKJSDependency nodeType:nodeName:localName:nodeValue:;
@end

@implementation RWIProtocolDOMNode(IKJSDependency)

+ (id)safe_initWithNodeId:()IKJSDependency nodeType:nodeName:localName:nodeValue:
{
  v17[5] = *MEMORY[0x1E4F143B8];
  int v15 = a4;
  int v16 = a3;
  id v14 = a5;
  id v13 = a6;
  id v12 = a7;
  v17[0] = &v16;
  v17[1] = &v15;
  v17[2] = &v14;
  v17[3] = &v13;
  v17[4] = &v12;
  id v9 = objc_alloc(MEMORY[0x1E4FB6C80]);
  v10 = objc_msgSend(v9, "ik_initWithSelectorString:arguments:", @"initWithNodeId:nodeType:nodeName:localName:nodeValue:", v17);

  return v10;
}

@end