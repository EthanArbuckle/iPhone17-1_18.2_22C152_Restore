@interface CAFASCTreeNode
+ (id)nodeType:(unsigned __int8)a3 withName:(id)a4;
+ (id)nodeType:(unsigned __int8)a3 withString:(id)a4;
+ (id)nodeType:(unsigned __int8)a3 withType:(id)a4;
- (NSArray)registeredValues;
- (NSDictionary)children;
- (NSString)name;
- (NSString)type;
- (id)_childNodeMatchingType:(id)a3;
- (id)description;
- (id)treeLogLinesIndent:(unint64_t)a3;
- (void)setChildren:(id)a3;
- (void)setName:(id)a3;
- (void)setRegisteredValues:(id)a3;
- (void)setType:(id)a3;
@end

@implementation CAFASCTreeNode

+ (id)nodeType:(unsigned __int8)a3 withType:(id)a4
{
  int v4 = a3;
  id v5 = a4;
  v6 = objc_opt_new();
  [v6 setType:v5];
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      v7 = +[CAFServiceTypes serviceNameByType];
    }
    else
    {
      if (v4) {
        goto LABEL_11;
      }
      v7 = +[CAFAccessoryTypes accessoryNameByType];
    }
    v8 = v7;
    v9 = [v7 objectForKeyedSubscript:v5];
    goto LABEL_9;
  }
  v8 = +[CAFCharacteristicTypes characteristicNameByType];
  v9 = [v8 objectForKeyedSubscript:v5];
  if (v9)
  {
LABEL_9:
    [v6 setName:v9];
    goto LABEL_10;
  }
  v10 = +[CAFControlTypes controlNameByType];
  v11 = [v10 objectForKeyedSubscript:v5];
  [v6 setName:v11];

LABEL_10:
LABEL_11:
  v12 = [v6 name];
  if (v12)
  {
  }
  else if ([v5 isEqualToString:@"*"])
  {
    [v6 setName:v5];
  }
  id v13 = [v6 name];

  if (v13) {
    id v13 = v6;
  }

  return v13;
}

+ (id)nodeType:(unsigned __int8)a3 withName:(id)a4
{
  int v4 = a3;
  id v5 = a4;
  v6 = objc_opt_new();
  [v6 setName:v5];
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      v7 = +[CAFServiceTypes serviceTypeByName];
    }
    else
    {
      if (v4) {
        goto LABEL_11;
      }
      v7 = +[CAFAccessoryTypes accessoryTypeByName];
    }
    v8 = v7;
    v9 = [v7 objectForKeyedSubscript:v5];
    goto LABEL_9;
  }
  v8 = +[CAFCharacteristicTypes characteristicTypeByName];
  v9 = [v8 objectForKeyedSubscript:v5];
  if (v9)
  {
LABEL_9:
    [v6 setType:v9];
    goto LABEL_10;
  }
  v10 = +[CAFControlTypes controlTypeByName];
  v11 = [v10 objectForKeyedSubscript:v5];
  [v6 setType:v11];

LABEL_10:
LABEL_11:
  id v12 = [v6 type];

  if (v12) {
    id v12 = v6;
  }

  return v12;
}

+ (id)nodeType:(unsigned __int8)a3 withString:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = [a1 nodeType:v4 withType:v6];
  if (!v7)
  {
    v7 = [a1 nodeType:v4 withName:v6];
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CAFASCTreeNode *)self name];
  id v6 = [(CAFASCTreeNode *)self type];
  v7 = [(CAFASCTreeNode *)self children];
  v8 = [v3 stringWithFormat:@"<%@: %p name=%@ type=%@> %@", v4, self, v5, v6, v7];

  return v8;
}

- (id)treeLogLinesIndent:(unint64_t)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v5 = objc_opt_new();
  if (a3)
  {
    unint64_t v6 = a3;
    do
    {
      [v5 appendString:@"\t"];
      --v6;
    }
    while (v6);
  }
  v7 = NSString;
  v8 = [(CAFASCTreeNode *)self name];
  v9 = [(CAFASCTreeNode *)self type];
  v10 = [v7 stringWithFormat:@"%@ %@ %@", v5, v8, v9];
  v27[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  id v12 = (void *)[v11 mutableCopy];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = [(CAFASCTreeNode *)self children];
  v14 = [v13 allValues];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    unint64_t v18 = a3 + 1;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        v20 = [*(id *)(*((void *)&v22 + 1) + 8 * i) treeLogLinesIndent:v18];
        [v12 addObjectsFromArray:v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  return v12;
}

- (id)_childNodeMatchingType:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__2;
  long long v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2;
  unint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  children = self->_children;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__CAFASCTreeNode__childNodeMatchingType___block_invoke;
  v10[3] = &unk_265264A80;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v14;
  id v13 = &v20;
  [(NSDictionary *)children enumerateKeysAndObjectsUsingBlock:v10];
  v7 = (void *)v15[5];
  if (!v7) {
    v7 = (void *)v21[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __41__CAFASCTreeNode__childNodeMatchingType___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if ([v8 isEqualToString:a1[4]])
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    *a4 = 1;
  }
  if ([v8 isEqualToString:@"*"]) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (NSArray)registeredValues
{
  return self->_registeredValues;
}

- (void)setRegisteredValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredValues, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end