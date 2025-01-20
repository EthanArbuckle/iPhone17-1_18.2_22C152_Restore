@interface _WKUserContentWorld
+ (_WKUserContentWorld)worldWithName:(id)a3;
+ (id)normalWorld;
- (NSString)name;
- (Object)_apiObject;
- (id).cxx_construct;
- (id)_init;
- (id)_initWithContentWorld:(id)a3;
- (id)_initWithName:(id)a3;
@end

@implementation _WKUserContentWorld

- (id)_initWithName:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_WKUserContentWorld;
  v4 = [(_WKUserContentWorld *)&v9 init];
  if (v4)
  {
    v5 = +[WKContentWorld worldWithName:a3];
    v6 = v5;
    if (v5) {
      CFRetain(v5);
    }
    m_ptr = v4->_contentWorld.m_ptr;
    v4->_contentWorld.m_ptr = v6;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v4;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)_WKUserContentWorld;
  v2 = [(_WKUserContentWorld *)&v7 init];
  if (v2)
  {
    v3 = +[WKContentWorld pageWorld];
    v4 = v3;
    if (v3) {
      CFRetain(v3);
    }
    m_ptr = v2->_contentWorld.m_ptr;
    v2->_contentWorld.m_ptr = v4;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v2;
}

- (id)_initWithContentWorld:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_WKUserContentWorld;
  v4 = [(_WKUserContentWorld *)&v7 init];
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v4->_contentWorld.m_ptr;
    v4->_contentWorld.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v4;
}

+ (_WKUserContentWorld)worldWithName:(id)a3
{
  v3 = (void *)CFMakeCollectable([[_WKUserContentWorld alloc] _initWithName:a3]);

  return (_WKUserContentWorld *)v3;
}

+ (id)normalWorld
{
  v2 = (void *)CFMakeCollectable([[_WKUserContentWorld alloc] _init]);

  return v2;
}

- (NSString)name
{
  return (NSString *)[self->_contentWorld.m_ptr name];
}

- (Object)_apiObject
{
  return (Object *)[self->_contentWorld.m_ptr _apiObject];
}

- (void).cxx_destruct
{
  m_ptr = self->_contentWorld.m_ptr;
  self->_contentWorld.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end