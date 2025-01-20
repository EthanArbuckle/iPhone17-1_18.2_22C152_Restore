@interface WKAutocorrectionContext
+ (id)autocorrectionContextWithWebContext:(const void *)a3;
+ (id)emptyAutocorrectionContext;
@end

@implementation WKAutocorrectionContext

+ (id)emptyAutocorrectionContext
{
  *(_OWORD *)v9 = 0u;
  *(_OWORD *)v10 = 0u;
  long long v11 = xmmword_1994F6020;
  v3 = (void *)[a1 autocorrectionContextWithWebContext:v9];
  v4 = v10[1];
  v10[1] = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  v5 = v10[0];
  v10[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v2);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  v6 = v9[1];
  v9[1] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v2);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  v7 = v9[0];
  v9[0] = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v2);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  return v3;
}

+ (id)autocorrectionContextWithWebContext:(const void *)a3
{
  v4 = objc_alloc_init(WKAutocorrectionContext);
  if (*(void *)a3 && *(_DWORD *)(*(void *)a3 + 4)) {
    uint64_t v5 = WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v5 = 0;
  }
  [(UIWKAutocorrectionContext *)v4 setContextBeforeSelection:v5];
  uint64_t v6 = *((void *)a3 + 2);
  if (v6 && *(_DWORD *)(v6 + 4)) {
    uint64_t v7 = WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v7 = 0;
  }
  [(UIWKAutocorrectionContext *)v4 setSelectedText:v7];
  uint64_t v8 = *((void *)a3 + 1);
  if (v8 && *(_DWORD *)(v8 + 4)) {
    uint64_t v9 = WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v9 = 0;
  }
  [(UIWKAutocorrectionContext *)v4 setMarkedText:v9];
  uint64_t v10 = *((void *)a3 + 3);
  if (v10 && *(_DWORD *)(v10 + 4)) {
    uint64_t v11 = WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v11 = 0;
  }
  [(UIWKAutocorrectionContext *)v4 setContextAfterSelection:v11];
  uint64_t v12 = *((void *)a3 + 4);
  if (v12 == -1) {
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v13 = *((void *)a3 + 4);
  }
  if (v12 == -1) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = *((void *)a3 + 5);
  }
  -[UIWKAutocorrectionContext setRangeInMarkedText:](v4, "setRangeInMarkedText:", v13, v14);
  v15 = (void *)CFMakeCollectable(v4);

  return v15;
}

@end