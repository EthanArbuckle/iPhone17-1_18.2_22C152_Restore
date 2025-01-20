@interface HMDStructuredDataFoundationWriter
- (HMDStructuredDataFoundationWriter)init;
- (HMDStructuredDataFoundationWriter)initWithMutableContainers:(BOOL)a3;
- (void)_emit:(void *)a1;
- (void)_pop;
- (void)_push;
- (void)beginArrayOfSize:(unint64_t)a3;
- (void)beginDictionaryOfSize:(unint64_t)a3;
- (void)emitRootValue:(id)a3;
- (void)endArray;
- (void)endDictionary;
- (void)failWithError:(id)a3;
- (void)writeBoolean:(BOOL)a3;
- (void)writeData:(id)a3;
- (void)writeDate:(id)a3;
- (void)writeDictionaryKey:(id)a3;
- (void)writeLogicalValue:(id)a3 validateAndCopy:(BOOL)a4;
- (void)writeNull;
- (void)writeNumber:(id)a3;
- (void)writeString:(id)a3;
- (void)writeUUID:(id)a3;
@end

@implementation HMDStructuredDataFoundationWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_currentKey, 0);
  objc_storeStrong(&self->_container, 0);
}

- (void)emitRootValue:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)writeLogicalValue:(id)a3 validateAndCopy:(BOOL)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMDStructuredDataFoundationWriter;
    [(HMDStructuredWriter *)&v10 writeLogicalValue:v6 validateAndCopy:1];
LABEL_5:

    return;
  }
  if (v6)
  {
    -[HMDStructuredDataFoundationWriter _emit:](self, v6);
    goto LABEL_5;
  }
  v8 = (void *)_HMFPreconditionFailure();
  -[HMDStructuredDataFoundationWriter _emit:](v8, v9);
}

- (void)_emit:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)a1[2];
    id v6 = v3;
    if (v4)
    {
      if (a1[3])
      {
        objc_msgSend(v4, "setValue:forKey:", v3);
        v5 = (void *)a1[3];
        a1[3] = 0;
      }
      else
      {
        [v4 addObject:v3];
      }
    }
    else
    {
      if (!a1[4]) {
        goto LABEL_9;
      }
      [a1 emitRootValue:v3];
    }
    id v3 = v6;
  }
LABEL_9:
}

- (void)writeUUID:(id)a3
{
}

- (void)writeDate:(id)a3
{
}

- (void)writeData:(id)a3
{
}

- (void)writeNumber:(id)a3
{
}

- (void)writeString:(id)a3
{
}

- (void)writeBoolean:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[HMDStructuredDataFoundationWriter _emit:](self, v4);
}

- (void)writeNull
{
  id v3 = [MEMORY[0x263EFF9D0] null];
  -[HMDStructuredDataFoundationWriter _emit:](self, v3);
}

- (void)endDictionary
{
  id v5 = self->_container;
  -[HMDStructuredDataFoundationWriter _pop]((uint64_t)self);
  if (self->_mutableContainers)
  {
    id v3 = v5;
  }
  else
  {
    uint64_t v4 = [v5 copy];

    id v3 = (void *)v4;
  }
  id v6 = v3;
  -[HMDStructuredDataFoundationWriter _emit:](self, v3);
}

- (void)_pop
{
  if (a1)
  {
    if ([*(id *)(a1 + 32) count])
    {
      id v2 = [*(id *)(a1 + 32) lastObject];
      id v3 = v2;
      if ((id)*MEMORY[0x263EFFD08] == v2) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = v2;
      }
      id v5 = v4;

      id v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      [*(id *)(a1 + 32) removeLastObject];
      uint64_t v7 = [*(id *)(a1 + 32) lastObject];
      v8 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v7;

      v9 = *(void **)(a1 + 32);
      [v9 removeLastObject];
    }
    else
    {
      objc_super v10 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;

      v11 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;
    }
  }
}

- (void)writeDictionaryKey:(id)a3
{
}

- (void)beginDictionaryOfSize:(unint64_t)a3
{
  if (self && self->_stack)
  {
    -[HMDStructuredDataFoundationWriter _push]((uint64_t)self);
    if (a3 == -1) {
      id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    else {
      id v5 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:a3];
    }
    id v6 = v5;
    objc_storeStrong(&self->_container, v5);
  }
}

- (void)_push
{
  if (*(void *)(a1 + 16))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
    id v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 24);
    if (!v4) {
      uint64_t v4 = (void *)*MEMORY[0x263EFFD08];
    }
    id v5 = v4;
    [v3 addObject:v5];

    id v6 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

- (void)endArray
{
  id v5 = self->_container;
  -[HMDStructuredDataFoundationWriter _pop]((uint64_t)self);
  if (self->_mutableContainers)
  {
    id v3 = v5;
  }
  else
  {
    uint64_t v4 = [v5 copy];

    id v3 = (void *)v4;
  }
  id v6 = v3;
  -[HMDStructuredDataFoundationWriter _emit:](self, v3);
}

- (void)beginArrayOfSize:(unint64_t)a3
{
  if (self && self->_stack)
  {
    -[HMDStructuredDataFoundationWriter _push]((uint64_t)self);
    if (a3 == -1) {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    else {
      id v5 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
    }
    id v6 = v5;
    objc_storeStrong(&self->_container, v5);
  }
}

- (void)failWithError:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDStructuredDataFoundationWriter;
  [(HMDStructuredWriter *)&v7 failWithError:a3];
  id container = self->_container;
  self->_id container = 0;

  currentKey = self->_currentKey;
  self->_currentKey = 0;

  stack = self->_stack;
  self->_stack = 0;
}

- (HMDStructuredDataFoundationWriter)initWithMutableContainers:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMDStructuredDataFoundationWriter;
  uint64_t v4 = [(HMDStructuredDataFoundationWriter *)&v8 init];
  if (v4)
  {
    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    stack = v4->_stack;
    v4->_stack = v5;

    v4->_mutableContainers = a3;
  }
  return v4;
}

- (HMDStructuredDataFoundationWriter)init
{
  return [(HMDStructuredDataFoundationWriter *)self initWithMutableContainers:0];
}

@end