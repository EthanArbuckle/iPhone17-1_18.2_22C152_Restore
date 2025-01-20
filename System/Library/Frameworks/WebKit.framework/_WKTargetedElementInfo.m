@interface _WKTargetedElementInfo
- (BOOL)hasAudibleMedia;
- (BOOL)hasLargeReplacedDescendant;
- (BOOL)isInShadowTree;
- (BOOL)isInVisibilityAdjustmentSubtree;
- (BOOL)isNearbyTarget;
- (BOOL)isPseudoElement;
- (BOOL)isSameElement:(id)a3;
- (CGRect)bounds;
- (CGRect)boundsInClientCoordinates;
- (CGRect)boundsInWebView;
- (NSArray)selectors;
- (NSArray)selectorsIncludingShadowHosts;
- (NSSet)mediaAndLinkURLs;
- (NSString)debugDescription;
- (NSString)renderedText;
- (NSString)screenReaderText;
- (NSString)searchableText;
- (Object)_apiObject;
- (int64_t)positionType;
- (uint64_t)getChildFrames:(const void *)a1;
- (uint64_t)getChildFrames:(uint64_t)a1;
- (uint64_t)takeSnapshotWithCompletionHandler:(const void *)a1;
- (uint64_t)takeSnapshotWithCompletionHandler:(uint64_t)a1;
- (unint64_t)offsetEdges;
- (void)dealloc;
- (void)getChildFrames:(id)a3;
- (void)takeSnapshotWithCompletionHandler:(id)a3;
@end

@implementation _WKTargetedElementInfo

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v5 = *(unsigned int **)self[3]._info.data.__lx;
    *(void *)self[3]._info.data.__lx = 0;
    if (v5)
    {
      if (atomic_fetch_add((atomic_uint *volatile)v5, 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v5);
        WTF::fastFree((WTF *)v5, v4);
      }
    }
    WebCore::TargetedElementInfo::~TargetedElementInfo((WebCore::TargetedElementInfo *)&self->_info.data.__lx[16], (WTF::StringImpl *)v4);
    v6.receiver = self;
    v6.super_class = (Class)_WKTargetedElementInfo;
    [(_WKTargetedElementInfo *)&v6 dealloc];
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_info;
}

- (int64_t)positionType
{
  unsigned int v2 = self[2]._info.data.__lx[16] - 1;
  if (v2 > 5) {
    return 0;
  }
  else {
    return qword_1994F6630[(char)v2];
  }
}

- (CGRect)bounds
{
  WebCore::FloatRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)boundsInWebView
{
  API::TargetedElementInfo::boundsInWebView((API::TargetedElementInfo *)&self->_info);
  WebCore::FloatRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)boundsInClientCoordinates
{
  WebCore::FloatRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSArray)selectors
{
  if (!*(_DWORD *)&self[1]._info.data.__lx[44] || BYTE2(self[3].super.isa)) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&>(*(void *)&self[1]._info.data.__lx[32], (uint64_t *)&cf);
  CFTypeRef v3 = cf;
  CFTypeRef cf = 0;
  double v2 = (id)CFMakeCollectable(v3);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  return v2;
}

- (NSArray)selectorsIncludingShadowHosts
{
  CFTypeRef v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)&self[1]._info.data.__lx[44]];
  uint64_t v4 = *(unsigned int *)&self[1]._info.data.__lx[44];
  if (v4)
  {
    uint64_t v5 = *(void *)&self[1]._info.data.__lx[32];
    uint64_t v6 = v5 + 16 * v4;
    do
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(v5 + 12)];
      uint64_t v8 = *(unsigned int *)(v5 + 12);
      if (v8)
      {
        v9 = *(void **)v5;
        uint64_t v10 = 8 * v8;
        do
        {
          if (*v9) {
            v11 = (__CFString *)WTF::StringImpl::operator NSString *();
          }
          else {
            v11 = &stru_1EEA10550;
          }
          [v7 addObject:v11];
          ++v9;
          v10 -= 8;
        }
        while (v10);
      }
      [v3 addObject:v7];
      if (v7) {
        CFRelease(v7);
      }
      v5 += 16;
    }
    while (v5 != v6);
  }
  v12 = (void *)CFMakeCollectable(v3);

  return (NSArray *)v12;
}

- (NSString)renderedText
{
  if (*(void *)&self[1]._info.data.__lx[8]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (NSString)searchableText
{
  if (*(void *)&self[1]._info.data.__lx[16]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (NSString)screenReaderText
{
  if (*(void *)&self[1]._info.data.__lx[24]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (unint64_t)offsetEdges
{
  int v2 = *(_DWORD *)self[1]._info.data.__lx;
  unint64_t v3 = ((v2 & 0xFF000000) != 0) | (2 * ((_BYTE)v2 != 0));
  if ((v2 & 0xFF0000) != 0) {
    v3 |= 8uLL;
  }
  if ((v2 & 0xFF00) != 0) {
    return v3 | 4;
  }
  else {
    return v3;
  }
}

- (void)getChildFrames:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9CAD00;
  v5[1] = v4;
  v7 = v5;
  API::TargetedElementInfo::childFrames((uint64_t)&self->_info, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (BOOL)isSameElement:(id)a3
{
  return API::TargetedElementInfo::isSameElement(self->_info.data.__lx, (void *)a3 + 2);
}

- (BOOL)isNearbyTarget
{
  return (BOOL)self[3].super.isa;
}

- (BOOL)isInVisibilityAdjustmentSubtree
{
  return BYTE3(self[3].super.isa);
}

- (BOOL)hasLargeReplacedDescendant
{
  return BYTE4(self[3].super.isa);
}

- (NSSet)mediaAndLinkURLs
{
  unint64_t v3 = objc_opt_new();
  uint64_t v4 = &self[2]._info.data.__lx[40];
  uint64_t v5 = WTF::HashTable<WTF::URL,WTF::URL,WTF::IdentityExtractor,WTF::DefaultHash<WTF::URL>,WTF::HashTraits<WTF::URL>,WTF::HashTraits<WTF::URL>>::begin((uint64_t *)&self[2]._info.data.__lx[40]);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  if (*(void *)v4) {
    uint64_t v9 = *(void *)v4 + 40 * *(unsigned int *)(*(void *)v4 - 4);
  }
  else {
    uint64_t v9 = 0;
  }
  if ((WTF **)v9 != v5)
  {
    do
    {
      [v3 addObject:WTF::URL::operator NSURL *()];
      while (1)
      {
        v6 += 5;
        if (v6 == v8) {
          break;
        }
        int v10 = WTF::HashTraitsEmptyValueChecker<WTF::HashTraits<WTF::URL>,false>::isEmptyValue<WTF::URL>(v6);
        if (*v6 == (WTF *)-1) {
          int v11 = 1;
        }
        else {
          int v11 = v10;
        }
        if (v11 != 1) {
          goto LABEL_13;
        }
      }
      uint64_t v6 = v8;
LABEL_13:
      ;
    }
    while (v6 != (WTF **)v9);
  }
  v12 = (void *)CFMakeCollectable(v3);

  return (NSSet *)v12;
}

- (BOOL)isPseudoElement
{
  return BYTE1(self[3].super.isa);
}

- (BOOL)isInShadowTree
{
  return BYTE2(self[3].super.isa);
}

- (BOOL)hasAudibleMedia
{
  return BYTE5(self[3].super.isa);
}

- (void)takeSnapshotWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9CAD28;
  v5[1] = v4;
  v7 = v5;
  API::TargetedElementInfo::takeSnapshot((uint64_t)&self->_info, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (NSString)debugDescription
{
  uint64_t v3 = *(unsigned int *)&self[1]._info.data.__lx[44];
  if (v3 && (uint64_t v4 = *(void *)&self[1]._info.data.__lx[32] + 16 * v3, *(_DWORD *)(v4 - 4)))
  {
    uint64_t v5 = **(WTF::StringImpl ***)(v4 - 16);
    if (v5) {
      *(_DWORD *)v5 += 2;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  float v6 = *(float *)&self[2].super.isa;
  float v7 = *((float *)&self[2].super.isa + 1);
  float v8 = *(float *)self[2]._anon_8;
  float v9 = *(float *)&self[2]._anon_8[4];
  int v10 = NSString;
  uint64_t v11 = objc_opt_class();
  if (v5) {
    v12 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v12 = &stru_1EEA10550;
  }
  v14 = (NSString *)[v10 stringWithFormat:@"<%@ %p \"%@\" at {{%.0f,%.0f},{%.0f,%.0f}}>", v11, self, v12, v6, v7, v8, v9];
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v13);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  return v14;
}

- (uint64_t)getChildFrames:(uint64_t)a1
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)a2 + 3)];
  uint64_t v5 = *((unsigned int *)a2 + 3);
  if (v5)
  {
    uint64_t v6 = *a2;
    uint64_t v7 = 8 * v5;
    do
    {
      if (*(void *)(*(void *)v6 + 8)) {
        objc_msgSend(v4, "addObject:");
      }
      v6 += 8;
      v7 -= 8;
    }
    while (v7);
  }
  (id)CFMakeCollectable(v4);
  float v8 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);

  return v8();
}

- (uint64_t)getChildFrames:(const void *)a1
{
  *a1 = &unk_1EE9CAD00;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)takeSnapshotWithCompletionHandler:(uint64_t)a1
{
  if (*(unsigned char *)(a2 + 64))
  {
    WebCore::ShareableBitmap::create();
    if (v7)
    {
      WebCore::ShareableBitmap::makeCGImage();
      (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
      if (cf) {
        CFRelease(cf);
      }
      return WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref((uint64_t)v7, v3);
    }
    else
    {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
    }
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);
    return v5();
  }
}

- (uint64_t)takeSnapshotWithCompletionHandler:(const void *)a1
{
  *a1 = &unk_1EE9CAD28;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

@end