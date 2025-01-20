@interface _CUINameContentRendition
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)contentNames;
- (void)dealloc;
@end

@implementation _CUINameContentRendition

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUINameContentRendition;
  [(CUIThemeRendition *)&v3 dealloc];
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v14.receiver = self;
  v14.super_class = (Class)_CUINameContentRendition;
  v5 = [(CUIThemeRendition *)&v14 _initWithCSIHeader:a3 version:*(void *)&a4];
  uint64_t var10 = a3->var10;
  if (var10)
  {
    v7 = &a3->var11.var1[a3->var11.var0 + 1];
    v8 = (unsigned int *)((char *)v7 + var10);
    do
    {
      if (*v7 == 1013)
      {
        id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v7[2]];
        if (v7[2])
        {
          unsigned int v10 = 0;
          v11 = v7 + 4;
          do
          {
            id v12 = [objc_alloc((Class)NSString) initWithBytes:v11 + 1 length:*v11 encoding:4];
            [v9 addObject:v12];

            v11 = (unsigned int *)((char *)v11 + *v11 + 4);
            ++v10;
          }
          while (v10 < v7[2]);
        }

        v5[27] = v9;
      }
      v7 = (unsigned int *)((char *)v7 + v7[1] + 8);
    }
    while (v7 < v8);
  }
  return v5;
}

- (id)contentNames
{
  return self->_contentNames;
}

@end