@interface _CUIThemeMultisizeImageSetRendition
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)sizeIndexes;
- (void)dealloc;
@end

@implementation _CUIThemeMultisizeImageSetRendition

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeMultisizeImageSetRendition;
  [(CUIThemeRendition *)&v3 dealloc];
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v25.receiver = self;
  v25.super_class = (Class)_CUIThemeMultisizeImageSetRendition;
  v6 = [(CUIThemeRendition *)&v25 _initWithCSIHeader:a3 version:*(void *)&a4];
  uint64_t var10 = a3->var10;
  uint64_t var0 = a3->var11.var0;
  v9 = (char *)&a3->var0 + 4 * var0 + var10;
  int v11 = *((_DWORD *)v9 + 45);
  v10 = v9 + 180;
  if (v11 != 1297303891) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v6 file:@"_CUIThemeMultisizeImageSetRendition.m" lineNumber:21 description:@"CoreUI: Expecting a kCSIMultisizeImageSetSignature but didn't find it"];
  }
  id v12 = +[NSMutableArray array];
  uint64_t v13 = [v6 valueForTokenIdentifier:15];
  uint64_t v14 = [v6 valueForTokenIdentifier:16];
  if (*((_DWORD *)v10 + 1))
  {
    if (*((_DWORD *)v10 + 2))
    {
      unint64_t v17 = 0;
      v18 = (unsigned int *)((char *)&a3->var11.var1[var0 + 6] + var10);
      do
      {
        LODWORD(v15) = *(v18 - 2);
        LODWORD(v16) = *(v18 - 1);
        unsigned int v19 = *v18;
        v18 += 3;
        objc_msgSend(v12, "addObject:", -[_CUIMultisizeImageSetSizeAndIndex initWithSize:index:idiom:subtype:]([_CUIMultisizeImageSetSizeAndIndex alloc], "initWithSize:index:idiom:subtype:", v19, v13, v14, (double)v15, (double)v16));
        ++v17;
      }
      while (v17 < *((unsigned int *)v10 + 2));
    }
  }
  else if (*((_DWORD *)v10 + 2))
  {
    unint64_t v20 = 0;
    v21 = (int *)((char *)&a3->var11.var1[var0 + 5] + var10);
    do
    {
      LODWORD(v15) = *(v21 - 1);
      double v22 = (double)v15;
      int v23 = *v21;
      v21 += 2;
      LODWORD(v15) = v23;
      objc_msgSend(v12, "addObject:", -[_CUIMultisizeImageSetSizeAndIndex initWithSize:index:idiom:subtype:]([_CUIMultisizeImageSetSizeAndIndex alloc], "initWithSize:index:idiom:subtype:", v20++, v13, v14, v22, (double)v15));
    }
    while (v20 < *((unsigned int *)v10 + 2));
  }
  v6[27] = [objc_alloc((Class)NSArray) initWithArray:v12];
  return v6;
}

- (id)sizeIndexes
{
  return self->_sizeIndexes;
}

@end