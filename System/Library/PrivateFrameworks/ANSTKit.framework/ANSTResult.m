@interface ANSTResult
+ (id)new;
- (ANSTResult)init;
- (id)_init;
@end

@implementation ANSTResult

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTResult)init
{
  id result = (ANSTResult *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)ANSTResult;
  return [(ANSTResult *)&v3 init];
}

@end