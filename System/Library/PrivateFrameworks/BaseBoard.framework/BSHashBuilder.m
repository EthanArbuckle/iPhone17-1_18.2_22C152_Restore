@interface BSHashBuilder
+ (id)builder;
- (id)appendArray:(id)a3;
- (id)appendBool:(BOOL)a3;
- (id)appendBytes:(const void *)a3 length:(unint64_t)a4;
- (id)appendCGAffineTransform:(CGAffineTransform *)a3;
- (id)appendCGFloat:(double)a3;
- (id)appendCGPoint:(CGPoint)a3;
- (id)appendCGRect:(CGRect)a3;
- (id)appendCGSize:(CGSize)a3;
- (id)appendClass:(Class)a3;
- (id)appendDouble:(double)a3;
- (id)appendFloat:(float)a3;
- (id)appendHashingBlocks:(id)a3;
- (id)appendInt64:(int64_t)a3;
- (id)appendObject:(id)a3;
- (id)appendPointer:(void *)a3;
- (id)appendString:(id)a3;
- (unint64_t)hash;
@end

@implementation BSHashBuilder

- (id)appendInt64:(int64_t)a3
{
  unint64_t v3 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (a3 ^ ((unint64_t)a3 >> 30))) ^ ((0xBF58476D1CE4E5B9
                                                                       * (a3 ^ ((unint64_t)a3 >> 30))) >> 27));
  *((void *)self + 1) ^= (v3 >> 31) ^ v3;
  return self;
}

- (id)appendPointer:(void *)a3
{
  unint64_t v3 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * ((unint64_t)a3 ^ ((unint64_t)a3 >> 30))) ^ ((0xBF58476D1CE4E5B9
                                                                                         * ((unint64_t)a3 ^ ((unint64_t)a3 >> 30))) >> 27));
  *((void *)self + 1) ^= (v3 >> 31) ^ v3;
  return self;
}

- (id)appendString:(id)a3
{
  unint64_t hash = self->_hash;
  unint64_t v5 = [a3 hash];
  unint64_t v6 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) >> 27));
  self->_unint64_t hash = hash ^ (v6 >> 31) ^ v6;
  return self;
}

- (id)appendBool:(BOOL)a3
{
  unint64_t v3 = 0xBF58476D1CE4E5B9;
  if (!a3) {
    unint64_t v3 = 0;
  }
  *((void *)self + 1) ^= ((0x94D049BB133111EBLL * (v3 ^ (v3 >> 27))) >> 31) ^ (0x94D049BB133111EBLL * (v3 ^ (v3 >> 27)));
  return self;
}

- (id)appendCGPoint:(CGPoint)a3
{
  unint64_t hash = self->_hash;
  unint64_t v5 = [NSNumber numberWithDouble:a3.x + a3.y];
  unint64_t v6 = [v5 hash];
  unint64_t v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  self->_unint64_t hash = hash ^ (v7 >> 31) ^ v7;

  return self;
}

- (id)appendCGSize:(CGSize)a3
{
  unint64_t hash = self->_hash;
  unint64_t v5 = [NSNumber numberWithDouble:a3.height * a3.width];
  unint64_t v6 = [v5 hash];
  unint64_t v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  self->_unint64_t hash = hash ^ (v7 >> 31) ^ v7;

  return self;
}

- (id)appendCGRect:(CGRect)a3
{
  unint64_t hash = self->_hash;
  unint64_t v5 = [NSNumber numberWithDouble:a3.origin.x + a3.origin.y + a3.size.height * a3.size.width];
  unint64_t v6 = [v5 hash];
  unint64_t v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  self->_unint64_t hash = hash ^ (v7 >> 31) ^ v7;

  return self;
}

- (id)appendDouble:(double)a3
{
  unint64_t hash = self->_hash;
  unint64_t v5 = [NSNumber numberWithDouble:a3];
  unint64_t v6 = [v5 hash];
  unint64_t v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  self->_unint64_t hash = hash ^ (v7 >> 31) ^ v7;

  return self;
}

- (id)appendCGFloat:(double)a3
{
  unint64_t hash = self->_hash;
  unint64_t v5 = [NSNumber numberWithDouble:a3];
  unint64_t v6 = [v5 hash];
  unint64_t v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  self->_unint64_t hash = hash ^ (v7 >> 31) ^ v7;

  return self;
}

- (unint64_t)hash
{
  return self->_hash;
}

+ (id)builder
{
  v2 = objc_alloc_init(BSHashBuilder);
  return v2;
}

- (id)appendObject:(id)a3
{
  unint64_t hash = self->_hash;
  unint64_t v5 = [a3 hash];
  unint64_t v6 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) >> 27));
  self->_unint64_t hash = hash ^ (v6 >> 31) ^ v6;
  return self;
}

- (id)appendClass:(Class)a3
{
  unint64_t v3 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * ((unint64_t)a3 ^ ((unint64_t)a3 >> 30))) ^ ((0xBF58476D1CE4E5B9
                                                                                         * ((unint64_t)a3 ^ ((unint64_t)a3 >> 30))) >> 27));
  *((void *)self + 1) ^= (v3 >> 31) ^ v3;
  return self;
}

- (id)appendHashingBlocks:(id)a3
{
  v4 = (uint64_t (**)(void))a3;
  if (v4)
  {
    unint64_t v5 = v4;
    v13 = &v14;
    unint64_t v6 = 17;
    do
    {
      unint64_t v7 = v5[2](v5);
      unint64_t v8 = 0x94D049BB133111EBLL
         * ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) >> 27));
      v6 ^= (v8 >> 31) ^ v8;
      v9 = v13++;
      uint64_t v10 = MEMORY[0x18C125630](*v9);

      unint64_t v5 = (uint64_t (**)(void))v10;
    }
    while (v10);
    unint64_t v11 = 0x94D049BB133111EBLL
        * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
    self->_hash ^= (v11 >> 31) ^ v11;
  }
  return self;
}

- (id)appendFloat:(float)a3
{
  unint64_t hash = self->_hash;
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithFloat:");
  unint64_t v6 = [v5 hash];
  unint64_t v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  self->_unint64_t hash = hash ^ (v7 >> 31) ^ v7;

  return self;
}

- (id)appendBytes:(const void *)a3 length:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v5 = a4;
    unint64_t v6 = (unsigned __int8 *)a3;
    if (!a3)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"BSHashBuilder.m", 129, @"Invalid parameter not satisfying: %@", @"bytesIn != NULL" object file lineNumber description];
    }
    unint64_t v7 = 0;
    do
    {
      unsigned int v8 = *v6++;
      unint64_t v9 = 0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * v8) ^ ((0xBF58476D1CE4E5B9 * v8) >> 27));
      v7 ^= (v9 >> 31) ^ v9;
      --v5;
    }
    while (v5);
    unint64_t v10 = 0x94D049BB133111EBLL
        * ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) >> 27));
    self->_hash ^= (v10 >> 31) ^ v10;
  }
  return self;
}

- (id)appendCGAffineTransform:(CGAffineTransform *)a3
{
  unint64_t hash = self->_hash;
  unint64_t v6 = [NSNumber numberWithDouble:a3->a];
  unint64_t v7 = [v6 hash];
  unint64_t v8 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) >> 27));
  self->_unint64_t hash = hash ^ (v8 >> 31) ^ v8;

  unint64_t v9 = self->_hash;
  unint64_t v10 = [NSNumber numberWithDouble:a3->b];
  unint64_t v11 = [v10 hash];
  unint64_t v12 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) >> 27));
  self->_unint64_t hash = v9 ^ (v12 >> 31) ^ v12;

  unint64_t v13 = self->_hash;
  uint64_t v14 = [NSNumber numberWithDouble:a3->c];
  unint64_t v15 = [v14 hash];
  unint64_t v16 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v15 ^ (v15 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v15 ^ (v15 >> 30))) >> 27));
  self->_unint64_t hash = v13 ^ (v16 >> 31) ^ v16;

  unint64_t v17 = self->_hash;
  v18 = [NSNumber numberWithDouble:a3->d];
  unint64_t v19 = [v18 hash];
  unint64_t v20 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v19 ^ (v19 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v19 ^ (v19 >> 30))) >> 27));
  self->_unint64_t hash = v17 ^ (v20 >> 31) ^ v20;

  unint64_t v21 = self->_hash;
  v22 = [NSNumber numberWithDouble:a3->tx];
  unint64_t v23 = [v22 hash];
  unint64_t v24 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v23 ^ (v23 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v23 ^ (v23 >> 30))) >> 27));
  self->_unint64_t hash = v21 ^ (v24 >> 31) ^ v24;

  unint64_t v25 = self->_hash;
  v26 = [NSNumber numberWithDouble:a3->ty];
  unint64_t v27 = [v26 hash];
  unint64_t v28 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v27 ^ (v27 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v27 ^ (v27 >> 30))) >> 27));
  self->_unint64_t hash = v25 ^ (v28 >> 31) ^ v28;

  return self;
}

- (id)appendArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      unint64_t v9 = 17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          unint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "hash", (void)v15);
          unint64_t v12 = 0x94D049BB133111EBLL
              * ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) >> 27));
          v9 ^= (v12 >> 31) ^ v12;
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
    else
    {
      unint64_t v9 = 17;
    }

    unint64_t v13 = 0x94D049BB133111EBLL
        * ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) >> 27));
    self->_hash ^= (v13 >> 31) ^ v13;
  }

  return self;
}

@end