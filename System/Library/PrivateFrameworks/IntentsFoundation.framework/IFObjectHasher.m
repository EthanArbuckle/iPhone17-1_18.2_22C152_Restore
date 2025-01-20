@interface IFObjectHasher
- (id).cxx_construct;
- (id)combine:(id)a3;
- (id)combineBool:(BOOL)a3;
- (id)combineBytes:(void *)a3 size:(unint64_t)a4;
- (id)combineContentsOfPropertyListObject:(id)a3;
- (id)combineInteger:(unint64_t)a3;
- (unint64_t)finalize;
@end

@implementation IFObjectHasher

- (id).cxx_construct
{
  *((void *)self + 1) = 0x400000002;
  strcpy((char *)self + 16, "uespemosmodnarodarenegylsetybdet");
  *((unsigned char *)self + 49) = 0;
  *((_WORD *)self + 25) = 0;
  *((_DWORD *)self + 13) = 0;
  return self;
}

- (id)combine:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  id v6 = [(IFObjectHasher *)self combineContentsOfPropertyListObject:v5];

  return self;
}

- (id)combineContentsOfPropertyListObject:(id)a3
{
  return self;
}

- (unint64_t)finalize
{
  if (self->_finalized) {
    return self->_hash;
  }
  unint64_t value = self->_hasher._buffer.value;
  unint64_t v4 = self->_hasher._v3 ^ value;
  self->_hasher._v3 = v4;
  int c = self->_hasher._c;
  if (c <= 0)
  {
    unint64_t v6 = self->_hasher._v1;
    unint64_t v8 = self->_hasher._v2;
    unint64_t v7 = self->_hasher._v0;
  }
  else
  {
    unint64_t v7 = self->_hasher._v0;
    unint64_t v6 = self->_hasher._v1;
    unint64_t v8 = self->_hasher._v2;
    do
    {
      unint64_t v9 = v7 + v6;
      unint64_t v10 = v9 ^ __ROR8__(v6, 51);
      unint64_t v11 = v8 + v4;
      uint64_t v12 = __ROR8__(v4, 48);
      unint64_t v7 = (v11 ^ v12) + __ROR8__(v9, 32);
      unint64_t v4 = v7 ^ __ROR8__(v11 ^ v12, 43);
      unint64_t v13 = v11 + v10;
      unint64_t v6 = v13 ^ __ROR8__(v10, 47);
      unint64_t v8 = __ROR8__(v13, 32);
      --c;
    }
    while (c);
    self->_hasher._v1 = v6;
    self->_hasher._v3 = v4;
  }
  unint64_t v14 = v7 ^ value;
  self->_hasher._v0 = v14;
  unint64_t v15 = v8 ^ 0xFF;
  self->_hasher._unint64_t v2 = v8 ^ 0xFF;
  int d = self->_hasher._d;
  if (d >= 1)
  {
    do
    {
      unint64_t v17 = v14 + v6;
      unint64_t v18 = v17 ^ __ROR8__(v6, 51);
      unint64_t v19 = v15 + v4;
      uint64_t v20 = __ROR8__(v4, 48);
      unint64_t v14 = (v19 ^ v20) + __ROR8__(v17, 32);
      unint64_t v4 = v14 ^ __ROR8__(v19 ^ v20, 43);
      unint64_t v21 = v19 + v18;
      unint64_t v6 = v21 ^ __ROR8__(v18, 47);
      unint64_t v15 = __ROR8__(v21, 32);
      --d;
    }
    while (d);
    self->_hasher._v0 = v14;
    self->_hasher._v1 = v6;
    self->_hasher._unint64_t v2 = v15;
    self->_hasher._v3 = v4;
  }
  unint64_t v2 = v6 ^ v4 ^ v14 ^ v15;
  self->_hash = v2;
  self->_finalizeint d = 1;
  return v2;
}

- (id)combineBytes:(void *)a3 size:(unint64_t)a4
{
  if ((uint64_t)a4 >= 1)
  {
    unint64_t v4 = (char *)a3 + a4;
    unint64_t v5 = *((void *)self + 6);
    do
    {
      unint64_t v6 = v4 - (unsigned char *)a3;
      if (v4 - (unsigned char *)a3 >= 8) {
        unint64_t v6 = 8;
      }
      if (v6 > 7)
      {
        unint64_t v7 = *(void *)a3;
      }
      else
      {
        unint64_t v7 = 0;
        switch(v6)
        {
          case 1uLL:
            goto LABEL_13;
          case 2uLL:
            goto LABEL_12;
          case 3uLL:
            goto LABEL_11;
          case 4uLL:
            goto LABEL_10;
          case 5uLL:
            goto LABEL_9;
          case 6uLL:
            goto LABEL_8;
          case 7uLL:
            unint64_t v7 = (unint64_t)*((unsigned __int8 *)a3 + 6) << 48;
LABEL_8:
            v7 |= (unint64_t)*((unsigned __int8 *)a3 + 5) << 40;
LABEL_9:
            v7 |= (unint64_t)*((unsigned __int8 *)a3 + 4) << 32;
LABEL_10:
            v7 |= (unint64_t)*((unsigned __int8 *)a3 + 3) << 24;
LABEL_11:
            v7 |= (unint64_t)*((unsigned __int8 *)a3 + 2) << 16;
LABEL_12:
            v7 |= (unint64_t)*((unsigned __int8 *)a3 + 1) << 8;
LABEL_13:
            v7 |= *(unsigned __int8 *)a3;
            break;
          default:
            break;
        }
      }
      uint64_t v8 = HIBYTE(v5) & 7;
      char v9 = 8 * v8;
      unint64_t v10 = v8 + v6;
      if (v8 + v6 <= 7)
      {
        unint64_t v5 = ((v7 << v9) | v5) + (v6 << 56);
        *((void *)self + 6) = v5;
      }
      else
      {
        uint64_t v11 = (v7 << v9) | v5 & 0xFFFFFFFFFFFFFFLL;
        unint64_t v12 = HIBYTE(v5) + v6;
        unint64_t v13 = v7 >> -v9;
        if (v10 == 8) {
          unint64_t v13 = 0;
        }
        unint64_t v5 = v13 | (v12 << 56);
        uint64_t v14 = *((void *)self + 5) ^ v11;
        *((void *)self + 5) = v14;
        *((void *)self + 6) = v5;
        int v15 = *((_DWORD *)self + 2);
        uint64_t v16 = *((void *)self + 2);
        if (v15 >= 1)
        {
          uint64_t v17 = *((void *)self + 3);
          uint64_t v18 = *((void *)self + 4);
          do
          {
            uint64_t v19 = v16 + v17;
            uint64_t v20 = v19 ^ __ROR8__(v17, 51);
            uint64_t v21 = v18 + v14;
            uint64_t v22 = __ROR8__(v14, 48);
            uint64_t v16 = (v21 ^ v22) + __ROR8__(v19, 32);
            uint64_t v14 = v16 ^ __ROR8__(v21 ^ v22, 43);
            uint64_t v23 = v21 + v20;
            uint64_t v17 = v23 ^ __ROR8__(v20, 47);
            uint64_t v18 = __ROR8__(v23, 32);
            --v15;
          }
          while (v15);
          *((void *)self + 4) = v18;
          *((void *)self + 5) = v14;
          *((void *)self + 3) = v17;
        }
        *((void *)self + 2) = v16 ^ v11;
      }
      a3 = (char *)a3 + 8;
    }
    while (a3 < v4);
  }
  return self;
}

- (id)combineInteger:(unint64_t)a3
{
  unint64_t v4 = [NSNumber numberWithUnsignedLongLong:a3];
  id v5 = [(IFObjectHasher *)self combineContentsOfPropertyListObject:v4];

  return self;
}

- (id)combineBool:(BOOL)a3
{
  unint64_t v4 = [NSNumber numberWithBool:a3];
  id v5 = [(IFObjectHasher *)self combineContentsOfPropertyListObject:v4];

  return self;
}

@end