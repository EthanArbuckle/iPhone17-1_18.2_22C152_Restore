@interface NSDictionaryMap
+ (id)map;
+ (id)mapWithDictionary:(id)a3;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)containsValueWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSDictionaryMap)init;
- (NSDictionaryMap)initWithDictionary:(id)a3;
- (id)entrySet;
- (id)getWithId:(id)a3;
- (id)keySet;
- (id)putWithId:(id)a3 withId:(id)a4;
- (id)removeWithId:(id)a3;
- (id)values;
- (int)size;
- (unint64_t)hash;
- (void)clear;
- (void)dealloc;
- (void)putAllWithJavaUtilMap:(id)a3;
@end

@implementation NSDictionaryMap

- (NSDictionaryMap)init
{
  v4.receiver = self;
  v4.super_class = (Class)NSDictionaryMap;
  v2 = [(NSDictionaryMap *)&v4 init];
  if (v2) {
    v2->dictionary_ = (NSMutableDictionary *)+[NSMutableDictionary dictionary];
  }
  return v2;
}

+ (id)map
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSDictionaryMap;
  [(NSDictionaryMap *)&v3 dealloc];
}

- (NSDictionaryMap)initWithDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSDictionaryMap;
  objc_super v4 = [(NSDictionaryMap *)&v7 init];
  if (v4)
  {
    if (a3) {
      v5 = (NSMutableDictionary *)[a3 mutableCopy];
    }
    else {
      v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    v4->dictionary_ = v5;
  }
  return v4;
}

+ (id)mapWithDictionary:(id)a3
{
  id v3 = [objc_alloc((Class)objc_opt_class()) initWithDictionary:a3];
  return v3;
}

- (void)clear
{
}

- (BOOL)containsKeyWithId:(id)a3
{
  return [(NSMutableDictionary *)self->dictionary_ objectForKey:a3] != 0;
}

- (BOOL)containsValueWithId:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->dictionary_ allValues];
  return [v4 containsObject:a3];
}

- (id)entrySet
{
  id v3 = objc_alloc_init(JavaUtilLinkedHashSet);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  dictionary = self->dictionary_;
  id v5 = [(NSMutableDictionary *)dictionary countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(dictionary);
        }
        [(JavaUtilHashSet *)v3 addWithId:[[NSDictionaryMap_Entry alloc] initWithDictionary:self->dictionary_ key:*(void *)(*((void *)&v10 + 1) + 8 * i)]];
      }
      id v6 = [(NSMutableDictionary *)dictionary countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3 || ![a3 conformsToProtocol:&OBJC_PROTOCOL___JavaUtilMap]) {
    return 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dictionary = self->dictionary_;
    uint64_t v6 = *((void *)a3 + 1);
    return [(NSMutableDictionary *)dictionary isEqualToDictionary:v6];
  }
  else
  {
    id v7 = [(NSDictionaryMap *)self entrySet];
    id v8 = [a3 entrySet];
    return [v7 isEqual:v8];
  }
}

- (id)getWithId:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  dictionary = self->dictionary_;
  return -[NSMutableDictionary objectForKey:](dictionary, "objectForKey:");
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableDictionary *)self->dictionary_ hash];
}

- (BOOL)isEmpty
{
  return [(NSMutableDictionary *)self->dictionary_ count] == 0;
}

- (id)keySet
{
  id v3 = objc_alloc_init(JavaUtilLinkedHashSet);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  dictionary = self->dictionary_;
  id v5 = [(NSMutableDictionary *)dictionary countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(dictionary);
        }
        [(JavaUtilHashSet *)v3 addWithId:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableDictionary *)dictionary countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)putWithId:(id)a3 withId:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v7 = -[NSMutableDictionary objectForKey:](self->dictionary_, "objectForKey:");
  [(NSMutableDictionary *)self->dictionary_ setObject:a4 forKey:a3];
  return v7;
}

- (void)putAllWithJavaUtilMap:(id)a3
{
  if (!a3) {
    goto LABEL_7;
  }
  id v5 = objc_msgSend(objc_msgSend(a3, "keySet"), "iterator");
  if (!v5) {
    goto LABEL_7;
  }
  id v6 = v5;
  if ([v5 hasNext])
  {
    while (1)
    {
      id v7 = [v6 next];
      if (!v7) {
        break;
      }
      -[NSMutableDictionary setObject:forKey:](self->dictionary_, "setObject:forKey:", [a3 getWithId:v7], v7);
      if (([v6 hasNext] & 1) == 0) {
        return;
      }
    }
LABEL_7:
    JreThrowNullPointerException();
  }
}

- (id)removeWithId:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = -[NSMutableDictionary objectForKey:](self->dictionary_, "objectForKey:");
  [(NSMutableDictionary *)self->dictionary_ removeObjectForKey:a3];
  return v5;
}

- (int)size
{
  return [(NSMutableDictionary *)self->dictionary_ count];
}

- (id)values
{
  id v3 = objc_alloc_init(JavaUtilLinkedList);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  dictionary = self->dictionary_;
  id v5 = [(NSMutableDictionary *)dictionary countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(dictionary);
        }
        [(JavaUtilLinkedList *)v3 addWithId:[(NSMutableDictionary *)self->dictionary_ objectForKey:*(void *)(*((void *)&v10 + 1) + 8 * i)]];
      }
      id v6 = [(NSMutableDictionary *)dictionary countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

@end