@interface IKDOMXPathResult
- (BOOL)BOOLeanValue;
- (BOOL)invalidIteratorState;
- (IKDOMNode)singleNodeValue;
- (IKDOMXPathResult)initWithAppContext:(id)a3 type:(int64_t)a4 nodes:(id)a5;
- (NSArray)nodes;
- (NSString)stringValue;
- (id)iterateNext;
- (id)snapshotItem:(int64_t)a3;
- (int64_t)numberValue;
- (int64_t)snapshotLength;
- (int64_t)type;
- (void)setNodes:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation IKDOMXPathResult

- (IKDOMXPathResult)initWithAppContext:(id)a3 type:(int64_t)a4 nodes:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)IKDOMXPathResult;
  v10 = [(IKJSObject *)&v25 initWithAppContext:v8];
  v11 = v10;
  if (v10)
  {
    v10->_type = a4;
    v20 = [v8 jsContext];
    v12 = [v20 virtualMachine];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v21 + 1) + 8 * v17) managedSelf];
          [v12 addManagedReference:v18 withOwner:v11];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v15);
    }

    objc_storeStrong((id *)&v11->_nodes, a5);
  }

  return v11;
}

- (int64_t)numberValue
{
  v3 = [(IKJSObject *)self appContext];
  v4 = [(IKJSObject *)self appContext];
  v5 = +[IKDOMXPathException exceptionWithAppContext:v4 code:52];
  [v3 setException:v5 withErrorMessage:@"Operation not supported"];

  return 0;
}

- (NSString)stringValue
{
  v3 = [(IKJSObject *)self appContext];
  v4 = [(IKJSObject *)self appContext];
  v5 = +[IKDOMXPathException exceptionWithAppContext:v4 code:52];
  [v3 setException:v5 withErrorMessage:@"Operation not supported"];

  return 0;
}

- (BOOL)BOOLeanValue
{
  v3 = [(IKJSObject *)self appContext];
  v4 = [(IKJSObject *)self appContext];
  v5 = +[IKDOMXPathException exceptionWithAppContext:v4 code:52];
  [v3 setException:v5 withErrorMessage:@"Operation not supported"];

  return 0;
}

- (IKDOMNode)singleNodeValue
{
  if ([(IKDOMXPathResult *)self type] == 9 || [(IKDOMXPathResult *)self type] == 8)
  {
    v3 = [(IKDOMXPathResult *)self nodes];
    v4 = [v3 firstObject];
  }
  else
  {
    v3 = [(IKJSObject *)self appContext];
    v5 = [(IKJSObject *)self appContext];
    v6 = +[IKDOMXPathException exceptionWithAppContext:v5 code:52];
    [v3 setException:v6 withErrorMessage:@"Operation not supported"];

    v4 = 0;
  }

  return (IKDOMNode *)v4;
}

- (BOOL)invalidIteratorState
{
  return 0;
}

- (int64_t)snapshotLength
{
  if ([(IKDOMXPathResult *)self type] == 7)
  {
    v3 = [(IKDOMXPathResult *)self nodes];
    int64_t v4 = [v3 count];
  }
  else
  {
    v3 = [(IKJSObject *)self appContext];
    v5 = [(IKJSObject *)self appContext];
    v6 = +[IKDOMXPathException exceptionWithAppContext:v5 code:52];
    [v3 setException:v6 withErrorMessage:@"Operation not supported"];

    int64_t v4 = 0;
  }

  return v4;
}

- (id)iterateNext
{
  v3 = [(IKJSObject *)self appContext];
  int64_t v4 = [(IKJSObject *)self appContext];
  v5 = +[IKDOMXPathException exceptionWithAppContext:v4 code:52];
  [v3 setException:v5 withErrorMessage:@"Operation not supported"];

  return 0;
}

- (id)snapshotItem:(int64_t)a3
{
  if ([(IKDOMXPathResult *)self type] != 7)
  {
    v7 = [(IKJSObject *)self appContext];
    id v9 = [(IKJSObject *)self appContext];
    v10 = +[IKDOMXPathException exceptionWithAppContext:v9 code:52];
    [v7 setException:v10 withErrorMessage:@"Operation not supported"];

    id v8 = 0;
    goto LABEL_6;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v5 = [(IKDOMXPathResult *)self nodes];
    unint64_t v6 = [v5 count];

    if (v6 > a3)
    {
      v7 = [(IKDOMXPathResult *)self nodes];
      id v8 = [v7 objectAtIndex:a3];
LABEL_6:

      goto LABEL_8;
    }
  }
  id v8 = 0;
LABEL_8:
  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end