@interface JavaUtilBitSet
+ (const)__metadata;
+ (id)arrayForBitsWithInt:(int)a3;
+ (id)valueOfWithByteArray:(id)a3;
+ (id)valueOfWithJavaNioByteBuffer:(id)a3;
+ (id)valueOfWithJavaNioLongBuffer:(id)a3;
+ (id)valueOfWithLongArray:(id)a3;
+ (int)sizeOfLong;
+ (void)initialize;
- (BOOL)getWithInt:(int)a3;
- (BOOL)intersectsWithJavaUtilBitSet:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (JavaUtilBitSet)init;
- (JavaUtilBitSet)initWithInt:(int)a3;
- (JavaUtilBitSet)initWithLongArray:(id)a3;
- (JavaUtilBitSet)setWithInt:(int)a3;
- (JavaUtilBitSet)setWithInt:(int)a3 withBoolean:(BOOL)a4;
- (JavaUtilBitSet)setWithInt:(int)a3 withInt:(int)a4;
- (JavaUtilBitSet)setWithInt:(int)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (NSString)description;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getWithInt:(int)a3 withInt:(int)a4;
- (id)toByteArray;
- (id)toLongArray;
- (int)cardinality;
- (int)length;
- (int)nextClearBitWithInt:(int)a3;
- (int)nextSetBitWithInt:(int)a3;
- (int)previousClearBitWithInt:(int)a3;
- (int)previousSetBitWithInt:(int)a3;
- (int)size;
- (unint64_t)hash;
- (void)andNotWithJavaUtilBitSet:(id)a3;
- (void)and__WithJavaUtilBitSet:(id)a3;
- (void)checkIndexWithInt:(int)a3;
- (void)checkRangeWithInt:(int)a3 withInt:(int)a4;
- (void)clear;
- (void)clearWithInt:(int)a3;
- (void)clearWithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)ensureCapacityWithInt:(int)a3;
- (void)flipWithInt:(int)a3;
- (void)flipWithInt:(int)a3 withInt:(int)a4;
- (void)or__WithJavaUtilBitSet:(id)a3;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)xor__WithJavaUtilBitSet:(id)a3;
@end

@implementation JavaUtilBitSet

+ (int)sizeOfLong
{
  if ((atomic_load_explicit(JavaUtilBitSet__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return 8;
}

- (JavaUtilBitSet)init
{
  return self;
}

- (JavaUtilBitSet)initWithInt:(int)a3
{
  return self;
}

- (JavaUtilBitSet)initWithLongArray:(id)a3
{
  return self;
}

+ (id)arrayForBitsWithInt:(int)a3
{
  return sub_100189300(a3);
}

- (id)clone
{
  v6.receiver = self;
  v6.super_class = (Class)JavaUtilBitSet;
  v3 = [(JavaUtilBitSet *)&v6 clone];
  objc_opt_class();
  if (!v3) {
    goto LABEL_5;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  bits = self->bits_;
  if (!bits) {
LABEL_5:
  }
    JreThrowNullPointerException();
  JreStrongAssign(v3 + 1, [(IOSArray *)bits clone]);
  sub_100189120((uint64_t)v3);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    objc_opt_class();
    if (!a3) {
      goto LABEL_19;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    int longCount = self->longCount_;
    if (longCount != *((_DWORD *)a3 + 4)) {
      return 0;
    }
    if (longCount >= 1)
    {
      uint64_t v6 = 0;
      while (1)
      {
        bits = self->bits_;
        if (!bits) {
          break;
        }
        uint64_t size = bits->super.size_;
        if ((int)v6 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v6);
        }
        int64_t v9 = bits->buffer_[v6];
        uint64_t v10 = *((void *)a3 + 1);
        uint64_t v11 = *(unsigned int *)(v10 + 8);
        if ((int)v6 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v6);
        }
        uint64_t v12 = *(void *)(v10 + 16 + 8 * v6);
        BOOL result = v9 == v12;
        if (v9 == v12 && (int)++v6 < self->longCount_) {
          continue;
        }
        return result;
      }
LABEL_19:
      JreThrowNullPointerException();
    }
  }
  return 1;
}

- (void)ensureCapacityWithInt:(int)a3
{
}

- (unint64_t)hash
{
  int longCount = self->longCount_;
  if (longCount < 1)
  {
    uint64_t v5 = 1234;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 1234;
    do
    {
      bits = self->bits_;
      if (!bits) {
        JreThrowNullPointerException();
      }
      uint64_t size = bits->super.size_;
      if (v4 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v4);
      }
      int64_t v8 = bits->buffer_[v4++];
      v5 ^= v8 * v4;
    }
    while (v4 < longCount);
  }
  return (uint64_t)(v5 & 0xFFFFFFFF00000000 ^ (v5 << 32)) >> 32;
}

- (BOOL)getWithInt:(int)a3
{
  if (a3 < 0) {
    sub_100189798(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  }
  uint64_t v10 = (a3 / 64);
  if ((int)v10 >= self->longCount_)
  {
    LOBYTE(v13) = 0;
  }
  else
  {
    bits = self->bits_;
    if (!bits) {
      JreThrowNullPointerException();
    }
    uint64_t size = bits->super.size_;
    if (a3 < -63 || (int)v10 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v10);
    }
    return ((unint64_t)bits->buffer_[(int)v10] >> a3) & 1;
  }
  return v13;
}

- (JavaUtilBitSet)setWithInt:(int)a3
{
  if (a3 < 0) {
    sub_100189798(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  }
  int v10 = a3 + 63;
  if (a3 >= 0) {
    int v10 = a3;
  }
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  uint64_t v12 = (v10 >> 6);
  uint64_t size = bits->super.size_;
  if ((int)v12 >= (int)size)
  {
    sub_10018957C((char *)self, (v12 + 1));
    bits = self->bits_;
    uint64_t size = bits->super.size_;
  }
  if (a3 < -63 || (int)v12 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v12);
  }
  bits->buffer_[(int)v12] |= 1 << a3;
  BOOL result = (JavaUtilBitSet *)JavaLangMath_maxWithInt_withInt_(self->longCount_, (int)v12 + 1);
  self->longCount_ = (int)result;
  return result;
}

- (void)clearWithInt:(int)a3
{
  if (a3 < 0) {
    sub_100189798(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  }
  uint64_t v10 = (a3 / 64);
  if ((int)v10 < self->longCount_)
  {
    bits = self->bits_;
    if (!bits) {
      JreThrowNullPointerException();
    }
    uint64_t size = bits->super.size_;
    if (a3 < -63 || (int)v10 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v10);
    }
    bits->buffer_[(int)v10] &= ~(1 << a3);
    sub_100189120((uint64_t)self);
  }
}

- (void)flipWithInt:(int)a3
{
  if (a3 < 0) {
    sub_100189798(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  }
  int v10 = a3 + 63;
  if (a3 >= 0) {
    int v10 = a3;
  }
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  uint64_t v12 = (v10 >> 6);
  uint64_t size = bits->super.size_;
  if ((int)v12 >= (int)size)
  {
    sub_10018957C((char *)self, (v12 + 1));
    bits = self->bits_;
    uint64_t size = bits->super.size_;
  }
  if (a3 < -63 || (int)v12 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v12);
  }
  bits->buffer_[(int)v12] ^= 1 << a3;
  self->longCount_ = JavaLangMath_maxWithInt_withInt_(self->longCount_, (int)v12 + 1);
  sub_100189120((uint64_t)self);
}

- (void)checkIndexWithInt:(int)a3
{
  sub_100189798(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (void)checkRangeWithInt:(int)a3 withInt:(int)a4
{
  sub_100189A98(*(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

- (id)getWithInt:(int)a3 withInt:(int)a4
{
  sub_100189A98(*(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7);
  if (a3 != a4)
  {
    int v11 = self->longCount_ << 6;
    if (v11 > a3)
    {
      if (v11 >= a4) {
        int v11 = a4;
      }
      int v12 = a3 + 63;
      if (a3 >= 0) {
        int v12 = a3;
      }
      uint64_t v13 = (v12 >> 6);
      int v14 = v11 - 1;
      int v15 = v11 + 62;
      if (v11 - 1 >= 0) {
        int v15 = v11 - 1;
      }
      uint64_t v16 = (v15 >> 6);
      uint64_t v17 = -1 << a3;
      unint64_t v18 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v11;
      if (v16 == v12 >> 6)
      {
        bits = self->bits_;
        if (bits)
        {
          char v20 = a3 & 0x3F;
          uint64_t size = bits->super.size_;
          if (a3 < -63 || (int)v13 >= (int)size) {
            IOSArray_throwOutOfBoundsWithMsg(size, (v12 >> 6));
          }
          if ((v17 & v18 & bits->buffer_[(int)v13]) >> v20)
          {
            unint64_t v49 = (v17 & v18 & bits->buffer_[(int)v13]) >> v20;
            v22 = +[IOSLongArray arrayWithLongs:&v49 count:1];
            v23 = [JavaUtilBitSet alloc];
            sub_10018929C((uint64_t)v23, v22);
            return v23;
          }
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v28 = (v16 - v13);
        v29 = +[IOSLongArray arrayWithLength:(int)v28 + 1];
        v30 = self->bits_;
        if (v30)
        {
          v31 = v29;
          uint64_t v32 = v30->super.size_;
          if (a3 < -63 || (int)v13 >= (int)v32) {
            IOSArray_throwOutOfBoundsWithMsg(v32, v13);
          }
          int64_t v33 = v30->buffer_[(int)v13] & v17;
          uint64_t v34 = v31->super.size_;
          if ((int)v34 <= 0) {
            IOSArray_throwOutOfBoundsWithMsg(v34, 0);
          }
          v31->buffer_[0] = v33;
          v35 = self->bits_;
          uint64_t v36 = v35->super.size_;
          if (v14 < -63 || (int)v16 >= (int)v36) {
            IOSArray_throwOutOfBoundsWithMsg(v36, v16);
          }
          unint64_t v37 = v35->buffer_[(int)v16] & v18;
          uint64_t v38 = v31->super.size_;
          if ((int)v38 < 1) {
            IOSArray_throwOutOfBoundsWithMsg(v38, (int)v38 - 1);
          }
          *((void *)&v31->super.size_ + (int)v38) = v37;
          if ((int)v28 > 1)
          {
            uint64_t v39 = (int)v13 + 1;
            for (uint64_t i = 1; i != v28; ++i)
            {
              v41 = self->bits_;
              uint64_t v42 = v41->super.size_;
              if (v39 < 0 || v39 >= (int)v42) {
                IOSArray_throwOutOfBoundsWithMsg(v42, v39);
              }
              int64_t v43 = v41->buffer_[v39];
              uint64_t v44 = v31->super.size_;
              if (i >= v44) {
                IOSArray_throwOutOfBoundsWithMsg(v44, i);
              }
              v31->buffer_[i] = v43;
              ++v39;
            }
          }
          char v45 = a3 - ((_BYTE)v13 << 6);
          if (a3 != v13 << 6)
          {
            uint64_t v46 = v31->super.size_;
            if ((int)v46 >= 1)
            {
              uint64_t v47 = 0;
              do
              {
                if (v47 >= (int)v46) {
                  IOSArray_throwOutOfBoundsWithMsg(v46, v47);
                }
                v31->buffer_[v47] = (unint64_t)v31->buffer_[v47] >> (v45 & 0x3F);
                uint64_t v46 = v31->super.size_;
                if (v47 != v46 - 1)
                {
                  if (v47 + 1 >= (int)v46) {
                    IOSArray_throwOutOfBoundsWithMsg(v46, (v47 + 1));
                  }
                  if (v47 >= (int)v46) {
                    IOSArray_throwOutOfBoundsWithMsg(v46, v47);
                  }
                  v31->buffer_[v47] |= v31->buffer_[v47 + 1] << (-v45 & 0x3F);
                  uint64_t v46 = v31->super.size_;
                }
                if (v47 >= (int)v46) {
                  IOSArray_throwOutOfBoundsWithMsg(v46, v47);
                }
                ++v47;
              }
              while (v47 < (int)v46);
            }
          }
          v48 = [JavaUtilBitSet alloc];
          sub_10018929C((uint64_t)v48, v31);
          v27 = v48;
          goto LABEL_48;
        }
      }
      JreThrowNullPointerException();
    }
  }
LABEL_15:
  v25 = [JavaUtilBitSet alloc];
  v26 = sub_100189300(0);
  JreStrongAssign((id *)&v25->bits_, v26);
  v25->longCount_ = 0;
  v27 = v25;
LABEL_48:
  return v27;
}

- (JavaUtilBitSet)setWithInt:(int)a3 withBoolean:(BOOL)a4
{
  if (a4) {
    return [(JavaUtilBitSet *)self setWithInt:*(void *)&a3];
  }
  else {
    return (JavaUtilBitSet *)[(JavaUtilBitSet *)self clearWithInt:*(void *)&a3];
  }
}

- (JavaUtilBitSet)setWithInt:(int)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  if (a5) {
    return [(JavaUtilBitSet *)self setWithInt:*(void *)&a3 withInt:*(void *)&a4];
  }
  else {
    return (JavaUtilBitSet *)[(JavaUtilBitSet *)self clearWithInt:*(void *)&a3 withInt:*(void *)&a4];
  }
}

- (void)clear
{
  JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)self->bits_, 0, self->longCount_, 0, v2, v3, v4, v5);
  self->longCount_ = 0;
}

- (JavaUtilBitSet)setWithInt:(int)a3 withInt:(int)a4
{
  BOOL result = (JavaUtilBitSet *)sub_100189A98(*(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7);
  if (a3 != a4)
  {
    int v12 = a3 + 63;
    if (a3 >= 0) {
      int v12 = a3;
    }
    int v13 = a4 + 62;
    if (a4 - 1 >= 0) {
      int v13 = a4 - 1;
    }
    bits = self->bits_;
    if (!bits) {
      JreThrowNullPointerException();
    }
    uint64_t v15 = (v12 >> 6);
    uint64_t v16 = (v13 >> 6);
    if ((int)v16 >= bits->super.size_) {
      sub_10018957C((char *)self, (v16 + 1));
    }
    uint64_t v17 = -1 << a3;
    unint64_t v18 = 0xFFFFFFFFFFFFFFFFLL >> -(char)a4;
    if (v15 == v16)
    {
      v18 &= v17;
      v19 = self->bits_;
      uint64_t v20 = (int)v15;
      uint64_t size = v19->super.size_;
      if (a3 < -63 || (int)v15 >= (int)size)
      {
        uint64_t v22 = v15;
        goto LABEL_29;
      }
    }
    else
    {
      v23 = self->bits_;
      uint64_t v24 = v23->super.size_;
      if (a3 < -63 || (int)v15 >= (int)v24) {
        IOSArray_throwOutOfBoundsWithMsg(v24, v15);
      }
      v23->buffer_[(int)v15] |= v17;
      uint64_t v22 = (v15 + 1);
      if ((int)v22 >= (int)v16)
      {
        uint64_t v20 = (int)v22;
      }
      else
      {
        uint64_t v25 = (int)v15 + 1;
        uint64_t v20 = (int)v16;
        do
        {
          v26 = self->bits_;
          uint64_t v27 = v26->super.size_;
          if ((int)v15 < -1 || v25 >= (int)v27) {
            IOSArray_throwOutOfBoundsWithMsg(v27, (v15 + 1));
          }
          v26->buffer_[v25++] = -1;
          LODWORD(v15) = v15 + 1;
        }
        while ((int)v16 != v25);
        uint64_t v22 = v16;
      }
      v19 = self->bits_;
      uint64_t size = v19->super.size_;
      if ((int)v15 < -1 || (int)v22 >= (int)size) {
LABEL_29:
      }
        IOSArray_throwOutOfBoundsWithMsg(size, v22);
    }
    v19->buffer_[v20] |= v18;
    BOOL result = (JavaUtilBitSet *)JavaLangMath_maxWithInt_withInt_(self->longCount_, (int)v16 + 1);
    self->longCount_ = (int)result;
  }
  return result;
}

- (void)clearWithInt:(int)a3 withInt:(int)a4
{
  sub_100189A98(*(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7);
  if (a3 != a4)
  {
    int longCount = self->longCount_;
    BOOL v12 = longCount == 0;
    int v13 = longCount << 6;
    if (!v12 && v13 > a3)
    {
      if (v13 >= a4) {
        int v13 = a4;
      }
      uint64_t v15 = (a3 / 64);
      int v16 = v13 + 62;
      if (v13 - 1 >= 0) {
        int v16 = v13 - 1;
      }
      uint64_t v17 = -1 << a3;
      unint64_t v18 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v13;
      bits = self->bits_;
      if (v15 == v16 >> 6)
      {
        if (bits)
        {
          v18 &= v17;
          uint64_t v20 = (int)v15;
          uint64_t size = bits->super.size_;
          if (a3 < -63 || (int)v15 >= (int)size)
          {
            uint64_t v22 = (a3 / 64);
            goto LABEL_36;
          }
LABEL_30:
          bits->buffer_[v20] &= ~v18;
          sub_100189120((uint64_t)self);
          return;
        }
      }
      else if (bits)
      {
        uint64_t v23 = (v16 >> 6);
        uint64_t v24 = ~v17;
        uint64_t v25 = bits->super.size_;
        if (a3 < -63 || (int)v15 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, v15);
        }
        bits->buffer_[(int)v15] &= v24;
        if ((int)v15 + 1 >= (int)v23)
        {
          uint64_t v20 = (int)v15 + 1;
          uint64_t v23 = (v15 + 1);
        }
        else
        {
          uint64_t v26 = (int)v15 + 1;
          uint64_t v20 = (int)v23;
          do
          {
            uint64_t v27 = self->bits_;
            uint64_t v28 = v27->super.size_;
            if ((int)v15 < -1 || v26 >= (int)v28) {
              IOSArray_throwOutOfBoundsWithMsg(v28, (v15 + 1));
            }
            v27->buffer_[v26++] = 0;
            LODWORD(v15) = v15 + 1;
          }
          while ((int)v23 != v26);
        }
        bits = self->bits_;
        uint64_t size = bits->super.size_;
        if ((int)v15 < -1 || (int)v23 >= (int)size)
        {
          uint64_t v22 = v23;
LABEL_36:
          IOSArray_throwOutOfBoundsWithMsg(size, v22);
        }
        goto LABEL_30;
      }
      JreThrowNullPointerException();
    }
  }
}

- (void)flipWithInt:(int)a3 withInt:(int)a4
{
  sub_100189A98(*(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7);
  if (a3 != a4)
  {
    int v11 = a3 + 63;
    if (a3 >= 0) {
      int v11 = a3;
    }
    int v12 = a4 + 62;
    if (a4 - 1 >= 0) {
      int v12 = a4 - 1;
    }
    bits = self->bits_;
    if (!bits) {
      JreThrowNullPointerException();
    }
    uint64_t v14 = (v11 >> 6);
    uint64_t v15 = (v12 >> 6);
    if ((int)v15 >= bits->super.size_) {
      sub_10018957C((char *)self, (v15 + 1));
    }
    uint64_t v16 = -1 << a3;
    unint64_t v17 = 0xFFFFFFFFFFFFFFFFLL >> -(char)a4;
    if (v14 == v15)
    {
      v17 &= v16;
      unint64_t v18 = self->bits_;
      uint64_t v19 = (int)v14;
      uint64_t size = v18->super.size_;
      if (a3 < -63 || (int)v14 >= (int)size)
      {
        uint64_t v21 = v14;
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v22 = self->bits_;
      uint64_t v23 = v22->super.size_;
      if (a3 < -63 || (int)v14 >= (int)v23) {
        IOSArray_throwOutOfBoundsWithMsg(v23, v14);
      }
      v22->buffer_[(int)v14] ^= v16;
      uint64_t v21 = (v14 + 1);
      if ((int)v21 >= (int)v15)
      {
        uint64_t v19 = (int)v21;
      }
      else
      {
        uint64_t v24 = (int)v14 + 1;
        uint64_t v19 = (int)v15;
        do
        {
          uint64_t v25 = self->bits_;
          uint64_t v26 = v25->super.size_;
          if ((int)v14 < -1 || v24 >= (int)v26) {
            IOSArray_throwOutOfBoundsWithMsg(v26, (v14 + 1));
          }
          v25->buffer_[v24] = ~v25->buffer_[v24];
          ++v24;
          LODWORD(v14) = v14 + 1;
        }
        while ((int)v15 != v24);
        uint64_t v21 = v15;
      }
      unint64_t v18 = self->bits_;
      uint64_t size = v18->super.size_;
      if ((int)v14 < -1 || (int)v21 >= (int)size) {
LABEL_30:
      }
        IOSArray_throwOutOfBoundsWithMsg(size, v21);
    }
    v18->buffer_[v19] ^= v17;
    self->longCount_ = JavaLangMath_maxWithInt_withInt_(self->longCount_, (int)v15 + 1);
    sub_100189120((uint64_t)self);
  }
}

- (BOOL)intersectsWithJavaUtilBitSet:(id)a3
{
  if (!a3) {
    goto LABEL_15;
  }
  uint64_t v4 = *((void *)a3 + 1);
  int v5 = JavaLangMath_minWithInt_withInt_(self->longCount_, *((_DWORD *)a3 + 4));
  if (v5 >= 1)
  {
    int v6 = v5;
    uint64_t v7 = 0;
    BOOL v8 = 1;
    int v9 = v5;
    while (1)
    {
      bits = self->bits_;
      if (!bits) {
        break;
      }
      uint64_t size = bits->super.size_;
      if ((int)v7 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v7);
      }
      if (!v4) {
        break;
      }
      int64_t v12 = bits->buffer_[v7];
      uint64_t v13 = *(unsigned int *)(v4 + 8);
      if ((int)v7 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, v7);
      }
      if ((*(void *)(v4 + 16 + 8 * v7) & v12) == 0)
      {
        BOOL v8 = (int)++v7 < v6;
        if (v9 != v7) {
          continue;
        }
      }
      return v8;
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  return 0;
}

- (void)and__WithJavaUtilBitSet:(id)a3
{
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t v9 = JavaLangMath_minWithInt_withInt_(self->longCount_, *((_DWORD *)a3 + 4));
  if ((int)v9 >= 1)
  {
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *((void *)a3 + 1);
      uint64_t v12 = *(int *)(v11 + 8);
      if (v10 >= v12) {
        IOSArray_throwOutOfBoundsWithMsg(v12, v10);
      }
      bits = self->bits_;
      if (!bits) {
        break;
      }
      uint64_t v14 = *(void *)(v11 + 16 + 8 * v10);
      uint64_t size = bits->super.size_;
      if (v10 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v10);
      }
      bits->buffer_[v10++] &= v14;
      if (v9 == v10) {
        goto LABEL_11;
      }
    }
LABEL_14:
    JreThrowNullPointerException();
  }
LABEL_11:
  JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)self->bits_, v9, self->longCount_, 0, v5, v6, v7, v8);
  sub_100189120((uint64_t)self);
}

- (void)andNotWithJavaUtilBitSet:(id)a3
{
  if (!a3) {
    goto LABEL_14;
  }
  int v5 = JavaLangMath_minWithInt_withInt_(self->longCount_, *((_DWORD *)a3 + 4));
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5;
    while (1)
    {
      uint64_t v8 = *((void *)a3 + 1);
      uint64_t v9 = *(int *)(v8 + 8);
      if (v6 >= v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v6);
      }
      bits = self->bits_;
      if (!bits) {
        break;
      }
      uint64_t v11 = *(void *)(v8 + 16 + 8 * v6);
      uint64_t size = bits->super.size_;
      if (v6 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v6);
      }
      bits->buffer_[v6++] &= ~v11;
      if (v7 == v6) {
        goto LABEL_11;
      }
    }
LABEL_14:
    JreThrowNullPointerException();
  }
LABEL_11:
  sub_100189120((uint64_t)self);
}

- (void)or__WithJavaUtilBitSet:(id)a3
{
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t v5 = JavaLangMath_minWithInt_withInt_(self->longCount_, *((_DWORD *)a3 + 4));
  uint64_t v6 = JavaLangMath_maxWithInt_withInt_(self->longCount_, *((_DWORD *)a3 + 4));
  int v7 = v6;
  sub_10018957C((char *)self, v6);
  if ((int)v5 >= 1)
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = *((void *)a3 + 1);
      uint64_t v10 = *(int *)(v9 + 8);
      if (v8 >= v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v8);
      }
      bits = self->bits_;
      if (!bits) {
        break;
      }
      uint64_t v12 = *(void *)(v9 + 16 + 8 * v8);
      uint64_t size = bits->super.size_;
      if (v8 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v8);
      }
      bits->buffer_[v8++] |= v12;
      if (v5 == v8) {
        goto LABEL_11;
      }
    }
LABEL_14:
    JreThrowNullPointerException();
  }
LABEL_11:
  if (*((_DWORD *)a3 + 4) > (int)v5) {
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a3 + 1), v5, self->bits_, v5, (v7 - v5));
  }
  self->longCount_ = v7;
}

- (void)xor__WithJavaUtilBitSet:(id)a3
{
  if (!a3) {
    goto LABEL_16;
  }
  uint64_t v5 = JavaLangMath_minWithInt_withInt_(self->longCount_, *((_DWORD *)a3 + 4));
  uint64_t v6 = JavaLangMath_maxWithInt_withInt_(self->longCount_, *((_DWORD *)a3 + 4));
  int v7 = v6;
  sub_10018957C((char *)self, v6);
  if ((int)v5 >= 1)
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = *((void *)a3 + 1);
      uint64_t v10 = *(int *)(v9 + 8);
      if (v8 >= v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v8);
      }
      bits = self->bits_;
      if (!bits) {
        break;
      }
      uint64_t v12 = *(void *)(v9 + 16 + 8 * v8);
      uint64_t size = bits->super.size_;
      if (v8 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v8);
      }
      bits->buffer_[v8++] ^= v12;
      if (v5 == v8) {
        goto LABEL_11;
      }
    }
LABEL_16:
    JreThrowNullPointerException();
  }
LABEL_11:
  if (*((_DWORD *)a3 + 4) > (int)v5) {
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a3 + 1), v5, self->bits_, v5, (v7 - v5));
  }
  self->longCount_ = v7;
  sub_100189120((uint64_t)self);
}

- (int)size
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  return bits->super.size_ << 6;
}

- (int)length
{
  int longCount = self->longCount_;
  if (!longCount) {
    return 0;
  }
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  int v4 = longCount << 6;
  uint64_t size = bits->super.size_;
  int v6 = longCount - 1;
  if (v6 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  return v4 - JavaLangLong_numberOfLeadingZerosWithLong_(bits->buffer_[v6]);
}

- (NSString)description
{
  uint64_t v3 = new_JavaLangStringBuilder_initWithInt_(self->longCount_ / 2);
  [(JavaLangStringBuilder *)v3 appendWithChar:123];
  if (self->longCount_ >= 1)
  {
    int v4 = 0;
    uint64_t v5 = 0;
    char v6 = 0;
    do
    {
      bits = self->bits_;
      if (!bits) {
        JreThrowNullPointerException();
      }
      uint64_t size = bits->super.size_;
      if (v5 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v5);
      }
      if (bits->buffer_[v5])
      {
        for (uint64_t i = 0; i != 64; ++i)
        {
          uint64_t v10 = self->bits_;
          uint64_t v11 = v10->super.size_;
          if (v5 >= v11) {
            IOSArray_throwOutOfBoundsWithMsg(v11, v5);
          }
          if (((unint64_t)v10->buffer_[v5] >> i))
          {
            if (v6) {
              [(JavaLangStringBuilder *)v3 appendWithNSString:@", "];
            }
            [(JavaLangStringBuilder *)v3 appendWithInt:(v4 + i)];
            char v6 = 1;
          }
        }
      }
      ++v5;
      v4 += 64;
    }
    while (v5 < self->longCount_);
  }
  [(JavaLangStringBuilder *)v3 appendWithChar:125];
  return [(JavaLangStringBuilder *)v3 description];
}

- (int)nextSetBitWithInt:(int)a3
{
  sub_100189798(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  uint64_t v10 = (a3 / 64);
  if ((int)v10 >= self->longCount_) {
    return -1;
  }
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  uint64_t v12 = -1 << a3;
  uint64_t v13 = (int)v10;
  uint64_t size = bits->super.size_;
  if (a3 < -63 || (int)v10 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v10);
  }
  if ((bits->buffer_[(int)v10] & v12) == 0)
  {
    uint64_t v18 = (v10 + 1);
    uint64_t v19 = (char *)&_mh_execute_header + ((uint64_t)(int)v10 << 32);
    while (1)
    {
      uint64_t v10 = v18;
      uint64_t v20 = (uint64_t)v19;
      uint64_t longCount = self->longCount_;
      if (v13 + 1 >= longCount) {
        break;
      }
      uint64_t v22 = self->bits_;
      uint64_t v23 = v22->super.size_;
      if (v13 < -1 || v13 + 1 >= (int)v23) {
        IOSArray_throwOutOfBoundsWithMsg(v23, v10);
      }
      int64_t v24 = v22->buffer_[v13 + 1];
      uint64_t v18 = (v10 + 1);
      uint64_t v19 = (char *)&_mh_execute_header + (void)v19;
      ++v13;
      if (v24)
      {
        LODWORD(longCount) = self->longCount_;
        break;
      }
    }
    if (longCount != v10)
    {
      uint64_t v26 = self->bits_;
      uint64_t v27 = v20 >> 32;
      uint64_t v28 = v26->super.size_;
      if ((int)v10 - 1 < -1 || (int)v28 <= (int)v10) {
        IOSArray_throwOutOfBoundsWithMsg(v28, v10);
      }
      uint64_t v17 = v26->buffer_[v27];
      return JavaLangLong_numberOfTrailingZerosWithLong_(v17) + (v10 << 6);
    }
    return -1;
  }
  uint64_t v15 = self->bits_;
  uint64_t v16 = v15->super.size_;
  if ((int)v10 >= (int)v16) {
    IOSArray_throwOutOfBoundsWithMsg(v16, v10);
  }
  uint64_t v17 = v15->buffer_[(int)v10] & v12;
  return JavaLangLong_numberOfTrailingZerosWithLong_(v17) + (v10 << 6);
}

- (int)nextClearBitWithInt:(int)a3
{
  int v8 = a3;
  sub_100189798(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  uint64_t v10 = (v8 / 64);
  if ((int)v10 < self->longCount_)
  {
    bits = self->bits_;
    if (!bits) {
      JreThrowNullPointerException();
    }
    uint64_t v12 = -1 << v8;
    uint64_t v13 = (int)v10;
    uint64_t size = bits->super.size_;
    if (v8 < -63 || (int)v10 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v10);
    }
    if ((v12 & ~bits->buffer_[(int)v10]) != 0)
    {
      uint64_t v15 = self->bits_;
      uint64_t v16 = v15->super.size_;
      if ((int)v10 >= (int)v16) {
        IOSArray_throwOutOfBoundsWithMsg(v16, v10);
      }
      uint64_t v17 = v12 & ~v15->buffer_[(int)v10];
      int v8 = v10 << 6;
LABEL_19:
      v8 += JavaLangLong_numberOfTrailingZerosWithLong_(v17);
      return v8;
    }
    uint64_t v18 = (v10 + 1);
    uint64_t v19 = (char *)&_mh_execute_header + ((uint64_t)(int)v10 << 32);
    int v20 = (v10 << 6) + 64;
    while (1)
    {
      uint64_t v21 = v18;
      uint64_t v22 = (uint64_t)v19;
      int v8 = v20;
      uint64_t longCount = self->longCount_;
      if (v13 + 1 >= longCount) {
        break;
      }
      int64_t v24 = self->bits_;
      uint64_t v25 = v24->super.size_;
      if (v13 < -1 || v13 + 1 >= (int)v25) {
        IOSArray_throwOutOfBoundsWithMsg(v25, v21);
      }
      uint64_t v18 = (v21 + 1);
      int64_t v26 = v24->buffer_[v13 + 1];
      uint64_t v19 = (char *)&_mh_execute_header + (void)v19;
      v20 += 64;
      ++v13;
      if (v26 != -1)
      {
        LODWORD(longCount) = self->longCount_;
        break;
      }
    }
    if (longCount != v21)
    {
      uint64_t v27 = self->bits_;
      uint64_t v28 = v27->super.size_;
      if ((int)v21 - 1 < -1 || (int)v28 <= (int)v21) {
        IOSArray_throwOutOfBoundsWithMsg(v28, v21);
      }
      uint64_t v17 = ~v27->buffer_[v22 >> 32];
      goto LABEL_19;
    }
  }
  return v8;
}

- (int)previousSetBitWithInt:(int)a3
{
  uint64_t v8 = *(void *)&a3;
  if (a3 != -1)
  {
    sub_100189798(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
    if ((v8 & 0x80000000) != 0)
    {
LABEL_6:
      LODWORD(v8) = -1;
    }
    else
    {
      while (![(JavaUtilBitSet *)self getWithInt:v8])
      {
        BOOL v10 = (int)v8 <= 0;
        uint64_t v8 = (v8 - 1);
        if (v10) {
          goto LABEL_6;
        }
      }
    }
  }
  return v8;
}

- (int)previousClearBitWithInt:(int)a3
{
  uint64_t v8 = *(void *)&a3;
  if (a3 != -1)
  {
    sub_100189798(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
    if ((v8 & 0x80000000) != 0)
    {
LABEL_6:
      LODWORD(v8) = -1;
    }
    else
    {
      while ([(JavaUtilBitSet *)self getWithInt:v8])
      {
        BOOL v10 = (int)v8 <= 0;
        uint64_t v8 = (v8 - 1);
        if (v10) {
          goto LABEL_6;
        }
      }
    }
  }
  return v8;
}

- (BOOL)isEmpty
{
  return self->longCount_ == 0;
}

- (int)cardinality
{
  if (self->longCount_ < 1) {
    return 0;
  }
  uint64_t v3 = 0;
  int v4 = 0;
  do
  {
    bits = self->bits_;
    if (!bits) {
      JreThrowNullPointerException();
    }
    uint64_t size = bits->super.size_;
    if (v3 >= size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v3);
    }
    v4 += JavaLangLong_bitCountWithLong_(bits->buffer_[v3++]);
  }
  while (v3 < self->longCount_);
  return v4;
}

+ (id)valueOfWithLongArray:(id)a3
{
  return JavaUtilBitSet_valueOfWithLongArray_(a3);
}

+ (id)valueOfWithJavaNioLongBuffer:(id)a3
{
  return JavaUtilBitSet_valueOfWithJavaNioLongBuffer_(a3);
}

+ (id)valueOfWithByteArray:(id)a3
{
  return JavaUtilBitSet_valueOfWithByteArray_(a3);
}

+ (id)valueOfWithJavaNioByteBuffer:(id)a3
{
  return JavaUtilBitSet_valueOfWithJavaNioByteBuffer_(a3);
}

- (id)toLongArray
{
  return JavaUtilArrays_copyOfWithLongArray_withInt_(self->bits_, self->longCount_);
}

- (id)toByteArray
{
  unsigned int v3 = [(JavaUtilBitSet *)self length];
  signed int v4 = v3 + 7;
  if ((int)(v3 + 7) < 0) {
    signed int v4 = v3 + 14;
  }
  uint64_t v5 = +[IOSByteArray arrayWithLength:(uint64_t)v4 >> 3];
  if (v5->super.size_ >= 1)
  {
    int v6 = 0;
    uint64_t v7 = 0;
    do
    {
      int v8 = v6 + 63;
      if (v6 >= 0) {
        int v8 = v6;
      }
      bits = self->bits_;
      if (!bits) {
        JreThrowNullPointerException();
      }
      int v10 = v8 >> 6;
      uint64_t size = bits->super.size_;
      if (v6 < -63 || v10 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, (v8 >> 6));
      }
      unint64_t v12 = bits->buffer_[v10];
      uint64_t v13 = v5->super.size_;
      if (v7 >= v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, v7);
      }
      *((unsigned char *)&v5->super.size_ + v7++ + 4) = v12 >> (v6 & 0x38);
      v6 += 8;
    }
    while (v7 < v5->super.size_);
  }
  return v5;
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3 || ([a3 defaultReadObject], (bits = self->bits_) == 0)) {
    JreThrowNullPointerException();
  }
  self->longCount_ = bits->super.size_;
  sub_100189120((uint64_t)self);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilBitSet;
  [(JavaUtilBitSet *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilBitSet *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit(JavaUtilBitSet__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    dword_1005609D8 = 8;
    atomic_store(1u, (unsigned __int8 *)JavaUtilBitSet__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040BDD8;
}

@end