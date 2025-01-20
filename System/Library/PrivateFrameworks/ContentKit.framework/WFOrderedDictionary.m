@interface WFOrderedDictionary
+ (BOOL)supportsSecureCoding;
- (NSDictionary)dictionary;
- (NSOrderedSet)keys;
- (WFOrderedDictionary)init;
- (WFOrderedDictionary)initWithCoder:(id)a3;
- (WFOrderedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (WFOrderedDictionary)initWithQueryItems:(id)a3;
- (id)allKeys;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFOrderedDictionary

- (WFOrderedDictionary)initWithQueryItems:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WFOrderedDictionary+URLQueryItems.m", 17, @"Invalid parameter not satisfying: %@", @"queryItems" object file lineNumber description];
  }
  v6 = objc_msgSend(v5, "if_map:", &__block_literal_global_22607);
  v7 = objc_msgSend(v5, "if_map:", &__block_literal_global_9);
  v8 = [(WFOrderedDictionary *)self initWithObjects:v7 forKeys:v6];

  return v8;
}

__CFString *__57__WFOrderedDictionary_URLQueryItems__initWithQueryItems___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  v3 = v2;
  if (!v2) {
    v2 = &stru_26C71CE08;
  }
  v4 = v2;

  return v4;
}

uint64_t __57__WFOrderedDictionary_URLQueryItems__initWithQueryItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSOrderedSet)keys
{
  return self->_keys;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOrderedDictionary *)self keys];
  [v4 encodeObject:v5 forKey:@"keys"];

  id v6 = [(WFOrderedDictionary *)self allValues];
  [v4 encodeObject:v6 forKey:@"objects"];
}

- (WFOrderedDictionary)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allowedClasses];
  id v6 = [v5 setByAddingObject:objc_opt_class()];
  v7 = [v5 setByAddingObject:objc_opt_class()];
  v8 = [v4 decodeObjectOfClasses:v6 forKey:@"keys"];
  v9 = [v4 decodeObjectOfClasses:v7 forKey:@"objects"];

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10
    || (v18.receiver = self,
        v18.super_class = (Class)WFOrderedDictionary,
        v11 = [(WFOrderedDictionary *)&v18 init],
        (self = v11) == 0))
  {
    v16 = 0;
  }
  else
  {
    objc_storeStrong((id *)&v11->_keys, v8);
    id v12 = objc_alloc(NSDictionary);
    v13 = [v8 array];
    v14 = (NSDictionary *)[v12 initWithObjects:v9 forKeys:v13];
    dictionary = self->_dictionary;
    self->_dictionary = v14;

    self = self;
    v16 = self;
  }

  return v16;
}

- (id)allKeys
{
  v2 = [(WFOrderedDictionary *)self keys];
  v3 = [v2 array];

  return v3;
}

- (WFOrderedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)WFOrderedDictionary;
  v8 = [(WFOrderedDictionary *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF9D8]) initWithObjects:a4 count:a5];
    keys = v8->_keys;
    v8->_keys = (NSOrderedSet *)v9;

    uint64_t v11 = [objc_alloc(NSDictionary) initWithObjects:a3 forKeys:a4 count:a5];
    dictionary = v8->_dictionary;
    v8->_dictionary = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

- (WFOrderedDictionary)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFOrderedDictionary;
  v2 = [(WFOrderedDictionary *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    keys = v2->_keys;
    v2->_keys = (NSOrderedSet *)v3;

    uint64_t v5 = objc_opt_new();
    dictionary = v2->_dictionary;
    v2->_dictionary = (NSDictionary *)v5;

    v7 = v2;
  }

  return v2;
}

- (id)keyEnumerator
{
  v2 = [(WFOrderedDictionary *)self keys];
  uint64_t v3 = [v2 objectEnumerator];

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFOrderedDictionary *)self dictionary];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (unint64_t)count
{
  v2 = [(WFOrderedDictionary *)self dictionary];
  unint64_t v3 = [v2 count];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end