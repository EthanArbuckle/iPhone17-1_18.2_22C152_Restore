@interface __CFNotification
- (BOOL)isEqual:(id)a3;
- (__CFNotification)initWithName:(__CFString *)a3 object:(const void *)a4 userInfo:(__CFDictionary *)a5 foundation:(BOOL)a6;
- (id)name;
- (id)object;
- (id)userInfo;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation __CFNotification

- (id)name
{
  return self->_name;
}

- (id)object
{
  return self->_object;
}

- (__CFNotification)initWithName:(__CFString *)a3 object:(const void *)a4 userInfo:(__CFDictionary *)a5 foundation:(BOOL)a6
{
  v6 = self;
  if (a3)
  {
    if (a6)
    {
      self->_name = (id)[(__CFString *)a3 copy];
      v6->_userInfo = a5;
      a4 = (id)a4;
    }
    else
    {
      self->_name = (id)CFRetain(a3);
      if (a5) {
        v10 = (void *)CFRetain(a5);
      }
      else {
        v10 = 0;
      }
      v6->_userInfo = v10;
    }
    v6->_object = (id)a4;
    v6->_fouSemantics = a6;
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  BOOL fouSemantics = self->_fouSemantics;
  id name = self->_name;
  if (fouSemantics)
  {
  }
  else
  {
    if (name) {
      CFRelease(name);
    }
    id userInfo = self->_userInfo;
    if (userInfo) {
      CFRelease(userInfo);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)__CFNotification;
  [(__CFNotification *)&v6 dealloc];
}

- (id)userInfo
{
  return self->_userInfo;
}

- (unint64_t)hash
{
  id v2 = [(__CFNotification *)self name];

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if (!a3) {
    goto LABEL_8;
  }
  objc_lookUpClass("__CFNotification");
  Class v5 = objc_lookUpClass("NSNotification");
  if ((objc_opt_isKindOfClass() & 1) == 0 && (!v5 || (objc_opt_isKindOfClass() & 1) == 0)) {
    goto LABEL_8;
  }
  int v6 = objc_msgSend(-[__CFNotification name](self, "name"), "isEqual:", objc_msgSend(a3, "name"));
  if (!v6) {
    return v6;
  }
  id v7 = [(__CFNotification *)self object];
  if (v7 == (id)[a3 object])
  {
    id v8 = [(__CFNotification *)self userInfo];
    uint64_t v9 = [a3 userInfo];
    LOBYTE(v6) = [v8 isEqual:v9];
  }
  else
  {
LABEL_8:
    LOBYTE(v6) = 0;
  }
  return v6;
}

@end