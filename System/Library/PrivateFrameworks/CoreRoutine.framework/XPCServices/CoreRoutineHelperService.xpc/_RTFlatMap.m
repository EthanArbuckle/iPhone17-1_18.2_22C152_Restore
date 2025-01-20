@interface _RTFlatMap
- (_RTFlatMap)initWithInput:(id)a3;
- (id)withBlock:(id)a3;
@end

@implementation _RTFlatMap

- (_RTFlatMap)initWithInput:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_RTFlatMap;
  v6 = [(_RTFlatMap *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_input, a3);
  }

  return v7;
}

- (id)withBlock:(id)a3
{
  v4 = (void (**)(id, void))a3;
  id v5 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_input count]];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_input;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        if (v11) {
          objc_msgSend(v5, "addObjectsFromArray:", v11, (void)v13);
        }
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end