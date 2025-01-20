@interface NSMapObservationTransformer
- (NSMapObservationTransformer)initWithBlock:(id)a3 tag:(int)a4;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
@end

@implementation NSMapObservationTransformer

- (NSMapObservationTransformer)initWithBlock:(id)a3 tag:(int)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSMapObservationTransformer;
  v6 = [(NSMapObservationTransformer *)&v8 init];
  if (v6)
  {
    v6->_block = (id)[a3 copy];
    v6->_tag = a4;
  }
  return v6;
}

- (void)_receiveBox:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v10 = 0;
  int tag = self->_tag;
  if (*((_DWORD *)a3 + 6) == tag && tag != 3)
  {
    uint64_t v7 = (*((uint64_t (**)(void))self->_block + 2))();
    int v8 = *((_DWORD *)a3 + 6);
    if (v8 == 2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [a3 setError:v7];
        goto LABEL_11;
      }
      int v8 = *((_DWORD *)a3 + 6);
    }
    if (v8 == 1) {
      [a3 setValue:v7];
    }
  }
LABEL_11:
  v9.receiver = self;
  v9.super_class = (Class)NSMapObservationTransformer;
  [(NSMapObservationTransformer *)&v9 _receiveBox:a3];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSMapObservationTransformer;
  [(NSObservationSource *)&v3 dealloc];
}

@end