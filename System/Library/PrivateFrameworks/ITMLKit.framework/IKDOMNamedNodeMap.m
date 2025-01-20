@interface IKDOMNamedNodeMap
- (id)getNamedItem:(id)a3;
- (id)setNamedItem:(id)a3;
@end

@implementation IKDOMNamedNodeMap

- (id)getNamedItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(IKDOMNodeList *)self _updateNodes];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(IKDOMNodeList *)self nodes];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 nodeName];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)setNamedItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 nodeName];
  id v6 = [(IKDOMNamedNodeMap *)self getNamedItem:v5];

  uint64_t v7 = [(IKDOMNodeList *)self contextNode];
  v8 = (xmlNode *)[v7 nodePtr];

  id v9 = [v4 nodeName];
  v10 = (const xmlChar *)[v9 UTF8String];

  int v11 = [v4 nodeValue];

  id v12 = v11;
  long long v13 = (const xmlChar *)[v12 UTF8String];

  if (v6) {
    xmlSetProp(v8, v10, v13);
  }
  else {
    xmlNewProp(v8, v10, v13);
  }
  return v6;
}

@end