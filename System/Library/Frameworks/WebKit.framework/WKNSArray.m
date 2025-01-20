@interface WKNSArray
- (Object)_apiObject;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation WKNSArray

- (unint64_t)count
{
  return *(unsigned int *)&self->_array.data.__lx[28];
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (*((unsigned int *)self + 9) <= a3)
  {
    __break(0xC471u);
  }
  else
  {
    uint64_t v3 = *(void *)(*((void *)self + 3) + 8 * a3);
    if (v3)
    {
      CFRetain(*(CFTypeRef *)(v3 + 8));
      v4 = *(const void **)(v3 + 8);
      CFRelease(v4);
      return (id)v4;
    }
    else
    {
      v5 = (void *)MEMORY[0x1E4F1CA98];
      return (id)[v5 null];
    }
  }
  return self;
}

- (Object)_apiObject
{
  return (Object *)&self->_array;
}

- (void)dealloc
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_array.data.__lx[16], v4);
    v5.receiver = self;
    v5.super_class = (Class)WKNSArray;
    [(WKNSArray *)&v5 dealloc];
  }
}

@end