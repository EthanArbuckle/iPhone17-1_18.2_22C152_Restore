@interface SRDefaults
- (void)dealloc;
- (void)initWithDictionary:(void *)a1;
@end

@implementation SRDefaults

- (void)initWithDictionary:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)SRDefaults;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  if (v3)
  {
    v3[1] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x26D167F28), "unsignedIntegerValue");
    v3[2] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x26D167F48), "unsignedLongValue");
    v3[3] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x26D167FC8), "unsignedLongValue");
    v3[4] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x26D167F68), "unsignedLongValue");
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x26D167F88), "floatValue");
    *((_DWORD *)v3 + 10) = v4;
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x26D167FA8), "floatValue");
    *((_DWORD *)v3 + 11) = v5;
  }
  return v3;
}

- (void)dealloc
{
  self->_className = 0;
  self->_exportingClassName = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRDefaults;
  [(SRDefaults *)&v3 dealloc];
}

@end