@interface NSFilterObservationTransformer
+ (id)filterWithBlock:(id)a3;
- (NSFilterObservationTransformer)initWithBlock:(id)a3;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
@end

@implementation NSFilterObservationTransformer

+ (id)filterWithBlock:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithBlock:a3];

  return v3;
}

- (void)_receiveBox:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*((_DWORD *)a3 + 6) != 1 || (*((unsigned int (**)(void))self->_predicate + 2))())
  {
    v5.receiver = self;
    v5.super_class = (Class)NSFilterObservationTransformer;
    [(NSFilterObservationTransformer *)&v5 _receiveBox:a3];
  }
}

- (NSFilterObservationTransformer)initWithBlock:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSFilterObservationTransformer;
  v4 = [(NSFilterObservationTransformer *)&v6 init];
  if (v4) {
    v4->_predicate = (id)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFilterObservationTransformer;
  [(NSObservationSource *)&v3 dealloc];
}

@end