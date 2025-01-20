@interface GTError_capture
- (id)dy_errorSignature;
- (id)localizedDescription;
@end

@implementation GTError_capture

- (id)dy_errorSignature
{
  id result = (id)_StringForError((uint64_t)[(GTError_capture *)self code]);
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)GTError_capture;
    return [(GTError_capture *)&v4 dy_errorSignature];
  }
  return result;
}

- (id)localizedDescription
{
  id v3 = [(GTError_capture *)self userInfo];
  if (!v3 || (id result = [v3 objectForKey:NSLocalizedDescriptionKey]) == 0)
  {
    id v5 = [(GTError_capture *)self code];
    if (!objc_msgSend(-[GTError_capture domain](self, "domain"), "isEqualToString:", @"DYErrorDomain")|| (id result = (id)_StringForError((uint64_t)v5)) == 0)
    {
      v6.receiver = self;
      v6.super_class = (Class)GTError_capture;
      return [(GTError_capture *)&v6 localizedDescription];
    }
  }
  return result;
}

@end