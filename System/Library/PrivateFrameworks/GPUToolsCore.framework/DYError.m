@interface DYError
- (id)dy_errorSignature;
- (id)localizedDescription;
@end

@implementation DYError

- (id)localizedDescription
{
  v3 = (void *)[(DYError *)self userInfo];
  if (!v3 || (id result = (id)[v3 objectForKey:*MEMORY[0x263F08320]]) == 0)
  {
    uint64_t v5 = [(DYError *)self code];
    if (!objc_msgSend((id)-[DYError domain](self, "domain"), "isEqualToString:", @"DYErrorDomain")
      || (id result = _StringForError(v5)) == 0)
    {
      v6.receiver = self;
      v6.super_class = (Class)DYError;
      return [(DYError *)&v6 localizedDescription];
    }
  }
  return result;
}

- (id)dy_errorSignature
{
  id result = _StringForError([(DYError *)self code]);
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)DYError;
    return [(NSError *)&v4 dy_errorSignature];
  }
  return result;
}

@end