@interface _CUIExternalLinkRendition
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)assetPackIdentifier;
- (id)externalTags;
- (void)dealloc;
@end

@implementation _CUIExternalLinkRendition

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUIExternalLinkRendition;
  [(CUIThemeRendition *)&v3 dealloc];
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v15.receiver = self;
  v15.super_class = (Class)_CUIExternalLinkRendition;
  id v6 = [(CUIThemeRendition *)&v15 _initWithCSIHeader:a3 version:*(void *)&a4];
  v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
  *((void *)v6 + 28) = [objc_alloc((Class)NSMutableSet) initWithCapacity:*((unsigned int *)v7 + 47)];
  int v9 = *((_DWORD *)v7 + 45);
  v8 = v7 + 180;
  if (v9 != 1163414603) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v6 file:@"_CUIExternalLinkRendition.m" lineNumber:44 description:@"CoreUI: Expecting a kCSIExternalLinkSignature but didn't find it"];
  }
  if (*((_DWORD *)v8 + 1)) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v6 file:@"_CUIExternalLinkRendition.m" lineNumber:45 description:@"CoreUI: CSIExternaLinkData flags must be 0 now"];
  }
  if (*((_DWORD *)v8 + 2) != -1)
  {
    unsigned int v10 = 0;
    v11 = v8 + 12;
    do
    {
      if (*v11 != 1008) {
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v6 file:@"_CUIExternalLinkRendition.m" lineNumber:48 description:@"CoreUI: CSIExternaLinkData numberOfAssetIdentifiers/numberExternalTags resource is of unknown type"];
      }
      id v12 = [objc_alloc((Class)NSString) initWithUTF8String:v11 + 2];
      v13 = v12;
      if (v10)
      {
        [*((id *)v6 + 28) addObject:v12];
      }
      else
      {
        *((void *)v6 + 27) = v12;
      }
      v11 = (_DWORD *)((char *)v11 + v11[1] + 8);
      ++v10;
    }
    while (v10 < *((_DWORD *)v8 + 2) + 1);
  }
  return v6;
}

- (id)assetPackIdentifier
{
  return self->_assetPackIdentifier;
}

- (id)externalTags
{
  return self->_externalTags;
}

@end