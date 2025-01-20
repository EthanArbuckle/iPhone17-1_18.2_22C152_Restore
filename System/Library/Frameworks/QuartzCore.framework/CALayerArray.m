@interface CALayerArray
- (CALayerArray)initWithLayers:(id *)a3 count:(unint64_t)a4 retain:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation CALayerArray

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  p_ivars = &self->_ivars;
  unint64_t result = self->_ivars.var0;
  if (result)
  {
    if (a3->var0)
    {
      return 0;
    }
    else
    {
      a3->var0 = 1;
      if (result == 1 && !p_ivars->capacity) {
        p_layers = (id *)&p_ivars->layers;
      }
      else {
        p_layers = (id *)p_ivars->layers;
      }
      a3->var1 = p_layers;
      a3->var2 = &p_ivars->mutations;
    }
  }
  return result;
}

- (unint64_t)count
{
  return self->_ivars.var0;
}

- (id)objectAtIndex:(unint64_t)a3
{
  p_ivars = &self->_ivars;
  if (self->_ivars.var0 != 1 || self->_ivars.capacity) {
    p_ivars = (_CALayerArrayIvars *)p_ivars->layers;
  }
  return (id)*((void *)&p_ivars->layers + a3);
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  p_ivars = &self->_ivars;
  if (self->_ivars.retained)
  {
    unint64_t var0 = self->_ivars.var0;
    if (var0 == 1)
    {
      if (!self->_ivars.capacity)
      {
        do
        {
LABEL_7:
          layers = p_ivars->layers;
          p_ivars = (_CALayerArrayIvars *)((char *)p_ivars + 8);
          CFRelease(layers);
          --var0;
        }
        while (var0);
        goto LABEL_8;
      }
    }
    else if (!var0)
    {
      goto LABEL_8;
    }
    p_ivars = (_CALayerArrayIvars *)p_ivars->layers;
    goto LABEL_7;
  }
LABEL_8:
  if (self->_ivars.capacity)
  {
    v6 = self->_ivars.layers;
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    malloc_zone_free(malloc_zone, v6);
  }
  v8.receiver = self;
  v8.super_class = (Class)CALayerArray;
  [(CALayerArray *)&v8 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C978]);

  return (id)objc_msgSend(v3, "initWithObjects:count:");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);

  return (id)objc_msgSend(v3, "initWithObjects:count:");
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  p_ivars = &self->_ivars;
  if (self->_ivars.var0 != 1 || self->_ivars.capacity) {
    p_ivars = (_CALayerArrayIvars *)p_ivars->layers;
  }
  if (a4.length)
  {
    v5 = (void **)(&p_ivars->layers + a4.location);
    do
    {
      v6 = *v5++;
      *a3++ = v6;
      --a4.length;
    }
    while (a4.length);
  }
}

- (void)getObjects:(id *)a3
{
  p_ivars = &self->_ivars;
  unint64_t var0 = self->_ivars.var0;
  if (var0 != 1)
  {
    if (!var0) {
      return;
    }
    goto LABEL_5;
  }
  if (self->_ivars.capacity)
  {
LABEL_5:
    p_ivars = (_CALayerArrayIvars *)p_ivars->layers;
    goto LABEL_6;
  }
  do
  {
LABEL_6:
    layers = p_ivars->layers;
    p_ivars = (_CALayerArrayIvars *)((char *)p_ivars + 8);
    *a3++ = layers;
    --var0;
  }
  while (var0);
}

- (CALayerArray)initWithLayers:(id *)a3 count:(unint64_t)a4 retain:(BOOL)a5
{
  BOOL v5 = a5;
  objc_super v8 = [(CALayerArray *)self init];
  uint64_t v9 = v8;
  if (!v8 || !a4) {
    return v9;
  }
  if (a4 >> 61)
  {
    v8->_ivars.layers = 0;
    goto LABEL_11;
  }
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v11 = (count **)malloc_type_zone_malloc(malloc_zone, 8 * a4, 0x8BB15036uLL);
  p_ivars = &v9->_ivars;
  v9->_ivars.layers = v11;
  if (!v11)
  {
LABEL_11:

    return 0;
  }
  uint64_t v13 = 0;
  v9->_ivars.unint64_t var0 = a4;
  v9->_ivars.capacity = a4;
  v9->_ivars.retained = v5;
  do
  {
    p_ivars->layers[v13] = (count *)a3[v13];
    if (v5) {
      CFRetain(p_ivars->layers[v13]);
    }
    ++v13;
  }
  while (a4 != v13);
  return v9;
}

@end