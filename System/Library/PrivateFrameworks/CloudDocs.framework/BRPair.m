@interface BRPair
+ (id)pairWithLeft:(id)a3 andRight:(id)a4;
- (BOOL)isEqual:(id)a3;
- (id)left;
- (id)right;
- (unint64_t)hash;
@end

@implementation BRPair

+ (id)pairWithLeft:(id)a3 andRight:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(BRPair);
  id left = v7->_left;
  v7->_id left = v5;
  id v9 = v5;

  id right = v7->_right;
  v7->_id right = v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BRPair *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t left = (unint64_t)self->_left;
      if (left | (unint64_t)v5->_left && !objc_msgSend((id)left, "isEqual:"))
      {
        char v8 = 0;
      }
      else
      {
        unint64_t right = (unint64_t)self->_right;
        if (right | (unint64_t)v5->_right) {
          char v8 = objc_msgSend((id)right, "isEqual:");
        }
        else {
          char v8 = 1;
        }
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_left hash];
  return [self->_right hash] ^ v3;
}

- (id)left
{
  return self->_left;
}

- (id)right
{
  return self->_right;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_right, 0);

  objc_storeStrong(&self->_left, 0);
}

@end