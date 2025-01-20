@interface _CUIRecognitionObjectRendition
- (__n128)transformation;
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (int)objectVersion;
- (void)_initalizeMetadataFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4;
@end

@implementation _CUIRecognitionObjectRendition

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_CUIRecognitionObjectRendition;
  id v4 = [(_CUIRawDataRendition *)&v8 _initWithCSIHeader:a3 version:*(void *)&a4];
  if (v4)
  {
    v5 = -[_CUISubrangeData initWithData:range:]([_CUISubrangeData alloc], "initWithData:range:", *((void *)v4 + 27), 0, 4);
    *((_DWORD *)v4 + 56) = *(_DWORD *)[(_CUISubrangeData *)v5 bytes];

    v6 = -[_CUISubrangeData initWithData:range:]([_CUISubrangeData alloc], "initWithData:range:", *((void *)v4 + 27), 4, (char *)[*((id *)v4 + 27) length] - 4);
    *((void *)v4 + 27) = v6;
  }
  return v4;
}

- (void)_initalizeMetadataFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4
{
  v16.receiver = self;
  v16.super_class = (Class)_CUIRecognitionObjectRendition;
  -[CUIThemeRendition _initalizeMetadataFromCSIData:version:](&v16, sel__initalizeMetadataFromCSIData_version_);
  uint64_t var10 = a3->var10;
  if (var10)
  {
    objc_super v8 = &a3->var11.var1[a3->var11.var0 + 1];
    v9 = (unsigned int *)((char *)v8 + var10);
    do
    {
      unsigned int v10 = v8[1];
      if (*v8 == 1017)
      {
        long long v11 = *(_OWORD *)&self[1].super.super.super.isa;
        long long v12 = *(_OWORD *)&self[1].super.super._stackKey[2].identifier;
        LODWORD(v11) = v8[3];
        LODWORD(self[1].super.super.super.isa) = v11;
        DWORD1(v11) = v8[4];
        *(_OWORD *)&self[1].super.super.super.isa = v11;
        DWORD2(v11) = v8[5];
        *(_OWORD *)&self[1].super.super.super.isa = v11;
        HIDWORD(v11) = v8[6];
        *(_OWORD *)&self[1].super.super.super.isa = v11;
        LODWORD(v12) = v8[7];
        self[1].super.super._stackKey[2] = (_renditionkeytoken)v12;
        DWORD1(v12) = v8[8];
        *(_OWORD *)&self[1].super.super._stackKey[2].identifier = v12;
        DWORD2(v12) = v8[9];
        *(_OWORD *)&self[1].super.super._stackKey[2].identifier = v12;
        HIDWORD(v12) = v8[10];
        *(_OWORD *)&self[1].super.super._stackKey[2].identifier = v12;
        long long v13 = *(_OWORD *)&self[1].super.super._stackKey[6].identifier;
        long long v14 = *(_OWORD *)&self[1].super.super._stackKey[10].identifier;
        LODWORD(v13) = v8[11];
        self[1].super.super._stackKey[6] = (_renditionkeytoken)v13;
        DWORD1(v13) = v8[12];
        *(_OWORD *)&self[1].super.super._stackKey[6].identifier = v13;
        DWORD2(v13) = v8[13];
        *(_OWORD *)&self[1].super.super._stackKey[6].identifier = v13;
        HIDWORD(v13) = v8[14];
        *(_OWORD *)&self[1].super.super._stackKey[6].identifier = v13;
        LODWORD(v14) = v8[15];
        self[1].super.super._stackKey[10] = (_renditionkeytoken)v14;
        DWORD1(v14) = v8[16];
        *(_OWORD *)&self[1].super.super._stackKey[10].identifier = v14;
        DWORD2(v14) = v8[17];
        *(_OWORD *)&self[1].super.super._stackKey[10].identifier = v14;
        HIDWORD(v14) = v8[18];
        *(_OWORD *)&self[1].super.super._stackKey[10].identifier = v14;
      }
      if (a4 <= 0x34E && v10 != 12 && *v8 == 1019) {
        unsigned int v10 = 12;
      }
      objc_super v8 = (unsigned int *)((char *)v8 + v10 + 8);
    }
    while (v8 < v9);
  }
}

- (int)objectVersion
{
  return self->_objectVersion;
}

- (__n128)transformation
{
  return a1[15];
}

@end