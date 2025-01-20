@interface _CNCacheFixedCapacityBoundingStrategy
- (BOOL)shouldEvictKey:(id)a3;
- (CNQueue)keys;
- (NSString)description;
- (_CNCacheFixedCapacityBoundingStrategy)init;
- (_CNCacheFixedCapacityBoundingStrategy)initWithCapacity:(unint64_t)a3;
- (unint64_t)capacity;
- (void)willUpdateCacheBy:(unint64_t)a3 forKey:(id)a4 keysToEvict:(id *)a5;
@end

@implementation _CNCacheFixedCapacityBoundingStrategy

- (void)willUpdateCacheBy:(unint64_t)a3 forKey:(id)a4 keysToEvict:(id *)a5
{
  id v16 = a4;
  v8 = [(_CNCacheFixedCapacityBoundingStrategy *)self keys];
  [v8 dequeueObject:v16];

  if (a3 == 1)
  {
    v9 = [(_CNCacheFixedCapacityBoundingStrategy *)self keys];
    [v9 enqueue:v16];
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while (1)
  {
    v11 = [(_CNCacheFixedCapacityBoundingStrategy *)self keys];
    unint64_t v12 = [v11 count];
    unint64_t v13 = [(_CNCacheFixedCapacityBoundingStrategy *)self capacity];

    if (v12 <= v13) {
      break;
    }
    v14 = [(_CNCacheFixedCapacityBoundingStrategy *)self keys];
    v15 = [v14 dequeue];
    [v10 addObject:v15];
  }
  *a5 = (id)[v10 copy];
}

- (CNQueue)keys
{
  return self->_keys;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (BOOL)shouldEvictKey:(id)a3
{
  return 0;
}

- (_CNCacheFixedCapacityBoundingStrategy)initWithCapacity:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_CNCacheFixedCapacityBoundingStrategy;
  v4 = [(_CNCacheFixedCapacityBoundingStrategy *)&v9 init];
  if (v4)
  {
    v5 = objc_alloc_init(CNQueue);
    keys = v4->_keys;
    v4->_keys = v5;

    v4->_capacity = a3;
    v7 = v4;
  }

  return v4;
}

- (_CNCacheFixedCapacityBoundingStrategy)init
{
  return [(_CNCacheFixedCapacityBoundingStrategy *)self initWithCapacity:100];
}

- (NSString)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"capacity" unsignedInteger:self->_capacity];
  v5 = [v3 build];

  return (NSString *)v5;
}

- (void).cxx_destruct
{
}

@end