@interface IOHIDIUnknown2
- (IOHIDIUnknown2)init;
- (int)queryInterface:(id)a3 outInterface:(void *)a4;
- (void)dealloc;
@end

@implementation IOHIDIUnknown2

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  return -2147483644;
}

- (IOHIDIUnknown2)init
{
  v6.receiver = self;
  v6.super_class = (Class)IOHIDIUnknown2;
  v2 = [(IOHIDIUnknown2 *)&v6 init];
  if (v2)
  {
    v3 = (IUnknownVTbl *)malloc_type_malloc(0x20uLL, 0x8004018A671A6uLL);
    v2->_vtbl = v3;
    v3->_reserved = v2;
    v3->QueryInterface = (HRESULT (__cdecl *)(void *, REFIID, LPVOID *))sub_2407687D4;
    v3->AddRef = (ULONG (__cdecl *)(void *))sub_2407687EC;
    v3->Release = (ULONG (__cdecl *)(void *))sub_240768830;
    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  free(self->_vtbl);
  v3.receiver = self;
  v3.super_class = (Class)IOHIDIUnknown2;
  [(IOHIDIUnknown2 *)&v3 dealloc];
}

@end