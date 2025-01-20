@interface SiriGKWebLinkPod
- (SiriGKWebLinkPod)initWithPod:(id)a3 safariBackURL:(id)a4;
- (id)viewAtIndex:(int64_t)a3;
- (int64_t)keylineType;
- (int64_t)viewCount;
@end

@implementation SiriGKWebLinkPod

- (SiriGKWebLinkPod)initWithPod:(id)a3 safariBackURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SiriGKWebLinkPod;
  v8 = [(SiriGKWebLinkPod *)&v23 init];
  if (v8)
  {
    v9 = [v6 links];
    uint64_t v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
    viewArray = v8->_viewArray;
    v8->_viewArray = (NSMutableArray *)v10;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v12 = objc_msgSend(v6, "links", 0);
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [[SiriGKWebLinkView alloc] initWithLinkedAnswer:*(void *)(*((void *)&v19 + 1) + 8 * (void)v16) safariBackURL:v7];
          [(NSMutableArray *)v8->_viewArray addObject:v17];

          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v14);
    }
  }
  return v8;
}

- (int64_t)viewCount
{
  return (int64_t)[(NSMutableArray *)self->_viewArray count];
}

- (id)viewAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_viewArray objectAtIndexedSubscript:a3];
}

- (int64_t)keylineType
{
  return 1;
}

- (void).cxx_destruct
{
}

@end