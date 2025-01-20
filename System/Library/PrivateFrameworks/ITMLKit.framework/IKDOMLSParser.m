@interface IKDOMLSParser
+ (id)_dataFromInput:(id)a3;
- (id)parse:(id)a3;
- (id)parseWithContext:(id)a3 :(id)a4 :(int64_t)a5;
- (int64_t)appendAsChildrenAction;
- (int64_t)insertAfterAction;
- (int64_t)insertBeforeAction;
- (int64_t)replaceAction;
- (int64_t)replaceChildrenAction;
@end

@implementation IKDOMLSParser

- (id)parse:(id)a3
{
  id v4 = a3;
  v5 = [v4 stringData];
  if (v5)
  {
  }
  else
  {
    v6 = [v4 byteStream];

    if (!v6)
    {
      v10 = @"Input not specified";
      goto LABEL_8;
    }
  }
  v7 = [IKDOMDocument alloc];
  v8 = [(IKJSObject *)self appContext];
  id v15 = 0;
  v6 = [(IKDOMDocument *)v7 initWithAppContext:v8 input:v4 error:&v15];
  id v9 = v15;

  if (v9)
  {
    v10 = [v9 description];
  }
  else
  {
    v10 = 0;
  }

LABEL_8:
  if ([(__CFString *)v10 length])
  {
    v11 = [(IKJSObject *)self appContext];
    v12 = [(IKJSObject *)self appContext];
    v13 = +[IKDOMLSException exceptionWithAppContext:v12 code:81];
    [v11 setException:v13 withErrorMessage:v10];
  }
  return v6;
}

- (id)parseWithContext:(id)a3 :(id)a4 :(int64_t)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 parentNode];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();
  if (!v9) {
    goto LABEL_10;
  }
  char v13 = v12;
  if (![v9 nodePtr]) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v14 = a5 != 2;
  }
  else
  {
    objc_opt_class();
    char v42 = objc_opt_isKindOfClass();
    BOOL v14 = a5 != 2;
    if ((v42 & 1) == 0)
    {
LABEL_10:
      id v15 = [(IKJSObject *)self appContext];
      v16 = [(IKJSObject *)self appContext];
      v17 = +[IKDOMException exceptionWithAppContext:v16 code:3];
      v18 = NSString;
      v19 = [v9 nodeName];
      v20 = [v18 stringWithFormat:@"Invalid action: %ld on node: %@", a5, v19];
      [v15 setException:v17 withErrorMessage:v20];

      v21 = 0;
      goto LABEL_11;
    }
  }
  if ((v14 & isKindOfClass & 1) != 0 || (unint64_t)(a5 - 3) <= 0xFFFFFFFFFFFFFFFDLL && v13 & 1 | (v10 == 0)) {
    goto LABEL_10;
  }
  uint64_t v23 = [(id)objc_opt_class() _dataFromInput:v8];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [v9 ownerDocument];
    v26 = (xmlDoc *)[v25 nodePtr];
    xmlNodePtr lst = 0;
    v27 = xmlNewDocNode(v26, 0, (const xmlChar *)"fake", 0);
    xmlSetGenericErrorFunc((void *)*MEMORY[0x1E4F143C8], MEMORY[0x1E4F14830]);
    id v28 = v24;
    if (xmlParseInNodeContext(v27, (const char *)[v28 bytes], objc_msgSend(v28, "length"), 4096, &lst) == XML_ERR_INVALID_CHAR)
    {
      v29 = [v8 stringData];

      if (v29)
      {
        v30 = [v8 stringData];
        objc_msgSend(v30, "ik_stringByTrimmingControlChars");
        v31 = v64 = v26;
        uint64_t v32 = [v31 dataUsingEncoding:4];
        v33 = v28;
        v34 = v27;
        v35 = v25;
        v36 = (void *)v32;

        v26 = v64;
        v37 = v36;
        v25 = v35;
        v27 = v34;
        id v28 = v37;
        xmlParseInNodeContext(v27, (const char *)[v28 bytes], objc_msgSend(v28, "length"), 4096, &lst);
      }
    }
    xmlSetGenericErrorFunc(0, 0);
    if (xmlGetLastError())
    {
      uint64_t v38 = [(IKJSObject *)self appContext];
      v39 = [(IKJSObject *)self appContext];
      v40 = (void *)v38;
      v41 = +[IKDOMLSException exceptionWithAppContext:v39 code:81];
      [v40 setException:v41 withErrorMessage:@"XML parse failure"];
      v21 = 0;
    }
    else
    {
      id v63 = v28;
      v65 = v25;
      for (xmlNodePtr i = xmlNewDocFragment(v26); ; xmlAddChild(i, v47))
      {
        v47 = lst;
        if (!lst) {
          break;
        }
        xmlNodePtr lst = lst->next;
        xmlUnlinkNode(v47);
      }
      IKXMLStripSpaces((uint64_t)i);
      v48 = [(IKJSObject *)self appContext];
      uint64_t v62 = +[IKDOMNode nodeWithAppContext:v48 nodePtr:i];

      if (i->children)
      {
        v49 = [(IKJSObject *)self appContext];
        v21 = +[IKDOMNode nodeWithAppContext:v49 nodePtr:i->children];
      }
      else
      {
        v21 = 0;
      }
      int64_t v50 = a5 - 1;
      if ((unint64_t)(a5 - 1) >= 2) {
        v51 = v10;
      }
      else {
        v51 = v9;
      }
      id v52 = v51;
      v39 = v52;
      v25 = v65;
      switch(v50)
      {
        case 0:
          uint64_t v53 = 0;
          v40 = (void *)v62;
          uint64_t v54 = v62;
          id v55 = 0;
          goto LABEL_47;
        case 1:
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          v56 = [v52 childNodesAsArray];
          uint64_t v57 = [v56 countByEnumeratingWithState:&v66 objects:v71 count:16];
          if (v57)
          {
            uint64_t v58 = v57;
            uint64_t v59 = *(void *)v67;
            do
            {
              for (uint64_t j = 0; j != v58; ++j)
              {
                if (*(void *)v67 != v59) {
                  objc_enumerationMutation(v56);
                }
                id v61 = (id)[v39 performDOMOperation:2 newNode:0 refNode:*(void *)(*((void *)&v66 + 1) + 8 * j)];
              }
              uint64_t v58 = [v56 countByEnumeratingWithState:&v66 objects:v71 count:16];
            }
            while (v58);
          }

          v40 = (void *)v62;
          v41 = [v39 performDOMOperation:0 newNode:v62 refNode:0];
          id v28 = v63;
          v25 = v65;
          break;
        case 2:
          uint64_t v53 = 1;
          goto LABEL_46;
        case 3:
          uint64_t v53 = 0;
          goto LABEL_46;
        case 4:
          uint64_t v53 = 2;
LABEL_46:
          v40 = (void *)v62;
          uint64_t v54 = v62;
          id v55 = v9;
LABEL_47:
          v41 = [v52 performDOMOperation:v53 newNode:v54 refNode:v55];
          break;
        default:
          v41 = 0;
          v40 = (void *)v62;
          break;
      }
      [v39 childrenUpdatedWithUpdatedChildNodes:v41 notify:1];
    }

    xmlSetTreeDoc(v27, 0);
    xmlFreeNode(v27);
  }
  else
  {
    v43 = [(IKJSObject *)self appContext];
    v44 = [(IKJSObject *)self appContext];
    v45 = +[IKDOMLSException exceptionWithAppContext:v44 code:81];
    [v43 setException:v45 withErrorMessage:@"Input not specified"];

    v21 = 0;
    id v28 = 0;
  }

LABEL_11:
  return v21;
}

- (int64_t)appendAsChildrenAction
{
  return 1;
}

- (int64_t)replaceChildrenAction
{
  return 2;
}

- (int64_t)insertBeforeAction
{
  return 3;
}

- (int64_t)insertAfterAction
{
  return 4;
}

- (int64_t)replaceAction
{
  return 5;
}

+ (id)_dataFromInput:(id)a3
{
  id v3 = a3;
  id v4 = [v3 byteStream];

  if (v4)
  {
    v5 = [v3 byteStream];
  }
  else
  {
    v5 = [v3 stringData];

    if (v5)
    {
      v6 = [v3 stringData];
      v5 = [v6 dataUsingEncoding:4];
    }
  }

  return v5;
}

@end