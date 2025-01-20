@interface CSCoder
+ (id)encodeURLPreservingSecurityScope:(id)a3;
- (BOOL)finalized;
- (CSCoder)init;
- (NSData)data;
- (_MDPlistContainer)container;
- (_MDPlistContainer)plistContainer;
- (void)beginArray;
- (void)beginDictionary;
- (void)beginType:(const char *)a3;
- (void)dealloc;
- (void)encodeBool:(BOOL)a3;
- (void)encodeData:(const void *)a3 length:(int64_t)a4;
- (void)encodeDouble:(double)a3;
- (void)encodeInt32:(int)a3;
- (void)encodeInt64:(int64_t)a3;
- (void)encodeMDPlistObject:(id *)a3;
- (void)encodeNSString:(id)a3;
- (void)encodeObject:(id)a3;
- (void)encodeObject:(id)a3 forKey:(const char *)a4 keyLength:(int64_t)a5;
- (void)encodeObject:(id)a3 withKey:(id)a4;
- (void)encodeString:(const char *)a3;
- (void)encodeString:(const char *)a3 length:(int64_t)a4;
- (void)encodeString:(const char *)a3 stringLength:(int64_t)a4 forKey:(const char *)a5 keyLength:(int64_t)a6;
- (void)endArray;
- (void)endDictionary;
- (void)endType;
@end

@implementation CSCoder

- (void).cxx_destruct
{
}

- (void)endArray
{
}

- (void)beginArray
{
}

- (void)encodeObject:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 encodeWithCSCoder:self];
  }
  else {
    _MDPlistContainerAddObject();
  }
}

- (_MDPlistContainer)container
{
  return self->_container;
}

- (void)encodeString:(const char *)a3 length:(int64_t)a4
{
}

- (void)endType
{
}

- (void)encodeInt32:(int)a3
{
}

- (void)beginType:(const char *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  _MDPlistContainerBeginArray();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)__str = 0u;
  long long v5 = 0u;
  snprintf(__str, 0x100uLL, "%s%s", "__class:", a3);
  _MDPlistContainerAddCString();
}

- (void)endDictionary
{
}

- (void)beginDictionary
{
}

- (CSCoder)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSCoder;
  v2 = [(CSCoder *)&v5 init];
  if (v2)
  {
    uint64_t Mutable = _MDPlistContainerCreateMutable();
    v2->_container = (_MDPlistContainer *)Mutable;
    if (Mutable)
    {
      _MDPlistContainerBeginContainer();
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (NSData)data
{
  if (!self->_data && [(CSCoder *)self plistContainer])
  {
    v3 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t Bytes = _MDPlistContainerGetBytes();
    objc_super v5 = [v3 dataWithBytesNoCopy:Bytes length:_MDPlistContainerGetLength() freeWhenDone:0];
    data = self->_data;
    self->_data = v5;
  }
  long long v7 = self->_data;

  return v7;
}

- (_MDPlistContainer)plistContainer
{
  if (!self->_finalized && self->_container)
  {
    _MDPlistContainerEndContainer();
    self->_finalized = 1;
  }
  return self->_container;
}

- (void)encodeInt64:(int64_t)a3
{
}

- (void)dealloc
{
  container = self->_container;
  if (container)
  {
    if (!self->_finalized)
    {
      _MDPlistContainerEndContainer();
      container = self->_container;
    }
    CFRelease(container);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSCoder;
  [(CSCoder *)&v4 dealloc];
}

- (void)encodeString:(const char *)a3
{
}

- (void)encodeMDPlistObject:(id *)a3
{
  $917DE44C1CB612B85CED1B4C2573F471 v7 = *a3;
  int PlistObjectType = _MDPlistGetPlistObjectType();
  if (PlistObjectType == 246)
  {
    $917DE44C1CB612B85CED1B4C2573F471 v7 = *a3;
    _MDPlistDataGetBytePtr();
    _MDPlistContainerAddDataValue();
  }
  else
  {
    $917DE44C1CB612B85CED1B4C2573F471 v7 = *a3;
    if (PlistObjectType == 244)
    {
      _MDPlistStringGetValue();
      _MDPlistContainerAddCString();
    }
    else
    {
      long long v6 = CSDecodeObject((uint64_t)&v7);
      [(CSCoder *)self encodeObject:v6];
    }
  }
}

- (void)encodeBool:(BOOL)a3
{
}

- (void)encodeDouble:(double)a3
{
}

- (void)encodeData:(const void *)a3 length:(int64_t)a4
{
}

- (void)encodeObject:(id)a3 withKey:(id)a4
{
  if (a3)
  {
    id v6 = a3;
    [(CSCoder *)self encodeObject:a4];
    [(CSCoder *)self encodeObject:v6];
  }
}

- (void)encodeObject:(id)a3 forKey:(const char *)a4 keyLength:(int64_t)a5
{
  id v6 = a3;
  _MDPlistContainerAddCString();
  [(CSCoder *)self encodeObject:v6];
}

- (void)encodeString:(const char *)a3 stringLength:(int64_t)a4 forKey:(const char *)a5 keyLength:(int64_t)a6
{
  _MDPlistContainerAddCString();

  _MDPlistContainerAddCString();
}

- (void)encodeNSString:(id)a3
{
  if (a3) {
    _MDPlistContainerAddObject();
  }
  else {
    _MDPlistContainerAddCString();
  }
}

+ (id)encodeURLPreservingSecurityScope:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 path];
  [v5 setObject:v6 forKeyedSubscript:@"path"];

  $917DE44C1CB612B85CED1B4C2573F471 v7 = (const void *)MEMORY[0x192F98FA0](v4);
  if (v7)
  {
    [v5 setObject:v7 forKeyedSubscript:@"ss"];
    CFRelease(v7);
  }
  long long v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];

  return v8;
}

- (BOOL)finalized
{
  return self->_finalized;
}

@end