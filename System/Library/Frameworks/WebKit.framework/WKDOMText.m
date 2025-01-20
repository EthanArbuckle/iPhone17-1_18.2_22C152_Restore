@interface WKDOMText
- (NSString)data;
- (void)setData:(id)a3;
@end

@implementation WKDOMText

- (NSString)data
{
  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 16) & 2) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x198E12E84);
  }
  if (*((void *)m_ptr + 11)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setData:(id)a3
{
  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 16) & 2) != 0)
  {
    MEMORY[0x19972EAD0](&v6, a3);
    WebCore::CharacterData::setData((WebCore::CharacterData *)m_ptr, (const WTF::String *)&v6);
    v5 = v6;
    v6 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v4);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    __break(0xC471u);
  }
}

@end