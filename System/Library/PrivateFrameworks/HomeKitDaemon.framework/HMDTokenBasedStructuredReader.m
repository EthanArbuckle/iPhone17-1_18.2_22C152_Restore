@interface HMDTokenBasedStructuredReader
- (BOOL)readBoolean;
- (_HMDStructuredDataToken)nextTokenAfterToken:(const _HMDStructuredDataToken *)a3;
- (_HMDStructuredDataToken)readToken;
- (id)_consumeTokenOfType:(uint64_t)a1;
- (id)error;
- (id)readData;
- (id)readDate;
- (id)readDictionaryKey;
- (id)readNumber;
- (id)readString;
- (id)readUUID;
- (int64_t)tokenType;
- (uint64_t)_consumeToken;
- (unint64_t)beginArray;
- (unint64_t)beginDictionary;
- (void)_bufferInitialTokenIfNecessary;
- (void)endArray;
- (void)endDictionary;
- (void)failWithError:(id)a3;
- (void)readNull;
- (void)skipToken;
@end

@implementation HMDTokenBasedStructuredReader

- (void).cxx_destruct
{
}

- (_HMDStructuredDataToken)nextTokenAfterToken:(const _HMDStructuredDataToken *)a3
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = NSString;
  v6 = NSStringFromSelector(a2);
  v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)skipToken
{
  -[HMDTokenBasedStructuredReader _bufferInitialTokenIfNecessary](self);
  -[HMDTokenBasedStructuredReader _consumeToken]((uint64_t *)self);
}

- (void)_bufferInitialTokenIfNecessary
{
  if (result)
  {
    v1 = result + 1;
    if (!result[1])
    {
      void *v1 = [result nextTokenAfterToken:0];
      v1[1] = v2;
      return (void *)MEMORY[0x270F9A790]();
    }
  }
  return result;
}

- (uint64_t)_consumeToken
{
  if (result)
  {
    v1 = result + 1;
    if (result[1] >= 1)
    {
      void *v1 = [result nextTokenAfterToken:result + 1];
      v1[1] = v2;
      return (uint64_t *)MEMORY[0x270F9A790]();
    }
  }
  return result;
}

- (_HMDStructuredDataToken)readToken
{
  -[HMDTokenBasedStructuredReader _bufferInitialTokenIfNecessary](self);
  int64_t type = self->_token.type;
  id v4 = self->_token.value;
  -[HMDTokenBasedStructuredReader _consumeToken]((uint64_t *)self);
  int64_t v5 = type;
  v6 = v4;
  result.value = v6;
  result.int64_t type = v5;
  return result;
}

- (id)readUUID
{
  return -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 12);
}

- (id)_consumeTokenOfType:(uint64_t)a1
{
  if (a1)
  {
    -[HMDTokenBasedStructuredReader _bufferInitialTokenIfNecessary]((void *)a1);
    uint64_t v4 = *(void *)(a1 + 8);
    if (v4 == a2)
    {
      id v5 = *(id *)(a1 + 16);
      -[HMDTokenBasedStructuredReader _consumeToken]((uint64_t *)a1);
      goto LABEL_4;
    }
    if (v4 != -2)
    {
      v7 = HMDStructuredDataTokenTypeAsString(a2);
      id v8 = HMDStructuredDataTokenTypeAsString(*(void *)(a1 + 8));
      [(id)a1 failWithReason:@"Expected <%@> but found <%@>", v7, v8];
    }
  }
  id v5 = 0;
LABEL_4:
  return v5;
}

- (id)readDate
{
  return -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 11);
}

- (id)readData
{
  return -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 10);
}

- (id)readNumber
{
  return -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 9);
}

- (id)readString
{
  return -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 8);
}

- (BOOL)readBoolean
{
  uint64_t v2 = -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 7);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)readNull
{
  id v2 = -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 6);
}

- (void)endDictionary
{
  id v2 = -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 4);
}

- (id)readDictionaryKey
{
  return -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 5);
}

- (unint64_t)beginDictionary
{
  id v2 = -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 3);
  char v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (void)endArray
{
  id v2 = -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 2);
}

- (unint64_t)beginArray
{
  id v2 = -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 1);
  char v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (void)failWithError:(id)a3
{
  id v4 = a3;
  p_token = &self->_token;
  if (p_token->type != -2)
  {
    v6 = v4;
    id v7 = v4;
    if (!v4)
    {
      v6 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
    }
    p_token->int64_t type = -2;
    objc_storeStrong(&p_token->value, v6);
    id v4 = v7;
    if (!v7)
    {

      id v4 = 0;
    }
  }
}

- (id)error
{
  if (self->_token.type == -2) {
    return self->_token.value;
  }
  else {
    return 0;
  }
}

- (int64_t)tokenType
{
  return self->_token.type;
}

@end