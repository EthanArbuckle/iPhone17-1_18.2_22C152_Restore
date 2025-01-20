@interface _LSDataBackedPropertyList
+ (BOOL)supportsSecureCoding;
- (BOOL)_getPropertyList:(id *)a3;
- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4;
- (_LSDataBackedPropertyList)initWithCoder:(id)a3;
- (_LSDataBackedPropertyList)initWithPropertyListData:(id)a3;
- (id).cxx_construct;
- (id)_plistHint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)uncheckedObjectsForKeys:(id)a3;
- (void)detach;
- (void)encodeWithCoder:(id)a3;
- (void)prewarm;
@end

@implementation _LSDataBackedPropertyList

- (id).cxx_construct
{
  *((_DWORD *)self + 6) = 0;
  return self;
}

- (void)detach
{
  p_lock = (os_unfair_lock_s *)&self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  v4 = (NSData *)[(NSData *)self->_rawPlistData copy];
  rawPlistData = self->_rawPlistData;
  self->_rawPlistData = v4;

  os_unfair_lock_unlock(p_lock);
}

- (_LSDataBackedPropertyList)initWithPropertyListData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LSDataBackedPropertyList;
  v6 = [(_LSLazyPropertyList *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rawPlistData, a3);
    plistHint = v7->_plistHint;
    v7->_plistHint = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistHint, 0);

  objc_storeStrong((id *)&self->_rawPlistData, 0);
}

- (BOOL)_getPropertyList:(id *)a3
{
  p_lock = (os_unfair_lock_s *)&self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  rawPlistData = self->_rawPlistData;
  v7 = [(_LSDataBackedPropertyList *)self _plistHint];
  _LSPlistDataGetDictionary(rawPlistData, v7);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = *a3 != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)a3;
}

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  id v6 = a4;
  p_lock = (os_unfair_lock_s *)&self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  rawPlistData = self->_rawPlistData;
  v9 = [(_LSDataBackedPropertyList *)self _plistHint];
  _LSPlistDataGetValueForKey(rawPlistData, (uint64_t)v6, v9);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = *a3 != 0;
  os_unfair_lock_unlock(p_lock);

  return (char)a3;
}

- (id)_plistHint
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_lock);
  v3 = self->_plistHint;
  if (!v3)
  {
    v4 = self->_rawPlistData;
    _LSPlistDataGetHint(v4);
    id v5 = (_LSPlistHint *)objc_claimAutoreleasedReturnValue();
    plistHint = self->_plistHint;
    self->_plistHint = v5;

    v3 = self->_plistHint;
  }

  return v3;
}

- (id)uncheckedObjectsForKeys:(id)a3
{
  id v4 = a3;
  p_lock = (os_unfair_lock_s *)&self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  rawPlistData = self->_rawPlistData;
  v7 = [(_LSDataBackedPropertyList *)self _plistHint];
  v8 = _LSPlistDataGetValuesForKeys(rawPlistData, v4, v7);

  v9 = (void *)MEMORY[0x1E4F1CC08];
  if (v8) {
    v9 = v8;
  }
  id v10 = v9;
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = (os_unfair_lock_s *)&self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  id v5 = [_LSDataBackedPropertyList alloc];
  id v6 = (void *)[(NSData *)self->_rawPlistData copy];
  v7 = [(_LSDataBackedPropertyList *)v5 initWithPropertyListData:v6];

  if (v7)
  {
    uint64_t v8 = _LSPlistHintCopy(self->_plistHint);
    plistHint = v7->_plistHint;
    v7->_plistHint = (_LSPlistHint *)v8;
  }
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (_LSDataBackedPropertyList)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LSDataBackedPropertyList;
  id v5 = [(_LSLazyPropertyList *)&v11 initWithCoder:v4];
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"plistData");
    id v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    rawPlistData = v5->_rawPlistData;
    v5->_rawPlistData = v6;
    uint64_t v8 = v6;

    plistHint = v5->_plistHint;
    v5->_plistHint = 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_LSDataBackedPropertyList;
  [(_LSLazyPropertyList *)&v5 encodeWithCoder:v4];
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  [v4 encodeObject:self->_rawPlistData forKey:@"plistData"];
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_lock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)prewarm
{
  int v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "could not prewarm data backed property list: %d", buf, 8u);
}

@end