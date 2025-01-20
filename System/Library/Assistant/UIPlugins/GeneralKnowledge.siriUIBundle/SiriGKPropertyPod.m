@interface SiriGKPropertyPod
- (SiriGKPropertyPod)initWithPropertyPod:(id)a3;
- (id)viewAtIndex:(int64_t)a3;
- (int64_t)keylineType;
- (int64_t)viewCount;
@end

@implementation SiriGKPropertyPod

- (SiriGKPropertyPod)initWithPropertyPod:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SiriGKPropertyPod;
  v5 = [(SiriGKPropertyPod *)&v20 init];
  if (v5)
  {
    v6 = [v4 propertyList];
    uint64_t v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    viewArray = v5->_viewArray;
    v5->_viewArray = (NSMutableArray *)v7;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v9 = objc_msgSend(v4, "propertyList", 0);
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [[SiriGKPropertyView alloc] initWithAnswerProperty:*(void *)(*((void *)&v16 + 1) + 8 * (void)v13)];
          if (v14) {
            [(NSMutableArray *)v5->_viewArray addObject:v14];
          }

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }
  }
  return v5;
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