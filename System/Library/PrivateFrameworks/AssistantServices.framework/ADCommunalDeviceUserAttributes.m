@interface ADCommunalDeviceUserAttributes
+ (id)saCopy:(id)a3;
- (ADCommunalDeviceUserAttributes)initWithAttribute:(unint64_t)a3;
- (id)attributes;
- (void)addAttribute:(unint64_t)a3;
- (void)deleteAttribute:(unint64_t)a3;
@end

@implementation ADCommunalDeviceUserAttributes

- (void).cxx_destruct
{
}

- (id)attributes
{
  id v2 = [(NSMutableArray *)self->_attributes copy];
  return v2;
}

- (void)deleteAttribute:(unint64_t)a3
{
  attributes = self->_attributes;
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableArray *)attributes removeObject:v4];
}

- (void)addAttribute:(unint64_t)a3
{
  attributes = self->_attributes;
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableArray *)attributes addObject:v4];
}

- (ADCommunalDeviceUserAttributes)initWithAttribute:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ADCommunalDeviceUserAttributes;
  id v4 = [(ADCommunalDeviceUserAttributes *)&v10 init];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    attributes = v4->_attributes;
    v4->_attributes = v5;

    v7 = v4->_attributes;
    v8 = +[NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableArray *)v7 addObject:v8];
  }
  return v4;
}

+ (id)saCopy:(id)a3
{
  if (a3)
  {
    v3 = [a3 attributes];
    id v4 = objc_alloc_init((Class)NSMutableArray);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      uint64_t v9 = SAHomeMemberInfoAttributeOWNERValue;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "integerValue", (void)v14)) {
            [v4 addObject:v9];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    if ([v4 count]) {
      v11 = v4;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;
  }
  else
  {
    uint64_t v19 = SAHomeMemberInfoAttributeUNKNOWNValue;
    id v12 = +[NSArray arrayWithObjects:&v19 count:1];
  }
  return v12;
}

@end