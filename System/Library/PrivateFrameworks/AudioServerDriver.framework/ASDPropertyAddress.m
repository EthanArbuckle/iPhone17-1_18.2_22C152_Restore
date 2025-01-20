@interface ASDPropertyAddress
- (ASDPropertyAddress)initWithAddress:(AudioObjectPropertyAddress)a3;
- (ASDPropertyAddress)initWithDictionary:(id)a3;
- (ASDPropertyAddress)initWithSelector:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5;
- (AudioObjectPropertyAddress)audioObjectPropertyAddress;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)element;
- (unsigned)scope;
- (unsigned)selector;
@end

@implementation ASDPropertyAddress

- (ASDPropertyAddress)initWithAddress:(AudioObjectPropertyAddress)a3
{
  AudioObjectPropertyElement mElement = a3.mElement;
  uint64_t v4 = *(void *)&a3.mSelector;
  v6.receiver = self;
  v6.super_class = (Class)ASDPropertyAddress;
  result = [(ASDPropertyAddress *)&v6 init];
  if (result)
  {
    *(void *)&result->_audioObjectPropertyAddress.mSelector = v4;
    result->_audioObjectPropertyAddress.AudioObjectPropertyElement mElement = mElement;
  }
  return result;
}

- (ASDPropertyAddress)initWithSelector:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)ASDPropertyAddress;
  result = [(ASDPropertyAddress *)&v9 init];
  if (result)
  {
    result->_audioObjectPropertyAddress.mSelector = a3;
    result->_audioObjectPropertyAddress.mScope = a4;
    result->_audioObjectPropertyAddress.AudioObjectPropertyElement mElement = a5;
  }
  return result;
}

- (ASDPropertyAddress)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDPropertyAddress;
  v5 = [(ASDPropertyAddress *)&v9 init];
  objc_super v6 = v5;
  if (v5)
  {
    if ([v4 fourCharCode:&v5->_audioObjectPropertyAddress forKey:@"Selector"])
    {
      if (([v4 fourCharCode:&v6->_audioObjectPropertyAddress.mScope forKey:@"Scope"] & 1) == 0) {
        v6->_audioObjectPropertyAddress.mScope = 1735159650;
      }
      [v4 fourCharCode:&v6->_audioObjectPropertyAddress.mElement forKey:@"Element"];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Couldn't create ASDPropertyAddress: bad selector in dictionary", v8, 2u);
      }

      objc_super v6 = 0;
    }
  }

  return v6;
}

- (unsigned)selector
{
  return self->_audioObjectPropertyAddress.mSelector;
}

- (unsigned)scope
{
  return self->_audioObjectPropertyAddress.mScope;
}

- (unsigned)element
{
  return self->_audioObjectPropertyAddress.mElement;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASDPropertyAddress *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unsigned int v6 = [(ASDPropertyAddress *)v5 selector];
      if (v6 == [(ASDPropertyAddress *)self selector]
        && (unsigned int v7 = [(ASDPropertyAddress *)v5 scope], v7 == [(ASDPropertyAddress *)self scope]))
      {
        unsigned int v8 = [(ASDPropertyAddress *)v5 element];
        BOOL v9 = v8 == [(ASDPropertyAddress *)self element];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLong:", -[ASDPropertyAddress selector](self, "selector"));
  uint64_t v4 = [v3 hash];
  v5 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLong:", -[ASDPropertyAddress scope](self, "scope"));
  uint64_t v6 = [v5 hash] ^ v4;
  unsigned int v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLong:", -[ASDPropertyAddress element](self, "element"));
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(ASDPropertyAddress *)self audioObjectPropertyAddress];
  return (id)objc_msgSend(v4, "initWithAddress:", v6, v5);
}

- (id)description
{
  v3 = NSString;
  if ((int)[(ASDPropertyAddress *)self selector] < 0x20000000
    || (int)[(ASDPropertyAddress *)self selector] > 2130706431)
  {
    uint64_t v4 = 32;
  }
  else
  {
    uint64_t v4 = ((int)[(ASDPropertyAddress *)self selector] >> 24);
  }
  if ((int)([(ASDPropertyAddress *)self selector] << 8) < 0x20000000
    || (int)([(ASDPropertyAddress *)self selector] << 8) > 2130706431)
  {
    uint64_t v5 = 32;
  }
  else
  {
    uint64_t v5 = ((int)([(ASDPropertyAddress *)self selector] << 8) >> 24);
  }
  if ((int)([(ASDPropertyAddress *)self selector] << 16) < 0x20000000
    || (int)([(ASDPropertyAddress *)self selector] << 16) > 2130706431)
  {
    uint64_t v6 = 32;
  }
  else
  {
    uint64_t v6 = ((__int16)[(ASDPropertyAddress *)self selector] >> 8);
  }
  if ((int)([(ASDPropertyAddress *)self selector] << 24) < 520093697
    || [(ASDPropertyAddress *)self selector] == 127)
  {
    uint64_t v7 = 32;
  }
  else
  {
    uint64_t v7 = (char)[(ASDPropertyAddress *)self selector];
  }
  if ((int)[(ASDPropertyAddress *)self scope] < 0x20000000
    || (int)[(ASDPropertyAddress *)self scope] > 2130706431)
  {
    uint64_t v8 = 32;
  }
  else
  {
    uint64_t v8 = ((int)[(ASDPropertyAddress *)self scope] >> 24);
  }
  if ((int)([(ASDPropertyAddress *)self scope] << 8) < 0x20000000
    || (int)([(ASDPropertyAddress *)self scope] << 8) > 2130706431)
  {
    uint64_t v9 = 32;
  }
  else
  {
    uint64_t v9 = ((int)([(ASDPropertyAddress *)self scope] << 8) >> 24);
  }
  if ((int)([(ASDPropertyAddress *)self scope] << 16) < 0x20000000
    || (int)([(ASDPropertyAddress *)self scope] << 16) > 2130706431)
  {
    uint64_t v10 = 32;
  }
  else
  {
    uint64_t v10 = ((__int16)[(ASDPropertyAddress *)self scope] >> 8);
  }
  if ((int)([(ASDPropertyAddress *)self scope] << 24) < 520093697
    || [(ASDPropertyAddress *)self scope] == 127)
  {
    uint64_t v11 = 32;
  }
  else
  {
    uint64_t v11 = (char)[(ASDPropertyAddress *)self scope];
  }
  uint64_t v18 = v11;
  uint64_t v19 = v9;
  if ((int)[(ASDPropertyAddress *)self element] < 0x20000000
    || (int)[(ASDPropertyAddress *)self element] > 2130706431)
  {
    uint64_t v12 = 32;
  }
  else
  {
    uint64_t v12 = ((int)[(ASDPropertyAddress *)self element] >> 24);
  }
  if ((int)([(ASDPropertyAddress *)self element] << 8) < 0x20000000
    || (int)([(ASDPropertyAddress *)self element] << 8) > 2130706431)
  {
    uint64_t v13 = 32;
  }
  else
  {
    uint64_t v13 = ((int)([(ASDPropertyAddress *)self element] << 8) >> 24);
  }
  uint64_t v17 = v4;
  if ((int)([(ASDPropertyAddress *)self element] << 16) < 0x20000000
    || (int)([(ASDPropertyAddress *)self element] << 16) > 2130706431)
  {
    uint64_t v14 = 32;
  }
  else
  {
    uint64_t v14 = ((__int16)[(ASDPropertyAddress *)self element] >> 8);
  }
  if ((int)([(ASDPropertyAddress *)self element] << 24) < 520093697
    || [(ASDPropertyAddress *)self element] == 127)
  {
    uint64_t v15 = 32;
  }
  else
  {
    uint64_t v15 = (char)[(ASDPropertyAddress *)self element];
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"selector:%c%c%c%c scope:%c%c%c%c element:%c%c%c%c", v17, v5, v6, v7, v8, v19, v10, v18, v12, v13, v14, v15);
}

- (AudioObjectPropertyAddress)audioObjectPropertyAddress
{
  AudioObjectPropertyElement mElement = self->_audioObjectPropertyAddress.mElement;
  uint64_t v3 = *(void *)&self->_audioObjectPropertyAddress.mSelector;
  result.mSelector = v3;
  result.mScope = HIDWORD(v3);
  result.AudioObjectPropertyElement mElement = mElement;
  return result;
}

@end