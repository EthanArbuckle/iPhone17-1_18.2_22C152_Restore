@interface DASDisplayInfo
- (NSOrderedSet)attachedContexts;
- (NSString)name;
- (NSString)raw;
- (id)_initWithName:(id)a3 attachedContexts:(id)a4 raw:(id)a5;
- (id)description;
@end

@implementation DASDisplayInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_raw, 0);
  objc_storeStrong((id *)&self->_attachedContexts, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)raw
{
  return self->_raw;
}

- (NSOrderedSet)attachedContexts
{
  return self->_attachedContexts;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  [v3 appendString:self->_name withName:@"name"];
  v4 = [(NSOrderedSet *)self->_attachedContexts array];
  v5 = objc_msgSend(v4, "bs_map:", &stru_1000103C8);
  v6 = [v5 componentsJoinedByString:@", "];
  [v3 appendString:v6 withName:@"attachedContexts"];

  v7 = [v3 build];

  return v7;
}

- (id)_initWithName:(id)a3 attachedContexts:(id)a4 raw:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DASDisplayInfo;
  v11 = [(DASDisplayInfo *)&v19 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    name = v11->_name;
    v11->_name = v12;

    v14 = (NSOrderedSet *)[v9 copy];
    attachedContexts = v11->_attachedContexts;
    v11->_attachedContexts = v14;

    v16 = (NSString *)[v10 copy];
    raw = v11->_raw;
    v11->_raw = v16;
  }
  return v11;
}

@end