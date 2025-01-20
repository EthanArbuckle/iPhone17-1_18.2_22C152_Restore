@interface _WKFrameHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (Object)_apiObject;
- (_WKFrameHandle)initWithCoder:(id)a3;
- (unint64_t)frameID;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _WKFrameHandle

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)_WKFrameHandle;
    [(_WKFrameHandle *)&v4 dealloc];
  }
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return *(void *)&self->_frameHandle.data.__lx[16] == *((void *)a3 + 3)
      && *(void *)&self->_frameHandle.data.__lx[24] == *((void *)a3 + 4);
}

- (unint64_t)hash
{
  return *(void *)&self->_frameHandle.data.__lx[16];
}

- (unint64_t)frameID
{
  return *(void *)&self->_frameHandle.data.__lx[16];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WKFrameHandle)initWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_WKFrameHandle;
  objc_super v4 = [(_WKFrameHandle *)&v13 init];
  if (v4)
  {
    v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"frameID"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"processID"],
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v7 = [v5 unsignedLongLongValue];
      if (v7 == -1 || (uint64_t v8 = v7, v9 = [v6 unsignedLongLongValue], v9 == -1))
      {
        __break(0xC471u);
        JUMPOUT(0x198AA150CLL);
      }
      uint64_t v10 = v9;
      uint64_t v11 = [(_WKFrameHandle *)v4 _apiObject];
      *(void *)uint64_t v11 = &unk_1EE9D1E28;
      WebKit::InitializeWebKit2((WebKit *)v11);
      *(void *)(v11 + 16) = v8;
      *(void *)(v11 + 24) = v10;
      *(unsigned char *)(v11 + 32) = 0;
      *(void *)uint64_t v11 = &unk_1EE9B3E30;
      *(void *)(v11 + 8) = v4;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)&self->_frameHandle.data.__lx[16]), @"frameID");
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:*(void *)&self->_frameHandle.data.__lx[24]];

  [a3 encodeObject:v5 forKey:@"processID"];
}

- (Object)_apiObject
{
  return (Object *)&self->_frameHandle;
}

@end