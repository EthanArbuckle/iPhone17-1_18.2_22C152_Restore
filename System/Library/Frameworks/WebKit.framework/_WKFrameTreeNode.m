@interface _WKFrameTreeNode
- (NSArray)childFrames;
- (Object)_apiObject;
- (WKFrameInfo)info;
- (void)dealloc;
@end

@implementation _WKFrameTreeNode

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::FrameTreeNode::~FrameTreeNode((API::FrameTreeNode *)&self->_node, v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKFrameTreeNode;
    [(_WKFrameTreeNode *)&v5 dealloc];
  }
}

- (WKFrameInfo)info
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  WebKit::FrameInfoData::FrameInfoData(&v13, (const String *)&self->_node.data.__lx[16]);
  Class isa = self[6].super.isa;
  CFRetain(*((CFTypeRef *)isa + 1));
  Class v12 = isa;
  uint64_t v4 = API::Object::newObject(0x140uLL, 60);
  uint64_t v5 = API::FrameInfo::FrameInfo(v4, (uint64_t)&v13, (uint64_t *)&v12);
  v6 = *(const void **)(v5 + 8);
  if (v6) {
    CFRetain(*(CFTypeRef *)(v5 + 8));
  }
  v7 = (id)CFMakeCollectable(v6);
  CFRelease(*(CFTypeRef *)(v4 + 8));
  if (v12) {
    CFRelease(*((CFTypeRef *)v12 + 1));
  }
  v9 = v18;
  v18 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v8);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  if (v17 != -1) {
    ((void (*)(Class *, uint64_t *))off_1EE9C9600[v17])(&v12, &v16);
  }
  int v17 = -1;
  CFTypeRef v10 = cf;
  CFTypeRef cf = 0;
  if (v10) {
    CFRelease(v10);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)&v14);
  return v7;
}

- (NSArray)childFrames
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)&self[5]._node.data.__lx[44]];
  unsigned int v4 = *(_DWORD *)&self[5]._node.data.__lx[44];
  if (v4)
  {
    uint64_t v5 = *(void *)&self[5]._node.data.__lx[32];
    for (uint64_t i = 312 * v4; i; i -= 312)
    {
      WebKit::FrameInfoData::FrameInfoData(&v16, (const String *)v5);
      WTF::Vector<WebKit::FrameTreeNodeData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)v22, (uint64_t *)(v5 + 296));
      API::FrameTreeNode::create((uint64_t)&v16, (uint64_t)self[6].super.isa, &v14);
      uint64_t v7 = v14;
      v8 = *(const void **)(v14 + 8);
      if (v8)
      {
        CFRetain(*(CFTypeRef *)(v14 + 8));
        uint64_t v7 = v14;
        uint64_t v14 = 0;
        if (!v7) {
          goto LABEL_8;
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      CFRelease(*(CFTypeRef *)(v7 + 8));
LABEL_8:
      WTF::Vector<WebKit::FrameTreeNodeData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v22, v9);
      v11 = v21;
      v21 = 0;
      if (v11)
      {
        if (*(_DWORD *)v11 == 2) {
          WTF::StringImpl::destroy(v11, v10);
        }
        else {
          *(_DWORD *)v11 -= 2;
        }
      }
      if (v20 != -1) {
        ((void (*)(char *, uint64_t *))off_1EE9C9600[v20])(&v15, &v19);
      }
      int v20 = -1;
      CFTypeRef v12 = cf;
      CFTypeRef cf = 0;
      if (v12) {
        CFRelease(v12);
      }
      WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)&v17);
      if (v8)
      {
        [v3 addObject:v8];
        CFRelease(v8);
      }
      v5 += 312;
    }
  }
  return (NSArray *)(id)CFMakeCollectable(v3);
}

- (Object)_apiObject
{
  return (Object *)&self->_node;
}

@end